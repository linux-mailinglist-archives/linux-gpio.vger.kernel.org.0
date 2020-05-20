Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A241DB38A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 May 2020 14:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgETMfA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 May 2020 08:35:00 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37503 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbgETMe7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2020 08:34:59 -0400
Received: by mail-oi1-f196.google.com with SMTP id r25so2762003oij.4;
        Wed, 20 May 2020 05:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F/u+6tnly2BFfAMjAK8M1DKWCRzqZwn5wyDMJLDJi3s=;
        b=lYT9RRCH6Z3f847C4QRguS5MW3TKtYbUoOvBU26yXjn67k3CdUZSiGtoC2i4l5n8NE
         8Zf5ED+8lxj4mXuJeycTsKxWt2Hr+VJrWXznE7uSyAuvG4mX3IqcgBtOFa0NE0OPUGdA
         BcVFG/EkdffKBAuj+BhSgXTIBWTZdpeVBS/AEHzAXU/WETTAnhqk4QGusOXZi4tfGUNI
         yTbzAQHqG6MTk28jt7F+gY2dbgUd8epv+7eDzjp5rK8Cev2HkGFf3u83Kb75MU4TSVOf
         i+SuSrPDuQyQk7UxGnRmFb6x5DGPAkfPiGlQFkGzf6MTBf+WpzqdGXNcQEQYVSCLPxxE
         InEA==
X-Gm-Message-State: AOAM532t/xcHgD8hl27b5G2+B1EUQY8YxC3AXkM7X5DuGVy4OQblcqcn
        Jr2o33p4OeSiMn7fb4IPlKS7KZsf0RjvVdNc0xU=
X-Google-Smtp-Source: ABdhPJwOCOKGJWDMvkrJ0xNeetJajHrD/IP3CJbDZJ76726JW+VglbUl0g5pNhwQURwdBQbNda+mABt+2A5T1kia3c0=
X-Received: by 2002:aca:210a:: with SMTP id 10mr1526706oiz.153.1589978097806;
 Wed, 20 May 2020 05:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200511145257.22970-1-geert+renesas@glider.be> <20200520121420.GA1867563@smile.fi.intel.com>
In-Reply-To: <20200520121420.GA1867563@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 May 2020 14:34:46 +0200
Message-ID: <CAMuHMdW9EsRLYYTL0pd-PqqZs5WcUfK8i2uceNwJnSvAQKuVgw@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] gpio: Add GPIO Aggregator
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Wed, May 20, 2020 at 2:14 PM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Mon, May 11, 2020 at 04:52:51PM +0200, Geert Uytterhoeven wrote:
> > GPIO controllers are exported to userspace using /dev/gpiochip*
> > character devices.  Access control to these devices is provided by
> > standard UNIX file system permissions, on an all-or-nothing basis:
> > either a GPIO controller is accessible for a user, or it is not.
> > Currently no mechanism exists to control access to individual GPIOs.
> >
> > Hence this adds a GPIO driver to aggregate existing GPIOs, and expose
> > them as a new gpiochip.  This is useful for implementing access control,
> > and assigning a set of GPIOs to a specific user.  Furthermore, this
> > simplifies and hardens exporting GPIOs to a virtual machine, as the VM
> > can just grab the full GPIO controller, and no longer needs to care
> > about which GPIOs to grab and which not, reducing the attack surface.
> > This has been implemented for ARM virt in QEMU[1].
> >
> > Recently, other use cases have been discovered[2], like describing
> > simple GPIO-operated devices in DT, and using the GPIO Aggregator as a
> > generic GPIO driver for userspace, which is useful for industrial
> > control.
> >
> > Note that the first patch of this series ("i2c: i801: Use GPIO_LOOKUP()
> > helper macro") has been applied to i2c/for-next.
>
> Sorry for late reply, recently noticed this nice idea.
> The comment I have is, please, can we reuse bitmap parse algorithm and syntax?
> We have too many different formats and parsers in the kernel and bitmap's one
> seems suitable here.

Thank you, I wasn't aware of that.

Which one do you mean? The documentation seems to be confusing,
and incomplete.
My first guess was bitmap_parse(), but that one assumes hex values?
And given it processes the unsigned long bitmap in u32 chunks, I guess
it doesn't work as expected on big-endian 64-bit?

bitmap_parselist() looks more suitable, and the format seems to be
compatible with what's currently used, so it won't change ABI.
Is that the one you propose?

> (Despite other small clean ups, like strstrip() use)

Aka strim()? There are too many of them, to know all of them by heart ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
