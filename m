Return-Path: <linux-gpio+bounces-31451-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O2WLZ6Lg2lWpAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31451-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 19:10:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D18D9EB725
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 19:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D25530302FF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 18:06:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C0742981C;
	Wed,  4 Feb 2026 18:05:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047F7429813;
	Wed,  4 Feb 2026 18:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228344; cv=none; b=ui+q3xPC23rCi4Cap6zn4oYm5wRD72IFOFSATNIrsieHhiMr20fLDMjLhbtAH+8EI9T3V1arv3aeMMh4jSTLzwS8eKFkl8o/YH/S/SdfG08Fp3m7w+GS8LeOhbr8dEfcL3Q2YoJt6Chrp9n+JYu0YHz44Su2no00VVzfv1ae1mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228344; c=relaxed/simple;
	bh=pT4o1mgPI2G+9EijsmDovnmvI/n8xcF1ylZgs4OGlN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/5yssB8BhIPBdpqWW2ZL2t1tKaPh9JSN2lsti76V6/Q3oBQ3ZG16emTV7cRLVjwq5Md53K3xxlZdaRCpjSEdsrdEKvdfXm9qMiU14KyLj+XWVOUlS99LfXt6m+LDCxrZrPcTbDZ9P2xLmbbk8psKRmNEDHVKHWF78Ne9ZXbA6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: nzZd/Y/gSUWKBVCrCRjDPA==
X-CSE-MsgGUID: xsULi3QPRE2EWdI/VxqcYg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2026 03:05:42 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.27])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 235EB405560F;
	Thu,  5 Feb 2026 03:05:38 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH] pinctrl: renesas: rzt2h: fix invalid wait context
Date: Wed,  4 Feb 2026 20:04:48 +0200
Message-ID: <20260204180448.529313-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31451-lists,linux-gpio=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: D18D9EB725
X-Rspamd-Action: no action

The following invalid wait context BUG is observed when running with
CONFIG_PROVE_LOCKING enabled.

This seems to stem from the fact that __setup_irq() takes a
raw_spinlock_t, while we take a spinlock_t inside gpiod_get_direction().

raw_spinlock_t is a strictly spinning lock, while spinlock_t can sleep
if PREEMPT_RT is enabled.

Switch to raw_spinlock_t to fix this.

[   20.641809] =============================
[   20.646336] [ BUG: Invalid wait context ]
[   20.650964] 6.19.0-rc8-next-20260202+ #417 Not tainted
[   20.656892] -----------------------------
[   20.661517] (udev-worker)/235 is trying to lock:
[   20.666842] ffff000182d4ab58 (&pctrl->lock){....}-{3:3}, at: rzt2h_gpio_get_direction+0x3c/0x150
[   20.676928] other info that might help us debug this:
[   20.682560] context-{5:5}
[   20.685572] 4 locks held by (udev-worker)/235:
[   20.690701]  #0: ffff000180b398f8 (&dev->mutex){....}-{4:4}, at: __driver_attach+0x10c/0x210
[   20.700480]  #1: ffff000186f41a60 (request_class){+.+.}-{4:4}, at: __setup_irq+0x10c/0x740
[   20.709952]  #2: ffff000186f418c8 (lock_class){....}-{2:2}, at: __setup_irq+0x12c/0x740
[   20.719057]  #3: ffff000182d4a690 (&gdev->srcu){.+.+}-{0:0}, at: gpiod_get_direction+0x40/0x24c
[   20.729135] stack backtrace:
[   20.732450] CPU: 2 UID: 0 PID: 235 Comm: (udev-worker) Not tainted 6.19.0-rc8-next-20260202+ #417 PREEMPT
[   20.732459] Hardware name: Renesas RZ/T2H EVK Board based on r9a09g077m44 (DT)
[   20.732464] Call trace:
[   20.732467]  show_stack+0x18/0x30 (C)
[   20.732479]  dump_stack_lvl+0x70/0x98
[   20.732489]  dump_stack+0x18/0x24
[   20.732497]  __lock_acquire+0x910/0x1594
[   20.732508]  lock_acquire+0x2f0/0x42c
[   20.732517]  _raw_spin_lock_irqsave+0x5c/0x94
[   20.732529]  rzt2h_gpio_get_direction+0x3c/0x150
[   20.732538]  gpiochip_get_direction+0x34/0x90
[   20.732547]  gpiod_get_direction+0xd8/0x24c
[   20.732556]  gpiochip_lock_as_irq+0x68/0x144
[   20.732565]  gpiochip_irq_domain_activate+0x18/0x30
[   20.732574]  __irq_domain_activate_irq+0x60/0xb0
[   20.732583]  irq_domain_activate_irq+0x34/0x5c
[   20.732593]  irq_activate+0x2c/0x38
[   20.732600]  __setup_irq+0x2d8/0x740
[   20.732610]  request_threaded_irq+0xb0/0x180
[   20.732620]  request_any_context_irq+0x58/0xac
[   20.732629]  devm_request_any_context_irq+0x78/0x160
[   20.732637]  gpio_keys_probe+0x344/0xb40 [gpio_keys]
[   20.732657]  platform_probe+0x5c/0xa4
[   20.732666]  really_probe+0xbc/0x2ac
[   20.732675]  __driver_probe_device+0x78/0x118
[   20.732684]  driver_probe_device+0x3c/0x170
[   20.732693]  __driver_attach+0x118/0x210
[   20.732701]  bus_for_each_dev+0x7c/0xdc
[   20.732710]  driver_attach+0x24/0x3c
[   20.732718]  bus_add_driver+0xe4/0x204
[   20.732727]  driver_register+0x68/0x124
[   20.732736]  __platform_driver_register+0x20/0x2c
[   20.732746]  gpio_keys_init+0x20/0x1000 [gpio_keys]
[   20.732758]  do_one_initcall+0x7c/0x530
[   20.732770]  do_init_module+0x54/0x23c
[   20.732780]  load_module+0x181c/0x1ed0
[   20.732789]  init_module_from_file+0xd8/0xfc
[   20.732797]  idempotent_init_module+0x1e0/0x2d0
[   20.732806]  __arm64_sys_finit_module+0x60/0xa4
[   20.732814]  invoke_syscall.constprop.0+0x40/0xf0
[   20.732824]  el0_svc_common.constprop.0+0xb8/0xd8
[   20.732832]  do_el0_svc+0x1c/0x28
[   20.732839]  el0_svc+0x4c/0x2dc
[   20.732850]  el0t_64_sync_handler+0xa0/0xe4
[   20.732860]  el0t_64_sync+0x198/0x19c

Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 9949108a35bb..d810dc0dae95 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -85,7 +85,7 @@ struct rzt2h_pinctrl {
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
 	DECLARE_BITMAP(used_irqs, RZT2H_INTERRUPTS_NUM);
-	spinlock_t			lock; /* lock read/write registers */
+	raw_spinlock_t			lock; /* lock read/write registers */
 	struct mutex			mutex; /* serialize adding groups and functions */
 	bool				safety_port_enabled;
 	atomic_t			wakeup_path;
@@ -145,7 +145,7 @@ static void rzt2h_pinctrl_set_pfc_mode(struct rzt2h_pinctrl *pctrl,
 	u64 reg64;
 	u16 reg16;
 
-	guard(spinlock_irqsave)(&pctrl->lock);
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
 	/* Set pin to 'Non-use (Hi-Z input protection)'  */
 	reg16 = rzt2h_pinctrl_readw(pctrl, port, PM(port));
@@ -474,7 +474,7 @@ static int rzt2h_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	guard(spinlock_irqsave)(&pctrl->lock);
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
 	/* Select GPIO mode in PMC Register */
 	rzt2h_pinctrl_set_gpio_en(pctrl, port, bit, true);
@@ -487,7 +487,7 @@ static void rzt2h_gpio_set_direction(struct rzt2h_pinctrl *pctrl, u32 port,
 {
 	u16 reg;
 
-	guard(spinlock_irqsave)(&pctrl->lock);
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
 	reg = rzt2h_pinctrl_readw(pctrl, port, PM(port));
 	reg &= ~PM_PIN_MASK(bit);
@@ -509,7 +509,7 @@ static int rzt2h_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	guard(spinlock_irqsave)(&pctrl->lock);
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
 	if (rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit)) {
 		/*
@@ -547,7 +547,7 @@ static int rzt2h_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	u8 bit = RZT2H_PIN_ID_TO_PIN(offset);
 	u8 reg;
 
-	guard(spinlock_irqsave)(&pctrl->lock);
+	guard(raw_spinlock_irqsave)(&pctrl->lock);
 
 	reg = rzt2h_pinctrl_readb(pctrl, port, P(port));
 	if (value)
@@ -964,7 +964,7 @@ static int rzt2h_pinctrl_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	spin_lock_init(&pctrl->lock);
+	raw_spin_lock_init(&pctrl->lock);
 	mutex_init(&pctrl->mutex);
 	platform_set_drvdata(pdev, pctrl);
 
-- 
2.52.0


