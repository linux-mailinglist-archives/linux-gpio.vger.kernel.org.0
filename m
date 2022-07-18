Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E67578170
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 14:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234527AbiGRMAs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 08:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234034AbiGRMAr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 08:00:47 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA043237DA
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 05:00:46 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w12so14880482edd.13
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 05:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jIR19c6fcldsOI0SS0LvTChzRzR24N+hKk7IiA1uXhc=;
        b=CnIXsZB4Y629yN6zE++QfoyQQ+FALZ9jhppT3tDJ0rxU7UZmN9AiDhtfEcnbnwagp6
         20S9J0usx5gceozsuZ7pCV3IZll1Biiv2X3eL1TYxAIjy0zojKn5UNYwhj8C7HMROQtl
         mmj6cN4qAqpzgrkavyqqBP+f1yQzbKp7M0c0JCDBayAv9FoHuDHhvkvfLk7dPQASVNIo
         wDJLZA4BGg51mRE2N7ZOher8peJavW4BxR+U9qm/gJUVzocC3XdeC+YR4Hh16PsRmNTe
         sgIuiQGOdHq9N/EHqzAreWCxP/tVdDVqnujMeiVgF2lCnUaCMzFj90DUw3vWKsscKfnW
         uGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jIR19c6fcldsOI0SS0LvTChzRzR24N+hKk7IiA1uXhc=;
        b=6y+ZirjSbwihMreFAvff+NjtPANQeW4UatVfmWNOODm3qiz4qCku5rpnEx96LGXAa5
         XQKLyQSByGU7ibbRkeSfEUBy88ctY6ifSWuOEJFyHzwg+L/sgqsA0lIFA2CW8OUpjVrv
         3d6k+yRT2Bn1NVJNgiVI6ZLZ8JcVEwoCsVhWBkw5UbRXf8KyxgRQkDxUoxsdstGIFtdw
         kcOvqSAKHaIX0Z+w8c0n1jLH/9A2MVVQ4IyvpxohUQxhVM8BiTP/E1TygRzbdE+C06U5
         GSMZHcNG9kr79HKrSiPaHvzgIgf3SdCRnC8MW80cMeBB2R0sKL38wUpBC01iyrgSbAeQ
         SF5w==
X-Gm-Message-State: AJIora/Rx5ogm+clcNZB8b8XfjRcPDjLLBODZI/DHOMO/Xu0QDGOxtdt
        6T3SOYO/6/N/PhWRVZkxbvbhajCuatiMCiseDNkXpiq83pso/g==
X-Google-Smtp-Source: AGRyM1tvoVEy5hC3sT779uj/imhhFC+uMpgf4Fq7p0chzvZ8jq7Oq4F4YAmFfrZlnxGXzNeKkjhUtE+yPIdW2eglQpo=
X-Received: by 2002:a05:6402:1658:b0:43a:91cd:2ffb with SMTP id
 s24-20020a056402165800b0043a91cd2ffbmr35455524edx.277.1658145645469; Mon, 18
 Jul 2022 05:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <1658133103-23394-1-git-send-email-haibo.chen@nxp.com> <1658133103-23394-3-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1658133103-23394-3-git-send-email-haibo.chen@nxp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Jul 2022 14:00:08 +0200
Message-ID: <CAHp75VcCnHj+0kxTGUv35YHqt_bBFuoDaes4RyhSw6v64QBJ6w@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: pca953x: use the correct register address when
 regcache sync during init
To:     BOUGH CHEN <haibo.chen@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Marek Vasut <marek.vasut@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 18, 2022 at 10:56 AM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> For regcache_sync_region, need to use pca953x_recalc_addr() to get

we need

> the real register address.

A couple of comments, here, otherwise you can add
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
to _all_three_ patches.

> Fixes: ec82d1eba346 ("gpio: pca953x: Zap ad-hoc reg_output cache")
> Fixes: 0f25fda840a9 ("gpio: pca953x: Zap ad-hoc reg_direction cache")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 18888ec24d04..1747b6a9d5bf 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -910,14 +910,17 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
>  {
>         DECLARE_BITMAP(val, MAX_LINE);
>         int ret;
> +       u8 regaddr;

Please, keep it on "longest line first" order.

> -       ret = regcache_sync_region(chip->regmap, chip->regs->output,
> -                                  chip->regs->output + NBANK(chip) - 1);
> +       regaddr = pca953x_recalc_addr(chip, chip->regs->output, 0);
> +       ret = regcache_sync_region(chip->regmap, regaddr,
> +                                  regaddr + NBANK(chip) - 1);
>         if (ret)
>                 goto out;
>
> -       ret = regcache_sync_region(chip->regmap, chip->regs->direction,
> -                                  chip->regs->direction + NBANK(chip) - 1);
> +       regaddr = pca953x_recalc_addr(chip, chip->regs->direction, 0);
> +       ret = regcache_sync_region(chip->regmap, regaddr,
> +                                  regaddr + NBANK(chip) - 1);
>         if (ret)
>                 goto out;

-- 
With Best Regards,
Andy Shevchenko
