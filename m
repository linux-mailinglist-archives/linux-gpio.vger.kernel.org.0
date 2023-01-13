Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF42669BEC
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jan 2023 16:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbjAMP0e (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Jan 2023 10:26:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbjAMP0L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Jan 2023 10:26:11 -0500
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4478D4ECB7
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 07:18:29 -0800 (PST)
Received: by mail-vk1-xa2f.google.com with SMTP id v81so10335872vkv.5
        for <linux-gpio@vger.kernel.org>; Fri, 13 Jan 2023 07:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rVtN3K9mnpeDZHFf7lev4Sj9elnbL+XiynQF7HQce4M=;
        b=Cik0XGAFoR5TWFWC6vud1pQ/7F3ZC/4yXfYRlm7rPH+zzWz7wKgMmtJSYf0/YkoW69
         meineUAPaf0mwXDzQoiTRxEqVwwWDq46e0NT0ZJ6KlxbckCxexE8tpJQ43vz37JA+TOy
         URFuXGbhHgdpDNp18mNTMgXiKNgmxCs9vzs8MBP76EjLH5ohCMREJiMZ0xcBqbK1V+kK
         P/Zp/u8BMCrOXyRHeOJ6atM88AJxKPfCgit5NA40WbLbORBXfx5HXQFQyfg1RdmpsWq+
         ZZHJhISNiTVdAAHK2orsO0oOSxRYkgaQDD3QEuKBEpyaOELNPFPcdo6+sKRO1lI05RLl
         yAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVtN3K9mnpeDZHFf7lev4Sj9elnbL+XiynQF7HQce4M=;
        b=NEaraf8R0SF8inDjN4z++ZVvwSemKAw3G/8KExP4qyu1MysUDA05zsHmKbfwllRsg3
         IAJw60dS7np3+7dij8Uv83I4pZ9FDcwwhRg2za8o5ytPXGkRGHvUYF0MB4NCf05AVRvu
         KH8gZafbJLufqrCJo4Kd5YqqGybz00vF4zB/6Y/gMGis2ZiupTBSl3wlImuhivHV7UPf
         gxhwLWBtFX4vCbKjjuhRwW2y5Uq1GcBeigyZybp4ka2CRI3Ve+JNxKko7xIxRYmUhVke
         xQ0Eb8Qrsn9TmRoVmk9vOf34ELD19ZcutxSgt3/wmTL4w8aTVKudFsreBHuGM4yWzcYG
         HG6A==
X-Gm-Message-State: AFqh2ko2MpFB8tcss+HvQlUqx3QvKSyGJiJ5yvWlbEjTDB+NFrU0H1R4
        ZogzjwC7n2eIogD+24FcomtgUSDFDqBUKL3EvEhTdg==
X-Google-Smtp-Source: AMrXdXvockga8iZEgIHNW2j1FyU0XR2H2L/Hb4GTKyAiwlS8C0vNvOP+VpqEt9X1+Wg3Qf21rkumD27oqr4mSsbt09Q=
X-Received: by 2002:a1f:324a:0:b0:3db:138f:3502 with SMTP id
 y71-20020a1f324a000000b003db138f3502mr716112vky.28.1673623108336; Fri, 13 Jan
 2023 07:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20230112134645.59232-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230112134645.59232-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 13 Jan 2023 16:18:17 +0100
Message-ID: <CAMRc=Mc791ZKZziZQu_c1YhphqH6yXtyYzpsw2UCRFbs5OhdKg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: davinci: Do not mention legacy API in the code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Devarsh Thakkar <devarsht@ti.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 12, 2023 at 2:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Replace mentioning of legacy API by the latest one.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpio-davinci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index fa51a91afa54..e1c1b9a527db 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -534,7 +534,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
>         }
>
>         /*
> -        * Arrange gpio_to_irq() support, handling either direct IRQs or
> +        * Arrange gpiod_to_irq() support, handling either direct IRQs or
>          * banked IRQs.  Having GPIOs in the first GPIO bank use direct
>          * IRQs, while the others use banked IRQs, would need some setup
>          * tweaks to recognize hardware which can do that.
> --
> 2.39.0
>

Applied, thanks!

Bart
