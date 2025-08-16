Return-Path: <linux-gpio+bounces-24462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34628B290D5
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 00:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 689DDAC3372
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 22:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FFE2135CE;
	Sat, 16 Aug 2025 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t6PoffLE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753551E489;
	Sat, 16 Aug 2025 22:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755382130; cv=none; b=XPkXpOFrW9HT75nAWOyAPQfRU7nBRojimk/APKReml5aigZtA0spIQqtN0udrzXgpDnObnQfuLNvpkyVCB4EeZXpAlP/ixbyZPbPP5n4t+7dkieNsWgAXSH8qTOnSRM330pN86AM0WdM/bCbV2bfFEGsGLdAudsTK9Q7AemXeR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755382130; c=relaxed/simple;
	bh=OYPXltTxOZatL8me6emnn9BLtSg+cy+e/iB9ifPSD1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MWc3cxFpehq9MCpwwMCJRFWntb3Huw3GL0Z5i5+5hwf+/l+yEHObaijkxa62GCPYBsDPX1X7ZQ6/EsjJNaEB4NSlFmTygjS0y/5e+6QoCUyH5pBUPeDueqdTPan3uZC2d8j9NaaU2KIdwi6qKE2UMfbyoRpe9aNzDtg5MPfM25Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=t6PoffLE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rFkWGWdQRzztsmRM3Sy7XqlLqyMpY+WbTNHgy3h7xFA=; b=t6PoffLEve7V8Igt9hion6HKix
	yADZASELNy9Hm1cLp+jpqzpYu9XBQJDQrROd1Caeuruibku6YVDWUxtbCxQbFBhLPPnSOPZIn0wAh
	pyL9zbjUdxfc23wQWjXYW2eCJYWP2lE1IBP11SRB8+sZFZutkq61nwRPP5Rg3g3xGorofBQAJgV53
	wXetuLwq8j5YWo6iqJuDB+GEUuOpSBErULPDXGi/6c7hlXGd3rXyxVFERMUhGSfo4FJEgnXjSmnOA
	XaBdgf3dGaRp7nFL2J8KSI1O1g/dimyynGlg9DJDU2y/UJ331aWfQZZErKFW8Dp0zkiPPBZUofQVV
	pXiMTzyw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unP4v-00000005Bto-3Igw;
	Sat, 16 Aug 2025 22:08:45 +0000
Message-ID: <8bdf668d-c120-4ed5-a0f4-fe8c0876c8d2@infradead.org>
Date: Sat, 16 Aug 2025 15:08:45 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: gpio: add documentation about using
 software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ce4pjordujfvaujjgxruszba7ivoywex32rfwzeiil2zcdlgl5@lt4vvv4yalzm>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ce4pjordujfvaujjgxruszba7ivoywex32rfwzeiil2zcdlgl5@lt4vvv4yalzm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I have a few more nits...


On 8/15/25 10:30 AM, Dmitry Torokhov wrote:
> Introduce documentation regarding use of software nodes to describe
> GPIOs on legacy boards that have not been converted to device tree.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> v2: Addressed Randy's comments.
> 
>  Documentation/driver-api/gpio/board.rst       |  65 ++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  .../driver-api/gpio/legacy-boards.rst         | 298 ++++++++++++++++++
>  3 files changed, 364 insertions(+)
> 
> diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
> index 4fd1cbd8296e..b802b4eef2cd 100644
> --- a/Documentation/driver-api/gpio/board.rst
> +++ b/Documentation/driver-api/gpio/board.rst
> @@ -94,6 +94,71 @@ with the help of _DSD (Device Specific Data), introduced in ACPI 5.1::
>  For more information about the ACPI GPIO bindings see
>  Documentation/firmware-guide/acpi/gpio-properties.rst.
>  
> +Software Nodes
> +--------------
> +
> +Software nodes allow board specific code to construct an in-memory,

                        board-specific

> +device-tree-like structure using struct software_node and struct
> +property_entry. This structure can then be associated with a platform device,
> +allowing drivers to use the standard device properties API to query
> +configuration, just as they would on an ACPI or device tree system.
> +
> +Software-node-backed GPIOs are described using ``PROPERTY_ENTRY_GPIO()`` macro,

                                            using the ...

> +which ties a software node representing GPIO controller with consumer device.

                              representing {a | the} GPIO controller ...

> +It allows consumers to use regular gpiolib APIs, such as gpiod_get(),
> +gpiod_get_optional().
> +
> +The software node representing GPIO controller need not be attached to the GPIO

                     representing a GPIO ...

> +controller device. The only requirement is that the node must be registered and
> +its name must match the GPIO controller's label.
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
> diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
> index 43f6a3afe10b..87929840e85a 100644
> --- a/Documentation/driver-api/gpio/index.rst
> +++ b/Documentation/driver-api/gpio/index.rst
> @@ -12,6 +12,7 @@ Contents:
>     driver
>     consumer
>     board
> +   legacy-boards
>     drivers-on-gpio
>     bt8xxgpio
>  
> diff --git a/Documentation/driver-api/gpio/legacy-boards.rst b/Documentation/driver-api/gpio/legacy-boards.rst
> new file mode 100644
> index 000000000000..deef5c5cf417
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
> +Software nodes allow board specific code to construct an in-memory,

                        board-specific

> +device-tree-like structure using struct software_node and struct
> +property_entry. This structure can then be associated with a platform device,
> +allowing drivers to use the standard device properties API (e.g.,
> +device_property_read_u32(), device_property_read_string()) to query
> +configuration, just as they would on an ACPI or device tree system.
> +
> +The gpiolib code has support for handling software nodes, so that if GPIO is
> +described properly, as detailed in the section below, then regular gpiolib APIs,
> +such as gpiod_get(), gpiod_get_optional(), and others will work.
> +
> +Requirements for GPIO Properties
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +When using software nodes to describe GPIO connections, the following
> +requirements must be met for the GPIO core to correctly resolve the reference:
> +
> +1.  **The GPIO controller's software node "name" must match the controller's
> +    "label".** The gpiolib core uses this name to find the corresponding
> +    struct gpio_chip at runtime.
> +    This software node has to be registered, but need not be attached to the
> +    device representing GPIO controller that is providing GPIO in question.

              representing the GPIO controller that is providing the GPIO in question.


> +    It may be left as a "free floating" node.
> +


Overall, this looks good. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy

