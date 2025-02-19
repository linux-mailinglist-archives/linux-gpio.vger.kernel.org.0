Return-Path: <linux-gpio+bounces-16234-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25126A3C2D2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 15:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B54B817ADF8
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 14:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6926F1F30B2;
	Wed, 19 Feb 2025 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdTqr3j4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2666D1F2B90
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976854; cv=none; b=cwDG+qg9NyoOgREmrmuH7MAeOtZnCmLRSTWd20Wo/gwPRAS48YQOfj7HsSW+VWfVNpUywEoMNp94YJnlk2V7VpMikjmCG0UbuEhlB7BU7ibIgRbMivcH1/x38GPU4xqN+BGEiW79TRJlXmGAUkcvhY4eqsqtyh+mEoWR0m+wVGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976854; c=relaxed/simple;
	bh=ZpaDh2lTFSKGsoMarmaNi3c51a3DtHwtgPdbj0s8xj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5Fv+b1e4mxUt5YqXrAuO3fdOQ3FHCIDKsAkqn5QOnhHftcFuLSCLwbuguK8GPK6M1jU9oQ+jBFu4/9IGU6drdv/uOHRYeR6xvgLNxY+VdGiJIxlBUkR3f0A7Bp0BibLRmPBdDhwkOsRh0bS+UFrMjVd2/LWlFrG/a7zZ0b2T0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdTqr3j4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDF6C4CEE7;
	Wed, 19 Feb 2025 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739976854;
	bh=ZpaDh2lTFSKGsoMarmaNi3c51a3DtHwtgPdbj0s8xj4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XdTqr3j4uoIGez+R1w/mbl6h+PjvSG9iBToEpf6lk1zQ47reIvzyBiauCc9IURFeW
	 kmAXPNe2GAipNs2MajLhDuVK7qr1aS/mSF7AAJ20myOKO1A21VrypT6KC68Umo90qM
	 y8QPqxA46JhtOOhrH5EyAzJ5qqKogu8fGH0zRY717U2gr0UTBCFGe+EHvJ+W+7EnVt
	 j4VP5EQSPRuJll+EZ3u4gvFf3GWFXje09LYB9SsGYUFBgdn+rtUE2Tcf/WAJnN6CYm
	 Oe9Dfk2zjzujE8oyezFmRVYUwKYdquDuG0V3QT1+7cuD7dnHfxd/3AyfS9PYOF4kTB
	 EJOT0leEm2hGg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Basavaraj.Natikar@amd.com,
	Shyam-sundar.S-k@amd.com,
	linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/2] pinctrl: amd: Add an LPS0 check() callback
Date: Wed, 19 Feb 2025 08:53:13 -0600
Message-ID: <20250219145338.3306745-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219145338.3306745-1-superm1@kernel.org>
References: <20250219145338.3306745-1-superm1@kernel.org>
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
 drivers/pinctrl/pinctrl-amd.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 1d7fdcdec4c85..fdda8d1c4f344 100644
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
 
@@ -1181,6 +1207,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, gpio_dev);
 	acpi_register_wakeup_handler(gpio_dev->irq, amd_gpio_check_wake, gpio_dev);
+	acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
 
 	dev_dbg(&pdev->dev, "amd gpio driver loaded\n");
 	return ret;
@@ -1199,6 +1226,7 @@ static void amd_gpio_remove(struct platform_device *pdev)
 
 	gpiochip_remove(&gpio_dev->gc);
 	acpi_unregister_wakeup_handler(amd_gpio_check_wake, gpio_dev);
+	acpi_unregister_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
 }
 
 #ifdef CONFIG_ACPI
-- 
2.43.0


