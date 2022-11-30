Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBFE63DA29
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 17:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiK3QEj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 11:04:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiK3QEj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 11:04:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D724EC39;
        Wed, 30 Nov 2022 08:04:37 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD48855A;
        Wed, 30 Nov 2022 17:04:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669824275;
        bh=z+OtyC6ComNYR6b7H26z27lJ/WPYV8XQen6xTiq6ROk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=IVN7NAPzLP1x2UuastFQewC34wxQmT0w6ZbwUcaBnqTtnZyeTJzFLOb5+9bFkPfoB
         D+JPMfEV16IPAhI3zr7cUDzewN78yHbsfdObU1BmFs0G46LZMkwTpiFk4Lj1pkebYl
         xf/lm2lye5HPbZsPkX9uAjyo0xsNpZMDOMC/SZYU=
Message-ID: <0137a8bd-9fda-f1e4-8c59-d8c1dab8cf83@ideasonboard.com>
Date:   Wed, 30 Nov 2022 16:04:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] gpio: tps68470: Make tps68470_gpio_output() always
 set the initial value
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <20221128214408.165726-3-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221128214408.165726-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans

On 28/11/2022 21:44, Hans de Goede wrote:
> Make tps68470_gpio_output() call tps68470_gpio_set() for output-only pins
> too, so that the initial value passed to gpiod_direction_output() is
> honored for these pins too.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Tested-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
>   drivers/gpio/gpio-tps68470.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> index 778a72cf800c..2ca86fbe1d84 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -91,13 +91,13 @@ static int tps68470_gpio_output(struct gpio_chip *gc, unsigned int offset,
>   	struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
>   	struct regmap *regmap = tps68470_gpio->tps68470_regmap;
>   
> +	/* Set the initial value */
> +	tps68470_gpio_set(gc, offset, value);
> +
>   	/* rest are always outputs */
>   	if (offset >= TPS68470_N_REGULAR_GPIO)
>   		return 0;
>   
> -	/* Set the initial value */
> -	tps68470_gpio_set(gc, offset, value);
> -
>   	return regmap_update_bits(regmap, TPS68470_GPIO_CTL_REG_A(offset),
>   				 TPS68470_GPIO_MODE_MASK,
>   				 TPS68470_GPIO_MODE_OUT_CMOS);
