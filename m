Return-Path: <linux-gpio+bounces-17948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B83A6EB8A
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 09:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73570189496C
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Mar 2025 08:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EAA255E55;
	Tue, 25 Mar 2025 08:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xtuFJqzP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D791B0F2C
	for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 08:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891235; cv=none; b=kC4h1MAzFyz+MLuNJ3gxFcDHJN65Y9PcJh1Pjign2YyRkcVEszL1NjfJwbi0o5tNBlZGvnGViiA/OI56EP7NPAtrtsuz1Ixh1n1uBRC7PxNl4gQZYe+0w/kWeI8FnuuRxgSUtTFt78UQLL70qO1uS0nt4oU18JO8Xl4eq5GiPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891235; c=relaxed/simple;
	bh=uFJtcwIQ1CrXzPB2yfec+q99KZjeh90NRZivuV++Rmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDh+wvIM5oM+ZoxcFd71fDVDPmkvaVMikrp5tLg83Kj42DWb3Hfe+7EWYhP+UzpBaEVk1TR2vxMnvoMGN5EflYkavhXEtTq88GMWpitJ3s8jFEdGh1ZcFk/8zk1Sav1TjkF34IBt5AjrBUyRY+DnE4uJrZqxOQR3jRuv3bvHd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xtuFJqzP; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso9649474a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 25 Mar 2025 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742891230; x=1743496030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ZlhvhiNMPHxjTtYHGw42ITvKgA++Bx2WHTs5Yktipk=;
        b=xtuFJqzP4zrLm9x5/z13MqpyEMQu2cjI4xTG5o4mIdeaVuHlk/ZZaCf/Ez6CjE9B+i
         wdwNocYlEDCd8cJiXIZb33gJHkW1/0HuNkNO/Ul0TjGyTZXFQ8fYjdP9bs+WkIbpKtJ9
         h4+VvXR/GzEt1bDFgqUAwAZPUDr/nkzMZ6pbhbyA1YIpdt/oDNonETFW26A+rOEiAW3U
         wUsAS+IGQzxtRIcETmliBYREnnLnIch3JrHi6kUhV3O3zquyGlnB967ozU55X6x7Gb1W
         NyshH5+CKhEoL66s+zWCECM8xkrxz/FsD1gHOxNOmJAZJPGqJ+WxcbHCJ0yCQG/qspHx
         uxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742891230; x=1743496030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZlhvhiNMPHxjTtYHGw42ITvKgA++Bx2WHTs5Yktipk=;
        b=OKRl5WT72pZlU1bsTuihg0KkqbIq6XIi9cHYRz7JYd5lEj46ptSXPIdv/aMajizNXM
         eDECRMfAGvIL/i93GBtYcLQx9ySbqSpwg6JrsBfNhugP+VOIT8dV/jZQLES3g6O4HD9a
         NZdXkfLyAnc41vhi9gDxQuiL1yk4lJmo+hG5gAEccvosvtCUe9fyGCbwBtdmeTr8it7K
         UJwlyG4kqh6HFhyyZ9uwQaLmNks4bKkyt9pUYT/4Rn0rOrifPKRuUSaWD/q/2c7T6FGt
         QOVbea8zdATSuSU2eykFbbCtQGykBzZ5q66Iy97RymUXGS36mI85riY9TIL5don89EKy
         0k0g==
X-Forwarded-Encrypted: i=1; AJvYcCUS/QB+v0Rn8sG9Xs6+4VJtRVMLKPWk41w6Q2kvYnkLpUIZsO2eQ6jrm3rkOb3ZWj3S9K4wfkwuYrns@vger.kernel.org
X-Gm-Message-State: AOJu0YytVnS9wx1hgSmx67BgZeD7Fv6mAEwieaSujZ9VYbtr5KDm9wOA
	5gEpEIxUMQlfId99F+taHyvX8Gh0pQp81YvAHVdLqQiPlXtGdwyaUebz7hOMHZc=
X-Gm-Gg: ASbGnctgrDDutQnYZZmLdeQ6tOeNGL5F3Y9aL8vzvErJrdDslv0iRJyZOCWYeosvTl7
	0NLcqzggzUTUpbw8pym+WVDGPkcWVY4i9sdzxD6XLwlmutoE4jfSZVeFOAtsddLT11fmp/KcVCV
	1tGsXSr5Ucgc6/aRuF4dEeQDjjOYaxfrlX/kjq869287uc6W25ECNtNyUJ+N8eN5aTeBZZF4QGu
	D7ASb/b2ETqiGXvKsgd4YdyljS66OBU1syk8uvyzW1zOMsIxHeAXaxmupAZY38dva+u7Cn3PR6Q
	EsTMd48tWb+TfTS5dERqjT1EKT4KqRSxKOtFSZzvA1ZR2+xplXuqc1/frp6QZ2U+SKmmu6qXq51
	9UTz81OjqMyuMjr3K+e927TpMo1N1
X-Google-Smtp-Source: AGHT+IGsOlEepVW8/4u2HLRV8VYG0PhA3LZO4nlPjODGO5lOuFaODHgqEgmXyr2RxEXyzZt+hoP3+Q==
X-Received: by 2002:a05:6402:2547:b0:5dc:7f96:6263 with SMTP id 4fb4d7f45d1cf-5ebcd45c370mr13500717a12.15.1742891229889;
        Tue, 25 Mar 2025 01:27:09 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcce36d66sm7377366a12.0.2025.03.25.01.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 01:27:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 25 Mar 2025 08:27:07 +0000
Subject: [PATCH v6 6/6] nvmem: max77759: add Maxim MAX77759 NVMEM driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250325-max77759-mfd-v6-6-c0870ca662ba@linaro.org>
References: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
In-Reply-To: <20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This driver exposes the non volatile memory using the platform device
registered by the core MFD driver.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v5:
* follow API updates of max77759 core driver

v2:
* align sentinel in max77759_nvmem_of_id[] with other max77759 drivers
 (Christophe)
---
 MAINTAINERS                    |   1 +
 drivers/nvmem/Kconfig          |  12 ++++
 drivers/nvmem/Makefile         |   2 +
 drivers/nvmem/max77759-nvmem.c | 156 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a1abc3fa52a9713da19a1d8d4f625fd9aeee06b3..e3e92ce1518140293069d1d544c37b20dd5c5b95 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14575,6 +14575,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
 F:	drivers/gpio/gpio-max77759.c
 F:	drivers/mfd/max77759.c
+F:	drivers/nvmem/max77759-nvmem.c
 F:	include/linux/mfd/max77759.h
 
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b933e147154bb40b5d41b5730518d2..3de07ef524906ad24a89e58abdfe93529a83c80f 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -154,6 +154,18 @@ config NVMEM_LPC18XX_OTP
 	  To compile this driver as a module, choose M here: the module
 	  will be called nvmem_lpc18xx_otp.
 
+config NVMEM_MAX77759
+	tristate "Maxim Integrated MAX77759 NVMEM Support"
+	depends on MFD_MAX77759
+	default MFD_MAX77759
+	help
+	  Say Y here to include support for the user-accessible storage found
+	  in Maxim Integrated MAX77759 PMICs. This IC provides space for 30
+	  bytes of storage.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-max77759.
+
 config NVMEM_MESON_EFUSE
 	tristate "Amlogic Meson GX eFuse Support"
 	depends on (ARCH_MESON || COMPILE_TEST) && MESON_SM
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5b77bbb6488bf89bfb305750a1cbf4a6731a0a58..a9d03cfbbd27e68d40f8c330e72e20378b12a481 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -34,6 +34,8 @@ obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+= nvmem_lpc18xx_eeprom.o
 nvmem_lpc18xx_eeprom-y			:= lpc18xx_eeprom.o
 obj-$(CONFIG_NVMEM_LPC18XX_OTP)		+= nvmem_lpc18xx_otp.o
 nvmem_lpc18xx_otp-y			:= lpc18xx_otp.o
+obj-$(CONFIG_NVMEM_MAX77759)		+= nvmem-max77759.o
+nvmem-max77759-y			:= max77759-nvmem.o
 obj-$(CONFIG_NVMEM_MESON_EFUSE)		+= nvmem_meson_efuse.o
 nvmem_meson_efuse-y			:= meson-efuse.o
 obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
diff --git a/drivers/nvmem/max77759-nvmem.c b/drivers/nvmem/max77759-nvmem.c
new file mode 100644
index 0000000000000000000000000000000000000000..48727cdfd392bd686a524202f9752a19def9b115
--- /dev/null
+++ b/drivers/nvmem/max77759-nvmem.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright 2020 Google Inc
+// Copyright 2025 Linaro Ltd.
+//
+// NVMEM driver for Maxim MAX77759
+
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/device/driver.h>
+#include <linux/err.h>
+#include <linux/mfd/max77759.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/overflow.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+
+#define MAX77759_NVMEM_OPCODE_HEADER_LEN 3
+/*
+ * NVMEM commands have a three byte header (which becomes part of the command),
+ * so we need to subtract that.
+ */
+#define MAX77759_NVMEM_SIZE (MAX77759_MAXQ_OPCODE_MAXLENGTH \
+			     - MAX77759_NVMEM_OPCODE_HEADER_LEN)
+
+struct max77759_nvmem {
+	struct device *dev;
+	struct max77759 *max77759;
+};
+
+static bool max77759_nvmem_is_valid(unsigned int offset, size_t bytes)
+{
+	return (offset + bytes - 1 <= MAX77759_NVMEM_SIZE);
+}
+
+static int max77759_nvmem_reg_read(void *priv, unsigned int offset,
+				   void *val, size_t bytes)
+{
+	struct max77759_nvmem *nvmem = priv;
+	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length,
+		    MAX77759_NVMEM_OPCODE_HEADER_LEN);
+	DEFINE_FLEX(struct max77759_maxq_response, rsp, rsp, length,
+		    MAX77759_MAXQ_OPCODE_MAXLENGTH);
+	int ret;
+
+	if (!max77759_nvmem_is_valid(offset, bytes)) {
+		dev_err(nvmem->dev, "outside NVMEM area: %u / %zu\n",
+			offset, bytes);
+		return -EINVAL;
+	}
+
+	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_USER_SPACE_READ;
+	cmd->cmd[1] = offset;
+	cmd->cmd[2] = bytes;
+	rsp->length = bytes + MAX77759_NVMEM_OPCODE_HEADER_LEN;
+
+	ret = max77759_maxq_command(nvmem->max77759, cmd, rsp);
+	if (ret < 0)
+		return ret;
+
+	if (memcmp(cmd->cmd, rsp->rsp, MAX77759_NVMEM_OPCODE_HEADER_LEN)) {
+		dev_warn(nvmem->dev, "protocol error (read)\n");
+		return -EIO;
+	}
+
+	memcpy(val, &rsp->rsp[MAX77759_NVMEM_OPCODE_HEADER_LEN], bytes);
+
+	return 0;
+}
+
+static int max77759_nvmem_reg_write(void *priv, unsigned int offset,
+				    void *val, size_t bytes)
+{
+	struct max77759_nvmem *nvmem = priv;
+	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length,
+		    MAX77759_MAXQ_OPCODE_MAXLENGTH);
+	DEFINE_FLEX(struct max77759_maxq_response, rsp, rsp, length,
+		    MAX77759_MAXQ_OPCODE_MAXLENGTH);
+	int ret;
+
+	if (!max77759_nvmem_is_valid(offset, bytes)) {
+		dev_err(nvmem->dev, "outside NVMEM area: %u / %zu\n",
+			offset, bytes);
+		return -EINVAL;
+	}
+
+	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE;
+	cmd->cmd[1] = offset;
+	cmd->cmd[2] = bytes;
+	memcpy(&cmd->cmd[MAX77759_NVMEM_OPCODE_HEADER_LEN], val, bytes);
+	cmd->length = bytes + MAX77759_NVMEM_OPCODE_HEADER_LEN;
+	rsp->length = cmd->length;
+
+	ret = max77759_maxq_command(nvmem->max77759, cmd, rsp);
+	if (ret < 0)
+		return ret;
+
+	if (memcmp(cmd->cmd, rsp->rsp, cmd->length)) {
+		dev_warn(nvmem->dev, "protocol error (write)\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int max77759_nvmem_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {
+		.dev = &pdev->dev,
+		.name = dev_name(&pdev->dev),
+		.id = NVMEM_DEVID_NONE,
+		.type = NVMEM_TYPE_EEPROM,
+		.ignore_wp = true,
+		.size = MAX77759_NVMEM_SIZE,
+		.word_size = sizeof(u8),
+		.stride = sizeof(u8),
+		.reg_read = max77759_nvmem_reg_read,
+		.reg_write = max77759_nvmem_reg_write,
+	};
+	struct max77759_nvmem *nvmem;
+
+	nvmem = devm_kzalloc(&pdev->dev, sizeof(*nvmem), GFP_KERNEL);
+	if (!nvmem)
+		return -ENOMEM;
+
+	nvmem->dev = &pdev->dev;
+	nvmem->max77759 = dev_get_drvdata(pdev->dev.parent);
+
+	config.priv = nvmem;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
+}
+
+static const struct of_device_id max77759_nvmem_of_id[] = {
+	{ .compatible = "maxim,max77759-nvmem", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max77759_nvmem_of_id);
+
+static struct platform_driver max77759_nvmem_driver = {
+	.driver = {
+		.name = "max77759-nvmem",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = max77759_nvmem_of_id,
+	},
+	.probe = max77759_nvmem_probe,
+};
+
+module_platform_driver(max77759_nvmem_driver);
+
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
+MODULE_DESCRIPTION("NVMEM driver for Maxim MAX77759");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:max77759-nvmem");

-- 
2.49.0.395.g12beb8f557-goog


