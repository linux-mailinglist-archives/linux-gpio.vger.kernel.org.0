Return-Path: <linux-gpio+bounces-13490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB8C9E4052
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 18:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B6E0283959
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 17:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9386A2144A1;
	Wed,  4 Dec 2024 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KRBd06Sf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6872139D4;
	Wed,  4 Dec 2024 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733331495; cv=none; b=Ao5Do2guGjX8Pc8oOT1WMPhNAG+BXE0SB+S/s39NYnmqHCtBng27ii85TBPbdGwpAjvu67OALmRs/aziIDSe2tH/lU6aavIqZJvlVX7NcYQOi8tD+avGr1EVipgY5pZGjnaYkIBD4qy3J6oSBALVOLyFwDcpjLwOt/SjfPFQpFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733331495; c=relaxed/simple;
	bh=0mNno1EiiSC9NUog4xuo7N7vBR1QdqDrwjHVF5pU6jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9JOiL585osNnhJ4+w/bZYSitTas54oOPeXa+Ln7jl/AuImn/6PX7Pf2ianCEEy0wq6zKcYJ1BTYAUuwAi6y5tq5jZNY5arlyKXT+75lx4/zoP090URxar18QR2jt+yDUDLerEhCSnPOFMkC11hbcEcrlgcB9Jc9GFF9jC2lmlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KRBd06Sf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39944C4CEE6;
	Wed,  4 Dec 2024 16:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733331495;
	bh=0mNno1EiiSC9NUog4xuo7N7vBR1QdqDrwjHVF5pU6jU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KRBd06SfmWU/aeG357zsf9VioPKhw3/v/vDgzKte79d1W1ygWAoQr1f8qSmW0W7H5
	 fgYkbvDYYKBZX3xXfd/mrV1xZRTeYYdMXvjdu8F7Pmh9VDzR1r24kRlaA2pNApoZid
	 Gsjm2Nb3Q9xuPR4h/FXl3PFh43CXj9uSbhV4k63amuJ1ypX6Ak/qIfwAL5/KNfHfRf
	 mL3m2Xqzn2PnA6sJS2j+upgoI3dzSNSTEnN7PF2L9wUQnKXASzC42i8ule+Rpn9S8S
	 Np8satgKnqHgMzkrx/cRasPmEIjCsH2JfQiCyUaeUwVuAXMztuBfvFWwAHA4ElzG62
	 UchoGaRToNHWA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mukesh Ojha <quic_mojha@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 12/36] pinmux: Use sequential access to access desc->pinmux data
Date: Wed,  4 Dec 2024 10:45:28 -0500
Message-ID: <20241204154626.2211476-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204154626.2211476-1-sashal@kernel.org>
References: <20241204154626.2211476-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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
index 4061890a17483..b3eec63c00ba0 100644
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
index 02033ea1c6438..0743190da59e8 100644
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
@@ -458,7 +468,8 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
 				 pins[i]);
 			continue;
 		}
-		desc->mux_setting = &(setting->data.mux);
+		scoped_guard(mutex, &desc->mux_lock)
+			desc->mux_setting = &(setting->data.mux);
 	}
 
 	ret = ops->set_mux(pctldev, setting->data.mux.func,
@@ -472,8 +483,10 @@ int pinmux_enable_setting(const struct pinctrl_setting *setting)
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
@@ -492,6 +505,7 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
 	unsigned int num_pins = 0;
 	int i;
 	struct pin_desc *desc;
+	bool is_equal;
 
 	if (pctlops->get_group_pins)
 		ret = pctlops->get_group_pins(pctldev, setting->data.mux.group,
@@ -517,7 +531,10 @@ void pinmux_disable_setting(const struct pinctrl_setting *setting)
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
@@ -608,40 +625,42 @@ static int pinmux_pins_show(struct seq_file *s, void *what)
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


