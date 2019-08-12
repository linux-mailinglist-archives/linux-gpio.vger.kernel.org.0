Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB68189DBE
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 14:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbfHLMLy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 08:11:54 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33940 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfHLMLy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 08:11:54 -0400
Received: by mail-ot1-f67.google.com with SMTP id n5so157866603otk.1;
        Mon, 12 Aug 2019 05:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FQAzwdKSSCgFS9CBzmfdkw1VPD2g+B+H0cNHmn2/OC4=;
        b=MLZ29rvmLPIunhd1L1Js4ubKi9H1ckyM8Pl7mpUR9eY6cB7cSONUDwtKcF6nG93NwB
         gmWdUOH7V7k+WgT9D8aRGAz27qBvONiAtt7fWUicy+Enf0v6ElSOLk90Ow1UHVK9uuq8
         Bbmr9HgIAQVZha/aGuWOrWptOoSkka71uSJIO5YvnMzNDwzl3f39CZXnwkQZ8b8qHdtg
         MP8FZhrYckByhv3IryamFi4kazB3Vl/bg1NF+QRbIzBLBXMWbqa9yGzhTrKMkJ8Jgj2S
         /QwxUHtME0lbtkXMno50pbJakt6kFn3wAvhMyKS/+Sripn6jOiWuoeYgFRqyFHxOWVB8
         22lA==
X-Gm-Message-State: APjAAAUJvSOQRERPdJig/SEMjRaBVVUORmJ3C8hTo6j8jlQOvT70cIri
        BNZIjah8WUaQ8j2cm3Cb3UIhcfW/BDHHhiR9hUw=
X-Google-Smtp-Source: APXvYqw/yKc1OYqCjiIUFZq0tCy3DdYC7Qp6KZDtrYAE+mdcfydZePd9eW8dfyGIqJUMjhmxgzSTmgHYvJ8yk5c17Mw=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr17344597otk.145.1565611913595;
 Mon, 12 Aug 2019 05:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190808132543.26274-1-sr@denx.de> <20190808132543.26274-2-sr@denx.de>
 <CAMuHMdUzry6f_AqcjevgSRgJ2Q8Nqr_kEyYz+1QEVft6BTrC2g@mail.gmail.com> <ad77e973-912f-5ff3-9dd4-610695ec57eb@denx.de>
In-Reply-To: <ad77e973-912f-5ff3-9dd4-610695ec57eb@denx.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Aug 2019 14:11:42 +0200
Message-ID: <CAMuHMdXs=AdURCgB1GWRT=huKbXX7rGn6=upi1MMuFDHhKqX0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: mctrl_gpio: Support all GPIO suffixes (gpios
 vs gpio)
To:     Stefan Roese <sr@denx.de>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pavel Machek <pavel@denx.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Stefan,

On Mon, Aug 12, 2019 at 1:54 PM Stefan Roese <sr@denx.de> wrote:
> On 12.08.19 13:17, Geert Uytterhoeven wrote:
> > On Thu, Aug 8, 2019 at 3:25 PM Stefan Roese <sr@denx.de> wrote:
> >> This patch fixes a backward compatibility issue, when boards use the
> >> old style GPIO suffix "-gpio" instead of the new "-gpios". This
> >> potential problem has been introduced by commit d99482673f95 ("serial:
> >> mctrl_gpio: Check if GPIO property exisits before requesting it").
> >>
> >> This patch now fixes this issue by iterating over all supported GPIO
> >> suffixes by using the newly introduced for_each_gpio_suffix() helper.
> >>
> >> Also, the string buffer is now allocated on the stack to avoid the
> >> problem of allocation in a loop and its potential failure.
> >>
> >> Signed-off-by: Stefan Roese <sr@denx.de>
> >
> > Do we really need to spread this *-gpio" legacy support all over the kernel?
> >
> > Seeing the only in-kernel users of legacy "rts-gpio" are
> >
> >      arch/arm/boot/dts/am335x-nano.dts:      rts-gpio = <&gpio0 13
> > GPIO_ACTIVE_HIGH>;
> >      arch/arm/boot/dts/am335x-nano.dts:      rts-gpio = <&gpio2 15
> > GPIO_ACTIVE_HIGH>;
> >      arch/arm/boot/dts/am335x-pdu001.dts:    rts-gpio = <&gpio1 9
> > GPIO_ACTIVE_HIGH>;
> >
> > and this is handled by omap-serial.c, predating mctrl_gpio, I'd like to
> > reconsider.
> >
> > Documentation/devicetree/bindings/serial/serial.txt always described
> > the "*-gpios"
> > variants, so there should be no users of the legacy "*-gpio" variants.
>
> Hmmm, you were the one to comment about supporting (not breaking) the
> "-gpio" variant:
>
> https://lkml.org/lkml/2019/6/24/248
>
> That was my main motivation to work on this patch.

I know. That's why I wrote "reconsider".  Before, I assumed there were actual
users of the legacy properties, which turned out to be wrong.

IMHO no driver should be aware there can be multiple possible suffixes.

Sorry for the trouble.

> If we all agree, that only the documented "-gpios" variant needs to
> be supported, then we can drop this patch.

BTW, I'm still wondering if d99482673f950817 ("serial: mctrl_gpio: Check
if GPIO property exisits before requesting it") is the right fix.
This is a place where we rely explicitly on named GPIOs being present, so
IMHO the ACPI code should not return a random GPIO instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
