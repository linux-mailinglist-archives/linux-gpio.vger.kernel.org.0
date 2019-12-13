Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4143311E476
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 14:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfLMNUt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 08:20:49 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36915 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMNUt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 08:20:49 -0500
Received: by mail-lj1-f196.google.com with SMTP id u17so2622759lja.4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 05:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3lLLEYa4JqozwsOeIKC6yRPJKwsSh2t+1mekpQMYYYQ=;
        b=jfZN5Oic4ZAkmDVwi44aSTFH4Fl2KkcMMA5TNYVyT6OznTZJtnF4qFJUCxOkFS0Jku
         5jUdO2NAbMRsHIR3rm3yzJhisNTboT2g2ilR/FJtMyJROMCIIDv93zLT2MBNO2TgWji6
         30klOG09CswtVsWlcHRAvW92os8znnqfRXE8Jntw9d1Sbdp5flqtM6FWwW3RvxHW4mVi
         XnXaYpM47yPU4LeI7uJuZbOGxBWZzF+ZOHHyHu8PbON3/1R0L2zwcsbLiWALV7Vu1rM6
         CRQ+gkUUAT4F2IXmxFoSW4xwBbRtvJoAVzMK5DFsWo4IV5Jc+mFgfurQxhby7qA8mBeG
         h2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3lLLEYa4JqozwsOeIKC6yRPJKwsSh2t+1mekpQMYYYQ=;
        b=mmmYCq102g3lt7jEzaqhK7Mq//lqTXLlDi2KvMmxlFmvMfeAXJ6DsUHmHOIpPe/P+6
         dM6P/nxsceVCBI4z96+/loyEGxso/QiMNdUIbVxL+Oj5dGY45d8gBfIhqA13/q2ZnbA4
         RZBJCd0WMNzyvHJFGsdjwnRGxHDuOIHcFOPZ25118m+eLYUq0pGbzhjC/2j1sNndbwgA
         BM/j9aGZADPWuMl95YLaa6GZ9mDbrZ3WXIYtNIFlrUchiTj7vBFYi6yH1XO6bpF9VLYE
         IgeMtB6PsG31UiGj4u/4e0wiUqS0noxK/Scn2s0YcOJDPo9VTIDwOM/ijje2fQvQoLA4
         5Tag==
X-Gm-Message-State: APjAAAVPNR7X5uz6tb9NEV8slJT/bXCqklHJDt7ZSXmMNVn7tFg18E59
        l9mMmhjiAZVxB7cFpWFpgJJGSLM/nf0=
X-Google-Smtp-Source: APXvYqyB5DejUXXsJ+z/f8M3sX70yIfWHRM3PUva+ufRhTB9Zru5s5gt7T4L3nL1so0Uk2xqAVryuQ==
X-Received: by 2002:a2e:9886:: with SMTP id b6mr9669354ljj.47.1576243246678;
        Fri, 13 Dec 2019 05:20:46 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id s16sm4613727lfc.35.2019.12.13.05.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 05:20:45 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Benjamin GAIGNARD <benjamin.gaignard@st.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] pinctrl: Enforce device links
Date:   Fri, 13 Dec 2019 14:20:43 +0100
Message-Id: <20191213132043.20806-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of opt-in device links, enforce it across the board.
Everyone probably needs this anyway, lest runtime[_pm] suspend
order will be haphazard.

Cc: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Create links per setting (since settings can be on different
  pin controllers) when adding a setting to a pin control handle,
  instead of doing this when activating the state.
- Store the link inside the setting.
- Delete the link when we free up the setting.

Benjamin: it would be GREAT if you could test this!
---
 drivers/pinctrl/core.c                | 35 +++++++++++++++++----------
 drivers/pinctrl/core.h                |  3 +++
 drivers/pinctrl/pinctrl-stmfx.c       |  1 -
 drivers/pinctrl/stm32/pinctrl-stm32.c |  1 -
 include/linux/pinctrl/pinctrl.h       |  5 ----
 5 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 2bbd8ee93507..89ac42a145f2 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1000,6 +1000,26 @@ static int add_setting(struct pinctrl *p, struct pinctrl_dev *pctldev,
 
 	list_add_tail(&setting->node, &state->settings);
 
+	/*
+	 * Set up a device link for power management.
+	 * Do not link hogs (circular dependency)
+	 * Do not create more than one link per pinctrl.
+	 */
+	if (p->dev != setting->pctldev->dev) {
+		/*
+		 * Create a device link to the consumer such that
+		 * it will enforce that runtime PM suspend/resume
+		 * is done first on consumers before we get to
+		 * the pin controller itself. As some devices get
+		 * their pin control state even before probe() it is
+		 * important to use DL_FLAG_AUTOREMOVE_CONSUMER.
+		 */
+		setting->dl = device_link_add(p->dev,
+					      setting->pctldev->dev,
+					      DL_FLAG_PM_RUNTIME |
+					      DL_FLAG_AUTOREMOVE_CONSUMER);
+	}
+
 	return 0;
 }
 
@@ -1135,6 +1155,8 @@ EXPORT_SYMBOL_GPL(pinctrl_get);
 static void pinctrl_free_setting(bool disable_setting,
 				 struct pinctrl_setting *setting)
 {
+	if (setting->dl)
+		device_link_del(setting->dl);
 	switch (setting->type) {
 	case PIN_MAP_TYPE_MUX_GROUP:
 		if (disable_setting)
@@ -1220,15 +1242,6 @@ struct pinctrl_state *pinctrl_lookup_state(struct pinctrl *p,
 }
 EXPORT_SYMBOL_GPL(pinctrl_lookup_state);
 
-static void pinctrl_link_add(struct pinctrl_dev *pctldev,
-			     struct device *consumer)
-{
-	if (pctldev->desc->link_consumers)
-		device_link_add(consumer, pctldev->dev,
-				DL_FLAG_PM_RUNTIME |
-				DL_FLAG_AUTOREMOVE_CONSUMER);
-}
-
 /**
  * pinctrl_commit_state() - select/activate/program a pinctrl state to HW
  * @p: the pinctrl handle for the device that requests configuration
@@ -1274,10 +1287,6 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
 		if (ret < 0) {
 			goto unapply_new_state;
 		}
-
-		/* Do not link hogs (circular dependency) */
-		if (p != setting->pctldev->p)
-			pinctrl_link_add(setting->pctldev, p->dev);
 	}
 
 	p->state = state;
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 7f34167a0405..4073a1e4dde1 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -11,6 +11,7 @@
 #include <linux/kref.h>
 #include <linux/mutex.h>
 #include <linux/radix-tree.h>
+#include <linux/device.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/machine.h>
 
@@ -126,6 +127,7 @@ struct pinctrl_setting_configs {
  * @pctldev: pin control device handling to be programmed. Not used for
  *   PIN_MAP_TYPE_DUMMY_STATE.
  * @dev_name: the name of the device using this state
+ * @dl: device link for power management
  * @data: Data specific to the setting type
  */
 struct pinctrl_setting {
@@ -133,6 +135,7 @@ struct pinctrl_setting {
 	enum pinctrl_map_type type;
 	struct pinctrl_dev *pctldev;
 	const char *dev_name;
+	struct device_link *dl;
 	union {
 		struct pinctrl_setting_mux mux;
 		struct pinctrl_setting_configs configs;
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 16723797fa7c..4306b8444188 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -638,7 +638,6 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.pins = stmfx_pins;
 	pctl->pctl_desc.npins = ARRAY_SIZE(stmfx_pins);
 	pctl->pctl_desc.owner = THIS_MODULE;
-	pctl->pctl_desc.link_consumers = true;
 
 	ret = devm_pinctrl_register_and_init(pctl->dev, &pctl->pctl_desc,
 					     pctl, &pctl->pctl_dev);
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 2d5e0435af0a..ec59a58600ce 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1439,7 +1439,6 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->pctl_desc.owner = THIS_MODULE;
 	pctl->pctl_desc.pins = pins;
 	pctl->pctl_desc.npins = pctl->npins;
-	pctl->pctl_desc.link_consumers = true;
 	pctl->pctl_desc.confops = &stm32_pconf_ops;
 	pctl->pctl_desc.pctlops = &stm32_pctrl_ops;
 	pctl->pctl_desc.pmxops = &stm32_pmx_ops;
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 7ce23450a1cb..c6159f041f4e 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -122,10 +122,6 @@ struct pinctrl_ops {
  *	the hardware description
  * @custom_conf_items: Information how to print @params in debugfs, must be
  *	the same size as the @custom_params, i.e. @num_custom_params
- * @link_consumers: If true create a device link between pinctrl and its
- *	consumers (i.e. the devices requesting pin control states). This is
- *	sometimes necessary to ascertain the right suspend/resume order for
- *	example.
  */
 struct pinctrl_desc {
 	const char *name;
@@ -140,7 +136,6 @@ struct pinctrl_desc {
 	const struct pinconf_generic_params *custom_params;
 	const struct pin_config_item *custom_conf_items;
 #endif
-	bool link_consumers;
 };
 
 /* External interface to pin controller */
-- 
2.23.0

