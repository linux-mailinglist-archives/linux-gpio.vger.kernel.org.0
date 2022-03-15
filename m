Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8964D9E7C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 16:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236643AbiCOPSv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Mar 2022 11:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235955AbiCOPSu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Mar 2022 11:18:50 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666D14F9F9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 08:17:38 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id bg10so42181569ejb.4
        for <linux-gpio@vger.kernel.org>; Tue, 15 Mar 2022 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dDXtAcaGXcR/nfrWQlc7hNM+I7naCElqxub+m+Puj6I=;
        b=G1sk5jkULqK6wfDYjDH2/UvPo4wcKfni/lM1kKAVIE5gO2hv7iiXpLfPLE6R+P5BJj
         vY/WX33W6nCmcDiMDmoTobVL5qYOpTK7B6X9RRl0wviPsHoXB+GPCrSxEouIk6Zn5Sv7
         3xGo/OU2zzih6a6pCtEoy067ZmfXqwoWmxtuVaGPdyeD8xScStWNf6ps6ak5XceIvfXz
         JhcCJfU4Zz93y/qEtUQuu144nG75IJGwYGpxBMmiL6kGPZeLCvZjpt1xWyvBCzA+mjJ7
         xcLysijoWuSck+0CD1/PdxoXvyaZUb5CYR54yUCKzBKJNIl1UZDN7bWWMI88G/fDV3/G
         164Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dDXtAcaGXcR/nfrWQlc7hNM+I7naCElqxub+m+Puj6I=;
        b=AMY1y2FjuEg+xVCFegfzBATVhJ6ODzSs9FD0c2898f+4esdEcsR9cFqA3s4YegB6IT
         2hsnESjo2xcb9HLL+4MdqTiHvRe7mQ8AF7RL+cHMXp7ZbDMxybHbDZxYz9omNk08syC+
         BT0P4HEzP/vtVnOTM6Jj12juNvo4LLdicAg4hIwhzaquQxZ+dvkW9AHr6/Hv1ClJraZu
         JROVfgOujVVr7KSxilw6LlDvuZOdbQjrnP1QopvP761D2QWgNaE5GaRXmuaEBIm8z4YE
         6PL//td/c160msDGJf2YqmnID2gXwbIFwNvszsW8/WHzqEp6Osu7vwJcgoC10QMo/twf
         11UQ==
X-Gm-Message-State: AOAM5311djglMQsuhnOqL8+GK7QJSTKWjjpAK6SiKMDCAKPgZGT7zz5T
        vESYF8HRkFyZmiFhV/4mDfkJQDcSnSAGZEGWffIctQ==
X-Google-Smtp-Source: ABdhPJzRhsyb2Ojn+24Z9MFt8unIp1UKOxfx0sn2rkoB96Jp7HeMj9jUVV9fCuvDMllY3N5UHDbg7zYIW7d5+tqpkCI=
X-Received: by 2002:a17:906:6a24:b0:6db:ad7b:9066 with SMTP id
 qw36-20020a1709066a2400b006dbad7b9066mr16946441ejc.697.1647357456851; Tue, 15
 Mar 2022 08:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <1646855026-9132-1-git-send-email-stefan.wahren@i2se.com> <1646855026-9132-2-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1646855026-9132-2-git-send-email-stefan.wahren@i2se.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Mar 2022 16:17:26 +0100
Message-ID: <CAMRc=MeenhStqP0t8tSGcmhcjbHX8c3jUPTKQPS7jTzKta+vEw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] gpiolib: of: Introduce hook for missing gpio-ranges
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Phil Elwell <phil@raspberrypi.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 9, 2022 at 8:44 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Since commit 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
> the device tree nodes of GPIO controller need the gpio-ranges property to
> handle gpio-hogs. Unfortunately it's impossible to guarantee that every new
> kernel is shipped with an updated device tree binary.
>
> In order to provide backward compatibility with those older DTB, we need a
> callback within of_gpiochip_add_pin_range() so the relevant platform driver
> can handle this case.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  drivers/gpio/gpiolib-of.c   |  5 +++++
>  include/linux/gpio/driver.h | 12 ++++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 91dcf2c..45b6edb 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -933,6 +933,11 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
>         if (!np)
>                 return 0;
>
> +       if (!of_property_read_bool(np, "gpio-ranges") &&
> +           chip->of_gpio_ranges_fallback) {
> +               return chip->of_gpio_ranges_fallback(chip, np);
> +       }
> +
>         group_names = of_find_property(np, group_names_propname, NULL);
>
>         for (;; index++) {
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index b0728c8..47a5ea0 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -489,6 +489,18 @@ struct gpio_chip {
>          */
>         int (*of_xlate)(struct gpio_chip *gc,
>                         const struct of_phandle_args *gpiospec, u32 *flags);
> +
> +       /**
> +        * @of_gpio_ranges_fallback
> +        *
> +        * Optional hook for the case that no gpio-ranges property is defined
> +        * within the device tree node "np" (usually DT before introduction
> +        * of gpio-ranges). So this callback is helpful to provide the
> +        * necessary backward compatibility for the pin ranges.
> +        */
> +       int (*of_gpio_ranges_fallback)(struct gpio_chip *gc,
> +                                      struct device_node *np);
> +
>  #endif /* CONFIG_OF_GPIO */
>  };
>
> --
> 2.7.4
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
