Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43088455C92
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Nov 2021 14:22:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhKRNZQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Nov 2021 08:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhKRNZP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Nov 2021 08:25:15 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9139BC061570;
        Thu, 18 Nov 2021 05:22:15 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bi37so25939074lfb.5;
        Thu, 18 Nov 2021 05:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W1ozSFTzW6iBlqeGsm7xnlG661/HZOcRaphE0Mn8yuQ=;
        b=WSn1/wog/OwyjfdshRgjE58acBoLdQrXIxGyAsMo4nxV8MNHwFCqkpgLgdnR76rwqa
         Nn7dsAacuOuRP8yfs1zcIgm8XtNpzSnl02LbuHNGktmHxFodApoY++CuqY5zDtMKZ21v
         F0KrZn6XFxC+Zt1IfaJbUZcxI+/oMFhCr6wKGxV/FbY25UWySE4YoS1wCwWCiLgyye7d
         TESFHk3zwvpCdTQ/T44OQNvzp0gGaKB800oIWbWCVbS6yQL9woZKMvd5vBdtfSWnO7Z7
         YxYdPf85AnHhHv4AnZHU4ODsw60AA/GCXw/n6euTP833uLcEXd3GFwv71MHcotFiFzUA
         mc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W1ozSFTzW6iBlqeGsm7xnlG661/HZOcRaphE0Mn8yuQ=;
        b=a9ApqY5MqM7hh0m2rvpyJW/dQ2SkgAiY/Z3opLKWXHcKuVdEQm3y79o/QoIn4akp7e
         1MJGbhsf51AKxnKyHDQNL4zWL7M1e3CUIXg2bOHTjOl5KJPXghE7s4NW62v2gxuoG1sl
         s9RLDCvz4Ieu+sPXd8bzYDP7IdAY65ElIBRH8dQWwQPaplrIl4+arvB+x4dfQzcgkNMm
         VqEtKK1TNF26MX9Eo8HQzUcXL+PZCer2EM6xaT2Yi5MN5uAT8vynrKg+rcbV55XDD5b7
         2727dESqZPUxs56EsIyk60ddTGMs4Ey7+ELE36glRB/eTePoTQhE3FGz9AAgcfIeazqw
         t/bQ==
X-Gm-Message-State: AOAM532jICN/aKrFUq+GW1UPNW5fPqSe2agffpbvz3b8uDGOTjitOtWn
        U0oOthQaTOSPiqRldIQ/EwSF2CxseT0=
X-Google-Smtp-Source: ABdhPJzhPd3NwZM5kPJNaUrl8UlVEtayxqeTmnQVBr71WveoL1dTgaUVbSqEMK4nQaAyG4q2PA8DgA==
X-Received: by 2002:a2e:9e94:: with SMTP id f20mr8987115ljk.401.1637241733983;
        Thu, 18 Nov 2021 05:22:13 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id bp36sm356550lfb.0.2021.11.18.05.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 05:22:13 -0800 (PST)
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
Subject: [PATCH 3/5] pinctrl: add helpers reading pins, groups & functions from DT
Date:   Thu, 18 Nov 2021 14:21:50 +0100
Message-Id: <20211118132152.15722-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118132152.15722-1-zajec5@gmail.com>
References: <20211118132152.15722-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

DT binding allows specifying pins, groups & functions now. That allows
storing them in DT instead of hardcoding in drivers.

Introduce helpers based on CONFIG_GENERIC_PINCONF,
CONFIG_GENERIC_PINCTRL_GROUPS and CONFIG_GENERIC_PINMUX_FUNCTIONS for
parsing that info into pinctrl generic structures.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/pinctrl/core.c   | 89 ++++++++++++++++++++++++++++++++++++++++
 drivers/pinctrl/core.h   |  5 +++
 drivers/pinctrl/pinmux.c | 43 +++++++++++++++++++
 drivers/pinctrl/pinmux.h |  2 +
 4 files changed, 139 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index ffe39336fcac..8f6ed8488313 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -515,8 +515,97 @@ void pinctrl_remove_gpio_range(struct pinctrl_dev *pctldev,
 }
 EXPORT_SYMBOL_GPL(pinctrl_remove_gpio_range);
 
+int pinctrl_generic_get_dt_pins(struct pinctrl_desc *pctldesc,
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
+		if (of_property_read_u32(np, "reg", &descs[i].number)) {
+			dev_err(dev, "missing \"reg\" property in %pOF\n", np);
+			err = -ENOENT;
+			goto err_put_node;
+		}
+
+		if (of_property_read_string(np, "label", &descs[i].name)) {
+			dev_err(dev, "missing \"label\" property in %pOF\n", np);
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
+EXPORT_SYMBOL_GPL(pinctrl_generic_get_dt_pins);
+
 #ifdef CONFIG_GENERIC_PINCTRL_GROUPS
 
+int pinctrl_generic_get_dt_groups(struct pinctrl_dev *pctldev)
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
+EXPORT_SYMBOL_GPL(pinctrl_generic_get_dt_groups);
+
 /**
  * pinctrl_generic_get_group_count() - returns the number of pin groups
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 840103c40c14..59661d4d4cc7 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -182,6 +182,9 @@ struct pinctrl_maps {
 	unsigned num_maps;
 };
 
+int pinctrl_generic_get_dt_pins(struct pinctrl_desc *pctldesc,
+				struct device *dev);
+
 #ifdef CONFIG_GENERIC_PINCTRL_GROUPS
 
 /**
@@ -198,6 +201,8 @@ struct group_desc {
 	void *data;
 };
 
+int pinctrl_generic_get_dt_groups(struct pinctrl_dev *pctldev);
+
 int pinctrl_generic_get_group_count(struct pinctrl_dev *pctldev);
 
 const char *pinctrl_generic_get_group_name(struct pinctrl_dev *pctldev,
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 6cdbd9ccf2f0..5e34bd3135f5 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -24,6 +24,7 @@
 #include <linux/string.h>
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
+#include <linux/of.h>
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinmux.h>
 #include "core.h"
@@ -788,6 +789,48 @@ void pinmux_init_device_debugfs(struct dentry *devroot,
 
 #ifdef CONFIG_GENERIC_PINMUX_FUNCTIONS
 
+int pinmux_generic_get_dt_functions(struct pinctrl_dev *pctldev)
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
+EXPORT_SYMBOL_GPL(pinmux_generic_get_dt_functions);
+
 /**
  * pinmux_generic_get_function_count() - returns number of functions
  * @pctldev: pin controller device
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 78c3a31be882..ca69025fce46 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -134,6 +134,8 @@ struct function_desc {
 	void *data;
 };
 
+int pinmux_generic_get_dt_functions(struct pinctrl_dev *pctldev);
+
 int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
 
 const char *
-- 
2.31.1

