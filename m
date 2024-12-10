Return-Path: <linux-gpio+bounces-13719-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C89EBE0D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 23:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13A9F2835B0
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 22:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A971F1911;
	Tue, 10 Dec 2024 22:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXGdNUi5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E6D1F191E;
	Tue, 10 Dec 2024 22:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733870920; cv=none; b=BFuIybj9402DmdFjkiykGNW03cxsaBzfIGwXbnuxkguKqCMPFkZMc+CIWdNqQnMMaEogo0Jk+qAz3ykW7nirM+wxyZ9QfmEUWbUXfI1G+VxMLMgOf4E4Oy9b/LQ2bWjLOFHOA4RWtUt/QeyT9u5j8GGgsq9vzG8IMowsg0wTB68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733870920; c=relaxed/simple;
	bh=JbfTjk/AUSCaV/r+Feth3Qp+vkKOiy7wYeD0hMMfSfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2Y7ZzseTiyy8vbTUCmsv729eBhXSYW4cTdF1gkKiomWU9D3U9IfePtCejuZBJFm0Tkg+vGNUhqO94k5pnSo9kvJu+TG3RTGN+RVy4ek54NBjfSkp+IeTPhNwFu8EXr/nQ9wVaQQ+BhB2VFUMQgkz6s/Jst9PBAcX5FYBJ8haw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXGdNUi5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FF0C4CED6;
	Tue, 10 Dec 2024 22:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733870919;
	bh=JbfTjk/AUSCaV/r+Feth3Qp+vkKOiy7wYeD0hMMfSfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXGdNUi5V+9H7Q/rcFhrRyyn6FddxKbXUKcht8e2j8XR9rqYpE1KiWpTvR5Bz0dO8
	 xYgk3L+wk3sGcosBw+g2gqiOpHQEnqsB5Oznxeq7bXdCDgiFguPYDuZMwmKpeLTCA/
	 viMNrMhoxMOD18K/ewmYX+BYS2jnDAF5Qxfy4jGnhkwRMHz88L68n1fY/lW117BAvM
	 Oam0zp5bsnFh9wTzAVfGtkhomTZQpfB7ayUIh0zvOtfBOShgP1tZeEhnfD7kQvi9LV
	 WA7wU3con0L5Mu65ZTswUEBlHb+isoIafHpTCuiRQ8Neygkdn5nlsUh2kHuHHzbp6W
	 TAlLf7bXxBwAw==
Date: Tue, 10 Dec 2024 16:48:37 -0600
From: Rob Herring <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <20241210224837.GA702616-robh@kernel.org>
References: <cover.1733136811.git.andrea.porta@suse.com>
 <28fe72eec1c08781770cee65032bb10a6d5994a9.1733136811.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28fe72eec1c08781770cee65032bb10a6d5994a9.1733136811.git.andrea.porta@suse.com>

On Mon, Dec 02, 2024 at 12:19:32PM +0100, Andrea della Porta wrote:
> The RaspberryPi RP1 is a PCI multi function device containing
> peripherals ranging from Ethernet to USB controller, I2C, SPI
> and others.
> 
> Implement a bare minimum driver to operate the RP1, leveraging
> actual OF based driver implementations for the on-board peripherals
> by loading a devicetree overlay during driver probe.
> 
> The peripherals are accessed by mapping MMIO registers starting
> from PCI BAR1 region.
> 
> With the overlay approach we can achieve more generic and agnostic
> approach to managing this chipset, being that it is a PCI endpoint
> and could possibly be reused in other hw implementations. The
> presented approach is also used by Bootlin's Microchip LAN966x
> patchset (see link) as well, for a similar chipset.
> 
> Since the gpio line names should be provided by the user, there
> is an interface through configfs that allows the userspace to
> load a DT overlay that will provide gpio-line-names property.
> The interface can be invoked like this:
> 
> cat rpi-rp1-gpios-5-b.dtbo > /sys/kernel/config/rp1-cfg/gpio_set_names

Where's the configfs support? This looks like a stale comment.

If this is the general purpose configfs interface for overlays, that's 
likely never going upstream. If you want this support, then you should 
load your overlay with the firmware loader instead of building it into 
the kernel. You can of course add that later.

> and is designed to be similar to what users are already used to
> from distro with downstream kernel.
> 
> For reasons why this driver is contained in drivers/misc, please
> check the links.
> 
> This driver is heavily based on downstream code from RaspberryPi
> Foundation, and the original author is Phil Elwell.
> 
> Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> Link: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
> Link: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
> Link: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
> Link: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/misc/Kconfig          |   1 +
>  drivers/misc/Makefile         |   1 +
>  drivers/misc/rp1/Kconfig      |  21 ++
>  drivers/misc/rp1/Makefile     |   3 +
>  drivers/misc/rp1/rp1-pci.dtso |   8 +
>  drivers/misc/rp1/rp1_pci.c    | 366 ++++++++++++++++++++++++++++++++++
>  drivers/misc/rp1/rp1_pci.h    |  14 ++
>  drivers/pci/quirks.c          |   1 +
>  include/linux/pci_ids.h       |   3 +
>  10 files changed, 419 insertions(+)
>  create mode 100644 drivers/misc/rp1/Kconfig
>  create mode 100644 drivers/misc/rp1/Makefile
>  create mode 100644 drivers/misc/rp1/rp1-pci.dtso
>  create mode 100644 drivers/misc/rp1/rp1_pci.c
>  create mode 100644 drivers/misc/rp1/rp1_pci.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fbdd8594aa7e..d67ba6d10aa8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19583,6 +19583,7 @@ F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
>  F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
>  F:	drivers/clk/clk-rp1.c
> +F:	drivers/misc/rp1/
>  F:	drivers/pinctrl/pinctrl-rp1.c
>  F:	include/dt-bindings/clock/rp1.h
>  F:	include/dt-bindings/misc/rp1.h
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 09cbe3f0ab1e..ffa4d8315c35 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -651,4 +651,5 @@ source "drivers/misc/uacce/Kconfig"
>  source "drivers/misc/pvpanic/Kconfig"
>  source "drivers/misc/mchp_pci1xxxx/Kconfig"
>  source "drivers/misc/keba/Kconfig"
> +source "drivers/misc/rp1/Kconfig"
>  endmenu
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index 40bf953185c7..3b6b07a23aac 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -74,3 +74,4 @@ lan966x-pci-objs		:= lan966x_pci.o
>  lan966x-pci-objs		+= lan966x_pci.dtbo.o
>  obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
>  obj-y				+= keba/
> +obj-$(CONFIG_MISC_RP1)		+= rp1/
> diff --git a/drivers/misc/rp1/Kconfig b/drivers/misc/rp1/Kconfig
> new file mode 100644
> index 000000000000..15c443e13389
> --- /dev/null
> +++ b/drivers/misc/rp1/Kconfig
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# RaspberryPi RP1 misc device
> +#
> +
> +config MISC_RP1
> +	tristate "RaspberryPi RP1 PCIe support"
> +	depends on OF_IRQ && PCI_MSI && PCI_QUIRKS
> +	select OF_OVERLAY
> +	select PCI_DYNAMIC_OF_NODES
> +	help
> +	  Support the RP1 peripheral chip found on Raspberry Pi 5 board.
> +
> +	  This device supports several sub-devices including e.g. Ethernet
> +	  controller, USB controller, I2C, SPI and UART.
> +
> +	  The driver is responsible for enabling the DT node once the PCIe
> +	  endpoint has been configured, and handling interrupts.
> +
> +	  This driver uses an overlay to load other drivers to support for
> +	  RP1 internal sub-devices.
> diff --git a/drivers/misc/rp1/Makefile b/drivers/misc/rp1/Makefile
> new file mode 100644
> index 000000000000..508b4cb05627
> --- /dev/null
> +++ b/drivers/misc/rp1/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_MISC_RP1)		+= rp1-pci.o
> +rp1-pci-objs			:= rp1_pci.o rp1-pci.dtbo.o
> diff --git a/drivers/misc/rp1/rp1-pci.dtso b/drivers/misc/rp1/rp1-pci.dtso
> new file mode 100644
> index 000000000000..0bf2f4bb18e6
> --- /dev/null
> +++ b/drivers/misc/rp1/rp1-pci.dtso
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/* the dts overlay is included from the dts directory so
> + * it can be possible to check it with CHECK_DTBS while
> + * also compile it from the driver source directory.

I haven't tried, but I think if you set CHECK_DTBS=y, then this file 
will get checked. Applying it to the base DT will not though.

> + */
> +
> +#include "arm64/broadcom/rp1.dtso"
> diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> new file mode 100644
> index 000000000000..0dd345341c6f
> --- /dev/null
> +++ b/drivers/misc/rp1/rp1_pci.c
> @@ -0,0 +1,366 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> + * All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/msi.h>
> +#include <linux/of_platform.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +
> +#include "rp1_pci.h"
> +
> +#define RP1_DRIVER_NAME		"rp1"
> +
> +#define RP1_HW_IRQ_MASK		GENMASK(5, 0)
> +
> +#define REG_SET			0x800
> +#define REG_CLR			0xc00
> +
> +/* MSI-X CFG registers start at 0x8 */
> +#define MSIX_CFG(x) (0x8 + (4 * (x)))
> +
> +#define MSIX_CFG_IACK_EN        BIT(3)
> +#define MSIX_CFG_IACK           BIT(2)
> +#define MSIX_CFG_ENABLE         BIT(0)
> +
> +/* Address map */
> +#define RP1_PCIE_APBS_BASE	0x108000
> +
> +/* Interrupts */
> +#define RP1_INT_IO_BANK0	0
> +#define RP1_INT_IO_BANK1	1
> +#define RP1_INT_IO_BANK2	2
> +#define RP1_INT_AUDIO_IN	3
> +#define RP1_INT_AUDIO_OUT	4
> +#define RP1_INT_PWM0		5
> +#define RP1_INT_ETH		6
> +#define RP1_INT_I2C0		7
> +#define RP1_INT_I2C1		8
> +#define RP1_INT_I2C2		9
> +#define RP1_INT_I2C3		10
> +#define RP1_INT_I2C4		11
> +#define RP1_INT_I2C5		12
> +#define RP1_INT_I2C6		13
> +#define RP1_INT_I2S0		14
> +#define RP1_INT_I2S1		15
> +#define RP1_INT_I2S2		16
> +#define RP1_INT_SDIO0		17
> +#define RP1_INT_SDIO1		18
> +#define RP1_INT_SPI0		19
> +#define RP1_INT_SPI1		20
> +#define RP1_INT_SPI2		21
> +#define RP1_INT_SPI3		22
> +#define RP1_INT_SPI4		23
> +#define RP1_INT_SPI5		24
> +#define RP1_INT_UART0		25
> +#define RP1_INT_TIMER_0		26
> +#define RP1_INT_TIMER_1		27
> +#define RP1_INT_TIMER_2		28
> +#define RP1_INT_TIMER_3		29
> +#define RP1_INT_USBHOST0	30
> +#define RP1_INT_USBHOST0_0	31
> +#define RP1_INT_USBHOST0_1	32
> +#define RP1_INT_USBHOST0_2	33
> +#define RP1_INT_USBHOST0_3	34
> +#define RP1_INT_USBHOST1	35
> +#define RP1_INT_USBHOST1_0	36
> +#define RP1_INT_USBHOST1_1	37
> +#define RP1_INT_USBHOST1_2	38
> +#define RP1_INT_USBHOST1_3	39
> +#define RP1_INT_DMA		40
> +#define RP1_INT_PWM1		41
> +#define RP1_INT_UART1		42
> +#define RP1_INT_UART2		43
> +#define RP1_INT_UART3		44
> +#define RP1_INT_UART4		45
> +#define RP1_INT_UART5		46
> +#define RP1_INT_MIPI0		47
> +#define RP1_INT_MIPI1		48
> +#define RP1_INT_VIDEO_OUT	49
> +#define RP1_INT_PIO_0		50
> +#define RP1_INT_PIO_1		51
> +#define RP1_INT_ADC_FIFO	52
> +#define RP1_INT_PCIE_OUT	53
> +#define RP1_INT_SPI6		54
> +#define RP1_INT_SPI7		55
> +#define RP1_INT_SPI8		56
> +#define RP1_INT_SYSCFG		58
> +#define RP1_INT_CLOCKS_DEFAULT	59
> +#define RP1_INT_VBUSCTRL	60
> +#define RP1_INT_PROC_MISC	57

Why all these defines which will never be used because they come from 
DT?

Rob

