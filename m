Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8EFDB7568
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Sep 2019 10:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728879AbfISIqe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Sep 2019 04:46:34 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55885 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfISIqd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Sep 2019 04:46:33 -0400
Received: by mail-wm1-f66.google.com with SMTP id a6so3351468wma.5
        for <linux-gpio@vger.kernel.org>; Thu, 19 Sep 2019 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i1jCkc2uSM66AphX1szTxKAsPyo7n62qvDtk4q20GYQ=;
        b=VD6UGLjqZUV+xZ1oUX73zHOfIHByj3UsgvPl0mwwbm7Cywu+gobuwqJh196L7lbkB1
         32HaNGUhK1ut4XKRqI7MNYJk2qc47lvTkDQXcQWrdP/BeD7JK1pMszfACNb53M6deebn
         82WqjP9yOtOjL4DqxAxPid3kKQoOR6u2yWm+W9isEUCMRwzDQB1a7czq4lIG4jbombJn
         C4yHfMFgE5V3sPzbkBlPpC262ERDHuf8lqJVrQp60TLu5n8L9/bciBqcROkxQ9xkBMXK
         5l8dAgLlYYYwUfoAaeE+OzWUApiQ0avhMB+S8IeBkASPbtdN5xTHJXv/r13DOf/BTEPo
         7IaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i1jCkc2uSM66AphX1szTxKAsPyo7n62qvDtk4q20GYQ=;
        b=VV/jQRV65/nCZ28WU6P0f+ziIHiNE6m3aWrDQ9Kh4WGwukF4Qs8cbaFUrp2KiP83um
         vzDW37skdyzuhJdzeFAKswpsdEz8OhyJak9dwC3Q+TNiQ98Fwflqewbvacp/CBuO37ye
         g4ELS/Ds8dxIctCjnS7CW8GOZTljAGnWmyiOLW8/Wxc9ULBoJDo7s6840gXz5MafqJIp
         Pgya+boojKeN7NtsKEuZieFpnVaQGlIFgYuqxwGxSOK+9iNYd13FPpSD7ukLKBHSIDh9
         9gQ2wtDcAWo8mzThMHLzes9xbi7KWfbLTW4S0iMShIOS5+Npc90SimaJVzYBU6MthEfp
         U5bQ==
X-Gm-Message-State: APjAAAVT1p9t0y2fnkaR3xJ3w2UTmQyg+iiFOFhC92aUtKQi8QftCiCE
        XMjC2b6ed2L71ecxDRTQMnqqQQ==
X-Google-Smtp-Source: APXvYqzJQTkD3APsv1SCfkWNnvLm/8DC8i/UgXsiLyBoMU91Sas1npdN+K+h0yDCHcu6Wav7tTRRxQ==
X-Received: by 2002:a1c:a796:: with SMTP id q144mr1822660wme.15.1568882790415;
        Thu, 19 Sep 2019 01:46:30 -0700 (PDT)
Received: from [66.102.1.108] ([149.199.62.129])
        by smtp.gmail.com with ESMTPSA id s5sm10782207wro.27.2019.09.19.01.46.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 01:46:29 -0700 (PDT)
Subject: Re: [PATCH v2] microblaze: Switch to standard restart handler
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
References: <20190823094728.15012-1-linus.walleij@linaro.org>
From:   Michal Simek <monstr@monstr.eu>
Message-ID: <2a71bee2-a378-3513-5300-f30bf7f8b102@monstr.eu>
Date:   Thu, 19 Sep 2019 10:46:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823094728.15012-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23. 08. 19 11:47, Linus Walleij wrote:
> The microblaze uses the legacy APIs to dig out a GPIO pin
> defined in the root of the device tree to issue a hard
> reset of the platform.
> 
> Asserting a hard reset should be done using the standard
> DT-enabled and fully GPIO descriptor aware driver in
> drivers/power/reset/gpio-restart.c using the bindings
> from Documentation/devicetree/bindings/power/reset/gpio-restart.txt
> 
> To achieve this, first make sure microblaze makes use of
> the standard kernel restart path utilizing do_kernel_restart()
> from <linux/reboot.h>. Put in some grace time and an
> emergency print if the restart does not properly assert.
> 
> As this is basic platform functionality we patch the DTS
> file and defconfig in one go for a lockstep change.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michal Simek <monstr@monstr.eu>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix the reset GPIOs property in the DTS file to be
>   just "gpios" as expected by the driver.
> 
> Hi Michal, would be great if you could test and fix this up
> so I can get rid of one more site where legacy GPIO is used.
> I am unsure of the appropriate polarity and delays, hence the
> comments in the DTS file.
> ---
>  arch/microblaze/boot/dts/system.dts     | 16 +++++-
>  arch/microblaze/configs/mmu_defconfig   |  2 +
>  arch/microblaze/configs/nommu_defconfig |  2 +
>  arch/microblaze/include/asm/setup.h     |  1 -
>  arch/microblaze/kernel/reset.c          | 76 -------------------------
>  arch/microblaze/mm/init.c               | 11 ++++
>  6 files changed, 30 insertions(+), 78 deletions(-)
> 
> diff --git a/arch/microblaze/boot/dts/system.dts b/arch/microblaze/boot/dts/system.dts
> index 5a8a9d090c37..5b236527176e 100644
> --- a/arch/microblaze/boot/dts/system.dts
> +++ b/arch/microblaze/boot/dts/system.dts
> @@ -18,7 +18,6 @@
>  	#address-cells = <1>;
>  	#size-cells = <1>;
>  	compatible = "xlnx,microblaze";
> -	hard-reset-gpios = <&LEDs_8Bit 2 1>;
>  	model = "testing";
>  	DDR2_SDRAM: memory@90000000 {
>  		device_type = "memory";
> @@ -281,6 +280,21 @@
>  				gpios = <&LEDs_8Bit 7 1>;
>  			};
>  		} ;
> +
> +		gpio-restart {
> +			compatible = "gpio-restart";
> +			/*
> +			 * FIXME: is this active low or active high?
> +			 * the current flag (1) indicates active low.
> +			 * delay measures are templates, should be adjusted
> +			 * to datasheet or trial-and-error with real hardware.
> +			 */
> +			gpios = <&LEDs_8Bit 2 1>;
> +			active-delay = <100>;
> +			inactive-delay = <10>;
> +			wait-delay = <100>;
> +		};
> +
>  		RS232_Uart_1: serial@84000000 {
>  			clock-frequency = <125000000>;
>  			compatible = "xlnx,xps-uartlite-1.00.a";
> diff --git a/arch/microblaze/configs/mmu_defconfig b/arch/microblaze/configs/mmu_defconfig
> index 92fd4e95b488..ae8d7d407ff4 100644
> --- a/arch/microblaze/configs/mmu_defconfig
> +++ b/arch/microblaze/configs/mmu_defconfig
> @@ -59,6 +59,8 @@ CONFIG_SPI_XILINX=y
>  CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SYSFS=y
>  CONFIG_GPIO_XILINX=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_GPIO_RESTART=y
>  # CONFIG_HWMON is not set
>  CONFIG_WATCHDOG=y
>  CONFIG_XILINX_WATCHDOG=y
> diff --git a/arch/microblaze/configs/nommu_defconfig b/arch/microblaze/configs/nommu_defconfig
> index 06d69a6e192d..a2a6be511551 100644
> --- a/arch/microblaze/configs/nommu_defconfig
> +++ b/arch/microblaze/configs/nommu_defconfig
> @@ -62,6 +62,8 @@ CONFIG_SPI_XILINX=y
>  CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SYSFS=y
>  CONFIG_GPIO_XILINX=y
> +CONFIG_POWER_RESET=y
> +CONFIG_POWER_RESET_GPIO_RESTART=y
>  # CONFIG_HWMON is not set
>  CONFIG_WATCHDOG=y
>  CONFIG_XILINX_WATCHDOG=y
> diff --git a/arch/microblaze/include/asm/setup.h b/arch/microblaze/include/asm/setup.h
> index ce9b7b786156..54d634ed98e6 100644
> --- a/arch/microblaze/include/asm/setup.h
> +++ b/arch/microblaze/include/asm/setup.h
> @@ -29,7 +29,6 @@ void machine_early_init(const char *cmdline, unsigned int ram,
>  		unsigned int fdt, unsigned int msr, unsigned int tlb0,
>  		unsigned int tlb1);
>  
> -void machine_restart(char *cmd);
>  void machine_shutdown(void);
>  void machine_halt(void);
>  void machine_power_off(void);
> diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
> index fcbe1daf6316..b56af4eb91bf 100644
> --- a/arch/microblaze/kernel/reset.c
> +++ b/arch/microblaze/kernel/reset.c
> @@ -10,82 +10,6 @@
>  #include <linux/init.h>
>  #include <linux/of_platform.h>
>  
> -/* Trigger specific functions */
> -#ifdef CONFIG_GPIOLIB
> -
> -#include <linux/of_gpio.h>
> -
> -static int handle; /* reset pin handle */
> -static unsigned int reset_val;
> -
> -static int of_platform_reset_gpio_probe(void)
> -{
> -	int ret;
> -	handle = of_get_named_gpio(of_find_node_by_path("/"),
> -				   "hard-reset-gpios", 0);
> -
> -	if (!gpio_is_valid(handle)) {
> -		pr_info("Skipping unavailable RESET gpio %d (%s)\n",
> -				handle, "reset");
> -		return -ENODEV;
> -	}
> -
> -	ret = gpio_request(handle, "reset");
> -	if (ret < 0) {
> -		pr_info("GPIO pin is already allocated\n");
> -		return ret;
> -	}
> -
> -	/* get current setup value */
> -	reset_val = gpio_get_value(handle);
> -	/* FIXME maybe worth to perform any action */
> -	pr_debug("Reset: Gpio output state: 0x%x\n", reset_val);
> -
> -	/* Setup GPIO as output */
> -	ret = gpio_direction_output(handle, 0);
> -	if (ret < 0)
> -		goto err;
> -
> -	/* Setup output direction */
> -	gpio_set_value(handle, 0);
> -
> -	pr_info("RESET: Registered gpio device: %d, current val: %d\n",
> -							handle, reset_val);
> -	return 0;
> -err:
> -	gpio_free(handle);
> -	return ret;
> -}
> -device_initcall(of_platform_reset_gpio_probe);
> -
> -
> -static void gpio_system_reset(void)
> -{
> -	if (gpio_is_valid(handle))
> -		gpio_set_value(handle, 1 - reset_val);
> -	else
> -		pr_notice("Reset GPIO unavailable - halting!\n");
> -}
> -#else
> -static void gpio_system_reset(void)
> -{
> -	pr_notice("No reset GPIO present - halting!\n");
> -}
> -
> -void of_platform_reset_gpio_probe(void)
> -{
> -	return;
> -}
> -#endif
> -
> -void machine_restart(char *cmd)
> -{
> -	pr_notice("Machine restart...\n");
> -	gpio_system_reset();
> -	while (1)
> -		;
> -}
> -
>  void machine_shutdown(void)
>  {
>  	pr_notice("Machine shutdown...\n");
> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> index a015a951c8b7..4a45e037107f 100644
> --- a/arch/microblaze/mm/init.c
> +++ b/arch/microblaze/mm/init.c
> @@ -17,6 +17,8 @@
>  #include <linux/slab.h>
>  #include <linux/swap.h>
>  #include <linux/export.h>
> +#include <linux/delay.h>
> +#include <linux/reboot.h>
>  
>  #include <asm/page.h>
>  #include <asm/mmu_context.h>
> @@ -265,6 +267,15 @@ static void __init mmu_init_hw(void)
>  			: : : "r11");
>  }
>  
> +void machine_restart(char *cmd)
> +{
> +	do_kernel_restart(cmd);
> +	/* Give the restart hook 1 s to take us down */
> +	mdelay(1000);
> +	pr_emerg("Reboot failed -- System halted\n");
> +	while (1);
> +}
> +
>  /*
>   * MMU_init sets up the basic memory mappings for the kernel,
>   * including both RAM and possibly some I/O regions,
> 

I have applied it but moved machine_restart() back to reset.c

Thanks,
Michal
