Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8264AD65C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Feb 2022 12:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356747AbiBHLYH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Feb 2022 06:24:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346778AbiBHJoy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Feb 2022 04:44:54 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65978C03FEC0
        for <linux-gpio@vger.kernel.org>; Tue,  8 Feb 2022 01:44:53 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id b13so36211847edn.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Feb 2022 01:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BeRypQwass6YxPMaRwyaWgbo3dxTZ96rzrwO6lKw8tw=;
        b=CPoGHoY5UFuK2gjDWY/wRSj3B48TF9rqTc8i4NRpSvzlBKCebVlPHHd0lxgw8vTMcH
         J84BDRao2THS0Gd9E2mFD9x9Xun5oY96NoX8Ztjte5gPjLa6ooHuTx7FfmtVpETBrZYz
         aF8z/nbBkZ/gA7d8PKXnbK/Ge1xjFdRGrTYlomy/jCZLgdtF5uvnLPEDoI8SMypVfcBn
         VLJDm6P75D4KPdgbofdtIDDn2qkcH9A1wtOzimWkrbwzvHCvZVPIOChbKlc7NGjeOkzp
         8RJLjhYX8KF3kddGFyf7N+57HmqKjV+wHYL2x5CtA6kDWmHCYemaLMqzki4WKR1/Ojt8
         VcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BeRypQwass6YxPMaRwyaWgbo3dxTZ96rzrwO6lKw8tw=;
        b=4+MihnYasK8EbcQDwPDIhG20MRxIKEvtor0DjZGZaivMNyng7vlu+qNjfz/Yx7UVK+
         a8Zc5BTLT8SAvmNJGKho0MjpQgamrP/X77emFeL6f0AM+9wVsZMXM4VsmpC1rCv2mAGQ
         G+0TlgWDghuMuGT9r7zXOxGr7YJq+bG0ow2+WNIomHmBqnSGf2b7eTBaMBwsbfJbzwRJ
         tF1UN7B0YeVwdXM0iLzOtjpxLZLnoX7Ke0ctWD0iPngnE3A7k25LafUJQ1WGxgvDovCA
         W8dHhJIhCblLhsbigb0e9aPw4CUYNbIMZXeAxNcIxq7F13PTRJajAgZgDX9t4Y1yVESk
         KwJg==
X-Gm-Message-State: AOAM532IeMJdzSVoRkaQqr2bFE9pNKpa4Q/srrXNDMVbdxIJ/QuNgnUG
        b/xDXqmCsR1bmJm+MRGW+581S7g0mbkyPivt3npcaA==
X-Google-Smtp-Source: ABdhPJyyUn+ESX1mrzcWKTtrYf0cJlehIsu5d5CCiBT1F/1vuRES3dsTpb3cJmLCLsUb8HULJ++KAkho1FM39XJS0P8=
X-Received: by 2002:a50:eb46:: with SMTP id z6mr3567435edp.229.1644313491953;
 Tue, 08 Feb 2022 01:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20220204130142.21727-1-Niklas.Cassel@wdc.com> <aa6f85f3-1146-e857-148c-7a314b21e647@opensource.wdc.com>
In-Reply-To: <aa6f85f3-1146-e857-148c-7a314b21e647@opensource.wdc.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Feb 2022 10:44:41 +0100
Message-ID: <CAMRc=MfrQYSOu+6ZPgLqxek2RfvmCVzS64rKRp_rsq+Hk1QYxg@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: use the correct register to read output values
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc:     Niklas Cassel <Niklas.Cassel@wdc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Feb 5, 2022 at 12:33 AM Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
>
> On 2/4/22 22:02, Niklas Cassel wrote:
> > From: Niklas Cassel <niklas.cassel@wdc.com>
> >
> > Setting the output of a GPIO to 1 using gpiod_set_value(), followed by
> > reading the same GPIO using gpiod_get_value(), will currently yield an
> > incorrect result.
> >
> > This is because the SiFive GPIO device stores the output values in reg_set,
> > not reg_dat.
> >
> > Supply the flag BGPIOF_READ_OUTPUT_REG_SET to bgpio_init() so that the
> > generic driver reads the correct register.
> >
> > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>
> This probably needs a Fixes tag. I have not checked which patch though.
>

I added the tag and queued this for fixes, thanks!

Bart

> > ---
> > The patch was tested on a canaan,k210 board (canaan,k210-gpiohs compatible
> > string). It would be nice with a Tested-by from someone with a SiFive board.
> >
> > However, the u-boot driver for this device already behaves exactly the same
> > as this driver does after my patch, for all platforms using the driver.
> >
> >  drivers/gpio/gpio-sifive.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> > index 403f9e833d6a..7d82388b4ab7 100644
> > --- a/drivers/gpio/gpio-sifive.c
> > +++ b/drivers/gpio/gpio-sifive.c
> > @@ -223,7 +223,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
> >                        NULL,
> >                        chip->base + SIFIVE_GPIO_OUTPUT_EN,
> >                        chip->base + SIFIVE_GPIO_INPUT_EN,
> > -                      0);
> > +                      BGPIOF_READ_OUTPUT_REG_SET);
> >       if (ret) {
> >               dev_err(dev, "unable to init generic GPIO\n");
> >               return ret;
>
>
> --
> Damien Le Moal
> Western Digital Research
