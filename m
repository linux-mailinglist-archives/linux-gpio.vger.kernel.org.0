Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24425210476
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 09:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgGAHF5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jul 2020 03:05:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:57612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727969AbgGAHF4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 1 Jul 2020 03:05:56 -0400
Received: from sekiro (lfbn-mar-1-814-213.w92-150.abo.wanadoo.fr [92.150.24.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B255120663;
        Wed,  1 Jul 2020 07:05:44 +0000 (UTC)
Date:   Wed, 1 Jul 2020 09:05:35 +0200
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Andrei Stefanescu <andrei.stefanescu@microchip.com>
Subject: Re: [PATCH 05/10] gpio: gpio-sama5d2-piobu: Demote all kerneldoc
 headers to basic comment blocks
Message-ID: <20200701070535.stnl53wxyez6hcpt@sekiro>
References: <20200630133345.2232932-1-lee.jones@linaro.org>
 <20200630133345.2232932-6-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630133345.2232932-6-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 30, 2020 at 02:33:40PM +0100, Lee Jones wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> No attempt has been made to provide proper descriptions for each of
> the function arguments throughout the file.  Simply demote all
> kerneldoc headers to basic function headers.
> 
> Fixes the following W=1 kernel build warnings:
> 
>  drivers/gpio/gpio-sama5d2-piobu.c:59: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_setup_pin'
>  drivers/gpio/gpio-sama5d2-piobu.c:59: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_setup_pin'
>  drivers/gpio/gpio-sama5d2-piobu.c:81: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_write_value'
>  drivers/gpio/gpio-sama5d2-piobu.c:81: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_write_value'
>  drivers/gpio/gpio-sama5d2-piobu.c:81: warning: Function parameter or member 'mask' not described in 'sama5d2_piobu_write_value'
>  drivers/gpio/gpio-sama5d2-piobu.c:81: warning: Function parameter or member 'value' not described in 'sama5d2_piobu_write_value'
>  drivers/gpio/gpio-sama5d2-piobu.c:97: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_read_value'
>  drivers/gpio/gpio-sama5d2-piobu.c:97: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_read_value'
>  drivers/gpio/gpio-sama5d2-piobu.c:97: warning: Function parameter or member 'mask' not described in 'sama5d2_piobu_read_value'
>  drivers/gpio/gpio-sama5d2-piobu.c:116: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_get_direction'
>  drivers/gpio/gpio-sama5d2-piobu.c:116: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_get_direction'
>  drivers/gpio/gpio-sama5d2-piobu.c:131: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_direction_input'
>  drivers/gpio/gpio-sama5d2-piobu.c:131: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_direction_input'
>  drivers/gpio/gpio-sama5d2-piobu.c:140: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_direction_output'
>  drivers/gpio/gpio-sama5d2-piobu.c:140: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_direction_output'
>  drivers/gpio/gpio-sama5d2-piobu.c:140: warning: Function parameter or member 'value' not described in 'sama5d2_piobu_direction_output'
>  drivers/gpio/gpio-sama5d2-piobu.c:154: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_get'
>  drivers/gpio/gpio-sama5d2-piobu.c:154: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_get'
>  drivers/gpio/gpio-sama5d2-piobu.c:174: warning: Function parameter or member 'chip' not described in 'sama5d2_piobu_set'
>  drivers/gpio/gpio-sama5d2-piobu.c:174: warning: Function parameter or member 'pin' not described in 'sama5d2_piobu_set'
>  drivers/gpio/gpio-sama5d2-piobu.c:174: warning: Function parameter or member 'value' not described in 'sama5d2_piobu_set'
> 
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Andrei Stefanescu <andrei.stefanescu@microchip.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

Thanks.

> ---
>  drivers/gpio/gpio-sama5d2-piobu.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-sama5d2-piobu.c b/drivers/gpio/gpio-sama5d2-piobu.c
> index 4d47b2c411868..b7c9506581701 100644
> --- a/drivers/gpio/gpio-sama5d2-piobu.c
> +++ b/drivers/gpio/gpio-sama5d2-piobu.c
> @@ -49,7 +49,7 @@ struct sama5d2_piobu {
>         struct regmap *regmap;
>  };
> 
> -/**
> +/*
>   * sama5d2_piobu_setup_pin() - prepares a pin for set_direction call
>   *
>   * Do not consider pin for tamper detection (normal and backup modes)
> @@ -73,7 +73,7 @@ static int sama5d2_piobu_setup_pin(struct gpio_chip *chip, unsigned int pin)
>         return regmap_update_bits(piobu->regmap, PIOBU_WKPR, mask, 0);
>  }
> 
> -/**
> +/*
>   * sama5d2_piobu_write_value() - writes value & mask at the pin's PIOBU register
>   */
>  static int sama5d2_piobu_write_value(struct gpio_chip *chip, unsigned int pin,
> @@ -88,7 +88,7 @@ static int sama5d2_piobu_write_value(struct gpio_chip *chip, unsigned int pin,
>         return regmap_update_bits(piobu->regmap, reg, mask, value);
>  }
> 
> -/**
> +/*
>   * sama5d2_piobu_read_value() - read the value with masking from the pin's PIOBU
>   *                           register
>   */
> @@ -108,7 +108,7 @@ static int sama5d2_piobu_read_value(struct gpio_chip *chip, unsigned int pin,
>         return val & mask;
>  }
> 
> -/**
> +/*
>   * sama5d2_piobu_get_direction() - gpiochip get_direction
>   */
>  static int sama5d2_piobu_get_direction(struct gpio_chip *chip,
> @@ -123,7 +123,7 @@ static int sama5d2_piobu_get_direction(struct gpio_chip *chip,
>                                    GPIO_LINE_DIRECTION_OUT;
>  }
> 
> -/**
> +/*
>   * sama5d2_piobu_direction_input() - gpiochip direction_input
>   */
>  static int sama5d2_piobu_direction_input(struct gpio_chip *chip,
> @@ -132,7 +132,7 @@ static int sama5d2_piobu_direction_input(struct gpio_chip *chip,
>         return sama5d2_piobu_write_value(chip, pin, PIOBU_DIRECTION, PIOBU_IN);
>  }
> 
> -/**
> +/*
>   * sama5d2_piobu_direction_output() - gpiochip direction_output
>   */
>  static int sama5d2_piobu_direction_output(struct gpio_chip *chip,
> @@ -147,7 +147,7 @@ static int sama5d2_piobu_direction_output(struct gpio_chip *chip,
>                                          val);
>  }
> 
> -/**
> +/*
>   * sama5d2_piobu_get() - gpiochip get
>   */
>  static int sama5d2_piobu_get(struct gpio_chip *chip, unsigned int pin)
> @@ -166,7 +166,7 @@ static int sama5d2_piobu_get(struct gpio_chip *chip, unsigned int pin)
>         return !!ret;
>  }
> 
> -/**
> +/*
>   * sama5d2_piobu_set() - gpiochip set
>   */
>  static void sama5d2_piobu_set(struct gpio_chip *chip, unsigned int pin,
> --
> 2.25.1
> 
