Return-Path: <linux-gpio+bounces-14336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 188409FE012
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Dec 2024 18:39:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8460A3A1863
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Dec 2024 17:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0573F195962;
	Sun, 29 Dec 2024 17:39:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps-ovh.mhejs.net (vps-ovh.mhejs.net [145.239.82.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5412AE8D;
	Sun, 29 Dec 2024 17:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.239.82.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735493955; cv=none; b=lPWlj8M5O6nnh3Seny8rTFFAh1W2U1trRo3Wl1ruz5YxCBqOlrcDRMv8gVgWe+4yCAqKjkpvEqC73oj9RpEsGkeRuA6u1jv9QHEuhgVqzCGNipf69FlP3v0DEblUUPxw5UDicCbJpAR7b6Vu3LittHs5ffjGfFm5hg+WNsc/xxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735493955; c=relaxed/simple;
	bh=cKldweLexAbWW3t/Oak8vMG61iSM1vlh4BkgMtXeZWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oysGjiJNjCnY1Wo1jGdIAUj2AQLyAVDwZbrbhq6aQ7N7OxWenwzzVMn+WR5PjRH0LF/jOrIvVxLa1+phw54WsIBIvpCqzRgQv9wp27O4+BD0q6KyMYboxRCV5OIjfE+yqRazFXLK5vHVazUzLwqocu8hLRfD3SKVAUEd/Zvarwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name; spf=pass smtp.mailfrom=vps-ovh.mhejs.net; arc=none smtp.client-ip=145.239.82.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maciej.szmigiero.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vps-ovh.mhejs.net
Received: from MUA
	by vps-ovh.mhejs.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <mhej@vps-ovh.mhejs.net>)
	id 1tRwNI-00000004nmf-3wBL;
	Sun, 29 Dec 2024 17:42:44 +0100
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: amd: Take suspend type into consideration which pins are non-wake
Date: Sun, 29 Dec 2024 17:42:38 +0100
Message-ID: <e61858fe70face71226727618dfaa9d5e54da0bd.1735490511.git.mail@maciej.szmigiero.name>
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

Fix this by considering a pin a wake source only if it is marked as one
for the current suspend type (S0i3/S3 vs S4/S5).

Since I'm not sure if Z-wake pins should be included in either suspend
category I excluded them from both, so pins with only the Z-wake flag set
are treated as non-wake pins.

Fixes: 2fff0b5e1a6b ("pinctrl: amd: Mask non-wake source pins with interrupt enabled at suspend")
Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/pinctrl/pinctrl-amd.c | 27 +++++++++++++++++++++------
 drivers/pinctrl/pinctrl-amd.h |  7 +++----
 2 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index fff6d4209ad5..072d44b0fc8c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -908,12 +908,13 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 	return false;
 }
 
-static int amd_gpio_suspend(struct device *dev)
+static int amd_gpio_suspend_common(struct device *dev, bool is_s03)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
 	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	unsigned long flags;
 	int i;
+	u32 wake_mask = is_s03 ? WAKE_SOURCE_S03 : WAKE_SOURCE_S4;
 
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
+			pm_pr_dbg("Disabling GPIO #%d interrupt for %s suspend.\n",
+				  pin, is_s03 ? "S0idle3/S3" : "S4/S5");
 		}
 
 		raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
@@ -938,6 +939,16 @@ static int amd_gpio_suspend(struct device *dev)
 	return 0;
 }
 
+static int amd_gpio_suspend_s03(struct device *dev)
+{
+	return amd_gpio_suspend_common(dev, true);
+}
+
+static int amd_gpio_suspend_s45(struct device *dev)
+{
+	return amd_gpio_suspend_common(dev, false);
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
+	.suspend_late = amd_gpio_suspend_s03,
+	.resume_early = amd_gpio_resume,
+	.freeze_late = amd_gpio_suspend_s45,
+	.thaw_early = amd_gpio_resume,
+	.poweroff_late = amd_gpio_suspend_s45,
+	.restore_early = amd_gpio_resume,
 };
 #endif
 
diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index 667be49c3f48..8bf9f410d7fb 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -80,10 +80,9 @@
 #define FUNCTION_MASK		GENMASK(1, 0)
 #define FUNCTION_INVALID	GENMASK(7, 0)
 
-#define WAKE_SOURCE	(BIT(WAKE_CNTRL_OFF_S0I3) | \
-			 BIT(WAKE_CNTRL_OFF_S3)   | \
-			 BIT(WAKE_CNTRL_OFF_S4)   | \
-			 BIT(WAKECNTRL_Z_OFF))
+#define WAKE_SOURCE_S03 (BIT(WAKE_CNTRL_OFF_S0I3) | \
+			 BIT(WAKE_CNTRL_OFF_S3))
+#define WAKE_SOURCE_S4  BIT(WAKE_CNTRL_OFF_S4)
 
 struct amd_function {
 	const char *name;

