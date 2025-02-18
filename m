Return-Path: <linux-gpio+bounces-16173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F041DA390F0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 03:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C514117234B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2025 02:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCC713B7B3;
	Tue, 18 Feb 2025 02:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyu/TXCu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7695C2556E
	for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2025 02:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739846841; cv=none; b=J8/dWQNGV5APwil9QxP04UXWshQbWUdi+1Gp9JdU+NQzgkJ3VyX1TbiY2nw4nsxsiN4uhU1vIJaZMg7ars3zDMbuDQwj3DzrLsjRCEUrE7UvAk2Kg7R4x3I5Cs0rw4E8GqPmgMX5v6xDSqWO2Z6e4yU/+0Hx6+ggCHnxywpSzMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739846841; c=relaxed/simple;
	bh=x2Eecg/8hfNz/2Ce0Rh33Iyx57SI8qhqPI6mNxoDnI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sVVTeQqN+RsJa7hdg1n1U1DFI0X8SkumTxMBVrBCY9kaQmNdaejSam05Hby7cQFsx5lRhaXgVYIV8/6FtxjLbm2TFCH6y9ZYgbJAEvD/3RZJcPk7qccmeGjQdN9Rau0oQOTdANBPG+GO86vE82TT6urZ9mmM1DWeYITfiHmaFa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyu/TXCu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F12C4CED1;
	Tue, 18 Feb 2025 02:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739846841;
	bh=x2Eecg/8hfNz/2Ce0Rh33Iyx57SI8qhqPI6mNxoDnI4=;
	h=From:To:Cc:Subject:Date:From;
	b=qyu/TXCuDqVcoKXmsIZSQJHeEfNE4GLkqb59BV14h0gQnGxVZ0jmDscizOIGotTN/
	 6HCPhBkTQJY3rt8G449biNeiScmWoU/7O9sBN83G1joGKn3y2Hnn9dG6sArdbwh67B
	 GAv0RB1AN8KdXWxJf9740pxmUXt9oCKeAXaSUkgnNUT7meJgtOVn+DczlMYxTuKANH
	 NELp5FbVo7IXeCnCGEz/IjPJfmoAMEy5dXYK7SVpabRoerd3wZIgL8dRAoyl1cFzLE
	 Yfu1HCVJZ8hkM4fHV6Fj/jD4pGNEJpAr8K0dBIjjwUwd3GO5j0BYcmUOrjzOi51/ml
	 1pxVjrntJ91YQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com,
	Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: amd: Add an LPS0 check() callback
Date: Mon, 17 Feb 2025 20:47:00 -0600
Message-ID: <20250218024702.2139216-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

During suspend the pinctrl_amd driver disables the interrupts for
any GPIOs that are not marked as wake sources.

This however does not prevent them from changing the wake status
bit during suspend, it just stops the system from waking.

If the system wakes from hardware sleep for another reason (such
as plugging in the AC adapter) this wake bits might be active.

This could potentially cause problems with going back to hardware
sleep.  Add an extra debugging message when PM debugging is enabled
to help identify if this is happening.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3929
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 1d7fdcdec4c85..5b4376b05eafb 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -37,6 +37,8 @@
 #include "pinctrl-utils.h"
 #include "pinctrl-amd.h"
 
+static struct amd_gpio *pinctrl_dev;
+
 static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	unsigned long flags;
@@ -909,6 +911,29 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 	return false;
 }
 
+static void amd_gpio_check_pending(void)
+{
+	struct amd_gpio *gpio_dev = pinctrl_dev;
+	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
+	int i;
+
+	if (!pm_debug_messages_on)
+		return;
+
+	for (i = 0; i < desc->npins; i++) {
+		int pin = desc->pins[i].number;
+		u32 tmp;
+
+		tmp = readl(gpio_dev->base + pin * 4);
+		if (tmp & PIN_IRQ_PENDING)
+			pm_pr_dbg("%s: GPIO %d is active: 0x%x.\n", __func__, pin, tmp);
+	}
+}
+
+static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops = {
+	.check = amd_gpio_check_pending,
+};
+
 static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend)
 {
 	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
@@ -942,6 +967,7 @@ static int amd_gpio_suspend_hibernate_common(struct device *dev, bool is_suspend
 
 static int amd_gpio_suspend(struct device *dev)
 {
+	pinctrl_dev = dev_get_drvdata(dev);
 	return amd_gpio_suspend_hibernate_common(dev, true);
 }
 
@@ -1182,6 +1208,10 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, gpio_dev);
 	acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
 
+	ret = acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
+	if (ret)
+		return ret;
+
 	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
 	return ret;
 
@@ -1199,6 +1229,7 @@ static void amd_gpio_remove(struct platform_device *pdev)
 
 	gpiochip_remove(&gpio_dev->gc);
 	acpi_unregister_wakeup_handler(amd_gpio_check_wake, gpio_dev);
+	acpi_unregister_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
 }
 
 #ifdef CONFIG_ACPI
-- 
2.43.0


