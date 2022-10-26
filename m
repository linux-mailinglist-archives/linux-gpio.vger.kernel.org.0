Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9DDD60DE8D
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Oct 2022 12:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbiJZKEF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Oct 2022 06:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbiJZKEE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2022 06:04:04 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AAB692CCB;
        Wed, 26 Oct 2022 03:04:03 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id e15so10868011qvo.4;
        Wed, 26 Oct 2022 03:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uf4FZIHLXNcVhmDVuqHGonXKnws6A+ALw5fbszxjV/s=;
        b=Iuk5oFwTS5/v2JCr8eE5kUKh8TllEl4HBZPVMO0RKi6Zb2ozzEuVes7FQkmbt1xVGy
         g+dsWiAwMso3toK2DZEKtum96hOfq4y4NLQ/6y8oLEPiKGxRmzJZANS2U4cb/H81xTPj
         U2cFKiZmJVd+WMA0B3BZ0upbHCTfZiAGjQoI2KgGNQmLCZ1zjhtwWpVc2c6lwYTeQZkN
         qUZ5rTdCxGc5pakWvTo8qvcOr9K65v11WWBvIgIwvEgdWbAHTUgKgmcLWtcNVLhr9NUc
         Z02rfvCQGQHT1YKwj4fbynhYnn1iJ6UA5TkPBzxYWeXmSc2Qeb3t3yUfAb7eAIQS8O2a
         wgoA==
X-Gm-Message-State: ACrzQf133ckahD9WHVIOhcqDf8gDeQDzDfXQPvcf0Q+KvYaIDYWS2Q+e
        ErQKQWagqQM5u9/sWE3OU/yYLu90lSVW+w==
X-Google-Smtp-Source: AMsMyM5ToDP8bCeRu9DgT9BD+60tQYbleW/uKfnRHfFzsm3GQ0iu4swzzzDUoAZGw8a2gz1KozyAmg==
X-Received: by 2002:a05:6214:c27:b0:4bb:7a35:b344 with SMTP id a7-20020a0562140c2700b004bb7a35b344mr10410815qvd.29.1666778641798;
        Wed, 26 Oct 2022 03:04:01 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id d2-20020ac80602000000b0039853b7b771sm2881130qth.80.2022.10.26.03.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 03:04:01 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id o70so18168425yba.7;
        Wed, 26 Oct 2022 03:04:01 -0700 (PDT)
X-Received: by 2002:a25:d24a:0:b0:6ca:4a7a:75cd with SMTP id
 j71-20020a25d24a000000b006ca4a7a75cdmr28182120ybg.89.1666778641009; Wed, 26
 Oct 2022 03:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220930102259.21918-1-shubhrajyoti.datta@amd.com> <20220930102259.21918-4-shubhrajyoti.datta@amd.com>
In-Reply-To: <20220930102259.21918-4-shubhrajyoti.datta@amd.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Oct 2022 12:03:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZvnhUR04b0JexfeD7ijHgiv1jS9n4e1YcF-Zo895DwA@mail.gmail.com>
Message-ID: <CAMuHMdWZvnhUR04b0JexfeD7ijHgiv1jS9n4e1YcF-Zo895DwA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] gpio: pca9570: add slg7xl45106 support
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

On Fri, Sep 30, 2022 at 1:15 PM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:
> Dialog semiconductors SLG7XL45106 is an 8-bit I2C GPO expander.
> The output port is controlled by a data byte with register
> address. Add a compatible string for the same. Also update
> the driver to write and read from it.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>
> (no changes since v3)
>
> Changes in v3:
> split the new patch
> Suggested by Andy Shevchenko

Thanks for your patch, which is now commit 6a0411dc1f8694ce
("gpio: pca9570: add slg7xl45106 support") in gpio/gpio/for-next
linux-next/master next-20221026

> --- a/drivers/gpio/gpio-pca9570.c
> +++ b/drivers/gpio/gpio-pca9570.c

> @@ -116,7 +127,8 @@ static int pca9570_probe(struct i2c_client *client)
>         gpio->chip.get = pca9570_get;
>         gpio->chip.set = pca9570_set;
>         gpio->chip.base = -1;
> -       gpio->chip.ngpio = (uintptr_t)device_get_match_data(&client->dev);
> +       gpio->p_data = device_get_match_data(&client->dev);
> +       gpio->chip.ngpio = gpio->p_data->ngpio;

To avoid breakage during bisection, the change to initialize ngpio
should be moved into "[PATCH v5 2/3] gpio: pca9570: add a platform
data structure".

>         gpio->chip.can_sleep = true;
>
>         mutex_init(&gpio->lock);
> @@ -137,14 +149,21 @@ static const struct pca9570_platform_data pca9571_gpio = {
>         .ngpio = 8,
>  };
>
> +static const struct pca9570_platform_data slg7xl45106_gpio = {
> +       .ngpio = 8,
> +       .command = SLG7XL45106_GPO_REG,
> +};
> +
>  static const struct i2c_device_id pca9570_id_table[] = {
>         { "pca9570", (kernel_ulong_t)&pca9570_gpio},
>         { "pca9571", (kernel_ulong_t)&pca9571_gpio },
> +       { "slg7xl45106", (kernel_ulong_t)&slg7xl45106_gpio },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(i2c, pca9570_id_table);
>
>  static const struct of_device_id pca9570_of_match_table[] = {
> +       { .compatible = "dlg,slg7xl45106", .data = &slg7xl45106_gpio},
>         { .compatible = "nxp,pca9570", .data = &pca9570_gpio },
>         { .compatible = "nxp,pca9571", .data = &pca9571_gpio },
>         { /* sentinel */ }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
