Return-Path: <linux-gpio+bounces-14973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D439A17F49
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 14:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F83D1672F6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jan 2025 13:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 068841F2C5B;
	Tue, 21 Jan 2025 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="AcYD4CyC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CcqDvUa5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20FAE57D;
	Tue, 21 Jan 2025 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737467957; cv=none; b=VzHwqKSn8AyRLsV21iL//1R5duXnppJQZBNLys8cyR3CM41gM48xVQZXh9luqEsoQy8B1eJdLxOD1+IN9I1LMlieS1lwjgOc2mVHHHG7FVq7CVNnj3eyUcz4iiyQsogbdcI9ArWpomDtAazlAuPd6WPc5mDTOy3HIQfcHb+lYOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737467957; c=relaxed/simple;
	bh=0DWJYFRTL+8fpOx4VMor8cdYl8rl2RP4tlvfzc6r2ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gPdV6+8I6CCimPkT0h+wikDLgZSg+NjocboQgwfjBuublInBHo5E9WA+2w+ZnMWq0HbohcKAhcRMb2GoJjCze9iOvoS1qDRlcdovIu8g8nT36wMwrXZ6wdw0596u0WpGP1SDeGDtBK8p06D7AUMpSm190d1+mul1shrkb+4AvNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=AcYD4CyC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CcqDvUa5; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9BF6B254021A;
	Tue, 21 Jan 2025 08:59:13 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 21 Jan 2025 08:59:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1737467953; x=1737554353; bh=p/
	ctYWpKFst2pl6RZ952teyXW3LGpWHMYnbY8XMkYrg=; b=AcYD4CyChIcSyaTC96
	V7MoRe03azsSrKEvZk2QxEUng7PUJ4UbL2PxdCKlrOmOEkXfcIY1voVnl53xgWLy
	oNdszKggJOY1yxvjAPo2SndRkF8AhKMvoTqjO193zPej0aK2oj51f6wmDcfQZHZY
	8FtiTduQFa1ED/1MEgEOUoWxCDfK++gJol7SfNLXqx1jxYmTbN4Cmc67Vc5hK48x
	R3LEVcTCmHf4lV8bWhp5nNbkVzjYC7ocCPYvDBD2SBaBVI5ZeTdLYkkEtL6QOM9b
	dSqw7EV+T2eVX/A0blkae62WyrrN8kIWHsQElwsOqm9qaBE5FNoHeUditzc0nBcj
	PrAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1737467953; x=1737554353; bh=p/ctYWpKFst2pl6RZ952teyXW3LG
	pWHMYnbY8XMkYrg=; b=CcqDvUa57+DrQ1/edbwP29jKaqGR7yqSSnugsz1wfvWs
	17ZIk7ZD1JCQ78aycTLKGxZ2FrjTqNflkuLNicdmQCJb4NCVoUYW7A73SJkrtV9H
	Uw+FrH8bcV0is1EYsUVhNXeF32mRmhxEooXX6nnPgnCB1vffVgEmJPwevDUbMw8N
	Gw9CJWmjhMzKnkeUo43bznEOWQm1F+TutFsDGoDPp3QrMjpKFidVz/OIU2Z3fUNu
	WNmVV/XLsEYfS0KYH4RCt2gsXOqX3zazE2YdiJuzokFEvuAfmxT8VrU/5Wm5kpci
	qL/GBUIc3qJXkzwWxk/AW+BKIvF90Jj616zTV7bj5w==
X-ME-Sender: <xms:MaiPZyI4P9IWaX1LaEKNaZJhR1WAoIVKGdqG-Aq-D6wOIo4-egxLNw>
    <xme:MaiPZ6KOp9RJTS-gd160D0r4vVBTEmqKG0MwLi6rQjEsfGUTjnBnvZrKbu5jLuaI6
    ID15lKsU9ut7nOScnQ>
X-ME-Received: <xmr:MaiPZyufNQarfA2S_CtxNlo6Mbi-vb9tls53FZ5h5ZLvW4h-qw07UAsTZ1lcrDikus1DVsKO8eMJrKt0v-2_DuwwJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejvddgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtodhrvghnvghs
    rghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslh
    hinhgrrhhordhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphht
    thhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:MaiPZ3bTXByANWZYi4RqHQ-O9aUxlp0BvtmuIE1J1Nj4lTdyEdN1RA>
    <xmx:MaiPZ5bRjfrMXqYwesapGwJgQSUvrMKvEnfslMUsusD7Z_LZq6tI6w>
    <xmx:MaiPZzCd3ePSK3kWovOkN_6Lv33oRpOTAvHli3oQ9A2VpY5KRN0kzw>
    <xmx:MaiPZ_aechs_z7tdUf30Z7vjv3LTdbdKdUNN2QbuUTu9z60un4Gdzw>
    <xmx:MaiPZ-PpUrs7b3hegRgppCBHay0jet9_9BhrK404UCnvknqBqihf2Qwj>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 08:59:12 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] gpio: rcar: Use raw_spinlock to protect register access
Date: Tue, 21 Jan 2025 14:58:33 +0100
Message-ID: <20250121135833.3769310-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use raw_spinlock in order to fix spurious messages about invalid context
when spinlock debugging is enabled. The lock is only used to serialize
register access.

    [    4.239592] =============================
    [    4.239595] [ BUG: Invalid wait context ]
    [    4.239599] 6.13.0-rc7-arm64-renesas-05496-gd088502a519f #35 Not tainted
    [    4.239603] -----------------------------
    [    4.239606] kworker/u8:5/76 is trying to lock:
    [    4.239609] ffff0000091898a0 (&p->lock){....}-{3:3}, at: gpio_rcar_config_interrupt_input_mode+0x34/0x164
    [    4.239641] other info that might help us debug this:
    [    4.239643] context-{5:5}
    [    4.239646] 5 locks held by kworker/u8:5/76:
    [    4.239651]  #0: ffff0000080fb148 ((wq_completion)async){+.+.}-{0:0}, at: process_one_work+0x190/0x62c
    [    4.250180] OF: /soc/sound@ec500000/ports/port@0/endpoint: Read of boolean property 'frame-master' with a value.
    [    4.254094]  #1: ffff80008299bd80 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_one_work+0x1b8/0x62c
    [    4.254109]  #2: ffff00000920c8f8
    [    4.258345] OF: /soc/sound@ec500000/ports/port@1/endpoint: Read of boolean property 'bitclock-master' with a value.
    [    4.264803]  (&dev->mutex){....}-{4:4}, at: __device_attach_async_helper+0x3c/0xdc
    [    4.264820]  #3: ffff00000a50ca40 (request_class#2){+.+.}-{4:4}, at: __setup_irq+0xa0/0x690
    [    4.264840]  #4:
    [    4.268872] OF: /soc/sound@ec500000/ports/port@1/endpoint: Read of boolean property 'frame-master' with a value.
    [    4.273275] ffff00000a50c8c8 (lock_class){....}-{2:2}, at: __setup_irq+0xc4/0x690
    [    4.296130] renesas_sdhi_internal_dmac ee100000.mmc: mmc1 base at 0x00000000ee100000, max clock rate 200 MHz
    [    4.304082] stack backtrace:
    [    4.304086] CPU: 1 UID: 0 PID: 76 Comm: kworker/u8:5 Not tainted 6.13.0-rc7-arm64-renesas-05496-gd088502a519f #35
    [    4.304092] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
    [    4.304097] Workqueue: async async_run_entry_fn
    [    4.304106] Call trace:
    [    4.304110]  show_stack+0x14/0x20 (C)
    [    4.304122]  dump_stack_lvl+0x6c/0x90
    [    4.304131]  dump_stack+0x14/0x1c
    [    4.304138]  __lock_acquire+0xdfc/0x1584
    [    4.426274]  lock_acquire+0x1c4/0x33c
    [    4.429942]  _raw_spin_lock_irqsave+0x5c/0x80
    [    4.434307]  gpio_rcar_config_interrupt_input_mode+0x34/0x164
    [    4.440061]  gpio_rcar_irq_set_type+0xd4/0xd8
    [    4.444422]  __irq_set_trigger+0x5c/0x178
    [    4.448435]  __setup_irq+0x2e4/0x690
    [    4.452012]  request_threaded_irq+0xc4/0x190
    [    4.456285]  devm_request_threaded_irq+0x7c/0xf4
    [    4.459398] ata1: link resume succeeded after 1 retries
    [    4.460902]  mmc_gpiod_request_cd_irq+0x68/0xe0
    [    4.470660]  mmc_start_host+0x50/0xac
    [    4.474327]  mmc_add_host+0x80/0xe4
    [    4.477817]  tmio_mmc_host_probe+0x2b0/0x440
    [    4.482094]  renesas_sdhi_probe+0x488/0x6f4
    [    4.486281]  renesas_sdhi_internal_dmac_probe+0x60/0x78
    [    4.491509]  platform_probe+0x64/0xd8
    [    4.495178]  really_probe+0xb8/0x2a8
    [    4.498756]  __driver_probe_device+0x74/0x118
    [    4.503116]  driver_probe_device+0x3c/0x154
    [    4.507303]  __device_attach_driver+0xd4/0x160
    [    4.511750]  bus_for_each_drv+0x84/0xe0
    [    4.515588]  __device_attach_async_helper+0xb0/0xdc
    [    4.520470]  async_run_entry_fn+0x30/0xd8
    [    4.524481]  process_one_work+0x210/0x62c
    [    4.528494]  worker_thread+0x1ac/0x340
    [    4.532245]  kthread+0x10c/0x110
    [    4.535476]  ret_from_fork+0x10/0x20

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---

Hi Geert,

This is similar to what was done to other GPIO drivers to solve the same
situation see [1], [2], [3] and [4] for some examples.

1. 3c938cc5cebc ("gpio: use raw spinlock for gpio chip shadowed data")
2. 37174f334130 ("gpio: tegra: Use raw_spinlock")
3. 4dbada2be460 ("gpio: omap: use raw locks for locking")
3. 505936131ea7 ("gpio: mpc8xxx: Convert mpc8xxx_gpio_chip.lock to raw_spinlock")
---
 drivers/gpio/gpio-rcar.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 2ecee3269a0c..8e0544e92488 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -40,7 +40,7 @@ struct gpio_rcar_info {
 
 struct gpio_rcar_priv {
 	void __iomem *base;
-	spinlock_t lock;
+	raw_spinlock_t lock;
 	struct device *dev;
 	struct gpio_chip gpio_chip;
 	unsigned int irq_parent;
@@ -123,7 +123,7 @@ static void gpio_rcar_config_interrupt_input_mode(struct gpio_rcar_priv *p,
 	 * "Setting Level-Sensitive Interrupt Input Mode"
 	 */
 
-	spin_lock_irqsave(&p->lock, flags);
+	raw_spin_lock_irqsave(&p->lock, flags);
 
 	/* Configure positive or negative logic in POSNEG */
 	gpio_rcar_modify_bit(p, POSNEG, hwirq, !active_high_rising_edge);
@@ -142,7 +142,7 @@ static void gpio_rcar_config_interrupt_input_mode(struct gpio_rcar_priv *p,
 	if (!level_trigger)
 		gpio_rcar_write(p, INTCLR, BIT(hwirq));
 
-	spin_unlock_irqrestore(&p->lock, flags);
+	raw_spin_unlock_irqrestore(&p->lock, flags);
 }
 
 static int gpio_rcar_irq_set_type(struct irq_data *d, unsigned int type)
@@ -246,7 +246,7 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 	 * "Setting General Input Mode"
 	 */
 
-	spin_lock_irqsave(&p->lock, flags);
+	raw_spin_lock_irqsave(&p->lock, flags);
 
 	/* Configure positive logic in POSNEG */
 	gpio_rcar_modify_bit(p, POSNEG, gpio, false);
@@ -261,7 +261,7 @@ static void gpio_rcar_config_general_input_output_mode(struct gpio_chip *chip,
 	if (p->info.has_outdtsel && output)
 		gpio_rcar_modify_bit(p, OUTDTSEL, gpio, false);
 
-	spin_unlock_irqrestore(&p->lock, flags);
+	raw_spin_unlock_irqrestore(&p->lock, flags);
 }
 
 static int gpio_rcar_request(struct gpio_chip *chip, unsigned offset)
@@ -347,7 +347,7 @@ static int gpio_rcar_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 		return 0;
 	}
 
-	spin_lock_irqsave(&p->lock, flags);
+	raw_spin_lock_irqsave(&p->lock, flags);
 	outputs = gpio_rcar_read(p, INOUTSEL);
 	m = outputs & bankmask;
 	if (m)
@@ -356,7 +356,7 @@ static int gpio_rcar_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 	m = ~outputs & bankmask;
 	if (m)
 		val |= gpio_rcar_read(p, INDT) & m;
-	spin_unlock_irqrestore(&p->lock, flags);
+	raw_spin_unlock_irqrestore(&p->lock, flags);
 
 	bits[0] = val;
 	return 0;
@@ -367,9 +367,9 @@ static void gpio_rcar_set(struct gpio_chip *chip, unsigned offset, int value)
 	struct gpio_rcar_priv *p = gpiochip_get_data(chip);
 	unsigned long flags;
 
-	spin_lock_irqsave(&p->lock, flags);
+	raw_spin_lock_irqsave(&p->lock, flags);
 	gpio_rcar_modify_bit(p, OUTDT, offset, value);
-	spin_unlock_irqrestore(&p->lock, flags);
+	raw_spin_unlock_irqrestore(&p->lock, flags);
 }
 
 static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
@@ -386,12 +386,12 @@ static void gpio_rcar_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	if (!bankmask)
 		return;
 
-	spin_lock_irqsave(&p->lock, flags);
+	raw_spin_lock_irqsave(&p->lock, flags);
 	val = gpio_rcar_read(p, OUTDT);
 	val &= ~bankmask;
 	val |= (bankmask & bits[0]);
 	gpio_rcar_write(p, OUTDT, val);
-	spin_unlock_irqrestore(&p->lock, flags);
+	raw_spin_unlock_irqrestore(&p->lock, flags);
 }
 
 static int gpio_rcar_direction_output(struct gpio_chip *chip, unsigned offset,
@@ -505,7 +505,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	p->dev = dev;
-	spin_lock_init(&p->lock);
+	raw_spin_lock_init(&p->lock);
 
 	/* Get device configuration from DT node */
 	ret = gpio_rcar_parse_dt(p, &npins);
-- 
2.48.1


