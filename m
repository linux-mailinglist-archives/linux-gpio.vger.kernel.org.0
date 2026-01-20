Return-Path: <linux-gpio+bounces-30824-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOy1B13zb2m+UQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30824-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 22:27:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197F4C3EB
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 22:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A8E028E37EB
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jan 2026 19:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4029D3A1E73;
	Tue, 20 Jan 2026 19:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkobEx4l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC043A1A4E;
	Tue, 20 Jan 2026 19:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768938582; cv=none; b=VRvmH0cBkiBBhxKfLAZb4NeXO5E5QEob0vMYI/SlimA+txQaNf5MtdjcEfroZ/n79Ts/etzSziKS6QGavBYsku1q4vpyMz112+tIYoEjfXZUPQvVdubyn/EtXMg/ichwkUYW9l7qS789ISKycYSszKH4ZcfvON9pEjHyREkTFmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768938582; c=relaxed/simple;
	bh=KcOj+JsQoGK/0bADpgrpqVHEBcwxEgzUFgAm4cNBfcs=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=IUe29zJQsOeVf5mAReqGO5EzLelM4OMFlXdni7btwKVheovgeLw5fRudS4V5LsDlaHvA6tZgAMRRaif9QK7x+a5BjKTbvCLBG6Fk5rkF+F83ZfyTmBPRRhjgNDUSfmdvOobfV/engXgGhWwozmk3Ac1GBIx6wcpmRhQlqjAvjCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UkobEx4l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA5DC2BCAF;
	Tue, 20 Jan 2026 19:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768938582;
	bh=KcOj+JsQoGK/0bADpgrpqVHEBcwxEgzUFgAm4cNBfcs=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=UkobEx4lZ6dx5VJQ8XB5BiZMhrxCzr11qwqdyvq0D1N1bH/sKVUZnIUP86IWXAPST
	 fAdZCgAmD40rZGI7phYrpHWGF3Cd46gsAminAIOXtuUZZUSa8SsF0Lsf/fv2TSpY90
	 SYvwgs4EY+gTe2vI/nNh3NL3DMHgagc/YxjFwVm6c1kSsDM6jbVFfAEGE+n4JvMX22
	 Ip9Yh9QItlnLa49EXDhJlAd4met+g9bjQYn5m6kDOIIqfbd7Ug7GjHhhsVCYxYPjWN
	 rOPLPP5s7p+1SmWEP/LEIDTciuIEvS2Pk4KOifVucgeO4d8LJqXh0I/rKH/uY0Wsao
	 8gY/vF4ULudyg==
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Jan 2026 13:49:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Jacky Bai <ping.bai@nxp.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 linux-gpio@vger.kernel.org, Chester Lin <chester62515@gmail.com>, 
 Enric Balletbo <eballetb@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alberto Ruiz <aruizrui@redhat.com>, imx@lists.linux.dev, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Eric Chanudet <echanude@redhat.com>, Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Matthias Brugger <mbrugger@suse.com>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
Message-Id: <176893840760.631021.17752522800220517955.robh@kernel.org>
Subject: Re: [PATCH v8 00/10] gpio: siul2-s32g2: add initial GPIO driver
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30824-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,redhat.com,lists.infradead.org,kernel.org,vger.kernel.org,pengutronix.de,bgdev.pl,gmail.com,linuxfoundation.org,linaro.org,lists.linux.dev,suse.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,devicetree.org:url,4009c000:email,2.159.138.16:email]
X-Rspamd-Queue-Id: 8197F4C3EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 20 Jan 2026 13:59:12 +0200, Khristine Andreea Barbulescu wrote:
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
> Writing and reading GPIO values is done via the PGPDO/PGPDI
> registers(Parallel GPIO Pad Data Output/Input) which are
> 16 bit registers, each bit corresponding to a GPIO.
> 
> Note that the PGPDO order is similar to a big-endian grouping
> of two registers:
> PGPDO1, PGPDO0, PGPDO3, PGPDO2, PGPDO5, PGPDO4, gap, PGPDO6.
> 
> v8 -> v7
> - remove all ': true' lines from properties in dt bindings
> - remove NVMEM MFD cell from SIUL2 in dtsi
> - remove NVMEM driver and configs
> - expose SoC information via syscon cells SIUL2_0
> and SIUL2_1 in MFD driver
> - add SIUL2_0 and SIUL2_1 syscon nodes in dtsi
> - add patternProperties for "^siul2_[0-1]$" for syscon nodes
> - update example to include syscon cells with proper format
> - remove `reg` property from pinctrl node in dt binding
> - update Kconfig help text to reflect new syscon structure
> instead of NVMEM for SoC information
> - squash deprecated SIUL2 pinctrl binding with new MFD binding
> - dropped "nxp,s32g3-siul2" from MFD driver match table
> - fixed commit messages
> - fixed dtb warnings
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
> Andrei Stefanescu (9):
>   dt-bindings: mfd: add support for the NXP SIUL2 module
>   mfd: nxp-siul2: add support for NXP SIUL2
>   arm64: dts: s32g: change pinctrl node into the new mfd node
>   pinctrl: s32cc: use dev_err_probe() and improve error messages
>   pinctrl: s32cc: change to "devm_pinctrl_register_and_init"
>   pinctrl: s32g2: change the driver to also be probed as an MFD cell
>   pinctrl: s32cc: implement GPIO functionality
>   MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
>   pinctrl: s32cc: set num_custom_params to 0
> 
> Khristine Andreea Barbulescu (1):
>   pinctrl: s32cc: skip syscon child nodes when parsing funcs and groups
> 
>  .../bindings/mfd/nxp,s32g2-siul2.yaml         | 165 +++++
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      |   2 +
>  MAINTAINERS                                   |   2 +
>  arch/arm64/boot/dts/freescale/s32g2.dtsi      |  35 +-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      |  35 +-
>  drivers/mfd/Kconfig                           |  13 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/nxp-siul2.c                       | 440 ++++++++++++
>  drivers/pinctrl/nxp/pinctrl-s32.h             |   4 +-
>  drivers/pinctrl/nxp/pinctrl-s32cc.c           | 652 ++++++++++++++----
>  drivers/pinctrl/nxp/pinctrl-s32g2.c           |  32 +-
>  include/linux/mfd/nxp-siul2.h                 |  55 ++
>  12 files changed, 1259 insertions(+), 177 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
>  create mode 100644 drivers/mfd/nxp-siul2.c
>  create mode 100644 include/linux/mfd/nxp-siul2.h
> 
> --
> 2.50.1
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
 Base: tags/v6.19-rc1-8-gea6806346080 (best guess, 8/9 blobs matched)
 Base: tags/v6.19-rc1-8-gea6806346080 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


Warnings in base: 24
Warnings after series: 42

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com:

arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: pinctrl@4009c000 (nxp,s32g3-siul2): 'siul2_0@4009c000', 'siul2_1@44010000' do not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$', '^siul2_[0-1]$'
	from schema $id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml
arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: siul2_0@4009c000 (syscon): compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: siul2_1@44010000 (syscon): compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: pinctrl@4009c000 (nxp,s32g2-siul2): 'siul2_0@4009c000', 'siul2_1@44010000' do not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$', '^siul2_[0-1]$'
	from schema $id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: siul2_0@4009c000 (syscon): compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: siul2_1@44010000 (syscon): compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: pinctrl@4009c000 (nxp,s32g2-siul2): 'siul2_0@4009c000', 'siul2_1@44010000' do not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$', '^siul2_[0-1]$'
	from schema $id: http://devicetree.org/schemas/mfd/nxp,s32g2-siul2.yaml
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: siul2_0@4009c000 (syscon): compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: siul2_1@44010000 (syscon): compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml






