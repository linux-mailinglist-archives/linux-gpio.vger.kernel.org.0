Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE109AA60
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 10:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391013AbfHWIb6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 04:31:58 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44488 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733069AbfHWIb5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 23 Aug 2019 04:31:57 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id A4ECE6978710F9AB2DA6;
        Fri, 23 Aug 2019 16:31:55 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Fri, 23 Aug 2019
 16:31:52 +0800
Subject: Re: [PATCH] gpio: Fix irqchip initialization order
To:     Linus Walleij <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>
References: <20190820080527.11796-1-linus.walleij@linaro.org>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>
From:   Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5D5FA478.6090707@hisilicon.com>
Date:   Fri, 23 Aug 2019 16:31:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20190820080527.11796-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 2019/8/20 16:05, Linus Walleij wrote:
> The new API for registering a gpio_irq_chip along with a
> gpio_chip has a different semantic ordering than the old
> API which added the irqchip explicitly after registering
> the gpio_chip.
>
> Move the calls to add the gpio_irq_chip *last* in the
> function, so that the different hooks setting up OF and
> ACPI and machine gpio_chips are called *before* we try
> to register the interrupts, preserving the elder semantic
> order.
>
> This cropped up in the PL061 driver which used to work
> fine with no special ACPI quirks, but started to misbehave
> using the new API.
>
> Fixes: e0d897289813 ("gpio: Implement tighter IRQ chip integration")
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Wei Xu <xuwei5@hisilicon.com>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reported-by: Wei Xu <xuwei5@hisilicon.com>
> Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Wei: it would be great if you could test this and
> confirm if it solves your problem, so I can apply this
> for fixes.

Sorry for the late reply!
There are some issues about my mail filter.

Yes, this fixes the problem and tested based on gpio/devel branch.
So,

Tested-by: Wei Xu <xuwei5@hisilicon.com>

Thanks!

The log is as below:

     estuary:/$ cat /proc/interrupts
                CPU0
       2:       2610     GICv3  27 Level     arch_timer
       4:         33     GICv3  33 Level     uart-pl011
      42:          0     GICv3  23 Level     arm-pmu
      43:          0  ARMH0061:00   3 Edge      ACPI:Event
     IPI0:         0       Rescheduling interrupts
     IPI1:         0       Function call interrupts
     IPI2:         0       CPU stop interrupts
     IPI3:         0       CPU stop (for crash dump) interrupts
     IPI4:         0       Timer broadcast interrupts
     IPI5:         0       IRQ work interrupts
     IPI6:         0       CPU wake-up interrupts
     Err:          0

     estuary:/$ dmesg | more
     [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd070]
     [    0.000000] Linux version 5.3.0-rc1-00036-gbe23e9a 
(joyx@Turing-Arch-b) (gcc version 4.9.1 20140505 (prerelease) 
(crosstool-NG linaro-1.13.1-4.9-2014.05 - Linaro GCC 4.9-2014.05)) #64 
SMP Fri Aug 23 16:05:08 CST 2019

     commit be23e9a097e55d6733eec4336c078fda93339265
     Author: Linus Walleij <linus.walleij@linaro.org>
     Date:   Tue Aug 20 10:05:27 2019 +0200

         gpio: Fix irqchip initialization order

Best Regards,
Wei

> ---
>   drivers/gpio/gpiolib.c | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 80a2a2cb673b..cca749010cd0 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1373,21 +1373,13 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>   	if (status)
>   		goto err_remove_from_list;
>   
> -	status = gpiochip_irqchip_init_valid_mask(chip);
> -	if (status)
> -		goto err_remove_from_list;
> -
>   	status = gpiochip_alloc_valid_mask(chip);
>   	if (status)
> -		goto err_remove_irqchip_mask;
> -
> -	status = gpiochip_add_irqchip(chip, lock_key, request_key);
> -	if (status)
> -		goto err_free_gpiochip_mask;
> +		goto err_remove_from_list;
>   
>   	status = of_gpiochip_add(chip);
>   	if (status)
> -		goto err_remove_chip;
> +		goto err_free_gpiochip_mask;
>   
>   	status = gpiochip_init_valid_mask(chip);
>   	if (status)
> @@ -1413,6 +1405,14 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>   
>   	machine_gpiochip_add(chip);
>   
> +	status = gpiochip_irqchip_init_valid_mask(chip);
> +	if (status)
> +		goto err_remove_acpi_chip;
> +
> +	status = gpiochip_add_irqchip(chip, lock_key, request_key);
> +	if (status)
> +		goto err_remove_irqchip_mask;
> +
>   	/*
>   	 * By first adding the chardev, and then adding the device,
>   	 * we get a device node entry in sysfs under
> @@ -1424,21 +1424,21 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>   	if (gpiolib_initialized) {
>   		status = gpiochip_setup_dev(gdev);
>   		if (status)
> -			goto err_remove_acpi_chip;
> +			goto err_remove_irqchip;
>   	}
>   	return 0;
>   
> +err_remove_irqchip:
> +	gpiochip_irqchip_remove(chip);
> +err_remove_irqchip_mask:
> +	gpiochip_irqchip_free_valid_mask(chip);
>   err_remove_acpi_chip:
>   	acpi_gpiochip_remove(chip);
>   err_remove_of_chip:
>   	gpiochip_free_hogs(chip);
>   	of_gpiochip_remove(chip);
> -err_remove_chip:
> -	gpiochip_irqchip_remove(chip);
>   err_free_gpiochip_mask:
>   	gpiochip_free_valid_mask(chip);
> -err_remove_irqchip_mask:
> -	gpiochip_irqchip_free_valid_mask(chip);
>   err_remove_from_list:
>   	spin_lock_irqsave(&gpio_lock, flags);
>   	list_del(&gdev->list);


