Return-Path: <linux-gpio+bounces-18670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85389A84306
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 14:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66CB91B8662D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Apr 2025 12:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F6F284B4A;
	Thu, 10 Apr 2025 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/Gd1EqT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EE5267F64;
	Thu, 10 Apr 2025 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744287905; cv=none; b=J70o5ARi7fa56CVaLuokYnkIU6pv9FO1XwbjF+S7PM6Ee+vORVmCM2sjY8qfNHwFDlaozmVSiz6dHWrqIJmJPuW2J0zXCbCeb2LjuC+DZxvRUEtbJ5t4tQu8bbuxZNz0x7Drhk4MPc0Z2t4SQB3ZErhHyBaHk/LZ8IZZ50i13LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744287905; c=relaxed/simple;
	bh=dTdntEGF9GLArvpbACvuaE8hfW51JaJ6oHb1cznBLVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf8ezumvq/VFis5dcug6UIhf6onOZaVkPRiQkT4POPMSbQnZPdwTfP+M/VXZXN27optE3PF+R9JYdvHR9k5So6sYUXkHDUqvUqn95V7Fb4Lz5VCX1ehOWT0+X6RyjOECgQMnaOdhy79gRtvHDYdzXy/P5yQNv01JYaYNf75qUMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/Gd1EqT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2260c91576aso5270815ad.3;
        Thu, 10 Apr 2025 05:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744287902; x=1744892702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oKOLYO8FnGN01IqnTwIrrJzZAlO0fpdQ4M5UBKeFqOA=;
        b=a/Gd1EqT65Pg6VKdL6H/llUHNHOM2+pZe40uTfdT6B2q1yE+eZY90qSrgL5EWBn4iT
         X1aW9/B6XAKUZtyrpsxeJDOAYkewoQdVrdvT/kNfZ/CJArSNhj/s0ffllMDiLd5lZHEb
         9zTgJDu5u+jWfIO30dXD+KqqucyCt3soH6xr0/sCrfhHXxIJpcgV2EamxcD111MoIFu+
         +sYUWaP8nlQMHlwvzBv8UUtQLNSG1Qw7PJdrzRO2KIwgsAeful8hBud9dH5X+IPTSkmC
         I1A1lwIQEW2q0k6yKIZqTdljRRKBp6PTCLAFDDMlxdNFMXsHlqcQqdkGGNIw1ZHYFS/n
         Jy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287902; x=1744892702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKOLYO8FnGN01IqnTwIrrJzZAlO0fpdQ4M5UBKeFqOA=;
        b=uXh5FsVn2uK9MoTBhb6rkjlHhoqWFpHCuB4r6bxV+l2mwa+9xs+p4qSelUg0s/2UP0
         R3iHp2XthH0S3xMt50ZjDDV2R1phoWj99PHMbeznpB1sVgzQyXML0LhqmeLC7Jft/Ntq
         w7P91gh4Tv1QLffhl7br0FbcWk+bkxDAo5226vwCFdTKLM+DZVY2UPayS/GFUB+G/9iF
         yTOs47T6rmbicOF3qcOR92YRKMIbJpNBaSMeqAdZqw2ngKdK9n2eCyT/61Q+cecS4dfF
         k40C+/2QS8YyfCq92L8p8XFxm60iNb1EKLwam10oX5PXRiHsc7I70Eiogn7cte5JcoHA
         iz3A==
X-Forwarded-Encrypted: i=1; AJvYcCU+y1w1I1haZki0jRhDFqHo1lgvLS2IqHVAHQXUXRmCu+o09SHC8ti1WuQTuC1gJBttwQEs9d3A0Opuky2jIXE=@vger.kernel.org, AJvYcCU/o8/ZFFNKiJvc6Tlths06WpaJwBFYfwZBBBsEMq+83BO5ACHkV2xYF4Ot4j5wa6wXdEzgV6sHgFXtSrSaElFk336dCQ==@vger.kernel.org, AJvYcCUTwovbiqCr9Q+IDKLqiZIo6ZMyV+v/qyxX0aa1TOsKiQ0N/gfjdGTv32/zJZJDeH5Jh/tXbov7JXvQ5iUM@vger.kernel.org, AJvYcCVSM0J00jajaaRH+/rGgqH9HXVdh9XBY2KkdEd/ZHdSCu1CaBXX0BztvlkHPiOlERGbrI/pokiGW9MB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm1YeRdUxEqIao4tjagtaCS6QRHJs99c4Eahicq51Uq0nGIoFt
	b8ycOXhiuYxZLkifOIVBVdSEn55SI5S2zXhqFHgIHucpEhhSeL65
X-Gm-Gg: ASbGnctKEyff7kP4qz+s2gUyMXy6qUZeWEETQHfiTDfcu2Oob2Mz1DZdZXw8cdLWsef
	MhNiUpqub2x+sshXsykRPki55sXLf+FWMvw10R9cWXx2wwBVEzfmcYmT4IRfq5IJim16MDZ88+c
	BhoDnYTu7Cixlrt91MGSy6bY2t+cTjSj8NOzuVANmelJloa5l1kzsJw7k2g8jXX/hYOkphmS/Yf
	DDzHzBWXmWXCfzqFkhMXI2t3blAUwvH8D3T+9Q5CqsrKbk/quoM6kxgI2wtMqXMjlXDv/LQrV14
	EZAaDDz5CsyghwVQ0Ri8mZMUpOVaC7wRZQYQY1bzzFRegNBSaH8w03jMe+KVa8m7FIiP6N57p3y
	u/4AedK3+acya7ScHybnkjx9x
X-Google-Smtp-Source: AGHT+IEvHnk+ya9JlBhjAetYTJPo8LZRwfHCpGUX70o5A/0qbdG1bQh/Qn8alZ/7QgCmYF3vSTIwIw==
X-Received: by 2002:a17:903:1d2:b0:220:ca08:8986 with SMTP id d9443c01a7336-22b2ede9785mr42047585ad.22.1744287902421;
        Thu, 10 Apr 2025 05:25:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97212sm28722945ad.119.2025.04.10.05.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:25:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a24155a3-281b-433d-9964-eedc40ae2bf8@roeck-us.net>
Date: Thu, 10 Apr 2025 05:25:00 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Yen-Chi Huang <jesse.huang@portwell.com.tw>
Cc: Hans de Goede <hdegoede@redhat.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, wim@linux-watchdog.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, jay.chen@canonical.com
References: <d6b14c26-e70b-4edb-8661-b213e3fed9d4@portwell.com.tw>
 <475693ed-d11c-024a-c9f3-a270ab5b68a3@linux.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <475693ed-d11c-024a-c9f3-a270ab5b68a3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/10/25 05:07, Ilpo Järvinen wrote:
> On Thu, 10 Apr 2025, Yen-Chi Huang wrote:
> 
>> Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
>> It integrates with the Linux GPIO and watchdog subsystems to provide:
>>
>> - Control/monitoring of up to 8 EC GPIO pins.
>> - Hardware watchdog timer with 1-255 second timeouts.
>>
>> The driver communicates with the EC via I/O port 0xe300 and identifies
>> the hardware by the "PWG" firmware signature. This enables enhanced
>> system management for Portwell embedded/industrial platforms.
>>
>> Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
>> ---
>> V2->V3:
>>    - Reworked based on review from Bartosz Golaszewski
>>    - Changed to use platform_driver and platform_device
>>    - Updated GPIO to use .set_rv() instead of .set()
>>    - Used devm_ helpers for request_region, GPIO and watchdog registration
>>
>> V1->V2:
>>    - Addressed review comments from Ilpo Jarvinen
>>    - Add DMI system check to avoid running on unsupported platforms
>>    - Add 'force' module parameter to override DMI matching
>>    - Use request_region() to claim I/O port access
>>    - Extend WDT timeout handling to use both minute and second registers
>>    - Increase WDT max timeout from 255s to 15300s
>>    - Use named defines for WDT enable/disable
>>    - Remove dummy pr_info() messages
>>    - Fix several coding style issues (comments, alignment, spacing)
>> ---
>>   MAINTAINERS                        |   6 +
>>   drivers/platform/x86/Kconfig       |  14 ++
>>   drivers/platform/x86/Makefile      |   3 +
>>   drivers/platform/x86/portwell-ec.c | 292 +++++++++++++++++++++++++++++
>>   4 files changed, 315 insertions(+)
>>   create mode 100644 drivers/platform/x86/portwell-ec.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d5dfb9186962..c52f819786dc 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19132,6 +19132,12 @@ F:	kernel/time/itimer.c
>>   F:	kernel/time/posix-*
>>   F:	kernel/time/namespace.c
>>   
>> +PORTWELL EC DRIVER
>> +M:	Yen-Chi Huang <jesse.huang@portwell.com.tw>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/platform/x86/portwell-ec.c
>> +
>>   POWER MANAGEMENT CORE
>>   M:	"Rafael J. Wysocki" <rafael@kernel.org>
>>   L:	linux-pm@vger.kernel.org
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 43407e76476b..2f26d1bf0a75 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -779,6 +779,20 @@ config PCENGINES_APU2
>>   	  To compile this driver as a module, choose M here: the module
>>   	  will be called pcengines-apuv2.
>>   
>> +config PORTWELL_EC
>> +	tristate "Portwell Embedded Controller driver"
>> +	depends on X86 && HAS_IOPORT && WATCHDOG && GPIOLIB
>> +	help
>> +	  This driver provides support for the GPIO pins and watchdog timer
>> +	  embedded in Portwell's EC.
>> +
>> +	  Theoretically, this driver should work on multiple Portwell platforms,
>> +	  but it has only been tested on the Portwell NANO-6064 board.
>> +	  If you encounter any issues on other boards, please report them.
>> +
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called portwell-ec.
>> +
>>   config BARCO_P50_GPIO
>>   	tristate "Barco P50 GPIO driver for identify LED/button"
>>   	depends on GPIOLIB
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index 650dfbebb6c8..83dd82e04457 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -92,6 +92,9 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
>>   # PC Engines
>>   obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
>>   
>> +# Portwell
>> +obj-$(CONFIG_PORTWELL_EC)	+= portwell-ec.o
>> +
>>   # Barco
>>   obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
>>   
>> diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
>> new file mode 100644
>> index 000000000000..7a60ced0c984
>> --- /dev/null
>> +++ b/drivers/platform/x86/portwell-ec.c
>> @@ -0,0 +1,292 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * portwell-ec.c: Portwell embedded controller driver.
>> + *
>> + * Tested on:
>> + *  - Portwell NANO-6064
>> + *
>> + * This driver provides support for GPIO and Watchdog Timer
>> + * functionalities of the Portwell boards with ITE embedded controller (EC).
>> + * The EC is accessed through I/O ports and provides:
>> + *  - 8 GPIO pins for control and monitoring
>> + *  - Hardware watchdog with 1-15300 second timeout range
>> + *
>> + * It integrates with the Linux GPIO and Watchdog subsystems, allowing
>> + * userspace interaction with EC GPIO pins and watchdog control,
>> + * ensuring system stability and configurability.
>> + *
>> + * (C) Copyright 2025 Portwell, Inc.
>> + * Author: Yen-Chi Huang (jesse.huang@portwell.com.tw)
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/dmi.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/init.h>
>> +#include <linux/io.h>
>> +#include <linux/ioport.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/string.h>
>> +#include <linux/watchdog.h>
>> +
>> +#define PORTWELL_EC_IOSPACE 0xe300
>> +#define PORTWELL_EC_IOSPACE_LEN 0x100
> 
> SZ_256 + add #include for it.
> 
>> +
>> +#define PORTWELL_GPIO_PINS 8
>> +#define PORTWELL_GPIO_DIR_REG 0x2b
>> +#define PORTWELL_GPIO_VAL_REG 0x2c
>> +
>> +#define PORTWELL_WDT_EC_CONFIG_ADDR 0x06
>> +#define PORTWELL_WDT_CONFIG_ENABLE 0x1
>> +#define PORTWELL_WDT_CONFIG_DISABLE 0x0
> 
> Align values.
> 
>> +#define PORTWELL_WDT_EC_COUNT_MIN_ADDR 0x07
>> +#define PORTWELL_WDT_EC_COUNT_SEC_ADDR 0x08
>> +#define PORTWELL_WDT_EC_MAX_COUNT_SECOND 15300 //255*60secs
> 
> Move the formula from the comment to the define itself. While doing so,
> you need to add () around it and add spaces around *.
> 
>> +
>> +#define PORTWELL_EC_FW_VENDOR_ADDRESS 0x4d
>> +#define PORTWELL_EC_FW_VENDOR_LENGTH 3
>> +#define PORTWELL_EC_FW_VENDOR_NAME "PWG"
>> +
>> +static bool force;
>> +module_param(force, bool, 0444);
>> +MODULE_PARM_DESC(force, "Force loading ec driver without checking DMI boardname");
> 
> EC
> 
>> +static const struct dmi_system_id pwec_dmi_table[] = {
>> +	{
>> +		.ident = "NANO-6064 series",
>> +		.matches = {
>> +			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
>> +		},
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(dmi, pwec_dmi_table);
>> +
>> +/* Functions for access EC via IOSPACE*/
>> +
>> +static void pwec_write(u8 index, u8 data)
>> +{
>> +	outb(data, PORTWELL_EC_IOSPACE + index);
>> +}
>> +
>> +static u8 pwec_read(u8 address)
>> +{
>> +	return inb(PORTWELL_EC_IOSPACE + address);
>> +}
>> +
>> +/* GPIO functions*/
> 
> Missing space. Please check all your comments as the one above seems to
> have the same lack of space at the end.
> 
>> +
>> +static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +	return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0;
>> +}
>> +
>> +static int pwec_gpio_set_rv(struct gpio_chip *chip, unsigned int offset, int val)
>> +{
>> +	u8 tmp = pwec_read(PORTWELL_GPIO_VAL_REG);
>> +
>> +	if (val)
>> +		tmp |= (1 << offset);
>> +	else
>> +		tmp &= ~(1 << offset);
>> +	pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
> 
> Add empty line here.
> 
>> +	return 0;
>> +}
>> +
>> +static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +	u8 direction = pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset);
>> +
>> +	if (direction)
>> +		return GPIO_LINE_DIRECTION_IN;
>> +	else
>> +		return GPIO_LINE_DIRECTION_OUT;
>> +}
>> +
>> +/*
>> + * Changing direction causes issues on some boards,
>> + * so direction_input and direction_output are disabled for now.
>> + */
>> +
>> +static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static struct gpio_chip pwec_gpio_chip = {
>> +	.label = "portwell-ec-gpio",
>> +	.get_direction = pwec_gpio_get_direction,
>> +	.direction_input = pwec_gpio_direction_input,
>> +	.direction_output = pwec_gpio_direction_output,
>> +	.get = pwec_gpio_get,
>> +	.set_rv = pwec_gpio_set_rv,
>> +	.base = -1,
>> +	.ngpio = PORTWELL_GPIO_PINS,
>> +};
>> +
>> +/* Watchdog functions*/
>> +
>> +static int pwec_wdt_trigger(struct watchdog_device *wdd)
>> +{
>> +	int retry = 10;
>> +	u8 min, sec;
>> +	unsigned int timeout;
>> +
>> +	do {
>> +		pwec_write(PORTWELL_WDT_EC_COUNT_MIN_ADDR, wdd->timeout / 60);
>> +		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout % 60);
>> +		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, PORTWELL_WDT_CONFIG_ENABLE);
>> +		min = pwec_read(PORTWELL_WDT_EC_COUNT_MIN_ADDR);
>> +		sec = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
>> +		timeout = min * 60 + sec;
> 
> This readback could reuse pwec_wdt_get_timeleft().
> 
>> +		retry--;
> 
> Decrementing could be done within the condition that checks it.
> 
>> +	} while (timeout != wdd->timeout && retry >= 0);
> 
> Is this write until timeout matches the one written typical thing for
> watchdog drivers, or is there something specific to this HW you should
> comment + note in the changelog so it is recorded for future readers of
> this code?
> 

No, this is absolutely not typical, and it has nothing to do with watchdog
drivers in the first place. If the code was in drivers/watchdog/ I'd
request a detailed comment explaining why it is needed.

Guenter


