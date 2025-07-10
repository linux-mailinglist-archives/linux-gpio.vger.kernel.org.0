Return-Path: <linux-gpio+bounces-23109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED47B00BC9
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 21:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 119725C365B
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 19:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CF82FCFE1;
	Thu, 10 Jul 2025 19:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X96A0IEL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFDA25760;
	Thu, 10 Jul 2025 19:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752174332; cv=none; b=oY+a+MqSFzOwmHyiHnQKiDlpsmqAW3cDtfY0Zt62jgJ/yZVI+dWRI6ZoqdPceuZcNlui2mmA7dzYVEqmabxj7POkTb/AWXgN464CUrs11w84N6Vu9BAFNdIDsdwwHbvlzFYwtqivpzMVwp5O6/ZRk8qpgL7n00zv4TYY8NT8vmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752174332; c=relaxed/simple;
	bh=nq4P94K7NnOvJLO8d45yCqbCaMd8n4bXcI1o6Gfq3qw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hIYAL8e9qVx1ufcZPOFU9JwRJjcTeXke/CI5IibqBfU6rMk6Hdejldoqv2CSdPKMVQFgkStWwPJ1Vxtth6xj56IXghuzPqVTsSf9Mez6GKRQvy6Lfiz2vbYcSLEbWmCRxjmDPWpOGboTtUwya59BfaIVSoWnWivv2aZ5S/hgHxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X96A0IEL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0C6C4CEE3;
	Thu, 10 Jul 2025 19:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752174332;
	bh=nq4P94K7NnOvJLO8d45yCqbCaMd8n4bXcI1o6Gfq3qw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=X96A0IELAv9SZ+VR9k5w1AOOMqUPUNQPhx1ShNNNKQjHciKOHXAwwsY9qGO414uwW
	 kCXUcpbDLDcuuTxNAKgRFqIQkS9RS5/S/lZwKIiOT/wz8pmOwOq9Ywlb/xvPb/O5vz
	 qhqMy8PfkV/Fip2oIPkhJ++NuawPVySEBOvRST+MYkhIZdNgaXfKWoOiEZY3ohSz81
	 JFDw/JLN1IkcDNMSslHlhmwlFJF8hNQKFTQ0lh6PjTNXU1OjhaIBYInsC5eExxvOQ1
	 8DCQM+IrdfWeemAhKzR2gXls8PIys6WGoZo+FNEyZipC3r9dhVTaLrs+EE5N7ZG2kP
	 E7kkAqiipgt4w==
Date: Thu, 10 Jul 2025 14:05:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: imx@lists.linux.dev, s32@nxp.com, eballetb@redhat.com, 
 festevam@gmail.com, linux-arm-kernel@lists.infradead.org, rafael@kernel.org, 
 shawnguo@kernel.org, clizzi@redhat.com, brgl@bgdev.pl, aisheng.dong@nxp.com, 
 devicetree@vger.kernel.org, s.hauer@pengutronix.de, 
 Ghennadi.Procopciuc@nxp.com, linus.walleij@linaro.org, 
 gregkh@linuxfoundation.org, ping.bai@nxp.com, echanude@redhat.com, 
 aruizrui@redhat.com, mbrugger@suse.com, chester62515@gmail.com, 
 conor+dt@kernel.org, srini@kernel.org, larisa.grigore@nxp.com, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, lee@kernel.org, 
 linux-gpio@vger.kernel.org, vincent.guittot@linaro.org, 
 kernel@pengutronix.de
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
Message-Id: <175217427055.3135637.1158613245040167779.robh@kernel.org>
Subject: Re: [PATCH v7 00/12] gpio: siul2-s32g2: add initial GPIO driver


On Thu, 10 Jul 2025 17:20:23 +0300, Andrei Stefanescu wrote:
> This patch series adds support for basic GPIO
> operations(set, get, direction_output/input, set_config).
> 
> There are two SIUL2 hardware modules: SIUL2_0 and SIUL2_1.
> However, this driver exports both as a single GPIO driver.
> This is because the interrupt registers are located only
> in SIUL2_1, even for GPIOs that are part of SIUL2_0.
> 
> There are two gaps in the GPIO ranges:
> - 102-111(inclusive) are invalid
> - 123-143(inclusive) are invalid
> 
> These will be excluded via the `gpio-reserved-ranges`
> property.
> 
> Writing and reading GPIO values is done via the PGPDO/PGPDI
> registers(Parallel GPIO Pad Data Output/Input) which are
> 16 bit registers, each bit corresponding to a GPIO.
> 
> Note that the PGPDO order is similar to a big-endian grouping
> of two registers:
> PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.
> 
> I have other patches for this driver:
> - interrupt support
> - power management callbacks
> 
> which I plan to upstream after this series gets merged
> in order to simplify the review process.
> 
> v7 -> v6
> - fixed MAINTAINERS wrong file path
> - add unevaluatedProperties, change siul2 node name, remove
>   jtag_pins label in the device tree schema
> - change compatible definition in schema
> - change node name in dtsi
> - mentioned binding deprecation in commit messages
> - split mfd cell conversion commit in two: one for the
>   previous refactoring, one for the mfd cell conversion
> - removed Acked-by: Linus Walleij from commit:
>   "pinctrl: s32: convert the driver into an mfd cell"
>   because of changes to that commit
> - deprecate the nxp,s32g2-siul2-pinctrl binding
> - add NVMEM MFD cell for SIUL2
> - made the GPIO driver not export invalid pins
>   (there are some gaps 102-111, 123-143)
> - removed the need for gpio-reserved-ranges
> - force initialized pinctrl_desc->num_custom_params to 0
> 
> v6 -> v5
> - removed description for reg in the dt-bindings and added
>   maxItems
> - dropped label for example in the dt-bindings
> - simplified the example in the dt-bindings
> - changed dt-bindings filename to nxp,s32g2-siul2.yaml
> - changed title in the dt-bindings
> - dropped minItmes from gpio-ranges/gpio-reserved-ranges
>   and added maxItems to gpio-reserved-ranges
> - added required block for -grp[0-9]$ nodes
> - switch to using "" as quotes
> - kernel test robot: fixed frame sizes, added description
>   for reg_name, fixed typo in gpio_configs_lock, removed
>   uninitialized ret variable usage
> - ordered includes in nxp-siul2.c, switched to dev-err-probe
>   added a mention that other commits will add nvmem functionality
>   to the mfd driver
> - switched spin_lock_irqsave to scoped_guard statement
> - switched dev_err to dev_err_probe in pinctrl-s32cc in places
>   reached during the probing part
> 
> v5 -> v4
> - fixed di_div error
> - fixed dt-bindings error
> - added Co-developed-by tags
> - added new MFD driver nxp-siul2.c
> - made the old pinctrl driver an MFD cell
> - added the GPIO driver in the existing SIUL2 pinctrl one
> - Switch from "devm_pinctrl_register" to
>   "devm_pinctrl_register_and_init"
> 
> v4 -> v3
> - removed useless parentheses
> - added S32G3 fallback compatible
> - fixed comment alignment
> - fixed dt-bindings license
> - fixed modpost: "__udivdi3"
> - moved MAINTAINERS entry to have the new GPIO driver
>   together with other files related to S32G
> 
> v3 -> v2
> - fix dt-bindings schema id
> - add maxItems to gpio-ranges
> - removed gpio label from dt-bindings example
> - added changelog for the MAINTAINERS commit and
>   added separate entry for the SIUL2 GPIO driver
> - added guard(raw_spinlock_irqsave) in
>   'siul2_gpio_set_direction'
> - updated the description for
>   'devm_platform_get_and_ioremap_resource_byname'
> 
> v2 -> v1
> dt-bindings:
> - changed filename to match compatible
> - fixed commit messages
> - removed dt-bindings unnecessary properties descriptions
> - added minItems for the interrupts property
> driver:
> - added depends on ARCH_S32 || COMPILE_TEST to Kconfig
> - added select REGMAP_MMIO to Kconfig
> - remove unnecessary include
> - add of_node_put after `siul2_get_gpio_pinspec`
> - removed inline from function definitions
> - removed match data and moved the previous platdata
>   definition to the top of the file to be visible
> - replace bitmap_set/clear with __clear_bit/set_bit
>   and devm_bitmap_zalloc with devm_kzalloc
> - switched to gpiochip_generic_request/free/config
> - fixed dev_err format for size_t reported by
>   kernel test robot
> - add platform_get_and_ioremap_resource_byname wrapper
> 
> Andrei Stefanescu (12):
>   dt-bindings: mfd: add support for the NXP SIUL2 module
>   mfd: nxp-siul2: add support for NXP SIUL2
>   arm64: dts: s32g: change pinctrl node into the new mfd node
>   pinctrl: s32cc: small refactoring
>   pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
>   dt-bindings: pinctrl: deprecate SIUL2 pinctrl bindings
>   pinctrl: s32g2: change the driver to also be probed as an MFD cell
>   pinctrl: s32cc: implement GPIO functionality
>   MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
>   nvmem: s32g2_siul2: add NVMEM driver for SoC information
>   MAINTAINERS: add MAINTAINER for NXP SIUL2 NVMEM cell
>   pinctrl: s32cc: set num_custom_params to 0
> 
>  .../bindings/mfd/nxp,s32g2-siul2.yaml         | 163 +++++
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |   2 +
>  MAINTAINERS                                   |   3 +
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      |  48 +-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      |  48 +-
>  drivers/mfd/Kconfig                           |  12 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/nxp-siul2.c                       | 414 +++++++++++
>  drivers/nvmem/Kconfig                         |  10 +
>  drivers/nvmem/Makefile                        |   2 +
>  drivers/nvmem/s32g2_siul2_nvmem.c             | 232 +++++++
>  drivers/pinctrl/nxp/pinctrl-s32.h             |   4 +-
>  drivers/pinctrl/nxp/pinctrl-s32cc.c           | 652 ++++++++++++++----
>  drivers/pinctrl/nxp/pinctrl-s32g2.c           |  32 +-
>  include/linux/mfd/nxp-siul2.h                 |  55 ++
>  15 files changed, 1502 insertions(+), 176 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
>  create mode 100644 drivers/mfd/nxp-siul2.c
>  create mode 100644 drivers/nvmem/s32g2_siul2_nvmem.c
>  create mode 100644 include/linux/mfd/nxp-siul2.h
> 
> --
> 2.45.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.16-rc3-116-ge34a79b96ab9 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com:

arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: pinctrl@4009c000 (nxp,s32g3-siul2): 'gpio-reserved-ranges' does not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: pinctrl@4009c000 (nxp,s32g2-siul2): 'gpio-reserved-ranges' does not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: pinctrl@4009c000 (nxp,s32g2-siul2): 'gpio-reserved-ranges' does not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml#






