Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862C341CC0C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 20:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346121AbhI2Sni (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Sep 2021 14:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345901AbhI2Sni (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Sep 2021 14:43:38 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64D0C061764
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 11:41:56 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id s192so6019982ybs.5
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SFBNphSzefupqMOU/FsZmobfn4DHEGh119C5ZxnfiGU=;
        b=oMLjATvPGSpioTo7Narm2EOrCji/7AFatopBvAuzGkFWwdEXXNuZ1hZbw5aONHH3Tj
         LLzhzQ8GV75CJj5F0TS7kJu2urizG6ykARntXihNeOyWRlHzmO76u4TRMJirLvNjpJjq
         PMQ2U9icPf23CzpmrsroakFFWWnssLXJjTaM6uCeYmoRZ00VamCh7RQM8F0YMhybPDPl
         drN/2bFYh7ofR/j/0AZK5q0cGHa2NNaYzIPcKUK+AZxS8cYOYvXQ/Jwlr9PmjthptdHU
         W7QjCMgV3pxrefEXRXJqlWzbItMAPEJ6cd0DVOeogFLqjmqCHoKeFNDlwBYmZzdHwHci
         WAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SFBNphSzefupqMOU/FsZmobfn4DHEGh119C5ZxnfiGU=;
        b=DTB2yX5zfaACmFNRLqd8zPMZPVZUDfBs0ELHifa9cn7bN7MH/C99EBhQX2XYWT42MD
         IrU02syMtK4o1v1SdQErPDs/Q0F7e8SWTU8wTdnAxfnegTTCEsOFDB7sQ8uBdHdPX6bF
         U0dQbkKWt68GXtqbDw5JFcByPXfqv3+dLscsN7IRgIIW63Th2Zk7KuM/2oXsQYA1gHp2
         XlvIPudHdZcd7/gi3wwXdNYYt5PbFVeuZP6bqC56XsdAkKStEQVcf1w9vaGIEXjvKlAz
         IzPnHNvGuk8BF67PnxBF0Naxr96WlnyjwJSIKiD3R+cKPnZAmbqMhcZb4BCjME+HTC1q
         8FGw==
X-Gm-Message-State: AOAM531GAUk4QHROhQccjn3JiLRcjTipn4FCa1kKxV74FL/WX5SaAbcl
        9dU3UOXpku9K2OJMYtQqvbBLsiixIUpVnq2VcmgPXg==
X-Google-Smtp-Source: ABdhPJwNmyLL1Vwcs1z7Otw9xiAbBHCqdUBRaIm6Ff1TN2FnEmGLp4rH35K82AHKVwUCmUznS8VNwGyvHPzRqlWGD78=
X-Received: by 2002:a25:14d6:: with SMTP id 205mr1568573ybu.93.1632940915963;
 Wed, 29 Sep 2021 11:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210923172215.18376-1-nikita.yoush@cogentembedded.com>
In-Reply-To: <20210923172215.18376-1-nikita.yoush@cogentembedded.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 29 Sep 2021 20:41:45 +0200
Message-ID: <CAMpxmJUy6_Yb_2622TAjTxD1bged25LsOOkvafCzj-e1d=UTTg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: do not ignore i2c errors
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 23, 2021 at 7:22 PM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
>
> From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
>
> Per gpio_chip interface, error shall be proparated to the caller.
>
> Attempt to silent diagnostics by returning zero (as written in the
> comment) is plain wrong, because the zero return can be interpreted by
> the caller as the gpio value.
>
> Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index f5cfc0698799..8ebf369b3ba0 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -468,15 +468,8 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
>         mutex_lock(&chip->i2c_lock);
>         ret = regmap_read(chip->regmap, inreg, &reg_val);
>         mutex_unlock(&chip->i2c_lock);
> -       if (ret < 0) {
> -               /*
> -                * NOTE:
> -                * diagnostic already emitted; that's all we should
> -                * do unless gpio_*_value_cansleep() calls become different
> -                * from their nonsleeping siblings (and report faults).
> -                */
> -               return 0;
> -       }
> +       if (ret < 0)
> +               return ret;
>
>         return !!(reg_val & bit);
>  }
> --
> 2.30.2
>

Applied, thanks!

Bart
