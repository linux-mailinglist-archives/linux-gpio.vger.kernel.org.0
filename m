Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4299060DE83
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 12:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbiJZKA5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 06:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbiJZKAu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 06:00:50 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F833EA4B;
        Wed, 26 Oct 2022 03:00:48 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id h24so9484891qta.7;
        Wed, 26 Oct 2022 03:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8LvCK++n55cbxj2o8qBhHtjgRizigCkASGdE2lWyhM=;
        b=P0H2G9Bw9aYgFB+sd90mCYAF76WIuEVokenRH3n9J3eOlM27w7QV9P0DbXUZm2LEOl
         TciuFshQIlst0HNA7G9//rbbwtmFHaLXDQU6mzdEUD5hJIFkyTJDbWOUXq+UuJYKh23E
         Uax3XEHcfzDbuI61JFpsoE4CsRPtECUhiqQ7koG4JIVE0ewy/o5h4+fL7m59y365QDje
         Xn4vQseYYD2k/1RUsiBQ5faM9a25DKVWU6s+f0hah4HwgGdOHjogRCFkiHvbHTw9ry5X
         dVFR5hcT95uN0Jb13Zx2cDhgIlfoak0fpAu+C90yQA4TCLtBbbAw2VbflPRyjXAK/1Jm
         xkKQ==
X-Gm-Message-State: ACrzQf1EcG6Pyn5L3OXbnIlP5M2m5erBCWXfBP2cFzUO5634oPeV5nIQ
        nhhvkQ9zczntys8WJ1bFycOkoB1DDp5c9w==
X-Google-Smtp-Source: AMsMyM4N0ePC9nC4yucnVsR/eWn9oBQduhEEuqWyhF4o0nqvKX+0MRCiOhnhG6fs+E2P5Ql71ZmD4g==
X-Received: by 2002:a05:622a:3d2:b0:3a4:ecf9:1a2d with SMTP id k18-20020a05622a03d200b003a4ecf91a2dmr2481543qtx.589.1666778447043;
        Wed, 26 Oct 2022 03:00:47 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a25cd00b006e6a7c2a269sm3765408qko.22.2022.10.26.03.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 03:00:46 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id f205so18200191yba.2;
        Wed, 26 Oct 2022 03:00:46 -0700 (PDT)
X-Received: by 2002:a25:cd01:0:b0:6c2:6f0d:f4ce with SMTP id
 d1-20020a25cd01000000b006c26f0df4cemr36041683ybf.365.1666778446165; Wed, 26
 Oct 2022 03:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220930102259.21918-1-shubhrajyoti.datta@amd.com> <20220930102259.21918-3-shubhrajyoti.datta@amd.com>
In-Reply-To: <20220930102259.21918-3-shubhrajyoti.datta@amd.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Oct 2022 12:00:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUAcA=4Xcgr9hHgT5cro=s0mvAQqHmco0-e-NvWKJmrCA@mail.gmail.com>
Message-ID: <CAMuHMdUAcA=4Xcgr9hHgT5cro=s0mvAQqHmco0-e-NvWKJmrCA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: pca9570: add a platform data structure
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc:     linux-gpio@vger.kernel.org, git@amd.com,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Shubhrajyoti,

On Fri, Sep 30, 2022 at 12:41 PM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:
> Add struct pca9570_platform_data for adding the platform data
> structure. Also modify the existing structs for pca9570 and pca9571
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> split the new patch
> Suggested by Andy Shevchenko

Thanks for your patch, which is now commit 35a4bc94a47f2ea6 ("gpio:
pca9570: add a platform data structure") in gpio/gpio/for-next
linux-next/master next-20221026

> --- a/drivers/gpio/gpio-pca9570.c
> +++ b/drivers/gpio/gpio-pca9570.c
> @@ -15,6 +15,16 @@
>  #include <linux/mutex.h>
>  #include <linux/property.h>
>
> +/**
> + * struct pca9570_platform_data - GPIO platformdata
> + * @ngpio: no of gpios
> + * @command: Command to be sent
> + */
> +struct pca9570_platform_data {
> +       u16 ngpio;
> +       u32 command;
> +};
> +
>  /**
>   * struct pca9570 - GPIO driver data
>   * @chip: GPIO controller chip
> @@ -119,16 +129,24 @@ static int pca9570_probe(struct i2c_client *client)
>         return devm_gpiochip_add_data(&client->dev, &gpio->chip, gpio);
>  }
>
> +static const struct pca9570_platform_data pca9570_gpio = {
> +       .ngpio = 4,
> +};
> +
> +static const struct pca9570_platform_data pca9571_gpio = {
> +       .ngpio = 8,
> +};
> +
>  static const struct i2c_device_id pca9570_id_table[] = {
> -       { "pca9570", 4 },
> -       { "pca9571", 8 },
> +       { "pca9570", (kernel_ulong_t)&pca9570_gpio},
> +       { "pca9571", (kernel_ulong_t)&pca9571_gpio },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
>
>  static const struct of_device_id pca9570_of_match_table[] = {
> -       { .compatible = "nxp,pca9570", .data = (void *)4 },
> -       { .compatible = "nxp,pca9571", .data = (void *)8 },
> +       { .compatible = "nxp,pca9570", .data = &pca9570_gpio },
> +       { .compatible = "nxp,pca9571", .data = &pca9571_gpio },

This breaks bisection, as .data is still considered to be the number
of GPIOs:

    gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);


>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, pca9570_of_match_table);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
