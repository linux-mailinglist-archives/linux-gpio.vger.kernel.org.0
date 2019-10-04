Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9FECC4B5
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 23:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbfJDVRx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 17:17:53 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40317 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730101AbfJDVRw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 17:17:52 -0400
Received: by mail-wm1-f66.google.com with SMTP id b24so7126359wmj.5;
        Fri, 04 Oct 2019 14:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YD70kJr40wIfKXwZQuAq60qh1vJ1sKIh+OiFT6h5Sgk=;
        b=mNvOwOodt3yTWqLUlX5Qey3E6+Mhm0bkt0lePR/spGBFPXa1m4mvT7M9MM7Qr43oty
         +2aZ/4aV7/LLtVWKumtCWAgdpnkejNrJ0O7Xu5qd4C/D3FEB32AcVZDcSdCPf/ePJEk1
         V8vAKqAn+xKq4DYqC/u43+pF1Q2cbsyIFn3hxxp+y6XtEXh9/kXb1Q9VRQ3lOBDT9z9h
         dqn3tz1xtzxnPgkolJ7Afe30MTxpj11+5aiZEtmWog8X3kXrC0yjKyI4daBx+tBn775A
         0XGPfEm7HYJClOVksMU2sohXC8HqLPWWoYENwJ/eZDzIggQr73Ci45xrrgbDQtLNSLRy
         TMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=YD70kJr40wIfKXwZQuAq60qh1vJ1sKIh+OiFT6h5Sgk=;
        b=qA/K0GigEXLo3kaNdkVsMKAy4f0XbOWHiWHlcpvRjawIFuWi0cbVbS0fd/9kCD1cMJ
         6kpADGYMaLrVwDXlcRMvYHtUflHhT5qaxb+OKRGNUng0+s1wTL4NfAdCiH0ur2y2pOhM
         O5HCsvBRRsXAFcgU3Run2wX4QHyejc7eSUFAQiDLd1fImaeLW2pa6Whn4RHJV44AJiag
         C4blIUtOiuW7cUWbGTnfH9SANUTV9VldEI673Y+R+nb8s0xEQAVWKLdizCszB8xxdLha
         WO/0h8IHdoBCM+WSs0/Yf3Hrz7GFYbbPxz5Kz68U58tTnXqKWQEYDrLHyciyfi4NEMos
         0orw==
X-Gm-Message-State: APjAAAWSi88kaKGnijaBoQKQ26gQZPi7rOhE3jmtDpSRnPFPOCWXKPfJ
        kwmpuLaAqMER7u81tCe1Y6Fq4nDR
X-Google-Smtp-Source: APXvYqzJtdqItybIJthrouezQ+gFFEWwBymGDfIX12rUy7scFT4HQ8zsIwZGA2h1kfoyq1qw0C/IRg==
X-Received: by 2002:a1c:f714:: with SMTP id v20mr12706019wmh.55.1570223867634;
        Fri, 04 Oct 2019 14:17:47 -0700 (PDT)
Received: from [192.168.1.19] (civ244.neoplus.adsl.tpnet.pl. [83.31.45.244])
        by smtp.gmail.com with ESMTPSA id r2sm6386392wrm.3.2019.10.04.14.17.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 14:17:47 -0700 (PDT)
Subject: Re: [PATCH] leds: gpio: support multi-level brightness
To:     Akinobu Mita <akinobu.mita@gmail.com>, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
References: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <96ac332f-359f-531a-7890-45b39e168b82@gmail.com>
Date:   Fri, 4 Oct 2019 23:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Akinobu,

Why do you think this change is needed? Does it solve
some use case for you?

Can't you just register separate gpio LEDs?

Best regards,
Jacek Anaszewski

On 10/4/19 5:34 PM, Akinobu Mita wrote:
> Currently, GPIO LED driver allows the GPIO properties to contain one GPIO
> phandle.  This enables to contain more than one GPIO phandle and the
> brightness of the LEDs is proportional to the number of active GPIOs.
> 
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
>  drivers/leds/leds-gpio.c | 185 +++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 147 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index a5c73f3..6fad64b 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -9,6 +9,7 @@
>  #include <linux/err.h>
>  #include <linux/gpio.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/of_gpio.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
>  #include <linux/module.h>
> @@ -19,7 +20,8 @@
>  
>  struct gpio_led_data {
>  	struct led_classdev cdev;
> -	struct gpio_desc *gpiod;
> +	int num_gpios;
> +	struct gpio_desc **gpios;
>  	u8 can_sleep;
>  	u8 blinking;
>  	gpio_blink_set_t platform_gpio_blink_set;
> @@ -35,23 +37,24 @@ static void gpio_led_set(struct led_classdev *led_cdev,
>  	enum led_brightness value)
>  {
>  	struct gpio_led_data *led_dat = cdev_to_gpio_led_data(led_cdev);
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
>  		else
> -			gpiod_set_value(led_dat->gpiod, level);
> +			gpiod_set_value(led_dat->gpios[i], level);
>  	}
> +
> +	if (led_dat->blinking)
> +		led_dat->blinking = 0;
>  }
>  
>  static int gpio_led_set_blocking(struct led_classdev *led_cdev,
> @@ -65,10 +68,72 @@ static int gpio_blink_set(struct led_classdev *led_cdev,
>  	unsigned long *delay_on, unsigned long *delay_off)
>  {
>  	struct gpio_led_data *led_dat = cdev_to_gpio_led_data(led_cdev);
> +	int ret = 0;
> +	int i;
>  
>  	led_dat->blinking = 1;
> -	return led_dat->platform_gpio_blink_set(led_dat->gpiod, GPIO_LED_BLINK,
> +
> +	for (i = 0; i < led_dat->num_gpios && !ret; i++) {
> +		ret = led_dat->platform_gpio_blink_set(led_dat->gpios[i],
> +						GPIO_LED_BLINK,
>  						delay_on, delay_off);
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
>  }
>  
>  static int create_gpio_led(const struct gpio_led *template,
> @@ -76,10 +141,18 @@ static int create_gpio_led(const struct gpio_led *template,
>  	struct fwnode_handle *fwnode, gpio_blink_set_t blink_set)
>  {
>  	struct led_init_data init_data = {};
> -	int ret, state;
> +	int ret, i;
>  
>  	led_dat->cdev.default_trigger = template->default_trigger;
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
>  	if (!led_dat->can_sleep)
>  		led_dat->cdev.brightness_set = gpio_led_set;
>  	else
> @@ -89,14 +162,11 @@ static int create_gpio_led(const struct gpio_led *template,
>  		led_dat->platform_gpio_blink_set = blink_set;
>  		led_dat->cdev.blink_set = gpio_blink_set;
>  	}
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
>  	if (!template->retain_state_suspended)
>  		led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
>  	if (template->panic_indicator)
> @@ -104,10 +174,6 @@ static int create_gpio_led(const struct gpio_led *template,
>  	if (template->retain_state_shutdown)
>  		led_dat->cdev.flags |= LED_RETAIN_AT_SHUTDOWN;
>  
> -	ret = gpiod_direction_output(led_dat->gpiod, state);
> -	if (ret < 0)
> -		return ret;
> -
>  	if (template->name) {
>  		led_dat->cdev.name = template->name;
>  		ret = devm_led_classdev_register(parent, &led_dat->cdev);
> @@ -131,6 +197,30 @@ static inline int sizeof_gpio_leds_priv(int num_leds)
>  		(sizeof(struct gpio_led_data) * num_leds);
>  }
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
>  static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -150,16 +240,28 @@ static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
>  		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
>  		struct gpio_led led = {};
>  		const char *state = NULL;
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
>  			fwnode_handle_put(child);
> -			return ERR_CAST(led.gpiod);
> +			return ERR_PTR(-ENOMEM);
>  		}
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
>  		fwnode_property_read_string(child, "linux,default-trigger",
>  					    &led.default_trigger);
> @@ -263,13 +365,20 @@ static int gpio_led_probe(struct platform_device *pdev)
>  			const struct gpio_led *template = &pdata->leds[i];
>  			struct gpio_led_data *led_dat = &priv->leds[i];
>  
> +			led_dat->num_gpios = 1;
> +			led_dat->gpios = devm_kcalloc(&pdev->dev,
> +					led_dat->num_gpios,
> +					sizeof(led_dat->gpios[0]), GFP_KERNEL);
> +			if (!led_dat->gpios)
> +				return -ENOMEM;
> +
>  			if (template->gpiod)
> -				led_dat->gpiod = template->gpiod;
> +				led_dat->gpios[0] = template->gpiod;
>  			else
> -				led_dat->gpiod =
> +				led_dat->gpios[0] =
>  					gpio_led_get_gpiod(&pdev->dev,
>  							   i, template);
> -			if (IS_ERR(led_dat->gpiod)) {
> +			if (IS_ERR(led_dat->gpios[0])) {
>  				dev_info(&pdev->dev, "Skipping unavailable LED gpio %d (%s)\n",
>  					 template->gpio, template->name);
>  				continue;
> 

