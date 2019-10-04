Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 967C0CBF75
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 17:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389925AbfJDPks (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 11:40:48 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35962 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389669AbfJDPks (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 11:40:48 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x94FegUm064337;
        Fri, 4 Oct 2019 10:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570203642;
        bh=8Uw4BaWTJ/JMRYE4H3EIyTb27/Mz3rYTHrq94zGOCes=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=O3OWUrG52lP0OWRvAaIW8qgRX0CREIRD1D+DzecMc/SBswdsqjCtcMrEHG/6k0ADu
         Qfuxgxl6EQ91WNq2gGd5ZFsnZYuGmIUeQNyx0nYB26/QogET3z8O7EPkn9kwDFuVKF
         UlCsc/44n2sS8Ji/EiSmeDtKlzerKkSckFVh7fis=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94Feg17007303;
        Fri, 4 Oct 2019 10:40:42 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 4 Oct
 2019 10:40:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 4 Oct 2019 10:40:41 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x94FefRx012362;
        Fri, 4 Oct 2019 10:40:41 -0500
Subject: Re: [PATCH] leds: gpio: support multi-level brightness
To:     Akinobu Mita <akinobu.mita@gmail.com>,
        <linux-leds@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
References: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <55a5ab0a-9a34-a7b0-cffe-9dab59f2c0ef@ti.com>
Date:   Fri, 4 Oct 2019 10:42:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Akinobu

On 10/4/19 10:34 AM, Akinobu Mita wrote:
> Currently, GPIO LED driver allows the GPIO properties to contain one GPIO
> phandle.  This enables to contain more than one GPIO phandle and the
> brightness of the LEDs is proportional to the number of active GPIOs.

How would this work with the Multicolor framework?

We have not adapted the GPIO LED driver to this yet so with this 
framework this patch may need to change.

https://lore.kernel.org/patchwork/project/lkml/list/?series=412400

Dan

> Describing multi-level brightness GPIO LED is only supported in DT.  It is
> not supported in ACPI and platform data.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>   drivers/leds/leds-gpio.c | 185 +++++++++++++++++++++++++++++++++++++----------
>   1 file changed, 147 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index a5c73f3..6fad64b 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -9,6 +9,7 @@
>   #include <linux/err.h>
>   #include <linux/gpio.h>
>   #include <linux/gpio/consumer.h>
> +#include <linux/of_gpio.h>
>   #include <linux/kernel.h>
>   #include <linux/leds.h>
>   #include <linux/module.h>
> @@ -19,7 +20,8 @@
>   
>   struct gpio_led_data {
>   	struct led_classdev cdev;
> -	struct gpio_desc *gpiod;
> +	int num_gpios;
> +	struct gpio_desc **gpios;
>   	u8 can_sleep;
>   	u8 blinking;
>   	gpio_blink_set_t platform_gpio_blink_set;
> @@ -35,23 +37,24 @@ static void gpio_led_set(struct led_classdev *led_cdev,
>   	enum led_brightness value)
>   {
>   	struct gpio_led_data *led_dat = cdev_to_gpio_led_data(led_cdev);
> -	int level;
> +	int i;
> +	int num_active_gpios =
> +		DIV_ROUND_UP(led_dat->num_gpios * value, LED_FULL);
>   
> -	if (value == LED_OFF)
> -		level = 0;
> -	else
> -		level = 1;
> +	for (i = 0; i < led_dat->num_gpios; i++) {
> +		int level = i < num_active_gpios ? 1 : 0;
>   
> -	if (led_dat->blinking) {
> -		led_dat->platform_gpio_blink_set(led_dat->gpiod, level,
> -						 NULL, NULL);
> -		led_dat->blinking = 0;
> -	} else {
> -		if (led_dat->can_sleep)
> -			gpiod_set_value_cansleep(led_dat->gpiod, level);
> +		if (led_dat->blinking)
> +			led_dat->platform_gpio_blink_set(led_dat->gpios[i],
> +							 level, NULL, NULL);
> +		else if (led_dat->can_sleep)
> +			gpiod_set_value_cansleep(led_dat->gpios[i], level);
>   		else
> -			gpiod_set_value(led_dat->gpiod, level);
> +			gpiod_set_value(led_dat->gpios[i], level);
>   	}
> +
> +	if (led_dat->blinking)
> +		led_dat->blinking = 0;
>   }
>   
>   static int gpio_led_set_blocking(struct led_classdev *led_cdev,
> @@ -65,10 +68,72 @@ static int gpio_blink_set(struct led_classdev *led_cdev,
>   	unsigned long *delay_on, unsigned long *delay_off)
>   {
>   	struct gpio_led_data *led_dat = cdev_to_gpio_led_data(led_cdev);
> +	int ret = 0;
> +	int i;
>   
>   	led_dat->blinking = 1;
> -	return led_dat->platform_gpio_blink_set(led_dat->gpiod, GPIO_LED_BLINK,
> +
> +	for (i = 0; i < led_dat->num_gpios && !ret; i++) {
> +		ret = led_dat->platform_gpio_blink_set(led_dat->gpios[i],
> +						GPIO_LED_BLINK,
>   						delay_on, delay_off);
> +	}
> +
> +	return ret;
> +}
> +
> +static enum led_brightness
> +gpio_led_brightness_get(struct gpio_led_data *led_dat)
> +{
> +	int num_active_gpios = 0;
> +	int i;
> +
> +	for (i = 0; i < led_dat->num_gpios; i++) {
> +		int ret = gpiod_get_value_cansleep(led_dat->gpios[i]);
> +
> +		if (ret < 0)
> +			return ret;
> +
> +		if (ret)
> +			num_active_gpios++;
> +	}
> +
> +	return LED_FULL * num_active_gpios / led_dat->num_gpios;
> +}
> +
> +static int gpio_led_set_default(struct gpio_led_data *led_dat,
> +				unsigned int default_state)
> +{
> +	enum led_brightness brightness;
> +	int num_active_gpios;
> +	int i;
> +
> +	if (default_state == LEDS_GPIO_DEFSTATE_KEEP) {
> +		brightness = gpio_led_brightness_get(led_dat);
> +		if (brightness < 0)
> +			return brightness;
> +	} else {
> +		if (default_state == LEDS_GPIO_DEFSTATE_ON)
> +			brightness = LED_FULL;
> +		else
> +			brightness = LED_OFF;
> +	}
> +
> +	led_dat->cdev.brightness = brightness;
> +
> +	num_active_gpios =
> +		DIV_ROUND_UP(led_dat->num_gpios * brightness, LED_FULL);
> +
> +	for (i = 0; i < led_dat->num_gpios; i++) {
> +		int state = i < num_active_gpios ? 1 : 0;
> +		int ret;
> +
> +		ret = gpiod_direction_output(led_dat->gpios[i], state);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>   }
>   
>   static int create_gpio_led(const struct gpio_led *template,
> @@ -76,10 +141,18 @@ static int create_gpio_led(const struct gpio_led *template,
>   	struct fwnode_handle *fwnode, gpio_blink_set_t blink_set)
>   {
>   	struct led_init_data init_data = {};
> -	int ret, state;
> +	int ret, i;
>   
>   	led_dat->cdev.default_trigger = template->default_trigger;
> -	led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
> +
> +	led_dat->can_sleep = true;
> +	for (i = 0; i < led_dat->num_gpios; i++) {
> +		if (!gpiod_cansleep(led_dat->gpios[i])) {
> +			led_dat->can_sleep = false;
> +			break;
> +		}
> +	}
> +
>   	if (!led_dat->can_sleep)
>   		led_dat->cdev.brightness_set = gpio_led_set;
>   	else
> @@ -89,14 +162,11 @@ static int create_gpio_led(const struct gpio_led *template,
>   		led_dat->platform_gpio_blink_set = blink_set;
>   		led_dat->cdev.blink_set = gpio_blink_set;
>   	}
> -	if (template->default_state == LEDS_GPIO_DEFSTATE_KEEP) {
> -		state = gpiod_get_value_cansleep(led_dat->gpiod);
> -		if (state < 0)
> -			return state;
> -	} else {
> -		state = (template->default_state == LEDS_GPIO_DEFSTATE_ON);
> -	}
> -	led_dat->cdev.brightness = state ? LED_FULL : LED_OFF;
> +
> +	ret = gpio_led_set_default(led_dat, template->default_state);
> +	if (ret)
> +		return ret;
> +
>   	if (!template->retain_state_suspended)
>   		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
>   	if (template->panic_indicator)
> @@ -104,10 +174,6 @@ static int create_gpio_led(const struct gpio_led *template,
>   	if (template->retain_state_shutdown)
>   		led_dat->cdev.flags |= LED_RETAIN_AT_SHUTDOWN;
>   
> -	ret = gpiod_direction_output(led_dat->gpiod, state);
> -	if (ret < 0)
> -		return ret;
> -
>   	if (template->name) {
>   		led_dat->cdev.name = template->name;
>   		ret = devm_led_classdev_register(parent, &led_dat->cdev);
> @@ -131,6 +197,30 @@ static inline int sizeof_gpio_leds_priv(int num_leds)
>   		(sizeof(struct gpio_led_data) * num_leds);
>   }
>   
> +static __maybe_unused const char * const gpio_suffixes[] = { "gpios", "gpio" };
> +
> +static int fwnode_gpio_count(struct fwnode_handle *child)
> +{
> +	char propname[32]; /* 32 is max size of property name */
> +	int i;
> +
> +	if (!child)
> +		return -EINVAL;
> +
> +	for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
> +		snprintf(propname, sizeof(propname), "%s",
> +			 gpio_suffixes[i]);
> +
> +		/* Only DT is supported for now */
> +		if (is_of_node(child))
> +			return of_gpio_named_count(to_of_node(child), propname);
> +		else
> +			return -EINVAL;
> +	}
> +
> +	return -ENOENT;
> +}
> +
>   static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -150,16 +240,28 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>   		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
>   		struct gpio_led led = {};
>   		const char *state = NULL;
> +		int i;
> +
> +		led_dat->num_gpios = fwnode_gpio_count(child);
> +		if (led_dat->num_gpios < 0)
> +			led_dat->num_gpios = 1;
>   
> -		led.gpiod = devm_fwnode_get_gpiod_from_child(dev, NULL, child,
> -							     GPIOD_ASIS,
> -							     led.name);
> -		if (IS_ERR(led.gpiod)) {
> +		led_dat->gpios = devm_kcalloc(dev, led_dat->num_gpios,
> +					sizeof(led_dat->gpios[0]), GFP_KERNEL);
> +		if (!led_dat->gpios) {
>   			fwnode_handle_put(child);
> -			return ERR_CAST(led.gpiod);
> +			return ERR_PTR(-ENOMEM);
>   		}
>   
> -		led_dat->gpiod = led.gpiod;
> +		for (i = 0; i < led_dat->num_gpios; i++) {
> +			led_dat->gpios[i] =
> +				devm_fwnode_get_index_gpiod_from_child(dev,
> +					NULL, i, child, GPIOD_ASIS, led.name);
> +			if (IS_ERR(led_dat->gpios[i])) {
> +				fwnode_handle_put(child);
> +				return ERR_CAST(led_dat->gpios[i]);
> +			}
> +		}
>   
>   		fwnode_property_read_string(child, "linux,default-trigger",
>   					    &led.default_trigger);
> @@ -263,13 +365,20 @@ static int gpio_led_probe(struct platform_device *pdev)
>   			const struct gpio_led *template = &pdata->leds[i];
>   			struct gpio_led_data *led_dat = &priv->leds[i];
>   
> +			led_dat->num_gpios = 1;
> +			led_dat->gpios = devm_kcalloc(&pdev->dev,
> +					led_dat->num_gpios,
> +					sizeof(led_dat->gpios[0]), GFP_KERNEL);
> +			if (!led_dat->gpios)
> +				return -ENOMEM;
> +
>   			if (template->gpiod)
> -				led_dat->gpiod = template->gpiod;
> +				led_dat->gpios[0] = template->gpiod;
>   			else
> -				led_dat->gpiod =
> +				led_dat->gpios[0] =
>   					gpio_led_get_gpiod(&pdev->dev,
>   							   i, template);
> -			if (IS_ERR(led_dat->gpiod)) {
> +			if (IS_ERR(led_dat->gpios[0])) {
>   				dev_info(&pdev->dev, "Skipping unavailable LED gpio %d (%s)\n",
>   					 template->gpio, template->name);
>   				continue;
