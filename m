Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B048945D0B6
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 00:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352323AbhKXXIN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Nov 2021 18:08:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232233AbhKXXIL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Nov 2021 18:08:11 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF7EC061574;
        Wed, 24 Nov 2021 15:05:00 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id f18so11268025lfv.6;
        Wed, 24 Nov 2021 15:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jf6byrH4ANB6TExq8PGAH/b0DeVk7tVroeKAe91ZQMA=;
        b=YuXEfoqeeoz4pH50VVL6U1HkVptULVaVyPgPEEbDEf8T2A/euQ3lqUFLD4i0mqTlwq
         sxOLf4/HAHQk3xAjsdKdV4AUHXg611sp2XJu+9S/bPtWwcw2Z7SHf5UljbtHIBThyoCc
         xRB8wL0euX+PlgZJFw7HRcPnNuieA2M6B62lqitOlhyL8FkEKulIcx53XIF3vJXsYwX8
         PbR7+4F+RocD917qxATdpLW0FWbgQRn0moCiArJWe3zIdcikvjQR8MR8580ES1pV4r8D
         wg+O1cwR7YK/wNhnkoCz4Qs9mKFObc561aPpzZ1r7Vqoopeha0wbh0LoDTX6t4xwAbxG
         F1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jf6byrH4ANB6TExq8PGAH/b0DeVk7tVroeKAe91ZQMA=;
        b=WElYkPnKFItoxwdp53w9T65k+k39kopb50YSUveAWsYAU0dCon84SPehDJwdjjBIqI
         gEb2ZQJHlYMEI9CThvXiKSH+UBnXlvz8wP1bJMXkXevIIrqyw0AnQGLgykbjgvIYjrso
         642Q61IDGF/Y0JSuN2Oo8vJUx/NYsPMjNsVY1DaNlIheOwKaMCPBVzzMliyQckGg91V7
         +vk98O6Uc0RZMpKM25fExPoDWuOM/hxfxdmQsvgNhNa/5kYZDp9fG0Ap0wNUSQYK9Bf0
         byiKy98bCcxNrPwbN8U8QsGAknHR2OQVAbU29tYtolqIS2sYsTq+l9WAqw3tNNhkdw96
         3urg==
X-Gm-Message-State: AOAM532ktfyEsQGMqvMlzxAldZgHBC/FX8vRwLjxBiPfpDiDSICyaGqM
        1FDbv9X8HfOEZ0F90Ux8DZE=
X-Google-Smtp-Source: ABdhPJyJn22Wtpwzu5pAhlIuYMkgGMQTdAOfiqhTeUMu7YgI7YJ022htjj1hLABdJ7l4WIVT61FF6Q==
X-Received: by 2002:a05:6512:39d6:: with SMTP id k22mr19465971lfu.559.1637795098680;
        Wed, 24 Nov 2021 15:04:58 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t15sm106243lfp.181.2021.11.24.15.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 15:04:58 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 4/6] pinctrl: support reading pins, groups & functions from DT
Date:   Thu, 25 Nov 2021 00:04:37 +0100
Message-Id: <20211124230439.17531-5-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124230439.17531-1-zajec5@gmail.com>
References: <20211124230439.17531-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

DT binding allows specifying pins, groups & functions now. That allows
storing them in DT instead of hardcoding in drivers.

This adds support for DT as data source to recently introduced API.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Update pinctrl_generic_dt_load_pins() to support new binding
---
 drivers/pinctrl/core.c       |   6 ++
 drivers/pinctrl/devicetree.c | 131 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/devicetree.h |  29 ++++++++
 drivers/pinctrl/pinmux.c     |   4 ++
 4 files changed, 170 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 53b3e8b54a9b..4c39ca338896 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -517,6 +517,9 @@ EXPORT_SYMBOL_GPL(pinctrl_remove_gpio_range);
 
 int pinctrl_generic_load_pins(struct pinctrl_desc *pctldesc, struct device *dev)
 {
+	if (dev->of_node)
+		return pinctrl_generic_dt_load_pins(pctldesc, dev);
+
 	return -ENOENT;
 }
 EXPORT_SYMBOL_GPL(pinctrl_generic_load_pins);
@@ -525,6 +528,9 @@ EXPORT_SYMBOL_GPL(pinctrl_generic_load_pins);
 
 int pinctrl_generic_load_groups(struct pinctrl_dev *pctldev)
 {
+	if (pctldev->dev->of_node)
+		return pinctrl_generic_load_dt_groups(pctldev);
+
 	return -ENOENT;
 }
 EXPORT_SYMBOL_GPL(pinctrl_generic_load_groups);
diff --git a/drivers/pinctrl/devicetree.c b/drivers/pinctrl/devicetree.c
index 3fb238714718..5e511e61449a 100644
--- a/drivers/pinctrl/devicetree.c
+++ b/drivers/pinctrl/devicetree.c
@@ -12,6 +12,7 @@
 
 #include "core.h"
 #include "devicetree.h"
+#include "pinmux.h"
 
 /**
  * struct pinctrl_dt_map - mapping table chunk parsed from device tree
@@ -27,6 +28,136 @@ struct pinctrl_dt_map {
 	unsigned num_maps;
 };
 
+int pinctrl_generic_dt_load_pins(struct pinctrl_desc *pctldesc,
+				struct device *dev)
+{
+	struct pinctrl_pin_desc *descs;
+	struct device_node *pins;
+	struct device_node *np;
+	int err = 0;
+	int i = 0;
+
+	pins = of_get_child_by_name(dev->of_node, "pins");
+	if (!pins) {
+		dev_err(dev, "failed to find \"pins\" DT node\n");
+		err = -ENOENT;
+		goto err_out;
+	}
+
+	pctldesc->npins = of_get_available_child_count(pins);
+
+	descs = devm_kcalloc(dev, pctldesc->npins, sizeof(*descs), GFP_KERNEL);
+	if (!descs) {
+		err = -ENOMEM;
+		goto err_put_node;
+	}
+
+	for_each_available_child_of_node(pins, np) {
+		descs[i].name = np->name;
+
+		if (of_property_read_u32(np, "number", &descs[i].number)) {
+			dev_err(dev, "missing \"number\" property in %pOF\n", np);
+			err = -ENOENT;
+			goto err_put_node;
+		}
+
+		i++;
+	}
+
+	pctldesc->pins = descs;
+
+err_put_node:
+	of_node_put(pins);
+err_out:
+	return err;
+}
+
+#ifdef CONFIG_GENERIC_PINCTRL_GROUPS
+
+int pinctrl_generic_load_dt_groups(struct pinctrl_dev *pctldev)
+{
+	struct device *dev = pctldev->dev;
+	struct device_node *groups;
+	struct device_node *np;
+	int err = 0;
+
+	groups = of_get_child_by_name(dev->of_node, "groups");
+	if (!groups) {
+		dev_err(dev, "failed to find \"groups\" DT node\n");
+		err = -ENOENT;
+		goto err_out;
+	}
+
+	for_each_available_child_of_node(groups, np) {
+		int num_pins;
+		u32 *pins;
+
+		num_pins = of_property_count_u32_elems(np, "pins");
+		pins = devm_kmalloc_array(dev, num_pins, sizeof(*pins), GFP_KERNEL);
+		if (!pins) {
+			err = -ENOMEM;
+			goto err_put_node;
+		}
+
+		if (of_property_read_u32_array(np, "pins", pins, num_pins)) {
+			err = -EIO;
+			goto err_put_node;
+		}
+
+		pinctrl_generic_add_group(pctldev, np->name, pins, num_pins, np);
+	}
+
+err_put_node:
+	of_node_put(groups);
+err_out:
+	return err;
+}
+
+#endif
+
+#ifdef CONFIG_GENERIC_PINMUX_FUNCTIONS
+int pinmux_generic_load_dt_functions(struct pinctrl_dev *pctldev)
+{
+	struct device *dev = pctldev->dev;
+	struct device_node *functions;
+	struct device_node *np;
+	int err = 0;
+
+	functions = of_get_child_by_name(dev->of_node, "functions");
+	if (!functions) {
+		dev_err(dev, "failed to find \"functions\" DT node\n");
+		err = -ENOENT;
+		goto err_out;
+	}
+
+	for_each_available_child_of_node(functions, np) {
+		int num_groups = of_count_phandle_with_args(np, "groups", NULL);
+		struct of_phandle_iterator it;
+		const char **groups;
+		int ret;
+		int i;
+
+		groups = devm_kmalloc_array(dev, num_groups, sizeof(*groups), GFP_KERNEL);
+		if (!groups) {
+			err = -ENOMEM;
+			goto err_put_node;
+		}
+
+		i = 0;
+		of_for_each_phandle(&it, ret, np, "groups", NULL, 0) {
+			groups[i++] = it.node->name;
+		}
+
+		pinmux_generic_add_function(pctldev, np->name, groups, num_groups, np);
+	}
+
+err_put_node:
+	of_node_put(functions);
+err_out:
+	return err;
+}
+#endif
+
 static void dt_free_map(struct pinctrl_dev *pctldev,
 		     struct pinctrl_map *map, unsigned num_maps)
 {
diff --git a/drivers/pinctrl/devicetree.h b/drivers/pinctrl/devicetree.h
index efa80779de4f..156f13896c39 100644
--- a/drivers/pinctrl/devicetree.h
+++ b/drivers/pinctrl/devicetree.h
@@ -9,6 +9,15 @@ struct of_phandle_args;
 
 #ifdef CONFIG_OF
 
+int pinctrl_generic_dt_load_pins(struct pinctrl_desc *pctldesc,
+				struct device *dev);
+#ifdef CONFIG_GENERIC_PINCTRL_GROUPS
+int pinctrl_generic_load_dt_groups(struct pinctrl_dev *pctldev);
+#endif
+#ifdef CONFIG_GENERIC_PINMUX_FUNCTIONS
+int pinmux_generic_load_dt_functions(struct pinctrl_dev *pctldev);
+#endif
+
 void pinctrl_dt_free_maps(struct pinctrl *p);
 int pinctrl_dt_to_map(struct pinctrl *p, struct pinctrl_dev *pctldev);
 
@@ -21,6 +30,26 @@ int pinctrl_parse_index_with_args(const struct device_node *np,
 
 #else
 
+static inline int pinctrl_generic_dt_load_pins(struct pinctrl_desc *pctldesc,
+					      struct device *dev)
+{
+	return -EOPNOTSUPP;
+}
+
+#ifdef CONFIG_GENERIC_PINCTRL_GROUPS
+static inline int pinctrl_generic_load_dt_groups(struct pinctrl_dev *pctldev)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#ifdef CONFIG_GENERIC_PINMUX_FUNCTIONS
+static inline int pinmux_generic_load_dt_functions(struct pinctrl_dev *pctldev)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 static inline int pinctrl_dt_to_map(struct pinctrl *p,
 				    struct pinctrl_dev *pctldev)
 {
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index ef7d2cbf0946..36a1d1af4a20 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -27,6 +27,7 @@
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinmux.h>
 #include "core.h"
+#include "devicetree.h"
 #include "pinmux.h"
 
 int pinmux_check_ops(struct pinctrl_dev *pctldev)
@@ -790,6 +791,9 @@ void pinmux_init_device_debugfs(struct dentry *devroot,
 
 int pinmux_generic_load_functions(struct pinctrl_dev *pctldev)
 {
+	if (pctldev->dev->of_node)
+		return pinmux_generic_load_dt_functions(pctldev);
+
 	return -ENOENT;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_load_functions);
-- 
2.31.1

