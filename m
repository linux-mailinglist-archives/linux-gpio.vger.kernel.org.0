Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5033F63D908
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Nov 2022 16:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiK3PQ0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Nov 2022 10:16:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiK3PQX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Nov 2022 10:16:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21BE50D70;
        Wed, 30 Nov 2022 07:16:18 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 267F92D8;
        Wed, 30 Nov 2022 16:16:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669821376;
        bh=fcLKTz04onGn4r5iJeUduLq5YsbfsH4BTCp2/8vsD/M=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=e8HZviiYKPvCvXndr5/WLH4KoyF7XKz+8E3o65KYlZACyRlUj2F43jNhcG5C3RKHv
         CDKhcRVvN3oeHfXgvRXbl/Hn0Msnf+4Xh34hQrzkdfJVYMeRDm+3nhZyLcJCk6WqHe
         lZeRo++B3kyUDP0I/Y32H+lBbi/o3KGEhMA59tek=
Message-ID: <2621519a-365d-6dfc-f09b-eb8bfc648543@ideasonboard.com>
Date:   Wed, 30 Nov 2022 15:16:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] gpio: tps68470: Fix tps68470_gpio_get() reading from
 the wrong register
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
 <20221128214408.165726-2-hdegoede@redhat.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221128214408.165726-2-hdegoede@redhat.com>
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
> For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
> so that the actual value of the pin is read, rather then the value the pin
> would output when put in output mode.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>


Good spot:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>


Just building the series to test it too

> ---
>   drivers/gpio/gpio-tps68470.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> index aaddcabe9b35..778a72cf800c 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -30,7 +30,7 @@ static int tps68470_gpio_get(struct gpio_chip *gc, unsigned int offset)
>   {
>   	struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
>   	struct regmap *regmap = tps68470_gpio->tps68470_regmap;
> -	unsigned int reg = TPS68470_REG_GPDO;
> +	unsigned int reg = TPS68470_REG_GPDI;
>   	int val, ret;
>   
>   	if (offset >= TPS68470_N_REGULAR_GPIO) {
