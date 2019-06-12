Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A461C41C31
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 08:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730833AbfFLG10 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 02:27:26 -0400
Received: from anchovy3.45ru.net.au ([203.30.46.155]:43574 "EHLO
        anchovy3.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfFLG1Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 02:27:25 -0400
Received: (qmail 20496 invoked by uid 5089); 12 Jun 2019 06:27:23 -0000
Received: by simscan 1.2.0 ppid: 20418, pid: 20419, t: 0.0742s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy2.45ru.net.au with ESMTPA; 12 Jun 2019 06:27:22 -0000
Subject: Re: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio
 configuration
To:     Harish Jenny K N <harish_kandiga@mentor.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
 <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <09bd2a7d-3da5-3158-0fae-d80c4d3e9998@electromag.com.au>
Date:   Wed, 12 Jun 2019 14:27:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

G'day Haris,

A couple of comments inline below.
This will be useful.

On 12/06/2019 12:50, Harish Jenny K N wrote:
> Provides a new virtual gpio controller to configure the polarity
> of the gpio pins used by the userspace. When there is no kernel
> driver using the gpio pin, it becomes necessary for the userspace
> to configure the polarity of the gpio pin.
> This driver enables the userspace to directly use the gpio pin
> without worrying about the hardware level polarity configuration.
> Polarity configuration will be done by the virtual gpio controller
> based on device tree information
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
> Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
> ---
>   drivers/gpio/Kconfig         |   9 +++
>   drivers/gpio/Makefile        |   1 +
>   drivers/gpio/gpio-inverter.c | 144 +++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 154 insertions(+)
>   create mode 100644 drivers/gpio/gpio-inverter.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index acd40eb..15893dd 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -77,6 +77,15 @@ config GPIO_GENERIC
>   	depends on HAS_IOMEM # Only for IOMEM drivers
>   	tristate
> 
> +config GPIO_INVERTER
> +	tristate "Virtual GPIO controller for configuring the gpio polarity"
> +	depends on OF_GPIO
> +	help
> +	 Enabling this configuration provides a virtual gpio controller to
> +	 configure the polarity of the gpio pins used by the userspace.
> +	 This enables the userspace to directly use the gpio pin without
> +	 worrying about the hardware level polarity configuration
> +
>   # put drivers in the right section, in alphabetical order
> 
>   # This symbol is selected by both I2C and SPI expanders
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 6700eee..63d1bcc8 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -60,6 +60,7 @@ obj-$(CONFIG_GPIO_GW_PLD)	+= gpio-gw-pld.o
>   obj-$(CONFIG_GPIO_HLWD)		+= gpio-hlwd.o
>   obj-$(CONFIG_HTC_EGPIO)		+= gpio-htc-egpio.o
>   obj-$(CONFIG_GPIO_ICH)		+= gpio-ich.o
> +obj-$(CONFIG_GPIO_INVERTER)	+= gpio-inverter.o
>   obj-$(CONFIG_GPIO_IOP)		+= gpio-iop.o
>   obj-$(CONFIG_GPIO_IXP4XX)	+= gpio-ixp4xx.o
>   obj-$(CONFIG_GPIO_IT87)		+= gpio-it87.o
> diff --git a/drivers/gpio/gpio-inverter.c b/drivers/gpio/gpio-inverter.c
> new file mode 100644
> index 0000000..2408791
> --- /dev/null
> +++ b/drivers/gpio/gpio-inverter.c
> @@ -0,0 +1,144 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Virtual GPIO controller for configuring the gpio polarity
> + *
> + * Copyright (c) 2019 Mentor Graphics Inc.
> + * Developed using gpiolib and gpio documentation as reference
> + *
> + */
> +
> +#include <linux/gpio.h>
This is a legacy header.
You probably want to include <linux/gpio/driver.h>

> +#include <linux/gpio/consumer.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +
> +struct gpio_inverter {
> +	struct gpio_chip gpiochip;
> +	int count;
> +	struct gpio_desc *gpios[0];
> +};
> +
> +static int gpio_inverter_direction_input(struct gpio_chip *chip,
> +					 unsigned int offset)
> +{
> +	struct gpio_inverter *virt = gpiochip_get_data(chip);
> +
> +	return gpiod_direction_input(virt->gpios[offset]);
> +}
> +
> +static int gpio_inverter_direction_output(struct gpio_chip *chip,
> +					  unsigned int offset, int value)
> +{
> +	struct gpio_inverter *virt = gpiochip_get_data(chip);
> +
> +	return gpiod_direction_output(virt->gpios[offset], value);
> +}
> +
> +static int gpio_inverter_get(struct gpio_chip *chip,
> +			     unsigned int offset)
> +{
> +	struct gpio_inverter *virt = gpiochip_get_data(chip);
> +
> +	return gpiod_get_value(virt->gpios[offset]);
> +}
> +
> +static void gpio_inverter_set(struct gpio_chip *chip,
> +			      unsigned int offset, int value)
> +{
> +	struct gpio_inverter *virt = gpiochip_get_data(chip);
> +
> +	return gpiod_set_value(virt->gpios[offset], value);
> +}
get & set multiple as well?


> +
> +static int gpio_inverter_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct gpio_inverter *virt;
> +	struct gpio_chip *gpio_chip;
> +	struct gpio_desc *gpio;
> +	int index = 0;
> +	int count;
> +	int ret;
> +	int size;
> +
> +	count = of_gpio_named_count(dev->of_node, "mapped-gpios");
> +	if (count <= 0)
> +		return count ? count : -ENOENT;
> +
> +	size = sizeof(*virt) + count * sizeof(struct gpio_desc *);
> +	virt = devm_kzalloc(dev, size, GFP_KERNEL);
there's a helper now: size struct_size(virt, gpios, count), eg:
	virt = devm_kzalloc(dev, struct_size(virt, gpios, count), GFP_KERNEL);

> +	if (!virt)
> +		return -ENOMEM;
> +
> +	virt->count = count;
> +
> +	platform_set_drvdata(pdev, virt);
> +
> +	while (index < count) {
> +		gpio = devm_gpiod_get_index(dev, "mapped", index, GPIOD_ASIS);
> +		if (IS_ERR(gpio))
> +			return PTR_ERR(gpio);
> +
> +		virt->gpios[index++] = gpio;
> +	}
> +
> +	gpio_chip = &virt->gpiochip;
> +	gpio_chip->direction_input = gpio_inverter_direction_input;
> +	gpio_chip->direction_output = gpio_inverter_direction_output;
> +	gpio_chip->get = gpio_inverter_get;
> +	gpio_chip->set = gpio_inverter_set;
> +	gpio_chip->label = dev_name(dev);
> +	gpio_chip->parent = dev;
> +	gpio_chip->owner = THIS_MODULE;
> +	gpio_chip->base = -1;
> +	gpio_chip->ngpio = count;
> +
> +	ret = gpiochip_add_data(gpio_chip, virt);
can this use devm_gpiochip_add_data

> +	if (ret) {
> +		dev_err(dev, "failed to add gpio controller\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int gpio_inverter_remove(struct platform_device *pdev)
> +{
> +	struct gpio_inverter *virt = platform_get_drvdata(pdev);
> +
> +	gpiochip_remove(&virt->gpiochip);
> +
> +	return 0;
> +}
devm_gpiochip_add_data would remove the need for this I think.

> +
> +static const struct of_device_id gpio_inverter_match[] = {
> +	{ .compatible =	"gpio-inverter", }, { },
> +};
> +
> +static struct platform_driver gpio_inverter_driver = {
> +	.probe = gpio_inverter_probe,
> +	.remove = gpio_inverter_remove,
> +	.driver = {
> +		.name = "gpio-inverter",
> +		.of_match_table = of_match_ptr(gpio_inverter_match),
> +	}
> +};
> +
> +static int __init gpio_inverter_init(void)
> +{
> +	return platform_driver_register(&gpio_inverter_driver);
> +}
> +late_initcall(gpio_inverter_init);
> +
> +static void __exit gpio_inverter_exit(void)
> +{
> +	platform_driver_unregister(&gpio_inverter_driver);
> +}
> +module_exit(gpio_inverter_exit);
> +
> +MODULE_AUTHOR("Harish Jenny K N <harish_kandiga@mentor.com>");
> +MODULE_AUTHOR("Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>");
> +MODULE_DESCRIPTION("Virtual GPIO controller for configuring the gpio polarity");
> +MODULE_LICENSE("GPL v2");
> --
> 2.7.4
> 
> 
> 


-- 
Regards
Phil Reid

ElectroMagnetic Imaging Technology Pty Ltd
Development of Geophysical Instrumentation & Software
www.electromag.com.au

3 The Avenue, Midland WA 6056, AUSTRALIA
Ph: +61 8 9250 8100
Fax: +61 8 9250 7100
Email: preid@electromag.com.au
