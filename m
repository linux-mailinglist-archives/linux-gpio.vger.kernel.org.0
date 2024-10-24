Return-Path: <linux-gpio+bounces-11968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 506939AEA4D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 17:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 107192837FE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 15:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556B31EB9E9;
	Thu, 24 Oct 2024 15:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="S+uNyVkd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0FD1DE2C0
	for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729783328; cv=none; b=GCy8fY76FMCn2QBbRzXkZEbykhPyjlTizReHe4OT4A0rA8sj4/xFviBoEBcUt7AgOtVqGSCCg54P6P0ekVMxMA6HHq85K53auW2c2AaanATW7j5njqNEl/LgckQpvFdhGWrxBSPSxXD6C7v1umftpPoIPmvvmB3Iu6mugL823iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729783328; c=relaxed/simple;
	bh=XocVbR1dDRuZlBCmo72di28ETlVvLHfmRCP/TVb8cvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puHs0ImZWox8t62qx8IP4neTGyDArqqSucTWLSh5m7SyIDdg92ygyTdMXuf4fUDAiUHNBp8DkLrymL/15Nm6mHl7F34fDJAsfjmHPZszbYzjzlGaq1fadkjRTz95qV8+x/wMrcNcBfK/Ocdx+qr8kuCZyeGT3x/PTXA3aFXycFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=S+uNyVkd; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e2e3179b224so1223449276.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Oct 2024 08:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729783322; x=1730388122; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZslJuvb+R+D3hqqInl+Fp2NtOHuMudVWO0vmTv/PdQ=;
        b=S+uNyVkdF5o9hCWuccLGo12mfVUa43GbRDW5Ak2DmkyCzIjaUhRX2AtsGBL1esmM1T
         /5xRU1l35rH9zqwcjhHAE4IyZrn/M8a7LU5tPcqAsQdmNkndHXeRolCLAgCCz0rgM3mi
         qG0hm6lKQeZQEz71mCiDMx5qRHxOEUrFfxeoxEDumUOiTxtDj237mzOfpvAwmVBe1+7C
         MVL5gLbfYiXD25LdvGYi59/2bXPEQ1o0a4jnH5n0c8tKN1z9gQi7drk85ymuwqKqNZTl
         PDXNvPg7XOzcBFBGBIY0Ju+nWm/Qilmxeabeir/zio+/i6GrZECe8afARXAYlevNdofb
         yWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729783322; x=1730388122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZslJuvb+R+D3hqqInl+Fp2NtOHuMudVWO0vmTv/PdQ=;
        b=UsK8EHpZs+OgpsqOqiBOVfgt+X+iMN4zZt8I4wrMkRbBYOvDEhzRaoR+CFehfshS34
         DaZXsj26vOJMyV1GNqyFUbCjbk4XnQXnJ1/UYCpXwjXI01yfE66Z+cGR2sGuj/xg7Y9l
         L++GRUKK1TMOtbpyGdf0oyqovLYZRNaPKy1w7Gg1pzwTs1CWl/L0/FkCI3HCWR64WQYw
         lVI3AgwjKHcYY2oL4pNgOUoDrBZAYuIbuiDiyy+jNKFXOYrQqxksTtHMwwQyVj3uECMQ
         50YlThD1xCZer15TNKyjDZxR/LON/L79PIYc8emfRIqDUk/PmuOmgQCDAPzhfhRsahid
         afGA==
X-Forwarded-Encrypted: i=1; AJvYcCVFe1ZVtJ9CPgW860y6oFW29sNdjGCcqAkMHe9D3wJLyBIglH2TWTeR8pTBF0mK4qpRKKweqrAWxQKK@vger.kernel.org
X-Gm-Message-State: AOJu0YyM1XSCh6BIxYum0nG6vn5YR/B91kVRJXvz1tWgtpcsODhowIMu
	JaILDAoDrzvhg6fmVfrk1jaFB+O99kvT8QExYQt68Ixl4PoEq0aw/y14d9nDaoc4bh3zZyCZ4ez
	1k+Z54E3A90Wab/9X06lI0hTSB92g9Pic6d1MGQ==
X-Google-Smtp-Source: AGHT+IGwL+oDyt9AiqU8vRnCAfR1pHe5h5kqQWEB+rUAizTZZV2tYZZJwpQjdyjZy0CycLEd//ANCOcPXsLPXTGu7mI=
X-Received: by 2002:a05:690c:708a:b0:6e2:7dd:af66 with SMTP id
 00721157ae682-6e7f0e72ea7mr77409107b3.19.1729783322369; Thu, 24 Oct 2024
 08:22:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728300189.git.andrea.porta@suse.com> <c5b072393d2dc157d34f6dbeff6261d142d4de69.1728300190.git.andrea.porta@suse.com>
In-Reply-To: <c5b072393d2dc157d34f6dbeff6261d142d4de69.1728300190.git.andrea.porta@suse.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 24 Oct 2024 16:21:46 +0100
Message-ID: <CAPY8ntC0B0RdNmvGMaDcp-p9gZOcWBbeC6BjbcihrijRXjRVkA@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] misc: rp1: RaspberryPi RP1 misc driver
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

Hi Andrea

On Mon, 7 Oct 2024 at 14:07, Andrea della Porta <andrea.porta@suse.com> wrote:
>
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
>
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
>  drivers/misc/rp1/Kconfig      |  24 +++
>  drivers/misc/rp1/Makefile     |   5 +
>  drivers/misc/rp1/rp1-pci.dtso |   8 +
>  drivers/misc/rp1/rp1_pci.c    | 365 ++++++++++++++++++++++++++++++++++
>  drivers/misc/rp1/rp1_pci.h    |  14 ++
>  drivers/pci/quirks.c          |   1 +
>  include/linux/pci_ids.h       |   3 +
>  10 files changed, 423 insertions(+)
>  create mode 100644 drivers/misc/rp1/Kconfig
>  create mode 100644 drivers/misc/rp1/Makefile
>  create mode 100644 drivers/misc/rp1/rp1-pci.dtso
>  create mode 100644 drivers/misc/rp1/rp1_pci.c
>  create mode 100644 drivers/misc/rp1/rp1_pci.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 510a071ede78..032678fb2470 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19389,6 +19389,7 @@ F:      Documentation/devicetree/bindings/misc/pci1de4,1.yaml
>  F:     Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
>  F:     Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
>  F:     drivers/clk/clk-rp1.c
> +F:     drivers/misc/rp1/
>  F:     drivers/pinctrl/pinctrl-rp1.c
>  F:     include/dt-bindings/clock/rp1.h
>  F:     include/dt-bindings/misc/rp1.h
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 3fe7e2a9bd29..ac85cb154100 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -628,4 +628,5 @@ source "drivers/misc/uacce/Kconfig"
>  source "drivers/misc/pvpanic/Kconfig"
>  source "drivers/misc/mchp_pci1xxxx/Kconfig"
>  source "drivers/misc/keba/Kconfig"
> +source "drivers/misc/rp1/Kconfig"
>  endmenu
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index a9f94525e181..ae86d69997b4 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -72,3 +72,4 @@ obj-$(CONFIG_TPS6594_PFSM)    += tps6594-pfsm.o
>  obj-$(CONFIG_NSM)              += nsm.o
>  obj-$(CONFIG_MARVELL_CN10K_DPI)        += mrvl_cn10k_dpi.o
>  obj-y                          += keba/
> +obj-$(CONFIG_MISC_RP1)         += rp1/
> diff --git a/drivers/misc/rp1/Kconfig b/drivers/misc/rp1/Kconfig
> new file mode 100644
> index 000000000000..29b1fc2fc4af
> --- /dev/null
> +++ b/drivers/misc/rp1/Kconfig
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# RaspberryPi RP1 misc device
> +#
> +
> +config MISC_RP1
> +        tristate "RaspberryPi RP1 PCIe support"
> +        depends on PCI && PCI_QUIRKS
> +        select OF
> +        select OF_IRQ
> +        select OF_OVERLAY
> +        select IRQ_DOMAIN
> +        select PCI_DYNAMIC_OF_NODES
> +        help
> +          Support the RP1 peripheral chip found on Raspberry Pi 5 board.
> +
> +          This device supports several sub-devices including e.g. Ethernet
> +         controller, USB controller, I2C, SPI and UART.
> +
> +          The driver is responsible for enabling the DT node once the PCIe
> +         endpoint has been configured, and handling interrupts.
> +
> +          This driver uses an overlay to load other drivers to support for
> +         RP1 internal sub-devices.
> diff --git a/drivers/misc/rp1/Makefile b/drivers/misc/rp1/Makefile
> new file mode 100644
> index 000000000000..70384f5a7d7d
> --- /dev/null
> +++ b/drivers/misc/rp1/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_MISC_RP1)         += rp1-pci.o
> +rp1-pci-objs                   := rp1_pci.o rp1-pci.dtbo.o
> +
> +DTC_FLAGS_rp1-pci += -@
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
> + */
> +
> +#include "arm64/broadcom/rp1.dtso"
> diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> new file mode 100644
> index 000000000000..a1f7bf1804c0
> --- /dev/null
> +++ b/drivers/misc/rp1/rp1_pci.c
> @@ -0,0 +1,365 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> + * All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
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
> +#include <linux/reset.h>
> +
> +#include "rp1_pci.h"
> +
> +#define RP1_DRIVER_NAME                "rp1"
> +
> +#define RP1_HW_IRQ_MASK                GENMASK(5, 0)
> +
> +#define REG_SET                        0x800
> +#define REG_CLR                        0xc00
> +
> +/* MSI-X CFG registers start at 0x8 */
> +#define MSIX_CFG(x) (0x8 + (4 * (x)))
> +
> +#define MSIX_CFG_IACK_EN        BIT(3)
> +#define MSIX_CFG_IACK           BIT(2)
> +#define MSIX_CFG_ENABLE         BIT(0)
> +
> +/* Address map */
> +#define RP1_PCIE_APBS_BASE     0x108000
> +
> +/* Interrupts */
> +#define RP1_INT_IO_BANK0       0
> +#define RP1_INT_IO_BANK1       1
> +#define RP1_INT_IO_BANK2       2
> +#define RP1_INT_AUDIO_IN       3
> +#define RP1_INT_AUDIO_OUT      4
> +#define RP1_INT_PWM0           5
> +#define RP1_INT_ETH            6
> +#define RP1_INT_I2C0           7
> +#define RP1_INT_I2C1           8
> +#define RP1_INT_I2C2           9
> +#define RP1_INT_I2C3           10
> +#define RP1_INT_I2C4           11
> +#define RP1_INT_I2C5           12
> +#define RP1_INT_I2C6           13
> +#define RP1_INT_I2S0           14
> +#define RP1_INT_I2S1           15
> +#define RP1_INT_I2S2           16
> +#define RP1_INT_SDIO0          17
> +#define RP1_INT_SDIO1          18
> +#define RP1_INT_SPI0           19
> +#define RP1_INT_SPI1           20
> +#define RP1_INT_SPI2           21
> +#define RP1_INT_SPI3           22
> +#define RP1_INT_SPI4           23
> +#define RP1_INT_SPI5           24
> +#define RP1_INT_UART0          25
> +#define RP1_INT_TIMER_0                26
> +#define RP1_INT_TIMER_1                27
> +#define RP1_INT_TIMER_2                28
> +#define RP1_INT_TIMER_3                29
> +#define RP1_INT_USBHOST0       30
> +#define RP1_INT_USBHOST0_0     31
> +#define RP1_INT_USBHOST0_1     32
> +#define RP1_INT_USBHOST0_2     33
> +#define RP1_INT_USBHOST0_3     34
> +#define RP1_INT_USBHOST1       35
> +#define RP1_INT_USBHOST1_0     36
> +#define RP1_INT_USBHOST1_1     37
> +#define RP1_INT_USBHOST1_2     38
> +#define RP1_INT_USBHOST1_3     39
> +#define RP1_INT_DMA            40
> +#define RP1_INT_PWM1           41
> +#define RP1_INT_UART1          42
> +#define RP1_INT_UART2          43
> +#define RP1_INT_UART3          44
> +#define RP1_INT_UART4          45
> +#define RP1_INT_UART5          46
> +#define RP1_INT_MIPI0          47
> +#define RP1_INT_MIPI1          48
> +#define RP1_INT_VIDEO_OUT      49
> +#define RP1_INT_PIO_0          50
> +#define RP1_INT_PIO_1          51
> +#define RP1_INT_ADC_FIFO       52
> +#define RP1_INT_PCIE_OUT       53
> +#define RP1_INT_SPI6           54
> +#define RP1_INT_SPI7           55
> +#define RP1_INT_SPI8           56
> +#define RP1_INT_SYSCFG         58
> +#define RP1_INT_CLOCKS_DEFAULT 59
> +#define RP1_INT_VBUSCTRL       60
> +#define RP1_INT_PROC_MISC      57
> +#define RP1_INT_END            61
> +
> +struct rp1_dev {
> +       struct pci_dev *pdev;
> +       struct device *dev;
> +       struct clk *sys_clk;
> +       struct irq_domain *domain;
> +       struct irq_data *pcie_irqds[64];
> +       void __iomem *bar1;
> +       int ovcs_id;
> +       bool level_triggered_irq[RP1_INT_END];
> +};
> +
> +static void dump_bar(struct pci_dev *pdev, unsigned int bar)
> +{
> +       dev_info(&pdev->dev,
> +                "bar%d %pR\n",
> +                bar,
> +                pci_resource_n(pdev, bar));
> +}
> +
> +static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
> +{
> +       iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_SET + MSIX_CFG(hwirq));
> +}
> +
> +static void msix_cfg_clr(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
> +{
> +       iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_CLR + MSIX_CFG(hwirq));
> +}
> +
> +static void rp1_mask_irq(struct irq_data *irqd)
> +{
> +       struct rp1_dev *rp1 = irqd->domain->host_data;
> +       struct irq_data *pcie_irqd = rp1->pcie_irqds[irqd->hwirq];
> +
> +       pci_msi_mask_irq(pcie_irqd);
> +}
> +
> +static void rp1_unmask_irq(struct irq_data *irqd)
> +{
> +       struct rp1_dev *rp1 = irqd->domain->host_data;
> +       struct irq_data *pcie_irqd = rp1->pcie_irqds[irqd->hwirq];
> +
> +       pci_msi_unmask_irq(pcie_irqd);
> +}
> +
> +static int rp1_irq_set_type(struct irq_data *irqd, unsigned int type)
> +{
> +       struct rp1_dev *rp1 = irqd->domain->host_data;
> +       unsigned int hwirq = (unsigned int)irqd->hwirq;
> +
> +       switch (type) {
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               dev_dbg(rp1->dev, "MSIX IACK EN for irq %d\n", hwirq);
> +               msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK_EN);
> +               rp1->level_triggered_irq[hwirq] = true;
> +       break;
> +       case IRQ_TYPE_EDGE_RISING:
> +               msix_cfg_clr(rp1, hwirq, MSIX_CFG_IACK_EN);
> +               rp1->level_triggered_irq[hwirq] = false;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static struct irq_chip rp1_irq_chip = {
> +       .name            = "rp1_irq_chip",
> +       .irq_mask        = rp1_mask_irq,
> +       .irq_unmask      = rp1_unmask_irq,
> +       .irq_set_type    = rp1_irq_set_type,
> +};
> +
> +static void rp1_chained_handle_irq(struct irq_desc *desc)
> +{
> +       unsigned int hwirq = desc->irq_data.hwirq & RP1_HW_IRQ_MASK;
> +       struct rp1_dev *rp1 = irq_desc_get_handler_data(desc);
> +       struct irq_chip *chip = irq_desc_get_chip(desc);
> +       int virq;
> +
> +       chained_irq_enter(chip, desc);
> +
> +       virq = irq_find_mapping(rp1->domain, hwirq);
> +       generic_handle_irq(virq);
> +       if (rp1->level_triggered_irq[hwirq])
> +               msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK);
> +
> +       chained_irq_exit(chip, desc);
> +}
> +
> +static int rp1_irq_xlate(struct irq_domain *d, struct device_node *node,
> +                        const u32 *intspec, unsigned int intsize,
> +                        unsigned long *out_hwirq, unsigned int *out_type)
> +{
> +       struct rp1_dev *rp1 = d->host_data;
> +       struct irq_data *pcie_irqd;
> +       unsigned long hwirq;
> +       int pcie_irq;
> +       int ret;
> +
> +       ret = irq_domain_xlate_twocell(d, node, intspec, intsize,
> +                                      &hwirq, out_type);
> +       if (ret)
> +               return ret;
> +
> +       pcie_irq = pci_irq_vector(rp1->pdev, hwirq);
> +       pcie_irqd = irq_get_irq_data(pcie_irq);
> +       rp1->pcie_irqds[hwirq] = pcie_irqd;
> +       *out_hwirq = hwirq;
> +
> +       return 0;
> +}
> +
> +static int rp1_irq_activate(struct irq_domain *d, struct irq_data *irqd,
> +                           bool reserve)
> +{
> +       struct rp1_dev *rp1 = d->host_data;
> +
> +       msix_cfg_set(rp1, (unsigned int)irqd->hwirq, MSIX_CFG_ENABLE);
> +
> +       return 0;
> +}
> +
> +static void rp1_irq_deactivate(struct irq_domain *d, struct irq_data *irqd)
> +{
> +       struct rp1_dev *rp1 = d->host_data;
> +
> +       msix_cfg_clr(rp1, (unsigned int)irqd->hwirq, MSIX_CFG_ENABLE);
> +}
> +
> +static const struct irq_domain_ops rp1_domain_ops = {
> +       .xlate      = rp1_irq_xlate,
> +       .activate   = rp1_irq_activate,
> +       .deactivate = rp1_irq_deactivate,
> +};
> +
> +static int rp1_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct device_node *rp1_node;
> +       struct reset_control *reset;
> +       struct rp1_dev *rp1;
> +       int err  = 0;
> +       int i;
> +
> +       rp1_node = dev_of_node(dev);
> +       if (!rp1_node) {
> +               dev_err(dev, "Missing of_node for device\n");
> +               return -EINVAL;
> +       }
> +
> +       rp1 = devm_kzalloc(&pdev->dev, sizeof(*rp1), GFP_KERNEL);
> +       if (!rp1)
> +               return -ENOMEM;
> +
> +       rp1->pdev = pdev;
> +       rp1->dev = &pdev->dev;
> +
> +       reset = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +       if (IS_ERR(reset))
> +               return PTR_ERR(reset);
> +       reset_control_reset(reset);
> +
> +       dump_bar(pdev, 0);
> +       dump_bar(pdev, 1);
> +
> +       if (pci_resource_len(pdev, 1) <= 0x10000) {
> +               dev_err(&pdev->dev,
> +                       "Not initialised - is the firmware running?\n");
> +               return -EINVAL;
> +       }
> +
> +       err = pcim_enable_device(pdev);
> +       if (err < 0) {
> +               dev_err(&pdev->dev, "Enabling PCI device has failed: %d",
> +                       err);
> +               return err;
> +       }
> +
> +       rp1->bar1 = pcim_iomap(pdev, 1, 0);
> +       if (!rp1->bar1) {
> +               dev_err(&pdev->dev, "Cannot map PCI BAR\n");
> +               return -EIO;
> +       }
> +
> +       u32 dtbo_size = __dtbo_rp1_pci_end - __dtbo_rp1_pci_begin;
> +       void *dtbo_start = __dtbo_rp1_pci_begin;
> +
> +       err = of_overlay_fdt_apply(dtbo_start, dtbo_size, &rp1->ovcs_id, rp1_node);
> +       if (err)
> +               return err;
> +
> +       pci_set_master(pdev);
> +
> +       err = pci_alloc_irq_vectors(pdev, RP1_INT_END, RP1_INT_END,
> +                                   PCI_IRQ_MSIX);
> +       if (err != RP1_INT_END) {
> +               dev_err(&pdev->dev, "pci_alloc_irq_vectors failed - %d\n", err);
> +               goto err_unload_overlay;
> +       }
> +
> +       pci_set_drvdata(pdev, rp1);
> +       rp1->domain = irq_domain_add_linear(of_find_node_by_name(NULL, "pci-ep-bus"), RP1_INT_END,
> +                                           &rp1_domain_ops, rp1);
> +
> +       for (i = 0; i < RP1_INT_END; i++) {
> +               int irq = irq_create_mapping(rp1->domain, i);
> +
> +               if (irq < 0) {
> +                       dev_err(&pdev->dev, "failed to create irq mapping\n");
> +                       err = irq;
> +                       goto err_unload_overlay;
> +               }
> +               irq_set_chip_and_handler(irq, &rp1_irq_chip, handle_level_irq);
> +               irq_set_probe(irq);
> +               irq_set_chained_handler_and_data(pci_irq_vector(pdev, i),
> +                                                rp1_chained_handle_irq, rp1);
> +       }
> +
> +       err = of_platform_default_populate(rp1_node, NULL, dev);
> +       if (err)
> +               goto err_unload_overlay;
> +
> +       return 0;
> +
> +err_unload_overlay:
> +       of_overlay_remove(&rp1->ovcs_id);
> +
> +       return err;
> +}
> +
> +static void rp1_remove(struct pci_dev *pdev)
> +{
> +       struct rp1_dev *rp1 = pci_get_drvdata(pdev);
> +       struct device *dev = &pdev->dev;
> +
> +       of_platform_depopulate(dev);
> +       of_overlay_remove(&rp1->ovcs_id);
> +
> +       clk_unregister(rp1->sys_clk);
> +}
> +
> +static const struct pci_device_id dev_id_table[] = {
> +       { PCI_DEVICE(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0), },
> +       { 0, }
> +};

You need a

MODULE_DEVICE_TABLE(pci, dev_id_table);

here in order to load the module for the cases where it isn't
built-in. Otherwise you have to manually modprobe the module.

Cheers.
  Dave

> +
> +static struct pci_driver rp1_driver = {
> +       .name           = RP1_DRIVER_NAME,
> +       .id_table       = dev_id_table,
> +       .probe          = rp1_probe,
> +       .remove         = rp1_remove,
> +};
> +
> +module_pci_driver(rp1_driver);
> +
> +MODULE_AUTHOR("Phil Elwell <phil@raspberrypi.com>");
> +MODULE_AUTHOR("Andrea della Porta <andrea.porta@suse.com>");
> +MODULE_DESCRIPTION("RP1 wrapper");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/misc/rp1/rp1_pci.h b/drivers/misc/rp1/rp1_pci.h
> new file mode 100644
> index 000000000000..7982f13bad9b
> --- /dev/null
> +++ b/drivers/misc/rp1/rp1_pci.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> + * All rights reserved.
> + */
> +
> +#ifndef _RP1_EXTERN_H_
> +#define _RP1_EXTERN_H_
> +
> +extern char __dtbo_rp1_pci_begin[];
> +extern char __dtbo_rp1_pci_end[];
> +
> +#endif
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index dccb60c1d9cc..41e77d94ff73 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -6266,6 +6266,7 @@ DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0xa76e, dpc_log_size);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5020, of_pci_make_dev_node);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_XILINX, 0x5021, of_pci_make_dev_node);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_REDHAT, 0x0005, of_pci_make_dev_node);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_RPI, PCI_DEVICE_ID_RPI_RP1_C0, of_pci_make_dev_node);
>
>  /*
>   * Devices known to require a longer delay before first config space access
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 4cf6aaed5f35..c7e6cd10ac52 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2611,6 +2611,9 @@
>  #define PCI_VENDOR_ID_TEKRAM           0x1de1
>  #define PCI_DEVICE_ID_TEKRAM_DC290     0xdc29
>
> +#define PCI_VENDOR_ID_RPI              0x1de4
> +#define PCI_DEVICE_ID_RPI_RP1_C0       0x0001
> +
>  #define PCI_VENDOR_ID_ALIBABA          0x1ded
>
>  #define PCI_VENDOR_ID_CXL              0x1e98
> --
> 2.35.3
>
>

