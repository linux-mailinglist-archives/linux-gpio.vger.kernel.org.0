Return-Path: <linux-gpio+bounces-39366-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ks3fNrMvRmpaLQsAu9opvQ
	(envelope-from <linux-gpio+bounces-39366-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 11:30:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CBD6F5429
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Jul 2026 11:30:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=uXu5sLwd;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39366-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39366-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A942831280EB
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jul 2026 09:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C862A47A0DC;
	Thu,  2 Jul 2026 09:22:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8F43C76A6;
	Thu,  2 Jul 2026 09:22:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984141; cv=none; b=D7E78HsOQcTEAQ0q3C7AL9Qg9MhHVid2YdSmzwEjczHrRLdi/94f13KJZOC/IZwum/ZKbAetDzrCyY5X46hXg4QVBa3w5bmQ+Tl4VeIwbLN3KBVW27/TjNQN0pH2HxRO5h3nETyLnAudVir1FfV7CxI/lRN4M9xB8ahaUn1vB8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984141; c=relaxed/simple;
	bh=qJQUxyQa/oV7ooLCRsSCWRp4f3xDW+JXpn7CbBbE75M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WqwsCf0WQd6kLuoayYZI9Bg5oBEil0D4080c8/SZp8mJxBzBmOy3yHz3B4KUcMicKSuyUCbf+qOKVdjutJ1NS9vAHJf/+QUviq6mKYwvz6pSTjFpdX4TAqNcRswE0NEpacNe9hVfBas5yxP91D4LGho8+Hi+Nz3Ivh7nL16hh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXu5sLwd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F1ACC19425;
	Thu,  2 Jul 2026 09:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782984141;
	bh=qJQUxyQa/oV7ooLCRsSCWRp4f3xDW+JXpn7CbBbE75M=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=uXu5sLwdqji51Ounzg+P9IO/LRDlquF6RDS10QKkkaQ0KdytfIa879BsV6ZogSGXv
	 8lBS8/NsHS7Pgd/7/gyY1Xcpj766I8zFLGxq9wEphlPbXScVIIJP5nV2MHRcgWR1ao
	 iZ9qd9UypTbHCToaGIeEIDE3IwPx+ZP+0j6Gu+tlZGo5zE1s2ltN2v48lTtZVy3Pb5
	 Gd/dwrF4KtIbsT9WJj4WXjP5flFedVbOUaFIfEqyZBPa6EHWhsghs/LSHzJSWK9Jf+
	 WF2yW+l2fujMScwTuYJFgIKtCZz4p/01VI40Mfk6dqevlnjaKMNIcqnWV2RMXbjeBF
	 IGk6w5HKS/+4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E092C43602;
	Thu,  2 Jul 2026 09:22:21 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Thu, 02 Jul 2026 17:22:12 +0800
Subject: [PATCH v2] gpio: dwapb: Defer clock gating until noirq
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-gpio-dwapb-wakeup-v2-1-203f2f33429f@ultrarisc.com>
X-B4-Tracking: v=1; b=H4sIAMMtRmoC/32Nyw6CMBBFf8XM2jF9IIor/8OwKGWA8UGbloeG8
 O8C7l2e5NxzJ4gUmCJcdhMEGjiyaxdQ+x3YxrQ1IZcLgxIqFanKsPbssByNL3A0D+o96sSI47l
 KrVYJLDsfqOL31rzlP459cSfbraHVaDh2Lny200Gu3r/+IFGi1llSCaXlqTTX/tkFEzjag3Uvy
 Od5/gIgL20KyAAAAA==
X-Change-ID: 20260629-gpio-dwapb-wakeup-34a058f6c324
To: Hoan Tran <hoan@os.amperecomputing.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Hoan Tran <hotran@apm.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782984139; l=6676;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=dMMlFbMBw/FgK1r8G+xumrGpTK12lk2fghvVWpUDRmc=;
 b=OoPDnO4Y0AGJSlLsEmOAAm7r3MLgVr+q1AdTFlKr1ShCqzDluLIBnQ3+L/u9MSfnILoYU0hpb
 6rM9vZmIA6YAPeB1gy8m+tdXoOgrtGuUAf4T/yRc5glXjiJ99E4FtDB
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
Reply-To: wangjia@ultrarisc.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39366-lists,linux-gpio=lfdr.de,wangjia.ultrarisc.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hoan@os.amperecomputing.com,m:linusw@kernel.org,m:brgl@kernel.org,m:hotran@apm.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wangjia@ultrarisc.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[wangjia@ultrarisc.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,apm.com:email,amperecomputing.com:email,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46CBD6F5429

From: Jia Wang <wangjia@ultrarisc.com>

GPIO consumers such as gpio-keys can enable IRQ wake and adjust the wake
trigger type from their suspend callbacks. If the DWAPB controller suspends
first, masking interrupts and disabling its clocks in the normal suspend
phase prevents that late wake configuration from reliably reaching the
hardware. Systems with real DWAPB bus clocks then fail to wake from s2idle
through GPIO keys.

Save the register context in the normal suspend callback, but defer IRQ
masking and clock gating until suspend_noirq. At that point all consumers
have finished configuring wake IRQs, so keep the clocks enabled when wake
lines are armed and only gate them when no wake source is active.
Resume_noirq reenables clocks, if they were gated, before the normal resume
path restores registers.

Propagate wake requests to the parent irqchip while keeping the local wake
mask in sync with failures.

Fixes: 6437c7ba69c3 ("gpio: dwapb: Add wakeup source support")
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
This one-patch series fixes system wakeup for DesignWare APB GPIO
controllers that have real APB/debounce clocks.

The driver currently masks interrupts and disables its clocks from the
normal suspend callback. That is too early for GPIO consumers such as
gpio-keys, which may still enable IRQ wake or adjust the wake trigger type
from their own suspend callbacks. Once the DWAPB clocks are disabled, those
late wake updates cannot reliably reach the controller, and GPIO-key wake
from s2idle can fail.

Move the final interrupt masking and clock gating to suspend_noirq, after
consumers have completed their wake configuration. If at least one wake
line is armed, leave the clocks running and mark the device as part of the
wakeup path. Otherwise, gate the clocks in noirq and re-enable them from
resume_noirq before restoring the saved register state.

The patch also propagates aggregate wake enable/disable state to the
parent irqchip so a wake-capable parent interrupt is armed only while the
DWAPB controller has at least one local wake source.

Based on v7.2-rc1.
---
Changes in v2:
- Fix !CONFIG_IRQ_DOMAIN_HIERARCHY builds by guarding parent wake handling.
- Link to v1: https://patch.msgid.link/20260629-gpio-dwapb-wakeup-v1-1-3394f02317da@ultrarisc.com

To: Hoan Tran <hoan@os.amperecomputing.com>
To: Linus Walleij <linusw@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Hoan Tran <hotran@apm.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpio/gpio-dwapb.c | 79 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 67 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index c1f3d83a67c1..f06f1915e6cc 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -118,6 +118,7 @@ struct dwapb_gpio {
 	unsigned int		flags;
 	struct reset_control	*rst;
 	struct clk_bulk_data	clks[DWAPB_NR_CLOCKS];
+	bool			clocks_on_for_wake;
 	struct dwapb_gpio_port	ports[] __counted_by(nr_ports);
 };
 
@@ -365,11 +366,24 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	struct dwapb_context *ctx = gpio->ports[0].ctx;
 	irq_hw_number_t bit = irqd_to_hwirq(d);
+	u32 wake_en = ctx->wake_en;
 
 	if (enable)
-		ctx->wake_en |= BIT(bit);
+		wake_en |= BIT(bit);
 	else
-		ctx->wake_en &= ~BIT(bit);
+		wake_en &= ~BIT(bit);
+
+#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
+	if (d->parent_data && !!ctx->wake_en != !!wake_en) {
+		int err;
+
+		err = irq_chip_set_wake_parent(d, enable);
+		if (err)
+			return err;
+	}
+#endif
+
+	ctx->wake_en = wake_en;
 
 	return 0;
 }
@@ -750,6 +764,8 @@ static int dwapb_gpio_suspend(struct device *dev)
 	int i;
 
 	scoped_guard(gpio_generic_lock_irqsave, gen_gc) {
+		gpio->clocks_on_for_wake = false;
+
 		for (i = 0; i < gpio->nr_ports; i++) {
 			unsigned int offset;
 			unsigned int idx = gpio->ports[i].idx;
@@ -771,11 +787,38 @@ static int dwapb_gpio_suspend(struct device *dev)
 				ctx->int_pol = dwapb_read(gpio, GPIO_INT_POLARITY);
 				ctx->int_type = dwapb_read(gpio, GPIO_INTTYPE_LEVEL);
 				ctx->int_deb = dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int dwapb_gpio_suspend_noirq(struct device *dev)
+{
+	struct dwapb_gpio *gpio = dev_get_drvdata(dev);
+	struct gpio_generic_chip *gen_gc = &gpio->ports[0].chip;
+	bool wake_enabled = false;
+	int i;
+
+	scoped_guard(gpio_generic_lock_irqsave, gen_gc) {
+		for (i = 0; i < gpio->nr_ports; i++) {
+			unsigned int idx = gpio->ports[i].idx;
+			struct dwapb_context *ctx = gpio->ports[i].ctx;
 
-				/* Mask out interrupts */
+			if (idx == 0) {
+				wake_enabled = ctx->wake_en;
 				dwapb_write(gpio, GPIO_INTMASK, ~ctx->wake_en);
+				break;
 			}
 		}
+
+		gpio->clocks_on_for_wake = wake_enabled;
+	}
+
+	if (wake_enabled) {
+		device_set_wakeup_path(dev);
+		return 0;
 	}
 
 	clk_bulk_disable_unprepare(DWAPB_NR_CLOCKS, gpio->clks);
@@ -783,18 +826,27 @@ static int dwapb_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int dwapb_gpio_resume(struct device *dev)
+static int dwapb_gpio_resume_noirq(struct device *dev)
 {
 	struct dwapb_gpio *gpio = dev_get_drvdata(dev);
-	struct gpio_chip *gc = &gpio->ports[0].chip.gc;
-	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
-	int i, err;
+	int err;
+
+	if (gpio->clocks_on_for_wake)
+		return 0;
 
 	err = clk_bulk_prepare_enable(DWAPB_NR_CLOCKS, gpio->clks);
-	if (err) {
+	if (err)
 		dev_err(gpio->dev, "Cannot reenable APB/Debounce clocks\n");
-		return err;
-	}
+
+	return err;
+}
+
+static int dwapb_gpio_resume(struct device *dev)
+{
+	struct dwapb_gpio *gpio = dev_get_drvdata(dev);
+	struct gpio_chip *gc = &gpio->ports[0].chip.gc;
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
+	int i;
 
 	guard(gpio_generic_lock_irqsave)(gen_gc);
 
@@ -828,8 +880,11 @@ static int dwapb_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops,
-				dwapb_gpio_suspend, dwapb_gpio_resume);
+static const struct dev_pm_ops dwapb_gpio_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dwapb_gpio_suspend, dwapb_gpio_resume)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(dwapb_gpio_suspend_noirq,
+				  dwapb_gpio_resume_noirq)
+};
 
 static struct platform_driver dwapb_gpio_driver = {
 	.driver		= {

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-gpio-dwapb-wakeup-34a058f6c324

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>



