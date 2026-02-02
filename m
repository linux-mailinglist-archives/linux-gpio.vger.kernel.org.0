Return-Path: <linux-gpio+bounces-31357-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wP8AOogbgWm0EAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31357-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 22:47:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA05D1C6C
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Feb 2026 22:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42BDD3012874
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Feb 2026 21:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15AE314B79;
	Mon,  2 Feb 2026 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLa23lN+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933402D8DD1;
	Mon,  2 Feb 2026 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770068821; cv=none; b=ezW68TyxcOOJ0M0Hi7/9/qcr0bXNUo6RTCnWrJDuzqup+pNq1XX/WwGPPwteuHddPrxe+I0wSGx3xXXVF7Uat6Rvb0rBSTs4bDizO6mUfc9ksSVBEIKUpSR1xk/5acFUOZt5CJCUmNFS1u/6Fw24nu//9Cw1wAAvPHAIOKuDvTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770068821; c=relaxed/simple;
	bh=qPSzOtnJs389fCRczvT042YaNEiHH6grHBp9Lv5PF60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J2vcUm7THCfK4bzJ39aJGyeEU4UEXwyEghjgLergoD1hQbCmTPDcXRrbJfrJMKrUEzBjxpPmxp2pWiudh9vWaku1VR2bHYwRqMP1Qts0IN85m425/KFFMppb2S9mk3oqC5WwhFIWEIyEhX6rO6yyVHSlzD6Dq8Zbh1tYvaGqyKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLa23lN+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22572C116C6;
	Mon,  2 Feb 2026 21:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770068821;
	bh=qPSzOtnJs389fCRczvT042YaNEiHH6grHBp9Lv5PF60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RLa23lN+Zpuq0fmt/qSY5PODlLfvtgvkWP5euQjo4nLIMuQr403OwwEuPIXXH3TPH
	 nwuyAR94620PDR4ZsLw7hFMNl6XsFYxP47WeZRYGpwuBjhJILnAAbLI6mMgo4rpTwo
	 wFos8+VmJVfvVi1yovE1jMbcIfgNcqjVn0ccyr7zXC8HHvbcnRFO6+P1/sMf5YPL2S
	 3QV655FITYV3hmiUqWRefUnY4aYrjiJRZaTTY7oMYzMN0KTYoUqDmdxCTau8/CpxEX
	 NlKl0W75TXvXiJNucMQEGbtF/71nXipej0U8IrOwmy5S6YXvM+FQbeqf80WR+KoRSG
	 OwiiPv7fPuUWQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Xuewen Yan <xuewen.yan@unisoc.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	linusw@kernel.org,
	brgl@kernel.org,
	orsonzhai@gmail.com,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	linux-gpio@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH AUTOSEL 6.18-5.10] gpio: sprd: Change sprd_gpio lock to raw_spin_lock
Date: Mon,  2 Feb 2026 16:46:02 -0500
Message-ID: <20260202214643.212290-7-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202214643.212290-1-sashal@kernel.org>
References: <20260202214643.212290-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[unisoc.com,linux.alibaba.com,linutronix.de,oss.qualcomm.com,kernel.org,gmail.com,goodmis.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-31357-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,alibaba.com:email]
X-Rspamd-Queue-Id: 8CA05D1C6C
X-Rspamd-Action: no action

From: Xuewen Yan <xuewen.yan@unisoc.com>

[ Upstream commit 96313fcc1f062ba239f4832c9eff685da6c51c99 ]

There was a lockdep warning in sprd_gpio:

[    6.258269][T329@C6] [ BUG: Invalid wait context ]
[    6.258270][T329@C6] 6.18.0-android17-0-g30527ad7aaae-ab00009-4k #1 Tainted: G        W  OE
[    6.258272][T329@C6] -----------------------------
[    6.258273][T329@C6] modprobe/329 is trying to lock:
[    6.258275][T329@C6] ffffff8081c91690 (&sprd_gpio->lock){....}-{3:3}, at: sprd_gpio_irq_unmask+0x4c/0xa4 [gpio_sprd]
[    6.258282][T329@C6] other info that might help us debug this:
[    6.258283][T329@C6] context-{5:5}
[    6.258285][T329@C6] 3 locks held by modprobe/329:
[    6.258286][T329@C6]  #0: ffffff808baca108 (&dev->mutex){....}-{4:4}, at: __driver_attach+0xc4/0x204
[    6.258295][T329@C6]  #1: ffffff80965e7240 (request_class#4){+.+.}-{4:4}, at: __setup_irq+0x1cc/0x82c
[    6.258304][T329@C6]  #2: ffffff80965e70c8 (lock_class#4){....}-{2:2}, at: __setup_irq+0x21c/0x82c
[    6.258313][T329@C6] stack backtrace:
[    6.258314][T329@C6] CPU: 6 UID: 0 PID: 329 Comm: modprobe Tainted: G        W  OE       6.18.0-android17-0-g30527ad7aaae-ab00009-4k #1 PREEMPT  3ad5b0f45741a16e5838da790706e16ceb6717df
[    6.258316][T329@C6] Tainted: [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[    6.258317][T329@C6] Hardware name: Unisoc UMS9632-base Board (DT)
[    6.258318][T329@C6] Call trace:
[    6.258318][T329@C6]  show_stack+0x20/0x30 (C)
[    6.258321][T329@C6]  __dump_stack+0x28/0x3c
[    6.258324][T329@C6]  dump_stack_lvl+0xac/0xf0
[    6.258326][T329@C6]  dump_stack+0x18/0x3c
[    6.258329][T329@C6]  __lock_acquire+0x824/0x2c28
[    6.258331][T329@C6]  lock_acquire+0x148/0x2cc
[    6.258333][T329@C6]  _raw_spin_lock_irqsave+0x6c/0xb4
[    6.258334][T329@C6]  sprd_gpio_irq_unmask+0x4c/0xa4 [gpio_sprd 814535e93c6d8e0853c45c02eab0fa88a9da6487]
[    6.258337][T329@C6]  irq_startup+0x238/0x350
[    6.258340][T329@C6]  __setup_irq+0x504/0x82c
[    6.258342][T329@C6]  request_threaded_irq+0x118/0x184
[    6.258344][T329@C6]  devm_request_threaded_irq+0x94/0x120
[    6.258347][T329@C6]  sc8546_init_irq+0x114/0x170 [sc8546_charger 223586ccafc27439f7db4f95b0c8e6e882349a99]
[    6.258352][T329@C6]  sc8546_charger_probe+0x53c/0x5a0 [sc8546_charger 223586ccafc27439f7db4f95b0c8e6e882349a99]
[    6.258358][T329@C6]  i2c_device_probe+0x2c8/0x350
[    6.258361][T329@C6]  really_probe+0x1a8/0x46c
[    6.258363][T329@C6]  __driver_probe_device+0xa4/0x10c
[    6.258366][T329@C6]  driver_probe_device+0x44/0x1b4
[    6.258369][T329@C6]  __driver_attach+0xd0/0x204
[    6.258371][T329@C6]  bus_for_each_dev+0x10c/0x168
[    6.258373][T329@C6]  driver_attach+0x2c/0x3c
[    6.258376][T329@C6]  bus_add_driver+0x154/0x29c
[    6.258378][T329@C6]  driver_register+0x70/0x10c
[    6.258381][T329@C6]  i2c_register_driver+0x48/0xc8
[    6.258384][T329@C6]  init_module+0x28/0xfd8 [sc8546_charger 223586ccafc27439f7db4f95b0c8e6e882349a99]
[    6.258389][T329@C6]  do_one_initcall+0x128/0x42c
[    6.258392][T329@C6]  do_init_module+0x60/0x254
[    6.258395][T329@C6]  load_module+0x1054/0x1220
[    6.258397][T329@C6]  __arm64_sys_finit_module+0x240/0x35c
[    6.258400][T329@C6]  invoke_syscall+0x60/0xec
[    6.258402][T329@C6]  el0_svc_common+0xb0/0xe4
[    6.258405][T329@C6]  do_el0_svc+0x24/0x30
[    6.258407][T329@C6]  el0_svc+0x54/0x1c4
[    6.258409][T329@C6]  el0t_64_sync_handler+0x68/0xdc
[    6.258411][T329@C6]  el0t_64_sync+0x1c4/0x1c8

This is because the spin_lock would change to rt_mutex in PREEMPT_RT,
however the sprd_gpio->lock would use in hard-irq, this is unsafe.

So change the spin_lock_t to raw_spin_lock_t to use the spinlock
in hard-irq.

Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lore.kernel.org/r/20260126094209.9855-1-xuewen.yan@unisoc.com
[Bartosz: tweaked the commit message]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The driver has been present since kernel 4.14 (initial commit
`9a3821c2bb47d`). The patch should apply cleanly to all stable versions
as it's a simple lock type change with no dependencies.

### 9. SIMILAR PRECEDENT

This type of fix (spin_lock → raw_spin_lock for RT compatibility in IRQ
context) is extremely common and well-understood. It's a standard
pattern that has been applied to many drivers.

### SUMMARY

**Pros:**
- Fixes a real lockdep warning/bug on PREEMPT_RT systems
- Very small, mechanical, and obviously correct change
- Reviewed by PREEMPT_RT maintainer (Sebastian Andrzej Siewior)
- No functional change on non-RT kernels
- Pattern has been applied many times before
- Clean backport - no dependencies

**Cons:**
- Affects only PREEMPT_RT users (smaller user base)
- The driver is for Spreadtrum/Unisoc hardware (embedded/mobile)

**Risk vs Benefit:**
- Risk: Negligible - the change is mechanical and well-understood
- Benefit: Fixes potential deadlock/invalid context on RT systems

This commit is an excellent candidate for stable backporting. It fixes a
real bug (lockdep warning indicating invalid wait context), is small and
contained (10 lines), has been reviewed by domain experts, and follows a
well-established pattern. The change is a no-op on non-RT kernels and
fixes the bug on RT kernels.

**YES**

 drivers/gpio/gpio-sprd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
index 413bcd0a42405..2cc8abe705cdb 100644
--- a/drivers/gpio/gpio-sprd.c
+++ b/drivers/gpio/gpio-sprd.c
@@ -35,7 +35,7 @@
 struct sprd_gpio {
 	struct gpio_chip chip;
 	void __iomem *base;
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	int irq;
 };
 
@@ -54,7 +54,7 @@ static void sprd_gpio_update(struct gpio_chip *chip, unsigned int offset,
 	unsigned long flags;
 	u32 tmp;
 
-	spin_lock_irqsave(&sprd_gpio->lock, flags);
+	raw_spin_lock_irqsave(&sprd_gpio->lock, flags);
 	tmp = readl_relaxed(base + reg);
 
 	if (val)
@@ -63,7 +63,7 @@ static void sprd_gpio_update(struct gpio_chip *chip, unsigned int offset,
 		tmp &= ~BIT(SPRD_GPIO_BIT(offset));
 
 	writel_relaxed(tmp, base + reg);
-	spin_unlock_irqrestore(&sprd_gpio->lock, flags);
+	raw_spin_unlock_irqrestore(&sprd_gpio->lock, flags);
 }
 
 static int sprd_gpio_read(struct gpio_chip *chip, unsigned int offset, u16 reg)
@@ -236,7 +236,7 @@ static int sprd_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(sprd_gpio->base))
 		return PTR_ERR(sprd_gpio->base);
 
-	spin_lock_init(&sprd_gpio->lock);
+	raw_spin_lock_init(&sprd_gpio->lock);
 
 	sprd_gpio->chip.label = dev_name(&pdev->dev);
 	sprd_gpio->chip.ngpio = SPRD_GPIO_NR;
-- 
2.51.0


