Return-Path: <linux-gpio+bounces-31761-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJJZLRCMlGnTFQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31761-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 16:41:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4520D14DA5E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 16:41:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 963A0300E5A9
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 15:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE7836C598;
	Tue, 17 Feb 2026 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="GhN3Cs+J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A899836B045;
	Tue, 17 Feb 2026 15:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771342862; cv=none; b=KRCohANz2silmgm9aYLEjGRKdSPvjeTtY+qQry4HNejwq553meVsDKICp6WrtnHgS324eXlOs69EY2acsRQhpWbHzorKQQlOn/cKbOLCh7CQOwmwxS+Ed8sRFlrXJ8jOCZ3Aqorbsi9htbebA8Wz5/NbTgYzxh7DJNBUv7VXkgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771342862; c=relaxed/simple;
	bh=+kt3+dntmydrhGoCypN0jxjvfCf5WhKPn/sfYKsSxKY=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=QoghTpFIi0yFwzZ5scHizxXBdVp9Mpcj4kIKwCW6+vavyAzFfMseoBaDqs4tMjT0CU0u7d8XLWFW7DBf54RcQ9CBJSXFh4lCoGh/VLPhjfAoy67K7SY68kiPZzXP0VvEfpeZ219VNTrrDHfRfptl73pggsMW5wwV2ZiVEmOA/TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=GhN3Cs+J; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dj0ut5bgcVTLP0CqY5XGK5+PT8/xVCmk4FDBTMonOxE=; b=GhN3Cs+JHUyxAVZlzCTUncWfGO
	6NBbIYTcjEeWDAdQPs4wSu5UFb384kLp+y/25Oe+SaWXGg5OWL5NX+kDsfN79Am+y9Aer1XGb8R0v
	uuMPOrteH0geb5iGmN7DBwG5L4s7aDzNZekf4pzgjoGqmX+0ZEkaVhOmH1M4H1K8npsAYQ5VA4Rc0
	nX15Fw5HPZoPifeI+Y6DPe1rbJQ6oYSnC1M2xcGPR+te4zm1G7RmDN0BTYlj93rFfInJWikHomqMk
	93Atp3zwg577JwolzOH6Yn2lTUr274o+22NX2eCIwjdSM1HKVoGfv0SJdZaHYGzYJ21IKxy1CQJc9
	i4bL8fAw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49886 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vsNBw-000000007r5-19ZZ;
	Tue, 17 Feb 2026 15:40:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vsNBv-00000009nfA-27ZK;
	Tue, 17 Feb 2026 15:40:47 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Laxman Dewangan <ldewangan@nvidia.com>,
	 Dmitry Osipenko <digetx@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH net-next] i2c: tegra: runtime PM is not IRQ-safe
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 17 Feb 2026 15:40:47 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FREEMAIL_TO(0.00)[nvidia.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31761-lists,linux-gpio=lfdr.de,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 4520D14DA5E
X-Rspamd-Action: no action

i2c-tegra marks its runtime PM as IRQ safe using pm_runtime_irq_safe().
However, tegra_i2c_runtime_suspend() calls
pinctrl_pm_select_idle_state(), which eventually calls
pinmux_disable_setting() which will take the desc->mux_lock mutex.
When this happens, the result is:

BUG: sleeping function called from invalid context at kernel/locking/mutex.c:591
in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 12, name: kworker/u24:0
preempt_count: 0, expected: 0
RCU nest depth: 0, expected: 0
3 locks held by kworker/u24:0/12:
 #0: ffff000080020d48 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_one_work+0x184/0x628
 #1: ffff80008225bde8 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1ac/0x628
 #2: ffff000080ad90f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x2c/0x188
irq event stamp: 97058
ktime_get+0x130/0x180
_raw_spin_lock_irqsave+0x84/0x88
handle_softirqs+0x448/0x494
__do_softirq+0x14/0x20
CPU: 1 UID: 0 PID: 12 Comm: kworker/u24:0 Not tainted 6.19.0-rc8-net-next+ #591 PREEMPT
Hardware name: NVIDIA NVIDIA Jetson Xavier NX Developer Kit/Jetson, BIOS 6.0-37391689 08/28/2024
Workqueue: events_unbound deferred_probe_work_func
Call trace:
 show_stack+0x18/0x30 (C)
 dump_stack_lvl+0x6c/0x94
 dump_stack+0x18/0x24
 __might_resched+0x154/0x220
 __might_sleep+0x48/0x80
 __mutex_lock+0x48/0x800
 mutex_lock_nested+0x24/0x30
 pinmux_disable_setting+0x9c/0x180
 pinctrl_commit_state+0x5c/0x260
 pinctrl_pm_select_idle_state+0x4c/0xa0
 tegra_i2c_runtime_suspend+0x2c/0x3c
 pm_generic_runtime_suspend+0x2c/0x44
 __rpm_callback+0x48/0x1ec
 rpm_callback+0x74/0x80
 rpm_suspend+0xec/0x630
 rpm_idle+0x274/0x42c
 __pm_runtime_idle+0x44/0x154
 tegra_i2c_probe+0x2c0/0x540
 platform_probe+0x5c/0xa4
 really_probe+0xbc/0x2c0
 __driver_probe_device+0x78/0x120
 driver_probe_device+0x3c/0x160
 __device_attach_driver+0xb8/0x140
 bus_for_each_drv+0x70/0xb8
 __device_attach+0xa4/0x188
 device_initial_probe+0x50/0x54
 bus_probe_device+0x38/0xa4
 deferred_probe_work_func+0x90/0xcc
 process_one_work+0x204/0x628
 worker_thread+0x1bc/0x360
 kthread+0x138/0x210
 ret_from_fork+0x10/0x20

This was observed on the nVidia Jetson Xavier NX platform.

Thus, no, the runtime PM is not IRQ-safe. Remove the call marking it as
such.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
The IRQ-safe marking was introduced by commit ede2299f7101 ("i2c:
tegra: Support atomic transfers").

However, since then there have been patches disabling the IRQ-safe
marking:

9e29420ddb13 i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
14d069d92951 i2c: tegra: Do not mark ACPI devices as irq safe

Clearly, the presence of pinctrl_pm_select_idle_state() which can sleep
means, definitively, that runtime PM on this device is not IRQ safe,
and if the original patch introducing atomic transfers relies on these
being IRQ safe, that patch was incorrect (maybe on such devices, it
should not change the pin state, and the driver should have a flag to
allow the driver to be used in atomic contexts?)

The alternative to this patch is to get rid of the pinctrl calls in the
runtime PM path.
---
 drivers/i2c/busses/i2c-tegra.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e533460bccc3..878a2d1c9749 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1829,18 +1829,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	if (err)
 		goto release_clocks;
 
-	/*
-	 * VI I2C is in VE power domain which is not always ON and not
-	 * IRQ-safe.  Thus, IRQ-safe device shouldn't be attached to a
-	 * non IRQ-safe domain because this prevents powering off the power
-	 * domain.
-	 *
-	 * VI I2C device shouldn't be marked as IRQ-safe because VI I2C won't
-	 * be used for atomic transfers. ACPI device is not IRQ safe also.
-	 */
-	if (!IS_VI(i2c_dev) && !has_acpi_companion(i2c_dev->dev))
-		pm_runtime_irq_safe(i2c_dev->dev);
-
 	pm_runtime_enable(i2c_dev->dev);
 
 	err = tegra_i2c_init_hardware(i2c_dev);
-- 
2.47.3


