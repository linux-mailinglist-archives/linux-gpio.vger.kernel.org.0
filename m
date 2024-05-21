Return-Path: <linux-gpio+bounces-6510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0298CAB92
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 12:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CA111F20C93
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 10:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F8D6CDA0;
	Tue, 21 May 2024 10:13:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D098E179BD;
	Tue, 21 May 2024 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716286407; cv=none; b=R2Z5cNn4NJS09Y6cf7BSLGSUwJRt/jjH2kKY4+/Wd3q4dQR9Tp0/ANldvtDV4EKbUpKHfvdZ+Z/0sS9alJgMHG3T/rsHSSFpLCrl+lr9s3EzvL3Iv3H7sfoBkc5V5vnfAF1z7Q4ahfUF6bboRIkwD7yvy8QOL5EeO3yHYEWvVUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716286407; c=relaxed/simple;
	bh=8GIEHW3PWBzxGJ2jSS8tTdqkSfAmBmd6VG6wYvB+LO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ypj2i4VBuWbM8V5B6bGbRhOgy08G0m/suDuB5R5lgQCiH6iu+7hGocMTA/xHe8DG4BqnbwX/C5iVCKHDb1ujr2B32zhuqOODyK6zPaA8qHLRk+9sSFNKnLlN4hxAeX5GU0CRoGe1CzyRmgJAESjezZdP8DMoDygcuERXQ5TGCDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=link.tyut.edu.cn; spf=pass smtp.mailfrom=link.tyut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=link.tyut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=link.tyut.edu.cn
Received: from [192.168.1.3] (unknown [18.162.169.18])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 4BEA792015F;
	Tue, 21 May 2024 18:12:31 +0800 (CST)
Message-ID: <61cc05b4-60f7-4720-8ca7-06bf70db9ee6@link.tyut.edu.cn>
Date: Tue, 21 May 2024 18:12:28 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] gpio: Remove legacy API documentation
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vegard Nossum <vegard.nossum@oracle.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
References: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Hu Haowen <2023002089@link.tyut.edu.cn>
In-Reply-To: <20240508101703.830066-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZS0JLVksZH0pPTU4ZHUlPSlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpDVUpNSVVKTUJVSkNZV1kWGg8SFR0UWUFZT0tIVUpKS0hKQ1VKS0tVS1kG
X-HM-Tid: 0a8f9aa3703703a1kunm4bea792015f
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mhw6GRw*FjNMNRo*US4OFh88
	EhkwCglVSlVKTEpNSUNNSE5PTkJCVTMWGhIXVUlLSUhLS0lLQ0I7FxIVEFUPAg4PVR4fDlUYFUVZ
	V1kSC1lBWUpDVUpNSVVKTUJVSkNZV1kIAVlBSktNS0lLNwY+

Reviewed-by: Hu Haowen <2023002089@link.tyut.edu.cn>


Thanks,

Hu Haowen


在 2024/5/8 18:17, Andy Shevchenko 写道:
> In order to discourage people to use old and legacy GPIO APIs
> remove the respective documentation completely. It also helps
> further cleanups of the legacy GPIO API leftovers, which is
> ongoing task.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   Documentation/driver-api/gpio/board.rst       |   6 -
>   Documentation/driver-api/gpio/consumer.rst    |   4 +-
>   Documentation/driver-api/gpio/index.rst       |   1 -
>   Documentation/driver-api/gpio/intro.rst       |  12 -
>   Documentation/driver-api/gpio/legacy.rst      | 679 ------------------
>   .../zh_CN/driver-api/gpio/index.rst           |   2 -
>   .../zh_CN/driver-api/gpio/legacy.rst          | 618 ----------------
>   Documentation/translations/zh_TW/gpio.txt     | 574 ---------------
>   include/linux/gpio.h                          |   6 +-
>   9 files changed, 2 insertions(+), 1900 deletions(-)
>   delete mode 100644 Documentation/driver-api/gpio/legacy.rst
>   delete mode 100644 Documentation/translations/zh_CN/driver-api/gpio/legacy.rst
>   delete mode 100644 Documentation/translations/zh_TW/gpio.txt
>
> diff --git a/Documentation/driver-api/gpio/board.rst b/Documentation/driver-api/gpio/board.rst
> index b33aa04f213f..4fd1cbd8296e 100644
> --- a/Documentation/driver-api/gpio/board.rst
> +++ b/Documentation/driver-api/gpio/board.rst
> @@ -4,12 +4,6 @@ GPIO Mappings
>   
>   This document explains how GPIOs can be assigned to given devices and functions.
>   
> -Note that it only applies to the new descriptor-based interface. For a
> -description of the deprecated integer-based GPIO interface please refer to
> -legacy.rst (actually, there is no real mapping possible with the old
> -interface; you just fetch an integer from somewhere and request the
> -corresponding GPIO).
> -
>   All platforms can enable the GPIO library, but if the platform strictly
>   requires GPIO functionality to be present, it needs to select GPIOLIB from its
>   Kconfig. Then, how GPIOs are mapped depends on what the platform uses to
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
> index ab56ab0dd7a6..bb3366047fad 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -2,9 +2,7 @@
>   GPIO Descriptor Consumer Interface
>   ==================================
>   
> -This document describes the consumer interface of the GPIO framework. Note that
> -it describes the new descriptor-based interface. For a description of the
> -deprecated integer-based GPIO interface please refer to legacy.rst.
> +This document describes the consumer interface of the GPIO framework.
>   
>   
>   Guidelines for GPIOs consumers
> diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
> index 1d48fe248f05..34b57cee3391 100644
> --- a/Documentation/driver-api/gpio/index.rst
> +++ b/Documentation/driver-api/gpio/index.rst
> @@ -13,7 +13,6 @@ Contents:
>      consumer
>      board
>      drivers-on-gpio
> -   legacy
>      bt8xxgpio
>   
>   Core
> diff --git a/Documentation/driver-api/gpio/intro.rst b/Documentation/driver-api/gpio/intro.rst
> index c9c19243b97f..5936a9c57df3 100644
> --- a/Documentation/driver-api/gpio/intro.rst
> +++ b/Documentation/driver-api/gpio/intro.rst
> @@ -10,18 +10,6 @@ The documents in this directory give detailed instructions on how to access
>   GPIOs in drivers, and how to write a driver for a device that provides GPIOs
>   itself.
>   
> -Due to the history of GPIO interfaces in the kernel, there are two different
> -ways to obtain and use GPIOs:
> -
> -  - The descriptor-based interface is the preferred way to manipulate GPIOs,
> -    and is described by all the files in this directory excepted legacy.rst.
> -  - The legacy integer-based interface which is considered deprecated (but still
> -    usable for compatibility reasons) is documented in legacy.rst.
> -
> -The remainder of this document applies to the new descriptor-based interface.
> -legacy.rst contains the same information applied to the legacy
> -integer-based interface.
> -
>   
>   What is a GPIO?
>   ===============
> diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/driver-api/gpio/legacy.rst
> deleted file mode 100644
> index 534dfe95d128..000000000000
> --- a/Documentation/driver-api/gpio/legacy.rst
> +++ /dev/null
> @@ -1,679 +0,0 @@
> -======================
> -Legacy GPIO Interfaces
> -======================
> -
> -This provides an overview of GPIO access conventions on Linux.
> -
> -These calls use the gpio_* naming prefix.  No other calls should use that
> -prefix, or the related __gpio_* prefix.
> -
> -
> -What is a GPIO?
> -===============
> -A "General Purpose Input/Output" (GPIO) is a flexible software-controlled
> -digital signal.  They are provided from many kinds of chip, and are familiar
> -to Linux developers working with embedded and custom hardware.  Each GPIO
> -represents a bit connected to a particular pin, or "ball" on Ball Grid Array
> -(BGA) packages.  Board schematics show which external hardware connects to
> -which GPIOs.  Drivers can be written generically, so that board setup code
> -passes such pin configuration data to drivers.
> -
> -System-on-Chip (SOC) processors heavily rely on GPIOs.  In some cases, every
> -non-dedicated pin can be configured as a GPIO; and most chips have at least
> -several dozen of them.  Programmable logic devices (like FPGAs) can easily
> -provide GPIOs; multifunction chips like power managers, and audio codecs
> -often have a few such pins to help with pin scarcity on SOCs; and there are
> -also "GPIO Expander" chips that connect using the I2C or SPI serial busses.
> -Most PC southbridges have a few dozen GPIO-capable pins (with only the BIOS
> -firmware knowing how they're used).
> -
> -The exact capabilities of GPIOs vary between systems.  Common options:
> -
> -  - Output values are writable (high=1, low=0).  Some chips also have
> -    options about how that value is driven, so that for example only one
> -    value might be driven ... supporting "wire-OR" and similar schemes
> -    for the other value (notably, "open drain" signaling).
> -
> -  - Input values are likewise readable (1, 0).  Some chips support readback
> -    of pins configured as "output", which is very useful in such "wire-OR"
> -    cases (to support bidirectional signaling).  GPIO controllers may have
> -    input de-glitch/debounce logic, sometimes with software controls.
> -
> -  - Inputs can often be used as IRQ signals, often edge triggered but
> -    sometimes level triggered.  Such IRQs may be configurable as system
> -    wakeup events, to wake the system from a low power state.
> -
> -  - Usually a GPIO will be configurable as either input or output, as needed
> -    by different product boards; single direction ones exist too.
> -
> -  - Most GPIOs can be accessed while holding spinlocks, but those accessed
> -    through a serial bus normally can't.  Some systems support both types.
> -
> -On a given board each GPIO is used for one specific purpose like monitoring
> -MMC/SD card insertion/removal, detecting card writeprotect status, driving
> -a LED, configuring a transceiver, bitbanging a serial bus, poking a hardware
> -watchdog, sensing a switch, and so on.
> -
> -
> -GPIO conventions
> -================
> -Note that this is called a "convention" because you don't need to do it this
> -way, and it's no crime if you don't.  There **are** cases where portability
> -is not the main issue; GPIOs are often used for the kind of board-specific
> -glue logic that may even change between board revisions, and can't ever be
> -used on a board that's wired differently.  Only least-common-denominator
> -functionality can be very portable.  Other features are platform-specific,
> -and that can be critical for glue logic.
> -
> -Plus, this doesn't require any implementation framework, just an interface.
> -One platform might implement it as simple inline functions accessing chip
> -registers; another might implement it by delegating through abstractions
> -used for several very different kinds of GPIO controller.  (There is some
> -optional code supporting such an implementation strategy, described later
> -in this document, but drivers acting as clients to the GPIO interface must
> -not care how it's implemented.)
> -
> -That said, if the convention is supported on their platform, drivers should
> -use it when possible.  Platforms must select GPIOLIB if GPIO functionality
> -is strictly required.  Drivers that can't work without
> -standard GPIO calls should have Kconfig entries which depend on GPIOLIB.  The
> -GPIO calls are available, either as "real code" or as optimized-away stubs,
> -when drivers use the include file:
> -
> -	#include <linux/gpio.h>
> -
> -If you stick to this convention then it'll be easier for other developers to
> -see what your code is doing, and help maintain it.
> -
> -Note that these operations include I/O barriers on platforms which need to
> -use them; drivers don't need to add them explicitly.
> -
> -
> -Identifying GPIOs
> ------------------
> -GPIOs are identified by unsigned integers in the range 0..MAX_INT.  That
> -reserves "negative" numbers for other purposes like marking signals as
> -"not available on this board", or indicating faults.  Code that doesn't
> -touch the underlying hardware treats these integers as opaque cookies.
> -
> -Platforms define how they use those integers, and usually #define symbols
> -for the GPIO lines so that board-specific setup code directly corresponds
> -to the relevant schematics.  In contrast, drivers should only use GPIO
> -numbers passed to them from that setup code, using platform_data to hold
> -board-specific pin configuration data (along with other board specific
> -data they need).  That avoids portability problems.
> -
> -So for example one platform uses numbers 32-159 for GPIOs; while another
> -uses numbers 0..63 with one set of GPIO controllers, 64-79 with another
> -type of GPIO controller, and on one particular board 80-95 with an FPGA.
> -The numbers need not be contiguous; either of those platforms could also
> -use numbers 2000-2063 to identify GPIOs in a bank of I2C GPIO expanders.
> -
> -If you want to initialize a structure with an invalid GPIO number, use
> -some negative number (perhaps "-EINVAL"); that will never be valid.  To
> -test if such number from such a structure could reference a GPIO, you
> -may use this predicate:
> -
> -	int gpio_is_valid(int number);
> -
> -A number that's not valid will be rejected by calls which may request
> -or free GPIOs (see below).  Other numbers may also be rejected; for
> -example, a number might be valid but temporarily unused on a given board.
> -
> -Whether a platform supports multiple GPIO controllers is a platform-specific
> -implementation issue, as are whether that support can leave "holes" in the space
> -of GPIO numbers, and whether new controllers can be added at runtime.  Such issues
> -can affect things including whether adjacent GPIO numbers are both valid.
> -
> -Using GPIOs
> ------------
> -The first thing a system should do with a GPIO is allocate it, using
> -the gpio_request() call; see later.
> -
> -One of the next things to do with a GPIO, often in board setup code when
> -setting up a platform_device using the GPIO, is mark its direction::
> -
> -	/* set as input or output, returning 0 or negative errno */
> -	int gpio_direction_input(unsigned gpio);
> -	int gpio_direction_output(unsigned gpio, int value);
> -
> -The return value is zero for success, else a negative errno.  It should
> -be checked, since the get/set calls don't have error returns and since
> -misconfiguration is possible.  You should normally issue these calls from
> -a task context.  However, for spinlock-safe GPIOs it's OK to use them
> -before tasking is enabled, as part of early board setup.
> -
> -For output GPIOs, the value provided becomes the initial output value.
> -This helps avoid signal glitching during system startup.
> -
> -For compatibility with legacy interfaces to GPIOs, setting the direction
> -of a GPIO implicitly requests that GPIO (see below) if it has not been
> -requested already.  That compatibility is being removed from the optional
> -gpiolib framework.
> -
> -Setting the direction can fail if the GPIO number is invalid, or when
> -that particular GPIO can't be used in that mode.  It's generally a bad
> -idea to rely on boot firmware to have set the direction correctly, since
> -it probably wasn't validated to do more than boot Linux.  (Similarly,
> -that board setup code probably needs to multiplex that pin as a GPIO,
> -and configure pullups/pulldowns appropriately.)
> -
> -
> -Spinlock-Safe GPIO access
> --------------------------
> -Most GPIO controllers can be accessed with memory read/write instructions.
> -Those don't need to sleep, and can safely be done from inside hard
> -(nonthreaded) IRQ handlers and similar contexts.
> -
> -Use the following calls to access such GPIOs::
> -
> -	/* GPIO INPUT:  return zero or nonzero */
> -	int gpio_get_value(unsigned gpio);
> -
> -	/* GPIO OUTPUT */
> -	void gpio_set_value(unsigned gpio, int value);
> -
> -The values are boolean, zero for low, nonzero for high.  When reading the
> -value of an output pin, the value returned should be what's seen on the
> -pin ... that won't always match the specified output value, because of
> -issues including open-drain signaling and output latencies.
> -
> -The get/set calls have no error returns because "invalid GPIO" should have
> -been reported earlier from gpio_direction_*().  However, note that not all
> -platforms can read the value of output pins; those that can't should always
> -return zero.  Also, using these calls for GPIOs that can't safely be accessed
> -without sleeping (see below) is an error.
> -
> -Platform-specific implementations are encouraged to optimize the two
> -calls to access the GPIO value in cases where the GPIO number (and for
> -output, value) are constant.  It's normal for them to need only a couple
> -of instructions in such cases (reading or writing a hardware register),
> -and not to need spinlocks.  Such optimized calls can make bitbanging
> -applications a lot more efficient (in both space and time) than spending
> -dozens of instructions on subroutine calls.
> -
> -
> -GPIO access that may sleep
> ---------------------------
> -Some GPIO controllers must be accessed using message based busses like I2C
> -or SPI.  Commands to read or write those GPIO values require waiting to
> -get to the head of a queue to transmit a command and get its response.
> -This requires sleeping, which can't be done from inside IRQ handlers.
> -To access such GPIOs, a different set of accessors is defined::
> -
> -	/* GPIO INPUT:  return zero or nonzero, might sleep */
> -	int gpio_get_value_cansleep(unsigned gpio);
> -
> -	/* GPIO OUTPUT, might sleep */
> -	void gpio_set_value_cansleep(unsigned gpio, int value);
> -
> -Accessing such GPIOs requires a context which may sleep,  for example
> -a threaded IRQ handler, and those accessors must be used instead of
> -spinlock-safe accessors without the cansleep() name suffix.
> -
> -Other than the fact that these accessors might sleep, and will work
> -on GPIOs that can't be accessed from hardIRQ handlers, these calls act
> -the same as the spinlock-safe calls.
> -
> -**IN ADDITION** calls to setup and configure such GPIOs must be made
> -from contexts which may sleep, since they may need to access the GPIO
> -controller chip too  (These setup calls are usually made from board
> -setup or driver probe/teardown code, so this is an easy constraint.)::
> -
> -                gpio_direction_input()
> -                gpio_direction_output()
> -                gpio_request()
> -
> -        ## 	gpio_request_one()
> -
> -                gpio_free()
> -
> -
> -Claiming and Releasing GPIOs
> -----------------------------
> -To help catch system configuration errors, two calls are defined::
> -
> -	/* request GPIO, returning 0 or negative errno.
> -	 * non-null labels may be useful for diagnostics.
> -	 */
> -	int gpio_request(unsigned gpio, const char *label);
> -
> -	/* release previously-claimed GPIO */
> -	void gpio_free(unsigned gpio);
> -
> -Passing invalid GPIO numbers to gpio_request() will fail, as will requesting
> -GPIOs that have already been claimed with that call.  The return value of
> -gpio_request() must be checked.  You should normally issue these calls from
> -a task context.  However, for spinlock-safe GPIOs it's OK to request GPIOs
> -before tasking is enabled, as part of early board setup.
> -
> -These calls serve two basic purposes.  One is marking the signals which
> -are actually in use as GPIOs, for better diagnostics; systems may have
> -several hundred potential GPIOs, but often only a dozen are used on any
> -given board.  Another is to catch conflicts, identifying errors when
> -(a) two or more drivers wrongly think they have exclusive use of that
> -signal, or (b) something wrongly believes it's safe to remove drivers
> -needed to manage a signal that's in active use.  That is, requesting a
> -GPIO can serve as a kind of lock.
> -
> -Some platforms may also use knowledge about what GPIOs are active for
> -power management, such as by powering down unused chip sectors and, more
> -easily, gating off unused clocks.
> -
> -For GPIOs that use pins known to the pinctrl subsystem, that subsystem should
> -be informed of their use; a gpiolib driver's .request() operation may call
> -pinctrl_gpio_request(), and a gpiolib driver's .free() operation may call
> -pinctrl_gpio_free(). The pinctrl subsystem allows a pinctrl_gpio_request()
> -to succeed concurrently with a pin or pingroup being "owned" by a device for
> -pin multiplexing.
> -
> -Any programming of pin multiplexing hardware that is needed to route the
> -GPIO signal to the appropriate pin should occur within a GPIO driver's
> -.direction_input() or .direction_output() operations, and occur after any
> -setup of an output GPIO's value. This allows a glitch-free migration from a
> -pin's special function to GPIO. This is sometimes required when using a GPIO
> -to implement a workaround on signals typically driven by a non-GPIO HW block.
> -
> -Some platforms allow some or all GPIO signals to be routed to different pins.
> -Similarly, other aspects of the GPIO or pin may need to be configured, such as
> -pullup/pulldown. Platform software should arrange that any such details are
> -configured prior to gpio_request() being called for those GPIOs, e.g. using
> -the pinctrl subsystem's mapping table, so that GPIO users need not be aware
> -of these details.
> -
> -Also note that it's your responsibility to have stopped using a GPIO
> -before you free it.
> -
> -Considering in most cases GPIOs are actually configured right after they
> -are claimed, three additional calls are defined::
> -
> -	/* request a single GPIO, with initial configuration specified by
> -	 * 'flags', identical to gpio_request() wrt other arguments and
> -	 * return value
> -	 */
> -	int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
> -
> -where 'flags' is currently defined to specify the following properties:
> -
> -	* GPIOF_DIR_IN		- to configure direction as input
> -	* GPIOF_DIR_OUT		- to configure direction as output
> -
> -	* GPIOF_INIT_LOW	- as output, set initial level to LOW
> -	* GPIOF_INIT_HIGH	- as output, set initial level to HIGH
> -
> -since GPIOF_INIT_* are only valid when configured as output, so group valid
> -combinations as:
> -
> -	* GPIOF_IN		- configure as input
> -	* GPIOF_OUT_INIT_LOW	- configured as output, initial level LOW
> -	* GPIOF_OUT_INIT_HIGH	- configured as output, initial level HIGH
> -
> -Further more, to ease the claim/release of multiple GPIOs, 'struct gpio' is
> -introduced to encapsulate all three fields as::
> -
> -	struct gpio {
> -		unsigned	gpio;
> -		unsigned long	flags;
> -		const char	*label;
> -	};
> -
> -A typical example of usage::
> -
> -	static struct gpio leds_gpios[] = {
> -		{ 32, GPIOF_OUT_INIT_HIGH, "Power LED" }, /* default to ON */
> -		{ 33, GPIOF_OUT_INIT_LOW,  "Green LED" }, /* default to OFF */
> -		{ 34, GPIOF_OUT_INIT_LOW,  "Red LED"   }, /* default to OFF */
> -		{ 35, GPIOF_OUT_INIT_LOW,  "Blue LED"  }, /* default to OFF */
> -		{ ... },
> -	};
> -
> -	err = gpio_request_one(31, GPIOF_IN, "Reset Button");
> -	if (err)
> -		...
> -
> -
> -GPIOs mapped to IRQs
> ---------------------
> -GPIO numbers are unsigned integers; so are IRQ numbers.  These make up
> -two logically distinct namespaces (GPIO 0 need not use IRQ 0).  You can
> -map between them using calls like::
> -
> -	/* map GPIO numbers to IRQ numbers */
> -	int gpio_to_irq(unsigned gpio);
> -
> -Those return either the corresponding number in the other namespace, or
> -else a negative errno code if the mapping can't be done.  (For example,
> -some GPIOs can't be used as IRQs.)  It is an unchecked error to use a GPIO
> -number that wasn't set up as an input using gpio_direction_input(), or
> -to use an IRQ number that didn't originally come from gpio_to_irq().
> -
> -These two mapping calls are expected to cost on the order of a single
> -addition or subtraction.  They're not allowed to sleep.
> -
> -Non-error values returned from gpio_to_irq() can be passed to request_irq()
> -or free_irq().  They will often be stored into IRQ resources for platform
> -devices, by the board-specific initialization code.  Note that IRQ trigger
> -options are part of the IRQ interface, e.g. IRQF_TRIGGER_FALLING, as are
> -system wakeup capabilities.
> -
> -
> -Emulating Open Drain Signals
> -----------------------------
> -Sometimes shared signals need to use "open drain" signaling, where only the
> -low signal level is actually driven.  (That term applies to CMOS transistors;
> -"open collector" is used for TTL.)  A pullup resistor causes the high signal
> -level.  This is sometimes called a "wire-AND"; or more practically, from the
> -negative logic (low=true) perspective this is a "wire-OR".
> -
> -One common example of an open drain signal is a shared active-low IRQ line.
> -Also, bidirectional data bus signals sometimes use open drain signals.
> -
> -Some GPIO controllers directly support open drain outputs; many don't.  When
> -you need open drain signaling but your hardware doesn't directly support it,
> -there's a common idiom you can use to emulate it with any GPIO pin that can
> -be used as either an input or an output:
> -
> - LOW:	gpio_direction_output(gpio, 0) ... this drives the signal
> -	and overrides the pullup.
> -
> - HIGH:	gpio_direction_input(gpio) ... this turns off the output,
> -	so the pullup (or some other device) controls the signal.
> -
> -If you are "driving" the signal high but gpio_get_value(gpio) reports a low
> -value (after the appropriate rise time passes), you know some other component
> -is driving the shared signal low.  That's not necessarily an error.  As one
> -common example, that's how I2C clocks are stretched:  a slave that needs a
> -slower clock delays the rising edge of SCK, and the I2C master adjusts its
> -signaling rate accordingly.
> -
> -
> -GPIO controllers and the pinctrl subsystem
> -------------------------------------------
> -
> -A GPIO controller on a SOC might be tightly coupled with the pinctrl
> -subsystem, in the sense that the pins can be used by other functions
> -together with an optional gpio feature. We have already covered the
> -case where e.g. a GPIO controller need to reserve a pin or set the
> -direction of a pin by calling any of::
> -
> -  pinctrl_gpio_request()
> -  pinctrl_gpio_free()
> -  pinctrl_gpio_direction_input()
> -  pinctrl_gpio_direction_output()
> -
> -But how does the pin control subsystem cross-correlate the GPIO
> -numbers (which are a global business) to a certain pin on a certain
> -pin controller?
> -
> -This is done by registering "ranges" of pins, which are essentially
> -cross-reference tables. These are described in
> -Documentation/driver-api/pin-control.rst
> -
> -While the pin allocation is totally managed by the pinctrl subsystem,
> -gpio (under gpiolib) is still maintained by gpio drivers. It may happen
> -that different pin ranges in a SoC is managed by different gpio drivers.
> -
> -This makes it logical to let gpio drivers announce their pin ranges to
> -the pin ctrl subsystem before it will call 'pinctrl_gpio_request' in order
> -to request the corresponding pin to be prepared by the pinctrl subsystem
> -before any gpio usage.
> -
> -For this, the gpio controller can register its pin range with pinctrl
> -subsystem. There are two ways of doing it currently: with or without DT.
> -
> -For with DT support refer to Documentation/devicetree/bindings/gpio/gpio.txt.
> -
> -For non-DT support, user can call gpiochip_add_pin_range() with appropriate
> -parameters to register a range of gpio pins with a pinctrl driver. For this
> -exact name string of pinctrl device has to be passed as one of the
> -argument to this routine.
> -
> -
> -What do these conventions omit?
> -===============================
> -One of the biggest things these conventions omit is pin multiplexing, since
> -this is highly chip-specific and nonportable.  One platform might not need
> -explicit multiplexing; another might have just two options for use of any
> -given pin; another might have eight options per pin; another might be able
> -to route a given GPIO to any one of several pins.  (Yes, those examples all
> -come from systems that run Linux today.)
> -
> -Related to multiplexing is configuration and enabling of the pullups or
> -pulldowns integrated on some platforms.  Not all platforms support them,
> -or support them in the same way; and any given board might use external
> -pullups (or pulldowns) so that the on-chip ones should not be used.
> -(When a circuit needs 5 kOhm, on-chip 100 kOhm resistors won't do.)
> -Likewise drive strength (2 mA vs 20 mA) and voltage (1.8V vs 3.3V) is a
> -platform-specific issue, as are models like (not) having a one-to-one
> -correspondence between configurable pins and GPIOs.
> -
> -There are other system-specific mechanisms that are not specified here,
> -like the aforementioned options for input de-glitching and wire-OR output.
> -Hardware may support reading or writing GPIOs in gangs, but that's usually
> -configuration dependent:  for GPIOs sharing the same bank.  (GPIOs are
> -commonly grouped in banks of 16 or 32, with a given SOC having several such
> -banks.)  Some systems can trigger IRQs from output GPIOs, or read values
> -from pins not managed as GPIOs.  Code relying on such mechanisms will
> -necessarily be nonportable.
> -
> -Dynamic definition of GPIOs is not currently standard; for example, as
> -a side effect of configuring an add-on board with some GPIO expanders.
> -
> -
> -GPIO implementor's framework (OPTIONAL)
> -=======================================
> -As noted earlier, there is an optional implementation framework making it
> -easier for platforms to support different kinds of GPIO controller using
> -the same programming interface.  This framework is called "gpiolib".
> -
> -As a debugging aid, if debugfs is available a /sys/kernel/debug/gpio file
> -will be found there.  That will list all the controllers registered through
> -this framework, and the state of the GPIOs currently in use.
> -
> -
> -Controller Drivers: gpio_chip
> ------------------------------
> -In this framework each GPIO controller is packaged as a "struct gpio_chip"
> -with information common to each controller of that type:
> -
> - - methods to establish GPIO direction
> - - methods used to access GPIO values
> - - flag saying whether calls to its methods may sleep
> - - optional debugfs dump method (showing extra state like pullup config)
> - - label for diagnostics
> -
> -There is also per-instance data, which may come from device.platform_data:
> -the number of its first GPIO, and how many GPIOs it exposes.
> -
> -The code implementing a gpio_chip should support multiple instances of the
> -controller, possibly using the driver model.  That code will configure each
> -gpio_chip and issue gpiochip_add().  Removing a GPIO controller should be
> -rare; use gpiochip_remove() when it is unavoidable.
> -
> -Most often a gpio_chip is part of an instance-specific structure with state
> -not exposed by the GPIO interfaces, such as addressing, power management,
> -and more.  Chips such as codecs will have complex non-GPIO state.
> -
> -Any debugfs dump method should normally ignore signals which haven't been
> -requested as GPIOs.  They can use gpiochip_is_requested(), which returns
> -either NULL or the label associated with that GPIO when it was requested.
> -
> -
> -Platform Support
> -----------------
> -To force-enable this framework, a platform's Kconfig will "select" GPIOLIB,
> -else it is up to the user to configure support for GPIO.
> -
> -If neither of these options are selected, the platform does not support
> -GPIOs through GPIO-lib and the code cannot be enabled by the user.
> -
> -Trivial implementations of those functions can directly use framework
> -code, which always dispatches through the gpio_chip::
> -
> -  #define gpio_get_value	__gpio_get_value
> -  #define gpio_set_value	__gpio_set_value
> -
> -Fancier implementations could instead define those as inline functions with
> -logic optimizing access to specific SOC-based GPIOs.  For example, if the
> -referenced GPIO is the constant "12", getting or setting its value could
> -cost as little as two or three instructions, never sleeping.  When such an
> -optimization is not possible those calls must delegate to the framework
> -code, costing at least a few dozen instructions.  For bitbanged I/O, such
> -instruction savings can be significant.
> -
> -For SOCs, platform-specific code defines and registers gpio_chip instances
> -for each bank of on-chip GPIOs.  Those GPIOs should be numbered/labeled to
> -match chip vendor documentation, and directly match board schematics.  They
> -may well start at zero and go up to a platform-specific limit.  Such GPIOs
> -are normally integrated into platform initialization to make them always be
> -available, from arch_initcall() or earlier; they can often serve as IRQs.
> -
> -
> -Board Support
> --------------
> -For external GPIO controllers -- such as I2C or SPI expanders, ASICs, multi
> -function devices, FPGAs or CPLDs -- most often board-specific code handles
> -registering controller devices and ensures that their drivers know what GPIO
> -numbers to use with gpiochip_add().  Their numbers often start right after
> -platform-specific GPIOs.
> -
> -For example, board setup code could create structures identifying the range
> -of GPIOs that chip will expose, and passes them to each GPIO expander chip
> -using platform_data.  Then the chip driver's probe() routine could pass that
> -data to gpiochip_add().
> -
> -Initialization order can be important.  For example, when a device relies on
> -an I2C-based GPIO, its probe() routine should only be called after that GPIO
> -becomes available.  That may mean the device should not be registered until
> -calls for that GPIO can work.  One way to address such dependencies is for
> -such gpio_chip controllers to provide setup() and teardown() callbacks to
> -board specific code; those board specific callbacks would register devices
> -once all the necessary resources are available, and remove them later when
> -the GPIO controller device becomes unavailable.
> -
> -
> -Sysfs Interface for Userspace (OPTIONAL)
> -========================================
> -Platforms which use the "gpiolib" implementors framework may choose to
> -configure a sysfs user interface to GPIOs.  This is different from the
> -debugfs interface, since it provides control over GPIO direction and
> -value instead of just showing a gpio state summary.  Plus, it could be
> -present on production systems without debugging support.
> -
> -Given appropriate hardware documentation for the system, userspace could
> -know for example that GPIO #23 controls the write protect line used to
> -protect boot loader segments in flash memory.  System upgrade procedures
> -may need to temporarily remove that protection, first importing a GPIO,
> -then changing its output state, then updating the code before re-enabling
> -the write protection.  In normal use, GPIO #23 would never be touched,
> -and the kernel would have no need to know about it.
> -
> -Again depending on appropriate hardware documentation, on some systems
> -userspace GPIO can be used to determine system configuration data that
> -standard kernels won't know about.  And for some tasks, simple userspace
> -GPIO drivers could be all that the system really needs.
> -
> -Note that standard kernel drivers exist for common "LEDs and Buttons"
> -GPIO tasks:  "leds-gpio" and "gpio_keys", respectively.  Use those
> -instead of talking directly to the GPIOs; they integrate with kernel
> -frameworks better than your userspace code could.
> -
> -
> -Paths in Sysfs
> ---------------
> -There are three kinds of entry in /sys/class/gpio:
> -
> -   -	Control interfaces used to get userspace control over GPIOs;
> -
> -   -	GPIOs themselves; and
> -
> -   -	GPIO controllers ("gpio_chip" instances).
> -
> -That's in addition to standard files including the "device" symlink.
> -
> -The control interfaces are write-only:
> -
> -    /sys/class/gpio/
> -
> -    	"export" ... Userspace may ask the kernel to export control of
> -		a GPIO to userspace by writing its number to this file.
> -
> -		Example:  "echo 19 > export" will create a "gpio19" node
> -		for GPIO #19, if that's not requested by kernel code.
> -
> -    	"unexport" ... Reverses the effect of exporting to userspace.
> -
> -		Example:  "echo 19 > unexport" will remove a "gpio19"
> -		node exported using the "export" file.
> -
> -GPIO signals have paths like /sys/class/gpio/gpio42/ (for GPIO #42)
> -and have the following read/write attributes:
> -
> -    /sys/class/gpio/gpioN/
> -
> -	"direction" ... reads as either "in" or "out".  This value may
> -		normally be written.  Writing as "out" defaults to
> -		initializing the value as low.  To ensure glitch free
> -		operation, values "low" and "high" may be written to
> -		configure the GPIO as an output with that initial value.
> -
> -		Note that this attribute *will not exist* if the kernel
> -		doesn't support changing the direction of a GPIO, or
> -		it was exported by kernel code that didn't explicitly
> -		allow userspace to reconfigure this GPIO's direction.
> -
> -	"value" ... reads as either 0 (low) or 1 (high).  If the GPIO
> -		is configured as an output, this value may be written;
> -		any nonzero value is treated as high.
> -
> -		If the pin can be configured as interrupt-generating interrupt
> -		and if it has been configured to generate interrupts (see the
> -		description of "edge"), you can poll(2) on that file and
> -		poll(2) will return whenever the interrupt was triggered. If
> -		you use poll(2), set the events POLLPRI. If you use select(2),
> -		set the file descriptor in exceptfds. After poll(2) returns,
> -		either lseek(2) to the beginning of the sysfs file and read the
> -		new value or close the file and re-open it to read the value.
> -
> -	"edge" ... reads as either "none", "rising", "falling", or
> -		"both". Write these strings to select the signal edge(s)
> -		that will make poll(2) on the "value" file return.
> -
> -		This file exists only if the pin can be configured as an
> -		interrupt generating input pin.
> -
> -	"active_low" ... reads as either 0 (false) or 1 (true).  Write
> -		any nonzero value to invert the value attribute both
> -		for reading and writing.  Existing and subsequent
> -		poll(2) support configuration via the edge attribute
> -		for "rising" and "falling" edges will follow this
> -		setting.
> -
> -GPIO controllers have paths like /sys/class/gpio/gpiochip42/ (for the
> -controller implementing GPIOs starting at #42) and have the following
> -read-only attributes:
> -
> -    /sys/class/gpio/gpiochipN/
> -
> -    	"base" ... same as N, the first GPIO managed by this chip
> -
> -    	"label" ... provided for diagnostics (not always unique)
> -
> -    	"ngpio" ... how many GPIOs this manges (N to N + ngpio - 1)
> -
> -Board documentation should in most cases cover what GPIOs are used for
> -what purposes.  However, those numbers are not always stable; GPIOs on
> -a daughtercard might be different depending on the base board being used,
> -or other cards in the stack.  In such cases, you may need to use the
> -gpiochip nodes (possibly in conjunction with schematics) to determine
> -the correct GPIO number to use for a given signal.
> -
> -
> -API Reference
> -=============
> -
> -The functions listed in this section are deprecated. The GPIO descriptor based
> -API should be used in new code.
> -
> -.. kernel-doc:: drivers/gpio/gpiolib-legacy.c
> -   :export:
> diff --git a/Documentation/translations/zh_CN/driver-api/gpio/index.rst b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> index 9a6a14162a6c..e4d54724a1b5 100644
> --- a/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> +++ b/Documentation/translations/zh_CN/driver-api/gpio/index.rst
> @@ -18,8 +18,6 @@
>      :caption: 目录
>      :maxdepth: 2
>   
> -   legacy
> -
>   Todolist:
>   
>   *   intro
> diff --git a/Documentation/translations/zh_CN/driver-api/gpio/legacy.rst b/Documentation/translations/zh_CN/driver-api/gpio/legacy.rst
> deleted file mode 100644
> index 0faf042001d2..000000000000
> --- a/Documentation/translations/zh_CN/driver-api/gpio/legacy.rst
> +++ /dev/null
> @@ -1,618 +0,0 @@
> -.. SPDX-License-Identifier: GPL-2.0
> -
> -.. include:: ../../disclaimer-zh_CN.rst
> -
> -:Original: Documentation/driver-api/gpio/legacy.rst
> -
> -:翻译:
> -
> - 傅炜 Fu Wei <tekkamanninja@gmail.com>
> - 司延腾 Yanteng Si <siyanteng@loongson.cn>
> -
> -:校译:
> -
> -
> -传统GPIO接口
> -============
> -
> -本文档概述了Linux下的GPIO访问公约。
> -
> -这些函数以 gpio_* 作为前缀。其他的函数不允许使用这样的前缀或相关的
> -__gpio_* 前缀。
> -
> -
> -什么是GPIO？
> -============
> -"通用输入/输出口"(GPIO)是一个灵活的由软件控制的数字信号。他们可
> -由多种芯片提供,且对于从事嵌入式和定制硬件的 Linux 开发者来说是
> -比较熟悉。每个GPIO 都代表一个连接到特定引脚或球栅阵列(BGA)封装中
> -“球珠”的一个位。电路板原理图显示了 GPIO 与外部硬件的连接关系。
> -驱动可以编写成通用代码，以使板级启动代码可传递引脚配置数据给驱动。
> -
> -片上系统 (SOC) 处理器对 GPIO 有很大的依赖。在某些情况下,每个
> -非专用引脚都可配置为 GPIO,且大多数芯片都最少有一些 GPIO。
> -可编程逻辑器件(类似 FPGA) 可以方便地提供 GPIO。像电源管理和
> -音频编解码器这样的多功能芯片经常留有一些这样的引脚来帮助那些引脚
> -匮乏的 SOC。同时还有通过 I2C 或 SPI 串行总线连接的“GPIO扩展器”
> -芯片。大多数 PC 的南桥有一些拥有 GPIO 能力的引脚 (只有BIOS
> -固件才知道如何使用他们)。
> -
> -GPIO 的实际功能因系统而异。通常用法有:
> -
> -  - 输出值可写 (高电平=1，低电平=0)。一些芯片也有如何驱动这些值的选项,
> -    例如只允许输出一个值、支持“线与”及其他取值类似的模式(值得注意的是
> -    “开漏”信号)
> -
> -  - 输入值可读(1、0)。一些芯片支持引脚在配置为“输出”时回读，这对于类似
> -    “线与”的情况(以支持双向信号)是非常有用的。GPIO 控制器可能有输入
> -    去毛刺/消抖逻辑,这有时需要软件控制。
> -
> -  - 输入通常可作为 IRQ 信号,一般是沿触发,但有时是电平触发。这样的 IRQ
> -    可能配置为系统唤醒事件,以将系统从低功耗状态下唤醒。
> -
> -  - 通常一个 GPIO 根据不同产品电路板的需求,可以配置为输入或输出,也有仅
> -    支持单向的。
> -
> -  - 大部分 GPIO 可以在持有自旋锁时访问,但是通常由串行总线扩展的 GPIO
> -    不允许持有自旋锁。但某些系统也支持这种类型。
> -
> -对于给定的电路板,每个 GPIO 都用于某个特定的目的,如监控 MMC/SD 卡的
> -插入/移除、检测卡的写保护状态、驱动 LED、配置收发器、模拟串行总线、
> -复位硬件看门狗、感知开关状态等等。
> -
> -
> -GPIO 公约
> -=========
> -注意,这个叫做“公约”，因为这不是强制性的，不遵循这个公约是无伤大雅的，
> -因为此时可移植性并不重要。GPIO 常用于板级特定的电路逻辑,甚至可能
> -随着电路板的版本而改变，且不可能在不同走线的电路板上使用。仅有在少数
> -功能上才具有可移植性，其他功能是平台特定。这也是由于“胶合”的逻辑造成的。
> -
> -此外，这不需要任何的执行框架，只是一个接口。某个平台可能通过一个简单地
> -访问芯片寄存器的内联函数来实现它，其他平台可能通过委托一系列不同的GPIO
> -控制器的抽象函数来实现它。(有一些可选的代码能支持这种策略的实现,本文档
> -后面会介绍，但作为 GPIO 接口的客户端驱动程序必须与它的实现无关。)
> -
> -也就是说,如果在他们的平台上支持这个公约，驱动应尽可能的使用它。同时，平台
> -必须在 Kconfig 中选择 ARCH_REQUIRE_GPIOLIB 或者 ARCH_WANT_OPTIONAL_GPIOLIB
> -选项。那些调用标准 GPIO 函数的驱动应该在 Kconfig 入口中声明依赖GENERIC_GPIO。
> -当驱动包含文件:
> -
> -	#include <linux/gpio.h>
> -
> -则 GPIO 函数是可用,无论是“真实代码”还是经优化过的语句。如果你遵守
> -这个公约，当你的代码完成后，对其他的开发者来说会更容易看懂和维护。
> -
> -注意，这些操作包含所用平台的 I/O 屏障代码，驱动无须显式地调用他们。
> -
> -
> -标识 GPIO
> ----------
> -
> -GPIO 是通过无符号整型来标识的,范围是 0 到 MAX_INT。保留“负”数
> -用于其他目的,例如标识信号“在这个板子上不可用”或指示错误。未接触底层
> -硬件的代码会忽略这些整数。
> -
> -平台会定义这些整数的用法,且通常使用 #define 来定义 GPIO，这样
> -板级特定的启动代码可以直接关联相应的原理图。相对来说，驱动应该仅使用
> -启动代码传递过来的 GPIO 编号，使用 platform_data 保存板级特定
> -引脚配置数据 (同时还有其他须要的板级特定数据)，避免可能出现的问题。
> -
> -例如一个平台使用编号 32-159 来标识 GPIO,而在另一个平台使用编号0-63
> -标识一组 GPIO 控制器,64-79标识另一类 GPIO 控制器,且在一个含有
> -FPGA 的特定板子上使用 80-95。编号不一定要连续,那些平台中，也可以
> -使用编号2000-2063来标识一个 I2C 接口的 GPIO 扩展器中的 GPIO。
> -
> -如果你要初始化一个带有无效 GPIO 编号的结构体,可以使用一些负编码
> -(如"-EINVAL")，那将使其永远不会是有效。来测试这样一个结构体中的编号
> -是否关联一个 GPIO，你可使用以下断言::
> -
> -	int gpio_is_valid(int number);
> -
> -如果编号不存在，则请求和释放 GPIO 的函数将拒绝执行相关操作(见下文)。
> -其他编号也可能被拒绝,比如一个编号可能存在，但暂时在给定的电路上不可用。
> -
> -一个平台是否支持多个 GPIO 控制器为平台特定的实现问题，就像是否可以
> -在 GPIO 编号空间中有“空洞”和是否可以在运行时添加新的控制器一样。
> -这些问题会影响其他事情，包括相邻的 GPIO 编号是否存在等。
> -
> -使用 GPIO
> ----------
> -
> -对于一个 GPIO，系统应该做的第一件事情就是通过 gpio_request()
> -函数分配它，见下文。
> -
> -接下来是设置I/O方向，这通常是在板级启动代码中为所使用的 GPIO 设置
> -platform_device 时完成::
> -
> -	/* 设置为输入或输出, 返回 0 或负的错误代码 */
> -	int gpio_direction_input(unsigned gpio);
> -	int gpio_direction_output(unsigned gpio, int value);
> -
> -返回值为零代表成功，否则返回一个负的错误代码。这个返回值需要检查，因为
> -get/set(获取/设置)函数调用没法返回错误,且有可能是配置错误。通常，
> -你应该在进程上下文中调用这些函数。然而,对于自旋锁安全的 GPIO，在板子
> -启动的早期、进程启动前使用他们也是可以的。
> -
> -对于作为输出的 GPIO，为其提供初始输出值，对于避免在系统启动期间出现
> -信号毛刺是很有帮助的。
> -
> -为了与传统的 GPIO 接口兼容, 在设置一个 GPIO 方向时，如果它还未被申请，
> -则隐含了申请那个 GPIO 的操作(见下文)。这种兼容性正在从可选的 gpiolib
> -框架中移除。
> -
> -如果这个 GPIO 编码不存在，或者特定的 GPIO 不能用于那种模式，则方向
> -设置可能失败。依赖启动固件来正确地设置方向通常是一个坏主意，因为它可能
> -除了启动Linux，并没有做更多的验证工作。(同理, 板子的启动代码可能需要
> -将这个复用的引脚设置为 GPIO，并正确地配置上拉/下拉电阻。)
> -
> -
> -访问自旋锁安全的 GPIO
> ----------------------
> -
> -大多数 GPIO 控制器可以通过内存读/写指令来访问。这些指令不会休眠,可以
> -安全地在硬(非线程)中断例程和类似的上下文中完成。
> -
> -对于那些 GPIO，使用以下的函数访问::
> -
> -	/* GPIO 输入:返回零或非零 */
> -	int gpio_get_value(unsigned gpio);
> -
> -	/* GPIO 输出 */
> -	void gpio_set_value(unsigned gpio, int value);
> -
> -GPIO值是布尔值，零表示低电平，非零表示高电平。当读取一个输出引脚的值时，
> -返回值应该是引脚上的值。这个值不总是和输出值相符，因为存在开漏输出信号和
> -输出延迟问题。
> -
> -以上的 get/set 函数无错误返回值，因为之前 gpio_direction_*()应已检查过
> -其是否为“无效GPIO”。此外，还需要注意的是并不是所有平台都可以从输出引脚
> -中读取数据，对于不能读取的引脚应总返回零。另外，对那些在原子上下文中无法
> -安全访问的 GPIO (译者注：因为访问可能导致休眠)使用这些函数是不合适的
> -(见下文)。
> -
> -在 GPIO 编号(还有输出、值)为常数的情况下,鼓励通过平台特定的实现来优化
> -这两个函数来访问 GPIO 值。这种情况(读写一个硬件寄存器)下只需要几条指令
> -是很正常的,且无须自旋锁。这种优化函数比起那些在子程序上花费许多指令的
> -函数可以使得模拟接口(译者注:例如 GPIO 模拟 I2C、1-wire 或 SPI)的
> -应用(在空间和时间上都)更具效率。
> -
> -
> -访问可能休眠的 GPIO
> --------------------
> -
> -某些 GPIO 控制器必须通过基于总线(如 I2C 或 SPI)的消息访问。读或写这些
> -GPIO 值的命令需要等待其信息排到队首才发送命令，再获得其反馈。期间需要
> -休眠，这不能在 IRQ 例程(中断上下文)中执行。
> -
> -为了访问这种 GPIO,内核定义了一套不同的函数::
> -
> -	/* GPIO 输入:返回零或非零 ,可能会休眠 */
> -	int gpio_get_value_cansleep(unsigned gpio);
> -
> -	/* GPIO 输出,可能会休眠 */
> -	void gpio_set_value_cansleep(unsigned gpio, int value);
> -
> -访问这样的 GPIO 需要一个允许休眠的上下文，例如线程 IRQ 处理例程，并用以上的
> -访问函数替换那些没有 cansleep()后缀的自旋锁安全访问函数。
> -
> -除了这些访问函数可能休眠，且它们操作的 GPIO 不能在硬件 IRQ 处理例程中访问的
> -事实，这些处理例程实际上和自旋锁安全的函数是一样的。
> -
> -** 除此之外 ** 调用设置和配置此类 GPIO 的函数也必须在允许休眠的上下文中，
> -因为它们可能也需要访问 GPIO 控制器芯片 (这些设置函数通常在板级启动代码或者
> -驱动探测/断开代码中，所以这是一个容易满足的约束条件。) ::
> -
> -                gpio_direction_input()
> -                gpio_direction_output()
> -                gpio_request()
> -
> -        ## 	gpio_request_one()
> -
> -                gpio_free()
> -
> -
> -
> -声明和释放 GPIO
> -----------------
> -
> -为了有助于捕获系统配置错误,定义了两个函数::
> -
> -	/* 申请 GPIO, 返回 0 或负的错误代码.
> -	 * 非空标签可能有助于诊断.
> -	 */
> -	int gpio_request(unsigned gpio, const char *label);
> -
> -	/* 释放之前声明的 GPIO */
> -	void gpio_free(unsigned gpio);
> -
> -将无效的 GPIO 编码传递给 gpio_request()会导致失败，申请一个已使用这个
> -函数声明过的 GPIO 也会失败。gpio_request()的返回值必须检查。你应该在
> -进程上下文中调用这些函数。然而,对于自旋锁安全的 GPIO,在板子启动的早期、
> -进入进程之前是可以申请的。
> -
> -这个函数完成两个基本的目标。一是标识那些实际上已作为 GPIO 使用的信号线，
> -这样便于更好地诊断;系统可能需要服务几百个可用的 GPIO，但是对于任何一个
> -给定的电路板通常只有一些被使用。另一个目的是捕获冲突，查明错误:如两个或
> -更多驱动错误地认为他们已经独占了某个信号线,或是错误地认为移除一个管理着
> -某个已激活信号的驱动是安全的。也就是说，申请 GPIO 的作用类似一种锁机制。
> -
> -某些平台可能也使用 GPIO 作为电源管理激活信号(例如通过关闭未使用芯片区和
> -简单地关闭未使用时钟)。
> -
> -对于 GPIO 使用引脚控制子系统已知的引脚，子系统应该被告知其使用情况；
> -一个 gpiolib 驱动的 .request()操作应调用 pinctrl_gpio_request()，
> -而 gpiolib 驱动的 .free()操作应调用 pinctrl_gpio_free()。引脚控制
> -子系统允许 pinctrl_gpio_request()在某个引脚或引脚组以复用形式“属于”
> -一个设备时都成功返回。
> -
> -任何须将 GPIO 信号导向适当引脚的引脚复用硬件的编程应该发生在 GPIO
> -驱动的 .direction_input()或 .direction_output()函数中，以及
> -任何输出 GPIO 值的设置之后。这样可使从引脚特殊功能到 GPIO 的转换
> -不会在引脚产生毛刺波形。有时当用一个 GPIO 实现其信号驱动一个非 GPIO
> -硬件模块的解决方案时，就需要这种机制。
> -
> -某些平台允许部分或所有 GPIO 信号使用不同的引脚。类似的，GPIO 或引脚的
> -其他方面也需要配置，如上拉/下拉。平台软件应该在对这些 GPIO 调用
> -gpio_request()前将这类细节配置好，例如使用引脚控制子系统的映射表，
> -使得 GPIO 的用户无须关注这些细节。
> -
> -还有一个值得注意的是在释放 GPIO 前，你必须停止使用它。
> -
> -
> -注意:申请一个 GPIO 并没有以任何方式配置它，只不过标识那个 GPIO 处于使用
> -状态。必须有另外的代码来处理引脚配置(如控制 GPIO 使用的引脚、上拉/下拉)。
> -考虑到大多数情况下声明 GPIO 之后就会立即配置它们,所以定义了以下三个辅助函数::
> -
> -	/* 申请一个 GPIO 信号, 同时通过特定的'flags'初始化配置,
> -	 * 其他和 gpio_request()的参数和返回值相同
> -	 *
> -	 */
> -	int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
> -
> -这里 'flags' 当前定义可指定以下属性:
> -
> -	* GPIOF_DIR_IN		- 配置方向为输入
> -	* GPIOF_DIR_OUT		- 配置方向为输出
> -
> -	* GPIOF_INIT_LOW	- 在作为输出时,初始值为低电平
> -	* GPIOF_INIT_HIGH	- 在作为输出时,初始值为高电平
> -
> -因为 GPIOF_INIT_* 仅有在配置为输出的时候才存在,所以有效的组合为:
> -
> -	* GPIOF_IN		- 配置为输入
> -	* GPIOF_OUT_INIT_LOW	- 配置为输出,并初始化为低电平
> -	* GPIOF_OUT_INIT_HIGH	- 配置为输出,并初始化为高电平
> -
> -更进一步,为了更简单地声明/释放多个 GPIO,'struct gpio'被引进来封装所有
> -这三个领域::
> -
> -	struct gpio {
> -		unsigned	gpio;
> -		unsigned long	flags;
> -		const char	*label;
> -	};
> -
> -一个典型的用例::
> -
> -	static struct gpio leds_gpios[] = {
> -		{ 32, GPIOF_OUT_INIT_HIGH, "Power LED" }, /* 默认开启 */
> -		{ 33, GPIOF_OUT_INIT_LOW,  "Green LED" }, /* 默认关闭 */
> -		{ 34, GPIOF_OUT_INIT_LOW,  "Red LED"   }, /* 默认关闭 */
> -		{ 35, GPIOF_OUT_INIT_LOW,  "Blue LED"  }, /* 默认关闭 */
> -		{ ... },
> -	};
> -
> -	err = gpio_request_one(31, GPIOF_IN, "Reset Button");
> -	if (err)
> -		...
> -
> -
> -GPIO 映射到 IRQ
> -----------------
> -
> -GPIO 编号是无符号整数;IRQ 编号也是。这些构成了两个逻辑上不同的命名空间
> -(GPIO 0 不一定使用 IRQ 0)。你可以通过以下函数在它们之间实现映射::
> -
> -	/* 映射 GPIO 编号到 IRQ 编号 */
> -	int gpio_to_irq(unsigned gpio);
> -
> -它们的返回值为对应命名空间的相关编号，或是负的错误代码(如果无法映射)。
> -(例如,某些 GPIO 无法做为 IRQ 使用。)以下的编号错误是未经检测的:使用一个
> -未通过 gpio_direction_input()配置为输入的 GPIO 编号，或者使用一个
> -并非来源于gpio_to_irq()的 IRQ 编号。
> -
> -这两个映射函数可能会在信号编号的加减计算过程上花些时间。它们不可休眠。
> -
> -gpio_to_irq()返回的非错误值可以传递给 request_irq()或者 free_irq()。
> -它们通常通过板级特定的初始化代码存放到平台设备的 IRQ 资源中。注意:IRQ
> -触发选项是 IRQ 接口的一部分，如 IRQF_TRIGGER_FALLING，系统唤醒能力
> -也是如此。
> -
> -
> -模拟开漏信号
> -------------
> -
> -有时在只有低电平信号作为实际驱动结果(译者注:多个输出连接于一点，逻辑电平
> -结果为所有输出的逻辑与)的时候,共享的信号线需要使用“开漏”信号。(该术语
> -适用于 CMOS 管；而 TTL 用“集电极开路”。)一个上拉电阻使信号为高电平。这
> -有时被称为“线与”。实际上，从负逻辑(低电平为真)的角度来看，这是一个“线或”。
> -
> -一个开漏信号的常见例子是共享的低电平使能 IRQ 信号线。此外,有时双向数据总线
> -信号也使用漏极开路信号。
> -
> -某些 GPIO 控制器直接支持开漏输出，还有许多不支持。当你需要开漏信号，但
> -硬件又不直接支持的时候，一个常用的方法是用任何即可作输入也可作输出的 GPIO
> -引脚来模拟:
> -
> - LOW:	gpio_direction_output(gpio, 0) ... 这代码驱动信号并覆盖
> -	上拉配置。
> -
> - HIGH:	gpio_direction_input(gpio) ... 这代码关闭输出,所以上拉电阻
> -	(或其他的一些器件)控制了信号。
> -
> -如果你将信号线“驱动”为高电平，但是 gpio_get_value(gpio)报告了一个
> -低电平(在适当的上升时间后)，你就可以知道是其他的一些组件将共享信号线拉低了。
> -这不一定是错误的。一个常见的例子就是 I2C 时钟的延长：一个需要较慢时钟的
> -从设备延迟 SCK 的上升沿，而 I2C 主设备相应地调整其信号传输速率。
> -
> -GPIO控制器和引脚控制子系统
> ---------------------------
> -
> -SOC上的GPIO控制器可能与引脚控制子系统紧密结合，即引脚可以与可选的gpio功
> -能一起被其他功能使用。我们已经涵盖了这样的情况，例如一个GPIO控制器需要保
> -留一个引脚或通过调用以下任何一个引脚来设置其方向::
> -
> -  pinctrl_gpio_request()
> -  pinctrl_gpio_free()
> -  pinctrl_gpio_direction_input()
> -  pinctrl_gpio_direction_output()
> -
> -但是，引脚控制子系统是如何将GPIO号码（这是一个全局事项）与某个引脚控制器
> -上的某个引脚交叉关联的？
> -
> -这是通过注册引脚的“范围”来实现的，这基本上是交叉参考表。这些描述是在
> -Documentation/driver-api/pin-control.rst
> -
> -虽然引脚分配完全由引脚控制子系统管理，但gpio（在gpiolib下）仍由gpio驱动
> -维护。可能发生的情况是，SoC中的不同引脚范围由不同的gpio驱动器管理。
> -
> -这使得在调用 "pinctrl_gpio_request" 之前，让gpio驱动向pin ctrl子系
> -统宣布它们的引脚范围是合理的，以便在使用任何gpio之前要求引脚控制子系统准
> -备相应的引脚。
> -
> -为此，gpio控制器可以用引脚控制子系统注册其引脚范围。目前有两种方法：有或
> -无DT。
> -
> -关于对DT的支持，请参考 Documentation/devicetree/bindings/gpio/gpio.txt.
> -
> -对于非DT支持，用户可以用适当的参数调用gpiochip_add_pin_range()，将一
> -系列的gpio引脚注册到引脚控制驱动上。为此，必须将引脚控制设备的名称字符串
> -作为参数之一传给这个程序。
> -
> -
> -这些公约忽略了什么？
> -====================
> -
> -这些公约忽略的最大一件事就是引脚复用，因为这属于高度芯片特定的属性且
> -没有可移植性。某个平台可能不需要明确的复用信息；有的对于任意给定的引脚
> -可能只有两个功能选项；有的可能每个引脚有八个功能选项；有的可能可以将
> -几个引脚中的任何一个作为给定的 GPIO。(是的，这些例子都来自于当前运行
> -Linux 的系统。)
> -
> -在某些系统中,与引脚复用相关的是配置和使能集成的上、下拉模式。并不是所有
> -平台都支持这种模式,或者不会以相同的方式来支持这种模式；且任何给定的电路板
> -可能使用外置的上拉(或下拉)电阻,这时芯片上的就不应该使用。(当一个电路需要
> -5kOhm 的拉动电阻,芯片上的 100 kOhm 电阻就不能做到。)同样的，驱动能力
> -(2 mA vs 20 mA)和电压(1.8V vs 3.3V)是平台特定问题,就像模型一样在
> -可配置引脚和 GPIO 之间(没)有一一对应的关系。
> -
> -还有其他一些系统特定的机制没有在这里指出，例如上述的输入去毛刺和线与输出
> -选项。硬件可能支持批量读或写 GPIO，但是那一般是配置相关的：对于处于同一
> -块区(bank)的GPIO。(GPIO 通常以 16 或 32 个组成一个区块，一个给定的
> -片上系统一般有几个这样的区块。)某些系统可以通过输出 GPIO 触发 IRQ，
> -或者从并非以 GPIO 管理的引脚取值。这些机制的相关代码没有必要具有可移植性。
> -
> -当前，动态定义 GPIO 并不是标准的，例如作为配置一个带有某些 GPIO 扩展器的
> -附加电路板的副作用。
> -
> -GPIO 实现者的框架（可选）
> -=========================
> -
> -前面提到了，有一个可选的实现框架，让平台使用相同的编程接口，更加简单地支持
> -不同种类的 GPIO 控制器。这个框架称为"gpiolib"。
> -
> -作为一个辅助调试功能，如果 debugfs 可用，就会有一个 /sys/kernel/debug/gpio
> -文件。通过这个框架，它可以列出所有注册的控制器,以及当前正在使用中的 GPIO
> -的状态。
> -
> -
> -控制器驱动: gpio_chip
> ----------------------
> -
> -在框架中每个 GPIO 控制器都包装为一个 "struct gpio_chip"，他包含了
> -该类型的每个控制器的常用信息:
> -
> -	- 设置 GPIO 方向的方法
> -	- 用于访问 GPIO 值的方法
> -	- 告知调用其方法是否可能休眠的标志
> -	- 可选的 debugfs 信息导出方法 (显示类似上拉配置一样的额外状态)
> -	- 诊断标签
> -
> -也包含了来自 device.platform_data 的每个实例的数据：它第一个 GPIO 的
> -编号和它可用的 GPIO 的数量。
> -
> -实现 gpio_chip 的代码应支持多控制器实例，这可能使用驱动模型。那些代码要
> -配置每个 gpio_chip，并发起gpiochip_add()。卸载一个 GPIO 控制器很少见，
> -但在必要的时候可以使用 gpiochip_remove()。
> -
> -大部分 gpio_chip 是一个实例特定结构体的一部分，而并不将 GPIO 接口单独
> -暴露出来,比如编址、电源管理等。类似编解码器这样的芯片会有复杂的非 GPIO
> -状态。
> -
> -任何一个 debugfs 信息导出方法通常应该忽略还未申请作为 GPIO 的信号线。
> -他们可以使用 gpiochip_is_requested()测试，当这个 GPIO 已经申请过了
> -就返回相关的标签，否则返回 NULL。
> -
> -
> -平台支持
> ---------
> -
> -为了支持这个框架，一个平台的 Kconfig 文件将会 "select"(选择)
> -ARCH_REQUIRE_GPIOLIB 或 ARCH_WANT_OPTIONAL_GPIOLIB，并让它的
> -<asm/gpio.h> 包含 <asm-generic/gpio.h>，同时定义两个方法:
> -gpio_get_value()、gpio_set_value()。
> -
> -它也应提供一个 ARCH_NR_GPIOS 的定义值，这样可以更好地反映该平台 GPIO
> -的实际数量,节省静态表的空间。(这个定义值应该包含片上系统内建 GPIO 和
> -GPIO 扩展器中的数据。)
> -
> -ARCH_REQUIRE_GPIOLIB 意味着 gpiolib 核心在这个构架中将总是编译进内核。
> -
> -ARCH_WANT_OPTIONAL_GPIOLIB 意味着 gpiolib 核心默认关闭,且用户可以
> -使能它,并将其编译进内核(可选)。
> -
> -如果这些选项都没被选择,该平台就不通过 GPIO-lib 支持 GPIO,且代码不可以
> -被用户使能。
> -
> -以下这些方法的实现可以直接使用框架代码,并总是通过 gpio_chip 调度::
> -
> -  #define gpio_get_value	__gpio_get_value
> -  #define gpio_set_value	__gpio_set_value
> -
> -这些定义可以用更理想的实现方法替代，那就是使用经过逻辑优化的内联函数来访问
> -基于特定片上系统的 GPIO。例如,若引用的 GPIO (寄存器位偏移)是常量“12”，
> -读取或设置它可能只需少则两或三个指令，且不会休眠。当这样的优化无法实现时，
> -那些函数必须使用框架提供的代码，那就至少要几十条指令才可以实现。对于用 GPIO
> -模拟的 I/O 接口, 如此精简指令是很有意义的。
> -
> -对于片上系统，平台特定代码为片上 GPIO 每个区(bank)定义并注册 gpio_chip
> -实例。那些 GPIO 应该根据芯片厂商的文档进行编码/标签,并直接和电路板原理图
> -对应。他们应该开始于零并终止于平台特定的限制。这些 GPIO(代码)通常从
> -arch_initcall()或者更早的地方集成进平台初始化代码，使这些 GPIO 总是可用，
> -且他们通常可以作为 IRQ 使用。
> -
> -板级支持
> ---------
> -
> -对于外部 GPIO 控制器(例如 I2C 或 SPI 扩展器、专用芯片、多功能器件、FPGA
> -或 CPLD)，大多数常用板级特定代码都可以注册控制器设备，并保证他们的驱动知道
> -gpiochip_add()所使用的 GPIO 编号。他们的起始编号通常跟在平台特定的 GPIO
> -编号之后。
> -
> -例如板级启动代码应该创建结构体指明芯片公开的 GPIO 范围，并使用 platform_data
> -将其传递给每个 GPIO 扩展器芯片。然后芯片驱动中的 probe()例程可以将这个
> -数据传递给 gpiochip_add()。
> -
> -初始化顺序很重要。例如，如果一个设备依赖基于 I2C 的(扩展)GPIO，那么它的
> -probe()例程就应该在那个 GPIO 有效以后才可以被调用。这意味着设备应该在
> -GPIO 可以工作之后才可被注册。解决这类依赖的的一种方法是让这种 gpio_chip
> -控制器向板级特定代码提供 setup()和 teardown()回调函数。一旦所有必须的
> -资源可用之后，这些板级特定的回调函数将会注册设备，并可以在这些 GPIO 控制器
> -设备变成无效时移除它们。
> -
> -
> -用户空间的 Sysfs 接口（可选）
> -=============================
> -
> -使用“gpiolib”实现框架的平台可以选择配置一个 GPIO 的 sysfs 用户接口。
> -这不同于 debugfs 接口，因为它提供的是对 GPIO方向和值的控制，而不只显示
> -一个GPIO 的状态摘要。此外,它可以出现在没有调试支持的产品级系统中。
> -
> -例如，通过适当的系统硬件文档，用户空间可以知道 GIOP #23 控制 Flash
> -存储器的写保护(用于保护其中 Bootloader 分区)。产品的系统升级可能需要
> -临时解除这个保护：首先导入一个 GPIO，改变其输出状态，然后在重新使能写保护
> -前升级代码。通常情况下,GPIO #23 是不会被触及的，并且内核也不需要知道他。
> -
> -根据适当的硬件文档，某些系统的用户空间 GPIO 可以用于确定系统配置数据，
> -这些数据是标准内核不知道的。在某些任务中，简单的用户空间 GPIO 驱动可能是
> -系统真正需要的。
> -
> -注意：标准内核驱动中已经存在通用的“LED 和按键”GPIO 任务，分别是:
> -"leds-gpio" 和 "gpio_keys"。请使用这些来替代直接访问 GPIO，因为集成在
> -内核框架中的这类驱动比你在用户空间的代码更好。
> -
> -
> -Sysfs 中的路径
> ---------------
> -
> -在/sys/class/gpio 中有 3 类入口:
> -
> -   -	用于在用户空间控制 GPIO 的控制接口;
> -
> -   -	GPIOs 本身;以及
> -
> -   -	GPIO 控制器 ("gpio_chip" 实例)。
> -
> -除了这些标准的文件,还包含“device”符号链接。
> -
> -控制接口是只写的:
> -
> -    /sys/class/gpio/
> -
> -    	"export" ... 用户空间可以通过写其编号到这个文件，要求内核导出
> -		一个 GPIO 的控制到用户空间。
> -
> -		例如: 如果内核代码没有申请 GPIO #19,"echo 19 > export"
> -		将会为 GPIO #19 创建一个 "gpio19" 节点。
> -
> -    	"unexport" ... 导出到用户空间的逆操作。
> -
> -		例如: "echo 19 > unexport" 将会移除使用"export"文件导出的
> -		"gpio19" 节点。
> -
> -GPIO 信号的路径类似 /sys/class/gpio/gpio42/ (对于 GPIO #42 来说)，
> -并有如下的读/写属性:
> -
> -    /sys/class/gpio/gpioN/
> -
> -	"direction" ... 读取得到 "in" 或 "out"。这个值通常运行写入。
> -		写入"out" 时,其引脚的默认输出为低电平。为了确保无故障运行，
> -		"low" 或 "high" 的电平值应该写入 GPIO 的配置，作为初始输出值。
> -
> -		注意:如果内核不支持改变 GPIO 的方向，或者在导出时内核代码没有
> -		明确允许用户空间可以重新配置 GPIO 方向，那么这个属性将不存在。
> -
> -	"value" ... 读取得到 0 (低电平) 或 1 (高电平)。如果 GPIO 配置为
> -		输出,这个值允许写操作。任何非零值都以高电平看待。
> -
> -		如果引脚可以配置为中断信号，且如果已经配置了产生中断的模式
> -		（见"edge"的描述），你可以对这个文件使用轮询操作(poll(2))，
> -		且轮询操作会在任何中断触发时返回。如果你使用轮询操作(poll(2))，
> -		请在 events 中设置 POLLPRI 和 POLLERR。如果你使用轮询操作
> -		(select(2))，请在 exceptfds 设置你期望的文件描述符。在
> -		轮询操作(poll(2))返回之后，既可以通过 lseek(2)操作读取
> -		sysfs 文件的开始部分，也可以关闭这个文件并重新打开它来读取数据。
> -
> -	"edge" ... 读取得到“none”、“rising”、“falling”或者���both”。
> -		将这些字符串写入这个文件可以选择沿触发模式，会使得轮询操作
> -		(select(2))在"value"文件中返回。
> -
> -		这个文件仅有在这个引脚可以配置为可产生中断输入引脚时，才存在。
> -
> -	"active_low" ... 读取得到 0 (假) 或 1 (真)。写入任何非零值可以
> -		翻转这个属性的(读写)值。已存在或之后通过"edge"属性设置了"rising"
> -		和 "falling" 沿触发模式的轮询操作(poll(2))将会遵循这个设置。
> -
> -GPIO 控制器的路径类似 /sys/class/gpio/gpiochip42/ (对于从#42 GPIO
> -开始实现控制的控制器),并有着以下只读属性:
> -
> -    /sys/class/gpio/gpiochipN/
> -
> -    	"base" ... 与以上的 N 相同,代表此芯片管理的第一个 GPIO 的编号
> -
> -    	"label" ... 用于诊断 (并不总是只有唯一值)
> -
> -    	"ngpio" ... 此控制器所管理的 GPIO 数量(而 GPIO 编号从 N 到
> -    		N + ngpio - 1)
> -
> -大多数情况下,电路板的文档应当标明每个 GPIO 的使用目的。但是那些编号并不总是
> -固定的,例如在扩展卡上的 GPIO会根据所使用的主板或所在堆叠架构中其他的板子而
> -有所不同。在这种情况下,你可能需要使用 gpiochip 节点(尽可能地结合电路图)来
> -确定给定信号所用的 GPIO 编号。
> -
> -
> -API参考
> -=======
> -
> -本节中列出的函数已被废弃。在新的代码中应该使用基于GPIO描述符的API。
> diff --git a/Documentation/translations/zh_TW/gpio.txt b/Documentation/translations/zh_TW/gpio.txt
> deleted file mode 100644
> index 77d69d381316..000000000000
> --- a/Documentation/translations/zh_TW/gpio.txt
> +++ /dev/null
> @@ -1,574 +0,0 @@
> -Chinese translated version of Documentation/admin-guide/gpio
> -
> -If you have any comment or update to the content, please contact the
> -original document maintainer directly.  However, if you have a problem
> -communicating in English you can also ask the Chinese maintainer for
> -help.  Contact the Chinese maintainer if this translation is outdated
> -or if there is a problem with the translation.
> -
> -Maintainer: Grant Likely <grant.likely@secretlab.ca>
> -		Linus Walleij <linus.walleij@linaro.org>
> -Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
> ----------------------------------------------------------------------
> -Documentation/admin-guide/gpio 的繁體中文翻譯
> -
> -如果想評論或更新本文的內容，請直接聯繫原文檔的維護者。如果你使用英文
> -交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
> -者翻譯存在問題，請聯繫繁體中文版維護者。
> -
> -英文版維護者： Grant Likely <grant.likely@secretlab.ca>
> -		Linus Walleij <linus.walleij@linaro.org>
> -繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
> -繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
> -繁體中文版校譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
> -
> -以下爲正文
> ----------------------------------------------------------------------
> -GPIO 接口
> -
> -本文檔提供了一個在Linux下訪問GPIO的公約概述。
> -
> -這些函數以 gpio_* 作爲前綴。其他的函數不允許使用這樣的前綴或相關的
> -__gpio_* 前綴。
> -
> -
> -什麼是GPIO?
> -==========
> -"通用輸入/輸出口"(GPIO)是一個靈活的由軟體控制的數位訊號。他們可
> -由多種晶片提供,且對於從事嵌入式和定製硬體的 Linux 開發者來說是
> -比較熟悉。每個GPIO 都代表一個連接到特定引腳或球柵陣列(BGA)封裝中
> -「球珠」的一個位。電路板原理圖顯示了 GPIO 與外部硬體的連接關係。
> -驅動可以編寫成通用代碼，以使板級啓動代碼可傳遞引腳配置數據給驅動。
> -
> -片上系統 (SOC) 處理器對 GPIO 有很大的依賴。在某些情況下,每個
> -非專用引腳都可配置爲 GPIO,且大多數晶片都最少有一些 GPIO。
> -可編程邏輯器件(類似 FPGA) 可以方便地提供 GPIO。像電源管理和
> -音頻編解碼器這樣的多功能晶片經常留有一些這樣的引腳來幫助那些引腳
> -匱乏的 SOC。同時還有通過 I2C 或 SPI 串行總線連接的「GPIO擴展器」
> -晶片。大多數 PC 的南橋有一些擁有 GPIO 能力的引腳 (只有BIOS
> -固件才知道如何使用他們)。
> -
> -GPIO 的實際功能因系統而異。通常用法有:
> -
> -  - 輸出值可寫 (高電平=1，低電平=0)。一些晶片也有如何驅動這些值的選項,
> -    例如只允許輸出一個值、支持「線與」及其他取值類似的模式(值得注意的是
> -    「開漏」信號)
> -
> -  - 輸入值可讀(1、0)。一些晶片支持引腳在配置爲「輸出」時回讀，這對於類似
> -    「線與」的情況(以支持雙向信號)是非常有用的。GPIO 控制器可能有輸入
> -    去毛刺/消抖邏輯,這有時需要軟體控制。
> -
> -  - 輸入通常可作爲 IRQ 信號,一般是沿觸發,但有時是電平觸發。這樣的 IRQ
> -    可能配置爲系統喚醒事件,以將系統從低功耗狀態下喚醒。
> -
> -  - 通常一個 GPIO 根據不同產品電路板的需求,可以配置爲輸入或輸出,也有僅
> -    支持單向的。
> -
> -  - 大部分 GPIO 可以在持有自旋鎖時訪問,但是通常由串行總線擴展的 GPIO
> -    不允許持有自旋鎖。但某些系統也支持這種類型。
> -
> -對於給定的電路板,每個 GPIO 都用於某個特定的目的,如監控 MMC/SD 卡的
> -插入/移除、檢測卡的防寫狀態、驅動 LED、配置收發器、模擬串行總線、
> -復位硬體看門狗、感知開關狀態等等。
> -
> -
> -GPIO 公約
> -=========
> -注意,這個叫做「公約」，因爲這不是強制性的，不遵循這個公約是無傷大雅的，
> -因爲此時可移植性並不重要。GPIO 常用於板級特定的電路邏輯,甚至可能
> -隨著電路板的版本而改變，且不可能在不同走線的電路板上使用。僅有在少數
> -功能上才具有可移植性，其他功能是平台特定。這也是由於「膠合」的邏輯造成的。
> -
> -此外，這不需要任何的執行框架，只是一個接口。某個平台可能通過一個簡單地
> -訪問晶片寄存器的內聯函數來實現它，其他平台可能通過委託一系列不同的GPIO
> -控制器的抽象函數來實現它。(有一些可選的代碼能支持這種策略的實現,本文檔
> -後面會介紹，但作爲 GPIO 接口的客戶端驅動程序必須與它的實現無關。)
> -
> -也就是說,如果在他們的平台上支持這個公約，驅動應儘可能的使用它。同時，平台
> -必須在 Kconfig 中選擇 ARCH_REQUIRE_GPIOLIB 或者 ARCH_WANT_OPTIONAL_GPIOLIB
> -選項。那些調用標準 GPIO 函數的驅動應該在 Kconfig 入口中聲明依賴GENERIC_GPIO。
> -當驅動包含文件:
> -
> -	#include <linux/gpio.h>
> -
> -則 GPIO 函數是可用,無論是「真實代碼」還是經優化過的語句。如果你遵守
> -這個公約，當你的代碼完成後，對其他的開發者來說會更容易看懂和維護。
> -
> -注意，這些操作包含所用平台的 I/O 屏障代碼，驅動無須顯式地調用他們。
> -
> -
> -標識 GPIO
> ----------
> -GPIO 是通過無符號整型來標識的,範圍是 0 到 MAX_INT。保留「負」數
> -用於其他目的,例如標識信號「在這個板子上不可用」或指示錯誤。未接觸底層
> -硬體的代碼會忽略這些整數。
> -
> -平台會定義這些整數的用法,且通常使用 #define 來定義 GPIO，這樣
> -板級特定的啓動代碼可以直接關聯相應的原理圖。相對來說，驅動應該僅使用
> -啓動代碼傳遞過來的 GPIO 編號，使用 platform_data 保存板級特定
> -引腳配置數據 (同時還有其他須要的板級特定數據)，避免可能出現的問題。
> -
> -例如一個平台使用編號 32-159 來標識 GPIO,而在另一個平台使用編號0-63
> -標識一組 GPIO 控制器,64-79標識另一類 GPIO 控制器,且在一個含有
> -FPGA 的特定板子上使用 80-95。編號不一定要連續,那些平台中，也可以
> -使用編號2000-2063來標識一個 I2C 接口的 GPIO 擴展器中的 GPIO。
> -
> -如果你要初始化一個帶有無效 GPIO 編號的結構體,可以使用一些負編碼
> -(如"-EINVAL")，那將使其永遠不會是有效。來測試這樣一個結構體中的編號
> -是否關聯一個 GPIO，你可使用以下斷言:
> -
> -	int gpio_is_valid(int number);
> -
> -如果編號不存在，則請求和釋放 GPIO 的函數將拒絕執行相關操作(見下文)。
> -其他編號也可能被拒絕,比如一個編號可能存在，但暫時在給定的電路上不可用。
> -
> -一個平台是否支持多個 GPIO 控制器爲平台特定的實現問題，就像是否可以
> -在 GPIO 編號空間中有「空洞」和是否可以在運行時添加新的控制器一樣。
> -這些問題會影響其他事情，包括相鄰的 GPIO 編號是否存在等。
> -
> -使用 GPIO
> ----------
> -對於一個 GPIO，系統應該做的第一件事情就是通過 gpio_request()
> -函數分配它，見下文。
> -
> -接下來是設置I/O方向，這通常是在板級啓動代碼中爲所使用的 GPIO 設置
> -platform_device 時完成。
> -
> -	/* 設置爲輸入或輸出, 返回 0 或負的錯誤代碼 */
> -	int gpio_direction_input(unsigned gpio);
> -	int gpio_direction_output(unsigned gpio, int value);
> -
> -返回值爲零代表成功，否則返回一個負的錯誤代碼。這個返回值需要檢查，因爲
> -get/set(獲取/設置)函數調用沒法返回錯誤,且有可能是配置錯誤。通常，
> -你應該在進程上下文中調用這些函數。然而,對於自旋鎖安全的 GPIO，在板子
> -啓動的早期、進程啓動前使用他們也是可以的。
> -
> -對於作爲輸出的 GPIO，爲其提供初始輸出值，對於避免在系統啓動期間出現
> -信號毛刺是很有幫助的。
> -
> -爲了與傳統的 GPIO 接口兼容, 在設置一個 GPIO 方向時，如果它還未被申請，
> -則隱含了申請那個 GPIO 的操作(見下文)。這種兼容性正在從可選的 gpiolib
> -框架中移除。
> -
> -如果這個 GPIO 編碼不存在，或者特定的 GPIO 不能用於那種模式，則方向
> -設置可能失敗。依賴啓動固件來正確地設置方向通常是一個壞主意，因爲它可能
> -除了啓動Linux，並沒有做更多的驗證工作。(同理, 板子的啓動代碼可能需要
> -將這個復用的引腳設置爲 GPIO，並正確地配置上拉/下拉電阻。)
> -
> -
> -訪問自旋鎖安全的 GPIO
> --------------------
> -大多數 GPIO 控制器可以通過內存讀/寫指令來訪問。這些指令不會休眠,可以
> -安全地在硬(非線程)中斷例程和類似的上下文中完成。
> -
> -對於那些 GPIO，使用以下的函數訪問:
> -
> -	/* GPIO 輸入:返回零或非零 */
> -	int gpio_get_value(unsigned gpio);
> -
> -	/* GPIO 輸出 */
> -	void gpio_set_value(unsigned gpio, int value);
> -
> -GPIO值是布爾值，零表示低電平，非零表示高電平。當讀取一個輸出引腳的值時，
> -返回值應該是引腳上的值。這個值不總是和輸出值相符，因爲存在開漏輸出信號和
> -輸出延遲問題。
> -
> -以上的 get/set 函數無錯誤返回值，因爲之前 gpio_direction_*()應已檢查過
> -其是否爲「無效GPIO」。此外，還需要注意的是並不是所有平台都可以從輸出引腳
> -中讀取數據，對於不能讀取的引腳應總返回零。另外，對那些在原子上下文中無法
> -安全訪問的 GPIO (譯者註：因爲訪問可能導致休眠)使用這些函數是不合適的
> -(見下文)。
> -
> -在 GPIO 編號(還有輸出、值)爲常數的情況下,鼓勵通過平台特定的實現來優化
> -這兩個函數來訪問 GPIO 值。這種情況(讀寫一個硬體寄存器)下只需要幾條指令
> -是很正常的,且無須自旋鎖。這種優化函數比起那些在子程序上花費許多指令的
> -函數可以使得模擬接口(譯者注:例如 GPIO 模擬 I2C、1-wire 或 SPI)的
> -應用(在空間和時間上都)更具效率。
> -
> -
> -訪問可能休眠的 GPIO
> ------------------
> -某些 GPIO 控制器必須通過基於總線(如 I2C 或 SPI)的消息訪問。讀或寫這些
> -GPIO 值的命令需要等待其信息排到隊首才發送命令，再獲得其反饋。期間需要
> -休眠，這不能在 IRQ 例程(中斷上下文)中執行。
> -
> -爲了訪問這種 GPIO,內核定義了一套不同的函數:
> -
> -	/* GPIO 輸入:返回零或非零 ,可能會休眠 */
> -	int gpio_get_value_cansleep(unsigned gpio);
> -
> -	/* GPIO 輸出,可能會休眠 */
> -	void gpio_set_value_cansleep(unsigned gpio, int value);
> -
> -訪問這樣的 GPIO 需要一個允許休眠的上下文，例如線程 IRQ 處理例程，並用以上的
> -訪問函數替換那些沒有 cansleep()後綴的自旋鎖安全訪問函數。
> -
> -除了這些訪問函數可能休眠，且它們操作的 GPIO 不能在硬體 IRQ 處理例程中訪問的
> -事實，這些處理例程實際上和自旋鎖安全的函數是一樣的。
> -
> -** 除此之外 ** 調用設置和配置此類 GPIO 的函數也必須在允許休眠的上下文中，
> -因爲它們可能也需要訪問 GPIO 控制器晶片: (這些設置函數通常在板級啓動代碼或者
> -驅動探測/斷開代碼中，所以這是一個容易滿足的約束條件。)
> -
> -	gpio_direction_input()
> -	gpio_direction_output()
> -	gpio_request()
> -
> -## 	gpio_request_one()
> -
> -	gpio_free()
> -
> -
> -聲明和釋放 GPIO
> -----------------------------
> -爲了有助於捕獲系統配置錯誤,定義了兩個函數。
> -
> -	/* 申請 GPIO, 返回 0 或負的錯誤代碼.
> -	 * 非空標籤可能有助於診斷.
> -	 */
> -	int gpio_request(unsigned gpio, const char *label);
> -
> -	/* 釋放之前聲明的 GPIO */
> -	void gpio_free(unsigned gpio);
> -
> -將無效的 GPIO 編碼傳遞給 gpio_request()會導致失敗，申請一個已使用這個
> -函數聲明過的 GPIO 也會失敗。gpio_request()的返回值必須檢查。你應該在
> -進程上下文中調用這些函數。然而,對於自旋鎖安全的 GPIO,在板子啓動的早期、
> -進入進程之前是可以申請的。
> -
> -這個函數完成兩個基本的目標。一是標識那些實際上已作爲 GPIO 使用的信號線，
> -這樣便於更好地診斷;系統可能需要服務幾百個可用的 GPIO，但是對於任何一個
> -給定的電路板通常只有一些被使用。另一個目的是捕獲衝突，查明錯誤:如兩個或
> -更多驅動錯誤地認爲他們已經獨占了某個信號線,或是錯誤地認爲移除一個管理著
> -某個已激活信號的驅動是安全的。也就是說，申請 GPIO 的作用類似一種鎖機制。
> -
> -某些平台可能也使用 GPIO 作爲電源管理激活信號(例如通過關閉未使用晶片區和
> -簡單地關閉未使用時鐘)。
> -
> -對於 GPIO 使用 pinctrl 子系統已知的引腳，子系統應該被告知其使用情況；
> -一個 gpiolib 驅動的 .request()操作應調用 pinctrl_gpio_request()，
> -而 gpiolib 驅動的 .free()操作應調用 pinctrl_gpio_free()。pinctrl
> -子系統允許 pinctrl_gpio_request()在某個引腳或引腳組以復用形式「屬於」
> -一個設備時都成功返回。
> -
> -任何須將 GPIO 信號導向適當引腳的引腳復用硬體的編程應該發生在 GPIO
> -驅動的 .direction_input()或 .direction_output()函數中，以及
> -任何輸出 GPIO 值的設置之後。這樣可使從引腳特殊功能到 GPIO 的轉換
> -不會在引腳產生毛刺波形。有時當用一個 GPIO 實現其信號驅動一個非 GPIO
> -硬體模塊的解決方案時，就需要這種機制。
> -
> -某些平台允許部分或所有 GPIO 信號使用不同的引腳。類似的，GPIO 或引腳的
> -其他方面也需要配置，如上拉/下拉。平台軟體應該在對這些 GPIO 調用
> -gpio_request()前將這類細節配置好，例如使用 pinctrl 子系統的映射表，
> -使得 GPIO 的用戶無須關注這些細節。
> -
> -還有一個值得注意的是在釋放 GPIO 前，你必須停止使用它。
> -
> -
> -注意:申請一個 GPIO 並沒有以任何方式配置它，只不過標識那個 GPIO 處於使用
> -狀態。必須有另外的代碼來處理引腳配置(如控制 GPIO 使用的引腳、上拉/下拉)。
> -考慮到大多數情況下聲明 GPIO 之後就會立即配置它們,所以定義了以下三個輔助函數:
> -
> -	/* 申請一個 GPIO 信號, 同時通過特定的'flags'初始化配置,
> -	 * 其他和 gpio_request()的參數和返回值相同
> -	 *
> -	 */
> -	int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
> -
> -這裡 'flags' 當前定義可指定以下屬性:
> -
> -	* GPIOF_DIR_IN		- 配置方向爲輸入
> -	* GPIOF_DIR_OUT		- 配置方向爲輸出
> -
> -	* GPIOF_INIT_LOW	- 在作爲輸出時,初始值爲低電平
> -	* GPIOF_INIT_HIGH	- 在作爲輸出時,初始值爲高電平
> -
> -因爲 GPIOF_INIT_* 僅有在配置爲輸出的時候才存在,所以有效的組合爲:
> -
> -	* GPIOF_IN		- 配置爲輸入
> -	* GPIOF_OUT_INIT_LOW	- 配置爲輸出,並初始化爲低電平
> -	* GPIOF_OUT_INIT_HIGH	- 配置爲輸出,並初始化爲高電平
> -
> -更進一步,爲了更簡單地聲明/釋放多個 GPIO,'struct gpio'被引進來封裝所有
> -這三個領域:
> -
> -	struct gpio {
> -		unsigned	gpio;
> -		unsigned long	flags;
> -		const char	*label;
> -	};
> -
> -一個典型的用例:
> -
> -	static struct gpio leds_gpios[] = {
> -		{ 32, GPIOF_OUT_INIT_HIGH, "Power LED" }, /* 默認開啓 */
> -		{ 33, GPIOF_OUT_INIT_LOW,  "Green LED" }, /* 默認關閉 */
> -		{ 34, GPIOF_OUT_INIT_LOW,  "Red LED"   }, /* 默認關閉 */
> -		{ 35, GPIOF_OUT_INIT_LOW,  "Blue LED"  }, /* 默認關閉 */
> -		{ ... },
> -	};
> -
> -	err = gpio_request_one(31, GPIOF_IN, "Reset Button");
> -	if (err)
> -		...
> -
> -
> -GPIO 映射到 IRQ
> ---------------------
> -GPIO 編號是無符號整數;IRQ 編號也是。這些構成了兩個邏輯上不同的命名空間
> -(GPIO 0 不一定使用 IRQ 0)。你可以通過以下函數在它們之間實現映射:
> -
> -	/* 映射 GPIO 編號到 IRQ 編號 */
> -	int gpio_to_irq(unsigned gpio);
> -
> -它們的返回值爲對應命名空間的相關編號，或是負的錯誤代碼(如果無法映射)。
> -(例如,某些 GPIO 無法做爲 IRQ 使用。)以下的編號錯誤是未經檢測的:使用一個
> -未通過 gpio_direction_input()配置爲輸入的 GPIO 編號，或者使用一個
> -並非來源於gpio_to_irq()的 IRQ 編號。
> -
> -這兩個映射函數可能會在信號編號的加減計算過程上花些時間。它們不可休眠。
> -
> -gpio_to_irq()返回的非錯誤值可以傳遞給 request_irq()或者 free_irq()。
> -它們通常通過板級特定的初始化代碼存放到平台設備的 IRQ 資源中。注意:IRQ
> -觸發選項是 IRQ 接口的一部分，如 IRQF_TRIGGER_FALLING，系統喚醒能力
> -也是如此。
> -
> -
> -模擬開漏信號
> -----------------------------
> -有時在只有低電平信號作爲實際驅動結果(譯者注:多個輸出連接於一點，邏輯電平
> -結果爲所有輸出的邏輯與)的時候,共享的信號線需要使用「開漏」信號。(該術語
> -適用於 CMOS 管；而 TTL 用「集電極開路」。)一個上拉電阻使信號爲高電平。這
> -有時被稱爲「線與」。實際上，從負邏輯(低電平爲真)的角度來看，這是一個「線或」。
> -
> -一個開漏信號的常見例子是共享的低電平使能 IRQ 信號線。此外,有時雙向數據總線
> -信號也使用漏極開路信號。
> -
> -某些 GPIO 控制器直接支持開漏輸出，還有許多不支持。當你需要開漏信號，但
> -硬體又不直接支持的時候，一個常用的方法是用任何即可作輸入也可作輸出的 GPIO
> -引腳來模擬:
> -
> - LOW:	gpio_direction_output(gpio, 0) ... 這代碼驅動信號並覆蓋
> -	上拉配置。
> -
> - HIGH:	gpio_direction_input(gpio) ... 這代碼關閉輸出,所以上拉電阻
> -	(或其他的一些器件)控制了信號。
> -
> -如果你將信號線「驅動」爲高電平，但是 gpio_get_value(gpio)報告了一個
> -低電平(在適當的上升時間後)，你就可以知道是其他的一些組件將共享信號線拉低了。
> -這不一定是錯誤的。一個常見的例子就是 I2C 時鐘的延長：一個需要較慢時鐘的
> -從設備延遲 SCK 的上升沿，而 I2C 主設備相應地調整其信號傳輸速率。
> -
> -
> -這些公約忽略了什麼?
> -================
> -這些公約忽略的最大一件事就是引腳復用，因爲這屬於高度晶片特定的屬性且
> -沒有可移植性。某個平台可能不需要明確的復用信息；有的對於任意給定的引腳
> -可能只有兩個功能選項；有的可能每個引腳有八個功能選項；有的可能可以將
> -幾個引腳中的任何一個作爲給定的 GPIO。(是的，這些例子都來自於當前運行
> -Linux 的系統。)
> -
> -在某些系統中,與引腳復用相關的是配置和使能集成的上、下拉模式。並不是所有
> -平台都支持這種模式,或者不會以相同的方式來支持這種模式；且任何給定的電路板
> -可能使用外置的上拉(或下拉)電阻,這時晶片上的就不應該使用。(當一個電路需要
> -5kOhm 的拉動電阻,晶片上的 100 kOhm 電阻就不能做到。)同樣的，驅動能力
> -(2 mA vs 20 mA)和電壓(1.8V vs 3.3V)是平台特定問題,就像模型一樣在
> -可配置引腳和 GPIO 之間(沒)有一一對應的關係。
> -
> -還有其他一些系統特定的機制沒有在這裡指出，例如上述的輸入去毛刺和線與輸出
> -選項。硬體可能支持批量讀或寫 GPIO，但是那一般是配置相關的：對於處於同一
> -塊區(bank)的GPIO。(GPIO 通常以 16 或 32 個組成一個區塊，一個給定的
> -片上系統一般有幾個這樣的區塊。)某些系統可以通過輸出 GPIO 觸發 IRQ，
> -或者從並非以 GPIO 管理的引腳取值。這些機制的相關代碼沒有必要具有可移植性。
> -
> -當前，動態定義 GPIO 並不是標準的，例如作爲配置一個帶有某些 GPIO 擴展器的
> -附加電路板的副作用。
> -
> -GPIO 實現者的框架 (可選)
> -=====================
> -前面提到了，有一個可選的實現框架，讓平台使用相同的編程接口，更加簡單地支持
> -不同種類的 GPIO 控制器。這個框架稱爲"gpiolib"。
> -
> -作爲一個輔助調試功能，如果 debugfs 可用，就會有一個 /sys/kernel/debug/gpio
> -文件。通過這個框架，它可以列出所有註冊的控制器,以及當前正在使用中的 GPIO
> -的狀態。
> -
> -
> -控制器驅動: gpio_chip
> --------------------
> -在框架中每個 GPIO 控制器都包裝爲一個 "struct gpio_chip"，他包含了
> -該類型的每個控制器的常用信息:
> -
> - - 設置 GPIO 方向的方法
> - - 用於訪問 GPIO 值的方法
> - - 告知調用其方法是否可能休眠的標誌
> - - 可選的 debugfs 信息導出方法 (顯示類似上拉配置一樣的額外狀態)
> - - 診斷標籤
> -
> -也包含了來自 device.platform_data 的每個實例的數據：它第一個 GPIO 的
> -編號和它可用的 GPIO 的數量。
> -
> -實現 gpio_chip 的代碼應支持多控制器實例，這可能使用驅動模型。那些代碼要
> -配置每個 gpio_chip，並發起gpiochip_add()。卸載一個 GPIO 控制器很少見，
> -但在必要的時候可以使用 gpiochip_remove()。
> -
> -大部分 gpio_chip 是一個實例特定結構體的一部分，而並不將 GPIO 接口單獨
> -暴露出來,比如編址、電源管理等。類似編解碼器這樣的晶片會有複雜的非 GPIO
> -狀態。
> -
> -任何一個 debugfs 信息導出方法通常應該忽略還未申請作爲 GPIO 的信號線。
> -他們可以使用 gpiochip_is_requested()測試，當這個 GPIO 已經申請過了
> -就返回相關的標籤，否則返回 NULL。
> -
> -
> -平台支持
> --------
> -爲了支持這個框架，一個平台的 Kconfig 文件將會 "select"(選擇)
> -ARCH_REQUIRE_GPIOLIB 或 ARCH_WANT_OPTIONAL_GPIOLIB，並讓它的
> -<asm/gpio.h> 包含 <asm-generic/gpio.h>，同時定義二個方法:
> -gpio_get_value()、gpio_set_value()。
> -
> -它也應提供一個 ARCH_NR_GPIOS 的定義值，這樣可以更好地反映該平台 GPIO
> -的實際數量,節省靜態表的空間。(這個定義值應該包含片上系統內建 GPIO 和
> -GPIO 擴展器中的數據。)
> -
> -ARCH_REQUIRE_GPIOLIB 意味著 gpiolib 核心在這個構架中將總是編譯進內核。
> -
> -ARCH_WANT_OPTIONAL_GPIOLIB 意味著 gpiolib 核心默認關閉,且用戶可以
> -使能它,並將其編譯進內核(可選)。
> -
> -如果這些選項都沒被選擇,該平台就不通過 GPIO-lib 支持 GPIO,且代碼不可以
> -被用戶使能。
> -
> -以下這些方法的實現可以直接使用框架代碼,並總是通過 gpio_chip 調度:
> -
> -  #define gpio_get_value	__gpio_get_value
> -  #define gpio_set_value	__gpio_set_value
> -
> -這些定義可以用更理想的實現方法替代，那就是使用經過邏輯優化的內聯函數來訪問
> -基於特定片上系統的 GPIO。例如,若引用的 GPIO (寄存器位偏移)是常量「12」，
> -讀取或設置它可能只需少則兩或三個指令，且不會休眠。當這樣的優化無法實現時，
> -那些函數必須使用框架提供的代碼，那就至少要幾十條指令才可以實現。對於用 GPIO
> -模擬的 I/O 接口, 如此精簡指令是很有意義的。
> -
> -對於片上系統，平台特定代碼爲片上 GPIO 每個區(bank)定義並註冊 gpio_chip
> -實例。那些 GPIO 應該根據晶片廠商的文檔進行編碼/標籤,並直接和電路板原理圖
> -對應。他們應該開始於零並終止於平台特定的限制。這些 GPIO(代碼)通常從
> -arch_initcall()或者更早的地方集成進平台初始化代碼，使這些 GPIO 總是可用，
> -且他們通常可以作爲 IRQ 使用。
> -
> -板級支持
> --------
> -對於外部 GPIO 控制器(例如 I2C 或 SPI 擴展器、專用晶片、多功能器件、FPGA
> -或 CPLD)，大多數常用板級特定代碼都可以註冊控制器設備，並保證他們的驅動知道
> -gpiochip_add()所使用的 GPIO 編號。他們的起始編號通常跟在平台特定的 GPIO
> -編號之後。
> -
> -例如板級啓動代碼應該創建結構體指明晶片公開的 GPIO 範圍，並使用 platform_data
> -將其傳遞給每個 GPIO 擴展器晶片。然後晶片驅動中的 probe()例程可以將這個
> -數據傳遞給 gpiochip_add()。
> -
> -初始化順序很重要。例如，如果一個設備依賴基於 I2C 的(擴展)GPIO，那麼它的
> -probe()例程就應該在那個 GPIO 有效以後才可以被調用。這意味著設備應該在
> -GPIO 可以工作之後才可被註冊。解決這類依賴的的一種方法是讓這種 gpio_chip
> -控制器向板級特定代碼提供 setup()和 teardown()回調函數。一旦所有必須的
> -資源可用之後，這些板級特定的回調函數將會註冊設備，並可以在這些 GPIO 控制器
> -設備變成無效時移除它們。
> -
> -
> -用戶空間的 Sysfs 接口(可選)
> -========================
> -使用「gpiolib」實現框架的平台可以選擇配置一個 GPIO 的 sysfs 用戶接口。
> -這不同於 debugfs 接口，因爲它提供的是對 GPIO方向和值的控制，而不只顯示
> -一個GPIO 的狀態摘要。此外,它可以出現在沒有調試支持的產品級系統中。
> -
> -例如，通過適當的系統硬體文檔，用戶空間可以知道 GIOP #23 控制 Flash
> -存儲器的防寫(用於保護其中 Bootloader 分區)。產品的系統升級可能需要
> -臨時解除這個保護：首先導入一個 GPIO，改變其輸出狀態，然後在重新使能防寫
> -前升級代碼。通常情況下,GPIO #23 是不會被觸及的，並且內核也不需要知道他。
> -
> -根據適當的硬體文檔，某些系統的用戶空間 GPIO 可以用於確定系統配置數據，
> -這些數據是標準內核不知道的。在某些任務中，簡單的用戶空間 GPIO 驅動可能是
> -系統真正需要的。
> -
> -注意：標準內核驅動中已經存在通用的「LED 和按鍵」GPIO 任務，分別是:
> -"leds-gpio" 和 "gpio_keys"。請使用這些來替代直接訪問 GPIO，因爲集成在
> -內核框架中的這類驅動比你在用戶空間的代碼更好。
> -
> -
> -Sysfs 中的路徑
> ---------------
> -在/sys/class/gpio 中有 3 類入口:
> -
> -   -	用於在用戶空間控制 GPIO 的控制接口;
> -
> -   -	GPIOs 本身;以及
> -
> -   -	GPIO 控制器 ("gpio_chip" 實例)。
> -
> -除了這些標準的文件,還包含「device」符號連結。
> -
> -控制接口是只寫的:
> -
> -    /sys/class/gpio/
> -
> -    	"export" ... 用戶空間可以通過寫其編號到這個文件，要求內核導出
> -		一個 GPIO 的控制到用戶空間。
> -
> -		例如: 如果內核代碼沒有申請 GPIO #19,"echo 19 > export"
> -		將會爲 GPIO #19 創建一個 "gpio19" 節點。
> -
> -    	"unexport" ... 導出到用戶空間的逆操作。
> -
> -		例如: "echo 19 > unexport" 將會移除使用"export"文件導出的
> -		"gpio19" 節點。
> -
> -GPIO 信號的路徑類似 /sys/class/gpio/gpio42/ (對於 GPIO #42 來說)，
> -並有如下的讀/寫屬性:
> -
> -    /sys/class/gpio/gpioN/
> -
> -	"direction" ... 讀取得到 "in" 或 "out"。這個值通常運行寫入。
> -		寫入"out" 時,其引腳的默認輸出爲低電平。爲了確保無故障運行，
> -		"low" 或 "high" 的電平值應該寫入 GPIO 的配置，作爲初始輸出值。
> -
> -		注意:如果內核不支持改變 GPIO 的方向，或者在導出時內核代碼沒有
> -		明確允許用戶空間可以重新配置 GPIO 方向，那麼這個屬性將不存在。
> -
> -	"value" ... 讀取得到 0 (低電平) 或 1 (高電平)。如果 GPIO 配置爲
> -		輸出,這個值允許寫操作。任何非零值都以高電平看待。
> -
> -		如果引腳可以配置爲中斷信號，且如果已經配置了產生中斷的模式
> -		（見"edge"的描述），你可以對這個文件使用輪詢操作(poll(2))，
> -		且輪詢操作會在任何中斷觸發時返回。如果你使用輪詢操作(poll(2))，
> -		請在 events 中設置 POLLPRI 和 POLLERR。如果你使用輪詢操作
> -		(select(2))，請在 exceptfds 設置你期望的文件描述符。在
> -		輪詢操作(poll(2))返回之後，既可以通過 lseek(2)操作讀取
> -		sysfs 文件的開始部分，也可以關閉這個文件並重新打開它來讀取數據。
> -
> -	"edge" ... 讀取得到「none」、「rising」、「falling」或者「both」。
> -		將這些字符串寫入這個文件可以選擇沿觸發模式，會使得輪詢操作
> -		(select(2))在"value"文件中返回。
> -
> -		這個文件僅有在這個引腳可以配置爲可產生中斷輸入引腳時，才存在。
> -
> -	"active_low" ... 讀取得到 0 (假) 或 1 (真)。寫入任何非零值可以
> -		翻轉這個屬性的(讀寫)值。已存在或之後通過"edge"屬性設置了"rising"
> -		和 "falling" 沿觸發模式的輪詢操作(poll(2))將會遵循這個設置。
> -
> -GPIO 控制器的路徑類似 /sys/class/gpio/gpiochip42/ (對於從#42 GPIO
> -開始實現控制的控制器),並有著以下只讀屬性:
> -
> -    /sys/class/gpio/gpiochipN/
> -
> -    	"base" ... 與以上的 N 相同,代表此晶片管理的第一個 GPIO 的編號
> -
> -    	"label" ... 用於診斷 (並不總是只有唯一值)
> -
> -    	"ngpio" ... 此控制器所管理的 GPIO 數量(而 GPIO 編號從 N 到
> -    		N + ngpio - 1)
> -
> -大多數情況下,電路板的文檔應當標明每個 GPIO 的使用目的。但是那些編號並不總是
> -固定的,例如在擴展卡上的 GPIO會根據所使用的主板或所在堆疊架構中其他的板子而
> -有所不同。在這種情況下,你可能需要使用 gpiochip 節點(儘可能地結合電路圖)來
> -確定給定信號所用的 GPIO 編號。
> diff --git a/include/linux/gpio.h b/include/linux/gpio.h
> index 56ac7e7a2889..063f71b18a7c 100644
> --- a/include/linux/gpio.h
> +++ b/include/linux/gpio.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0 */
>   /*
> - * <linux/gpio.h>
> + * NOTE: This header *must not* be included.
>    *
>    * This is the LEGACY GPIO bulk include file, including legacy APIs. It is
>    * used for GPIO drivers still referencing the global GPIO numberspace,
> @@ -16,8 +16,6 @@
>   
>   struct device;
>   
> -/* see Documentation/driver-api/gpio/legacy.rst */
> -
>   /* make these flag values available regardless of GPIO kconfig options */
>   #define GPIOF_DIR_OUT	(0 << 0)
>   #define GPIOF_DIR_IN	(1 << 0)
> @@ -121,8 +119,6 @@ static inline int gpio_to_irq(unsigned gpio)
>   
>   int gpio_request_one(unsigned gpio, unsigned long flags, const char *label);
>   
> -/* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
> -
>   int devm_gpio_request(struct device *dev, unsigned gpio, const char *label);
>   int devm_gpio_request_one(struct device *dev, unsigned gpio,
>   			  unsigned long flags, const char *label);

