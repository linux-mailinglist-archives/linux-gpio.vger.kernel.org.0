Return-Path: <linux-gpio+bounces-24219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB846B21772
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 23:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78D1E18871BB
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 21:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C9D1A9F87;
	Mon, 11 Aug 2025 21:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ko9jqZog"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD7E1F936;
	Mon, 11 Aug 2025 21:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754947845; cv=none; b=r/n3Mix9OPYcc4B77xQOQe7x1pwfJtE2V5R8+ad13geP8DEVRv/J8A6BEOALpz6ThpIHSpmd87Tq1+8XjYzw3Uw8y8tn/7+zrE7C2IHhZdPeZcpHzqQhaZqHr4QiOTYfjLNsIlLXFVRXaIzheQ7euWXsMbl1re2QQ/5A2CIbonU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754947845; c=relaxed/simple;
	bh=0G+1H7GUaM8AmycZtigmh4hEkjlm6+UcqiRVziyWDn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GixPPD05d78QZnFQfiZywqTBMe7ha0+VFgCifdafsWbGgdu3/PdzeiDX2AYKaWJjD241c2mI/u75BG0By1ukSAnQrjKeSxctpt/OE2LINHvfBGnKHPkfe7VaIfF+AhJl+T42aAX7368Yel5bOhEOlbT1Jpw8H8rfhLusT7xyEaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ko9jqZog; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24009eeb2a7so43627825ad.0;
        Mon, 11 Aug 2025 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754947843; x=1755552643; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+r2iCxHIcw21IMkgZ1CnBi+MYNaUDYSrW/uxnNift14=;
        b=Ko9jqZogC/i4D24J3PH30qqYz3ZmGMkOns6hLNBwO0lnYB7lnAhlryM44Ax7ApD6U+
         UtpgcXU1XETFBpZ+Y6dCOfvtR4fopYcqVIp5tfwiWAhMa7W/nVIpmGqgcx5yoEFhFwk1
         n3XM5pcyIzne7XrZBWnVn92voHXlFi476bAlRH/rgdPDDkz+wRVn7lQG4tSt3wvuPOU1
         b7dZDYl9Vs+7NwjoE7PRiPaAPoeJq/emdlX5noElw5F8qoUAuMgS1NYziuyrwuQVycTI
         GiXQXoJkBsUzFHK7CB8gwlHrdmdJWmj3oaAnAlD23AEcGId2dM92AWI10LZ0lSLCSo+F
         Tklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754947843; x=1755552643;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+r2iCxHIcw21IMkgZ1CnBi+MYNaUDYSrW/uxnNift14=;
        b=jPt5Jx6G4cMjOz/w0X/TdMTFj/ZXMLLV5gvK8BkJZz4ITpcJQK8l4I7rZfMfaH26HV
         hBRcoQVcfnZlZtxOJr1nmIuMQQkj6MW3IImbNffibsoruD8MlkwrsM+pOQqLnkgjPDzc
         LDzHtB1RQThveRXanOHgcs1E1Cd5xcNjbeU4G9aH/ZzqMWvCy8ojt4dILkqecu9BqW6Z
         3jjG+XOUZlU16eSXfw9SCD6ip9azGiJVRbgpRpTRqe3NnLaQ8dyPG/pPwFPC4eVlxpdv
         x7yr8ZaTyb862qlysz+m8M96yIWhT9TjmSQuR0e7zmo705W00XnDeGQeY+hyouq/C3hJ
         NSiw==
X-Forwarded-Encrypted: i=1; AJvYcCVzs9Ez6j5v5It/hyGkn6s9SY71i6UHA861Qg8ZQGUamedFMSRv6JKDt3bUkAY1tKazPzACAfsDm14=@vger.kernel.org, AJvYcCXJPDnzK0x4gaUsZ3u3xD+9hIdQfOlQjGcjtCOnG8n89Ig19sO96X6NbgHWShzyyV/382nlqNhEJI53Fw==@vger.kernel.org, AJvYcCXrmFnmc+hQyqhLGuKumLi2J8axMBZ35GzWLhDcDouv8Qm+j4bZXjlZk/WPAG+DL5S3krsCjxLCxoFevFPf@vger.kernel.org
X-Gm-Message-State: AOJu0YzZzEtefz0cB+tBaEj59+eVXVn55sDLkG72qKhrW2/LSSmbjj1Q
	XcHkFWkHbfTX55IIG1ukF4Sd2ZcIuDRCnMxnCLYpPSoX7edZGYYH5+E4
X-Gm-Gg: ASbGnctWpa7Wyp2ulR0vfepgblI7/S/H4pCvzzYfWg1Md7NpVAL50Pg9qw8FB40asuy
	bx6hpH3H8cL1eOzltFM/T7xVKCR8ULRaECAkULWgrBvN0t/3M8y4SauFBQlzcR2oU7PDlD++irO
	U2EuhQV7Opb/HsuxDpcpnG1s7f++hvykUaQ46oM9jOtHyTbBVS6b7S7kT6P1w+exkgBGccQjGJ5
	Y38godpidDl96K9udIDpdQ3EHrNpk7yt8S8NF+lg/H8lTcWQLqm9R9dzPBjsX5XO1r26tQdLhCF
	l5md6AafrKxZOYd2+V8meFYn+SKedC8x7MlCDz8nxvgEULL4znfaTwMcbWWuypYfSK2BVLz2bTS
	kExUY0NB0r41+IH4dLULpXKM=
X-Google-Smtp-Source: AGHT+IGn+lZmGFEMFqgmqmMUttAnZOmy6jB2ufarHZts1rTaAj0OgLe3+cl1syqbrMOdU+/b4qPLlw==
X-Received: by 2002:a17:903:1a0f:b0:242:3105:1787 with SMTP id d9443c01a7336-242fc368144mr14773245ad.50.1754947842316;
        Mon, 11 Aug 2025 14:30:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:69d7:30de:b05e:915b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm32982070a91.7.2025.08.11.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 14:30:41 -0700 (PDT)
Date: Mon, 11 Aug 2025 14:30:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: gpio: add documentation about using software
 nodes
Message-ID: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Introduce documentation regarding use of software nodes to describe
GPIOs on legacy boards that have not been converted to device tree.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 Documentation/driver-api/gpio/board.rst       |  64 ++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 .../driver-api/gpio/legacy-boards.rst         | 298 ++++++++++++++++++
 3 files changed, 363 insertions(+)

diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
index 4fd1cbd8296e..0cf64e1f2623 100644
--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -94,6 +94,70 @@ with the help of _DSD (Device Specific Data), introduced in ACPI 5.1::
 For more information about the ACPI GPIO bindings see
 Documentation/firmware-guide/acpi/gpio-properties.rst.
 
+Software Nodes
+--------------
+Software nodes allows to construct an in-memory, device-tree-like structure
+using ``struct software_node`` and ``struct property_entry``. This structure
+can then be associated with a platform device, allowing drivers to use the
+standard device properties API to query configuration, just as they would on an
+ACPI or device tree systems.
+
+Software-node-backed GPIOs are described using ``PROPERTY_ENTRY_GPIO()``
+macro, which ties a sotfware node representing GPIO controller with consumer
+device. It allows consumers to use regular gpiolib APIs, such as ``gpiod_get()``,
+``gpiod_get_optional()``.
+
+The software node representing GPIO controller need not be attached to the
+GPIO controller device. The only requirement that the node must be registered
+and its name much match the GPIO controller's label.
+
+For example, here is how to describe a single GPIO-connected LED. This is an
+alternative to using platform_data on legacy systems.
+
+.. code-block:: c
+
+	#include <linux/property.h>
+	#include <linux/gpio/machine.h>
+	#include <linux/gpio/property.h>
+
+	/*
+	 * 1. Define a node for the GPIO controller. Its .name must match the
+	 *    controller's label.
+	 */
+	static const struct software_node gpio_controller_node = {
+		.name = "gpio-foo",
+	};
+
+	/* 2. Define the properties for the LED device. */
+	static const struct property_entry led_device_props[] = {
+		PROPERTY_ENTRY_STRING("label", "myboard:green:status"),
+		PROPERTY_ENTRY_STRING("linux,default-trigger", "heartbeat"),
+		PROPERTY_ENTRY_GPIO("gpios", &gpio_controller_node, 42, GPIO_ACTIVE_HIGH),
+		{ }
+	};
+
+	/* 3. Define the software node for the LED device. */
+	static const struct software_node led_device_swnode = {
+		.name = "status-led",
+		.properties = led_device_props,
+	};
+
+	/*
+	 * 4. Register the software nodes and the platform device.
+	 */
+	const struct software_node *swnodes[] = {
+		&gpio_controller_node,
+		&led_device_swnode,
+		NULL
+	};
+	software_node_register_node_group(swnodes);
+
+	// Then register a platform_device for "leds-gpio" and associate
+	// it with &led_device_swnode via .fwnode.
+
+For a complete guide on converting board files to use software nodes, see
+Documentation/driver-api/gpio/legacy-boards.rst.
+
 Platform Data
 -------------
 Finally, GPIOs can be bound to devices and functions using platform data. Board
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index 43f6a3afe10b..87929840e85a 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -12,6 +12,7 @@ Contents:
    driver
    consumer
    board
+   legacy-boards
    drivers-on-gpio
    bt8xxgpio
 
diff --git a/Documentation/driver-api/gpio/legacy-boards.rst b/Documentation/driver-api/gpio/legacy-boards.rst
new file mode 100644
index 000000000000..6700a2549220
--- /dev/null
+++ b/Documentation/driver-api/gpio/legacy-boards.rst
@@ -0,0 +1,298 @@
+Supporting Legacy Boards
+========================
+
+Many drivers in the kernel, such as ``leds-gpio`` and ``gpio-keys``, are
+migrating away from using board-specific ``platform_data`` to a unified device
+properties interface. This interface allows drivers to be simpler and more
+generic, as they can query properties in a standardized way.
+
+On modern systems, these properties are provided via device tree. However, some
+older platforms have not been converted to device tree and instead rely on
+board files to describe their hardware configuration. To bridge this gap and
+allow these legacy boards to work with modern, generic drivers, the kernel
+provides a mechanism called **software nodes**.
+
+This document provides a guide on how to convert a legacy board file from using
+``platform_data`` and ``gpiod_lookup_table`` to the modern software node
+approach for describing GPIO-connected devices.
+
+The Core Idea: Software Nodes
+-----------------------------
+
+Software nodes allows to construct an in-memory, device-tree-like structure
+using ``struct software_node`` and ``struct property_entry``. This structure
+can then be associated with a platform device, allowing drivers to use the
+standard device properties API (e.g., ``device_property_read_u32()``,
+``device_property_read_string()``) to query configuration, just as they would
+on an ACPI or device tree systems.
+
+The gpiolib code has support for handling software nodes, so that if GPIO is
+described properly, as detailed in the section below, then regular gpiolib APIs,
+such as ``gpiod_get()``, ``gpiod_get_optional()`` and others will work.
+
+Requirements for GPIO Properties
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When using software nodes to describe GPIO connections, the following
+requirements must be met for the GPIO core to correctly resolve the reference:
+
+1.  **The GPIO controller's software node ``name`` must match the controller's
+    ``label``.** The gpiolib core uses this name to find the corresponding
+    ``struct gpio_chip`` at runtime.
+    This software node has to be registered, but need not be attached to the
+    device representing GPIO controller that is providing GPIO in question.
+    It may be left as a "free floating" node.
+
+2.  **The GPIO property must be a reference.** The ``PROPERTY_ENTRY_GPIO()``
+    macro handles this as it is an alias for ``PROPERTY_ENTRY_REF()``.
+
+3.  **The reference must have exactly two arguments:**
+
+    - The first argument is the GPIO offset within the controller.
+    - The second argument is the flags for the GPIO line (e.g.,
+      ``GPIO_ACTIVE_HIGH``, ``GPIO_ACTIVE_LOW``).
+
+The ``PROPERTY_ENTRY_GPIO()`` macro is the preferred way of defining GPIO
+properties in software nodes.
+
+Conversion Example
+------------------
+
+Let's walk through an example of converting a board file that defines a GPIO-
+connected LED and a button.
+
+Before: Using Platform Data
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+A typical legacy board file might look like this:
+
+.. code-block:: c
+
+  #include <linux/platform_device.h>
+  #include <linux/leds.h>
+  #include <linux/gpio_keys.h>
+  #include <linux/gpio/machine.h>
+
+  #define MYBOARD_GPIO_CONTROLLER "gpio-foo"
+
+  /* LED setup */
+  static const struct gpio_led myboard_leds[] = {
+  	{
+  		.name = "myboard:green:status",
+  		.default_trigger = "heartbeat",
+  	},
+  };
+
+  static const struct gpio_led_platform_data myboard_leds_pdata = {
+  	.num_leds = ARRAY_SIZE(myboard_leds),
+  	.leds = myboard_leds,
+  };
+
+  static struct gpiod_lookup_table myboard_leds_gpios = {
+  	.dev_id = "leds-gpio",
+  	.table = {
+  		GPIO_LOOKUP_IDX(MYBOARD_GPIO_CONTROLLER, 42, NULL, 0, GPIO_ACTIVE_HIGH),
+  		{ },
+  	},
+  };
+
+  /* Button setup */
+  static struct gpio_keys_button myboard_buttons[] = {
+  	{
+  		.code = KEY_WPS_BUTTON,
+  		.desc = "WPS Button",
+  		.active_low = 1,
+  	},
+  };
+
+  static const struct gpio_keys_platform_data myboard_buttons_pdata = {
+  	.buttons = myboard_buttons,
+  	.nbuttons = ARRAY_SIZE(myboard_buttons),
+  };
+
+  static struct gpiod_lookup_table myboard_buttons_gpios = {
+  	.dev_id = "gpio-keys",
+  	.table = {
+  		GPIO_LOOKUP_IDX(MYBOARD_GPIO_CONTROLLER, 15, NULL, 0, GPIO_ACTIVE_LOW),
+  		{ },
+  	},
+  };
+
+  /* Device registration */
+  static int __init myboard_init(void)
+  {
+  	gpiod_add_lookup_table(&myboard_leds_gpios);
+  	gpiod_add_lookup_table(&myboard_buttons_gpios);
+
+  	platform_device_register_data(NULL, "leds-gpio", -1,
+  				      &myboard_leds_pdata, sizeof(myboard_leds_pdata));
+  	platform_device_register_data(NULL, "gpio-keys", -1,
+  				      &myboard_buttons_pdata, sizeof(myboard_buttons_pdata));
+
+  	return 0;
+  }
+
+After: Using Software Nodes
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Here is how the same configuration can be expressed using software nodes.
+
+Step 1: Define the GPIO Controller Node
+***************************************
+
+First, define a software node that represents the GPIO controller that the
+LEDs and buttons are connected to. The ``name`` of this node must match the
+name of the driver for the GPIO controller (e.g., "gpio-foo").
+
+.. code-block:: c
+
+  #include <linux/property.h>
+  #include <linux/gpio/property.h>
+
+  #define MYBOARD_GPIO_CONTROLLER "gpio-foo"
+
+  static const struct software_node myboard_gpio_controller_node = {
+  	.name = MYBOARD_GPIO_CONTROLLER,
+  };
+
+Step 2: Define Consumer Device Nodes and Properties
+***************************************************
+
+Next, define the software nodes for the consumer devices (the LEDs and buttons).
+This involves creating a parent node for each device type and child nodes for
+each individual LED or button.
+
+.. code-block:: c
+
+  /* LED setup */
+  static const struct software_node myboard_leds_node = {
+  	.name = "myboard-leds",
+  };
+
+  static const struct property_entry myboard_status_led_props[] = {
+  	PROPERTY_ENTRY_STRING("label", "myboard:green:status"),
+  	PROPERTY_ENTRY_STRING("linux,default-trigger", "heartbeat"),
+  	PROPERTY_ENTRY_GPIO("gpios", &myboard_gpio_controller_node, 42, GPIO_ACTIVE_HIGH),
+  	{ }
+  };
+
+  static const struct software_node myboard_status_led_swnode = {
+  	.name = "status-led",
+  	.parent = &myboard_leds_node,
+  	.properties = myboard_status_led_props,
+  };
+
+  /* Button setup */
+  static const struct software_node myboard_keys_node = {
+  	.name = "myboard-keys",
+  };
+
+  static const struct property_entry myboard_wps_button_props[] = {
+  	PROPERTY_ENTRY_STRING("label", "WPS Button"),
+  	PROPERTY_ENTRY_U32("linux,code", KEY_WPS_BUTTON),
+  	PROPERTY_ENTRY_GPIO("gpios", &myboard_gpio_controller_node, 15, GPIO_ACTIVE_LOW),
+  	{ }
+  };
+
+  static const struct software_node myboard_wps_button_swnode = {
+  	.name = "wps-button",
+  	.parent = &myboard_keys_node,
+  	.properties = myboard_wps_button_props,
+  };
+
+
+
+Step 3: Group and Register the Nodes
+************************************
+
+For maintainability, it is often beneficial to group all software nodes into a
+single array and register them with one call.
+
+.. code-block:: c
+
+  static const struct software_node * const myboard_swnodes[] __initconst = {
+  	&myboard_gpio_controller_node,
+  	&myboard_leds_node,
+  	&myboard_status_led_swnode,
+  	&myboard_keys_node,
+  	&myboard_wps_button_swnode,
+  	NULL
+  };
+
+  static int __init myboard_init(void)
+  {
+  	int error;
+
+  	error = software_node_register_node_group(myboard_swnodes);
+  	if (error) {
+  		pr_err("Failed to register software nodes: %d\n", error);
+  		return error;
+  	}
+
+  	// ... platform device registration follows
+  }
+
+.. note::
+  When splitting registration of nodes by devices that they represent, it is
+  essential that the software node representing the GPIO controller itself
+  is registered first, before any of the nodes that reference it.
+
+Step 4: Register Platform Devices with Software Nodes
+*****************************************************
+
+Finally, register the platform devices and associate them with their respective
+software nodes using the ``fwnode`` field in ``struct platform_device_info``.
+
+.. code-block:: c
+
+  static struct platform_device *leds_pdev;
+  static struct platform_device *keys_pdev;
+
+  static int __init myboard_init(void)
+  {
+  	struct platform_device_info pdev_info;
+  	int error;
+
+  	error = software_node_register_node_group(myboard_swnodes);
+  	if (error)
+  		return error;
+
+  	memset(&pdev_info, 0, sizeof(pdev_info));
+  	pdev_info.name = "leds-gpio";
+  	pdev_info.id = PLATFORM_DEVID_NONE;
+  	pdev_info.fwnode = software_node_fwnode(&myboard_leds_node);
+  	leds_pdev = platform_device_register_full(&pdev_info);
+  	if (IS_ERR(leds_pdev)) {
+  		error = PTR_ERR(leds_pdev);
+  		goto err_unregister_nodes;
+  	}
+
+  	memset(&pdev_info, 0, sizeof(pdev_info));
+  	pdev_info.name = "gpio-keys";
+  	pdev_info.id = PLATFORM_DEVID_NONE;
+  	pdev_info.fwnode = software_node_fwnode(&myboard_keys_node);
+  	keys_pdev = platform_device_register_full(&pdev_info);
+  	if (IS_ERR(keys_pdev)) {
+  		error = PTR_ERR(keys_pdev);
+  		platform_device_unregister(leds_pdev);
+  		goto err_unregister_nodes;
+  	}
+
+  	return 0;
+
+  err_unregister_nodes:
+  	software_node_unregister_node_group(myboard_swnodes);
+  	return error;
+  }
+
+  static void __exit myboard_exit(void)
+  {
+  	platform_device_unregister(keys_pdev);
+  	platform_device_unregister(leds_pdev);
+  	software_node_unregister_node_group(myboard_swnodes);
+  }
+
+With these changes, the generic ``leds-gpio`` and ``gpio-keys`` drivers will
+be able to probe successfully and get their configuration from the properties
+defined in the software nodes, removing the need for board-specific platform
+data.
-- 
2.51.0.rc0.155.g4a0f42376b-goog


-- 
Dmitry

