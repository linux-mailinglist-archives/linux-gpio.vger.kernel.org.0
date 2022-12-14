Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87CCD64C552
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Dec 2022 09:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237808AbiLNIyW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Dec 2022 03:54:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237450AbiLNIyV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Dec 2022 03:54:21 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D344193E5
        for <linux-gpio@vger.kernel.org>; Wed, 14 Dec 2022 00:54:20 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id k185so17200632vsc.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Dec 2022 00:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JXjEWuax68qWKJcttENVw+XN0QPH0HkqIrN33AvDPB8=;
        b=SeudXmB1MMQoKP1vWQUJF+Ghoir7e32kxGwbVDSWlp7nYEbvnt2uFsoTbtPmXUWKqK
         M3BC5RkOv+9lAkAWwqsvLR6nlaVIZB5YHRqNsj2lrrvIFm33bPthdHd1cZbjNAyKNZUL
         6BKgCyKGtafJ1RtkaEKf9oP+zntDKis+yOHRPi4+eQdniRWAVUNc5N1dMDutdhlNzkOU
         m/NVCDzp3fB2coymE7b/DlrepSIW8vkkmlY4Cw9+A/VKBQZSWFwui44C6ToQnmjJClCs
         yXytboF5ZMBUEUa3JWZURpydrB6By60/n+EY/1sdH7KsdqSV4ZdZzlX7VyvsLVXMXoZT
         OLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JXjEWuax68qWKJcttENVw+XN0QPH0HkqIrN33AvDPB8=;
        b=v93TbXoW0c8pUVjTTS/kyVnevJXqSCQcXvR5RSlwZ5VVYtb9v3wuX3LL//jZNnnQ7e
         3BGNKAr6/HH9LCfqyXj273eWjTfSNYJcdwO9AcP5m+ifDEtYkNwe0nnBNiEovf98QX2v
         0BgZwkrMf1az/9ncEV52M5vNK8W9iS86xikPCa1nI6kMwYFfqmkjR/M5m+n+E3PdW2D7
         +paz2tX8QpQj2ivw17mvf+hBMHYbtRTAQnxkWXmdjiMXPTNv4gNGnEUeYoi1yJcfWHPZ
         z6EdMWdiDZ5c6sJAEngz1qim4rtXLOH8QODifjvCavU+JotmU7E4QnSZClPj9R0N+Fy3
         fIEQ==
X-Gm-Message-State: ANoB5plEOUGMd17QzRokq9SWdrf9n8zNloGdlsmLW0A74q1AAVqCXT2m
        GdO7zloJfX5AG06jw8HgEV98HVoTGEt9LIdzxBw2nw==
X-Google-Smtp-Source: AA0mqf5Qi64j7EBBegzHu3WIzrlfAQ9x/VClcG1ccOHk09fQHOuRdWCIsCZqS7aJVtdAQycKSPIZtIDkQfua/FWkbf8=
X-Received: by 2002:a67:fc4b:0:b0:3b1:298c:45f9 with SMTP id
 p11-20020a67fc4b000000b003b1298c45f9mr13688545vsq.61.1671008059323; Wed, 14
 Dec 2022 00:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20221212130748.443416-1-brgl@bgdev.pl>
In-Reply-To: <20221212130748.443416-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 14 Dec 2022 09:54:08 +0100
Message-ID: <CAMRc=MdhuQHcnWyjn5xGto219f7T7jR9XQ8KtmcZhnp63ZkiLQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: set a limit on the number of GPIOs
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 12, 2022 at 2:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With the removal of ARCH_NR_GPIOS in commit 7b61212f2a07 ("gpiolib: Get
> rid of ARCH_NR_GPIOS") the gpiolib core no longer sanitizes the number
> of GPIOs for us. This causes the gpio-sim selftests to now fail when
> setting the number of GPIOs to 99999 and expecting the probe() to fail.
>
> Set a sane limit of 1024 on the number of simulated GPIOs and bail out
> of probe if it's exceeded.
>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Link: https://lore.kernel.org/oe-lkp/202212112236.756f5db9-oliver.sang@intel.com
> Fixes: 7b61212f2a07 ("gpiolib: Get rid of ARCH_NR_GPIOS")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-sim.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index 1020c2feb249..60514bc5454f 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -31,6 +31,7 @@
>
>  #include "gpiolib.h"
>
> +#define GPIO_SIM_NGPIO_MAX     1024
>  #define GPIO_SIM_PROP_MAX      4 /* Max 3 properties + sentinel. */
>  #define GPIO_SIM_NUM_ATTRS     3 /* value, pull and sentinel */
>
> @@ -371,6 +372,9 @@ static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
>         if (ret)
>                 return ret;
>
> +       if (num_lines > GPIO_SIM_NGPIO_MAX)
> +               return -ERANGE;
> +
>         ret = fwnode_property_read_string(swnode, "gpio-sim,label", &label);
>         if (ret) {
>                 label = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
> --
> 2.37.2
>

Applied this, as it needs to go into the big PR for this merge window.

Bart
