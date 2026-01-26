Return-Path: <linux-gpio+bounces-31052-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CENGFDE3d2nhdAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31052-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:43:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA2B86230
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 10:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E490230057BF
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 09:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928B3329E5C;
	Mon, 26 Jan 2026 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b="fqHdxsqS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EAF329C66
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769420553; cv=none; b=MPNsRQR9BxzyuZgXrkIWgCMsQ+WxHNAf3dbk0xqLJATPHW2E+dreqK3UGHZsctFh7MfQzOmkfsmJ2Ud69lk2PVzA5OMBUZ8uaYFM72JkNAsiGI+rwWD4s8tjZVk1eSOWX9QtT4Ct5I54D2s8QFykkZdw4yvnR5zOUXLMSuQH4Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769420553; c=relaxed/simple;
	bh=e+rBxt+Pncyl1TyEcmYNUeytp+64THVqv4srVnVu6tw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Toi66GC6KqdtbT2VaX4zF4Bu63PU00i6ltacdFtzynSAtldTUA1NrgN1KU9+HcIEtMVaZb0HH48QyDZkNiEQn9mPnz5zhI3mVEfsPmls/Ko7vd9DV3Lvsk8kofbws2838oyHhzR2okC5mNfDoZJEwJ/VIz+x9KtFrvMs6lKt/sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b=fqHdxsqS; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 60Q9gLhd031266;
	Mon, 26 Jan 2026 17:42:21 +0800 (+08)
	(envelope-from Xuewen.Yan@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX01.spreadtrum.com [10.0.64.7])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4f03MJ0sYVz2MC7lr;
	Mon, 26 Jan 2026 17:36:28 +0800 (CST)
Received: from BJ10918NBW01.spreadtrum.com (10.0.73.73) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Mon, 26 Jan 2026 17:42:18 +0800
From: Xuewen Yan <xuewen.yan@unisoc.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <orsonzhai@gmail.com>,
        <baolin.wang@linux.alibaba.com>, <zhang.lyra@gmail.com>
CC: <bigeasy@linutronix.de>, <clrkwllms@kernel.org>, <rostedt@goodmis.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rt-devel@lists.linux.dev>, <ke.wang@unisoc.com>,
        <wenhua.lin@unisoc.com>, <xuewen.yan94@gmail.com>
Subject: [PATCH] gpio: sprd: Change sprd_gpio lock to raw_spin_lock
Date: Mon, 26 Jan 2026 17:42:09 +0800
Message-ID: <20260126094209.9855-1-xuewen.yan@unisoc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL:SHSQR01.spreadtrum.com 60Q9gLhd031266
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1769420545;
	bh=anH4RXOINSlFMa4isxDaqLe7VK0UrjMpiiI9hRya00g=;
	h=From:To:CC:Subject:Date;
	b=fqHdxsqSbHdZ60gFddzPNbAxQ0SJlEm7ANsfydq2ME3gmJ08quV1cJ89lEA1Kz9tf
	 g0XrYBIzoFbzKquZZFRZlx/s/J/svUaQmr70ZGLb9DE7DBHaG4ZKJknWv8StWcX+Zx
	 OZCn2tXiuPd/vxvNKINpySWPqhk9oRm9OdYvHPVkt33KwieqVz5dk5XRcgaR480KY4
	 2HUdEW5JXienWwc6LnjIduo3mZXtlu36C2ihVjoZOxj5VrejhTCdbclYJHe2SLg1QI
	 AXHODm/Mr7+/xoGKyTlXfq5WUxsvo1lARxPhJtIIfsGCQKXp4J1DzXnywuQFEOjA18
	 KqByolGac/ODg==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[unisoc.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[unisoc.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,goodmis.org,vger.kernel.org,lists.linux.dev,unisoc.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linux.alibaba.com];
	TAGGED_FROM(0.00)[bounces-31052-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuewen.yan@unisoc.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[unisoc.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,c6:email,unisoc.com:email,unisoc.com:dkim,unisoc.com:mid]
X-Rspamd-Queue-Id: 3CA2B86230
X-Rspamd-Action: no action

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

So change the spin_lock to raw_spin_lock to use the spinlock
in hard-irq.

Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
---
 drivers/gpio/gpio-sprd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
index 413bcd0a4240..2cc8abe705cd 100644
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
2.25.1


