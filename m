Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17BA65A7C53
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 13:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbiHaLlk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 07:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiHaLlj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 07:41:39 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1FAB99C3
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 04:41:37 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id u9so27813667ejy.5
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 04:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2GkTfigNatAuObsTP9HWyqCOwjmPBU6t0b3elqZUmy0=;
        b=tkZCjyxMXpNsVJDioBhaQbxi4taN5xukggo1dTXlGPWz1ahHV/9qNE5ZNYDAXNlQxb
         YnMu0cqA8Jl02kWcuw5oypkrd1LCxwUTnks1mnQSDLcUYycn1YFAZvhXg+AX0dKj4WX8
         j1Ez/4QbuZV5DX5keupwPCnIX/mmBbXy9sV9v2/o1H8FHCEtBQbNRisb+yvFM9FS/Vax
         8vzzVwFBWGyyT5tkRVPQD3qrMgl+IcwiMuidIeyR7toAOnDd7iqPf2EPB9MXjec6QD0q
         AmLU4aLkdcybbMgK6oKMFD3mkrqel3ZrhIBBfncN1yITEwAiduEpNQ2nXqzUkEkESlbQ
         XcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2GkTfigNatAuObsTP9HWyqCOwjmPBU6t0b3elqZUmy0=;
        b=EGmGfLHOtf0pwSnknEJzbZyfciX9UCadiW7ctsK+TmM18gGr5enLBGpmi/2Pzs6ZFk
         jRhjPKHVNIDIGzWQR3uDw1U9Sr9VfqTSmK+EKMSaG62ZZbbZkbEfqhv9x9PdW5T9O2B7
         cUrKa8d5Vsn8tBJfpYW9CzgfGfr+Bixkijqd5QfX31FTte/02WQ/3difXCjGPNN+KE8W
         PhgFpGQKXMaMi2Eup557AvvPmNi7Q/NvGoCFNXrLWwNgro+fejob5Q7/kOtfXIvWecPL
         C4gpCcApY0iMjOenVwNVPncEMqMQnYj+6x/BA/8avRqsfnbk4+cDBxtAkWldtWwO6BL2
         LSMg==
X-Gm-Message-State: ACgBeo2Qo6F7yc6htwd+QHca0DZpdgL67BP9fBaI3lDl+vQ+ZId5Dj+E
        xSwnvkmClhePY9iBYH9Fzhwtx9hVtlEC1sHlOgdIY2RDZ44=
X-Google-Smtp-Source: AA6agR7vswUCtgJtqEgF7mlHICNJG/UBxeXeu8sDFuy0ZPYms41+24hLZ8gKRpcGHanqiO+68ggwf55Tqg4bhV63LjE=
X-Received: by 2002:a17:906:8a4e:b0:730:9fcd:d988 with SMTP id
 gx14-20020a1709068a4e00b007309fcdd988mr20022649ejc.636.1661946095945; Wed, 31
 Aug 2022 04:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <1661942255-13177-1-git-send-email-haibo.chen@nxp.com>
In-Reply-To: <1661942255-13177-1-git-send-email-haibo.chen@nxp.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 31 Aug 2022 13:41:25 +0200
Message-ID: <CAMRc=MdcQsG+gsdPSsjPv2hbhAXh6C4eann5uAF7ragB=5sCZA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Add mutex_lock for regcache sync in PM
To:     BOUGH CHEN <haibo.chen@nxp.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 31, 2022 at 12:55 PM <haibo.chen@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> The regcache sync will set the cache_bypass = true, at that
> time, when there is regmap write operation, it will bypass
> the regmap cache, then the regcache sync will write back the
> value from cache to register, which is not as our expectation.
>
> Though regmap already use its internal lock to avoid such issue,
> but this driver force disable the regmap internal lock in its
> regmap config: disable_locking = true
>
> To avoid this issue, use the driver's own lock to do the protect
> in system PM.
>
> Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 091dd573c556..cf9bf3fcaee2 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1168,7 +1168,9 @@ static int pca953x_suspend(struct device *dev)
>  {
>         struct pca953x_chip *chip = dev_get_drvdata(dev);
>
> +       mutex_lock(&chip->i2c_lock);
>         regcache_cache_only(chip->regmap, true);
> +       mutex_unlock(&chip->i2c_lock);
>
>         if (atomic_read(&chip->wakeup_path))
>                 device_set_wakeup_path(dev);
> @@ -1191,13 +1193,17 @@ static int pca953x_resume(struct device *dev)
>                 }
>         }
>
> +       mutex_lock(&chip->i2c_lock);
>         regcache_cache_only(chip->regmap, false);
>         regcache_mark_dirty(chip->regmap);
>         ret = pca953x_regcache_sync(dev);
> -       if (ret)
> +       if (ret) {
> +               mutex_unlock(&chip->i2c_lock);
>                 return ret;
> +       }
>
>         ret = regcache_sync(chip->regmap);
> +       mutex_unlock(&chip->i2c_lock);
>         if (ret) {
>                 dev_err(dev, "Failed to restore register map: %d\n", ret);
>                 return ret;
> --
> 2.34.1
>

Good catch, applied for fixes, thanks!

Bart
