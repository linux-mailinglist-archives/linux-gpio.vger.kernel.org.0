Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F163B62A0C3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Nov 2022 18:54:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbiKORyg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Nov 2022 12:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbiKORye (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Nov 2022 12:54:34 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D84F1117F
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 09:54:31 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id cl5so25592495wrb.9
        for <linux-gpio@vger.kernel.org>; Tue, 15 Nov 2022 09:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXEeulXISkKmQY+a1ul9KIhHQ73Ijf36/Evf9Nvz9q8=;
        b=sjOAad24nz8PGqjC2Eglq/toxu/uO2SyqyiUQMn4mD65hoeXP49sFm9poj1MfUm3M1
         2HbrdJnxudNIz7hXvHYqmWJgCRp60gbnzQ7b5MSSh0P9qvl8RPFvqknbGrk03T54de9B
         IJZB6L56t0BwX9Trd2u1VyEiV3YhqcwiRCnH4a97q5ElcfaKzhTxl9n0Ua1JGWtlWb8s
         1YOq4TSu97NP2RPLUuv8ELUgv6NUXkLWo/7zrsAuWIFfpHrc9EinLwLI8PElv55UgbUV
         0pmFvknvK2T4jNKLV18Z/2C4kfLvSEAhaRAu/aNSo9o4UXqMrfAt8aql8qkn+GglDU5X
         45zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXEeulXISkKmQY+a1ul9KIhHQ73Ijf36/Evf9Nvz9q8=;
        b=mUCfBRYPeCtv9wzC1nOcE4Vu0I2GxZS/bQixW6QafrovpQLuUfESZgNGPKUXeI/lmX
         JpSccgskf+Mb0aJi+QnOWLqVUm3AenpwSRsSmlqSpkay+P2OV27bZpEmeEvy2pW1JaET
         Eatb8RO7cIt8CxcZeMtstI9PMPWwDk6pZ+OPgcnpMI6XEyVBMJkweR6nqD3Jsb+gDomG
         qvfRWFGVlUF7j5sRX8jWaq8pBSHHRZMQCLdY3qEPFNMU9VcTAduWC4MUVHzUrX/Y7p8p
         Fen9/KLLXHu5s1lBfrOOa1vJldViP1s7TP1aSu/EqtsGgTbSXV3MD1xfhrjB6OJIvCef
         4VNg==
X-Gm-Message-State: ANoB5pnuvMQDS73Yr8u8CWktff47V4caW3Vh1jYmQi35ZyjVc4smjbC8
        0pFMMb07kATV8Qq5WBg2BI4TYvpeFC6GzQBq
X-Google-Smtp-Source: AA0mqf6UfND7iivAgsn9lO/yiaJKw14i8fJc6ohCSKfWoY6AyRPHCE9bMzSoY7OGWkbY+tzIFkBjZA==
X-Received: by 2002:adf:e38d:0:b0:236:78cd:f3d2 with SMTP id e13-20020adfe38d000000b0023678cdf3d2mr12047072wrm.719.1668534869716;
        Tue, 15 Nov 2022 09:54:29 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id f20-20020a05600c155400b003c6f3e5ba42sm26599521wmg.46.2022.11.15.09.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 09:54:29 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH RFC v2 1/3] pinctrl: add support for ACPI PinGroup resource
Date:   Tue, 15 Nov 2022 17:54:13 +0000
Message-Id: <20221115175415.650690-2-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115175415.650690-1-niyas.sait@linaro.org>
References: <20221115175415.650690-1-niyas.sait@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pinctrl-acpi parses and decode PinGroup resources for
the device and generate list of group descriptor.
Descriptors can be used by the pin controller to identify
the groups and pins provided in the group.

Signed-off-by: Niyas Sait <niyas.sait@linaro.org>
---
 drivers/pinctrl/Makefile       |  1 +
 drivers/pinctrl/pinctrl-acpi.c | 99 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-acpi.h | 34 ++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-acpi.c
 create mode 100644 drivers/pinctrl/pinctrl-acpi.h

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 89bfa01b5231..b5423465131f 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PINMUX)		+= pinmux.o
 obj-$(CONFIG_PINCONF)		+= pinconf.o
 obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
 obj-$(CONFIG_OF)		+= devicetree.o
+obj-$(CONFIG_ACPI)		+= pinctrl-acpi.o
 
 obj-$(CONFIG_PINCTRL_AMD)	+= pinctrl-amd.o
 obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
diff --git a/drivers/pinctrl/pinctrl-acpi.c b/drivers/pinctrl/pinctrl-acpi.c
new file mode 100644
index 000000000000..cd0d4b2d8868
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-acpi.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ACPI helpers for PinCtrl API
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ * Author: Niyas Sait <niyas.sait@linaro.org>
+ */
+#include <linux/acpi.h>
+#include <linux/errno.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/list.h>
+
+#include "pinctrl-acpi.h"
+
+static int pinctrl_acpi_populate_group_desc(struct acpi_resource *ares, void *data)
+{
+	struct acpi_resource_pin_group *ares_pin_group;
+	struct pinctrl_acpi_group_desc *desc;
+	struct list_head *group_desc_list = data;
+	int i;
+
+	if (ares->type != ACPI_RESOURCE_TYPE_PIN_GROUP)
+		return 1;
+
+	ares_pin_group = &ares->data.pin_group;
+	desc = kzalloc(sizeof(struct pinctrl_acpi_group_desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+
+	desc->name = kstrdup_const(ares_pin_group->resource_label.string_ptr, GFP_KERNEL);
+	desc->num_pins = ares_pin_group->pin_table_length;
+	desc->pins = kmalloc_array(desc->num_pins, sizeof(*desc->pins), GFP_KERNEL);
+	if (!desc->pins)
+		return -ENOMEM;
+
+	for (i = 0; i < desc->num_pins; i++)
+		desc->pins[i] = ares_pin_group->pin_table[i];
+
+	desc->vendor_length = ares_pin_group->vendor_length;
+	desc->vendor_data = kmalloc_array(desc->vendor_length,
+				sizeof(*desc->vendor_data),
+				GFP_KERNEL);
+	if (!desc->vendor_data)
+		return -ENOMEM;
+
+	for (i = 0; i < desc->vendor_length; i++)
+		desc->vendor_data[i] = ares_pin_group->vendor_data[i];
+
+	INIT_LIST_HEAD(&desc->list);
+	list_add(&desc->list, group_desc_list);
+
+	return 1;
+}
+
+/**
+ * pinctrl_acpi_get_pin_groups() - Get ACPI PinGroup Descriptors for the device
+ * @adev: ACPI device node for retrieving PinGroup descriptors
+ * @group_desc_list: list head to add PinGroup descriptors
+ *
+ * This will parse ACPI PinGroup resources for the given ACPI device
+ * and will add descriptors to the provided @group_desc_list list
+ */
+int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list)
+{
+	struct list_head res_list;
+	int ret;
+
+	INIT_LIST_HEAD(&res_list);
+	INIT_LIST_HEAD(group_desc_list);
+	ret = acpi_dev_get_resources(adev, &res_list,
+		pinctrl_acpi_populate_group_desc, group_desc_list);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&res_list);
+
+	return 0;
+}
+
+/**
+ * pinctrl_acpi_free_group_desc() - free allocated group descriptor
+ * @group_desc_list: list head for group descriptor to free
+ *
+ * Call this function to free the allocated group descriptors
+ */
+void pinctrl_acpi_free_group_desc(struct list_head *group_desc_list)
+{
+	struct pinctrl_acpi_group_desc *grp, *tmp;
+
+	list_for_each_entry_safe(grp, tmp, group_desc_list, list) {
+		list_del(&grp->list);
+		kfree_const(grp->name);
+		kfree(grp->pins);
+		kfree(grp->vendor_data);
+		kfree(grp);
+	}
+}
diff --git a/drivers/pinctrl/pinctrl-acpi.h b/drivers/pinctrl/pinctrl-acpi.h
new file mode 100644
index 000000000000..e3a6b61bea90
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-acpi.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ACPI helpers for PinCtrl API
+ *
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+
+/**
+ * struct pinctrl_acpi_group_desc - Descriptor to hold PinGroup resource from ACPI
+ * @name: name of the pin group
+ * @pins: array of pins that belong to the group
+ * @num_pins: number of pins in the group
+ * @vendor_data: vendor data from parsed ACPI resources
+ * @vendor_length: length of vendor data
+ * @list: list head for the descriptor
+ */
+struct pinctrl_acpi_group_desc {
+	const char *name;
+	u16 *pins;
+	unsigned int num_pins;
+	u8 *vendor_data;
+	unsigned int vendor_length;
+	struct list_head list;
+};
+
+#ifdef CONFIG_ACPI
+int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list);
+#else
+static inline int pinctrl_acpi_get_pin_groups(struct acpi_device *adev,
+			struct list_head *group_desc_list)
+{
+	return -ENXIO;
+}
+#endif
-- 
2.25.1

