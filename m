Return-Path: <linux-gpio+bounces-29097-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5206C8AAD1
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 16:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 945783B779C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Nov 2025 15:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4BC33A037;
	Wed, 26 Nov 2025 15:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoKRnaru"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07775339B5A
	for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171291; cv=none; b=M528nZev+vDvp2iiUtsbC0zV9PoLva2+6/Js5B8GrCeaRORpf2zG7iavB2ypSRXxZ4WH5UMNPxMSuvbsHCgzI4fV59dTz/AFhW5coJlG3z+kWx3qOPmoqv8kKJrljTzysM+Vz9boX1V7Ta81RyKf26TAv4qyLa5z06guFJ82z3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171291; c=relaxed/simple;
	bh=aProgwVBj3U0BoxkXxzrbHoJjYT/aiNLLo5cWfV7KGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xo69QStjKhA4yY9R5aG5YAgImmuMKuNFVQMHVthTB/kUo3i14L+WFWhg+Jnr0DFBLiVxaQvQG3Vcf3LFVyYgKgxySKe2S2ctkHOqrvqNdUnIzGrVOcqqkQ50+1avS/KdYdp8j0ve9S/HaMC6gxn+34nCftfYnt89KurZAhe+Xic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoKRnaru; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477b91680f8so54022685e9.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Nov 2025 07:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764171286; x=1764776086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYkaZ8TnbXXtoLkQzNGOnmys3JotwpaAww9y5QGyyEo=;
        b=SoKRnaruRPqIBVuGYMHSQPPNlO1KflOJK87CWmtvs45QztVUyVcZqEGBQI/PPzP8ya
         MVtLDcT91QLD8cgt4XUs+71AhOFYMK7BoCFot7Zz+BkzS+Qpu2Lx3/TK0PqXsKV7PXP0
         jrfA58gvd+yePUzmahGnqi6wjveb1kkvgiDKR9pdysOx8kgmnNRgIKxFz30czTsZqY6G
         mFzRs1EZOTlhJA37CAs9XM23KsbCs3gqyzE7zaqJweZQJ7WBqp+25GW4UX7UoFzYhs6o
         Z8SLxrdHPBK3O89pkU7B5CeVx4ENQ3ukKldQpkJg3VOubpmAJ1a4hKBT0qV+RhRTY4w1
         9eaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171286; x=1764776086;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYkaZ8TnbXXtoLkQzNGOnmys3JotwpaAww9y5QGyyEo=;
        b=Se+2mIygoAWueL0WghSJ2eqn8BxqM6/p9oj9hQbF4ywUyRZ1dLpr9AVxXlstyOFiYP
         5tvj1+dhZ4lByEu1vtcqXMjB+Yz1ddmHsK21zlnYoSOVCU//rXxgu+xo24DuVHnEvgT9
         Uc+Kxl9Ly28CdMGY5gfXv6F7CNFOjp477D+lccFaMxB09ILbKTFj05Dl+YsSjgQhpCBi
         QxrplcFD5u/NDKyLYMgcEeEwRhgNRG+/xYj3mcJoQ/bI5zgeo6DmaeBXWZ6RYJmGjNpF
         Sr1CA6zwplVh3a98YjJg0f8nCHhoeqHB3PN8W2xiHM9RTtqTznJa6nQsC9VoTD9NTTXd
         QAug==
X-Forwarded-Encrypted: i=1; AJvYcCVSWyRR8AJ3izE0yeZ7fUTEgzahwUmUODpqN+kkvJ+b2PTEAREHrfZEoLGzsg3Fu4GB/kObbMdZsm06@vger.kernel.org
X-Gm-Message-State: AOJu0YzvBWFm/6E2xz3WG8JWZAf5ucwOL79AvrsVZELZTGKwykQQTBdO
	cDSqhaqBG7lcUqp0IaEV1z9uVILnagCgMXLjKOtsEJohnUt1caV+QC89
X-Gm-Gg: ASbGncvFcziRcYJavv87NpDNGVkJuRuaMnaMYgvEozSewqSti1x3bUPfgZtPTK/aslR
	yuUBBoNscJ6qVXzfQKQQUjhirgInVLDdJdJU3z311Y3/aroDd597ydktgnBlhSuMVW8yvMyCLAL
	at7ihZJuqOSuDt044J0HHVbC0mV14YD5gCW619u8jOEI3rKPFDVGKvYwsmdJPBe1LYNpkpsz8xz
	lFB4WBSNTUqCPeh4Yd3VbXfE/SmikXS3R2E5hlo+1d9+64HpTPOHpFcbjYc75NIwFKKlZsVgNyz
	lhsZNr5pnHXlB+ToS7C6jNyojtTtokBcQdXg9IWgDvtDaMRiucNPZOFjIDJFIccE1q7baGbXbdO
	dYYTMbvsN8SX66F1ChJwVJjUYVm8L0PPIgdMVVEcH5zY03ubBcwYYVtnwSjnGrEe3GPYm9E1eke
	0FtBoHyKcXQLr4kjEQBQ==
X-Google-Smtp-Source: AGHT+IFx/SK7hRX7/UI9dLxVLBrTB92fz4ssbOGm3C+RfVGQf0i5bnmr04E8jPg06dGxxkA22By+2w==
X-Received: by 2002:a05:600c:1c20:b0:477:9d54:58d7 with SMTP id 5b1f17b1804b1-477c1131d60mr209092795e9.29.1764171285855;
        Wed, 26 Nov 2025 07:34:45 -0800 (PST)
Received: from [192.168.0.100] ([188.27.130.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479052d95absm45415665e9.5.2025.11.26.07.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 07:34:45 -0800 (PST)
Message-ID: <2d96e464-e17c-4ff5-9a08-b215b77da04f@gmail.com>
Date: Wed, 26 Nov 2025 17:34:03 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] gpiolib: implement low-level, shared GPIO
 support
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org>
From: Cosmin Tanislav <demonsingur@gmail.com>
Content-Language: en-US
In-Reply-To: <20251112-gpio-shared-v4-3-b51f97b1abd8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/25 3:55 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This module scans the device tree (for now only OF nodes are supported
> but care is taken to make other fwnode implementations easy to
> integrate) and determines which GPIO lines are shared by multiple users.
> It stores that information in memory. When the GPIO chip exposing shared
> lines is registered, the shared GPIO descriptors it exposes are marked
> as shared and virtual "proxy" devices that mediate access to the shared
> lines are created. When a consumer of a shared GPIO looks it up, its
> fwnode lookup is redirected to a just-in-time machine lookup that points
> to this proxy device.
> 
> This code can be compiled out on platforms which don't use shared GPIOs.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/Kconfig          |   8 +
>   drivers/gpio/Makefile         |   1 +
>   drivers/gpio/gpiolib-shared.c | 540 ++++++++++++++++++++++++++++++++++++++++++
>   drivers/gpio/gpiolib-shared.h |  71 ++++++
>   4 files changed, 620 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index ce237398fa00eddad49afe995accae3abbb4b2cb..f90b4d3e77f7cab46525b7adfcf114a21d276678 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -6,6 +6,9 @@
>   config GPIOLIB_LEGACY
>   	def_bool y
>   
> +config HAVE_SHARED_GPIOS
> +	bool
> +
>   menuconfig GPIOLIB
>   	bool "GPIO Support"
>   	help
> @@ -42,6 +45,11 @@ config GPIOLIB_IRQCHIP
>   	select IRQ_DOMAIN
>   	bool
>   
> +config GPIO_SHARED
> +	def_bool y
> +	depends on HAVE_SHARED_GPIOS || COMPILE_TEST
> +	select AUXILIARY_BUS
> +
>   config DEBUG_GPIO
>   	bool "Debug GPIO calls"
>   	depends on DEBUG_KERNEL
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index ee260a0809d36cd07987f04e0ef17b05af764214..48f309c764e3286c23dbe604be933f7180f0b89a 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
>   obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
>   gpiolib-acpi-y			:= gpiolib-acpi-core.o gpiolib-acpi-quirks.o
>   obj-$(CONFIG_GPIOLIB)		+= gpiolib-swnode.o
> +obj-$(CONFIG_GPIO_SHARED)	+= gpiolib-shared.o
>   
>   # Device drivers. Generally keep list sorted alphabetically
>   obj-$(CONFIG_GPIO_REGMAP)	+= gpio-regmap.o
> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..56b9b03cbb6dbcdf095a656fc36ff321770035da
> --- /dev/null
> +++ b/drivers/gpio/gpiolib-shared.c
> @@ -0,0 +1,540 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Linaro Ltd.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/fwnode.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/idr.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/overflow.h>
> +#include <linux/printk.h>
> +#include <linux/property.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +
> +#include "gpiolib.h"
> +#include "gpiolib-shared.h"
> +
> +/* Represents a single reference to a GPIO pin. */
> +struct gpio_shared_ref {
> +	struct list_head list;
> +	/* Firmware node associated with this GPIO's consumer. */
> +	struct fwnode_handle *fwnode;
> +	/* GPIO flags this consumer uses for the request. */
> +	enum gpiod_flags flags;
> +	char *con_id;
> +	int dev_id;
> +	struct auxiliary_device adev;
> +	struct gpiod_lookup_table *lookup;
> +};
> +
> +/* Represents a single GPIO pin. */
> +struct gpio_shared_entry {
> +	struct list_head list;
> +	/* Firmware node associated with the GPIO controller. */
> +	struct fwnode_handle *fwnode;
> +	/* Hardware offset of the GPIO within its chip. */
> +	unsigned int offset;
> +	/* Index in the property value array. */
> +	size_t index;
> +	struct gpio_shared_desc *shared_desc;
> +	struct kref ref;
> +	struct list_head refs;
> +};
> +
> +static LIST_HEAD(gpio_shared_list);
> +static DEFINE_MUTEX(gpio_shared_lock);
> +static DEFINE_IDA(gpio_shared_ida);
> +
> +static struct gpio_shared_entry *
> +gpio_shared_find_entry(struct fwnode_handle *controller_node,
> +		       unsigned int offset)
> +{
> +	struct gpio_shared_entry *entry;
> +
> +	list_for_each_entry(entry, &gpio_shared_list, list) {
> +		if (entry->fwnode == controller_node && entry->offset == offset)
> +			return entry;
> +	}
> +
> +	return NULL;
> +}
> +
> +#if IS_ENABLED(CONFIG_OF)
> +static int gpio_shared_of_traverse(struct device_node *curr)
> +{
> +	struct gpio_shared_entry *entry;
> +	size_t con_id_len, suffix_len;
> +	struct fwnode_handle *fwnode;
> +	struct of_phandle_args args;
> +	struct property *prop;
> +	unsigned int offset;
> +	const char *suffix;
> +	int ret, count, i;
> +
> +	for_each_property_of_node(curr, prop) {
> +		/*
> +		 * The standard name for a GPIO property is "foo-gpios"
> +		 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
> +		 * There are some legacy device-trees which have a different
> +		 * naming convention and for which we have rename quirks in
> +		 * place in gpiolib-of.c. I don't think any of them require
> +		 * support for shared GPIOs so for now let's just ignore
> +		 * them. We can always just export the quirk list and
> +		 * iterate over it here.
> +		 */
> +		if (!strends(prop->name, "-gpios") &&
> +		    !strends(prop->name, "-gpio") &&
> +		    strcmp(prop->name, "gpios") != 0 &&
> +		    strcmp(prop->name, "gpio") != 0)
> +			continue;
> +
> +		count = of_count_phandle_with_args(curr, prop->name,
> +						   "#gpio-cells");

This call causes error messages to be printed for gpio-hog entries, like
this one from arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi:

	sdhi0-emmc-iovs-hog {
		gpio-hog;
		gpios = <RZT2H_GPIO(2, 6) GPIO_ACTIVE_HIGH>;
		output-high;
		line-name = "SD0_IOVS";
	};

For gpio-hog entries, the first element is not a phandle (gpio-hog is
already under its parent).

of_count_phandle_with_args() will however try to interpret it as a
parent either way, causing the following error to be printed.

OF: /soc/pinctrl@802c0000/sdhi0-emmc-iovs-hog: could not get #gpio-cells
for /soc/ethernet@92010000/mdio/ethernet-phy@2

RZT2H_GPIO(2, 6) expands to 22, or 0x16.

Coincidentally, in the decompiled dts file we have:

ethernet-phy@2 {
	...
	phandle = <0x16>;
};

Maybe a check for gpio-hogs should be added?

Something like the following before the call to
of_count_phandle_with_args().

if (strcmp(prop->name, "gpios") == 0 &&
     of_property_present(curr, "gpio-hog"))
	continue;

> +		if (count <= 0)
> +			continue;
> +
> +		for (i = 0; i < count; i++) {
> +			struct device_node *np __free(device_node) = NULL;
> +
> +			ret = of_parse_phandle_with_args(curr, prop->name,
> +							 "#gpio-cells", i,
> +							 &args);
> +			if (ret)
> +				continue;
> +
> +			np = args.np;
> +
> +			if (!of_property_present(np, "gpio-controller"))
> +				continue;
> +
> +			/*
> +			 * We support 1, 2 and 3 cell GPIO bindings in the
> +			 * kernel currently. There's only one old MIPS dts that
> +			 * has a one-cell binding but there's no associated
> +			 * consumer so it may as well be an error. There don't
> +			 * seem to be any 3-cell users of non-exclusive GPIOs,
> +			 * so we can skip this as well. Let's occupy ourselves
> +			 * with the predominant 2-cell binding with the first
> +			 * cell indicating the hardware offset of the GPIO and
> +			 * the second defining the GPIO flags of the request.
> +			 */
> +			if (args.args_count != 2)
> +				continue;
> +
> +			fwnode = of_fwnode_handle(args.np);
> +			offset = args.args[0];
> +
> +			entry = gpio_shared_find_entry(fwnode, offset);
> +			if (!entry) {
> +				entry = kzalloc(sizeof(*entry), GFP_KERNEL);
> +				if (!entry)
> +					return -ENOMEM;
> +
> +				entry->fwnode = fwnode_handle_get(fwnode);
> +				entry->offset = offset;
> +				entry->index = count;
> +				INIT_LIST_HEAD(&entry->refs);
> +
> +				list_add_tail(&entry->list, &gpio_shared_list);
> +			}
> +
> +			struct gpio_shared_ref *ref __free(kfree) =
> +					kzalloc(sizeof(*ref), GFP_KERNEL);
> +			if (!ref)
> +				return -ENOMEM;
> +
> +			ref->fwnode = fwnode_handle_get(of_fwnode_handle(curr));
> +			ref->flags = args.args[1];
> +
> +			if (strends(prop->name, "gpios"))
> +				suffix = "-gpios";
> +			else if (strends(prop->name, "gpio"))
> +				suffix = "-gpio";
> +			else
> +				suffix = NULL;
> +			if (!suffix)
> +				continue;
> +
> +			/* We only set con_id if there's actually one. */
> +			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
> +				ref->con_id = kstrdup(prop->name, GFP_KERNEL);
> +				if (!ref->con_id)
> +					return -ENOMEM;
> +
> +				con_id_len = strlen(ref->con_id);
> +				suffix_len = strlen(suffix);
> +
> +				ref->con_id[con_id_len - suffix_len] = '\0';
> +			}
> +
> +			ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
> +			if (ref->dev_id < 0) {
> +				kfree(ref->con_id);
> +				return -ENOMEM;
> +			}
> +
> +			if (!list_empty(&entry->refs))
> +				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
> +					 entry->offset, fwnode_get_name(entry->fwnode));
> +
> +			list_add_tail(&no_free_ptr(ref)->list, &entry->refs);
> +		}
> +	}
> +
> +	for_each_child_of_node_scoped(curr, child) {
> +		ret = gpio_shared_of_traverse(child);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int gpio_shared_of_scan(void)
> +{
> +	return gpio_shared_of_traverse(of_root);
> +}
> +#else
> +static int gpio_shared_of_scan(void)
> +{
> +	return 0;
> +}
> +#endif /* CONFIG_OF */
> +
> +static void gpio_shared_adev_release(struct device *dev)
> +{
> +
> +}
> +
> +static int gpio_shared_make_adev(struct gpio_device *gdev,
> +				 struct gpio_shared_ref *ref)
> +{
> +	struct auxiliary_device *adev = &ref->adev;
> +	int ret;
> +
> +	lockdep_assert_held(&gpio_shared_lock);
> +
> +	memset(adev, 0, sizeof(*adev));
> +
> +	adev->id = ref->dev_id;
> +	adev->name = "proxy";
> +	adev->dev.parent = gdev->dev.parent;
> +	adev->dev.release = gpio_shared_adev_release;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret)
> +		return ret;
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
> +		 dev_name(&adev->dev), gpio_device_get_label(gdev));
> +
> +	return 0;
> +}
> +
> +int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags)
> +{
> +	const char *dev_id = dev_name(consumer);
> +	struct gpio_shared_entry *entry;
> +	struct gpio_shared_ref *ref;
> +
> +	struct gpiod_lookup_table *lookup __free(kfree) =
> +			kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
> +	if (!lookup)
> +		return -ENOMEM;
> +
> +	guard(mutex)(&gpio_shared_lock);
> +
> +	list_for_each_entry(entry, &gpio_shared_list, list) {
> +		list_for_each_entry(ref, &entry->refs, list) {
> +			if (!device_match_fwnode(consumer, ref->fwnode))
> +				continue;
> +
> +			/* We've already done that on a previous request. */
> +			if (ref->lookup)
> +				return 0;
> +
> +			char *key __free(kfree) =
> +				kasprintf(GFP_KERNEL,
> +					  KBUILD_MODNAME ".proxy.%u",
> +					  ref->adev.id);
> +			if (!key)
> +				return -ENOMEM;
> +
> +			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
> +				 dev_id, key, ref->con_id ?: "none");
> +
> +			lookup->dev_id = dev_id;
> +			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
> +						       ref->con_id, lflags);
> +
> +			gpiod_add_lookup_table(no_free_ptr(lookup));
> +
> +			return 0;
> +		}
> +	}
> +
> +	/* We warn here because this can only happen if the programmer borked. */
> +	WARN_ON(1);
> +	return -ENOENT;
> +}
> +
> +static void gpio_shared_remove_adev(struct auxiliary_device *adev)
> +{
> +	lockdep_assert_held(&gpio_shared_lock);
> +
> +	auxiliary_device_uninit(adev);
> +	auxiliary_device_delete(adev);
> +}
> +
> +int gpio_device_setup_shared(struct gpio_device *gdev)
> +{
> +	struct gpio_shared_entry *entry;
> +	struct gpio_shared_ref *ref;
> +	unsigned long *flags;
> +	int ret;
> +
> +	guard(mutex)(&gpio_shared_lock);
> +
> +	list_for_each_entry(entry, &gpio_shared_list, list) {
> +		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
> +			continue;
> +
> +		if (list_count_nodes(&entry->refs) <= 1)
> +			continue;
> +
> +		flags = &gdev->descs[entry->offset].flags;
> +
> +		__set_bit(GPIOD_FLAG_SHARED, flags);
> +		/*
> +		 * Shared GPIOs are not requested via the normal path. Make
> +		 * them inaccessible to anyone even before we register the
> +		 * chip.
> +		 */
> +		__set_bit(GPIOD_FLAG_REQUESTED, flags);
> +
> +		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
> +			 entry->offset, gpio_device_get_label(gdev));
> +
> +		list_for_each_entry(ref, &entry->refs, list) {
> +			pr_debug("Setting up a shared GPIO entry for %s\n",
> +				 fwnode_get_name(ref->fwnode));
> +
> +			ret = gpio_shared_make_adev(gdev, ref);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +void gpio_device_teardown_shared(struct gpio_device *gdev)
> +{
> +	struct gpio_shared_entry *entry;
> +	struct gpio_shared_ref *ref;
> +
> +	guard(mutex)(&gpio_shared_lock);
> +
> +	list_for_each_entry(entry, &gpio_shared_list, list) {
> +		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
> +			continue;
> +
> +		list_for_each_entry(ref, &entry->refs, list) {
> +			gpiod_remove_lookup_table(ref->lookup);
> +			kfree(ref->lookup->table[0].key);
> +			kfree(ref->lookup);
> +			ref->lookup = NULL;
> +			gpio_shared_remove_adev(&ref->adev);
> +		}
> +	}
> +}
> +
> +static void gpio_shared_release(struct kref *kref)
> +{
> +	struct gpio_shared_entry *entry =
> +		container_of(kref, struct gpio_shared_entry, ref);
> +	struct gpio_shared_desc *shared_desc = entry->shared_desc;
> +
> +	guard(mutex)(&gpio_shared_lock);
> +
> +	gpio_device_put(shared_desc->desc->gdev);
> +	if (shared_desc->can_sleep)
> +		mutex_destroy(&shared_desc->mutex);
> +	kfree(shared_desc);
> +	entry->shared_desc = NULL;
> +}
> +
> +static void gpiod_shared_put(void *data)
> +{
> +	struct gpio_shared_entry *entry = data;
> +
> +	lockdep_assert_not_held(&gpio_shared_lock);
> +
> +	kref_put(&entry->ref, gpio_shared_release);
> +}
> +
> +static struct gpio_shared_desc *
> +gpiod_shared_desc_create(struct gpio_shared_entry *entry)
> +{
> +	struct gpio_shared_desc *shared_desc;
> +	struct gpio_device *gdev;
> +
> +	shared_desc = kzalloc(sizeof(*shared_desc), GFP_KERNEL);
> +	if (!shared_desc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	gdev = gpio_device_find_by_fwnode(entry->fwnode);
> +	if (!gdev) {
> +		kfree(shared_desc);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	shared_desc->desc = &gdev->descs[entry->offset];
> +	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
> +	if (shared_desc->can_sleep)
> +		mutex_init(&shared_desc->mutex);
> +	else
> +		spin_lock_init(&shared_desc->spinlock);
> +
> +	return shared_desc;
> +}
> +
> +static struct gpio_shared_entry *gpiod_shared_find(struct auxiliary_device *adev)
> +{
> +	struct gpio_shared_desc *shared_desc;
> +	struct gpio_shared_entry *entry;
> +	struct gpio_shared_ref *ref;
> +
> +	guard(mutex)(&gpio_shared_lock);
> +
> +	list_for_each_entry(entry, &gpio_shared_list, list) {
> +		list_for_each_entry(ref, &entry->refs, list) {
> +			if (adev != &ref->adev)
> +				continue;
> +
> +			if (entry->shared_desc) {
> +				kref_get(&entry->ref);
> +				return entry;
> +			}
> +
> +			shared_desc = gpiod_shared_desc_create(entry);
> +			if (IS_ERR(shared_desc))
> +				return ERR_CAST(shared_desc);
> +
> +			kref_init(&entry->ref);
> +			entry->shared_desc = shared_desc;
> +
> +			pr_debug("Device %s acquired a reference to the shared GPIO %u owned by %s\n",
> +				 dev_name(&adev->dev), gpiod_hwgpio(shared_desc->desc),
> +				 gpio_device_get_label(shared_desc->desc->gdev));
> +
> +
> +			return entry;
> +		}
> +	}
> +
> +	return ERR_PTR(-ENOENT);
> +}
> +
> +struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev)
> +{
> +	struct gpio_shared_entry *entry;
> +	int ret;
> +
> +	entry = gpiod_shared_find(to_auxiliary_dev(dev));
> +	if (IS_ERR(entry))
> +		return ERR_CAST(entry);
> +
> +	ret = devm_add_action_or_reset(dev, gpiod_shared_put, entry);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return entry->shared_desc;
> +}
> +EXPORT_SYMBOL_GPL(devm_gpiod_shared_get);
> +
> +static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
> +{
> +	list_del(&ref->list);
> +	kfree(ref->con_id);
> +	ida_free(&gpio_shared_ida, ref->dev_id);
> +	fwnode_handle_put(ref->fwnode);
> +	kfree(ref);
> +}
> +
> +static void gpio_shared_drop_entry(struct gpio_shared_entry *entry)
> +{
> +	list_del(&entry->list);
> +	fwnode_handle_put(entry->fwnode);
> +	kfree(entry);
> +}
> +
> +/*
> + * This is only called if gpio_shared_init() fails so it's in fact __init and
> + * not __exit.
> + */
> +static void __init gpio_shared_teardown(void)
> +{
> +	struct gpio_shared_entry *entry, *epos;
> +	struct gpio_shared_ref *ref, *rpos;
> +
> +	list_for_each_entry_safe(entry, epos, &gpio_shared_list, list) {
> +		list_for_each_entry_safe(ref, rpos, &entry->refs, list)
> +			gpio_shared_drop_ref(ref);
> +
> +		gpio_shared_drop_entry(entry);
> +	}
> +}
> +
> +static void gpio_shared_free_exclusive(void)
> +{
> +	struct gpio_shared_entry *entry, *epos;
> +
> +	list_for_each_entry_safe(entry, epos, &gpio_shared_list, list) {
> +		if (list_count_nodes(&entry->refs) > 1)
> +			continue;
> +
> +		gpio_shared_drop_ref(list_first_entry(&entry->refs,
> +						      struct gpio_shared_ref,
> +						      list));
> +		gpio_shared_drop_entry(entry);
> +	}
> +}
> +
> +static int __init gpio_shared_init(void)
> +{
> +	int ret;
> +
> +	/* Right now, we only support OF-based systems. */
> +	ret = gpio_shared_of_scan();
> +	if (ret) {
> +		gpio_shared_teardown();
> +		pr_err("Failed to scan OF nodes for shared GPIOs: %d\n", ret);
> +		return ret;
> +	}
> +
> +	gpio_shared_free_exclusive();
> +
> +	pr_debug("Finished scanning firmware nodes for shared GPIOs\n");
> +	return 0;
> +}
> +postcore_initcall(gpio_shared_init);
> diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..667dbdff3585066b7cbe2ebe476725fe7d683d84
> --- /dev/null
> +++ b/drivers/gpio/gpiolib-shared.h
> @@ -0,0 +1,71 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __LINUX_GPIO_SHARED_H
> +#define __LINUX_GPIO_SHARED_H
> +
> +#include <linux/cleanup.h>
> +#include <linux/lockdep.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +
> +struct gpio_device;
> +struct gpio_desc;
> +struct device;
> +
> +#if IS_ENABLED(CONFIG_GPIO_SHARED)
> +
> +int gpio_device_setup_shared(struct gpio_device *gdev);
> +void gpio_device_teardown_shared(struct gpio_device *gdev);
> +int gpio_shared_add_proxy_lookup(struct device *consumer, unsigned long lflags);
> +
> +#else
> +
> +static inline int gpio_device_setup_shared(struct gpio_device *gdev)
> +{
> +	return 0;
> +}
> +
> +static inline void gpio_device_teardown_shared(struct gpio_device *gdev) { }
> +
> +static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
> +					       unsigned long lflags)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_GPIO_SHARED */
> +
> +struct gpio_shared_desc {
> +	struct gpio_desc *desc;
> +	bool can_sleep;
> +	unsigned long cfg;
> +	unsigned int usecnt;
> +	unsigned int highcnt;
> +	union {
> +		struct mutex mutex;
> +		spinlock_t spinlock;
> +	};
> +};
> +
> +struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev);
> +
> +DEFINE_LOCK_GUARD_1(gpio_shared_desc_lock, struct gpio_shared_desc,
> +	if (_T->lock->can_sleep)
> +		mutex_lock(&_T->lock->mutex);
> +	else
> +		spin_lock_irqsave(&_T->lock->spinlock, _T->flags),
> +	if (_T->lock->can_sleep)
> +		mutex_unlock(&_T->lock->mutex);
> +	else
> +		spin_unlock_irqrestore(&_T->lock->spinlock, _T->flags),
> +	unsigned long flags)
> +
> +static inline void gpio_shared_lockdep_assert(struct gpio_shared_desc *shared_desc)
> +{
> +	if (shared_desc->can_sleep)
> +		lockdep_assert_held(&shared_desc->mutex);
> +	else
> +		lockdep_assert_held(&shared_desc->spinlock);
> +}
> +
> +#endif /* __LINUX_GPIO_SHARED_H */
> 


