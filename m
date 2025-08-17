Return-Path: <linux-gpio+bounces-24470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F5B29528
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 23:30:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 24B754E133E
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 21:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8791235C01;
	Sun, 17 Aug 2025 21:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5kAF0DY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF5211A11;
	Sun, 17 Aug 2025 21:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755466226; cv=none; b=u6PFWsY5053U/a0LvABYSJZ9rOWWmxGMjlsS6Tqq1wYwNN9wXVmDbDaDlLb9LN8XxQSWvshZT7OUOMyHgBmE9UdQlFx53XeXvpdbMQow+mXXN1OsAq1cCMGqyWxYKxQFyfagXpXlHW32lKNHYYzJmCUAgC1PjzNjLQBnwWkNa+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755466226; c=relaxed/simple;
	bh=Gmu5myWmoXWHk/w3YkrFkQt3rGe643d9jdxiGS6gOHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ak+oPxfkZ8YOaukepDxu4kQm13W23Yvlqf1EcKyCmd9OByhxzkIkUpgTulAnnrmV+S6b93TjZ0csd/1GFB8rrCYHO0fF2YInOuCavJu1MECNLymGlD6NwXd8cVK4FZ07LQqnybFCjBI+GwfjuBUJbe7V/bKOCzACymFcQjXetpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5kAF0DY; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76e2eb3726cso2058370b3a.3;
        Sun, 17 Aug 2025 14:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755466224; x=1756071024; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUla+uL1/ym+VukqojWwLhDmbvt+6ZHzoJj2e7KPEGQ=;
        b=j5kAF0DYgSkO2jjMZ9zsjDZwJvaYyMDrGRHuy/+bvoe1QsHun+Qs3QsmDaSXSLZ0nJ
         IfXggoVCn3br2MLNh0thVR8XdJHjosxQ7eJcfX6x4DHEeqEAMohgnDEGPkpFTrzsd36j
         Qx6Rp1PPVVXwmj5HMx+0AI5Ci2E8aRNnDFU4S4bF0XgDaDjvkKMs6RfJ+8v4fQtUrc2y
         BI+qtjhXxZNklRb0rfbwNjBgdto+6NLIPgJuOpcMWhaQKR0tV1oF3+y+rAsYsVu/kwnc
         r1lDsJd/8nTBOfDalkq+lo+d2P1bhmUkAIamuiZ3VZhXJSRkh70skFzc1IPgnOh3wbxS
         D2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755466224; x=1756071024;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUla+uL1/ym+VukqojWwLhDmbvt+6ZHzoJj2e7KPEGQ=;
        b=chYn9bmJJxufmUeeFbVqXFBOJwthTz4bqffiQJVZCFJWpRu3M0KNg13iXGM9T82QAZ
         Bauz8vuiICZMaC6/yh7atJdHlRmRqvdGZ/rio6FjVNmYzImXNtSGudjFV4eeD65zRG5X
         8k5qMrT2gNv296B/M8sf9AQm9/PJCQA9XRXTF1IG4cFFImByP160yRqWao+oSjABXVFc
         HfUod02s9o9fi3J75JFOcFTCYIfXcKxX5S+2yFdSoOzrs0hqYPrQrBgcdU8ddEVD37nJ
         cIlDZJIhz/JRsA/VeGayiPsBhLhRsO3QeFqhwpQytyMuQGDHOxLRK6q3NNyrhtD+L1bC
         UKHw==
X-Forwarded-Encrypted: i=1; AJvYcCVNyYA8uBKZsBo0baG2q3mwg78Kw9PBn7tCZj4N6TmN+cvEdy7y93Wjt0QkPYG6DVq8AlrOx6P6qyo=@vger.kernel.org, AJvYcCVzlM+zdOCSAiPrScYG4QyWvtrKe09bUAfsYm1vXtBXpUQoUAPaeQoij/YEkOJsPNAcM9siJtGyOWp/gXGY@vger.kernel.org, AJvYcCXmo7iLof1Zvb9rWWUWWSdiiMHAa9UmQMHOXXGNS7GKuH/thVHCHVmGST5QsmpXtB3ohjgzQWZoG477CA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0unBffGdHsoimbwtg1uQ8ElDLMLY2TA5svkciMP8O5nKPFE58
	433zq1d0yQUrrd5TuVSC3Z3xfUZ0QxV2g9cHstZcgo1r+s2ZJPMIf9EA
X-Gm-Gg: ASbGncsNJJ6jSP9UhP1bWY+ZEXZXK2TZdFppeOmZ1RmoGlQgrAJevd3Ohjv4NtLUIc5
	fDwgUbRXz0D47WiYYvB+E3WW+f4RUuYeOTZs34yaKeZPan0w8qZ6mnDMgtMQyIKIhsavFAUFmug
	GPh9A/9CciD+5JbTVRLaEOaol2OmFrqp1Cdou6ls+GGXC0zBldp4WNYkhCc6hLK/puuhepOBPE5
	LE9998jbzhrrz8zTByB2pFri1ZHrAFxvYtpyemTHXAvfZ2OS2ViqP/0bERnLHkgYPWdnM+X0Jpp
	C34qSCVYmaQdhDToDlq11nAIknB2x/f7kQ+GSnN7v3UFzQXivZJvA+ZTqqCV6ByysX3zqArOhj5
	TfkC3RNNPLG30mhJPrUC9qqs=
X-Google-Smtp-Source: AGHT+IG2jQIldfLKf3/8Dhf0ZlgcpN7xdiLF9zmwlq6ZNRkEjgbznx8OpMNnU5LpZaVA+Q87UGnwCw==
X-Received: by 2002:aa7:8881:0:b0:76b:ed13:40c4 with SMTP id d2e1a72fcca58-76e447b9b8bmr12421573b3a.13.1755466223797;
        Sun, 17 Aug 2025 14:30:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1c99:c9f5:d858:a21b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e4528c81fsm5669040b3a.42.2025.08.17.14.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 14:30:23 -0700 (PDT)
Date: Sun, 17 Aug 2025 14:30:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>
Cc: Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] Documentation: gpio: add documentation about using
 software nodes
Message-ID: <tnaaz2qlk5jpbonfle7uy7pb54qx6ixwuczfbkwtxxwpj7hwas@y7a2rwko3k6c>
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

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v3: Addressed more Randy's comments, added his reviewed-by and tested-by
    tags.

v2: Addressed Randy's comments.

 Documentation/driver-api/gpio/board.rst       |  65 ++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 .../driver-api/gpio/legacy-boards.rst         | 298 ++++++++++++++++++
 3 files changed, 364 insertions(+)

diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
index 4fd1cbd8296e..069b54d8591b 100644
--- a/Documentation/driver-api/gpio/board.rst
+++ b/Documentation/driver-api/gpio/board.rst
@@ -94,6 +94,71 @@ with the help of _DSD (Device Specific Data), introduced in ACPI 5.1::
 For more information about the ACPI GPIO bindings see
 Documentation/firmware-guide/acpi/gpio-properties.rst.
 
+Software Nodes
+--------------
+
+Software nodes allow board-specific code to construct an in-memory,
+device-tree-like structure using struct software_node and struct
+property_entry. This structure can then be associated with a platform device,
+allowing drivers to use the standard device properties API to query
+configuration, just as they would on an ACPI or device tree system.
+
+Software-node-backed GPIOs are described using the ``PROPERTY_ENTRY_GPIO()``
+macro, which ties a software node representing the GPIO controller with
+consumer device. It allows consumers to use regular gpiolib APIs, such as
+gpiod_get(), gpiod_get_optional().
+
+The software node representing a GPIO controller need not be attached to the
+GPIO controller device. The only requirement is that the node must be
+registered and its name must match the GPIO controller's label.
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
index 000000000000..46e3a26dba77
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
+Software nodes allow board-specific code to construct an in-memory,
+device-tree-like structure using struct software_node and struct
+property_entry. This structure can then be associated with a platform device,
+allowing drivers to use the standard device properties API (e.g.,
+device_property_read_u32(), device_property_read_string()) to query
+configuration, just as they would on an ACPI or device tree system.
+
+The gpiolib code has support for handling software nodes, so that if GPIO is
+described properly, as detailed in the section below, then regular gpiolib APIs,
+such as gpiod_get(), gpiod_get_optional(), and others will work.
+
+Requirements for GPIO Properties
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When using software nodes to describe GPIO connections, the following
+requirements must be met for the GPIO core to correctly resolve the reference:
+
+1.  **The GPIO controller's software node "name" must match the controller's
+    "label".** The gpiolib core uses this name to find the corresponding
+    struct gpio_chip at runtime.
+    This software node has to be registered, but need not be attached to the
+    device representing the GPIO controller that is providing the GPIO in
+    question. It may be left as a "free floating" node.
+
+2.  **The GPIO property must be a reference.** The ``PROPERTY_ENTRY_GPIO()``
+    macro handles this as it is an alias for ``PROPERTY_ENTRY_REF()``.
+
+3.  **The reference must have exactly two arguments:**
+
+    - The first argument is the GPIO offset within the controller.
+    - The second argument is the flags for the GPIO line (e.g.,
+      GPIO_ACTIVE_HIGH, GPIO_ACTIVE_LOW).
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
+  static const struct software_node * const myboard_swnodes[] = {
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
+software nodes using the ``fwnode`` field in struct platform_device_info.
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
2.51.0.rc1.163.g2494970778-goog


-- 
Dmitry

