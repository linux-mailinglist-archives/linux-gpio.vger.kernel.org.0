Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 561803627B2
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Apr 2021 20:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244793AbhDPS23 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 16 Apr 2021 14:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236387AbhDPS23 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Apr 2021 14:28:29 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F2DC061756
        for <linux-gpio@vger.kernel.org>; Fri, 16 Apr 2021 11:28:04 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 65so31146758ybc.4
        for <linux-gpio@vger.kernel.org>; Fri, 16 Apr 2021 11:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qYdKrE1zIlOzfHp4IhnEDh/ZEjT1bfTnj4Cp18io3c8=;
        b=M65GbMciF8c8P/jrTOmRILWpizSLmCME+Z4Bj8NWg6xvyStueQndmFwysQbWSPHrRI
         BjEkkH2TDS95ShyHY73w8d7AG1LO1fG4CgG/JrrQ4xzzltpjVsLdSnKwHzWgDqyNY/6H
         qB1xO8cKOMLw9eXd/cJfW4dI38SsJImq1sUGWSlJc7TZfn9OgwuVkvtOyHocxt/IbmuJ
         /mCKdTN+644aeLvacPlmYnrLPuJBtTxA04xmSPr7YoOjQNmHgKLbTUNO+Ohxw0qhNpNU
         QArIoFcYs5YdUluZSQVG+nYVLXbqUmBKSV+kgfDolZuuhzJa5cxpCWCDbuh6yUzUcQS0
         CgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qYdKrE1zIlOzfHp4IhnEDh/ZEjT1bfTnj4Cp18io3c8=;
        b=q8CD/g8FJgt2sFsLI1jOtbN4qk5SOZEiF4kMu0deNnyauzorT3x2lkEt2l+8YueYiV
         AgKGH09mY/VcPhpGvlyx2R7p/FXpIK/h5xM/TSoAP6EknzWWmkD8samoRgJrkc6W46i9
         GVSSbRH6Zftd7kua/S5bVM/cKJM40kRRtmE0oph5sKAk2ttl0XInvfrIgPgPgRc5CecV
         KYI+qwCnvSbAvb4FvbAeeIS3fZfbHBMr+GCwCGIo/UfM9DBppZOSFx0CsSufEohivSVw
         ksggzHwXfUNG2L3FLV/MtlJKelsSEfaFG4KgFmH9kiuo6Am2ZZmr90ZdyTCTjOyXRPRZ
         0/aQ==
X-Gm-Message-State: AOAM5312xKdoBtrbGx1ycvMQMgjAy1UMxOY7wAG/25f0e+NZRd+3poEZ
        WpHh8M05YBBI4fK3Ycd1L+o2gBuuH0TW+2Hr6rUwLQ==
X-Google-Smtp-Source: ABdhPJzpBK1wYEpzI44fV2r55GTuwm/r8tOiWBH0d3Grc40BHUnSbi1Lg583ZAzXaN++lk+cvcZ5vgsWNMyZlFIKNWI=
X-Received: by 2002:a25:7307:: with SMTP id o7mr581220ybc.469.1618597683618;
 Fri, 16 Apr 2021 11:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
 <20210409140806.31824-2-srinivas.neeli@xilinx.com> <CAHp75Vddd6ygr4mJ9Z+SuGZmfLcgDLWLZaxby2XE2mX8War-qQ@mail.gmail.com>
 <CAMpxmJW=HWf_NxGpfBkX=utgOTs4+6RtypxnKGtpuYnX=t8rGQ@mail.gmail.com> <DM6PR02MB5386CADF5A10EF28A640AD76AF4E9@DM6PR02MB5386.namprd02.prod.outlook.com>
In-Reply-To: <DM6PR02MB5386CADF5A10EF28A640AD76AF4E9@DM6PR02MB5386.namprd02.prod.outlook.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 16 Apr 2021 20:27:52 +0200
Message-ID: <CAMpxmJV_CtFQpZvr_H0g3DvPMQZwqa-9z2FVxCLX=tF9Ytkj7Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: zynq: use module_platform_driver to simplify
 the code
To:     Srinivas Neeli <sneeli@xilinx.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 14, 2021 at 4:45 PM Srinivas Neeli <sneeli@xilinx.com> wrote:
>
> HI baratosz and Andy,
>

It's Bartosz. You literally just need to copy & paste the name from my emai=
l...

> > -----Original Message-----
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Sent: Tuesday, April 13, 2021 4:14 PM
> > To: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: Srinivas Neeli <sneeli@xilinx.com>; linus.walleij@linaro.org; Micha=
l Simek
> > <michals@xilinx.com>; Shubhrajyoti Datta <shubhraj@xilinx.com>; Sriniva=
s
> > Goud <sgoud@xilinx.com>; linux-gpio@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; git
> > <git@xilinx.com>
> > Subject: Re: [PATCH 1/3] gpio: zynq: use module_platform_driver to simp=
lify
> > the code
> >
> > On Sat, Apr 10, 2021 at 12:08 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > >
> > >
> > > On Friday, April 9, 2021, Srinivas Neeli <srinivas.neeli@xilinx.com> =
wrote:
> > >>
> > >> module_platform_driver() makes the code simpler by eliminating
> > >> boilerplate code.
> > >>
> > >> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> > >> ---
> > >>  drivers/gpio/gpio-zynq.c | 17 +----------------
> > >>  1 file changed, 1 insertion(+), 16 deletions(-)
> > >>
> > >> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> > >> index 3521c1dc3ac0..bb1ac0c5cf26 100644
> > >> --- a/drivers/gpio/gpio-zynq.c
> > >> +++ b/drivers/gpio/gpio-zynq.c
> > >> @@ -1020,22 +1020,7 @@ static struct platform_driver zynq_gpio_drive=
r
> > =3D {
> > >>         .remove =3D zynq_gpio_remove,
> > >>  };
> > >>
> > >> -/**
> > >> - * zynq_gpio_init - Initial driver registration call
> > >> - *
> > >> - * Return: value from platform_driver_register
> > >> - */
> > >> -static int __init zynq_gpio_init(void) -{
> > >> -       return platform_driver_register(&zynq_gpio_driver);
> > >> -}
> > >> -postcore_initcall(zynq_gpio_init);
> > >
> > >
> > >
> > > It=E2=80=99s not an equivalent. Have you tested on actual hardware? I=
f no, there is
> > no go for this change.
> > >
> >
> > Yep, this has been like this since the initial introduction of this dri=
ver.
> > Unfortunately there's no documented reason so unless we can test it, it=
 has
> > to stay this way.
> >
> I tested driver, functionality wise everything working fine.
> Based on below conversation, I moved driver to module driver.
> https://lore.kernel.org/patchwork/patch/818202/
>

Andy: How about we give it a try then? If anyone yells, we'll just revert i=
t.

> Thanks
> Srinivas Neeli
>
> > Bartosz

Bartosz
