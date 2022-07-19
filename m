Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DC6579638
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jul 2022 11:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235378AbiGSJWY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jul 2022 05:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237337AbiGSJWH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jul 2022 05:22:07 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E5B2AD6
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 02:21:36 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id va17so26078644ejb.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 Jul 2022 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=INTQjcWcr/QjOpY0vV/JrcllEZpH/ydbnWHRYlb2hBk=;
        b=oIvQwQHV8n/DVNeqYe1ilxSLtuSa/X/RjjmdlF4ZGBd9+ibI3LqDxI2sf3aMW2HqS+
         76QpIFw1c4ewp5ZePsl8BzBwx9xR0CoF1Cuwc7ZBJl2CHMC2ZLcwHvtTVGGmENxnQDfs
         g0ecQvJHGJ2cRuX0O/Og8ImkS0JM4jTwIJjr8dlJNJL1ui4qM4iS1WBCSrNfQeRImh6X
         55ipNWzUmfaAuy3Sjz+k67StakZy1MRt55NwbvMqLzWl9MMMdq0hBehE3M4toB0AH9CV
         FeCr3kFUBpTsX4KMf5Zs3cGRYLGoO/wwmB7hAj0gkjuaUO/FElFdP24W2eCS0JMBJIer
         vDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=INTQjcWcr/QjOpY0vV/JrcllEZpH/ydbnWHRYlb2hBk=;
        b=PGdTfxm9WGHTzH5lJSPQ63fLkV1rB7mG6mhRR/xD5pxb25QC5JGTQNK3idDR0BNB1M
         mE/1mU2k5U4t8I4AaMRORO2bvF7m2oKpJWzHzYdIsOCAH30endycpubQKn9TaUzhn2wL
         qImztT2CjG7EKs41Brq7sW3lpfGZ0tis/wYSLPBHcu4vo4g2BjgwXaFadBvPHTzS2gao
         YVjMX3YNbKEzFZw3kXkT3hYI0pjwS9drtGSDj5jWr9hyLeQRiWD2Rxac3IVOdzbtRlN+
         YX5czH+C1hBKnM+rZrWg5P4n3CTsGp9oLEhfvFmhoi2/moiv7qJOEmqGYpZu+1sbVcpH
         Fv5g==
X-Gm-Message-State: AJIora9nAqOafCzaIdPaKGKAfUK0PUm26MOcARvjaSyPQuXoVEU/NcID
        oolRlPiULjl0H+4X5HodfaJhwnV4tM1K+ozl1oFvIA==
X-Google-Smtp-Source: AGRyM1umShCcU+N4BdC2XPEI0GJtxWY0FLfFIxLPE8Nh7p2exqBv+S7XY5Ho/73OgSHc2ROySWMTNdGtGzxWjWMMywY=
X-Received: by 2002:a17:907:2c4a:b0:72b:5b9b:9c50 with SMTP id
 hf10-20020a1709072c4a00b0072b5b9b9c50mr30198936ejc.636.1658222494749; Tue, 19
 Jul 2022 02:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <1658133103-23394-1-git-send-email-haibo.chen@nxp.com>
 <1658133103-23394-3-git-send-email-haibo.chen@nxp.com> <CAHp75VcCnHj+0kxTGUv35YHqt_bBFuoDaes4RyhSw6v64QBJ6w@mail.gmail.com>
In-Reply-To: <CAHp75VcCnHj+0kxTGUv35YHqt_bBFuoDaes4RyhSw6v64QBJ6w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 19 Jul 2022 11:21:24 +0200
Message-ID: <CAMRc=MfTeTdwE3rW9iudh8=LPpridu7u9TEwUHiVjoEROWUzqA@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: pca953x: use the correct register address when
 regcache sync during init
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     BOUGH CHEN <haibo.chen@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 18, 2022 at 2:00 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jul 18, 2022 at 10:56 AM <haibo.chen@nxp.com> wrote:
> >
> > From: Haibo Chen <haibo.chen@nxp.com>
> >
> > For regcache_sync_region, need to use pca953x_recalc_addr() to get
>
> we need
>
> > the real register address.
>
> A couple of comments, here, otherwise you can add
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> to _all_three_ patches.
>
> > Fixes: ec82d1eba346 ("gpio: pca953x: Zap ad-hoc reg_output cache")
> > Fixes: 0f25fda840a9 ("gpio: pca953x: Zap ad-hoc reg_direction cache")
> > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > ---
> >  drivers/gpio/gpio-pca953x.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> > index 18888ec24d04..1747b6a9d5bf 100644
> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -910,14 +910,17 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
> >  {
> >         DECLARE_BITMAP(val, MAX_LINE);
> >         int ret;
> > +       u8 regaddr;
>
> Please, keep it on "longest line first" order.
>
> > -       ret = regcache_sync_region(chip->regmap, chip->regs->output,
> > -                                  chip->regs->output + NBANK(chip) - 1);
> > +       regaddr = pca953x_recalc_addr(chip, chip->regs->output, 0);
> > +       ret = regcache_sync_region(chip->regmap, regaddr,
> > +                                  regaddr + NBANK(chip) - 1);
> >         if (ret)
> >                 goto out;
> >
> > -       ret = regcache_sync_region(chip->regmap, chip->regs->direction,
> > -                                  chip->regs->direction + NBANK(chip) - 1);
> > +       regaddr = pca953x_recalc_addr(chip, chip->regs->direction, 0);
> > +       ret = regcache_sync_region(chip->regmap, regaddr,
> > +                                  regaddr + NBANK(chip) - 1);
> >         if (ret)
> >                 goto out;
>
> --
> With Best Regards,
> Andy Shevchenko

I fixed those up locally and applied all three.

Bart
