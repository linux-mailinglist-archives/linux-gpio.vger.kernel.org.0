Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97D12AD7F5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 14:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730542AbgKJNql (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 08:46:41 -0500
Received: from thoth.sbs.de ([192.35.17.2]:45932 "EHLO thoth.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730511AbgKJNqk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 10 Nov 2020 08:46:40 -0500
X-Greylist: delayed 1395 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Nov 2020 08:46:38 EST
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AADN9ng029762
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Nov 2020 14:23:10 +0100
Received: from [167.87.33.169] ([167.87.33.169])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AADN7Qf022173;
        Tue, 10 Nov 2020 14:23:08 +0100
Subject: Re: [PATCH v3 6/7] gpio: exar: switch to using regmap
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Laight <David.Laight@aculab.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20201110123406.3261-1-brgl@bgdev.pl>
 <20201110123406.3261-7-brgl@bgdev.pl>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7f890933-71a7-28d5-75ae-8d80d6a67ff5@siemens.com>
Date:   Tue, 10 Nov 2020 14:23:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110123406.3261-7-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 10.11.20 13:34, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> We can simplify the code in gpio-exar by using regmap. This allows us to
> drop the mutex (regmap provides its own locking) and we can also reuse
> regmap's bit operations instead of implementing our own update function.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/gpio/Kconfig     |  1 +
>  drivers/gpio/gpio-exar.c | 90 +++++++++++++++++-----------------------
>  2 files changed, 38 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5d4de5cd6759..253a61ec9645 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -255,6 +255,7 @@ config GPIO_EP93XX
>  config GPIO_EXAR
>  	tristate "Support for GPIO pins on XR17V352/354/358"
>  	depends on SERIAL_8250_EXAR
> +	select REGMAP_MMIO
>  	help
>  	  Selecting this option will enable handling of GPIO pins present
>  	  on Exar XR17V352/354/358 chips.
> diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
> index 28b0b4b5fa35..a2d324c513f8 100644
> --- a/drivers/gpio/gpio-exar.c
> +++ b/drivers/gpio/gpio-exar.c
> @@ -14,6 +14,7 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  
>  #define EXAR_OFFSET_MPIOLVL_LO 0x90
>  #define EXAR_OFFSET_MPIOSEL_LO 0x93
> @@ -26,9 +27,8 @@ static DEFINE_IDA(ida_index);
>  
>  struct exar_gpio_chip {
>  	struct gpio_chip gpio_chip;
> -	struct mutex lock;
> +	struct regmap *regs;
>  	int index;
> -	void __iomem *regs;
>  	char name[20];
>  	unsigned int first_pin;
>  };
> @@ -53,51 +53,13 @@ exar_offset_to_bit(struct exar_gpio_chip *exar_gpio, unsigned int offset)
>  	return (offset + exar_gpio->first_pin) % 8;
>  }
>  
> -static void exar_update(struct gpio_chip *chip, unsigned int reg, int val,
> -			unsigned int offset)
> -{
> -	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
> -	int temp;
> -
> -	mutex_lock(&exar_gpio->lock);
> -	temp = readb(exar_gpio->regs + reg);
> -	temp &= ~BIT(offset);
> -	if (val)
> -		temp |= BIT(offset);
> -	writeb(temp, exar_gpio->regs + reg);
> -	mutex_unlock(&exar_gpio->lock);
> -}
> -
> -static int exar_set_direction(struct gpio_chip *chip, int direction,
> -			      unsigned int offset)
> -{
> -	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
> -	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
> -	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
> -
> -	exar_update(chip, addr, direction, bit);
> -	return 0;
> -}
> -
> -static int exar_get(struct gpio_chip *chip, unsigned int reg)
> -{
> -	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
> -	int value;
> -
> -	mutex_lock(&exar_gpio->lock);
> -	value = readb(exar_gpio->regs + reg);
> -	mutex_unlock(&exar_gpio->lock);
> -
> -	return value;
> -}
> -
>  static int exar_get_direction(struct gpio_chip *chip, unsigned int offset)
>  {
>  	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
>  	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
>  	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
>  
> -	if (exar_get(chip, addr) & BIT(bit))
> +	if (regmap_test_bits(exar_gpio->regs, addr, BIT(bit)))
>  		return GPIO_LINE_DIRECTION_IN;
>  
>  	return GPIO_LINE_DIRECTION_OUT;
> @@ -109,7 +71,7 @@ static int exar_get_value(struct gpio_chip *chip, unsigned int offset)
>  	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
>  	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
>  
> -	return !!(exar_get(chip, addr) & BIT(bit));
> +	return !!(regmap_test_bits(exar_gpio->regs, addr, BIT(bit)));
>  }
>  
>  static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
> @@ -119,21 +81,42 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
>  	unsigned int addr = exar_offset_to_lvl_addr(exar_gpio, offset);
>  	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
>  
> -	exar_update(chip, addr, value, bit);
> +	if (value)
> +		regmap_set_bits(exar_gpio->regs, addr, BIT(bit));
> +	else
> +		regmap_clear_bits(exar_gpio->regs, addr, BIT(bit));
>  }
>  
>  static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
>  				 int value)
>  {
> +	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
> +	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
> +	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
> +
>  	exar_set_value(chip, offset, value);
> -	return exar_set_direction(chip, 0, offset);
> +	regmap_clear_bits(exar_gpio->regs, addr, BIT(bit));
> +
> +	return 0;
>  }
>  
>  static int exar_direction_input(struct gpio_chip *chip, unsigned int offset)
>  {
> -	return exar_set_direction(chip, 1, offset);
> +	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
> +	unsigned int addr = exar_offset_to_sel_addr(exar_gpio, offset);
> +	unsigned int bit = exar_offset_to_bit(exar_gpio, offset);
> +
> +	regmap_set_bits(exar_gpio->regs, addr, BIT(bit));
> +
> +	return 0;
>  }
>  
> +static const struct regmap_config exar_regmap_config = {
> +	.name		= "exar-gpio",
> +	.reg_bits	= 8,
> +	.val_bits	= 8,
> +};
> +
>  static int gpio_exar_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -163,13 +146,17 @@ static int gpio_exar_probe(struct platform_device *pdev)
>  	if (!exar_gpio)
>  		return -ENOMEM;
>  
> -	mutex_init(&exar_gpio->lock);
> +	/*
> +	 * We don't need to check the return values of mmio regmap operations (unless
> +	 * the regmap has a clock attached which is not the case here).
> +	 */
> +	exar_gpio->regs = devm_regmap_init_mmio(dev, p, &exar_regmap_config);
> +	if (IS_ERR(exar_gpio->regs))
> +		return PTR_ERR(exar_gpio->regs);
>  
>  	index = ida_alloc(&ida_index, GFP_KERNEL);
> -	if (index < 0) {
> -		ret = index;
> -		goto err_mutex_destroy;
> -	}
> +	if (index < 0)
> +		return index;
>  
>  	sprintf(exar_gpio->name, "exar_gpio%d", index);
>  	exar_gpio->gpio_chip.label = exar_gpio->name;
> @@ -195,8 +182,6 @@ static int gpio_exar_probe(struct platform_device *pdev)
>  
>  err_destroy:
>  	ida_free(&ida_index, index);
> -err_mutex_destroy:
> -	mutex_destroy(&exar_gpio->lock);
>  	return ret;
>  }
>  
> @@ -205,7 +190,6 @@ static int gpio_exar_remove(struct platform_device *pdev)
>  	struct exar_gpio_chip *exar_gpio = platform_get_drvdata(pdev);
>  
>  	ida_free(&ida_index, exar_gpio->index);
> -	mutex_destroy(&exar_gpio->lock);
>  
>  	return 0;
>  }
> 

Unfortunately, this one still crashes:

...
0000:02:00.0: ttyS2 at MMIO 0x90000000 (irq = 44, base_baud = 7812500) is a XR17V35X
0000:02:00.0: ttyS3 at MMIO 0x90000400 (irq = 44, base_baud = 7812500) is a XR17V35X
BUG: kernel NULL pointer dereference, address: 00000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0xc3300010) - not-present page
*pde = 00000000 
Oops: 0010 [#1] PREEMPT
CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.10.0-rc2+ #440
Hardware name: Intel Corp. QUARK/SIMATIC IOT2000, BIOS V24.02.01 10/30/2018
Workqueue: events deferred_probe_work_func
EIP: 0x0
Code: Unable to access opcode bytes at RIP 0xffffffd6.
EAX: 00000000 EBX: f7c74000 ECX: 00000004 EDX: 00000096
ESI: 00000000 EDI: 00000000 EBP: c1157d88 ESP: c1157d70
DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: ffffffd6 CR3: 03778000 CR4: 00100010
Call Trace:
 regmap_update_bits_base+0x22/0x60
 exar_set_value+0x4e/0x70 [gpio_exar]
 exar_direction_output+0x3a/0x80 [gpio_exar]
 ? exar_set_value+0x70/0x70 [gpio_exar]
 ? exar_set_value+0x70/0x70 [gpio_exar]
 gpiod_direction_output_raw_commit+0x74/0x270
 ? exar_direction_input+0x50/0x50 [gpio_exar]
 ? exar_set_value+0x70/0x70 [gpio_exar]
 gpiod_direction_output+0xf0/0x160
 create_gpio_led+0xea/0x180
 gpio_led_probe+0x22c/0x460
 ? device_pm_check_callbacks+0x4c/0x100
 platform_drv_probe+0x2d/0x80
 really_probe+0xcb/0x330
 driver_probe_device+0x49/0xa0
 __device_attach_driver+0x61/0x80
 ? driver_allows_async_probing+0x60/0x60
 bus_for_each_drv+0x4f/0x90
 __device_attach+0xbb/0x120
 ? driver_allows_async_probing+0x60/0x60
 device_initial_probe+0x12/0x20
 bus_probe_device+0x6f/0x80
 deferred_probe_work_func+0x56/0x80
 process_one_work+0x1ce/0x390
 worker_thread+0x37/0x420
 kthread+0x115/0x130
 ? process_one_work+0x390/0x390
 ? kthread_create_on_node+0x20/0x20
 ret_from_fork+0x19/0x30
Modules linked in: gpio_exar(+) spi_pxa2xx_platform(+) 8250_exar spi_pxa2xx_pci ti_adc108s102 industrialio_triggered_buffer kfifo_buf industrialio at24
CR2: 0000000000000000
---[ end trace 8ea7faca198463b8 ]---
EIP: 0x0
Code: Unable to access opcode bytes at RIP 0xffffffd6.
EAX: 00000000 EBX: f7c74000 ECX: 00000004 EDX: 00000096
ESI: 00000000 EDI: 00000000 EBP: c1157d88 ESP: c1157d70
DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: ffffffd6 CR3: 03778000 CR4: 00100010

Jan
