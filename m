Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5785130975D
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Jan 2021 18:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhA3Rkf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Jan 2021 12:40:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhA3Rkf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Jan 2021 12:40:35 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CF78C061573;
        Sat, 30 Jan 2021 09:39:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id q8so17020687lfm.10;
        Sat, 30 Jan 2021 09:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ejp7E/4BFmsW+sDSYcYNXpkkK7z33S89XlpfQDn2AeY=;
        b=u5UCGW/fxm7OKqUl+Y9anO9OATk2pdXap8EHuJ34HTMkN7r4Af1Byl6UGTpYEjKp2q
         HK9g3rHIj385mGjQazOIIqRGaClO4p+MVIXeXkzRhHuE4SG9vZRyxFnQd1eruHV/pyHY
         nQiAkBXcvqf/FgP2TLRsNrx0h1yGwVPu9P9uz1HiPaYT5NtD5LPKdBa8IPaAvGFaqACE
         pxGr2nrrwPzL8EOAwTNVOjecA4eoWv6DpXObb2fo9bzE4pAhjHh01A+Uh+btI0d5sco1
         gYyKQzcEb6vTY71b8rfN2Q0wDxL5/Ruta4iOqGRvgfeqoFjZ2K1SRhFIGBRx8CpxOPPm
         1DrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ejp7E/4BFmsW+sDSYcYNXpkkK7z33S89XlpfQDn2AeY=;
        b=dP/ApueYr87CtAuWyk5v83INuP0d40FSCVLtiqhl1tmcxQAlKx59D65Rg3M0TSSqG9
         eP5gFSqjfEw3pa7I5zsTAHvbRbOKBQJqY1xNN5Vh5ZEIJE+waCCiOJIHeeDwQ+2PNYYG
         N9YIrETUOYJpLzXIL5o1Y+uI/KWHYf1jRamr/Ek4kmabTQHPm2UO6FsDrorUoDCgnxTn
         qAGlJYi/z4glWKSG0clAb36NzblLBj41cri+KGvNxoDRBvb3ZeHOMSFGXqvBhVWURfjg
         /jsqxM4O+XpgSMh67ArYBkskAOSShPQ8ibCn9vOcuyotp/+xVoYVr+d0WPlL10tF/2sn
         nkjA==
X-Gm-Message-State: AOAM533+E5hH1KAsx3NBc2aVmv27KFgDZI+pMwG6Ihxhu4rVjuGDazmz
        XAShgIHnVv6xyv+aIrWKXRYt1wnoaJU=
X-Google-Smtp-Source: ABdhPJyuNGZqXTWgD1x54/G0iD/aIrLO2ruLDUHCWrrYEZZcDZVHEDZsYzgll4DstJ527Vuo4nEeEQ==
X-Received: by 2002:ac2:44db:: with SMTP id d27mr4652858lfm.248.1612028392835;
        Sat, 30 Jan 2021 09:39:52 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id m10sm2423552lfk.2.2021.01.30.09.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jan 2021 09:39:52 -0800 (PST)
Subject: Re: [PATCH v5] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        kernel-team@android.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20210122193600.1415639-1-saravanak@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <544ad0e4-0954-274c-8e77-866aaa5661a8@gmail.com>
Date:   Sat, 30 Jan 2021 20:39:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210122193600.1415639-1-saravanak@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

22.01.2021 22:35, Saravana Kannan пишет:
> There are multiple instances of GPIO device tree nodes of the form:
> 
> foo {
> 	compatible = "acme,foo";
> 	...
> 
> 	gpio0: gpio0@xxxxxxxx {
> 		compatible = "acme,bar";
> 		...
> 		gpio-controller;
> 	};
> 
> 	gpio1: gpio1@xxxxxxxx {
> 		compatible = "acme,bar";
> 		...
> 		gpio-controller;
> 	};
> 
> 	...
> }
> 
> bazz {
> 	my-gpios = <&gpio0 ...>;
> }
> 
> Case 1: The driver for "foo" populates struct device for these gpio*
> nodes and then probes them using a driver that binds with "acme,bar".
> This driver for "acme,bar" then registers the gpio* nodes with gpiolib.
> This lines up with how DT nodes with the "compatible" property are
> typically converted to struct devices and then registered with driver
> core to probe them. This also allows the gpio* devices to hook into all
> the driver core capabilities like runtime PM, probe deferral,
> suspend/resume ordering, device links, etc.
> 
> Case 2: The driver for "foo" doesn't populate struct devices for these
> gpio* nodes before registering them with gpiolib. Instead it just loops
> through its child nodes and directly registers the gpio* nodes with
> gpiolib.
> 
> Drivers that follow case 2 cause problems with fw_devlink=on. This is
> because fw_devlink will prevent bazz from probing until there's a struct
> device that has gpio0 as its fwnode (because bazz lists gpio0 as a GPIO
> supplier). Once the struct device is available, fw_devlink will create a
> device link with gpio0 device as the supplier and bazz device as the
> consumer. After this point, since the gpio0 device will never bind to a
> driver, the device link will prevent bazz device from ever probing.
> 
> Finding and refactoring all the instances of drivers that follow case 2
> will cause a lot of code churn and it is not something that can be done
> in one shot. In some instances it might not even be possible to refactor
> them cleanly. Examples of such instances are [1] [2].
> 
> This patch works around this problem and avoids all the code churn by
> simply setting the fwnode of the gpio_device and creating a stub driver
> to bind to the gpio_device. This allows all the consumers to continue
> probing when the driver follows case 2.
> 
> [1] - https://lore.kernel.org/lkml/20201014191235.7f71fcb4@xhacker.debian/
> [2] - https://lore.kernel.org/lkml/e28e1f38d87c12a3c714a6573beba6e1@kernel.org/
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> Cc: Kever Yang <kever.yang@rock-chips.com>
> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
> v1 -> v2:
> - Fixed up compilation errors that were introduced accidentally
> - Fixed a missing put_device()
> 
> v2 -> v3:
> - Changed chip_warn() to pr_warn()
> - Changed some variable names
> 
> v3 -> v4:
> - Dropped the warning since it's not always valid
> - This simplifies the code a lot
> - Added comments and fixed up commit text
> 
> v4 -> v5:
> - Fixed the code to not mess up non-DT cases.
> - Moved code into gpiolib-of.c
> 
>  drivers/gpio/gpiolib-of.c | 11 +++++++++++
>  drivers/gpio/gpiolib-of.h |  5 +++++
>  drivers/gpio/gpiolib.c    | 38 +++++++++++++++++++++++++++++++-------
>  3 files changed, 47 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
> index b4a71119a4b0..baf0153b7bca 100644
> --- a/drivers/gpio/gpiolib-of.c
> +++ b/drivers/gpio/gpiolib-of.c
> @@ -1039,3 +1039,14 @@ void of_gpiochip_remove(struct gpio_chip *chip)
>  {
>  	of_node_put(chip->of_node);
>  }
> +
> +void of_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev)
> +{
> +	/* If the gpiochip has an assigned OF node this takes precedence */
> +	if (gc->of_node)
> +		gdev->dev.of_node = gc->of_node;
> +	else
> +		gc->of_node = gdev->dev.of_node;
> +	if (gdev->dev.of_node)
> +		gdev->dev.fwnode = of_fwnode_handle(gdev->dev.of_node);
> +}
> diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
> index ed26664f1537..8af2bc899aab 100644
> --- a/drivers/gpio/gpiolib-of.h
> +++ b/drivers/gpio/gpiolib-of.h
> @@ -15,6 +15,7 @@ int of_gpiochip_add(struct gpio_chip *gc);
>  void of_gpiochip_remove(struct gpio_chip *gc);
>  int of_gpio_get_count(struct device *dev, const char *con_id);
>  bool of_gpio_need_valid_mask(const struct gpio_chip *gc);
> +void of_gpio_dev_init(struct gpio_chip *gc, struct gpio_device *gdev);
>  #else
>  static inline struct gpio_desc *of_find_gpio(struct device *dev,
>  					     const char *con_id,
> @@ -33,6 +34,10 @@ static inline bool of_gpio_need_valid_mask(const struct gpio_chip *gc)
>  {
>  	return false;
>  }
> +static inline void of_gpio_dev_init(struct gpio_chip *gc,
> +				    struct gpio_device *gdev)
> +{
> +}
>  #endif /* CONFIG_OF_GPIO */
>  
>  extern struct notifier_block gpio_of_notifier;
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index b02cc2abd3b6..70fb15ae5d36 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -590,13 +590,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
>  		gdev->dev.of_node = gc->parent->of_node;
>  	}
>  
> -#ifdef CONFIG_OF_GPIO
> -	/* If the gpiochip has an assigned OF node this takes precedence */
> -	if (gc->of_node)
> -		gdev->dev.of_node = gc->of_node;
> -	else
> -		gc->of_node = gdev->dev.of_node;
> -#endif
> +	of_gpio_dev_init(gc, gdev);
>  
>  	gdev->id = ida_alloc(&gpio_ida, GFP_KERNEL);
>  	if (gdev->id < 0) {
> @@ -4202,6 +4196,29 @@ void gpiod_put_array(struct gpio_descs *descs)
>  }
>  EXPORT_SYMBOL_GPL(gpiod_put_array);
>  
> +static int gpio_stub_drv_probe(struct device *dev)
> +{
> +	/*
> +	 * The DT node of some GPIO chips have a "compatible" property, but
> +	 * never have a struct device added and probed by a driver to register
> +	 * the GPIO chip with gpiolib. In such cases, fw_devlink=on will cause
> +	 * the consumers of the GPIO chip to get probe deferred forever because
> +	 * they will be waiting for a device associated with the GPIO chip
> +	 * firmware node to get added and bound to a driver.
> +	 *
> +	 * To allow these consumers to probe, we associate the struct
> +	 * gpio_device of the GPIO chip with the firmware node and then simply
> +	 * bind it to this stub driver.
> +	 */
> +	return 0;
> +}
> +
> +static struct device_driver gpio_stub_drv = {
> +	.name = "gpio_stub_drv",
> +	.bus = &gpio_bus_type,
> +	.probe = gpio_stub_drv_probe,
> +};
> +
>  static int __init gpiolib_dev_init(void)
>  {
>  	int ret;
> @@ -4213,9 +4230,16 @@ static int __init gpiolib_dev_init(void)
>  		return ret;
>  	}
>  
> +	if (driver_register(&gpio_stub_drv) < 0) {
> +		pr_err("gpiolib: could not register GPIO stub driver\n");
> +		bus_unregister(&gpio_bus_type);
> +		return ret;
> +	}
> +
>  	ret = alloc_chrdev_region(&gpio_devt, 0, GPIO_DEV_MAX, GPIOCHIP_NAME);
>  	if (ret < 0) {
>  		pr_err("gpiolib: failed to allocate char dev region\n");
> +		driver_unregister(&gpio_stub_drv);
>  		bus_unregister(&gpio_bus_type);
>  		return ret;
>  	}
> 

Hi,

This patch causes these new errors on NVIDIA Tegra30 Nexus 7 using recent linux-next:

 gpio-1022 (cpu-pwr-req-hog): hogged as input
 max77620-pinctrl max77620-pinctrl: pin gpio4 already requested by max77620-pinctrl; cannot claim for gpiochip1
 max77620-pinctrl max77620-pinctrl: pin-4 (gpiochip1) status -22
 max77620-pinctrl max77620-pinctrl: could not request pin 4 (gpio4) from group gpio4  on device max77620-pinctrl
 gpio_stub_drv gpiochip1: Error applying setting, reverse things back
 gpio_stub_drv: probe of gpiochip1 failed with error -22

Please fix, thanks in advance.
