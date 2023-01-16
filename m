Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5700C66BA7B
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jan 2023 10:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbjAPJfT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Jan 2023 04:35:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232319AbjAPJfO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2023 04:35:14 -0500
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513F818B0D
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:35:08 -0800 (PST)
Received: by mail-ua1-x92b.google.com with SMTP id z13so5750098uav.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Jan 2023 01:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fzVoMIU5yZxhhhcv7+w++/y6p+MZy0p2+9qccUZAxPY=;
        b=X7x/+hhX2INfPG3RI8TXxg06zm5tGqT+L7mV2NqEXu0rwd7D0Z6btahIrvTMbicZXR
         qV2a8r7LA8uQTSA9GY6N271tOvKmeKqhySEUqBlsPgRsAloD4OmaXABhtilm+V/oW5Zj
         /R5vex+0hBV/Orc9StnGzEiGvMyB3wtNtu/b9ZxEQTA4nspPS7K4XbaNSCOcTfmti3Fs
         3jJk6PZR07Mx9ipljffyPtCgydrpCg9UMqmaUJLFJJI2MQNrzk8T9bXioDhW1xTmU2Tl
         NPZ4cPbc1wS77TAo5rAc4rpEVAjUKHOMBSFQkYRjvzikbem+hfWlgyG3igSO8DIH4MgB
         pJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzVoMIU5yZxhhhcv7+w++/y6p+MZy0p2+9qccUZAxPY=;
        b=4t+tnLMxoqhnG376AREL1b2t0SIQm0gZgE6sbHdUCBvsKUMnBLylwIOktTamGpS8qs
         1gZhM5rrq2kCty8AdMR8I4mmCrAJsAoRKlgOaSkTRD8zXTU35fTfDwlDHnYr+FymvKHG
         5PIAuge6N7mCSl9krXCNSygTCv1eSUljwwX16CSwr3w0QQTsOO7TJNBuEZlPd629uNCk
         LRG6sGkFAkcGp1tUIi9d/t3naLOOQTQedqCSxJNrt90NOZyGLDnbZQVPk3+SfqpH6RFr
         R7JhOw2+r3iymC+g+FnU2e1jNgT9sCDf3iYH8OmdY4Znmu22jFA3/BkGm99Xz4gZG3Hj
         i0cQ==
X-Gm-Message-State: AFqh2kp9q0pnVp2nudVBdAnD6PhwV6G4ktGrpCmpKctKPZChqIfxmuY5
        BLJMTUamsDtdCqNWe14tMrVEP5ER4yGfl5phGuShq5rktOhssA==
X-Google-Smtp-Source: AMrXdXsTS+cNw2OieuYDCGotVaiHhxT/MmnC+Vb/6h05YYPTcorxZBOp4/HqjNXtPcL36Z6s0rss/4ego31psNPNA+k=
X-Received: by 2002:ab0:5a49:0:b0:424:e8b8:7bcb with SMTP id
 m9-20020ab05a49000000b00424e8b87bcbmr10143161uad.123.1673861707545; Mon, 16
 Jan 2023 01:35:07 -0800 (PST)
MIME-Version: 1.0
References: <20230113171051.19309-1-andriy.shevchenko@linux.intel.com> <20230113171051.19309-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230113171051.19309-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 16 Jan 2023 10:34:56 +0100
Message-ID: <CAMRc=MdzeWN85paaoVPDHTo4==d-6ZBQZetRHw5o+TNMfa3bBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Revert "gpiolib: of: Introduce hook for missing gpio-ranges"
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <stefan.wahren@i2se.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 13, 2023 at 6:14 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> This reverts commit 3550bba25d5587a701e6edf20e20984d2ee72c78.
>
> No users for this one, revert it for good.
> The ->add_pin_ranges() can be used instead.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: made it as a pure revert
>  drivers/gpio/gpiolib-of.c   |  5 -----
>  include/linux/gpio/driver.h | 12 ------------
>  2 files changed, 17 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 72d8a3da31e3..266352b1a966 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -980,11 +980,6 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
>         if (!np)
>                 return 0;
>
> -       if (!of_property_read_bool(np, "gpio-ranges") &&
> -           chip->of_gpio_ranges_fallback) {
> -               return chip->of_gpio_ranges_fallback(chip, np);
> -       }
> -
>         group_names = of_find_property(np, group_names_propname, NULL);
>
>         for (;; index++) {
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index ddc7a14a274f..5ab50ba3c309 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -521,18 +521,6 @@ struct gpio_chip {
>          */
>         int (*of_xlate)(struct gpio_chip *gc,
>                         const struct of_phandle_args *gpiospec, u32 *flags);
> -
> -       /**
> -        * @of_gpio_ranges_fallback:
> -        *
> -        * Optional hook for the case that no gpio-ranges property is defined
> -        * within the device tree node "np" (usually DT before introduction
> -        * of gpio-ranges). So this callback is helpful to provide the
> -        * necessary backward compatibility for the pin ranges.
> -        */
> -       int (*of_gpio_ranges_fallback)(struct gpio_chip *gc,
> -                                      struct device_node *np);
> -
>  #endif /* CONFIG_OF_GPIO */
>  };
>
> --
> 2.39.0
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
