Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3647213B3
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2019 08:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfEQG0k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 May 2019 02:26:40 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41675 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfEQG0k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 May 2019 02:26:40 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hRWK9-0002UD-5k; Fri, 17 May 2019 08:26:33 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hRWK7-0002GN-G5; Fri, 17 May 2019 08:26:31 +0200
Date:   Fri, 17 May 2019 08:26:31 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Kun Yi <kunyi@google.com>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, dmurphy@ti.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] ledtrig-gpio: Request user input pin as GPIO
Message-ID: <20190517062631.ceffzog4tutyc5kk@pengutronix.de>
References: <20190516214209.139726-1-kunyi@google.com>
 <20190516214209.139726-2-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516214209.139726-2-kunyi@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Cc: += linux-gpio@vger.kernel.org

On Thu, May 16, 2019 at 02:42:08PM -0700, Kun Yi wrote:
> The ledtrig-gpio logic assumes the input pin can be directly converted
> to IRQ using gpio_to_irq. This is problematic since there is no
> guarantee on the pinmux function nor the direction of the pin. Request
> the pin as an input GPIO before requesting it as an IRQ.

When reading this I thought the driver requested the gpio only after
converting to an irq. But in fact it didn't request and set the
direction at all.

> Tested: a free pin can be correctly requested as GPIO

This doesn't belong into the signed-off-area.

> Signed-off-by: Kun Yi <kunyi@google.com>
> Change-Id: I657e3e108552612506775cc348a8b4b35d40cac5

This doesn't belong into the linux history either.

> ---
>  drivers/leds/trigger/ledtrig-gpio.c | 31 +++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
> index ed0db8ed825f..f6d50e031492 100644
> --- a/drivers/leds/trigger/ledtrig-gpio.c
> +++ b/drivers/leds/trigger/ledtrig-gpio.c
> @@ -117,6 +117,16 @@ static ssize_t gpio_trig_gpio_show(struct device *dev,
>  	return sprintf(buf, "%u\n", gpio_data->gpio);
>  }
>  
> +static inline void free_used_gpio_if_valid(unsigned int gpio,
> +					   struct led_classdev *led)

Please stick to the function prefix used in this driver. I'd call this
function gpio_trig_free_gpio and not put "if_valid" into the name.

> +{
> +	if (gpio == 0)
> +		return;
> +
> +	free_irq(gpio_to_irq(gpio), led);
> +	gpio_free(gpio);
> +}
> +
>  static ssize_t gpio_trig_gpio_store(struct device *dev,
>  		struct device_attribute *attr, const char *buf, size_t n)
>  {
> @@ -135,20 +145,30 @@ static ssize_t gpio_trig_gpio_store(struct device *dev,
>  		return n;
>  
>  	if (!gpio) {
> -		if (gpio_data->gpio != 0)
> -			free_irq(gpio_to_irq(gpio_data->gpio), led);
> +		free_used_gpio_if_valid(gpio_data->gpio, led);
>  		gpio_data->gpio = 0;
>  		return n;
>  	}
>  
> +	ret = gpio_request(gpio, "ledtrig-gpio");
> +	if (ret) {
> +		dev_err(dev, "gpio_request failed with error %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = gpio_direction_input(gpio);
> +	if (ret) {
> +		dev_err(dev, "gpio_direction_input failed with err %d\n", ret);
> +		return ret;
> +	}

Please use gpio_request_one which implements both gpio_request() and
gpio_direction_*(). This also fixes the missing gpio_free() in the error
path of gpio_direction_input().

> +
>  	ret = request_threaded_irq(gpio_to_irq(gpio), NULL, gpio_trig_irq,
>  			IRQF_ONESHOT | IRQF_SHARED | IRQF_TRIGGER_RISING
>  			| IRQF_TRIGGER_FALLING, "ledtrig-gpio", led);
>  	if (ret) {
>  		dev_err(dev, "request_irq failed with error %d\n", ret);
>  	} else {
> -		if (gpio_data->gpio != 0)
> -			free_irq(gpio_to_irq(gpio_data->gpio), led);
> +		free_used_gpio_if_valid(gpio_data->gpio, led);
>  		gpio_data->gpio = gpio;
>  		/* After changing the GPIO, we need to update the LED. */
>  		gpio_trig_irq(0, led);
> @@ -184,8 +204,7 @@ static void gpio_trig_deactivate(struct led_classdev *led)
>  {
>  	struct gpio_trig_data *gpio_data = led_get_trigger_data(led);
>  
> -	if (gpio_data->gpio != 0)
> -		free_irq(gpio_to_irq(gpio_data->gpio), led);
> +	free_used_gpio_if_valid(gpio_data->gpio, led);
>  	kfree(gpio_data);
>  }
>  

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
