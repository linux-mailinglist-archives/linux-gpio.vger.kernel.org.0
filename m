Return-Path: <linux-gpio+bounces-14543-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B1A02F35
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 18:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A57118871E8
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 17:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94001DED7D;
	Mon,  6 Jan 2025 17:41:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps-ovh.mhejs.net (vps-ovh.mhejs.net [145.239.82.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982291DED4A;
	Mon,  6 Jan 2025 17:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.82.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736185286; cv=none; b=UuvOV6VKkaZhibeK5ZxkW9FEdfjYrPH5BhTrAXl4rafSB9s4250NMTqhjUft9AN4V3RynPFpPYpiKW6QcEl/nKcStSO4Qb1kbS7Tqef6E19WuP6V115ymfISbIMmmZgzG8Mk/zWMZjkeda9kKNBj3Xc+QBxasuEgSWDaG32+ZBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736185286; c=relaxed/simple;
	bh=Q89caJb0AbArHnrax/UiVpBltYWVoNVY0m3MbSZS2Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TCTK3W91p5EDg/+StevuozxUYeKQpGiL3fB/FbzZA2flOQp3PypngJNvbW6ojruD01wBn4y2I4pg/1Zo3h2hYaQibsqDfzTEddImkVIYqphVDZzyXZx0WcPyVNCfTBpcNohT3KE/XnVXRsL4gvA4FiVsJsEhyTiJSbO9mypf5xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name; spf=pass smtp.mailfrom=vps-ovh.mhejs.net; arc=none smtp.client-ip=145.239.82.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vps-ovh.mhejs.net
Received: from MUA
	by vps-ovh.mhejs.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <mhej@vps-ovh.mhejs.net>)
	id 1tUr6O-00000005J5m-3h0t;
	Mon, 06 Jan 2025 18:41:20 +0100
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: amd: Take suspend type into consideration which pins are non-wake
Date: Mon,  6 Jan 2025 18:41:15 +0100
Message-ID: <d4b2d076366fdd08a0c1cd9b7ecd91dc95e07269.1736184752.git.mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: mhej@vps-ovh.mhejs.net

Some laptops have pins which are a wake source for S0i3/S3 but which
aren't a wake source for S4/S5 and which cause issues when left unmasked
during hibernation (S4).

For example HP EliteBook 855 G7 has pin #24 that causes instant wakeup
(hibernation failure) if left unmasked (it is a wake source only for
S0i3/S3).
GPIO pin #24 on this platform is likely dedicated to WWAN XMM7360
modem since this pin triggers wake notify to WWAN modem's parent PCIe
port.

Fix this by considering a pin a wake source only if it is marked as one
for the current suspend type (S0i3/S3 vs S4/S5).

Since Z-wake pins only make sense at runtime these were excluded from
both of suspend categories, so pins with only the Z-wake flag set are
effectively treated as non-wake pins.

Fixes: 2fff0b5e1a6b ("pinctrl: amd: Mask non-wake source pins with interrupt enabled at suspend")
Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---

Changes from v1:
* Clarify that Z pins only make sense at runtime in the commit message.

* Clarify what GPIO pin #24 is likely for on the test platform in the
commit message.

* Rename S03 and S4 to, respetively, suspend and hibernate.

 drivers/pinctrl/pinctrl-amd.c | 27 +++++++++++++++++++++------
 drivers/pinctrl/pinctrl-amd.h |  7 +++----
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index fff6d4209ad5..a03feb5a60dd 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -908,12 +908,13 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 	return false;
 }
 
-static int amd_gpio_suspend(struct device *dev)
+static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
 	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
+	u32 wake_mask = is_suspend ? WAKE_SOURCE_SUSPEND : WAKE_SOURCE_HIBERNATE;
 
 	for (i = 0; i < desc->npins; i++) {
 		int pin = desc->pins[i].number;
@@ -925,11 +926,11 @@ static int amd_gpio_suspend(struct device *dev)
 		gpio_dev->saved_regs[i] = readl(gpio_dev->base + pin * 4) & ~PIN_IRQ_PENDING;
 
 		/* mask any interrupts not intended to be a wake source */
-		if (!(gpio_dev->saved_regs[i] & WAKE_SOURCE)) {
+		if (!(gpio_dev->saved_regs[i] & wake_mask)) {
 			writel(gpio_dev->saved_regs[i] & ~BIT(INTERRUPT_MASK_OFF),
 			       gpio_dev->base + pin * 4);
-			pm_pr_dbg("Disabling GPIO #%d interrupt for suspend.\n",
-				  pin);
+			pm_pr_dbg("Disabling GPIO #%d interrupt for %s.\n",
+				  pin, is_suspend ? "suspend" : "hibernate");
 		}
 
 		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
@@ -938,6 +939,16 @@ static int amd_gpio_suspend(struct device *dev)
 	return 0;
 }
 
+static int amd_gpio_suspend(struct device *dev)
+{
+	return amd_gpio_suspend_hibernate_common(dev, true);
+}
+
+static int amd_gpio_hibernate(struct device *dev)
+{
+	return amd_gpio_suspend_hibernate_common(dev, false);
+}
+
 static int amd_gpio_resume(struct device *dev)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
@@ -961,8 +972,12 @@ static int amd_gpio_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops amd_gpio_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(amd_gpio_suspend,
-				     amd_gpio_resume)
+	.suspend_late = amd_gpio_suspend,
+	.resume_early = amd_gpio_resume,
+	.freeze_late = amd_gpio_hibernate,
+	.thaw_early = amd_gpio_resume,
+	.poweroff_late = amd_gpio_hibernate,
+	.restore_early = amd_gpio_resume,
 };
 #endif
 
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 667be49c3f48..3a1e5bffaf6e 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -80,10 +80,9 @@
 #define FUNCTION_MASK		GENMASK(1, 0)
 #define FUNCTION_INVALID	GENMASK(7, 0)
 
-#define WAKE_SOURCE	(BIT(WAKE_CNTRL_OFF_S0I3) | \
-			 BIT(WAKE_CNTRL_OFF_S3)   | \
-			 BIT(WAKE_CNTRL_OFF_S4)   | \
-			 BIT(WAKECNTRL_Z_OFF))
+#define WAKE_SOURCE_SUSPEND  (BIT(WAKE_CNTRL_OFF_S0I3) | \
+			      BIT(WAKE_CNTRL_OFF_S3))
+#define WAKE_SOURCE_HIBERNATE BIT(WAKE_CNTRL_OFF_S4)
 
 struct amd_function {
 	const char *name;

