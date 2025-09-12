Return-Path: <linux-gpio+bounces-26036-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652D0B54866
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 11:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B488176529
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 09:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052F1285417;
	Fri, 12 Sep 2025 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DmBxXmlW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA4428751A
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 09:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757670802; cv=none; b=B1pxp8nkIdvNlNi9ZIy2xVjq8YPCjuX49/AyqYn/FWUT7ELYy5Up7rkzTJRwOS8HY0rpkudFDcDsvNC+kYo00fuzeLE5Nk9SNF0FKnsdjVgKhu64YRAbCSCFOLRQrvS5lhCoDbX25e9Z7GHRlPkmn9hcAu6TyYSfXdnfdYEBY2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757670802; c=relaxed/simple;
	bh=8k//oqODeNvjTEYYKfAncLtadxTJvZSm20dDhdVFxmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TJezpA2N8ZZVvBE3RS/F+758aMH6oNECerQDkcbvCKlkgE7R+O03xJ6F+PMGTDKy2AblD2tmLzMRbidx9OePUBleYL3ZV69YWBvPI5YOhQidhXcZ3URNzH0A7PF/cVcqUb8ulVKWGSux4DG4RAkBo7mKSZ06FS3vm8xQB21KD+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DmBxXmlW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45dec1ae562so16292615e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 02:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757670797; x=1758275597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7XfxhScw5K/pNKiOE5XDa0/rE5syTRmPjNymm4IZEw=;
        b=DmBxXmlWtt16JCdtZH+eM0Tew5ponkvIT1kaunaM3ls33aCriu8eyMO7AxAyQEL8lW
         lD1zjKTZSr8Uy8Vq9+HEOT76n98HHDmpIY5LPj8YdmanlWFIx01/dUEG47Q3mElYUuFL
         kNiLexvCoovNjeVd99TdqF3J1dZxA2YNTHtSuJwmrgU1AUvdMKfqpzn2ILyroSk8jpsz
         PBZn1rPzAnVyTMZUGVCgzbxWf7O8XNoOu5Pf2Stdx1U537V4DMTtHcmmP1abmx7l6QS4
         tm1PY1Re0CAA9qmbgITr4A6UwfCwwkepAV5SpdVxSdS3kHuMRfATt1NVGjjRM+GrZriR
         ebQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757670797; x=1758275597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7XfxhScw5K/pNKiOE5XDa0/rE5syTRmPjNymm4IZEw=;
        b=Cpi/zgV14UIc4Q2H2b0a685Oe+VDok557d5kW1GKHXKTEKPnHXZuuCHOoyA2gnLZSg
         zPV1sKsmSWbS2tlxAFCQDpYweZucvpAYEfTj8GxVbkQy5F4Lv6cjhali3v5Oy4KN13L3
         tCITSTXsSxHHL/7YCFJmWanZ2qFPgTuXsgnrnZU4rKfbPhEIMKydz1pUzyoreT50csOs
         FT+oj+8M+XxBnr2wpZSeUi2uEgVImeK2z7koJk9WGpADNvtU452DC1bsJIeqJNAD6o2g
         T9oH/mFKwZEiSqkFxvPgxcoiDkCdFpAwpqa9D8mKmCegZ7jNjaaCPVU5NwwhjP1RZbh7
         Aa7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlO/mjUO+XRI4nauvccdfX2a5oUJcNgioLTNJo+MI/FSrA3rfhytCoJiyXwzbkAHJZoOzVQx0LZQAw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrs1a9+4vzYNi2s4YOKeNWAZQAx96jDTONnPhPhiiqCCeHB/2G
	D8hPxvfS6J5yBg6lMP875Q7xTNWCrhSUAi42JKq/ZxRL2rxd+W4CWOJYhu9Vd2YTx8gdCmXQo9A
	8Hnrd
X-Gm-Gg: ASbGncsDjuH77pgN6LvpB59toUZk/ns2o+w1bCDP6o5gPF4vjjBrWSawg9fOXyGnG7j
	SipsnJZ6gQUoCfExfaa1735sgMKwG8U2+8imksB/1e/EBMbCoVLBnl2b09pO9vLBY4E7Yz/CVqt
	r6ijr+r98vxLZcbcINKnpuU0S2kv6tSlwDSBCqyFPxoNDduCH9GOqc+Ok0wvIHWq//OJz92utui
	cmMjwNIHwCHWCavIXwQMdJDtR25v42Q0CVKvnGdoOhttDFIHuBBqx0tnFvItjh8VIb7lUwUMXG6
	93b5d/dDAjIbyHfird8W5822dzeewIUhQVtCaRSPIFH9N2Q5KtBr/ZwoPQ2Gmfl+FrdK54l8Hrf
	8fI8BR8lMgB+WSsWvN+9cwcbmAciKDklS77vU2aH/LS6WqiuBy+kV
X-Google-Smtp-Source: AGHT+IHMKrVsenUpeia7t70Vufz+9EjifL1rICmtpRyfLfre57PvL5rJHcwpotRE8pRDh7ZjAgDWiw==
X-Received: by 2002:a05:6000:18a4:b0:3e4:f194:288f with SMTP id ffacd0b85a97d-3e765a56cf5mr2010478f8f.62.1757670797296;
        Fri, 12 Sep 2025 02:53:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d7ff9sm5865231f8f.51.2025.09.12.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:53:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
Date: Fri, 12 Sep 2025 12:53:08 +0300
Message-ID: <20250912095308.3603704-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL in
gpio_irq_{en,dis}able*()") dropped the configuration of ISEL from
struct irq_chip::{irq_enable, irq_disable} APIs and moved it to
struct gpio_chip::irq::{child_to_parent_hwirq,
child_irq_domain_ops::free} APIs to fix spurious IRQs.

After commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL
in gpio_irq_{en,dis}able*()"), ISEL was no longer configured properly on
resume. This is because the pinctrl resume code used
struct irq_chip::irq_enable  (called from rzg2l_gpio_irq_restore()) to
reconfigure the wakeup interrupts. Some drivers (e.g. Ethernet) may also
reconfigure non-wakeup interrupts on resume through their own code,
eventually calling struct irq_chip::irq_enable.

Fix this by adding ISEL configuration back into the
struct irq_chip::irq_enable API and on resume path for wakeup interrupts.

As struct irq_chip::irq_enable needs now to lock to update the ISEL,
convert the struct rzg2l_pinctrl::lock to a raw spinlock and replace the
locking API calls with the raw variants. Otherwise the lockdep reports
invalid wait context when probing the adv7511 module on RZ/G2L:

 [ BUG: Invalid wait context ]
 6.17.0-rc5-next-20250911-00001-gfcfac22533c9 #18 Not tainted
 -----------------------------
 (udev-worker)/165 is trying to lock:
 ffff00000e3664a8 (&pctrl->lock){....}-{3:3}, at: rzg2l_gpio_irq_enable+0x38/0x78
 other info that might help us debug this:
 context-{5:5}
 3 locks held by (udev-worker)/165:
 #0: ffff00000e890108 (&dev->mutex){....}-{4:4}, at: __driver_attach+0x90/0x1ac
 #1: ffff000011c07240 (request_class){+.+.}-{4:4}, at: __setup_irq+0xb4/0x6dc
 #2: ffff000011c070c8 (lock_class){....}-{2:2}, at: __setup_irq+0xdc/0x6dc
 stack backtrace:
 CPU: 1 UID: 0 PID: 165 Comm: (udev-worker) Not tainted 6.17.0-rc5-next-20250911-00001-gfcfac22533c9 #18 PREEMPT
 Hardware name: Renesas SMARC EVK based on r9a07g044l2 (DT)
 Call trace:
 show_stack+0x18/0x24 (C)
 dump_stack_lvl+0x90/0xd0
 dump_stack+0x18/0x24
 __lock_acquire+0xa14/0x20b4
 lock_acquire+0x1c8/0x354
 _raw_spin_lock_irqsave+0x60/0x88
 rzg2l_gpio_irq_enable+0x38/0x78
 irq_enable+0x40/0x8c
 __irq_startup+0x78/0xa4
 irq_startup+0x108/0x16c
 __setup_irq+0x3c0/0x6dc
 request_threaded_irq+0xec/0x1ac
 devm_request_threaded_irq+0x80/0x134
 adv7511_probe+0x928/0x9a4 [adv7511]
 i2c_device_probe+0x22c/0x3dc
 really_probe+0xbc/0x2a0
 __driver_probe_device+0x78/0x12c
 driver_probe_device+0x40/0x164
 __driver_attach+0x9c/0x1ac
 bus_for_each_dev+0x74/0xd0
 driver_attach+0x24/0x30
 bus_add_driver+0xe4/0x208
 driver_register+0x60/0x128
 i2c_register_driver+0x48/0xd0
 adv7511_init+0x5c/0x1000 [adv7511]
 do_one_initcall+0x64/0x30c
 do_init_module+0x58/0x23c
 load_module+0x1bcc/0x1d40
 init_module_from_file+0x88/0xc4
 idempotent_init_module+0x188/0x27c
 __arm64_sys_finit_module+0x68/0xac
 invoke_syscall+0x48/0x110
 el0_svc_common.constprop.0+0xc0/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x4c/0x160
 el0t_64_sync_handler+0xa0/0xe4
 el0t_64_sync+0x198/0x19c

Having ISEL configuration back into the struct irq_chip::irq_enable API
should be safe with respect to spurious IRQs, as in the probe case IRQs
are enabled anyway in struct gpio_chip::irq::child_to_parent_hwirq. No
spurious IRQs were detected on suspend/resume, boot, ethernet link
insert/remove tests (executed on RZ/G3S). Boot, ethernet link
insert/remove tests were also executed successfully on RZ/G2L.

Fixes: 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL in gpio_irq_{en,dis}able*(")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- changed the implementation approach by dropping the spinlock in
  rzg2l_gpio_irq_endisable(), renaming it to
  __rzg2l_gpio_irq_endisable() and using it in
  rzg2l_gpio_irq_endisable(), the newly introduced
  __rzg2l_gpio_irq_enable() and rzg2l_gpio_irq_restore()
- convert struct rzg2l_pinctrl::lock to raw_spinlock_t


 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 71 +++++++++++++++----------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f524af6f586f..c360e473488c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -359,7 +359,7 @@ struct rzg2l_pinctrl {
 	spinlock_t			bitmap_lock; /* protect tint_slot bitmap */
 	unsigned int			hwirq[RZG2L_TINT_MAX_INTERRUPT];
 
-	spinlock_t			lock; /* lock read/write registers */
+	raw_spinlock_t			lock; /* lock read/write registers */
 	struct mutex			mutex; /* serialize adding groups and functions */
 
 	struct rzg2l_pinctrl_pin_settings *settings;
@@ -543,7 +543,7 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 	unsigned long flags;
 	u32 reg;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	/* Set pin to 'Non-use (Hi-Z input protection)'  */
 	reg = readw(pctrl->base + PM(off));
@@ -567,7 +567,7 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 
 	pctrl->data->pwpr_pfc_lock_unlock(pctrl, true);
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 };
 
 static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *pctldev,
@@ -882,10 +882,10 @@ static void rzg2l_rmw_pin_config(struct rzg2l_pinctrl *pctrl, u32 offset,
 		addr += 4;
 	}
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	reg = readl(addr) & ~(mask << (bit * 8));
 	writel(reg | (val << (bit * 8)), addr);
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs, u32 caps)
@@ -1121,7 +1121,7 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 	if (bit < 0)
 		return -EINVAL;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	val = readb(pctrl->base + oen_offset);
 	if (oen)
 		val &= ~BIT(bit);
@@ -1134,7 +1134,7 @@ static int rzg2l_write_oen(struct rzg2l_pinctrl *pctrl, unsigned int _pin, u8 oe
 	writeb(val, pctrl->base + oen_offset);
 	if (pctrl->data->hwcfg->oen_pwpr_lock)
 		writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -1687,14 +1687,14 @@ static int rzg2l_gpio_request(struct gpio_chip *chip, unsigned int offset)
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	/* Select GPIO mode in PMC Register */
 	reg8 = readb(pctrl->base + PMC(off));
 	reg8 &= ~BIT(bit);
 	pctrl->data->pmc_writeb(pctrl, reg8, PMC(off));
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -1709,7 +1709,7 @@ static void rzg2l_gpio_set_direction(struct rzg2l_pinctrl *pctrl, u32 offset,
 	unsigned long flags;
 	u16 reg16;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	reg16 = readw(pctrl->base + PM(off));
 	reg16 &= ~(PM_MASK << (bit * 2));
@@ -1717,7 +1717,7 @@ static void rzg2l_gpio_set_direction(struct rzg2l_pinctrl *pctrl, u32 offset,
 	reg16 |= (output ? PM_OUTPUT : PM_INPUT) << (bit * 2);
 	writew(reg16, pctrl->base + PM(off));
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static int rzg2l_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
@@ -1761,7 +1761,7 @@ static int rzg2l_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	unsigned long flags;
 	u8 reg8;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	reg8 = readb(pctrl->base + P(off));
 
@@ -1770,7 +1770,7 @@ static int rzg2l_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	else
 		writeb(reg8 & ~BIT(bit), pctrl->base + P(off));
 
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 	return 0;
 }
@@ -2429,14 +2429,13 @@ static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl
 	return gpioint;
 }
 
-static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
-				     unsigned int hwirq, bool enable)
+static void __rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
+				       unsigned int hwirq, bool enable)
 {
 	const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[hwirq];
 	u64 *pin_data = pin_desc->drv_data;
 	u32 off = RZG2L_PIN_CFG_TO_PORT_OFFSET(*pin_data);
 	u8 bit = RZG2L_PIN_ID_TO_PIN(hwirq);
-	unsigned long flags;
 	void __iomem *addr;
 
 	addr = pctrl->base + ISEL(off);
@@ -2445,12 +2444,20 @@ static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
 		addr += 4;
 	}
 
-	spin_lock_irqsave(&pctrl->lock, flags);
 	if (enable)
 		writel(readl(addr) | BIT(bit * 8), addr);
 	else
 		writel(readl(addr) & ~BIT(bit * 8), addr);
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+}
+
+static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
+				     unsigned int hwirq, bool enable)
+{
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	__rzg2l_gpio_irq_endisable(pctrl, hwirq, enable);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static void rzg2l_gpio_irq_disable(struct irq_data *d)
@@ -2462,15 +2469,25 @@ static void rzg2l_gpio_irq_disable(struct irq_data *d)
 	gpiochip_disable_irq(gc, hwirq);
 }
 
-static void rzg2l_gpio_irq_enable(struct irq_data *d)
+static void __rzg2l_gpio_irq_enable(struct irq_data *d, bool lock)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
 	unsigned int hwirq = irqd_to_hwirq(d);
 
 	gpiochip_enable_irq(gc, hwirq);
+	if (lock)
+		rzg2l_gpio_irq_endisable(pctrl, hwirq, true);
+	else
+		__rzg2l_gpio_irq_endisable(pctrl, hwirq, true);
 	irq_chip_enable_parent(d);
 }
 
+static void rzg2l_gpio_irq_enable(struct irq_data *d)
+{
+	__rzg2l_gpio_irq_enable(d, true);
+}
+
 static int rzg2l_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	return irq_chip_set_type_parent(d, type);
@@ -2616,11 +2633,11 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
 		 * This has to be atomically executed to protect against a concurrent
 		 * interrupt.
 		 */
-		spin_lock_irqsave(&pctrl->lock, flags);
+		raw_spin_lock_irqsave(&pctrl->lock, flags);
 		ret = rzg2l_gpio_irq_set_type(data, irqd_get_trigger_type(data));
 		if (!ret && !irqd_irq_disabled(data))
-			rzg2l_gpio_irq_enable(data);
-		spin_unlock_irqrestore(&pctrl->lock, flags);
+			__rzg2l_gpio_irq_enable(data, false);
+		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
 		if (ret)
 			dev_crit(pctrl->dev, "Failed to set IRQ type for virq=%u\n", virq);
@@ -2950,7 +2967,7 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 				     "failed to enable GPIO clk\n");
 	}
 
-	spin_lock_init(&pctrl->lock);
+	raw_spin_lock_init(&pctrl->lock);
 	spin_lock_init(&pctrl->bitmap_lock);
 	mutex_init(&pctrl->mutex);
 	atomic_set(&pctrl->wakeup_path, 0);
@@ -3093,7 +3110,7 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 	u32 nports = pctrl->data->n_port_pins / RZG2L_PINS_PER_PORT;
 	unsigned long flags;
 
-	spin_lock_irqsave(&pctrl->lock, flags);
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	pctrl->data->pwpr_pfc_lock_unlock(pctrl, false);
 
 	/* Restore port registers. */
@@ -3138,7 +3155,7 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
 	}
 
 	pctrl->data->pwpr_pfc_lock_unlock(pctrl, true);
-	spin_unlock_irqrestore(&pctrl->lock, flags);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
 static int rzg2l_pinctrl_suspend_noirq(struct device *dev)
@@ -3187,14 +3204,14 @@ static int rzg2l_pinctrl_resume_noirq(struct device *dev)
 
 	writeb(cache->qspi, pctrl->base + QSPI);
 	if (pctrl->data->hwcfg->oen_pwpr_lock) {
-		spin_lock_irqsave(&pctrl->lock, flags);
+		raw_spin_lock_irqsave(&pctrl->lock, flags);
 		pwpr = readb(pctrl->base + regs->pwpr);
 		writeb(pwpr | PWPR_REGWE_B, pctrl->base + regs->pwpr);
 	}
 	writeb(cache->oen, pctrl->base + pctrl->data->hwcfg->regs.oen);
 	if (pctrl->data->hwcfg->oen_pwpr_lock) {
 		writeb(pwpr & ~PWPR_REGWE_B, pctrl->base + regs->pwpr);
-		spin_unlock_irqrestore(&pctrl->lock, flags);
+		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 	}
 	for (u8 i = 0; i < 2; i++) {
 		if (regs->sd_ch)
-- 
2.43.0


