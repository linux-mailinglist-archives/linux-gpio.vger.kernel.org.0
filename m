Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17749624A62
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Nov 2022 20:13:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiKJTNa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Nov 2022 14:13:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbiKJTN1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Nov 2022 14:13:27 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC27223
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 11:13:24 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bs21so3660271wrb.4
        for <linux-gpio@vger.kernel.org>; Thu, 10 Nov 2022 11:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WGf3GQKOccs9lY3FtDCrRoqbt1lW35NvrExHVzLDdM=;
        b=Kt2JmDiqbFUo7G2kcPvmf5gSoK9ygAiZ70cLLlP9rXpctOwcrHcj4Esu2kS4SfdKNx
         c9sgLUtg6+0T1fiwmU7i9ImC7EZJRTUAA33u9ouyTR7KzXbe4P0Ri0ZID2fbP6T3Gab4
         5iJ7vTRm3ScOrq5Y94nWf8voDwAGjmFHfUOgpF+iSgMtLikoc3a9frktG2SzxH8byayu
         F8F/tvIM+EUKgbj/IcZxXgHn3GHR5xlYl5EjVn6H9o+G4huU3P/VmZzrF5nRoOmeVimb
         NpJotGami1lXV993G2niSAAFxg0PYzBd99obPNAzKWQOEr3Zwfpymtv+snsV/pKE7wW9
         OXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WGf3GQKOccs9lY3FtDCrRoqbt1lW35NvrExHVzLDdM=;
        b=lC0hcQu7aLbBsDWPjHZt/w6MchqVNczFBXiDOfZjmnr0PupSqlzbATT9Ev34bPYRHd
         HnGLm/tQzjzxQHbR0oPCoe2CgycVXtcCoIGLJxAqvX1K25+z++cRq5s/nZqcIWJPUXCz
         6H9IikFFapoRicQHLzUYDKKmck9QtDcQU9lQgs5fx1o0vZvIOJcA+/rTZQQ6Wh/w1kvZ
         U+wu1Ugng6dW/OgpFObTv1pzWyhFWK3iVqn8GTeiO/5QNrZwPra11Z6s7SgVbI9r+QvA
         rUlnzAZ60bZJVoDpo6uy9tK9FMoqnbGygw4jGxLxAnhyQEHnWS5zHN0sFlOcDM1q+vPt
         kgpw==
X-Gm-Message-State: ANoB5pkHmMxf85GyEhW2ANY+hSrQy94V/5W9NxkeBeTIQuo1ScKkPn/o
        +UnzjuCfBOQ00RVkfvONs0jk//iipK1IpA==
X-Google-Smtp-Source: AA0mqf6Zfy4ir7p7yywMIxe+nMRLaEbQ/2oib3ags0RwKS+mi2Lt9Ld9ozxs1AfzHEDEP9CB26HENQ==
X-Received: by 2002:adf:f60f:0:b0:23a:d94d:40d1 with SMTP id t15-20020adff60f000000b0023ad94d40d1mr22446034wrp.18.1668107602553;
        Thu, 10 Nov 2022 11:13:22 -0800 (PST)
Received: from localhost.localdomain ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id bk28-20020a0560001d9c00b002365b759b65sm17025102wrb.86.2022.11.10.11.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:13:21 -0800 (PST)
From:   Niyas Sait <niyas.sait@linaro.org>
To:     linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, rafael@kernel.org,
        linus.walleij@linaro.org
Cc:     Niyas Sait <niyas.sait@linaro.org>
Subject: [PATCH RFC 1/3] pinctrl: add support for acpi PinGroup resource
Date:   Thu, 10 Nov 2022 19:12:56 +0000
Message-Id: <20221110191258.1134378-2-niyas.sait@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110191258.1134378-1-niyas.sait@linaro.org>
References: <20221110191258.1134378-1-niyas.sait@linaro.org>
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
 drivers/pinctrl/pinctrl-acpi.c | 59 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-acpi.h | 22 +++++++++++++
 3 files changed, 82 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-acpi.c
 create mode 100644 drivers/pinctrl/pinctrl-acpi.h

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index e76f5cdc64b0..0b0ec4080942 100644
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
index 000000000000..75e59fe22387
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-acpi.c
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Linaro Ltd.
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
+
+	if (ares->type != ACPI_RESOURCE_TYPE_PIN_GROUP)
+		return 1;
+
+	ares_pin_group = &ares->data.pin_group;
+
+	desc = kzalloc(sizeof(struct pinctrl_acpi_group_desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+
+	desc->name = kstrdup_const(ares_pin_group->resource_label.string_ptr, GFP_KERNEL);
+	desc->pins = ares_pin_group->pin_table;
+	desc->num_pins = ares_pin_group->pin_table_length;
+	desc->vendor_data = ares_pin_group->vendor_data;
+	desc->vendor_length = ares_pin_group->vendor_length;
+
+	INIT_LIST_HEAD(&desc->list);
+	list_add(&desc->list, group_desc_list);
+
+	return 1;
+}
+
+/* Get list of acpi pin groups definitions for the controller */
+int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list)
+{
+	struct list_head res_list;
+	int ret;
+
+	INIT_LIST_HEAD(&res_list);
+	INIT_LIST_HEAD(group_desc_list);
+
+	ret = acpi_dev_get_resources(adev, &res_list,
+								 pinctrl_acpi_populate_group_desc,
+								 group_desc_list);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&res_list);
+
+	return 0;
+}
diff --git a/drivers/pinctrl/pinctrl-acpi.h b/drivers/pinctrl/pinctrl-acpi.h
new file mode 100644
index 000000000000..1a0c751a7594
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-acpi.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 Linaro Ltd.
+ */
+
+struct pinctrl_acpi_group_desc {
+	const char *name;
+	short unsigned int *pins;
+	unsigned num_pins;
+	void *vendor_data;
+	unsigned vendor_length;
+	struct list_head list;
+};
+
+#ifdef CONFIG_ACPI
+int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list);
+#else
+int pinctrl_acpi_get_pin_groups(struct acpi_device *adev, struct list_head *group_desc_list)
+{
+	return -ENODEV;
+}
+#endif
-- 
2.25.1

