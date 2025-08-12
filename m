Return-Path: <linux-gpio+bounces-24224-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16388B219E4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 02:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2101B1A23DEC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 00:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFA528D8D8;
	Tue, 12 Aug 2025 00:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JtDx5CLC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ADB1E4BE;
	Tue, 12 Aug 2025 00:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754959567; cv=none; b=TveaL8/zY9k5NnPQJ72on0xc/epIHS94GqX6N94Vw/ORl1iBU/ZGCC/2+HtywfCiMl5aiTcQhgU7CoLmNTnaDPBSMNVy6rkxjEr4gnzH20sbwxsBXVxinnKqBvhQ3ncO940DR4wqWfzNVQyJN8Acgg7y0MWw7bcK8+Qepo740AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754959567; c=relaxed/simple;
	bh=HTvWHrbEgTwV6dOXbyxHGqJLFD1JoLZNgz6ZCTyt5AE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XcvNumO31bDHGfORqtbRMnQDjno5O3h+bHYkpWnSkockU5MM8xaTcAKuwds/2biJkmDMABM5xJInp0sUXxi5LIc/xA2RQ9uC+vhEkx5VtrplrZAJAH1uUiuZo9nQ01XBy4vHzZBe343kWbKvpKDKFrMe/ZufxJ8DMJpTIqtl0iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JtDx5CLC; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=7xEGavM38EexJs6+R3NP60uuzbfpXor25lCw94ANNOs=; b=JtDx5CLCTLXAtES4F1cItMgI8f
	TdwkUaS+3aktVQBl0AarUavpFW8Px3V3Ov09UA7pnbOQoeciPtN7l67fv8RMRkFBPTb2d/hnkk/b1
	hKl+VoC769Mpj9+XLbWCwVOT7xdNdHMq9GtKCqcmrTQLYd67LnT93E223XlTu9lgMgSOpKucKwsX4
	15ftrDNuCeSXByVg0U22onhzt7AVw88f8w+3Ai93UtxZ/unznt+RIZNV7cSOM0pPfRZYpi5Jl9XBF
	zxt0R9xFhHmUBKeIRBufYIQdJRTBTyeXsAC4iW1MKIsXk/EJ7qnoUl2ofHhDRgld6YA76KJIr6ytN
	sBM8Q7xQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uld9P-00000009TGQ-1sqU;
	Tue, 12 Aug 2025 00:46:03 +0000
Message-ID: <5cd1c94c-e122-45e6-8333-9eff3ae6303e@infradead.org>
Date: Mon, 11 Aug 2025 17:46:02 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: gpio: add documentation about using
 software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/11/25 2:30 PM, Dmitry Torokhov wrote:
> Introduce documentation regarding use of software nodes to describe
> GPIOs on legacy boards that have not been converted to device tree.
> 

Thanks for the additional documentation.

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  Documentation/driver-api/gpio/board.rst       |  64 ++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  .../driver-api/gpio/legacy-boards.rst         | 298 ++++++++++++++++++
>  3 files changed, 363 insertions(+)
> 
> diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
> index 4fd1cbd8296e..0cf64e1f2623 100644
> --- a/Documentation/driver-api/gpio/board.rst
> +++ b/Documentation/driver-api/gpio/board.rst
> @@ -94,6 +94,70 @@ with the help of _DSD (Device Specific Data), introduced in ACPI 5.1::
>  For more information about the ACPI GPIO bindings see
>  Documentation/firmware-guide/acpi/gpio-properties.rst.
>  
> +Software Nodes
> +--------------
> +Software nodes allows to construct an in-memory, device-tree-like structure

                  allow { drivers | modules | software | us}

although "software" seems redundant.

> +using ``struct software_node`` and ``struct property_entry``. This structure

Quoting Jon (for a different struct):
  Better to just say "struct list_head", and the automarkup logic should
  take care of the rest.

@Jon: ISTM that we need something in Documentation/doc-guide/sphinx.rst (?) about which
keywords are handled by automarkup logic. AFAIK, they are struct, union, enum,
and typedef (keywords) and function() as indicated by the "()".



> +can then be associated with a platform device, allowing drivers to use the
> +standard device properties API to query configuration, just as they would on an
> +ACPI or device tree systems.

                       system.

> +
> +Software-node-backed GPIOs are described using ``PROPERTY_ENTRY_GPIO()``
> +macro, which ties a sotfware node representing GPIO controller with consumer

                       software

> +device. It allows consumers to use regular gpiolib APIs, such as ``gpiod_get()``,
> +``gpiod_get_optional()``.
> +
> +The software node representing GPIO controller need not be attached to the
> +GPIO controller device. The only requirement that the node must be registered

                                    requirement is that

> +and its name much match the GPIO controller's label.

                must

> +
> +For example, here is how to describe a single GPIO-connected LED. This is an
> +alternative to using platform_data on legacy systems.
> +
> +.. code-block:: c
> +
> +	#include <linux/property.h>
> +	#include <linux/gpio/machine.h>
> +	#include <linux/gpio/property.h>
> +
> +	/*
> +	 * 1. Define a node for the GPIO controller. Its .name must match the
> +	 *    controller's label.
> +	 */
> +	static const struct software_node gpio_controller_node = {
> +		.name = "gpio-foo",
> +	};
> +
> +	/* 2. Define the properties for the LED device. */
> +	static const struct property_entry led_device_props[] = {
> +		PROPERTY_ENTRY_STRING("label", "myboard:green:status"),
> +		PROPERTY_ENTRY_STRING("linux,default-trigger", "heartbeat"),
> +		PROPERTY_ENTRY_GPIO("gpios", &gpio_controller_node, 42, GPIO_ACTIVE_HIGH),
> +		{ }
> +	};
> +
> +	/* 3. Define the software node for the LED device. */
> +	static const struct software_node led_device_swnode = {
> +		.name = "status-led",
> +		.properties = led_device_props,
> +	};
> +
> +	/*
> +	 * 4. Register the software nodes and the platform device.
> +	 */
> +	const struct software_node *swnodes[] = {
> +		&gpio_controller_node,
> +		&led_device_swnode,
> +		NULL
> +	};
> +	software_node_register_node_group(swnodes);
> +
> +	// Then register a platform_device for "leds-gpio" and associate
> +	// it with &led_device_swnode via .fwnode.
> +
> +For a complete guide on converting board files to use software nodes, see
> +Documentation/driver-api/gpio/legacy-boards.rst.
> +
>  Platform Data
>  -------------
>  Finally, GPIOs can be bound to devices and functions using platform data. Board



> diff --git a/Documentation/driver-api/gpio/legacy-boards.rst b/Documentation/driver-api/gpio/legacy-boards.rst
> new file mode 100644
> index 000000000000..6700a2549220
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/legacy-boards.rst
> @@ -0,0 +1,298 @@
> +Supporting Legacy Boards
> +========================
> +
> +Many drivers in the kernel, such as ``leds-gpio`` and ``gpio-keys``, are
> +migrating away from using board-specific ``platform_data`` to a unified device
> +properties interface. This interface allows drivers to be simpler and more
> +generic, as they can query properties in a standardized way.
> +
> +On modern systems, these properties are provided via device tree. However, some
> +older platforms have not been converted to device tree and instead rely on
> +board files to describe their hardware configuration. To bridge this gap and
> +allow these legacy boards to work with modern, generic drivers, the kernel
> +provides a mechanism called **software nodes**.
> +
> +This document provides a guide on how to convert a legacy board file from using
> +``platform_data`` and ``gpiod_lookup_table`` to the modern software node
> +approach for describing GPIO-connected devices.
> +
> +The Core Idea: Software Nodes
> +-----------------------------
> +
> +Software nodes allows to construct an in-memory, device-tree-like structure

                  allow {some object of the verb, as suggested above}

> +using ``struct software_node`` and ``struct property_entry``. This structure

Please drop the "``" markups. They aren't needed.

> +can then be associated with a platform device, allowing drivers to use the
> +standard device properties API (e.g., ``device_property_read_u32()``,
> +``device_property_read_string()``) to query configuration, just as they would
> +on an ACPI or device tree systems.

                             system.

> +
> +The gpiolib code has support for handling software nodes, so that if GPIO is
> +described properly, as detailed in the section below, then regular gpiolib APIs,
> +such as ``gpiod_get()``, ``gpiod_get_optional()`` and others will work.
> +
> +Requirements for GPIO Properties
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +When using software nodes to describe GPIO connections, the following
> +requirements must be met for the GPIO core to correctly resolve the reference:
> +
> +1.  **The GPIO controller's software node ``name`` must match the controller's
> +    ``label``.** The gpiolib core uses this name to find the corresponding
> +    ``struct gpio_chip`` at runtime.

"``" not needed.

> +    This software node has to be registered, but need not be attached to the
> +    device representing GPIO controller that is providing GPIO in question.
> +    It may be left as a "free floating" node.
> +
> +2.  **The GPIO property must be a reference.** The ``PROPERTY_ENTRY_GPIO()``
> +    macro handles this as it is an alias for ``PROPERTY_ENTRY_REF()``.
> +
> +3.  **The reference must have exactly two arguments:**
> +
> +    - The first argument is the GPIO offset within the controller.
> +    - The second argument is the flags for the GPIO line (e.g.,
> +      ``GPIO_ACTIVE_HIGH``, ``GPIO_ACTIVE_LOW``).
> +
> +The ``PROPERTY_ENTRY_GPIO()`` macro is the preferred way of defining GPIO
> +properties in software nodes.
> +
> +Conversion Example
> +------------------
> +
> +Let's walk through an example of converting a board file that defines a GPIO-
> +connected LED and a button.
> +
> +Before: Using Platform Data
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +A typical legacy board file might look like this:
> +
> +.. code-block:: c
> +
> +  #include <linux/platform_device.h>
> +  #include <linux/leds.h>
> +  #include <linux/gpio_keys.h>
> +  #include <linux/gpio/machine.h>
> +
> +  #define MYBOARD_GPIO_CONTROLLER "gpio-foo"
> +
> +  /* LED setup */
> +  static const struct gpio_led myboard_leds[] = {
> +  	{
> +  		.name = "myboard:green:status",
> +  		.default_trigger = "heartbeat",
> +  	},
> +  };
> +
> +  static const struct gpio_led_platform_data myboard_leds_pdata = {
> +  	.num_leds = ARRAY_SIZE(myboard_leds),
> +  	.leds = myboard_leds,
> +  };
> +
> +  static struct gpiod_lookup_table myboard_leds_gpios = {
> +  	.dev_id = "leds-gpio",
> +  	.table = {
> +  		GPIO_LOOKUP_IDX(MYBOARD_GPIO_CONTROLLER, 42, NULL, 0, GPIO_ACTIVE_HIGH),
> +  		{ },
> +  	},
> +  };
> +
> +  /* Button setup */
> +  static struct gpio_keys_button myboard_buttons[] = {
> +  	{
> +  		.code = KEY_WPS_BUTTON,
> +  		.desc = "WPS Button",
> +  		.active_low = 1,
> +  	},
> +  };
> +
> +  static const struct gpio_keys_platform_data myboard_buttons_pdata = {
> +  	.buttons = myboard_buttons,
> +  	.nbuttons = ARRAY_SIZE(myboard_buttons),
> +  };
> +
> +  static struct gpiod_lookup_table myboard_buttons_gpios = {
> +  	.dev_id = "gpio-keys",
> +  	.table = {
> +  		GPIO_LOOKUP_IDX(MYBOARD_GPIO_CONTROLLER, 15, NULL, 0, GPIO_ACTIVE_LOW),
> +  		{ },
> +  	},
> +  };
> +
> +  /* Device registration */
> +  static int __init myboard_init(void)
> +  {
> +  	gpiod_add_lookup_table(&myboard_leds_gpios);
> +  	gpiod_add_lookup_table(&myboard_buttons_gpios);
> +
> +  	platform_device_register_data(NULL, "leds-gpio", -1,
> +  				      &myboard_leds_pdata, sizeof(myboard_leds_pdata));
> +  	platform_device_register_data(NULL, "gpio-keys", -1,
> +  				      &myboard_buttons_pdata, sizeof(myboard_buttons_pdata));
> +
> +  	return 0;
> +  }
> +
> +After: Using Software Nodes
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Here is how the same configuration can be expressed using software nodes.
> +
> +Step 1: Define the GPIO Controller Node
> +***************************************
> +
> +First, define a software node that represents the GPIO controller that the
> +LEDs and buttons are connected to. The ``name`` of this node must match the
> +name of the driver for the GPIO controller (e.g., "gpio-foo").
> +
> +.. code-block:: c
> +
> +  #include <linux/property.h>
> +  #include <linux/gpio/property.h>
> +
> +  #define MYBOARD_GPIO_CONTROLLER "gpio-foo"
> +
> +  static const struct software_node myboard_gpio_controller_node = {
> +  	.name = MYBOARD_GPIO_CONTROLLER,
> +  };
> +
> +Step 2: Define Consumer Device Nodes and Properties
> +***************************************************
> +
> +Next, define the software nodes for the consumer devices (the LEDs and buttons).
> +This involves creating a parent node for each device type and child nodes for
> +each individual LED or button.
> +
> +.. code-block:: c
> +
> +  /* LED setup */
> +  static const struct software_node myboard_leds_node = {
> +  	.name = "myboard-leds",
> +  };
> +
> +  static const struct property_entry myboard_status_led_props[] = {
> +  	PROPERTY_ENTRY_STRING("label", "myboard:green:status"),
> +  	PROPERTY_ENTRY_STRING("linux,default-trigger", "heartbeat"),
> +  	PROPERTY_ENTRY_GPIO("gpios", &myboard_gpio_controller_node, 42, GPIO_ACTIVE_HIGH),
> +  	{ }
> +  };
> +
> +  static const struct software_node myboard_status_led_swnode = {
> +  	.name = "status-led",
> +  	.parent = &myboard_leds_node,
> +  	.properties = myboard_status_led_props,
> +  };
> +
> +  /* Button setup */
> +  static const struct software_node myboard_keys_node = {
> +  	.name = "myboard-keys",
> +  };
> +
> +  static const struct property_entry myboard_wps_button_props[] = {
> +  	PROPERTY_ENTRY_STRING("label", "WPS Button"),
> +  	PROPERTY_ENTRY_U32("linux,code", KEY_WPS_BUTTON),
> +  	PROPERTY_ENTRY_GPIO("gpios", &myboard_gpio_controller_node, 15, GPIO_ACTIVE_LOW),
> +  	{ }
> +  };
> +
> +  static const struct software_node myboard_wps_button_swnode = {
> +  	.name = "wps-button",
> +  	.parent = &myboard_keys_node,
> +  	.properties = myboard_wps_button_props,
> +  };
> +
> +
> +
> +Step 3: Group and Register the Nodes
> +************************************
> +
> +For maintainability, it is often beneficial to group all software nodes into a
> +single array and register them with one call.
> +
> +.. code-block:: c
> +
> +  static const struct software_node * const myboard_swnodes[] __initconst = {
> +  	&myboard_gpio_controller_node,
> +  	&myboard_leds_node,
> +  	&myboard_status_led_swnode,
> +  	&myboard_keys_node,
> +  	&myboard_wps_button_swnode,
> +  	NULL
> +  };
> +
> +  static int __init myboard_init(void)
> +  {
> +  	int error;
> +
> +  	error = software_node_register_node_group(myboard_swnodes);
> +  	if (error) {
> +  		pr_err("Failed to register software nodes: %d\n", error);
> +  		return error;
> +  	}
> +
> +  	// ... platform device registration follows
> +  }
> +
> +.. note::
> +  When splitting registration of nodes by devices that they represent, it is
> +  essential that the software node representing the GPIO controller itself
> +  is registered first, before any of the nodes that reference it.
> +
> +Step 4: Register Platform Devices with Software Nodes
> +*****************************************************
> +
> +Finally, register the platform devices and associate them with their respective
> +software nodes using the ``fwnode`` field in ``struct platform_device_info``.

Drop the "``" on struct platform_device_info.

> +
> +.. code-block:: c
> +
> +  static struct platform_device *leds_pdev;
> +  static struct platform_device *keys_pdev;
> +
> +  static int __init myboard_init(void)
> +  {
> +  	struct platform_device_info pdev_info;
> +  	int error;
> +
> +  	error = software_node_register_node_group(myboard_swnodes);
> +  	if (error)
> +  		return error;
> +
> +  	memset(&pdev_info, 0, sizeof(pdev_info));
> +  	pdev_info.name = "leds-gpio";
> +  	pdev_info.id = PLATFORM_DEVID_NONE;
> +  	pdev_info.fwnode = software_node_fwnode(&myboard_leds_node);
> +  	leds_pdev = platform_device_register_full(&pdev_info);
> +  	if (IS_ERR(leds_pdev)) {
> +  		error = PTR_ERR(leds_pdev);
> +  		goto err_unregister_nodes;
> +  	}
> +
> +  	memset(&pdev_info, 0, sizeof(pdev_info));
> +  	pdev_info.name = "gpio-keys";
> +  	pdev_info.id = PLATFORM_DEVID_NONE;
> +  	pdev_info.fwnode = software_node_fwnode(&myboard_keys_node);
> +  	keys_pdev = platform_device_register_full(&pdev_info);
> +  	if (IS_ERR(keys_pdev)) {
> +  		error = PTR_ERR(keys_pdev);
> +  		platform_device_unregister(leds_pdev);
> +  		goto err_unregister_nodes;
> +  	}
> +
> +  	return 0;
> +
> +  err_unregister_nodes:
> +  	software_node_unregister_node_group(myboard_swnodes);
> +  	return error;
> +  }
> +
> +  static void __exit myboard_exit(void)
> +  {
> +  	platform_device_unregister(keys_pdev);
> +  	platform_device_unregister(leds_pdev);
> +  	software_node_unregister_node_group(myboard_swnodes);
> +  }
> +
> +With these changes, the generic ``leds-gpio`` and ``gpio-keys`` drivers will
> +be able to probe successfully and get their configuration from the properties
> +defined in the software nodes, removing the need for board-specific platform
> +data.
.

-- 
~Randy


