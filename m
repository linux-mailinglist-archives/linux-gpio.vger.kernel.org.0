Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7F33B9343
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 16:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234070AbhGAO0z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jul 2021 10:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233996AbhGAO0x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jul 2021 10:26:53 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1B0C061762;
        Thu,  1 Jul 2021 07:24:22 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id x16so6014048pfa.13;
        Thu, 01 Jul 2021 07:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5alZOBwP7ingtuhmEtBbx8noNC2DcygfHSJRg/F5DSM=;
        b=QHn73QpYlPlohcjd04SxHcmptUwYbvqSOiDweWa6aUFyjmlvVlndl9LoJZotTtMhX1
         4fnwWJgMSM/6tRSt0uBDuMOPePUSaVyUGS5ZUHxBzO+DCpM8J6+WmX4Pk7F8UCV1kbde
         9dphXYLYxqRAZp35DrNvPL6ujIz5CUcAwD8BkKvF44LAiJ7uqoWrFCjEsF4okcYFXJq0
         0+hs4+KuPsrr/j9+VJUchKCsZjsG+jmFt+KBLOhtsabRUVePkv8HTfnfdXjQ0OeVQxHF
         lN8VjRB/z7w0YMK1YHGiU+H84zOGw6imC4Al5j7rI0JSxwE9XWuVdj2qCShE8qyr2vD7
         5CVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5alZOBwP7ingtuhmEtBbx8noNC2DcygfHSJRg/F5DSM=;
        b=gFFHKidYS2uFlvf8rWGwruIE9U8RpV+nsOFBvx90j5aAuqW7z1Gey7hVwva5ZCYQez
         +CK1X6FmakzK1gCpEfxWwdWyctKsfzBTylozj9Mq/iogHUF/LnNIYTTq7c4LXgPxxGJH
         JXEwI6IMHgO1SgfkQBLEfAUcbd9tJ5qlF7cYT1uNfcfUrRZel6z+pvKZ3DCOtcYm2pBZ
         NVjzzaUZaKCTlXbcFe5hm23nfFJDFrjraQlRo+/J9aaAfK4hLVzYB+EYquCp9vwE/VqT
         ht1/2oJECVCC4odmUMQJBnSIsHRCU1vUn554bi9knCKLHoplzU7ELHxGnt7jKxflXB8z
         fZ7A==
X-Gm-Message-State: AOAM533aqTc5HQlPDAPg8JKsJWshilUUDFtGnADGHPq1Zt8qqfykiOdd
        5LAPkMsF8FvgrJRhRU+ICpc=
X-Google-Smtp-Source: ABdhPJy6vQgLqbWy9m2ChetMEn3fDSKh9yVu0UugOv8M0zGDXzvQZgyIFDJEW/RYlMB9D9ttCpiLiA==
X-Received: by 2002:a05:6a00:164b:b029:305:f45e:e1d9 with SMTP id m11-20020a056a00164bb0290305f45ee1d9mr311231pfc.10.1625149461909;
        Thu, 01 Jul 2021 07:24:21 -0700 (PDT)
Received: from sol (106-69-174-4.dyn.iinet.net.au. [106.69.174.4])
        by smtp.gmail.com with ESMTPSA id y11sm186123pfo.160.2021.07.01.07.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 07:24:21 -0700 (PDT)
Date:   Thu, 1 Jul 2021 22:24:14 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC 06/11] gpiolib: Add HTE support
Message-ID: <20210701142414.GB34285@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-7-dipenp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625235532.19575-7-dipenp@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 25, 2021 at 04:55:27PM -0700, Dipen Patel wrote:
> Some GPIO chip can provide hardware timestamp support on its GPIO lines
> , in order to support that additional functions needs to be added which
> can talk to both GPIO chip and HTE (hardware timestamping engine)
> subsystem. This patch introduces functions which gpio consumer can use
> to request hardware assisted timestamping. Below is the list of the APIs
> that are added in gpiolib subsystem.
> 
> - gpiod_hw_timestamp_control - to enable/disable HTE on specified GPIO
> line. This API will return HTE specific descriptor for the specified
> GPIO line during the enable call, it will be stored as pointer in the
> gpio_desc structure as hw_ts_data.
> - gpiod_is_hw_timestamp_enabled - to query if HTE is enabled on
> specified GPIO line.
> - gpiod_get_hw_timestamp - to retrieve hardware timestamps.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  drivers/gpio/gpiolib.c        | 92 +++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib.h        | 11 +++++
>  include/linux/gpio/consumer.h | 21 +++++++-
>  include/linux/gpio/driver.h   | 13 +++++
>  4 files changed, 135 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 220a9d8dd4e3..335eaddfde98 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2361,6 +2361,98 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
>  }
>  EXPORT_SYMBOL_GPL(gpiod_direction_output);
>  
> +/**
> + * gpiod_hw_timestamp_control - set the hardware assisted timestamp control.
> + * @desc:	GPIO to set
> + * @enable:	Set true to enable the hardware timestamp, false otherwise.
> + *
> + * Certain GPIO chip can rely on hardware assisted timestamp engines which can
> + * record timestamp at the occurance of the configured events on selected GPIO
> + * lines. This is helper API to control such engine.
> + *
> + * Return 0 in case of success, else an error code.
> + */
> +int gpiod_hw_timestamp_control(struct gpio_desc *desc, bool enable)
> +{
> +	struct gpio_chip	*gc;
> +	int			ret = 0;
> +
> +	VALIDATE_DESC(desc);
> +	gc = desc->gdev->chip;
> +
> +	if (!gc->timestamp_control) {
> +		gpiod_warn(desc,
> +			   "%s: Hardware assisted ts not supported\n",
> +			   __func__);
> +		return -ENOTSUPP;
> +	}
> +
> +	ret = gc->timestamp_control(gc, gpio_chip_hwgpio(desc),
> +				    &desc->hdesc, enable);
> +
> +	if (ret) {
> +		gpiod_warn(desc,
> +			   "%s: ts control operation failed\n", __func__);
> +		return ret;
> +	}
> +
> +	if (!enable)
> +		desc->hdesc = NULL;
> +
> +	return ret;
> +}

Last I checked, pointer accesses are not guaranteed atomic, so how is
hdesc protected from concurrent access?
Here is it modified unprotected.
Below it is read unprotected.

> +EXPORT_SYMBOL_GPL(gpiod_hw_timestamp_control);
> +
> +/**
> + * gpiod_is_hw_timestamp_enabled - check if hardware assisted timestamp is
> + * enabled.
> + * @desc:	GPIO to check
> + *
> + * Return true in case of success, false otherwise.
> + */
> +bool gpiod_is_hw_timestamp_enabled(const struct gpio_desc *desc)
> +{
> +	if (!desc)
> +		return false;
> +
> +	return (desc->hdesc) ? true : false;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_is_hw_timestamp_enabled);
> +
> +/**
> + * gpiod_get_hw_timestamp - Get hardware timestamp in nano seconds.
> + * @desc:	GPIO to get the timestamp.
> + * @block:	Set true to block until data is available.
> + *
> + * Return non-zero on success, else 0.
> + */
> +u64 gpiod_get_hw_timestamp(struct gpio_desc *desc, bool block)
> +{
> +	struct gpio_chip	*gc;
> +	int			ret = 0;
> +	u64 ts;
> +
> +	VALIDATE_DESC(desc);
> +	gc = desc->gdev->chip;
> +
> +	if (!gc->get_hw_timestamp) {
> +		gpiod_warn(desc,
> +			   "%s: Hardware assisted ts not supported\n",
> +			   __func__);
> +		return -ENOTSUPP;
> +	}
> +

Can't return an error code here.  Return value is u64, so this will look
like a valid ts.

Just return 0 on error, as you do immediately below...

> +	ret = gc->get_hw_timestamp(gc, block, desc->hdesc, &ts);
> +	if (ret) {
> +		gpiod_warn(desc,
> +			   "%s: get timestamp operation failed\n", __func__);
> +		return 0;
> +	}
> +
> +	return ts;
> +}
> +EXPORT_SYMBOL_GPL(gpiod_get_hw_timestamp);
> +
>  /**
>   * gpiod_set_config - sets @config for a GPIO
>   * @desc: descriptor of the GPIO for which to set the configuration
> diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
> index 30bc3f80f83e..5393e1d90f61 100644
> --- a/drivers/gpio/gpiolib.h
> +++ b/drivers/gpio/gpiolib.h
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/cdev.h>
> +#include <linux/hte.h>
>  
>  #define GPIOCHIP_NAME	"gpiochip"
>  
> @@ -117,6 +118,7 @@ struct gpio_desc {
>  #define FLAG_EDGE_RISING     16	/* GPIO CDEV detects rising edge events */
>  #define FLAG_EDGE_FALLING    17	/* GPIO CDEV detects falling edge events */
>  #define FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
> +#define FLAG_EVENT_CLOCK_HARDWARE	19 /* GPIO CDEV reports hardware timestamps in events */
>  
>  	/* Connection label */
>  	const char		*label;
> @@ -129,6 +131,15 @@ struct gpio_desc {
>  	/* debounce period in microseconds */
>  	unsigned int		debounce_period_us;
>  #endif
> +	/*
> +	 * Hardware timestamp engine related internal data structure.
> +	 * This gets set when the consumer calls gpiod_hw_timestamp_control to enable
> +	 * hardware timestamping on the specified GPIO line. The API calls into HTE
> +	 * subsystem, in turns HTE subsystem return the HTE descriptor for the GPIO
> +	 * line. The hdesc will be later used with gpiod_is_hw_timestamp_enabled
> +	 * and gpiod_get_hw_timestamp API calls.
> +	 */
> +	struct hte_ts_desc *hdesc;
>  };
>  
>  #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index c73b25bc9213..476ee04de7d0 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -112,6 +112,9 @@ int gpiod_get_direction(struct gpio_desc *desc);
>  int gpiod_direction_input(struct gpio_desc *desc);
>  int gpiod_direction_output(struct gpio_desc *desc, int value);
>  int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
> +int gpiod_hw_timestamp_control(struct gpio_desc *desc, bool enable);
> +bool gpiod_is_hw_timestamp_enabled(const struct gpio_desc *desc);
> +u64 gpiod_get_hw_timestamp(struct gpio_desc *desc, bool block);
>  
>  /* Value get/set from non-sleeping context */
>  int gpiod_get_value(const struct gpio_desc *desc);
> @@ -353,8 +356,22 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
>  	WARN_ON(desc);
>  	return -ENOSYS;
>  }
> -
> -
> +static inline int gpiod_hw_timestamp_control(struct gpio_desc *desc,
> +					     bool enable)
> +{
> +	WARN_ON(desc);
> +	return -ENOSYS;
> +}
> +static inline bool gpiod_is_hw_timestamp_enabled(const struct gpio_desc *desc)
> +{
> +	WARN_ON(desc);
> +	return false;
> +}
> +static inline u64 gpiod_get_hw_timestamp(struct gpio_desc *desc, bool block)
> +{
> +	WARN_ON(desc);
> +	return 0;
> +}
>  static inline int gpiod_get_value(const struct gpio_desc *desc)
>  {
>  	/* GPIO can never have been requested */
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 3a268781fcec..f343e8f54b08 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -10,6 +10,7 @@
>  #include <linux/lockdep.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/hte.h> /* For hardware timestamping */
>  
>  struct gpio_desc;
>  struct of_phandle_args;
> @@ -304,6 +305,10 @@ struct gpio_irq_chip {
>   * @add_pin_ranges: optional routine to initialize pin ranges, to be used when
>   *	requires special mapping of the pins that provides GPIO functionality.
>   *	It is called after adding GPIO chip and before adding IRQ chip.
> + * @timestamp_control: Dependent on GPIO chip, an optional routine to
> + * 	enable/disable hardware assisted timestamp.
> + * @get_hw_timestamp: Retrieves hardware timestamp. The consumer can specify
> + * 	block parameter if it wishes to block till timestamp is available. 
>   * @base: identifies the first GPIO number handled by this chip;
>   *	or, if negative during registration, requests dynamic ID allocation.
>   *	DEPRECATION: providing anything non-negative and nailing the base
> @@ -396,6 +401,14 @@ struct gpio_chip {
>  
>  	int			(*add_pin_ranges)(struct gpio_chip *gc);
>  
> +	int			(*timestamp_control)(struct gpio_chip *gc,
> +						     unsigned int offset,
> +						     struct hte_ts_desc **hdesc,
> +						     bool enable);
> +	int			(*get_hw_timestamp)(struct gpio_chip *gc,
> +						    bool block,
> +						    struct hte_ts_desc *hdesc,
> +						    u64 *ts);
>  	int			base;
>  	u16			ngpio;
>  	const char		*const *names;
> -- 
> 2.17.1
> 

Cheers,
Kent.
