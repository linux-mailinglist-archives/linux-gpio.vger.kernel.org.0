Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED2311D02B
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 15:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbfLLOsv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 09:48:51 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38885 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729603AbfLLOsu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 09:48:50 -0500
Received: by mail-ot1-f67.google.com with SMTP id h20so2245082otn.5;
        Thu, 12 Dec 2019 06:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=voZVPNoSy4a8bMYdTcCablMq5CNO8vg9KUaW07IxqF0=;
        b=YwRTukMxntgOWx6/kVL9ZGvZBDrJZgnJlyHI9ZMaj0YrrVlNMLNKzkqSr4ISF4aq5i
         caxcomtk8t49UXVHqq9wbTGu5fEKfLWkK7HyeRjWP0uukat6YZEFHdHDe4cRnM/8mywo
         +wWE94qEVnqDYpAl1zAzCvVx/X0LQ2wTnbbj67NXQbSeycN4HFyxIBTR9TVnMRHgPgDa
         /o33OAATNQxxxubkDh3lhqtUiU7v6XX+vgg3R3YmQJL4joxLNZzjfjjIVFwYi1O+YirW
         6eahBY2Cu0WzTmxDBtWP1VMT7E5ukt5MnViWU+XhBf1COeUoZq5bnbaWdFYqUiI07UrC
         zJdQ==
X-Gm-Message-State: APjAAAVfXY0/4BbjFJHdS+J2hENLrfOka9xNEORAjF0ZGAHgHCw9z9sE
        4TkxubRUpi3/o15DGyUHpGL7SvHQxdaewopCVLo=
X-Google-Smtp-Source: APXvYqzkSI69hH3nkOuTuzoZ5DVB2dOkFajJLW18qhY+01LkXcbQ2mLFjldvRytBCaRPVXRqDE7Vp+g1Jzj78r5O+Hc=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr8660446ots.250.1576162129675;
 Thu, 12 Dec 2019 06:48:49 -0800 (PST)
MIME-Version: 1.0
References: <20191127084253.16356-1-geert+renesas@glider.be>
 <20191127084253.16356-7-geert+renesas@glider.be> <CACRpkdb1XZAeSThxWmJtnm80T4aPufXV2UvJdVdgnw-TJe3trg@mail.gmail.com>
In-Reply-To: <CACRpkdb1XZAeSThxWmJtnm80T4aPufXV2UvJdVdgnw-TJe3trg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Dec 2019 15:48:38 +0100
Message-ID: <CAMuHMdV+Ww5Y9G7+bS-SyHtm4dC89V37yuaYvrS3kYW=PRTkFA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] docs: gpio: Add GPIO Aggregator/Repeater documentation
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Dec 12, 2019 at 3:42 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Nov 27, 2019 at 9:43 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > +The GPIO Aggregator allows access control for individual GPIOs, by aggregating
> > +them into a new gpio_chip, which can be assigned to a group or user using
> > +standard UNIX file ownership and permissions.  Furthermore, this simplifies and
> > +hardens exporting GPIOs to a virtual machine, as the VM can just grab the full
> > +GPIO controller, and no longer needs to care about which GPIOs to grab and
> > +which not, reducing the attack surface.
> > +
> > +Aggregated GPIO controllers are instantiated and destroyed by writing to
> > +write-only attribute files in sysfs.
>
> I suppose virtual machines will have a lengthy config file where
> they specify which GPIO lines to pick and use for their GPIO
> aggregator, and that will all be fine, the VM starts and the aggregator
> is there and we can start executing.
>
> I would perhaps point out a weakness as with all sysfs and with the current
> gpio sysfs: if a process creates an aggregator device, and then that
> process crashes, what happens when you try to restart the process and
> run e.g. your VM again?
>
> Time for a hard reboot? Or should we add some design guidelines for
> these machines so that they can cleanly tear down aggregators
> previously created by the crashed VM?

No, the VM does not create the aggregator.

The idea is for the user to create one or more aggregators, set up
permissions on /dev/gpiochipX, and launch the VM, passing the aggregated
/dev/gpiochipX as parameters.
If the VM crashes, just launch it again.

Destroying the aggregators is a manual and independent process, after
the VM has exited.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
