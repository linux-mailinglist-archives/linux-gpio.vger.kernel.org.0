Return-Path: <linux-gpio+bounces-13330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD829DAD50
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 19:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BFF6165AEA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 18:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA70820309;
	Wed, 27 Nov 2024 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="SpYGPhig"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1316613B2A2
	for <linux-gpio@vger.kernel.org>; Wed, 27 Nov 2024 18:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732733121; cv=none; b=VLb0KFycAu+eD/3vLcl/ZIlZbZeFHRE1IwIvjNZBSvqycJCgZvDMQkqnbjyavV41+mFi3cn55lzRcHD3IBEP6ZUE4UNyY6qgI6DF6uS7ieGWdBQJyW/z4ts1YUKIbi9s9/zfoe9SqF/q82y2yZffB2wYYnZrW0nTVutBF6yxO4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732733121; c=relaxed/simple;
	bh=NSub2cKOB+n9HzNB+Kf3pZUiuN/V+cWCYRqNML8oEX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IgfA2RY9r2Wt3VV37ZQFk7MjHihmmI5CMiB86611G39Awb6m/wdC2u9rKxcNUndg0avyOXJP04bZEXMYKARzCX/6/szbW8hlqxd1zPjQgou0iAbLUCQIQLLsQbl9vOIkSAuRDPGfGu6BU05oaI34oPpPMLkZZCSj2/SPRI+m5TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=SpYGPhig; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202411271845083ed5f38b552589ff2c
        for <linux-gpio@vger.kernel.org>;
        Wed, 27 Nov 2024 19:45:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=s3mbgWXFNUsvRMO58X9lemUQ0z+cOkdT4m/j9D8Qujk=;
 b=SpYGPhigfXb5YXRBNybbFekhNafidOzz0ctwThsWsEGILEWbB2NFaI5+xKPPa2m+zq/76i
 YOMGYjGH9usnXtRmYt1BfbaOO0eqS7NXvq0F1+r1xOnwi2gU9eHFJkOVdXryXZBAYAhuoNIa
 gvjlHZ3qhNeybwhpB7PL6JLEZrrKPfc0r+OhMLyNVRruUQAnm+hR2wcpRtb6LPHjgMaRRPr+
 785y2+Ov4yR42VUlx+1ibPK0YnyhacuXg9N04hrrKsOnIIM5b2oty/tdY8yHQywihonz4YAb
 COwgVLVCwUzGTeYBvmS17bNsRtLgzgKJUqemsW5H18v307ceGouZhMfQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-omap@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] gpio: omap: Silence lockdep "Invalid wait context"
Date: Wed, 27 Nov 2024 19:45:03 +0100
Message-ID: <20241127184506.962756-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

The problem apparetly has been known since the conversion to
raw_spin_lock() (commit 4dbada2be460
("gpio: omap: use raw locks for locking")).

Symptom:

[ BUG: Invalid wait context ]
5.10.214
-----------------------------
swapper/1 is trying to lock:
(enable_lock){....}-{3:3}, at: clk_enable_lock
other info that might help us debug this:
context-{5:5}
2 locks held by swapper/1:
 #0: (&dev->mutex){....}-{4:4}, at: device_driver_attach
 #1: (&bank->lock){....}-{2:2}, at: omap_gpio_set_config
stack backtrace:
CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.214
Hardware name: Generic AM33XX (Flattened Device Tree)
unwind_backtrace
show_stack
__lock_acquire
lock_acquire.part.0
_raw_spin_lock_irqsave
clk_enable_lock
clk_enable
omap_gpio_set_config
gpio_keys_setup_key
gpio_keys_probe
platform_drv_probe
really_probe
driver_probe_device
device_driver_attach
__driver_attach
bus_for_each_dev
bus_add_driver
driver_register
do_one_initcall
do_initcalls
kernel_init_freeable
kernel_init

Reorder clk_enable()/clk_disable() calls in a way that they always happen
outside of raw_spin_lock'ed sections.

Cc: stable@vger.kernel.org
Fixes: 4dbada2be460 ("gpio: omap: use raw locks for locking")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2: complete rework, I've totally missed the fact
    clk_enable()/clk_disable() cannot avoid clk_enable_lock() even if the
    clock is enabled; I had to extract all clk_*() calls out of
    raw_spin_lock'ed sections

 drivers/gpio/gpio-omap.c | 114 +++++++++++++++++++++++++++++----------
 1 file changed, 87 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 7ad4534054962..3e6c8dec7cacc 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -140,18 +140,22 @@ static void omap_set_gpio_dataout_mask(struct gpio_bank *bank, unsigned offset,
 					      BIT(offset), enable);
 }
 
-static inline void omap_gpio_dbck_enable(struct gpio_bank *bank)
+/* Returns true if debounce clock has to be enabled by the caller */
+static inline bool omap_gpio_dbck_enable(struct gpio_bank *bank)
 {
 	if (bank->dbck_enable_mask && !bank->dbck_enabled) {
-		clk_enable(bank->dbck);
 		bank->dbck_enabled = true;
-
 		writel_relaxed(bank->dbck_enable_mask,
 			     bank->base + bank->regs->debounce_en);
+
+		return true;
 	}
+
+	return false;
 }
 
-static inline void omap_gpio_dbck_disable(struct gpio_bank *bank)
+/* Returns true if debounce clock has to be disabled by the caller */
+static inline bool omap_gpio_dbck_disable(struct gpio_bank *bank)
 {
 	if (bank->dbck_enable_mask && bank->dbck_enabled) {
 		/*
@@ -160,10 +164,12 @@ static inline void omap_gpio_dbck_disable(struct gpio_bank *bank)
 		 * to detect events and generate interrupts at least on OMAP3.
 		 */
 		writel_relaxed(0, bank->base + bank->regs->debounce_en);
-
-		clk_disable(bank->dbck);
 		bank->dbck_enabled = false;
+
+		return true;
 	}
+
+	return false;
 }
 
 /**
@@ -181,9 +187,11 @@ static inline void omap_gpio_dbck_disable(struct gpio_bank *bank)
 static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
 				   unsigned debounce)
 {
+	unsigned long		flags;
 	u32			val;
 	u32			l;
 	bool			enable = !!debounce;
+	bool			enable_clk;
 
 	if (!bank->dbck_flag)
 		return -ENOTSUPP;
@@ -196,13 +204,18 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
 
 	l = BIT(offset);
 
+	/*
+	 * Ordering is important here: clk_enable() calls spin_lock_irqsave(),
+	 * therefore it must be outside of the following raw_spin_lock_irqsave()
+	 */
 	clk_enable(bank->dbck);
+	raw_spin_lock_irqsave(&bank->lock, flags);
+
 	writel_relaxed(debounce, bank->base + bank->regs->debounce);
 
 	val = omap_gpio_rmw(bank->base + bank->regs->debounce_en, l, enable);
 	bank->dbck_enable_mask = val;
 
-	clk_disable(bank->dbck);
 	/*
 	 * Enable debounce clock per module.
 	 * This call is mandatory because in omap_gpio_request() when
@@ -211,12 +224,16 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
 	 * used within _gpio_dbck_enable() is still not initialized at
 	 * that point. Therefore we have to enable dbck here.
 	 */
-	omap_gpio_dbck_enable(bank);
+	enable_clk = omap_gpio_dbck_enable(bank);
 	if (bank->dbck_enable_mask) {
 		bank->context.debounce = debounce;
 		bank->context.debounce_en = val;
 	}
 
+	raw_spin_unlock_irqrestore(&bank->lock, flags);
+	if (!enable_clk)
+		clk_disable(bank->dbck);
+
 	return 0;
 }
 
@@ -229,16 +246,19 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
  * this is the only gpio in this bank using debounce, then clear the debounce
  * time too. The debounce clock will also be disabled when calling this function
  * if this is the only gpio in the bank using debounce.
+ *
+ * Return: true if bank->bdck clock has to be disabled by the caller,
+ *         false otherwise
  */
-static void omap_clear_gpio_debounce(struct gpio_bank *bank, unsigned offset)
+static bool omap_clear_gpio_debounce(struct gpio_bank *bank, unsigned int offset)
 {
 	u32 gpio_bit = BIT(offset);
 
 	if (!bank->dbck_flag)
-		return;
+		return false;
 
 	if (!(bank->dbck_enable_mask & gpio_bit))
-		return;
+		return false;
 
 	bank->dbck_enable_mask &= ~gpio_bit;
 	bank->context.debounce_en &= ~gpio_bit;
@@ -249,9 +269,12 @@ static void omap_clear_gpio_debounce(struct gpio_bank *bank, unsigned offset)
 		bank->context.debounce = 0;
 		writel_relaxed(bank->context.debounce, bank->base +
 			     bank->regs->debounce);
-		clk_disable(bank->dbck);
 		bank->dbck_enabled = false;
+
+		return true;
 	}
+
+	return false;
 }
 
 /*
@@ -646,6 +669,7 @@ static void omap_gpio_irq_shutdown(struct irq_data *d)
 	struct gpio_bank *bank = omap_irq_data_get_bank(d);
 	unsigned long flags;
 	unsigned offset = d->hwirq;
+	bool disable_clk = false;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->irq_usage &= ~(BIT(offset));
@@ -653,9 +677,17 @@ static void omap_gpio_irq_shutdown(struct irq_data *d)
 	omap_clear_gpio_irqstatus(bank, offset);
 	omap_set_gpio_irqenable(bank, offset, 0);
 	if (!LINE_USED(bank->mod_usage, offset))
-		omap_clear_gpio_debounce(bank, offset);
+		disable_clk = omap_clear_gpio_debounce(bank, offset);
 	omap_disable_gpio_module(bank, offset);
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
+
+	/*
+	 * This has to be done outside of bank->lock'ed section, because
+	 * spin_lock_irqsave(&enable_lock, ...) <= clk_enable_lock()
+	 * cannot be called from raw_spin_lock'ed section.
+	 */
+	if (disable_clk)
+		clk_disable(bank->dbck);
 }
 
 static void omap_gpio_irq_bus_lock(struct irq_data *data)
@@ -825,17 +857,26 @@ static int omap_gpio_request(struct gpio_chip *chip, unsigned offset)
 static void omap_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
+	bool disable_clk = false;
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	bank->mod_usage &= ~(BIT(offset));
 	if (!LINE_USED(bank->irq_usage, offset)) {
 		omap_set_gpio_direction(bank, offset, 1);
-		omap_clear_gpio_debounce(bank, offset);
+		disable_clk = omap_clear_gpio_debounce(bank, offset);
 	}
 	omap_disable_gpio_module(bank, offset);
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 
+	/*
+	 * This has to be done outside of bank->lock'ed section, because
+	 * spin_lock_irqsave(&enable_lock, ...) <= clk_enable_lock()
+	 * cannot be called from raw_spin_lock'ed section.
+	 */
+	if (disable_clk)
+		clk_disable(bank->dbck);
+
 	pm_runtime_put(chip->parent);
 }
 
@@ -913,15 +954,11 @@ static int omap_gpio_debounce(struct gpio_chip *chip, unsigned offset,
 			      unsigned debounce)
 {
 	struct gpio_bank *bank;
-	unsigned long flags;
 	int ret;
 
 	bank = gpiochip_get_data(chip);
 
-	raw_spin_lock_irqsave(&bank->lock, flags);
 	ret = omap2_set_gpio_debounce(bank, offset, debounce);
-	raw_spin_unlock_irqrestore(&bank->lock, flags);
-
 	if (ret)
 		dev_info(chip->parent,
 			 "Could not set line %u debounce to %u microseconds (%d)",
@@ -1131,7 +1168,8 @@ static void omap_gpio_restore_context(struct gpio_bank *bank)
 	writel_relaxed(bank->context.irqenable2, base + regs->irqenable2);
 }
 
-static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
+/* Returns true if debounce clock has to be disabled by the caller */
+static bool omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
 {
 	struct device *dev = bank->chip.parent;
 	void __iomem *base = bank->base;
@@ -1175,13 +1213,15 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
 		bank->context_loss_count =
 				bank->get_context_loss_count(dev);
 
-	omap_gpio_dbck_disable(bank);
+	return omap_gpio_dbck_disable(bank);
 }
 
-static void omap_gpio_unidle(struct gpio_bank *bank)
+/* Returns true if debounce clock has to be enabled by the caller */
+static bool omap_gpio_unidle(struct gpio_bank *bank)
 {
 	struct device *dev = bank->chip.parent;
 	u32 l = 0, gen, gen0, gen1;
+	bool enable_clk;
 	int c;
 
 	/*
@@ -1197,7 +1237,7 @@ static void omap_gpio_unidle(struct gpio_bank *bank)
 				bank->get_context_loss_count(dev);
 	}
 
-	omap_gpio_dbck_enable(bank);
+	enable_clk = omap_gpio_dbck_enable(bank);
 
 	if (bank->loses_context) {
 		if (!bank->get_context_loss_count) {
@@ -1207,7 +1247,7 @@ static void omap_gpio_unidle(struct gpio_bank *bank)
 			if (c != bank->context_loss_count) {
 				omap_gpio_restore_context(bank);
 			} else {
-				return;
+				return enable_clk;
 			}
 		}
 	} else {
@@ -1267,6 +1307,8 @@ static void omap_gpio_unidle(struct gpio_bank *bank)
 		writel_relaxed(old0, bank->base + bank->regs->leveldetect0);
 		writel_relaxed(old1, bank->base + bank->regs->leveldetect1);
 	}
+
+	return enable_clk;
 }
 
 static int gpio_omap_cpu_notifier(struct notifier_block *nb,
@@ -1276,6 +1318,8 @@ static int gpio_omap_cpu_notifier(struct notifier_block *nb,
 	unsigned long flags;
 	int ret = NOTIFY_OK;
 	u32 isr, mask;
+	bool enable_clk = false;
+	bool disable_clk = false;
 
 	bank = container_of(nb, struct gpio_bank, nb);
 
@@ -1291,17 +1335,23 @@ static int gpio_omap_cpu_notifier(struct notifier_block *nb,
 			ret = NOTIFY_BAD;
 			break;
 		}
-		omap_gpio_idle(bank, true);
+		disable_clk = omap_gpio_idle(bank, true);
 		break;
 	case CPU_CLUSTER_PM_ENTER_FAILED:
 	case CPU_CLUSTER_PM_EXIT:
-		omap_gpio_unidle(bank);
+		enable_clk = omap_gpio_unidle(bank);
 		break;
 	}
 
 out_unlock:
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 
+	/* This has to happen outside of raw_spin_lock'ed section */
+	if (enable_clk)
+		clk_enable(bank->dbck);
+	if (disable_clk)
+		clk_disable(bank->dbck);
+
 	return ret;
 }
 
@@ -1503,12 +1553,17 @@ static int __maybe_unused omap_gpio_runtime_suspend(struct device *dev)
 {
 	struct gpio_bank *bank = dev_get_drvdata(dev);
 	unsigned long flags;
+	bool disable_clk;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
-	omap_gpio_idle(bank, true);
+	disable_clk = omap_gpio_idle(bank, true);
 	bank->is_suspended = true;
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 
+	/* This has to happen outside of raw_spin_lock'ed section */
+	if (disable_clk)
+		clk_disable(bank->dbck);
+
 	return 0;
 }
 
@@ -1516,12 +1571,17 @@ static int __maybe_unused omap_gpio_runtime_resume(struct device *dev)
 {
 	struct gpio_bank *bank = dev_get_drvdata(dev);
 	unsigned long flags;
+	bool enable_clk;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
-	omap_gpio_unidle(bank);
+	enable_clk = omap_gpio_unidle(bank);
 	bank->is_suspended = false;
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 
+	/* This has to happen outside of raw_spin_lock'ed section */
+	if (enable_clk)
+		clk_enable(bank->dbck);
+
 	return 0;
 }
 
-- 
2.47.0


