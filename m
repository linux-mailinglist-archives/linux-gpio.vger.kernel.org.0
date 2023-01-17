Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1095D66DA1E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 10:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236598AbjAQJj2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 04:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236751AbjAQJiw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 04:38:52 -0500
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8C42659A
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 01:36:22 -0800 (PST)
Received: by mail-vk1-xa36.google.com with SMTP id z190so14509722vka.4
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 01:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YEbNl1l/q4Fnu+8d9D+L62Z+w9les95RQo/Y5UcOKmQ=;
        b=RYij5spKeMtkBOpNHssp3ONvhFkceeFvNz3fqOShvMXrR+moIc7foFfbOrgCPGIKxC
         jeiM/kGIIH5dh91GeGlziAbxHDGiHvP8j+XXSSwvT4Mn11lmIT9ZlDuTyg4bunLXMI9p
         kfc8kHnNyE05triUJs41SFuoOOlwNoml9lRiN0RjE550EeWYDQEzj1+1rCv3b15ms3Ix
         xAS8VKWkB2WAYEqfjNfM99Fin5MrmZW1OcKGp89MlJyCoj7zv4x7Q0Cu6HMa4SBNWfgc
         nSEycrzdMg6K7stfVnoYV+CU4UXKs2f2pI1Q1EkkFUsj3ydRLxYgCL3beixd4sLUiFmn
         GqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEbNl1l/q4Fnu+8d9D+L62Z+w9les95RQo/Y5UcOKmQ=;
        b=V5oUDS/Ar8+0E0anv/jq1+1Xr8FL77mHDsjy2vFOQgRihAeZDtnCDuO6cuL4nLjwcS
         RHyohHS/R4HGz8vZOWpRknbGa3KF9ig7EkAmzpYxdLZh8UkgXC1fBr57SHjlsWv4nnMA
         1gQq5GO6mnf3V+nN4kL8y9Pf81GvONUveKBCuVLDO2g77XjP96vbvPECHj/YCSuUhQ2R
         BWPirwR4yNz3lTzSspMUgkbIE4PFNOPI0xGDLWi9g1uAGa4fNxJbHBWc9Rb6F4OLdXW6
         F6yuYnCja8pw82l91TPxev/Vm1mBMbuKZHjRikw/5mw5BWDrLy2aSuotiTNr7RiYn+K1
         Sp7w==
X-Gm-Message-State: AFqh2kpCZJyGGfTrp7W36BrvFz7GROzwI87dHFZknJ3vl5O9nfOuSHTD
        2ohviueQgUJHZrO77bgWHHp5iR4042tuZ0PAPvCJXw==
X-Google-Smtp-Source: AMrXdXvFwOQaYs/Ay+3F1maDF78qpOzI1mjjG4wUYiCyM/jJ5K/LxlMb0q2ZshdBRTKrkY+Xo+w3C/brLvsCHDQfG5g=
X-Received: by 2002:a1f:91d4:0:b0:3db:104:6d13 with SMTP id
 t203-20020a1f91d4000000b003db01046d13mr329321vkd.25.1673948181819; Tue, 17
 Jan 2023 01:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20230116140811.27201-1-pierluigi.p@variscite.com>
In-Reply-To: <20230116140811.27201-1-pierluigi.p@variscite.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Jan 2023 10:36:11 +0100
Message-ID: <CAMRc=MfeQ_92Vb6inv-1_h=kc1d2as6LLPqJHHtbNk1pK1xRuA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix linker errors when GPIOLIB is disabled
To:     Pierluigi Passaro <pierluigi.p@variscite.com>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, eran.m@variscite.com,
        nate.d@variscite.com, francesco.f@variscite.com,
        pierluigi.passaro@gmail.com, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 16, 2023 at 3:08 PM Pierluigi Passaro
<pierluigi.p@variscite.com> wrote:
>
> Both the functions gpiochip_request_own_desc and
> gpiochip_free_own_desc are exported from
>     drivers/gpio/gpiolib.c
> but this file is compiled only when CONFIG_GPIOLIB is enabled.
> Move the protototypes under "#ifdef CONFIG_GPIOLIB" and provide
> reasonable definitions in the "#else" branch.
>
> Signed-off-by: Pierluigi Passaro <pierluigi.p@variscite.com>
> Reported-by: kernel test robot <lkp@intel.com>

Please add a Fixes tag.

Bart

> ---
>  include/linux/gpio/driver.h | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 44783fc16125..ed77c6fc0beb 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -758,6 +758,8 @@ gpiochip_remove_pin_ranges(struct gpio_chip *gc)
>
>  #endif /* CONFIG_PINCTRL */
>
> +#ifdef CONFIG_GPIOLIB
> +
>  struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
>                                             unsigned int hwnum,
>                                             const char *label,
> @@ -765,8 +767,6 @@ struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
>                                             enum gpiod_flags dflags);
>  void gpiochip_free_own_desc(struct gpio_desc *desc);
>
> -#ifdef CONFIG_GPIOLIB
> -
>  /* lock/unlock as IRQ */
>  int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset);
>  void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
> @@ -776,6 +776,22 @@ struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
>
>  #else /* CONFIG_GPIOLIB */
>
> +static inline struct gpio_desc *gpiochip_request_own_desc(struct gpio_chip *gc,
> +                                           unsigned int hwnum,
> +                                           const char *label,
> +                                           enum gpio_lookup_flags lflags,
> +                                           enum gpiod_flags dflags)
> +{
> +       /* GPIO can never have been requested */
> +       WARN_ON(1);
> +       return ERR_PTR(-ENODEV);
> +}
> +
> +static inline void gpiochip_free_own_desc(struct gpio_desc *desc)
> +{
> +       WARN_ON(1);
> +}
> +
>  static inline struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
>  {
>         /* GPIO can never have been requested */
> --
> 2.37.2
>
