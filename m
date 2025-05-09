Return-Path: <linux-gpio+bounces-19846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E989AB12C2
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 13:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D87B37B092C
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 11:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6536828FFC9;
	Fri,  9 May 2025 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7NIeZ26"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8D28F94C;
	Fri,  9 May 2025 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746791929; cv=none; b=avITQLhIko1n34LQr5doqIEX+HsHoatJtDbUSXnDjjiJx0aBppSNg3ff0Kb1wGH5iS7lAsnfzwC5GJUY0OVXg+Bn8CJ5+MGqk+BI88kKbk/EW6789Dm4p8zhOZCJrzLtR4zmaVABM5He8zVCyct9wszcHHVC1t8OEFPQqI8H3z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746791929; c=relaxed/simple;
	bh=NCtLhYAHWoi/uYTZ/aBGFcs5EKhZrKwMb9yH3wrLyrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mhSKCStvUvkqSpLt+O6yrnvIiE8g0SFRRi3ObqJ2LWomqToMx4bcGAn+XZ/cTQOYPx1eYgRUAC/UQPS/t5S9a1G4g8rzyMgGQFJhtI6+yxQu4JeYtv3dRklqzYjiLGke51XSxUdvGvsRRkWIOqD0BiO+NpSEhDVdmH452MSC3gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7NIeZ26; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CB0C4CEE4;
	Fri,  9 May 2025 11:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746791928;
	bh=NCtLhYAHWoi/uYTZ/aBGFcs5EKhZrKwMb9yH3wrLyrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I7NIeZ269XV59LW9/W5Kjhzx1z/3bV/cS2nu5mvuVAwgoG35Ew8AU790+wdk+Stnf
	 exoOqYV4Q2WFBGeGtS/ePa5N0ouamt3oZVnn/QcS+VDc+/87Q3ne6B+b+WRpcUlwzj
	 7SUhFzLC8RawXUJpVdHPe96jsN5EpRkZ8+97vIF6XfKebmRqRl58Q93yvC0tdnQjLG
	 v4X9UxLfXQjyQVMiXQWzqLgvClSHg96w5JDl6mMiNlsmmwR1c4h53erkE+zdvkyXuV
	 Vhx3jMbmj2mY8vQXT6k0JE2U3pSAgWozB3EfIoz7e9P0FKDssmhubMVlaQVaLQ0GqF
	 6303Fs5iimfIg==
Date: Fri, 9 May 2025 12:58:42 +0100
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
Subject: Re: [PATCH v9 6/6] nvmem: max77759: add Maxim MAX77759 NVMEM driver
Message-ID: <aB3t8vw9PO5hRpXg@srini-hackbase>
References: <20250430-max77759-mfd-v9-0-639763e23598@linaro.org>
 <20250430-max77759-mfd-v9-6-639763e23598@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-max77759-mfd-v9-6-639763e23598@linaro.org>

On Wed, Apr 30, 2025 at 10:03:13AM +0100, André Draszik wrote:
> The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
> includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
> Port Controller (TCPC), NVMEM, and a GPIO expander.
> 
> This driver exposes the non volatile memory using the platform device
> registered by the core MFD driver.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

If the plan is to take this series via mfd here is my Ack

Acked-by: Srinivas Kandagatla <srini@kernel.org>

thanks,
Srini
> ---
> v9:
> * drop superfluous max77759_nvmem_is_valid() (Srini)
> 
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
>  drivers/nvmem/Kconfig          |  12 ++++
>  drivers/nvmem/Makefile         |   2 +
>  drivers/nvmem/max77759-nvmem.c | 145 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 160 insertions(+)
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
> index 0000000000000000000000000000000000000000..c9961ad0e232e152e924b5b06d7d93172760ac3a
> --- /dev/null
> +++ b/drivers/nvmem/max77759-nvmem.c
> @@ -0,0 +1,145 @@
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
> +	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_USER_SPACE_READ;
> +	cmd->cmd[1] = offset;
> +	cmd->cmd[2] = bytes;
> +	rsp->length = bytes + MAX77759_NVMEM_OPCODE_HEADER_LEN;
> +
> +	ret = max77759_maxq_command(nvmem->max77759, cmd, rsp);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (memcmp(cmd->cmd, rsp->rsp, MAX77759_NVMEM_OPCODE_HEADER_LEN)) {
> +		dev_warn(nvmem->dev, "protocol error (read)\n");
> +		return -EIO;
> +	}
> +
> +	memcpy(val, &rsp->rsp[MAX77759_NVMEM_OPCODE_HEADER_LEN], bytes);
> +
> +	return 0;
> +}
> +
> +static int max77759_nvmem_reg_write(void *priv, unsigned int offset,
> +				    void *val, size_t bytes)
> +{
> +	struct max77759_nvmem *nvmem = priv;
> +	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length,
> +		    MAX77759_MAXQ_OPCODE_MAXLENGTH);
> +	DEFINE_FLEX(struct max77759_maxq_response, rsp, rsp, length,
> +		    MAX77759_MAXQ_OPCODE_MAXLENGTH);
> +	int ret;
> +
> +	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE;
> +	cmd->cmd[1] = offset;
> +	cmd->cmd[2] = bytes;
> +	memcpy(&cmd->cmd[MAX77759_NVMEM_OPCODE_HEADER_LEN], val, bytes);
> +	cmd->length = bytes + MAX77759_NVMEM_OPCODE_HEADER_LEN;
> +	rsp->length = cmd->length;
> +
> +	ret = max77759_maxq_command(nvmem->max77759, cmd, rsp);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (memcmp(cmd->cmd, rsp->rsp, cmd->length)) {
> +		dev_warn(nvmem->dev, "protocol error (write)\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max77759_nvmem_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_config config = {
> +		.dev = &pdev->dev,
> +		.name = dev_name(&pdev->dev),
> +		.id = NVMEM_DEVID_NONE,
> +		.type = NVMEM_TYPE_EEPROM,
> +		.ignore_wp = true,
> +		.size = MAX77759_NVMEM_SIZE,
> +		.word_size = sizeof(u8),
> +		.stride = sizeof(u8),
> +		.reg_read = max77759_nvmem_reg_read,
> +		.reg_write = max77759_nvmem_reg_write,
> +	};
> +	struct max77759_nvmem *nvmem;
> +
> +	nvmem = devm_kzalloc(&pdev->dev, sizeof(*nvmem), GFP_KERNEL);
> +	if (!nvmem)
> +		return -ENOMEM;
> +
> +	nvmem->dev = &pdev->dev;
> +	nvmem->max77759 = dev_get_drvdata(pdev->dev.parent);
> +
> +	config.priv = nvmem;
> +
> +	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
> +}
> +
> +static const struct of_device_id max77759_nvmem_of_id[] = {
> +	{ .compatible = "maxim,max77759-nvmem", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max77759_nvmem_of_id);
> +
> +static const struct platform_device_id max77759_nvmem_platform_id[] = {
> +	{ "max77759-nvmem", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(platform, max77759_nvmem_platform_id);
> +
> +static struct platform_driver max77759_nvmem_driver = {
> +	.driver = {
> +		.name = "max77759-nvmem",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.of_match_table = max77759_nvmem_of_id,
> +	},
> +	.probe = max77759_nvmem_probe,
> +	.id_table = max77759_nvmem_platform_id,
> +};
> +
> +module_platform_driver(max77759_nvmem_driver);
> +
> +MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
> +MODULE_DESCRIPTION("NVMEM driver for Maxim MAX77759");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.49.0.901.g37484f566f-goog
> 

