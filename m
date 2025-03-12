Return-Path: <linux-gpio+bounces-17487-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B179A5D978
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 10:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99DF23AA064
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 09:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CB123A9B1;
	Wed, 12 Mar 2025 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Byu/3/6p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BEB23A98B
	for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741771801; cv=none; b=nZDNPHj7RC/Yn+OwW7/A1vst1mgpoQmH4NXlE0dz1JJXhHGxbDnkf4N4DLbAiFWz9R43V0AjZV8HdgweEvLnt5UxHee3vQL2AyRuLrYFzfwaAve5s7G1CYVgphUtyurRhHSfCUR7M986TI+SxG1iFySe29SIWHCMKde4dzxPzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741771801; c=relaxed/simple;
	bh=tSws0uqI2SznFPegKFo36/x1ajpurzkT5thUWoEOHMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dj49W9zl6S1nwRJgZfLmcK4gH+M6+uzs7FqVaj3PloRPs5IO/PTRC065Sd6zUCsceS5MuVJadPZXH/7yCMMwKGvaSurpvuek5XSwTS3kJ5x8PtS/bqowjWnj1ZM2cb2fVyQRHptYhDNpB/+pllOXDfRH97tVaiteqqzOurpGlnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Byu/3/6p; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2909398f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Mar 2025 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741771798; x=1742376598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RyuIF7ilKCTNWqhGZXvW+3VZuEvP8t1bh6inYFcuoX8=;
        b=Byu/3/6puaWMl+rsnGxPWl8Ed0suD84JKMCKDYYB//q8FhZaKMDm2gPh5VuOMicUcM
         ef9Y7YyDoS5bdOv+a4aAga9fqCz+ko9vkQ41RsI4J5lKPxgnzudl/2uRHX9RqYLYRw2Q
         Sn30nGOOzfdGcrfpog3hu45M2G+28I55SwwLD53paK8ODj8wKbpspWbbYRii61WdIAHx
         fv4RTUh1GzTs2bmNcg6djoGSLsMLZCYViCK7UZ/u7qzRgLfzzhqevI89FrFJcVGffpng
         9fF+iiXXiQke7rOCbmU86eVmM/AebcxBv0l1Xp4DeBs1vzz7Ef5/iUIYSzOgVNaxLnUy
         loMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741771798; x=1742376598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyuIF7ilKCTNWqhGZXvW+3VZuEvP8t1bh6inYFcuoX8=;
        b=trZ8qc79M2k2C91UblTtd8awnlXP9mYjaxLNccpMQw5oi/dFc9mSt9p9nQdmI9ULKX
         4B/WDNnYbUtfuiUAYCJN49SgWUu6KnyTNEDMoIiZn4jWggPXFyPzJdEgON+d5CUhum9+
         yU1lyNrzUo04R7uk90M5rcGwNuzni0t6kUVuU/4xRbG33cG79/JfkAyeemvwKwKKGglc
         qYwVXBc1oSeBl9jSm/pmM+2WqfnIlVdddxGIgpjAJbc0o6xh3h82iyAxBUodBlCKqLYU
         zoTvviyv7nC+D4KUJSv+6vQt9Qa4XgAie0HFJdTq6kzcegBxu7Icb0o9yZPefM+uvrvb
         k7rw==
X-Forwarded-Encrypted: i=1; AJvYcCU5hw8IoKr4tJRQD4QkNCWNoM2oeKQmY8E7NknIIesEzMnhCYygxu2lf1ZTG+NW0ugJ+2guFd4jwrvy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo7dWAwxJmRFFkqwAJlR2pWmLEEZEOPWC+IfDtmkrO/Xh5QIwB
	v0UpuVF3E+PfPMA2r01+vOhdm5kSlpMYbjF9VT+UtunhQhUPD9R54xQK3EYB3yM=
X-Gm-Gg: ASbGncvSKkXEYW/i8ca0Il8bVk/o2wPBiNqFfCvMjU1KJLIreurOc4iKTJQTAkDFAwa
	ss4aQsPZ/rVa9m6Bx1NkZ2h+tGtiul30HI4vuQ+SV16Yysq+IZQ9oYfu+1ujtxpYKpcPFz1OyYR
	RIQ10TufjbFmP9kYRPOH/W0IUDdYUmU922sAISqcHIwz1EW69ti3lB+hjeIUwHzDdHHgNbwF3Kc
	Hu4MG0tHDZ3muSBjv/qCQJ2CzeD5uR+E8QZeYwHFR/UdUGFx7l1FqjBUnxsu4Y3Ks0olAFuXiJQ
	BAsBNj5hNG+CPyng4d/XZRTr9bkFfeqflxjdxvMVWaYJpL8rZmK8SPxMNEM4yPU=
X-Google-Smtp-Source: AGHT+IE2F4vkuyc8O9MHcNrwAiEnvfVrJulNHKbhedDrmtfP3O4s4EHa1Ex0DhHtMpGa2iqxYWd2cg==
X-Received: by 2002:a05:6000:1f8c:b0:391:4835:d888 with SMTP id ffacd0b85a97d-3926bfe0777mr7636212f8f.42.1741771797862;
        Wed, 12 Mar 2025 02:29:57 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdff57sm20942923f8f.37.2025.03.12.02.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 02:29:57 -0700 (PDT)
Message-ID: <f6cc4e64-fc92-40c7-ad5b-90f6da86b811@linaro.org>
Date: Wed, 12 Mar 2025 09:29:55 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] nvmem: max77759: add Maxim MAX77759 NVMEM driver
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org>
 <20250224-max77759-mfd-v1-6-2bff36f9d055@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20250224-max77759-mfd-v1-6-2bff36f9d055@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/02/2025 10:28, André Draszik wrote:
> The Maxim MAX77759 is a companion Power Management IC for USB Type-C
> applications with Battery Charger, Fuel Gauge, temperature sensors, USB
> Type-C Port Controller (TCPC), NVMEM, and additional GPIO interfaces.
> 
> This driver exposes the non volatile memory using the platform device
> registered by the core MFD driver.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   MAINTAINERS                    |   1 +
>   drivers/nvmem/Kconfig          |  12 ++++
>   drivers/nvmem/Makefile         |   2 +
>   drivers/nvmem/max77759-nvmem.c | 156 +++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 171 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d119ed1ff279..bbc92dee7af4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14329,6 +14329,7 @@ S:	Maintained
>   F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
>   F:	drivers/gpio/gpio-max77759.c
>   F:	drivers/mfd/max77759.c
> +F:	drivers/nvmem/max77759-nvmem.c
>   F:	include/linux/mfd/max77759.h
>   
>   MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index 8671b7c974b9..3de07ef52490 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -154,6 +154,18 @@ config NVMEM_LPC18XX_OTP
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called nvmem_lpc18xx_otp.
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
>   config NVMEM_MESON_EFUSE
>   	tristate "Amlogic Meson GX eFuse Support"
>   	depends on (ARCH_MESON || COMPILE_TEST) && MESON_SM
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 5b77bbb6488b..a9d03cfbbd27 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -34,6 +34,8 @@ obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+= nvmem_lpc18xx_eeprom.o
>   nvmem_lpc18xx_eeprom-y			:= lpc18xx_eeprom.o
>   obj-$(CONFIG_NVMEM_LPC18XX_OTP)		+= nvmem_lpc18xx_otp.o
>   nvmem_lpc18xx_otp-y			:= lpc18xx_otp.o
> +obj-$(CONFIG_NVMEM_MAX77759)		+= nvmem-max77759.o
> +nvmem-max77759-y			:= max77759-nvmem.o
>   obj-$(CONFIG_NVMEM_MESON_EFUSE)		+= nvmem_meson_efuse.o
>   nvmem_meson_efuse-y			:= meson-efuse.o
>   obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
> diff --git a/drivers/nvmem/max77759-nvmem.c b/drivers/nvmem/max77759-nvmem.c
> new file mode 100644
> index 000000000000..4c455b242542
> --- /dev/null
> +++ b/drivers/nvmem/max77759-nvmem.c
> @@ -0,0 +1,156 @@
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
> +	struct max77759_mfd *max77759_mfd;
> +};
> +
> +static bool max77759_nvmem_is_valid(unsigned int offset, size_t bytes)
> +{
> +	return (offset + bytes - 1 <= MAX77759_NVMEM_SIZE);
> +}
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
> +	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_USER_SPACE_READ;
> +	cmd->cmd[1] = offset;
> +	cmd->cmd[2] = bytes;
> +	rsp->length = bytes + MAX77759_NVMEM_OPCODE_HEADER_LEN;
> +
> +	ret = max77759_maxq_command(nvmem->max77759_mfd, cmd, rsp);
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
> +	if (!max77759_nvmem_is_valid(offset, bytes)) {
> +		dev_err(nvmem->dev, "outside NVMEM area: %u / %zu\n",
> +			offset, bytes);
> +		return -EINVAL;
> +	}
> +
> +	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE;
> +	cmd->cmd[1] = offset;
> +	cmd->cmd[2] = bytes;
> +	memcpy(&cmd->cmd[MAX77759_NVMEM_OPCODE_HEADER_LEN], val, bytes);
> +	cmd->length = bytes + MAX77759_NVMEM_OPCODE_HEADER_LEN;
> +	rsp->length = cmd->length;
> +
> +	ret = max77759_maxq_command(nvmem->max77759_mfd, cmd, rsp);
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
> +	nvmem->max77759_mfd = dev_get_drvdata(pdev->dev.parent);
> +
> +	config.priv = nvmem;
> +
> +	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
> +}
> +
> +static const struct of_device_id max77759_nvmem_of_id[] = {
> +	{ .compatible = "maxim,max77759-nvmem", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, max77759_nvmem_of_id);
> +
> +static struct platform_driver max77759_nvmem_driver = {
> +	.driver = {
> +		.name = "max77759-nvmem",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +		.of_match_table = max77759_nvmem_of_id,
> +	},
> +	.probe = max77759_nvmem_probe,
> +};
> +
> +module_platform_driver(max77759_nvmem_driver);
> +
> +MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
> +MODULE_DESCRIPTION("NVMEM driver for Maxim MAX77759");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:max77759-nvmem");
> 

