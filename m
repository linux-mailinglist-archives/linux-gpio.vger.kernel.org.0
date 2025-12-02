Return-Path: <linux-gpio+bounces-29205-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFCCC9AAE1
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Dec 2025 09:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2CCF13467D6
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Dec 2025 08:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C323064A5;
	Tue,  2 Dec 2025 08:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyNsnIj3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EBB305E24;
	Tue,  2 Dec 2025 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664073; cv=none; b=MJTb4lE0A1lYDjEWMqrnirz0bmQcW3v4wSOxncwaKlRJoEIuISwRSQYWQmQkW5OGU78SqvSs9xLaSfrXxxF3gqlCiA1VU0+2WUD3R3yZa9k7njjpoQ0zDdqp6ZtlBf6dRXESIVLZyI70lpAGdf5rwHcQ0Nj1YoZLl0UiYP/c4Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664073; c=relaxed/simple;
	bh=6S40L2/CUzQIZdGqpCR6+p9ZBQCAAkAwNN0T0zhWhUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ys9jrt9c3aDPU8pngAeGHq5Bt5AlOEaeTK8Stp58mOEl0weolkYH1nseCNBXwks4NLn1T9dldp78M6ggO/xsybcCtA/UmBqnwIBGvmrspwJKzobaMSb2NS0PfG+jiTTt2XSFU+YZfunagt6JDx9/aFjWVRLUhNNGMVzLCnYuAdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyNsnIj3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA2CC116D0;
	Tue,  2 Dec 2025 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764664073;
	bh=6S40L2/CUzQIZdGqpCR6+p9ZBQCAAkAwNN0T0zhWhUY=;
	h=From:To:Cc:Subject:Date:From;
	b=JyNsnIj3QoOIZy+RSycGI6R08UWwy4bIwtKrEJGfb25tMMP820jkWCWRow/snzPZO
	 mKF/YL/csOPnipZOyOQxn0oOR1LYqdJOT1iYd/FFnhefOyhIpXpzHOlWNCP9VX6JTJ
	 MSSX6eOpmIQURAdZ6FeWBTa/UuIeL1r40h7Nqp7u1wn84L1671sGvLg4LklwM8F+d6
	 dBpFPOTqyszpBDENv78jGZZhZ/eXh4FdgTsLG8KczQlzMd2hDDxBnz8USXIMI1AGSC
	 w7rdwt2TGTAax0+Pp8156dJLTz8tNloPYKMzKQL6q1QCtZOifLqHkpX7cFpTnyxg5Z
	 7tg2nAki39MPg==
From: Bartosz Golaszewski <brgl@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: [GIT PULL] gpio updates for v6.19-rc1
Date: Tue,  2 Dec 2025 09:27:37 +0100
Message-ID: <20251202082740.10843-1-brgl@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linus,

Here are the GPIO updates for this merge window.

There's one new driver, lots of various updates to existing ones, some
refactoring support for new models and misc tweaks and fixes.

The biggest new feature in GPIO core is adding support for managed,
enable-counted sharing of GPIO pins, something that - until now - was
only hacked around with the GPIOD_FLAGS_BIT_NONEXCLUSIVE request flag
which basically allowed drivers to "fight it out" for the descriptor
and provided no synchronization. It was enabled on Qualcomm platforms
(and thus is enabled on arm64 defconfig) and I plan on removing
GPIOD_FLAGS_BIT_NONEXCLUSIVE once all drivers using it are switched to
the new mechanism.

The merges you'll see in the tree mostly concern the reset-gpio rework
and its driver core prerequisites as well as the resulting fallout in
linux-next and a subsequent slew of fixes to stabilize it and its
unexpected interaction with the new shared GPIO code.

Details are in the signed tag. Please pull.

Thanks,
Bartosz

The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.19-rc1

for you to fetch changes up to dae9750105cf93ac1e156ef91f4beeb53bd64777:

  gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE (2025-11-28 12:59:00 +0100)

----------------------------------------------------------------
gpio updates for v6.19-rc1

GPIO core:
- add proper support for shared GPIOs that's aiming to replace the
  current sharing mechanism (which provides no synchronization ot enable
  counting) and enable it for Qualcomm platforms
- improve the software node GPIO lookup by using the fwnode
  representation instead of the software node's name which was prone to
  bugs (GPIO controllers don't have to use the software node's name as
  their kernel label)
- remove the last user of legacy-of-mm-gpiochip.h and drop the header
- move closer to removing the legacy gpio_request_one() routine
- rename some symbols for consistency
- shrink GPIO printk() helpers by reusing existing code
- remove some redundant kernel messages
- use min() instead of min_t() in GPIO ACPI code
- use system_percpu_wq instead of system_wq in GPIO character device code

New drivers:
- add a driver for the QIXIS FPGA GPIO controller

Driver improvements:
- use modernized variants of power management macros across a wide array
  of drivers in order to avoid having to use the __maybe_unused attribute
- convert gpio-elkhartlake and reset-gpio to using the auxiliary bus
  instead of the platform bus as they are not really described in
  firmware
- use lock guards and update symbol prefixes in gpio-mmio
- support the bryx radio interface kit in gpio-mpsse + refactor the
  driver
- use software nodes for configuring the reset-gpio driver, including
  setting up the reference to the shared "reset" pin
- check and propagate the return value of gpiod_set_value() to user-space
  in gpio-virtuser (this was previously not possible as this function
  returned void)
- extend the gpio-regmap helper with more features (bypass cache for
  aliased inputs, force writes for aliased data registers, add a new
  configuration parameter)
- remove unneeded includes from gpio-aspeed and gpio-latch
- add support for Tegra410 to gpio-tegra186
- replace PCI-specific PM with generic device-level PM in gpio-bt8xx
- use dynamic GPIO range allocation in gpio-loongson-64bit
- improve handling of level-triggered interrupts in gpio-pca953x
- add suspend/resume support to gpio-fxl6408
- add support for more models to gpio-menz127
- optimize gpio-mvebu interrupt handling by avoiding unnecessary calls
  to mvebu_gpio_irq_handler()
- make locking more consistent in gpio-grgpio

Device-tree bindings:
- document new NXP and Microchip models

Documentation:
- add a comprehensive compatibility and feature list for gpio-pca953x,
  which is a great addition as it's probably the most commonly used GPIO
  expander driver
- kernel-doc tweaks

Late fixes:
- use BYTE_CTRL_MODE for 2K2000/3000 models in gpio-loongson

----------------------------------------------------------------
Alex Tran (1):
      gpio: grgpio: call request_irq after incrementing the reference count

Andy Shevchenko (2):
      gpiolib: legacy: Make sure we kill gpio_request_one() first
      gpiolib: legacy: Allow to kill devm_gpio_request_one() independently

Bartosz Golaszewski (43):
      gpiolib: remove unnecessary 'out of memory' messages
      gpiolib: rename GPIO chip printk macros
      gpiolib: reuse macro code in GPIO descriptor printk helpers
      gpiolib: reuse macro code in GPIO chip printk helpers
      gpio: virtuser: check the return value of gpiod_set_value()
      gpio: qixis-fpga: add missing module description
      gpio: latch: remove unneeded include
      gpio: rename gpio_chip_hwgpio() to gpiod_hwgpio()
      gpio: export gpiod_hwgpio()
      gpio: aspeed: remove unneeded include
      Merge tag 'v6.18-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      gpio: mmio: use lock guards
      gpio: mmio: drop the "bgpio" prefix
      gpio: mm-lantiq: update kernel docs
      string: provide strends()
      gpiolib: define GPIOD_FLAG_SHARED
      gpiolib: implement low-level, shared GPIO support
      gpio: shared-proxy: implement the shared GPIO proxy driver
      gpiolib: support shared GPIOs in core subsystem code
      gpio: provide gpiod_is_shared()
      arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
      Merge tag 'gpio/shared-gpios-for-v6.19-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git into gpio/for-next
      gpio: shared: fix a NULL-pointer dereference
      gpio: shared: extend the ifdef guard to gpio_shared_find_entry()
      string: fix kerneldoc formatting in strends()
      software node: read the reference args via the fwnode API
      software node: increase the reference of the swnode by its fwnode
      software node: allow referencing firmware nodes
      gpio: swnode: allow referencing GPIO chips by firmware nodes
      reset: order includes alphabetically in reset/core.c
      reset: make the provider of reset-gpios the parent of the reset device
      reset: gpio: convert the driver to using the auxiliary bus
      reset: gpio: use software nodes to setup the GPIO lookup
      Merge tag 'reset-gpio-for-v6.19' of https://git.pengutronix.de/git/pza/linux into gpio/for-next
      platform/x86: intel: chtwc_int33fe: don't dereference swnode args
      Merge tag 'reset-gpio-for-v6.19-2' of https://git.pengutronix.de/git/pza/linux into gpio/for-next
      string: use __attribute__((nonnull())) in strends()
      Merge tag 'intel-gpio-v6.19-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next
      gpio: shared: handle the reset-gpios corner case
      gpio: shared: ignore special __symbols__ node when traversing device tree
      gpio: shared: ignore GPIO hogs when traversing the device tree
      gpio: shared-proxy: set suppress_bind_attrs
      gpio: shared: fix a deadlock

Binbin Zhou (1):
      gpio: loongson-64bit: Switch to dynamic allocate GPIO base in byte mode

Charles Keepax (1):
      spi: cs42l43: Use actual ACPI firmware node for chip selects

Christophe JAILLET (1):
      gpio: mvebu: Slightly optimize mvebu_gpio_irq_handler()

Christophe Leroy (2):
      gpio: mm-lantiq: Drop legacy-of-mm-gpiochip.h header from GPIO driver
      gpiolib: of: Get rid of <linux/gpio/legacy-of-mm-gpiochip.h>

Dan Carpenter (1):
      gpio: qixis-fpga: Fix a NULL vs IS_ERR() bug in probe()

David Laight (1):
      gpiolib: acpi: use min() instead of min_t()

Francesco Lavra (1):
      gpio: pca953x: enable latch only on edge-triggered inputs

Ioana Ciornei (3):
      dt-bindings: gpio: add QIXIS FPGA based GPIO controller
      gpio: regmap: add the .fixed_direction_output configuration parameter
      gpio: add QIXIS FPGA GPIO controller

Jisheng Zhang (15):
      gpio: fxl6408: Add suspend/resume support
      gpio: dwapb: Use modern PM macros
      gpio: brcmstb: Use modern PM macros
      gpio: htc-egpio: Use modern PM macros
      gpio: pl061: Use modern PM macros
      gpio: ml-ioh: Use modern PM macros
      gpio: mlxbf2: Use modern PM macros
      gpio: msc313: Use modern PM macros
      gpio: omap: Use modern PM macros
      gpio: pch: Use modern PM macros
      gpio: tqmx86: Use modern PM macros
      gpio: uniphier: Use modern PM macros
      gpio: xgene: Use modern PM macros
      gpio: xilinx: Use modern PM macros
      gpio: zynq: Use modern PM macros

Jose Javier Rodriguez Barbarin (1):
      gpio: menz127: add support for 16Z034 and 16Z037 GPIO controllers

Kartik Rajput (2):
      gpio: tegra186: Use generic macro for port definitions
      gpio: tegra186: Fix GPIO name collisions for Tegra410

Levente Révész (1):
      Documentation: gpio: Add a compatibility and feature list for PCA953x

Marco Crivellari (1):
      gpio: cdev: replace use of system_wq with system_percpu_wq

Mary Strodl (4):
      gpio: mpsse: propagate error from direction_input
      gpio: mpsse: ensure worker is torn down
      gpio: mpsse: add quirk support
      gpio: mpsse: support bryx radio interface kit

Michael Roth (1):
      gpio: pca953x: clarify log messages about auto increment feature

Pierre-Henry Moussay (1):
      dt-bindings: gpio: mpfs-gpio: Add pic64gx GPIO compatibility

Prathamesh Shete (1):
      gpio: tegra186: Add support for Tegra410

Raag Jadav (2):
      platform/x86/intel: Introduce Intel Elkhart Lake PSE I/O
      gpio: elkhartlake: Convert to auxiliary driver

Randy Dunlap (1):
      gpio: regmap: fix kernel-doc notation

Sander Vanheule (2):
      gpio: regmap: Force writes for aliased data regs
      gpio: regmap: Bypass cache for aliased inputs

Vaibhav Gupta (1):
      gpio: bt8xx: use generic power management

Xi Ruoyao (1):
      gpio: loongson: Switch 2K2000/3000 GPIO to BYTE_CTRL_MODE

 .../bindings/gpio/microchip,mpfs-gpio.yaml         |   5 +-
 .../devicetree/bindings/gpio/trivial-gpio.yaml     |   2 +
 Documentation/driver-api/gpio/index.rst            |   1 +
 Documentation/driver-api/gpio/pca953x.rst          | 552 +++++++++++++++++
 MAINTAINERS                                        |   7 +
 arch/arm64/Kconfig.platforms                       |   1 +
 drivers/base/swnode.c                              |  30 +-
 drivers/gpio/Kconfig                               |  35 +-
 drivers/gpio/Makefile                              |   3 +
 drivers/gpio/TODO                                  |  11 -
 drivers/gpio/gpio-aspeed.c                         |   7 +-
 drivers/gpio/gpio-brcmstb.c                        |  12 +-
 drivers/gpio/gpio-bt8xx.c                          |  30 +-
 drivers/gpio/gpio-dwapb.c                          |  18 +-
 drivers/gpio/gpio-elkhartlake.c                    |  36 +-
 drivers/gpio/gpio-fxl6408.c                        |  13 +
 drivers/gpio/gpio-grgpio.c                         |  24 +-
 drivers/gpio/gpio-htc-egpio.c                      |  21 +-
 drivers/gpio/gpio-latch.c                          |   2 -
 drivers/gpio/gpio-loongson-64bit.c                 |  11 +-
 drivers/gpio/gpio-menz127.c                        |  26 +-
 drivers/gpio/gpio-ml-ioh.c                         |  12 +-
 drivers/gpio/gpio-mlxbf2.c                         |   8 +-
 drivers/gpio/gpio-mm-lantiq.c                      |  57 +-
 drivers/gpio/gpio-mmio.c                           | 335 +++++------
 drivers/gpio/gpio-mpsse.c                          | 229 ++++++-
 drivers/gpio/gpio-msc313.c                         |   8 +-
 drivers/gpio/gpio-mvebu.c                          |   3 +-
 drivers/gpio/gpio-omap.c                           |  15 +-
 drivers/gpio/gpio-pca953x.c                        |  13 +-
 drivers/gpio/gpio-pch.c                            |  12 +-
 drivers/gpio/gpio-pl061.c                          |  17 +-
 drivers/gpio/gpio-qixis-fpga.c                     | 111 ++++
 drivers/gpio/gpio-regmap.c                         |  18 +-
 drivers/gpio/gpio-shared-proxy.c                   | 334 +++++++++++
 drivers/gpio/gpio-tegra186.c                       | 174 ++++--
 drivers/gpio/gpio-tqmx86.c                         |   9 +-
 drivers/gpio/gpio-uniphier.c                       |   9 +-
 drivers/gpio/gpio-virtuser.c                       |   8 +-
 drivers/gpio/gpio-xgene.c                          |   8 +-
 drivers/gpio/gpio-xilinx.c                         |  15 +-
 drivers/gpio/gpio-zynq.c                           |  15 +-
 drivers/gpio/gpiolib-acpi-core.c                   |   2 +-
 drivers/gpio/gpiolib-cdev.c                        |  18 +-
 drivers/gpio/gpiolib-legacy.c                      |  44 +-
 drivers/gpio/gpiolib-of.c                          |  79 ---
 drivers/gpio/gpiolib-shared.c                      | 656 +++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h                      |  71 +++
 drivers/gpio/gpiolib-swnode.c                      |   3 +-
 drivers/gpio/gpiolib-sysfs.c                       |  16 +-
 drivers/gpio/gpiolib.c                             | 217 ++++---
 drivers/gpio/gpiolib.h                             |  51 +-
 drivers/platform/x86/intel/Kconfig                 |  13 +
 drivers/platform/x86/intel/Makefile                |   1 +
 drivers/platform/x86/intel/chtwc_int33fe.c         |  29 +-
 drivers/platform/x86/intel/ehl_pse_io.c            |  86 +++
 drivers/reset/Kconfig                              |   1 +
 drivers/reset/core.c                               | 146 +++--
 drivers/reset/reset-gpio.c                         |  19 +-
 drivers/spi/spi-cs42l43.c                          |  40 +-
 include/linux/ehl_pse_io_aux.h                     |  24 +
 include/linux/gpio/consumer.h                      |  11 +
 include/linux/gpio/legacy-of-mm-gpiochip.h         |  36 --
 include/linux/gpio/regmap.h                        |   4 +-
 include/linux/property.h                           |  13 +-
 include/linux/string.h                             |  19 +
 lib/tests/string_kunit.c                           |  13 +
 67 files changed, 2981 insertions(+), 888 deletions(-)
 create mode 100644 Documentation/driver-api/gpio/pca953x.rst
 create mode 100644 drivers/gpio/gpio-qixis-fpga.c
 create mode 100644 drivers/gpio/gpio-shared-proxy.c
 create mode 100644 drivers/gpio/gpiolib-shared.c
 create mode 100644 drivers/gpio/gpiolib-shared.h
 create mode 100644 drivers/platform/x86/intel/ehl_pse_io.c
 create mode 100644 include/linux/ehl_pse_io_aux.h
 delete mode 100644 include/linux/gpio/legacy-of-mm-gpiochip.h

