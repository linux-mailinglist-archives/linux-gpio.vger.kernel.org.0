Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364CD38FA06
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 07:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhEYFne (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 01:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhEYFne (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 May 2021 01:43:34 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33954C061574
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 22:42:04 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id q15so21828429pgg.12
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 22:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xPU34K0Muv/QXxYXLtdhoX3R2s6CNJi9OljN9dmd/KU=;
        b=eE5kEGAtMpQaMJMeBXvELvBeADRCpsVxiaAzGUydTOkJiIHwlf/DnfIrrEljluq3K0
         uACtmOMrfH+wDSvksS7z2JTFAx0cCVoBxMktyZ87nu0XM5h3CVNpBiwJf3THytcEzLoB
         w3rPmFzy3nfbIjKfvdFWiQa/FUzs46rx/nPcqV8Rs9EyR1Yf0/MEytCP0rs7bvNjFdEn
         H6UspeE+UMdTrBDf6U3SNxluZYVsbIQZP8Rgh5UnTX9HGadSOuEjdRiAjCtU2yqCgpU0
         K5wS8cVXJ3BXtBQQQYPpWyx3pyurXRm2/VhsAl1Pz9NNiz8+Y329xPDhIh6h8Mv/5OQJ
         LaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xPU34K0Muv/QXxYXLtdhoX3R2s6CNJi9OljN9dmd/KU=;
        b=j43GxxZJ/xQAV7tmLLn7CFwI3K6QXFB2/oIZj7dK+ExRVSS48vB1h6zhOOSLnwwUKS
         sQ6iN1hf5A57ibhPxZnqrjNa26UkJCvwc9cyunz+cTz7c9zsyEy1ukRSo5J/W94RlsKS
         8iRrDlgmcfgmKdSDfBLFZG8FRTqgcFw4u2fZb79BX818V/iU1HEAYsjq1SDCd0Uijqr1
         Eq2UEdFbH66PfH3CMQ55JK9S7Ni9GYD83yIvyH0qeYsmLnwkg3Rr7ZtcdH8d8K4rHpDR
         CBCTMf6SJecHQYW704O0Sjg8ZvnnOHKlQk64TPdtMkGr1vxx8OXjGkrBrYKUCmufJhgz
         9RpQ==
X-Gm-Message-State: AOAM532fE8gWDCcG53ZfJcLHW+u6tguoX7OCzC7d9dTY+f0pIM9ez4Sx
        0A8Mm8PzcU8SPbD9QZMRF+2AGX4pVnw=
X-Google-Smtp-Source: ABdhPJwvxFkK0z+rod2YURSXfwAW9o5kfMAhNR+n9ck9DQ+rinDY/gPoE+eEtQEs276CQtO8k7kmfg==
X-Received: by 2002:a62:1b47:0:b029:2e8:ff52:16ab with SMTP id b68-20020a621b470000b02902e8ff5216abmr4688435pfb.5.1621921323583;
        Mon, 24 May 2021 22:42:03 -0700 (PDT)
Received: from asus-UPX-TGL01.hitronhub.home ([61.64.1.242])
        by smtp.gmail.com with ESMTPSA id m3sm13208256pfh.174.2021.05.24.22.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 22:42:03 -0700 (PDT)
From:   aaeon.asus@gmail.com
X-Google-Original-From: kunyang_fan@asus.com
To:     linux-gpio@vger.kernel.org
Cc:     acelan.kao@canonical.com, Kunyang_Fan <kunyang_fan@asus.com>
Subject: [PATCH 2/5] gpio: add driver for AAEON devices
Date:   Tue, 25 May 2021 13:41:46 +0800
Message-Id: <20210525054149.1792-2-kunyang_fan@asus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525054149.1792-1-kunyang_fan@asus.com>
References: <20210525054149.1792-1-kunyang_fan@asus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Kunyang_Fan <kunyang_fan@asus.com>

This patch add support for the GPIO pins whose control are
transported to BIOS through ASUS WMI interface.

Signed-off-by: Kunyang_Fan <kunyang_fan@asus.com>
---
 drivers/gpio/Kconfig      |  11 ++
 drivers/gpio/Makefile     |   1 +
 drivers/gpio/gpio-aaeon.c | 205 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 217 insertions(+)
 create mode 100644 drivers/gpio/gpio-aaeon.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 6d2437676a75..26acac425583 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1356,6 +1356,17 @@ endmenu
 menu "PCI GPIO expanders"
 	depends on PCI
 
+config GPIO_AAEON
+	tristate "AAEON GPIO support"
+	depends on ASUS_WMI
+	select MFD_AAEON
+	help
+	  Say yes here to support GPIO pins on Single Board Computers produced
+	  by AAEON.
+
+	  This driver leverages the ASUS WMI interface to access device
+	  resources.
+
 config GPIO_AMD8111
 	tristate "AMD 8111 GPIO driver"
 	depends on X86 || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 1e4894e0bf0f..50682c5c49d3 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)		+= gpio-104-idi-48.o
 obj-$(CONFIG_GPIO_104_IDIO_16)		+= gpio-104-idio-16.o
 obj-$(CONFIG_GPIO_74X164)		+= gpio-74x164.o
 obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
+obj-$(CONFIG_GPIO_AAEON)                += gpio-aaeon.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)		+= gpio-adp5588.o
diff --git a/drivers/gpio/gpio-aaeon.c b/drivers/gpio/gpio-aaeon.c
new file mode 100644
index 000000000000..3183c45dd194
--- /dev/null
+++ b/drivers/gpio/gpio-aaeon.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AAEON GPIO driver
+ * Copyright (c) 2021, AAEON Ltd.
+ *
+ * Author: Edward Lin <edward1_lin@aaeon.com.tw>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_data/x86/asus-wmi.h>
+#include <linux/platform_device.h>
+
+#define DRVNAME "gpio_aaeon"
+#define ASUS_NB_WMI_EVENT_GUID   "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
+#define AAEON_WMI_MGMT_GUID      "97845ED0-4E6D-11DE-8A39-0800200C9A66"
+
+#define GET_GPIO_NUMBER_ID       0x00010000
+#define GET_LEVEL_METHOD_ID      0x00010001
+#define SET_LEVEL_METHOD_ID      0x00010002
+#define GET_DIRECTION_METHOD_ID  0x00010003
+#define SET_DIRECTION_METHOD_ID  0x00010004
+#define GET_SIO_NUMBER_METHOD_ID 0xF0010
+
+struct aaeon_gpio_bank {
+	struct gpio_chip chip;
+	unsigned int regbase;
+	struct aaeon_gpio_data *data;
+};
+
+struct aaeon_gpio_data {
+	int nr_bank;
+	struct aaeon_gpio_bank *bank;
+};
+
+static int aaeon_gpio_get_number(void);
+static int aaeon_gpio_get_direction(struct gpio_chip *chip,
+				 unsigned int offset);
+static int aaeon_gpio_output_set_direction(struct gpio_chip *chip,
+				 unsigned int offset, int value);
+static int aaeon_gpio_input_set_direction(struct gpio_chip *chip,
+				 unsigned int offset);
+static int aaeon_gpio_get(struct gpio_chip *chip,
+				 unsigned int offset);
+static void aaeon_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				 int value);
+
+#define AAEON_GPIO_BANK(_base, _ngpio, _regbase)			\
+{									\
+	.chip = {							\
+		.label            = DRVNAME,				\
+		.owner            = THIS_MODULE,			\
+		.get_direction    = aaeon_gpio_get_direction,		\
+		.direction_input  = aaeon_gpio_input_set_direction,     \
+		.direction_output = aaeon_gpio_output_set_direction,    \
+		.get              = aaeon_gpio_get,			\
+		.set              = aaeon_gpio_set,			\
+		.base             = _base,				\
+		.ngpio            = _ngpio,				\
+		.can_sleep        = true,				\
+	},								\
+	.regbase = _regbase,						\
+}
+
+static struct aaeon_gpio_bank aaeon_gpio_bank[] = {
+	AAEON_GPIO_BANK(0, 0, 0xF0),
+};
+
+static int aaeon_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	int err, retval;
+	u32 dev_id = 0x0;
+
+	dev_id |= offset;
+	err = asus_wmi_evaluate_method(GET_DIRECTION_METHOD_ID, dev_id,
+				       0, &retval);
+	if (err)
+		return err;
+
+	return retval;
+}
+
+static int aaeon_gpio_input_set_direction(struct gpio_chip *chip,
+					  unsigned int offset)
+{
+	int err, retval;
+	u32 dev_id;
+
+	dev_id = BIT(16) | offset;
+	err = asus_wmi_evaluate_method(SET_DIRECTION_METHOD_ID, dev_id,
+				       0, &retval);
+	if (err)
+		return err;
+
+	return retval;
+}
+
+static int aaeon_gpio_output_set_direction(struct gpio_chip *chip,
+					   unsigned int offset, int value)
+{
+	int err, retval;
+	u32 dev_id = 0x0;
+
+	dev_id |= offset;
+	err = asus_wmi_evaluate_method(SET_DIRECTION_METHOD_ID, dev_id,
+				       0, &retval);
+	if (err)
+		return err;
+
+	return retval;
+}
+
+static int aaeon_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	int err, retval;
+	u32 dev_id = 0x0;
+
+	dev_id |= offset;
+	err = asus_wmi_evaluate_method(GET_LEVEL_METHOD_ID, dev_id, 0, &retval);
+	if (err)
+		return err;
+
+	return retval;
+}
+
+static void aaeon_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
+{
+	int retval;
+	u32 dev_id = offset;
+
+	if (value)
+		dev_id = BIT(16) | dev_id;
+
+	asus_wmi_evaluate_method(SET_LEVEL_METHOD_ID, dev_id, 0, &retval);
+}
+
+static int aaeon_gpio_get_number(void)
+{
+	int err, retval;
+
+	err = asus_wmi_evaluate_method(GET_GPIO_NUMBER_ID,
+				       GET_SIO_NUMBER_METHOD_ID,
+				       0, &retval);
+	if (err)
+		return err;
+
+	return retval;
+}
+
+static int __init aaeon_gpio_probe(struct platform_device *pdev)
+{
+	int err, i;
+	int dio_number = 0;
+	struct aaeon_gpio_data *data;
+	struct aaeon_gpio_bank *bank;
+
+	/* Prevent other drivers adding this platfom device */
+	if (!wmi_has_guid(AAEON_WMI_MGMT_GUID)) {
+		pr_debug("AAEON Management GUID not found\n");
+		return -ENODEV;
+	}
+
+	dio_number = aaeon_gpio_get_number();
+	if (dio_number < 0)
+		return -ENODEV;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->nr_bank = ARRAY_SIZE(aaeon_gpio_bank);
+	data->bank = aaeon_gpio_bank;
+	platform_set_drvdata(pdev, data);
+	bank = &data->bank[0];
+	bank->chip.parent = &pdev->dev;
+	bank->chip.ngpio = dio_number;
+	bank->data = data;
+	err = devm_gpiochip_add_data(&pdev->dev, &bank->chip, bank);
+	if (err)
+		pr_debug("Failed to register gpiochip %d: %d\n", i, err);
+
+	return err;
+}
+
+static struct platform_driver aaeon_gpio_driver = {
+	.driver = {
+		.name = "gpio-aaeon",
+	},
+};
+
+module_platform_driver_probe(aaeon_gpio_driver, aaeon_gpio_probe);
+
+MODULE_ALIAS("platform:gpio-aaeon");
+MODULE_DESCRIPTION("AAEON GPIO Driver");
+MODULE_AUTHOR("Edward Lin <edward1_lin@aaeon.com.tw>");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

