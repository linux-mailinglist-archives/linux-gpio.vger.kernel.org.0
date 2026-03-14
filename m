Return-Path: <linux-gpio+bounces-33424-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH1oOGI0tWl3xgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33424-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 11:11:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5E628C9C1
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 11:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8980B30304A9
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Mar 2026 10:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6362434EEEE;
	Sat, 14 Mar 2026 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYeYSEqz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B8517B43F;
	Sat, 14 Mar 2026 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773483104; cv=none; b=r4E0/kws4cp+UKJX2dYegcPsjQ9OlQgcOATFHixlYYibpWBJwuvgen2mc8yX3B+mcd4kwaTK9XEUNz1X6yztcFbruCaSukbh4zYZ+qgCJhztnVL3WSU3+LQ3+q9QulHLNlRUUOnEJK8ZpkYBr/Eq90wLjnkotz5y4zGM0vHCMKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773483104; c=relaxed/simple;
	bh=an8TH6csDgC5GpTOcpJgDijx98c9vEZtQCbnLXx6imY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3aRdRFATPtDT51W1BlzV0L4EvVUr8H4mNEbWN+Dmvn7TZjfK106xuP6o5QplBl3HvzrSIAND+aYAqAM15Wwg6wKKlfoQfOZxcnFX70Eazy+qQVacJt4uhGibPoIsiB+RoUUWF06bZsPMTkofSmzpo8ycVs12HK2atDAeziPdM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYeYSEqz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75910C116C6;
	Sat, 14 Mar 2026 10:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773483104;
	bh=an8TH6csDgC5GpTOcpJgDijx98c9vEZtQCbnLXx6imY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYeYSEqzoVMQLdm4RPcS/y7y7QagTEc9XZpModtOmJXk8vCCP3bbDOmveIY3dDVm+
	 mjwP4q9qbu6vL9vRfb93G+Wddf8oJ3WciUPtpmMWkFaSV+w4bNQEYEAI1rT6DB1nwq
	 lDbjO5Db1JCoXRJzn3ZfwzRq8rpfdVwFmmY7BWZ96tVtK82j4DqAiMbAiyoY8narhU
	 DMYseTjXEvMZSLnSVv2GY9IS7SdTgR6WTxckoUXl1mY/ZO85/KomASuycgk6eERsHo
	 SBpLXkMAujtGJSVBpYXbvUpGTLsV4Ou7XYHlsQkeQeQlaCfxPAlKkqtm++lFznMM7o
	 9679bcTKhY/9A==
Date: Sat, 14 Mar 2026 11:11:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, linusw@kernel.org, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nb@tipi-net.de, 
	navada@ti.com, v-hampiholi@ti.com, sandeepk@ti.com, baojun.xu@ti.com, 
	shenghao-ding@ti.com
Subject: Re: [PATCH v1 6/8] pinctrl: pinctrl-tac5x1x: Add TI TAC5x1x pinctrl
 driver
Message-ID: <20260314-radical-dazzling-mantis-13cbb0@quoll>
References: <20260312184833.263-1-niranjan.hy@ti.com>
 <20260312184833.263-7-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312184833.263-7-niranjan.hy@ti.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33424-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com,tipi-net.de,ti.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:email,ti.com:url]
X-Rspamd-Queue-Id: 8F5E628C9C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:18:31AM +0530, Niranjan H Y wrote:
> Add the Texas Instruments TAC5x1x pin controller driver. This driver
> provides GPIO control for 5 configurable pins (GPIO1, GPIO2, GPO1, GPI1,
> GPI2A) with support for GPIO, PDM, and IRQ functions.
> 
> The pinctrl driver handles:
> - GPIO input/output operations
> - Pin multiplexing between GPIO, PDM, and IRQ functions
> 
> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
> ---
>  drivers/pinctrl/Kconfig           |  11 +
>  drivers/pinctrl/Makefile          |   1 +
>  drivers/pinctrl/pinctrl-tac5x1x.c | 889 ++++++++++++++++++++++++++++++
>  3 files changed, 901 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-tac5x1x.c
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index afecd9407f53..2054e9998880 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -585,6 +585,17 @@ config PINCTRL_SX150X
>  	  - 8 bits:  sx1508q, sx1502q
>  	  - 16 bits: sx1509q, sx1506q
>  
> +config PINCTRL_TI_TAC5X1X
> +	tristate "TAC5X1X pin control driver"
> +	depends on OF && (MFD_TAC5X1X || COMPILE_TEST)
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GENERIC_PINCONF
> +	help
> +	  TAC5X1X family may have 1 or more configurable GPIO pins
> +	  which can be grouped and configured to function as PDM, GPIOs
> +	  or interrupt outputs.
> +
>  config PINCTRL_TB10X
>  	bool "Pinctrl for TB10X" if COMPILE_TEST
>  	depends on OF && ARC_PLAT_TB10X || COMPILE_TEST
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index f7d5d5f76d0c..1fe6b0e8a666 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
>  obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
>  obj-$(CONFIG_PINCTRL_STMFX) 	+= pinctrl-stmfx.o
>  obj-$(CONFIG_PINCTRL_SX150X)	+= pinctrl-sx150x.o
> +obj-$(CONFIG_PINCTRL_TI_TAC5X1X)+= pinctrl-tac5x1x.o
>  obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
>  obj-$(CONFIG_PINCTRL_TPS6594)	+= pinctrl-tps6594.o
>  obj-$(CONFIG_PINCTRL_TH1520)	+= pinctrl-th1520.o
> diff --git a/drivers/pinctrl/pinctrl-tac5x1x.c b/drivers/pinctrl/pinctrl-tac5x1x.c
> new file mode 100644
> index 000000000000..4e59501f3f78
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-tac5x1x.c
> @@ -0,0 +1,889 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TAC5X1X Pinctrl and GPIO driver
> + *
> + * Copyright (C) 2023-2025 Texas Instruments Incorporated - https://www.ti.com
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/build_bug.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/tac5x1x/registers.h>
> +#include <linux/mfd/tac5x1x/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/string_choices.h>
> +
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinmux.h>

So where is the include for bindings? How do you use them if you claim
these are bindings?

> +
> +#include "pinctrl-utils.h"
> +
> +/* 2 pins can be gpio */
> +#define TAC5X1X_NUM_GPIO_PINS 5
> +#define TAC5X1X_MAX_PINS 5

...

> +
> +static const struct platform_device_id tac5x1x_pin_id_table[] = {
> +	{ "tac5x1x-pinctrl", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(platform, tac5x1x_pin_id_table);
> +
> +static struct platform_driver tac5x1x_pin_driver = {
> +	.driver = {
> +		.name	= "tac5x1x-pinctrl",
> +	},
> +	.probe		= tac5x1x_pin_probe,
> +	.id_table	= tac5x1x_pin_id_table,

What is the point of compatible which is not used. That's another
completely unused thing from your bindings.

Best regards,
Krzysztof


