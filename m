Return-Path: <linux-gpio+bounces-13494-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5749E40B3
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:10:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 112BA284809
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3A9210185;
	Wed,  4 Dec 2024 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RmPdSXBK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E0320CCC5;
	Wed,  4 Dec 2024 17:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331608; cv=none; b=DLm5MAkqbPIfZVLRvFzmg7X41R4Ekcdz/wVnh+ZAcuWljSKZohulShaTf0dwc3/uojeMe9iIpM5PWZn296nTTj/T+fUdrYqiafzYdoBHfI4vAphGFzcKMTO2NcmkfqI4MRh/KTcSgMmfrCfpJtYs+4eOiUc1aLUrk9KAYxnna+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331608; c=relaxed/simple;
	bh=qOxobhayZsSfFAlWKlP4MIFI68mJ1JOLD8MP5y0VOMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnJV7a7n2OWBhGryAhBZLgXSl30sPCsG+x//BQZqMN/ZAnEWTWSxbRM/AJnvlufkp/2+d458bZ5MNSL0R80w4aex9K3qyTU7VKnZMROy3nfGgs7NJzV2PxBjOCqYaKKiKD48N6GFRdXOK7kHM2MQqwMMNJqdDyxfcCEsMqpQEsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RmPdSXBK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A506C4CECD;
	Wed,  4 Dec 2024 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331607;
	bh=qOxobhayZsSfFAlWKlP4MIFI68mJ1JOLD8MP5y0VOMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RmPdSXBKKNcqzjPgSgZlg0Wc94Wk5X0zoAiP1hep+LHZSRRMNtW3aBfoXMbZjcYsh
	 GocaYF3yq9fL/HzVAoB59JEqRNwDaCo3cbjVFzGbffuCoaWR0w6XH6r+TqHwqopFXa
	 w00jwZRoqBa2+dgmIuSl2CYDfCYk0A2qf7mZhVdpsOa/l3++GrAPemv3hVxJJlAnIW
	 gTYp2mmG1Wa9fkvVeYTkuJxhsuwjhsDjAGpoksbVIRlz44hPi09eHqeLZR+LlCEwT1
	 xBfJnqvzhnwI9Kwt6lX6nKFnbUvZXIE7jIT/w5CukGBgg0YKFyyPkx/hC2wdFGnFII
	 Xd1ZO+PBh5riA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mukesh Ojha <quic_mojha@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 12/33] pinmux: Use sequential access to access desc->pinmux data
Date: Wed,  4 Dec 2024 10:47:25 -0500
Message-ID: <20241204154817.2212455-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204154817.2212455-1-sashal@kernel.org>
References: <20241204154817.2212455-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Mukesh Ojha <quic_mojha@quicinc.com>

[ Upstream commit 5a3e85c3c397c781393ea5fb2f45b1f60f8a4e6e ]

When two client of the same gpio call pinctrl_select_state() for the
same functionality, we are seeing NULL pointer issue while accessing
desc->mux_owner.

Let's say two processes A, B executing in pin_request() for the same pin
and process A updates the desc->mux_usecount but not yet updated the
desc->mux_owner while process B see the desc->mux_usecount which got
updated by A path and further executes strcmp and while accessing
desc->mux_owner it crashes with NULL pointer.

Serialize the access to mux related setting with a mutex lock.

	cpu0 (process A)			cpu1(process B)

pinctrl_select_state() {		  pinctrl_select_state() {
  pin_request() {				pin_request() {
  ...
						 ....
    } else {
         desc->mux_usecount++;
    						desc->mux_usecount && strcmp(desc->mux_owner, owner)) {

         if (desc->mux_usecount > 1)
               return 0;
         desc->mux_owner = owner;

  }						}

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
Link: https://lore.kernel.org/20241014192930.1539673-1-quic_mojha@quicinc.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/core.c   |   3 +
 drivers/pinctrl/core.h   |   1 +
 drivers/pinctrl/pinmux.c | 173 ++++++++++++++++++++++-----------------
 3 files changed, 100 insertions(+), 77 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 314ab93d76918..35f1046db9b6a 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -220,6 +220,9 @@ static int pinctrl_register_one_pin(struct pinctrl_dev *pctldev,
 
 	/* Set owner */
 	pindesc->pctldev = pctldev;
+#ifdef CONFIG_PINMUX
+	mutex_init(&pindesc->mux_lock);
+#endif
 
 	/* Copy basic pin info */
 	if (pin->name) {
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 4e07707d2435b..d6c24978e7081 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -177,6 +177,7 @@ struct pin_desc {
 	const char *mux_owner;
 	const struct pinctrl_setting_mux *mux_setting;
 	const char *gpio_owner;
+	struct mutex mux_lock;
 #endif
 };
 
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index aae71a37219b2..90ca50d9efb6a 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -14,6 +14,7 @@
 
 #include <linux/array_size.h>
 #include <linux/ctype.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -93,6 +94,7 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 	if (!desc || !ops)
 		return true;
 
+	guard(mutex)(&desc->mux_lock);
 	if (ops->strict && desc->mux_usecount)
 		return false;
 
@@ -127,29 +129,31 @@ static int pin_request(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
-	if ((!gpio_range || ops->strict) &&
-	    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
-		dev_err(pctldev->dev,
-			"pin %s already requested by %s; cannot claim for %s\n",
-			desc->name, desc->mux_owner, owner);
-		goto out;
-	}
+	scoped_guard(mutex, &desc->mux_lock) {
+		if ((!gpio_range || ops->strict) &&
+		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
+			dev_err(pctldev->dev,
+				"pin %s already requested by %s; cannot claim for %s\n",
+				desc->name, desc->mux_owner, owner);
+			goto out;
+		}
 
-	if ((gpio_range || ops->strict) && desc->gpio_owner) {
-		dev_err(pctldev->dev,
-			"pin %s already requested by %s; cannot claim for %s\n",
-			desc->name, desc->gpio_owner, owner);
-		goto out;
-	}
+		if ((gpio_range || ops->strict) && desc->gpio_owner) {
+			dev_err(pctldev->dev,
+				"pin %s already requested by %s; cannot claim for %s\n",
+				desc->name, desc->gpio_owner, owner);
+			goto out;
+		}
 
-	if (gpio_range) {
-		desc->gpio_owner = owner;
-	} else {
-		desc->mux_usecount++;
-		if (desc->mux_usecount > 1)
-			return 0;
+		if (gpio_range) {
+			desc->gpio_owner = owner;
+		} else {
+			desc->mux_usecount++;
+			if (desc->mux_usecount > 1)
+				return 0;
 
-		desc->mux_owner = owner;
+			desc->mux_owner = owner;
+		}
 	}
 
 	/* Let each pin increase references to this module */
@@ -178,12 +182,14 @@ static int pin_request(struct pinctrl_dev *pctldev,
 
 out_free_pin:
 	if (status) {
-		if (gpio_range) {
-			desc->gpio_owner = NULL;
-		} else {
-			desc->mux_usecount--;
-			if (!desc->mux_usecount)
-				desc->mux_owner = NULL;
+		scoped_guard(mutex, &desc->mux_lock) {
+			if (gpio_range) {
+				desc->gpio_owner = NULL;
+			} else {
+				desc->mux_usecount--;
+				if (!desc->mux_usecount)
+					desc->mux_owner = NULL;
+			}
 		}
 	}
 out:
@@ -219,15 +225,17 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 		return NULL;
 	}
 
-	if (!gpio_range) {
-		/*
-		 * A pin should not be freed more times than allocated.
-		 */
-		if (WARN_ON(!desc->mux_usecount))
-			return NULL;
-		desc->mux_usecount--;
-		if (desc->mux_usecount)
-			return NULL;
+	scoped_guard(mutex, &desc->mux_lock) {
+		if (!gpio_range) {
+			/*
+			 * A pin should not be freed more times than allocated.
+			 */
+			if (WARN_ON(!desc->mux_usecount))
+				return NULL;
+			desc->mux_usecount--;
+			if (desc->mux_usecount)
+				return NULL;
+		}
 	}
 
 	/*
@@ -239,13 +247,15 @@ static const char *pin_free(struct pinctrl_dev *pctldev, int pin,
 	else if (ops->free)
 		ops->free(pctldev, pin);
 
-	if (gpio_range) {
-		owner = desc->gpio_owner;
-		desc->gpio_owner = NULL;
-	} else {
-		owner = desc->mux_owner;
-		desc->mux_owner = NULL;
-		desc->mux_setting = NULL;
+	scoped_guard(mutex, &desc->mux_lock) {
+		if (gpio_range) {
+			owner = desc->gpio_owner;
+			desc->gpio_owner = NULL;
+		} else {
+			owner = desc->mux_owner;
+			desc->mux_owner = NULL;
+			desc->mux_setting = NULL;
+		}
 	}
 
 	module_put(pctldev->owner);
@@ -459,7 +469,8 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 				 pins[i]);
 			continue;
 		}
-		desc->mux_setting = &(setting->data.mux);
+		scoped_guard(mutex, &desc->mux_lock)
+			desc->mux_setting = &(setting->data.mux);
 	}
 
 	ret = ops->set_mux(pctldev, setting->data.mux.func,
@@ -473,8 +484,10 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 err_set_mux:
 	for (i = 0; i < num_pins; i++) {
 		desc = pin_desc_get(pctldev, pins[i]);
-		if (desc)
-			desc->mux_setting = NULL;
+		if (desc) {
+			scoped_guard(mutex, &desc->mux_lock)
+				desc->mux_setting = NULL;
+		}
 	}
 err_pin_request:
 	/* On error release all taken pins */
@@ -493,6 +506,7 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 	unsigned int num_pins = 0;
 	int i;
 	struct pin_desc *desc;
+	bool is_equal;
 
 	if (pctlops->get_group_pins)
 		ret = pctlops->get_group_pins(pctldev, setting->data.mux.group,
@@ -518,7 +532,10 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 				 pins[i]);
 			continue;
 		}
-		if (desc->mux_setting == &(setting->data.mux)) {
+		scoped_guard(mutex, &desc->mux_lock)
+			is_equal = (desc->mux_setting == &(setting->data.mux));
+
+		if (is_equal) {
 			pin_free(pctldev, pins[i], NULL);
 		} else {
 			const char *gname;
@@ -611,40 +628,42 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
 		if (desc == NULL)
 			continue;
 
-		if (desc->mux_owner &&
-		    !strcmp(desc->mux_owner, pinctrl_dev_get_name(pctldev)))
-			is_hog = true;
-
-		if (pmxops->strict) {
-			if (desc->mux_owner)
-				seq_printf(s, "pin %d (%s): device %s%s",
-					   pin, desc->name, desc->mux_owner,
+		scoped_guard(mutex, &desc->mux_lock) {
+			if (desc->mux_owner &&
+			    !strcmp(desc->mux_owner, pinctrl_dev_get_name(pctldev)))
+				is_hog = true;
+
+			if (pmxops->strict) {
+				if (desc->mux_owner)
+					seq_printf(s, "pin %d (%s): device %s%s",
+						   pin, desc->name, desc->mux_owner,
+						   is_hog ? " (HOG)" : "");
+				else if (desc->gpio_owner)
+					seq_printf(s, "pin %d (%s): GPIO %s",
+						   pin, desc->name, desc->gpio_owner);
+				else
+					seq_printf(s, "pin %d (%s): UNCLAIMED",
+						   pin, desc->name);
+			} else {
+				/* For non-strict controllers */
+				seq_printf(s, "pin %d (%s): %s %s%s", pin, desc->name,
+					   desc->mux_owner ? desc->mux_owner
+					   : "(MUX UNCLAIMED)",
+					   desc->gpio_owner ? desc->gpio_owner
+					   : "(GPIO UNCLAIMED)",
 					   is_hog ? " (HOG)" : "");
-			else if (desc->gpio_owner)
-				seq_printf(s, "pin %d (%s): GPIO %s",
-					   pin, desc->name, desc->gpio_owner);
+			}
+
+			/* If mux: print function+group claiming the pin */
+			if (desc->mux_setting)
+				seq_printf(s, " function %s group %s\n",
+					   pmxops->get_function_name(pctldev,
+						desc->mux_setting->func),
+					   pctlops->get_group_name(pctldev,
+						desc->mux_setting->group));
 			else
-				seq_printf(s, "pin %d (%s): UNCLAIMED",
-					   pin, desc->name);
-		} else {
-			/* For non-strict controllers */
-			seq_printf(s, "pin %d (%s): %s %s%s", pin, desc->name,
-				   desc->mux_owner ? desc->mux_owner
-				   : "(MUX UNCLAIMED)",
-				   desc->gpio_owner ? desc->gpio_owner
-				   : "(GPIO UNCLAIMED)",
-				   is_hog ? " (HOG)" : "");
+				seq_putc(s, '\n');
 		}
-
-		/* If mux: print function+group claiming the pin */
-		if (desc->mux_setting)
-			seq_printf(s, " function %s group %s\n",
-				   pmxops->get_function_name(pctldev,
-					desc->mux_setting->func),
-				   pctlops->get_group_name(pctldev,
-					desc->mux_setting->group));
-		else
-			seq_putc(s, '\n');
 	}
 
 	mutex_unlock(&pctldev->mutex);
-- 
2.43.0


