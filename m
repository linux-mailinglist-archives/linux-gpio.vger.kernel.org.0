Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 675CF51BFEC
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 14:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234154AbiEEMzJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 08:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378368AbiEEMzE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 08:55:04 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E6356773
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 05:51:14 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id ks9so2114735ejb.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 05:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cf6b5pV3UMfQkVtF+8ODWsaGpTKDEhUIkLvFUHa+azk=;
        b=EFOY1e7wzmMiTo5aHq2giskd/Cr8TikeLQWNah+7OetLEo9t9nmt6zA5y8wJ2X0xVd
         uBVsPhYk8QcWGlFpAxjcjUle4RFIucf62JKuB2mrlAge/LRD/ndaR0krkj7yZR2gKT1h
         F6LGY2RSR4n1dQx9214UASDZz6rmSlKGsEGUERkfATLVKVWYKKT906gcOI+/htsNczXO
         sxJapXGUAiyXxpyamb3uo9ruBybLuNvGK+seZKXg3Qg73z7LjLKw0vRvQ0Bl62ZhZCW5
         zDfBCAiFrRExJKSAbp3QGudXEADTO/e1RFlqNNJl9wzzQo83dMv6dMG/JcGcW2GPwzdQ
         TAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cf6b5pV3UMfQkVtF+8ODWsaGpTKDEhUIkLvFUHa+azk=;
        b=7jKgf3fUObsqfft/iPFF1Tz37DXyx3oRj1BoeiO8wA29hphwBx5Ity3DHgN6DQoDzT
         Sy11lW6Zq+pAip3iMgBtm0R/EgQAAEXi+HcQRlfY6gDqpc3vvZYsRWB8MMW2DTdpkITo
         BHFupfXfo+aD84jBBirsoAs1ay9VfawBZqOoQNegi7y/JTSVn/jPS3VZXX5cWQPdB5eT
         6Pr8dNHSFyR05pAqL9dq7TI58Z7IJrTxMCG0Qzl6oIKxWXoh+jLdrhvTtz3zN0HH0DtU
         okXW5Ruv05QB61B53g8TdmZIZ0ii9ZcR/8pqStSpLpkUYfm7MeWToemqNJOSMk6dE1fq
         vIYw==
X-Gm-Message-State: AOAM530eR77jEYApaavMynwLPV60Ydwcx3v+skdUJPOgAUCV7mUGbZW1
        S0V+6qYbfJ3OKU7ACk7inDH29bsxozsSc3BdUHokwg==
X-Google-Smtp-Source: ABdhPJyccBQs438IbcOWBLBqEuGKyFzi6RMdb5FH5tYCWKodJL15SEZRUoMNKuuROIqE1Nk9mqA3wiIEhyZQi7aicNo=
X-Received: by 2002:a17:907:7e92:b0:6f4:c553:c734 with SMTP id
 qb18-20020a1709077e9200b006f4c553c734mr8113090ejc.286.1651755072981; Thu, 05
 May 2022 05:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220501092201.16411-1-puyou.lu@gmail.com>
In-Reply-To: <20220501092201.16411-1-puyou.lu@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 14:51:02 +0200
Message-ID: <CAMRc=MegD1gwe_FNc04K8-f7PxVauY4L00958oZ5PXaTmL7+_Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: update irq_stat even when irq is not
 enabled (irq_mask not set).
To:     Puyou Lu <puyou.lu@gmail.com>
Cc:     Puyou Lu <lupuyou@aifrutech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 1, 2022 at 11:22 AM Puyou Lu <puyou.lu@gmail.com> wrote:
>
> From: Puyou Lu <lupuyou@aifrutech.com>
>
> When one port's input state get inverted (eg. from low to hight) after
> pca953x_irq_setup but before setting irq_mask (by some other driver such as
> "gpio-keys"), the next inversion of this port (eg. from hight to low) will not
> triggered any more (because irq_stat is not updated at the first time). Issue
> should be fixed after this commit.
>
> Signed-off-by: Puyou Lu <puyou.lu@gmail.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index d2fe76f3f34f..8726921a1129 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -762,11 +762,11 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
>         bitmap_xor(cur_stat, new_stat, old_stat, gc->ngpio);
>         bitmap_and(trigger, cur_stat, chip->irq_mask, gc->ngpio);
>
> +       bitmap_copy(chip->irq_stat, new_stat, gc->ngpio);
> +
>         if (bitmap_empty(trigger, gc->ngpio))
>                 return false;
>
> -       bitmap_copy(chip->irq_stat, new_stat, gc->ngpio);
> -
>         bitmap_and(cur_stat, chip->irq_trig_fall, old_stat, gc->ngpio);
>         bitmap_and(old_stat, chip->irq_trig_raise, new_stat, gc->ngpio);
>         bitmap_or(new_stat, old_stat, cur_stat, gc->ngpio);
> --
> 2.17.1
>

This needs to Cc stable and a fixes tag.

Bart
