Return-Path: <linux-gpio+bounces-24226-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E437AB21CCC
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 07:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71EF76200DA
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 05:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EF620330;
	Tue, 12 Aug 2025 05:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNyfSt32"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60006311C34;
	Tue, 12 Aug 2025 05:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754975875; cv=none; b=Zf6MDf5Lwp6u5DLS5QZ3n1eqoZgY16OFFpzl9PtHfozYg9XJQGsyoZ/r4Gg+64aqXSMYnuE4HHxlJOG1uXJY60nzJsQoA6fL04THrfVRjEtU6HWYhH+H3d3b4lHRLC5g6HgaE/W8XgvduyiOnnRiPMS7Q/+edT5CIHxGWC++5AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754975875; c=relaxed/simple;
	bh=l7G9A3Z7VY4Ys3c1hdB5JEwwHpRNVidlVgeVL7Or4Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anm38ILMnwHdBlVz1HcqUQ+ZpJk4NZGI0csnSOftCOk0S/NOuVwAt5Ku8GUxw0CsyKSz2Ya1yCcshTPuXz78rM1a3ERDQeOwucRozrlWNt0vihw+QUCi5Ys2mMB5EjAlb5zJ6x2JcK8Vgw1r7gyKpFqyAAuLj6rqKA64iOiGJdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNyfSt32; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-31f28d0495fso6970890a91.1;
        Mon, 11 Aug 2025 22:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754975872; x=1755580672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DiimOehVRXY2dUhf+q7cHULgDkqA0pmcHvfY/GPf62A=;
        b=mNyfSt32VUzL86p3hVH26C8+Upu33HO5Mgj4ApZIs2u79HHut+XQbzy6ooIuhtFYuR
         c+fl1ef8Ar+KgZ7AxRyY1b4tDi5Enykx1y775zPmxFSN55QeaIm8lgwnDAPGB5U6uPiF
         21F+9Rj8LPBz1M+/f28SovFtN92QT1QQQs3LJT0YHrpZwSaKKgeXscl4707P8MkuSgl5
         Kk10P+n+S61aQLBwJQlY5vU7Mdu/GnN5hrh73dFl4Ltxeyn+cHMCSXOwMmdqBfbCvpxK
         cQc0/+t4H1mffT2nq+LTLf4aicRie0tqOuPj8837Zqn6HmZpPmGMRGkQkzm+7l0B/tXh
         72pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754975872; x=1755580672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiimOehVRXY2dUhf+q7cHULgDkqA0pmcHvfY/GPf62A=;
        b=xCcIo/syYRjcbyBP4R7uux3Dwp07wC4uLC0XGbSq4e/tMRIPHyaHL8ozqt+upZ3EKs
         p3mYWHWFjoel+PMUikP3Gax2NdioVKmpQo4NBI5bgeKINZCmlWGBlsjaj1bjFqKIShQ3
         3aXqCh/5qdHrqHioh13t55asav4exAfANWJj6Crrh/TtXBSio1bAuaSYe/NB7DMM4tQQ
         tvmXa/qcSorNyauPo9oFbqzlH+6/xybbng/+YXqPdEoSJHBtUTmjSdHtbh4S5IhXsZvM
         qmr7QmOTi/S5Q14WxIaOYmve0QuVufNeeoqHzLOPkXkH8pPjlq2OYmwhugAXR0RRLy+5
         v3OQ==
X-Forwarded-Encrypted: i=1; AJvYcCURE91qaiWseABGdSofgzLrYsIsq0ha5wJ8om2UClyrm56K+XDjJCOxAQo2iYH6ENqfPOTJUOOXnY91Kw==@vger.kernel.org, AJvYcCVZOLf9UMCDaCIF5yC3YPG/6KtRIKvYxoZjGDza6VVZMnBcGuhOM9h+7/9RRB1ObdaxrpNaXzQeMJk=@vger.kernel.org, AJvYcCXcBX/PLqzyH25Wp8oCjWO4bT6kX118WYwXtQtYPVapD308KH/TEMFzXEEL2YWgxeFIDRmzhlR0xsO9M5is@vger.kernel.org
X-Gm-Message-State: AOJu0YxreUA2D5W3wLa9wTT5aq+c4c18+waAiBcHbwVDG7m3TiOkiiM5
	0i3EZJUpEueVrdOlO5EVddYT34v3E2f0SXFHTPegIdynP/xc7nVx+d/4
X-Gm-Gg: ASbGnctKj9oi1Rwel9LNw31DdEgs7kiY0NXwG/WbzQ+uFXyZTkGda1tPd/YqXy5zgz4
	mqmpP5CH2sRcgNIlDGUP7vueM9Ec3ZJK0n3SUKK8M+5poV3U+L/ErZzXlh69dWkA1miQ30CcD/a
	UgyZXohlMnvbZwrtQUgvv0ePzLDuIFvpMkiE2axURkAMHkfJ6Zv4sM3XICAvUl4u7ORD7I1MwiB
	EVQ4vkJ2B9v28j97Ek6FF7o7oGGTJIKGh6hvOnHAoXUQJjRGhP4wU79puPbBQbCd9VND1bAN6z1
	Rj3dC/8fCdLv9EZYHSw0TNQsOmaLq73e8aEK7wIl1uM8sTf47VfcBCIPj0SvLX7ZIAei2uJiXvt
	5Gyv8GmdQoMtU72AvPDBD0wo=
X-Google-Smtp-Source: AGHT+IG2Jymvx714UAKmK7oVVCXpdn2FZwuivhDKguVDgb1shxUSh5/WRYrHM5RRzxzWuzDw7nZU/A==
X-Received: by 2002:a17:90b:5246:b0:31e:94d2:c36f with SMTP id 98e67ed59e1d1-321c0a4cfe2mr3212229a91.8.1754975872316;
        Mon, 11 Aug 2025 22:17:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7933:7499:67d8:279a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76be9143a4asm24441528b3a.24.2025.08.11.22.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:17:51 -0700 (PDT)
Date: Mon, 11 Aug 2025 22:17:49 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: gpio: add documentation about using
 software nodes
Message-ID: <csgmuaw2ret5qamcuwyenhw3sgb7hbso5dei7lshrz4pdga2tp@5mbv4an3q5cu>
References: <b52lpk2vqr4asp5iaqwcvcac3b6gen52rbu4cwy5kcnxszc3fj@6i77jr53kzje>
 <5cd1c94c-e122-45e6-8333-9eff3ae6303e@infradead.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cd1c94c-e122-45e6-8333-9eff3ae6303e@infradead.org>

Hi Randy,

On Mon, Aug 11, 2025 at 05:46:02PM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 8/11/25 2:30 PM, Dmitry Torokhov wrote:
> > Introduce documentation regarding use of software nodes to describe
> > GPIOs on legacy boards that have not been converted to device tree.
> > 
> 
> Thanks for the additional documentation.

Thanks for the review.

> 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  Documentation/driver-api/gpio/board.rst       |  64 ++++
> >  Documentation/driver-api/gpio/index.rst       |   1 +
> >  .../driver-api/gpio/legacy-boards.rst         | 298 ++++++++++++++++++
> >  3 files changed, 363 insertions(+)
> > 
> > diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
> > index 4fd1cbd8296e..0cf64e1f2623 100644
> > --- a/Documentation/driver-api/gpio/board.rst
> > +++ b/Documentation/driver-api/gpio/board.rst
> > @@ -94,6 +94,70 @@ with the help of _DSD (Device Specific Data), introduced in ACPI 5.1::
> >  For more information about the ACPI GPIO bindings see
> >  Documentation/firmware-guide/acpi/gpio-properties.rst.
> >  
> > +Software Nodes
> > +--------------
> > +Software nodes allows to construct an in-memory, device-tree-like structure
> 
>                   allow { drivers | modules | software | us}
> 
> although "software" seems redundant.

I changed it to "... allows board specific code ..."

> 
> > +using ``struct software_node`` and ``struct property_entry``. This structure
> 
> Quoting Jon (for a different struct):
>   Better to just say "struct list_head", and the automarkup logic should
>   take care of the rest.
> 
> @Jon: ISTM that we need something in Documentation/doc-guide/sphinx.rst (?) about which
> keywords are handled by automarkup logic. AFAIK, they are struct, union, enum,
> and typedef (keywords) and function() as indicated by the "()".

Unfortunately device properties/software nodes are not yet hooked to the
documentations, so automatic markup/cross referencing does not work.

I changed this to :c:type:`struct software_node <software_node>`.

> 
> 
> 
> > +can then be associated with a platform device, allowing drivers to use the
> > +standard device properties API to query configuration, just as they would on an
> > +ACPI or device tree systems.
> 
>                        system.

OK.

> 
> > +
> > +Software-node-backed GPIOs are described using ``PROPERTY_ENTRY_GPIO()``
> > +macro, which ties a sotfware node representing GPIO controller with consumer
> 
>                        software

Yep, thanks.

> 
> > +device. It allows consumers to use regular gpiolib APIs, such as ``gpiod_get()``,
> > +``gpiod_get_optional()``.
> > +
> > +The software node representing GPIO controller need not be attached to the
> > +GPIO controller device. The only requirement that the node must be registered
> 
>                                     requirement is that

OK.

> 
> > +and its name much match the GPIO controller's label.
> 
>                 must

OK.

> 
> > +
> > +For example, here is how to describe a single GPIO-connected LED. This is an
> > +alternative to using platform_data on legacy systems.
> > +
> > +.. code-block:: c
> > +
> > +	#include <linux/property.h>
> > +	#include <linux/gpio/machine.h>
> > +	#include <linux/gpio/property.h>
> > +
> > +	/*
> > +	 * 1. Define a node for the GPIO controller. Its .name must match the
> > +	 *    controller's label.
> > +	 */
> > +	static const struct software_node gpio_controller_node = {
> > +		.name = "gpio-foo",
> > +	};
> > +
> > +	/* 2. Define the properties for the LED device. */
> > +	static const struct property_entry led_device_props[] = {
> > +		PROPERTY_ENTRY_STRING("label", "myboard:green:status"),
> > +		PROPERTY_ENTRY_STRING("linux,default-trigger", "heartbeat"),
> > +		PROPERTY_ENTRY_GPIO("gpios", &gpio_controller_node, 42, GPIO_ACTIVE_HIGH),
> > +		{ }
> > +	};
> > +
> > +	/* 3. Define the software node for the LED device. */
> > +	static const struct software_node led_device_swnode = {
> > +		.name = "status-led",
> > +		.properties = led_device_props,
> > +	};
> > +
> > +	/*
> > +	 * 4. Register the software nodes and the platform device.
> > +	 */
> > +	const struct software_node *swnodes[] = {
> > +		&gpio_controller_node,
> > +		&led_device_swnode,
> > +		NULL
> > +	};
> > +	software_node_register_node_group(swnodes);
> > +
> > +	// Then register a platform_device for "leds-gpio" and associate
> > +	// it with &led_device_swnode via .fwnode.
> > +
> > +For a complete guide on converting board files to use software nodes, see
> > +Documentation/driver-api/gpio/legacy-boards.rst.
> > +
> >  Platform Data
> >  -------------
> >  Finally, GPIOs can be bound to devices and functions using platform data. Board
> 
> 
> 
> > diff --git a/Documentation/driver-api/gpio/legacy-boards.rst b/Documentation/driver-api/gpio/legacy-boards.rst
> > new file mode 100644
> > index 000000000000..6700a2549220
> > --- /dev/null
> > +++ b/Documentation/driver-api/gpio/legacy-boards.rst
> > @@ -0,0 +1,298 @@
> > +Supporting Legacy Boards
> > +========================
> > +
> > +Many drivers in the kernel, such as ``leds-gpio`` and ``gpio-keys``, are
> > +migrating away from using board-specific ``platform_data`` to a unified device
> > +properties interface. This interface allows drivers to be simpler and more
> > +generic, as they can query properties in a standardized way.
> > +
> > +On modern systems, these properties are provided via device tree. However, some
> > +older platforms have not been converted to device tree and instead rely on
> > +board files to describe their hardware configuration. To bridge this gap and
> > +allow these legacy boards to work with modern, generic drivers, the kernel
> > +provides a mechanism called **software nodes**.
> > +
> > +This document provides a guide on how to convert a legacy board file from using
> > +``platform_data`` and ``gpiod_lookup_table`` to the modern software node
> > +approach for describing GPIO-connected devices.
> > +
> > +The Core Idea: Software Nodes
> > +-----------------------------
> > +
> > +Software nodes allows to construct an in-memory, device-tree-like structure
> 
>                   allow {some object of the verb, as suggested above}

Done.

> 
> > +using ``struct software_node`` and ``struct property_entry``. This structure
> 
> Please drop the "``" markups. They aren't needed.

As I mentioned above some kind of markups currently is needed.

> 
> > +can then be associated with a platform device, allowing drivers to use the
> > +standard device properties API (e.g., ``device_property_read_u32()``,
> > +``device_property_read_string()``) to query configuration, just as they would
> > +on an ACPI or device tree systems.
> 
>                              system.

OK.

> 
> > +
> > +The gpiolib code has support for handling software nodes, so that if GPIO is
> > +described properly, as detailed in the section below, then regular gpiolib APIs,
> > +such as ``gpiod_get()``, ``gpiod_get_optional()`` and others will work.
> > +
> > +Requirements for GPIO Properties
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +When using software nodes to describe GPIO connections, the following
> > +requirements must be met for the GPIO core to correctly resolve the reference:
> > +
> > +1.  **The GPIO controller's software node ``name`` must match the controller's
> > +    ``label``.** The gpiolib core uses this name to find the corresponding
> > +    ``struct gpio_chip`` at runtime.
> 
> "``" not needed.

Dropped.

> 
> > +    This software node has to be registered, but need not be attached to the
> > +    device representing GPIO controller that is providing GPIO in question.
> > +    It may be left as a "free floating" node.
> > +
> > +2.  **The GPIO property must be a reference.** The ``PROPERTY_ENTRY_GPIO()``
> > +    macro handles this as it is an alias for ``PROPERTY_ENTRY_REF()``.
> > +
> > +3.  **The reference must have exactly two arguments:**
> > +
> > +    - The first argument is the GPIO offset within the controller.
> > +    - The second argument is the flags for the GPIO line (e.g.,
> > +      ``GPIO_ACTIVE_HIGH``, ``GPIO_ACTIVE_LOW``).
> > +
> > +The ``PROPERTY_ENTRY_GPIO()`` macro is the preferred way of defining GPIO
> > +properties in software nodes.
> > +
> > +Conversion Example
> > +------------------
> > +
> > +Let's walk through an example of converting a board file that defines a GPIO-
> > +connected LED and a button.
> > +
> > +Before: Using Platform Data
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +A typical legacy board file might look like this:
> > +
> > +.. code-block:: c
> > +
> > +  #include <linux/platform_device.h>
> > +  #include <linux/leds.h>
> > +  #include <linux/gpio_keys.h>
> > +  #include <linux/gpio/machine.h>
> > +
> > +  #define MYBOARD_GPIO_CONTROLLER "gpio-foo"
> > +
> > +  /* LED setup */
> > +  static const struct gpio_led myboard_leds[] = {
> > +  	{
> > +  		.name = "myboard:green:status",
> > +  		.default_trigger = "heartbeat",
> > +  	},
> > +  };
> > +
> > +  static const struct gpio_led_platform_data myboard_leds_pdata = {
> > +  	.num_leds = ARRAY_SIZE(myboard_leds),
> > +  	.leds = myboard_leds,
> > +  };
> > +
> > +  static struct gpiod_lookup_table myboard_leds_gpios = {
> > +  	.dev_id = "leds-gpio",
> > +  	.table = {
> > +  		GPIO_LOOKUP_IDX(MYBOARD_GPIO_CONTROLLER, 42, NULL, 0, GPIO_ACTIVE_HIGH),
> > +  		{ },
> > +  	},
> > +  };
> > +
> > +  /* Button setup */
> > +  static struct gpio_keys_button myboard_buttons[] = {
> > +  	{
> > +  		.code = KEY_WPS_BUTTON,
> > +  		.desc = "WPS Button",
> > +  		.active_low = 1,
> > +  	},
> > +  };
> > +
> > +  static const struct gpio_keys_platform_data myboard_buttons_pdata = {
> > +  	.buttons = myboard_buttons,
> > +  	.nbuttons = ARRAY_SIZE(myboard_buttons),
> > +  };
> > +
> > +  static struct gpiod_lookup_table myboard_buttons_gpios = {
> > +  	.dev_id = "gpio-keys",
> > +  	.table = {
> > +  		GPIO_LOOKUP_IDX(MYBOARD_GPIO_CONTROLLER, 15, NULL, 0, GPIO_ACTIVE_LOW),
> > +  		{ },
> > +  	},
> > +  };
> > +
> > +  /* Device registration */
> > +  static int __init myboard_init(void)
> > +  {
> > +  	gpiod_add_lookup_table(&myboard_leds_gpios);
> > +  	gpiod_add_lookup_table(&myboard_buttons_gpios);
> > +
> > +  	platform_device_register_data(NULL, "leds-gpio", -1,
> > +  				      &myboard_leds_pdata, sizeof(myboard_leds_pdata));
> > +  	platform_device_register_data(NULL, "gpio-keys", -1,
> > +  				      &myboard_buttons_pdata, sizeof(myboard_buttons_pdata));
> > +
> > +  	return 0;
> > +  }
> > +
> > +After: Using Software Nodes
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Here is how the same configuration can be expressed using software nodes.
> > +
> > +Step 1: Define the GPIO Controller Node
> > +***************************************
> > +
> > +First, define a software node that represents the GPIO controller that the
> > +LEDs and buttons are connected to. The ``name`` of this node must match the
> > +name of the driver for the GPIO controller (e.g., "gpio-foo").
> > +
> > +.. code-block:: c
> > +
> > +  #include <linux/property.h>
> > +  #include <linux/gpio/property.h>
> > +
> > +  #define MYBOARD_GPIO_CONTROLLER "gpio-foo"
> > +
> > +  static const struct software_node myboard_gpio_controller_node = {
> > +  	.name = MYBOARD_GPIO_CONTROLLER,
> > +  };
> > +
> > +Step 2: Define Consumer Device Nodes and Properties
> > +***************************************************
> > +
> > +Next, define the software nodes for the consumer devices (the LEDs and buttons).
> > +This involves creating a parent node for each device type and child nodes for
> > +each individual LED or button.
> > +
> > +.. code-block:: c
> > +
> > +  /* LED setup */
> > +  static const struct software_node myboard_leds_node = {
> > +  	.name = "myboard-leds",
> > +  };
> > +
> > +  static const struct property_entry myboard_status_led_props[] = {
> > +  	PROPERTY_ENTRY_STRING("label", "myboard:green:status"),
> > +  	PROPERTY_ENTRY_STRING("linux,default-trigger", "heartbeat"),
> > +  	PROPERTY_ENTRY_GPIO("gpios", &myboard_gpio_controller_node, 42, GPIO_ACTIVE_HIGH),
> > +  	{ }
> > +  };
> > +
> > +  static const struct software_node myboard_status_led_swnode = {
> > +  	.name = "status-led",
> > +  	.parent = &myboard_leds_node,
> > +  	.properties = myboard_status_led_props,
> > +  };
> > +
> > +  /* Button setup */
> > +  static const struct software_node myboard_keys_node = {
> > +  	.name = "myboard-keys",
> > +  };
> > +
> > +  static const struct property_entry myboard_wps_button_props[] = {
> > +  	PROPERTY_ENTRY_STRING("label", "WPS Button"),
> > +  	PROPERTY_ENTRY_U32("linux,code", KEY_WPS_BUTTON),
> > +  	PROPERTY_ENTRY_GPIO("gpios", &myboard_gpio_controller_node, 15, GPIO_ACTIVE_LOW),
> > +  	{ }
> > +  };
> > +
> > +  static const struct software_node myboard_wps_button_swnode = {
> > +  	.name = "wps-button",
> > +  	.parent = &myboard_keys_node,
> > +  	.properties = myboard_wps_button_props,
> > +  };
> > +
> > +
> > +
> > +Step 3: Group and Register the Nodes
> > +************************************
> > +
> > +For maintainability, it is often beneficial to group all software nodes into a
> > +single array and register them with one call.
> > +
> > +.. code-block:: c
> > +
> > +  static const struct software_node * const myboard_swnodes[] __initconst = {
> > +  	&myboard_gpio_controller_node,
> > +  	&myboard_leds_node,
> > +  	&myboard_status_led_swnode,
> > +  	&myboard_keys_node,
> > +  	&myboard_wps_button_swnode,
> > +  	NULL
> > +  };
> > +
> > +  static int __init myboard_init(void)
> > +  {
> > +  	int error;
> > +
> > +  	error = software_node_register_node_group(myboard_swnodes);
> > +  	if (error) {
> > +  		pr_err("Failed to register software nodes: %d\n", error);
> > +  		return error;
> > +  	}
> > +
> > +  	// ... platform device registration follows
> > +  }
> > +
> > +.. note::
> > +  When splitting registration of nodes by devices that they represent, it is
> > +  essential that the software node representing the GPIO controller itself
> > +  is registered first, before any of the nodes that reference it.
> > +
> > +Step 4: Register Platform Devices with Software Nodes
> > +*****************************************************
> > +
> > +Finally, register the platform devices and associate them with their respective
> > +software nodes using the ``fwnode`` field in ``struct platform_device_info``.
> 
> Drop the "``" on struct platform_device_info.

It is not documented anywhere, so used :c:type:`....` for it.

Thanks.

-- 
Dmitry

