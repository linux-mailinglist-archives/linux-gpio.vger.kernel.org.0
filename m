Return-Path: <linux-gpio+bounces-31467-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPrzKJ9zhGnt2wMAu9opvQ
	(envelope-from <linux-gpio+bounces-31467-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 11:40:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B1AF16B5
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 11:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CAABB300A32D
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 10:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2A73A7F73;
	Thu,  5 Feb 2026 10:40:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A74200C2;
	Thu,  5 Feb 2026 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288026; cv=none; b=ltU9vADHqf/2vKt5CPrX6neaPWCEggPiRRpJGrzHBu9pq66BN9/k1kObG5tuSuvboik4p3Jt/oLV1wtv9KAVmmkFc0xhGQBGwpVxqBf1oe1ls1FJl8umJrLNmo3+6KIv/tkkRbCi5Eqywgk5Satiy6X/Q1ffI/fZnXaoRiFrDYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288026; c=relaxed/simple;
	bh=ztGGnsFEXbSSV2swdzsYqHHgzyUpoVTZnVJiA4hTBGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oVLtKraJZdaYBKsgstJiEpZPAWTwm46wdl369tZ/YlsQy1fIsyTVikZ5cl5JjicX753/5psZGE6aaM53jpaH1/VXXp9hq3jA6AmLzEs7XqElm7eH/nPbqGGtgBBucs896yVMaS1Kvw8cDwwPlOh6mZHBs3lWui0hw4f40x7Wy/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: mubSnlebRiKu1GMtLeJVOg==
X-CSE-MsgGUID: OX9Pwc8iQaCDOwy8u2rZxQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Feb 2026 19:40:24 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.13])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 32EC641791A1;
	Thu,  5 Feb 2026 19:40:20 +0900 (JST)
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
Subject: [PATCH v2] pinctrl: renesas: rzt2h: fix invalid wait context
Date: Thu,  5 Feb 2026 12:39:30 +0200
Message-ID: <20260205103930.666051-1-cosmin-gabriel.tanislav.xa@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31467-lists,linux-gpio=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63B1AF16B5
X-Rspamd-Action: no action

The rzt2h_gpio_get_direction() function is called from
gpiod_get_direction(), which ends up being used within the __setup_irq()
call stack when requesting an interrupt.

__setup_irq() holds a raw_spinlock_t with IRQs disabled, which creates
an atomic context. spinlock_t cannot be used within atomic context
when PREEMPT_RT is enabled, since it may become a sleeping lock.

An "[ BUG: Invalid wait context ]" splat is observed when running with
CONFIG_PROVE_LOCKING enabled, describing exactly the aforementioned call
stack.

__setup_irq() needs to hold a raw_spinlock_t with IRQs disabled to
serialize access against a concurrent hard interrupt.

Switch to raw_spinlock_t to fix this.

Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to handle interrupts")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * reword commit message to better describe why
   rzt2h_gpio_get_direction() needs to use raw_spinlock_t

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

