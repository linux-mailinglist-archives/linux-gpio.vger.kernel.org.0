Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7788763F11
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jul 2019 04:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfGJCAk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jul 2019 22:00:40 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:60275 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfGJCAk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jul 2019 22:00:40 -0400
Received: (qmail 28859 invoked by uid 5089); 10 Jul 2019 02:00:37 -0000
Received: by simscan 1.2.0 ppid: 28730, pid: 28731, t: 0.1103s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?192.168.0.128?) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 10 Jul 2019 02:00:36 -0000
Subject: Re: [PATCH RFC] gpio: Add Virtual Aggregator GPIO Driver
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Graf <agraf@suse.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-gpio@vger.kernel.org, qemu-devel@nongnu.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190705160536.12047-1-geert+renesas@glider.be>
From:   Phil Reid <preid@electromag.com.au>
Message-ID: <8500a069-9e29-d6ad-e5e4-22d5a3eead59@electromag.com.au>
Date:   Wed, 10 Jul 2019 10:00:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705160536.12047-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

G'day Geert,

On 6/07/2019 00:05, Geert Uytterhoeven wrote:
> GPIO controllers are exported to userspace using /dev/gpiochip*
> character devices.  Access control to these devices is provided by
> standard UNIX file system permissions, on an all-or-nothing basis:
> either a GPIO controller is accessible for a user, or it is not.
> Currently no mechanism exists to control access to individual GPIOs.
> 
> Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
> and expose them as a new gpiochip.  This is useful for implementing
> access control, and assigning a set of GPIOs to a specific user.
> Furthermore, it would simplify and harden exporting GPIOs to a virtual
> machine, as the VM can just grab the full virtual GPIO controller, and
> no longer needs to care about which GPIOs to grab and which not,
> reducing the attack surface.
> 
> Virtual GPIO controllers are instantiated by writing to the "new_device"
> attribute file in sysfs:
> 
>      $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
>             "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
>              > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> 
> Likewise, virtual GPIO controllers can be destroyed after use:
> 
>      $ echo gpio-virt-agg.<N> \
>              > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> 

Nice.
This provides similar functionality to the "gpio inverter" driver currently on the list.
Other than being just a buffer.

Would it be possible to do the lookup via line names?



> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Aggregating GPIOs and exposing them as a new gpiochip was suggested in
> response to my proof-of-concept for GPIO virtualization with QEMU[1][2].
> 
> Sample session on r8a7791/koelsch:
> 
>    - Disable the leds node in arch/arm/boot/dts/r8a7791-koelsch.dts
> 
>    - Create virtual aggregators:
> 
>      $ echo "e6052000.gpio 19 20" \
>              > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> 
>      gpio-virt-agg gpio-virt-agg.0: GPIO 0 => e6052000.gpio/19
>      gpio-virt-agg gpio-virt-agg.0: GPIO 1 => e6052000.gpio/20
>      gpiochip_find_base: found new base at 778
>      gpio gpiochip8: (gpio-virt-agg.0): added GPIO chardev (254:8)
>      gpiochip_setup_dev: registered GPIOs 778 to 779 on device: gpiochip8 (gpio-virt-agg.0)
> 
>      $ echo "e6052000.gpio 21, e6050000.gpio 20 21 22" \
>              > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> 
>      gpio-virt-agg gpio-virt-agg.1: GPIO 0 => e6052000.gpio/21
>      gpio-virt-agg gpio-virt-agg.1: GPIO 1 => e6050000.gpio/20
>      gpio-virt-agg gpio-virt-agg.1: GPIO 2 => e6050000.gpio/21
>      gpio-virt-agg gpio-virt-agg.1: GPIO 3 => e6050000.gpio/22
>      gpiochip_find_base: found new base at 774
>      gpio gpiochip9: (gpio-virt-agg.1): added GPIO chardev (254:9)
>      gpiochip_setup_dev: registered GPIOs 774 to 777 on device: gpiochip9 (gpio-virt-agg.1)
> 
>    - Adjust permissions on /dev/gpiochip[89] (optional)
> 
>    - Control LEDs:
> 
>      $ gpioset gpiochip8 0=0 1=1	# LED6 OFF, LED7 ON
>      $ gpioset gpiochip8 0=1 1=0	# LED6 ON, LED7 OFF
>      $ gpioset gpiochip9 0=0	# LED8 OFF
>      $ gpioset gpiochip9 0=1	# LED8 ON
> 
>    - Destroy virtual aggregators:
> 
>      $ echo gpio-virt-agg.0 \
>              > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
>      $ echo gpio-virt-agg.1 \
>              > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> 
> Thanks for your comments!
> 
> References:
>    - [1] "[PATCH QEMU POC] Add a GPIO backend"
> 	(https://lore.kernel.org/linux-renesas-soc/20181003152521.23144-1-geert+renesas@glider.be/)
>    - [2] "Getting To Blinky: Virt Edition / Making device pass-through
> 	 work on embedded ARM"
> 	(https://fosdem.org/2019/schedule/event/vai_getting_to_blinky/)
> ---
>   drivers/gpio/Kconfig         |   9 +
>   drivers/gpio/Makefile        |   1 +
>   drivers/gpio/gpio-virt-agg.c | 390 +++++++++++++++++++++++++++++++++++
>   3 files changed, 400 insertions(+)
>   create mode 100644 drivers/gpio/gpio-virt-agg.c
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index f1f02dac324e52b6..8aff4d9626dee110 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1475,3 +1475,12 @@ config GPIO_MOCKUP
>   	  it.
>   
>   endif
> +
> +config GPIO_VIRT_AGG
> +	tristate "GPIO Virtual Aggregator"
> +	depends on GPIOLIB
> +	help
> +	  This enabled the GPIO Virtual Aggregator, which provides a way to
> +	  aggregate existing GPIOs into a new virtual GPIO device.
> +	  This is useful for assigning a collection of GPIOs to a user, or
> +	  exported them to a virtual machine.
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 0a494052c1e845ee..32e885b7f3aa4eee 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -152,6 +152,7 @@ obj-$(CONFIG_GPIO_UCB1400)		+= gpio-ucb1400.o
>   obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
>   obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
>   obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
> +obj-$(CONFIG_GPIO_VIRT_AGG)		+= gpio-virt-agg.o
>   obj-$(CONFIG_GPIO_VR41XX)		+= gpio-vr41xx.o
>   obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
>   obj-$(CONFIG_GPIO_WHISKEY_COVE)		+= gpio-wcove.o
> diff --git a/drivers/gpio/gpio-virt-agg.c b/drivers/gpio/gpio-virt-agg.c
> new file mode 100644
> index 0000000000000000..20e5f22beed9d385
> --- /dev/null
> +++ b/drivers/gpio/gpio-virt-agg.c
> @@ -0,0 +1,390 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// GPIO Virtual Aggregator
> +//
> +// Copyright (C) 2019 Glider bvba
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +
> +#include "gpiolib.h"
> +
> +#define DRV_NAME	"gpio-virt-agg"
> +#define MAX_GPIOS	32
> +
> +struct gpio_virt_agg_entry {
> +	struct platform_device *pdev;
> +};
> +
> +struct gpio_virt_agg_priv {
> +	struct gpio_chip chip;
> +	struct gpio_desc *desc[MAX_GPIOS];
> +};
> +
> +static DEFINE_MUTEX(gpio_virt_agg_lock);	/* protects idr */
> +static DEFINE_IDR(gpio_virt_agg_idr);
> +
> +static int gpio_virt_agg_get_direction(struct gpio_chip *chip,
> +				       unsigned int offset)
> +{
> +	struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> +
> +	return gpiod_get_direction(priv->desc[offset]);
> +}
> +
> +static int gpio_virt_agg_direction_input(struct gpio_chip *chip,
> +					 unsigned int offset)
> +{
> +	struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> +
> +	return gpiod_direction_input(priv->desc[offset]);
> +}
> +
> +static int gpio_virt_agg_direction_output(struct gpio_chip *chip,
> +					  unsigned int offset, int value)
> +{
> +	struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> +
> +	return gpiod_direction_output(priv->desc[offset], value);
> +}
> +
> +static int gpio_virt_agg_get(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> +
> +	return gpiod_get_value(priv->desc[offset]);
> +}
> +
> +static int gpio_virt_agg_get_multiple(struct gpio_chip *chip,
> +				      unsigned long *mask, unsigned long *bits)
> +{
> +	struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> +	DECLARE_BITMAP(values, MAX_GPIOS) = { 0 };
> +	struct gpio_desc *desc[MAX_GPIOS];
> +	unsigned int i, j = 0;
> +	int ret;
> +
> +	for_each_set_bit(i, mask, priv->chip.ngpio)
> +		desc[j++] = priv->desc[i];
> +
> +	ret = gpiod_get_array_value(j, desc, NULL, values);
> +	if (ret)
> +		return ret;
> +
> +	for_each_set_bit(i, mask, priv->chip.ngpio)
> +		__assign_bit(i, bits, test_bit(j++, values));
> +
> +	return 0;
> +}
> +
> +static void gpio_virt_agg_set(struct gpio_chip *chip, unsigned int offset,
> +			      int value)
> +{
> +	struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> +
> +	gpiod_set_value(priv->desc[offset], value);
> +}
> +
> +static void gpio_virt_agg_set_multiple(struct gpio_chip *chip,
> +				       unsigned long *mask,
> +				       unsigned long *bits)
> +{
> +	struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> +	DECLARE_BITMAP(values, MAX_GPIOS);
> +	struct gpio_desc *desc[MAX_GPIOS];
> +	unsigned int i, j = 0;
> +
> +	for_each_set_bit(i, mask, priv->chip.ngpio) {
> +		__assign_bit(j, values, test_bit(i, bits));
> +		desc[j++] = priv->desc[i];
> +	}
> +
> +	gpiod_set_array_value(j, desc, NULL, values);
> +}
> +
> +static int gpio_virt_agg_set_config(struct gpio_chip *chip,
> +				    unsigned int offset, unsigned long config)
> +{
> +	struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> +
> +	chip = priv->desc[offset]->gdev->chip;
> +	if (chip->set_config)
> +		return chip->set_config(chip, offset, config);
> +
> +	// FIXME gpiod_set_transitory() expects success if not implemented
> +	return -ENOTSUPP;
> +}
> +
> +static int gpio_virt_agg_init_valid_mask(struct gpio_chip *chip)
> +{
> +	struct gpio_virt_agg_priv *priv = gpiochip_get_data(chip);
> +	unsigned int i;
> +
> +	for (i = 0; i < priv->chip.ngpio; i++) {
> +		if (gpiochip_line_is_valid(priv->desc[i]->gdev->chip,
> +					   gpio_chip_hwgpio(priv->desc[i])))
> +			set_bit(i, chip->valid_mask);
> +	}
> +
> +	return 0;
> +}
> +
> +static int gpiochip_match_label(struct gpio_chip *chip, void *data)
> +{
> +	return !strcmp(chip->label, data);
> +}
> +
> +static struct gpio_chip *gpiochip_find_by_label(const char *label)
> +{
> +	return gpiochip_find((void *)label, gpiochip_match_label);
> +}
> +
> +static ssize_t new_device_store(struct device_driver *driver, const char *buf,
> +				size_t count)
> +{
> +	struct gpio_virt_agg_entry *gva;
> +	struct platform_device *pdev;
> +	int res, id;
> +
> +	gva = kzalloc(sizeof(*gva), GFP_KERNEL);
> +	if (!gva)
> +		return -ENOMEM;
> +
> +	mutex_lock(&gpio_virt_agg_lock);
> +	id = idr_alloc(&gpio_virt_agg_idr, gva, 0, 0, GFP_KERNEL);
> +	mutex_unlock(&gpio_virt_agg_lock);
> +
> +	if (id < 0) {
> +		res = id;
> +		goto free_gva;
> +	}
> +
> +	/* kernfs guarantees string termination, so count + 1 is safe */
> +	pdev = platform_device_register_data(NULL, DRV_NAME, id, buf,
> +					     count + 1);
> +	if (IS_ERR(pdev)) {
> +		res = PTR_ERR(pdev);
> +		goto remove_idr;
> +	}
> +
> +	gva->pdev = pdev;
> +	return count;
> +
> +remove_idr:
> +	mutex_lock(&gpio_virt_agg_lock);
> +	idr_remove(&gpio_virt_agg_idr, id);
> +	mutex_unlock(&gpio_virt_agg_lock);
> +free_gva:
> +	kfree(gva);
> +	return res;
> +}
> +
> +static DRIVER_ATTR_WO(new_device);
> +
> +static ssize_t delete_device_store(struct device_driver *driver,
> +				   const char *buf, size_t count)
> +{
> +	struct gpio_virt_agg_entry *gva;
> +	int id;
> +
> +	if (strncmp(buf, DRV_NAME ".", strlen(DRV_NAME ".")))
> +		return -EINVAL;
> +
> +	id = simple_strtoul(buf + strlen(DRV_NAME "."), NULL, 10);
> +
> +	mutex_lock(&gpio_virt_agg_lock);
> +	gva = idr_remove(&gpio_virt_agg_idr, id);
> +	mutex_unlock(&gpio_virt_agg_lock);
> +
> +	if (!gva) {
> +		pr_info("Cannot find %s.%d\n", DRV_NAME, id);
> +		return -ENOENT;
> +	}
> +
> +	platform_device_unregister(gva->pdev);
> +	kfree(gva);
> +	return count;
> +}
> +static DRIVER_ATTR_WO(delete_device);
> +
> +static struct attribute *gpio_virt_agg_attrs[] = {
> +	&driver_attr_new_device.attr,
> +	&driver_attr_delete_device.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(gpio_virt_agg);
> +
> +static int gpio_virt_agg_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const char *param = dev_get_platdata(dev);
> +	struct gpio_virt_agg_priv *priv;
> +	const char *label = NULL;
> +	struct gpio_chip *chip;
> +	struct gpio_desc *desc;
> +	unsigned int offset;
> +	int error, i;
> +	char *s;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		error = -ENOMEM;
> +		goto fail;
> +	}
> +
> +	for (i = 0; i < MAX_GPIOS; i++) {
> +		if (*param == '\0' || *param == '\n')
> +			break;
> +
> +		if (*param == ',') {
> +			if (label) {
> +				devm_kfree(dev, label);
> +				label = NULL;
> +			}
> +			for (param++; *param == ' '; param++) ;
> +		}
> +
> +		if (!label) {
> +			s = strchr(param, ' ');
> +			if (!s) {
> +				dev_info(dev, "Missing gpiochip\n");
> +				error = -EINVAL;
> +				goto fail;
> +			}
> +			label = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
> +					       (int)(s - param), param);
> +			if (!label) {
> +				error = -ENOMEM;
> +				goto fail;
> +			}
> +
> +			chip = gpiochip_find_by_label(label);
> +			if (!chip) {
> +				dev_info(dev, "Cannot find gpiochip %s\n",
> +					 label);
> +				error = -ENODEV;
> +				goto fail;
> +			}
> +
> +			for (param = s + 1; *param == ' '; param++) ;
> +		}
> +
> +		offset = simple_strtoul(param, &s, 10);
> +
> +		desc = gpiochip_get_desc(chip, offset);
> +		if (IS_ERR(desc)) {
> +			error = PTR_ERR(desc);
> +			dev_info(dev, "Cannot get GPIO %s/%u: %d\n", label,
> +				 offset, error);
> +			goto fail;
> +		}
> +
> +		error = gpiod_request(desc, dev_name(dev));
> +		if (error) {
> +			dev_info(dev, "Cannot request GPIO %s/%u: %d\n", label,
> +				 offset, error);
> +			goto fail;
> +		}
> +
> +		dev_dbg(dev, "GPIO %u => %s/%u\n", i, label, offset);
> +		priv->desc[i] = desc;
> +
> +		if (gpiod_cansleep(desc))
> +			priv->chip.can_sleep = true;
> +		if (desc->gdev->chip->set_config)
> +			priv->chip.set_config = gpio_virt_agg_set_config;
> +		if (desc->gdev->chip->need_valid_mask) {
> +			priv->chip.need_valid_mask = true;
> +			priv->chip.init_valid_mask =
> +				gpio_virt_agg_init_valid_mask;
> +		}
> +
> +		for (param = s; *param == ' '; param++) ;
> +	}
> +	if (i == MAX_GPIOS)
> +		dev_warn(&pdev->dev,
> +			 "Too many gpios specified, truncating to %u\n",
> +			 MAX_GPIOS);
> +
> +	priv->chip.label = dev_name(dev);
> +	priv->chip.parent = dev;
> +	priv->chip.owner = THIS_MODULE;
> +	priv->chip.get_direction = gpio_virt_agg_get_direction;
> +	priv->chip.direction_input = gpio_virt_agg_direction_input;
> +	priv->chip.direction_output = gpio_virt_agg_direction_output;
> +	priv->chip.get = gpio_virt_agg_get;
> +	priv->chip.get_multiple = gpio_virt_agg_get_multiple;
> +	priv->chip.set = gpio_virt_agg_set;
> +	priv->chip.set_multiple = gpio_virt_agg_set_multiple;
> +	priv->chip.base = -1;
> +	priv->chip.ngpio = i;
> +	platform_set_drvdata(pdev, priv);
> +
> +	error = gpiochip_add_data(&priv->chip, priv);
> +	if (error)
> +		goto fail;
> +
> +	return 0;
> +
> +fail:
> +	while (i-- > 0)
> +		gpiod_free(priv->desc[i]);
> +
> +	return error;
> +}
> +
> +static int gpio_virt_agg_remove(struct platform_device *pdev)
> +{
> +	struct gpio_virt_agg_priv *priv = platform_get_drvdata(pdev);
> +	unsigned int i;
> +
> +	gpiochip_remove(&priv->chip);
> +
> +	for (i = 0; i < priv->chip.ngpio; i++)
> +		gpiod_free(priv->desc[i]);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver gpio_virt_agg_driver = {
> +	.probe = gpio_virt_agg_probe,
> +	.remove = gpio_virt_agg_remove,
> +	.driver = {
> +		.name = DRV_NAME,
> +		.groups = gpio_virt_agg_groups,
> +	},
> +};
> +
> +static int __init gpio_virt_agg_init(void)
> +{
> +	return platform_driver_register(&gpio_virt_agg_driver);
> +}
> +module_init(gpio_virt_agg_init);
> +
> +static int __exit gpio_virt_agg_idr_remove(int id, void *p, void *data)
> +{
> +	struct gpio_virt_agg_entry *gva = p;
> +
> +	platform_device_unregister(gva->pdev);
> +	kfree(gva);
> +	return 0;
> +}
> +
> +static void __exit gpio_virt_agg_exit(void)
> +{
> +	mutex_lock(&gpio_virt_agg_lock);
> +	idr_for_each(&gpio_virt_agg_idr, gpio_virt_agg_idr_remove, NULL);
> +	idr_destroy(&gpio_virt_agg_idr);
> +	mutex_unlock(&gpio_virt_agg_lock);
> +
> +	platform_driver_unregister(&gpio_virt_agg_driver);
> +}
> +module_exit(gpio_virt_agg_exit);
> +
> +MODULE_AUTHOR("Geert Uytterhoeven <geert+renesas@glider.be>");
> +MODULE_DESCRIPTION("GPIO Virtual Aggregator");
> +MODULE_LICENSE("GPL v2");
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
