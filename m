Return-Path: <linux-gpio+bounces-19471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2094AAA1B93
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 21:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E809D1BA6BEA
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 19:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B929F261362;
	Tue, 29 Apr 2025 19:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1Wver2v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F90253B71;
	Tue, 29 Apr 2025 19:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745956309; cv=none; b=IxEe6Io97aEAqOdZ1GrDJ6NMsIJ4geZqOV9Jz8JjwLgdmXGx+26jaOalFIvfSgpiiHwfSfGzF5gfCN3mSbByqoL3LrMt9f5SuT2fit0I8VhS0JJ5M6cqaHW4cDfEtlu1wN9y2crhaCuy2gnp0J//juqEX3qwBfj4Z985sdhzj78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745956309; c=relaxed/simple;
	bh=z1fvvieY1psn6GVNY6iDPpzBM5AWRCz/GzQ7g8pEEVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVvhJRh4noxiSgt0W6sSMZLWtc+LwGlEAzkGZzjNqK7rEpfBV0i2YjsY53HVySAudVPaYuGYB4kosBNn2YqoYJd5p9cgallG4xvLztfujPQLTS5fSDv1ZpCP0YvB6KtTrltuk5etmY4tskjKedP+nMAvgif35eh0xJxMY+wl84s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1Wver2v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3EC3C4CEE3;
	Tue, 29 Apr 2025 19:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745956308;
	bh=z1fvvieY1psn6GVNY6iDPpzBM5AWRCz/GzQ7g8pEEVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1Wver2vES19Qwkp6AQZn80UfAWt/dCb+ZdPRTAu9+7Wr9f/3iShWlqG58YB+VX50
	 dc1NbF3NmgotoSlA+EZnjAwc/hoXuGN97GWgYEr7fq5RofHVRZ0bNd/PPOuZ/BRRfs
	 tBt8BDpU3F7i/2Jh+QjudJkaHx2uSs34ekHrTgYOq1m8CjFJR178bDapZGhUMRqC20
	 TtSs3RxPwOOL+xndT8Gs+PFfQx+9Vj26jmrIuqdfM8olXCBmHkHMBF68lDay9OmIRI
	 zSZnQFtP46/bDUxxmpDl4qRVBLZTuMzN9qA9dYHjZPPwfbveE1OZk+3NmQi4avqU5b
	 KW5mBSc8SzP0g==
Date: Tue, 29 Apr 2025 20:51:42 +0100
From: Srinivas Kandagatla <srini@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v8 6/6] nvmem: max77759: add Maxim MAX77759 NVMEM driver
Message-ID: <aBEtzh8w5PZKSntr@srini-hackbase>
References: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org>
 <20250429-max77759-mfd-v8-6-72d72dc79a1f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429-max77759-mfd-v8-6-72d72dc79a1f@linaro.org>

On Tue, Apr 29, 2025 at 09:21:42AM +0100, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This driver exposes the non volatile memory using the platform device
> registered by the core MFD driver.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> v8:
> * replace MODULE_ALIAS() with .id_table (Krzysztof)
> * drop previous tags
> 
> v5:
> * follow API updates of max77759 core driver
> 
> v2:
> * align sentinel in max77759_nvmem_of_id[] with other max77759 drivers
>  (Christophe)
> ---
>  MAINTAINERS                    |   1 +
>  drivers/nvmem/Kconfig          |  12 +++
>  drivers/nvmem/Makefile         |   2 +
>  drivers/nvmem/max77759-nvmem.c | 162 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 177 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0db5e1fe64930e85265913e6a7dd2669c645cf42..b821502afc48f95d48fb8c6ac6941d1dd8e63582 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14670,6 +14670,7 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
>  F:	drivers/gpio/gpio-max77759.c
>  F:	drivers/mfd/max77759.c
> +F:	drivers/nvmem/max77759-nvmem.c
>  F:	include/linux/mfd/max77759.h
>  
>  MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 8671b7c974b933e147154bb40b5d41b5730518d2..3de07ef524906ad24a89e58abdfe93529a83c80f 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -154,6 +154,18 @@ config NVMEM_LPC18XX_OTP
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called nvmem_lpc18xx_otp.
>  
> +config NVMEM_MAX77759
> +	tristate "Maxim Integrated MAX77759 NVMEM Support"
> +	depends on MFD_MAX77759
> +	default MFD_MAX77759
> +	help
> +	  Say Y here to include support for the user-accessible storage found
> +	  in Maxim Integrated MAX77759 PMICs. This IC provides space for 30
> +	  bytes of storage.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called nvmem-max77759.
> +
>  config NVMEM_MESON_EFUSE
>  	tristate "Amlogic Meson GX eFuse Support"
>  	depends on (ARCH_MESON || COMPILE_TEST) && MESON_SM
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 5b77bbb6488bf89bfb305750a1cbf4a6731a0a58..a9d03cfbbd27e68d40f8c330e72e20378b12a481 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -34,6 +34,8 @@ obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+= nvmem_lpc18xx_eeprom.o
>  nvmem_lpc18xx_eeprom-y			:= lpc18xx_eeprom.o
>  obj-$(CONFIG_NVMEM_LPC18XX_OTP)		+= nvmem_lpc18xx_otp.o
>  nvmem_lpc18xx_otp-y			:= lpc18xx_otp.o
> +obj-$(CONFIG_NVMEM_MAX77759)		+= nvmem-max77759.o
> +nvmem-max77759-y			:= max77759-nvmem.o
>  obj-$(CONFIG_NVMEM_MESON_EFUSE)		+= nvmem_meson_efuse.o
>  nvmem_meson_efuse-y			:= meson-efuse.o
>  obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
> diff --git a/drivers/nvmem/max77759-nvmem.c b/drivers/nvmem/max77759-nvmem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..df7d1998fa2f116450d2fd50eba70d9b61a24574
> --- /dev/null
> +++ b/drivers/nvmem/max77759-nvmem.c
> @@ -0,0 +1,162 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright 2020 Google Inc
> +// Copyright 2025 Linaro Ltd.
> +//
> +// NVMEM driver for Maxim MAX77759
> +
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/device/driver.h>
> +#include <linux/err.h>
> +#include <linux/mfd/max77759.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>
> +#include <linux/string.h>
> +
> +#define MAX77759_NVMEM_OPCODE_HEADER_LEN 3
> +/*
> + * NVMEM commands have a three byte header (which becomes part of the command),
> + * so we need to subtract that.
> + */
> +#define MAX77759_NVMEM_SIZE (MAX77759_MAXQ_OPCODE_MAXLENGTH \
> +			     - MAX77759_NVMEM_OPCODE_HEADER_LEN)
> +
> +struct max77759_nvmem {
> +	struct device *dev;
> +	struct max77759 *max77759;
> +};
> +
> +static bool max77759_nvmem_is_valid(unsigned int offset, size_t bytes)
> +{
> +	return (offset + bytes - 1 <= MAX77759_NVMEM_SIZE);
> +}
Do you really need this check?
nvmem core should take care of this boundary checks.

> +
> +static int max77759_nvmem_reg_read(void *priv, unsigned int offset,
> +				   void *val, size_t bytes)
> +{
> +	struct max77759_nvmem *nvmem = priv;
> +	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length,
> +		    MAX77759_NVMEM_OPCODE_HEADER_LEN);
> +	DEFINE_FLEX(struct max77759_maxq_response, rsp, rsp, length,
> +		    MAX77759_MAXQ_OPCODE_MAXLENGTH);
> +	int ret;
> +
> +	if (!max77759_nvmem_is_valid(offset, bytes)) {
> +		dev_err(nvmem->dev, "outside NVMEM area: %u / %zu\n",
> +			offset, bytes);
> +		return -EINVAL;
> +	}
> +

