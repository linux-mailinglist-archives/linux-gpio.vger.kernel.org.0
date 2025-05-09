Return-Path: <linux-gpio+bounces-19860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C94AB150F
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 15:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEE9E4A34F3
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 13:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F797293B6B;
	Fri,  9 May 2025 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e1+TuFbL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD2293461
	for <linux-gpio@vger.kernel.org>; Fri,  9 May 2025 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796970; cv=none; b=U1IpuR4r7YHpIXkFe77xl6yMCLYwyE4JdmIOgBTaZtt1N/ie0WZtJFqbnv+YKFsHCpiizqfyd6uV6+Q20xtWub2QGrUJCJCiBHQCDeRQ6mN3IgwMWFVjMS1YZOVwWz7TFtBUZ+faxsCsv5MK5fhQmp7S/miRozQw8lNb7ia8De8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796970; c=relaxed/simple;
	bh=/mZP2OrE28e5JyoqtSS7fqAL/4QF+o0BXmWLnuT0cI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AqNlZQuIsVy/F29vsmomZoFNJLDHHq/7IrUEujS/paDglIZCwTPhYMyZGMpI4WVAUXL2zBvCDwq3aHmmlhw21uqH/WsnG4FqQbTIPDVAA7Jnw/3aHOjekpOW1wWPzjqtX8kvAbIzik7dEFzwLVA90NIZUWHqk+/KC0SlvAEhvyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e1+TuFbL; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fbfa0a7d2cso3536917a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2025 06:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746796964; x=1747401764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1wPx9dQB2TQWNZZh5fQKMJn2HZQ5KR14ZSSeMoTM34=;
        b=e1+TuFbLjNgvEONcFmWHQE98uSbZUELO5LQ+t3K7NeqyTztf4TzIclLJb0ogIQ4MSo
         Jri+UGdRuL04bKhdt3v2QVwKC/pBB+dcEUSG/2DcgiesBtBz6xZT3L+2589CDNmIbJ3O
         NnEUbKEQYDNWmwR/4urCJnlB3DU3AHeTTyQhZHGMY+14K4G5hkMTMLYvcSvRqPS2Dn6w
         F7d6xybHOxxSTKk6vgKpDaItHZWkSELE/Yn3hZKJnkazNpgBxDCARaGojR5iIknOYU10
         j+Gx1QMgcihbQwnjM1IlNEoOXNE/VVuT8BJklBm0ApaiOTtOvN0feyiCe2dEOXk8F1gJ
         ktgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796964; x=1747401764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1wPx9dQB2TQWNZZh5fQKMJn2HZQ5KR14ZSSeMoTM34=;
        b=LJ6mA69sNgU6rRdeASMbdlLTa1ntS2LiiKxdA9y7Qd9m8FpMgQxCfRwvvCkr/qIJ8H
         Z2A/tryUq6FD7NdtQimzjNHwj0+OJGh0DmWietKGEPkh9iOjHtuoqbdcJfTijdFbRmYC
         rcwBk6+bMs3A8KTV9Qgc5frwnNOUPYIxFnrREKh0Q9bTsGTTX+2VZsDjIbeclodsfjQw
         BW/TCwodJEHgBxbkJe+DKbz62ijsC+Y9rWXjpHkuePvLuYShg17Vq1a/6ZWyo9ipgpfT
         cKpXuuP04/4DLk2k9qUzuSPflV/rEc5dpA1Ec6YVQaGPJ9xkQ78Zhf9Dqv+N6Fhna2so
         /xTw==
X-Forwarded-Encrypted: i=1; AJvYcCWos6riZgenKf5GrxYB7O/uRRWyVKW337ap7Xqy72Px2vCYrXTiTHdYttcMW/t2uz50N6+BRDKD/58u@vger.kernel.org
X-Gm-Message-State: AOJu0YwWVFFZmDZ7OsM9RPxL8cco3hs+sxPXGnRk7bnGsfX8krwE03HR
	BZ9PEB81lYZzXm70ai54oxeZ7f8D0ZvAwW0voJG5WKwF0zoetApd1l3HKqmIWgM=
X-Gm-Gg: ASbGncvJ3lRb0Mt8HMHWye9t8VDUUenkHIfRrvh0hyMrnp6v6wRRqzOxz29WSzUHXjk
	cZgnlPhBfQq/9dURuxRdm2BJpaYGgFl+L6xYec0cIXiJm19ecmMSSLXCBQh2e2pzqS/BPU5Mhs3
	qfCPsSiR0i/YHhq2AULRcuurSq6c9OZNxROgjhHPoCRDh83HR9eIQFNZT9IyMHJHZORitApsIrL
	ntTkUF2BUiLRvBKK59qrCeaGGmrKsqL6aC9L9067O2ustU6LHVrR14MJ9RAb/KorRdPTSA8qvyi
	g4SYCfgWg51iwl5Jn7fZzX1ydxq38fYFVpD204/WMEPs7uZt7NVJQGt4w/onEiUNrB0tL9QyAsJ
	BMm7fmAD553y2yISBDzRuV/7M9hKwLwh3Myg=
X-Google-Smtp-Source: AGHT+IElOX4UcWIkgnqhMX1+vmiD0oL3vla4hxS81C5YoTG8Oto1jX93zcwxVElHT4N6w7YONmHV4A==
X-Received: by 2002:a17:907:a784:b0:ad2:2a2f:7069 with SMTP id a640c23a62f3a-ad22a2f719emr76769966b.17.1746796963840;
        Fri, 09 May 2025 06:22:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21947abcasm149041966b.84.2025.05.09.06.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 06:22:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 09 May 2025 14:22:41 +0100
Subject: [PATCH v10 3/3] nvmem: max77759: add Maxim MAX77759 NVMEM driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250509-max77759-mfd-v10-3-962ac15ee3ef@linaro.org>
References: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>
In-Reply-To: <20250509-max77759-mfd-v10-0-962ac15ee3ef@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, 
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

Acked-by: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v9:
* drop superfluous max77759_nvmem_is_valid() (Srini)

v8:
* replace MODULE_ALIAS() with .id_table (Krzysztof)
* drop previous tags

v5:
* follow API updates of max77759 core driver

v2:
* align sentinel in max77759_nvmem_of_id[] with other max77759 drivers
 (Christophe)
---
 MAINTAINERS                    |   1 +
 drivers/nvmem/Kconfig          |  12 ++++
 drivers/nvmem/Makefile         |   2 +
 drivers/nvmem/max77759-nvmem.c | 145 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 160 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96d6891c06e99c288125cb6c0df8a966a031ac42..c3174de20ca7f25c9ce884ab5e4e46cdd047e1ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14721,6 +14721,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
 F:	drivers/gpio/gpio-max77759.c
 F:	drivers/mfd/max77759.c
+F:	drivers/nvmem/max77759-nvmem.c
 F:	include/linux/mfd/max77759.h
 
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 114140c89906b43cfdc807f9c77cd538fc60a05f..d370b2ad11e7eb3a3549a75edaada2d84c1e8dd7 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -167,6 +167,18 @@ config NVMEM_LPC18XX_OTP
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
index 89a3c252c2c8dad9ed7bc6ac9841f63ff85c00d5..2021d59688dbd58ee6895d36610fe670d9479ef5 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -36,6 +36,8 @@ obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+= nvmem_lpc18xx_eeprom.o
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
index 0000000000000000000000000000000000000000..c9961ad0e232e152e924b5b06d7d93172760ac3a
--- /dev/null
+++ b/drivers/nvmem/max77759-nvmem.c
@@ -0,0 +1,145 @@
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
+static const struct platform_device_id max77759_nvmem_platform_id[] = {
+	{ "max77759-nvmem", },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, max77759_nvmem_platform_id);
+
+static struct platform_driver max77759_nvmem_driver = {
+	.driver = {
+		.name = "max77759-nvmem",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = max77759_nvmem_of_id,
+	},
+	.probe = max77759_nvmem_probe,
+	.id_table = max77759_nvmem_platform_id,
+};
+
+module_platform_driver(max77759_nvmem_driver);
+
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
+MODULE_DESCRIPTION("NVMEM driver for Maxim MAX77759");
+MODULE_LICENSE("GPL");

-- 
2.49.0.1015.ga840276032-goog


