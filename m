Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6247857967A
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 11:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236607AbiGSJj6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 05:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236527AbiGSJj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 05:39:57 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42EFD193EF
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 02:39:56 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id b11so26050611eju.10
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5DndlqaA0b5P7V8K0nn0nAB3Le3WzLS+1abdkdfA3oo=;
        b=P/jGfw9dfIn9s6JombXuAjGvQDF7KcXmjJ4d+6Ifeq9/2USzPKmLqaeZWqUKfGzln8
         ijamhG4b6HEdm+LH+cCJjLhOFG9rC/cQPhX/kWr/TvXfu9ZP55le7yCmDMBYIa3qvlaD
         rIg6A1iNAQcATFJWK+qyrRGx6vfOXCASVyC3vviUeE4wbmdscpP7b9soWsI73ocoOzeJ
         i/QBcEQ/UKWWwoUBT2xc+JB1/AzeVnH3kCporA3gTbtOawuR9yg34k7hvo/42IL4NW5c
         EoW/DHb720Wtnhy4J7ixRYV2J5ssNJJ2C1aE79IugYcg2wePyCWuUuCZ6urikf1IvBiJ
         rizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5DndlqaA0b5P7V8K0nn0nAB3Le3WzLS+1abdkdfA3oo=;
        b=IDMxCqKzBngmb+3s1pY7aKt7KCa+QBTIurmayIhNICBRIdjsiy5x5J2Eolg4J4Hqj3
         ci6XWir0GX+T36ZewN9gPRaXFCKWbgT6n+yN1Oi5c4RsAoaryUy12nZ+deiAxlHwEaLZ
         /4GI9/J1Ktv7owGcJAkNPmtwZZz5DE9cwxfnVkmSzmf4qml9NtxFMrQHq2Op6OiWcduH
         5m0seJVl/cDFt/SQD88aeOtdhtE2proOGHO3CMDMte6+glRi/9C7XFdS9GdAsp78FkBv
         3FkWH+fwZrVtz16+263xgpCLxVMtcx9GHD4QT9bmJCxdodq75AIlFVzYq/GwSmLqJgdZ
         wuUQ==
X-Gm-Message-State: AJIora/9onvghUjsYpwEE5dN1hLFKqi7BO8d3a8IW/pJjX9LhToXFOig
        oe37uMET/Cx6K9EbzSwvwGPPghLV9md1IJwcWZS4FtPXjUE=
X-Google-Smtp-Source: AGRyM1vFtK8TUGDMYBrRuEg8SZf4/xtpPIWPwFX2qAfgudgg/bOlvMyQLsdxgwrNDykyr7Z9TiT6g8vuOfCErrHlYQ8=
X-Received: by 2002:a17:906:98c8:b0:72b:408f:f499 with SMTP id
 zd8-20020a17090698c800b0072b408ff499mr29650424ejb.736.1658223594794; Tue, 19
 Jul 2022 02:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220712143237.13992-1-henning.schild@siemens.com>
 <20220712143237.13992-2-henning.schild@siemens.com> <CAMRc=Md7uVpwSweCSfrNJKqhQLYs2sVv9UasL59ZpqJ50fSC5w@mail.gmail.com>
 <20220713123932.753367ec@md1za8fc.ad001.siemens.net>
In-Reply-To: <20220713123932.753367ec@md1za8fc.ad001.siemens.net>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 19 Jul 2022 11:39:44 +0200
Message-ID: <CAMRc=McSXgCDB=1dX410BYPDw9skd5kRWC1SsoxkvFnrUnVdpA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] gpio: nct6116d: add new driver for several Nuvoton
 super io chips
To:     Henning Schild <henning.schild@siemens.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tasanakorn Phaipool <tasanakorn@gmail.com>,
        Sheng-Yuan Huang <syhuang3@nuvoton.com>,
        Kuan-Wei Ho <cwho@nuvoton.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 13, 2022 at 12:39 PM Henning Schild
<henning.schild@siemens.com> wrote:
>

[snip]

> > > +
> > > +static struct platform_driver nct6116d_gpio_driver = {
> > > +       .driver = {
> > > +               .name   = KBUILD_MODNAME,
> > > +       },
> > > +       .probe          = nct6116d_gpio_probe,
> > > +};
> > > +
> > > +static int __init nct6116d_gpio_init(void)
> > > +{
> > > +       struct nct6116d_sio sio;
> > > +       int err;
> > > +
> > > +       if (nct6116d_find(0x2e, &sio) &&
> > > +           nct6116d_find(0x4e, &sio))
> > > +               return -ENODEV;
> > > +
> > > +       err = platform_driver_register(&nct6116d_gpio_driver);
> > > +       if (!err) {
> > > +               err = nct6116d_gpio_device_add(&sio);
> > > +               if (err)
> > > +
> > > platform_driver_unregister(&nct6116d_gpio_driver);
> > > +       }
> > > +
> > > +       return err;
> > > +}
> >
> > I'm confused - have we not discussed removing this part?
>
> Ah, i thought the problem was the use of subsys_initcall because the
> comment was under that line.
>
> To he honest i do not know all the details since i really just received
> that driver.
>
> What is happening here is that some init code goes and probes well
> known ports to discover which chip might be connected there. Looking at
> hwmon, watchdog and similar gpios ... that is the established pattern
> for Super IOs.

I just thought that you would use the simatic driver you mentioned to
trigger the creation of the devices upon some event. This is what I
got from your previous email. But that's fine - if there's a repeating
pattern of doing it this way, then I won't object. I'm not an expert
on Super IO kernel drivers.

> Not DT or ACPI bindings. Something has to load that module to make it
> init, where it will go and enumerate/poke around.
>
> While i could likely put a platform_device_register_simple("driver",
> 0x42, "chip42") into the simatic platform, then the driver would be
> pretty useless when not having ACPI (for there Super IOs in general!).
> There already are hwmon and watchdog drivers for exactly that chip.
>
> watchdog/w83627hf_wdt.c
> hwmon/nct6775*
>
> All are based on someone has to "know" and "modprobe", which will cause
> "finding"
>
> The pattern we have here seems all copied from gpio/gpio-f7188x.c,
> another super similar driver is gpio/gpio-winbond.c (which is param
> based and not at all reusable in other drivers).
>
> Looking at hwmon or watchdog, Nuvoton/Fintek/Windbond are sometimes
> called a family. But the driver landscape in the kernel is very spread
> and a lot of copied around code. I did not even look into tty/serial or
> whatever other functions these Super I/Os offer.
>
> Looking at the way Super IO chips are driven in the kernel, it seems
> all about writing a driver for each sub-function (uart, hwmon, watchdog
> ... and gpio). Where even very similar chips gets new drivers instead of
> making existing drivers more generic.
>
> I am just observing this and proposing a "similar copy", which i did
> not even write myself. At some point it might be better to rewrite all
> that and make Super I/Os platforms that discover the chip once and then
> register all the many devices they have. Where ressources are properly
> reserved and not that really weird "superio_enter" with
> "request_muxed_region(base, 2, DRVNAME)" which can be found all over
> the place. But hey that allows a very smooth mix of in-tree and
> out-of-tree.
>

A note on that: the kernel community explicitly has zero regard for
out-of-tree code. :)

Bart

> When reviewing this driver i suggest to measure it against i.e. f7188
> or winbond and maybe others.
>
> Say i would manage to make the nct6116d chip supported by f7188, would
> that be acceptable? I would have the "init pattern" i need without
> copying it. But i would add a Nuvoton chip to a Fintek driver ... might
> be the same family ... no clue.
>
> Henning
>
> > Bart
> >
> > > +
> > > +static void __exit nct6116d_gpio_exit(void)
> > > +{
> > > +       platform_device_unregister(nct6116d_gpio_pdev);
> > > +       platform_driver_unregister(&nct6116d_gpio_driver);
> > > +}
> > > +module_init(nct6116d_gpio_init);
> > > +module_exit(nct6116d_gpio_exit);
> > > +
> > > +MODULE_DESCRIPTION("GPIO driver for Nuvoton Super-I/O chips
> > > NCT5104D, NCT6106D, NCT6116D, NCT6122D");
> > > +MODULE_AUTHOR("Tasanakorn Phaipool <tasanakorn@gmail.com>");
> > > +MODULE_LICENSE("GPL"); --
> > > 2.35.1
> > >
>
