Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3224A5FC3C1
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Oct 2022 12:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiJLKa1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Oct 2022 06:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiJLKa0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Oct 2022 06:30:26 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F11D45F55
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 03:30:23 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id j16so25574046wrh.5
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2022 03:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qu0VT1cU4p+B62cqisN42qlK73dW1LvJqZOVJmFr5q4=;
        b=LN7tGr68c1Kko6MPfvrDbyLOBVHPl1lH3XqcwNI+js8HOzSqomXdnH0yl9rzGuutAP
         q/lADkCqzpdj3i/7l4inV4fIMJLQiZfuIsenLf2NvZr02beIjchyEdmQxYmgIzNfWijK
         iqbJ+1zKb/tm2GAOj9+suV1csz7Niip+qJBAZv9BqFnrWhY2tKg1mQDs3JYbUE9ykiGO
         jNWwvTjw12A9Uqyr4xvMIdtDH+ITwbsbGQ4MjdKcpXb59neyaoZl51XNQT3rV9I2StkS
         T5zv7oj3ZQ/F/gGgKTNMJv3dzTQAqTxI3X/re/NMR/io+lDgVZrFOZUJ5fF86Wo0i+9u
         3x5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qu0VT1cU4p+B62cqisN42qlK73dW1LvJqZOVJmFr5q4=;
        b=1oIiMotBflSXba8zZ+YfhHvGEy4uSAuh8B5o+Mm8XIAS2edVK5QT1MixQRGm93C3h7
         oFiVThV09yQkAgE1C5I0Gt7YGAQsQ6IitrvAa1zes+Zyg966NEQoU9qSFIvj+8Wq8sjr
         AmRckeQsKqxXabmad03XeDNEaS2VjVYXejL+fp3+7KpeZWBrIWHEFGqwZVpF3kQN5m+v
         74Qr9LuQfLJY0z7B2IyX38XD8fjRNVfiHxSsFdTV6dtQzFBFK/KaQkJ96HHl2bXmgcWw
         HfDTIyOMyExUzss678Z5jQo2UWTNykfMOVo4XaLzTOCCRdWZSv1BqnuaFJvPO6f6tRZp
         /WIg==
X-Gm-Message-State: ACrzQf2b0MZlTaHKMjXX7iL9E+ewftvWEeV3VR6v0ve89v3VlbPkvdHo
        8oCEwl7Vj56f6bN/9L9iov4uYkpEzJNIrzSW
X-Google-Smtp-Source: AMsMyM6SMfhbUpOAoKh61uohQ9F30hK8tkk8XwsgcmYbLOawFsON935JP9StXGyYmnecjJF7fu2S3Q==
X-Received: by 2002:a05:6000:4c:b0:22e:48e0:1a0b with SMTP id k12-20020a056000004c00b0022e48e01a0bmr18204805wrx.618.1665570621954;
        Wed, 12 Oct 2022 03:30:21 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003a4efb794d7sm1417335wms.36.2022.10.12.03.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 03:30:21 -0700 (PDT)
Date:   Wed, 12 Oct 2022 11:30:19 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/7] gpiolib: of: add a quirk for reset line for Cirrus
 CS42L56 codec
Message-ID: <Y0aXO6i87PE8hyBo@maple.lan>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
 <20221011-gpiolib-quirks-v1-5-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v1-5-e01d9d3e7b29@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 11, 2022 at 03:19:33PM -0700, Dmitry Torokhov wrote:
> The controller is using non-standard "cirrus,gpio-nreset" name for its
> reset gpio property, whereas gpiod API expects "<name>-gpios".
> Add a quirk so that gpiod API will still work on unmodified DTSes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpio/gpiolib-of.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index 7d4193fe36e5..953d1c23950a 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -407,6 +407,9 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
>  		{ "wlf,ldo1ena", NULL,		NULL }, /* WM8994 */
>  		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
>  #endif
> +#if IS_ENABLED(CONFIG_SND_SOC_CS42L56)
> +		{ "reset",	"cirrus,gpio-nreset",	"cirrus,cs42l56" },
> +#endif

Same question as before about bindings maintainance but other than that:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
