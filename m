Return-Path: <linux-gpio+bounces-29714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F20CC89B6
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 16:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B7F63015966
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Dec 2025 15:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4F838E15F;
	Wed, 17 Dec 2025 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWH2eSHE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434BC38E158
	for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765985490; cv=none; b=PAbk7cbjSNRdSazxCvgsqSLjt3AghVJ18gOjpRQj/rGfGyXB7IIf+8hwFzO0/pqqXrgZ4RVXwZ54EDVbm+WEEwNsDGSbefrQ/2lnA3VIZC0a1TtqWBUTpTchCDwRktyyrOlGUAtGbL+keoYLqOkgAZlN40Ater/Ob0pk9hHCyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765985490; c=relaxed/simple;
	bh=CMtwWAi2fkoiRarX+6iA9N44M+zhbMk+AqcIvLqsXys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iFfo4Augl99xAjagB5h3tP8cZrKNsc/HEd0k0CXkWP2o4eqSaIlBWZUpv27rboAddjHsvUMTTEWfbDbHOlLQXVbs8eVKXxGOpluVmR+FbJ14fsr3KlNo13EznGBUCcyj8N2GD0Oe2KrGyzykh2MhJPj8DSKBf8aS3iW9Top5Wbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWH2eSHE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso36794355e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Dec 2025 07:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765985486; x=1766590286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHDQGyujZInuJroxva8Z/Ny8BLqAj/X/TbF4qXI6JtQ=;
        b=GWH2eSHE296c+HgUJ2zRU7hX1S+QB36mwrJAC9JOL18UCD1XDr7Q0x/04pLD0+pCIF
         400CWeBfLVNCF4syCA+kFwBKM6MwcAorLRNtyDQW1ZTSS6Km/zqhoqhajHcBLPDkHvLb
         +l3O6UPkDEJsW831Ytty243bt383bGUr70jaykYgKPvdV3nAxHsYtpwhuSF0o1GFRyRe
         T58Paa+kmmucX/0qOh26m3jFDCTxr1KAYGgeU+9gJdPOETSgDZjl/RMD0Fusgow2dGba
         8pu/8b1GMlrAG0Qg25FS3I73T2hHi+CIzWnTU2jaZxjkt2phT0YfFIxHCy5iuio5YUFe
         dEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765985486; x=1766590286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHDQGyujZInuJroxva8Z/Ny8BLqAj/X/TbF4qXI6JtQ=;
        b=L175ry/sqo2doq7VEcxiIyNb/YEklFo5nRBYK3GzusARwFlsjwGjqSe7xkf3iQ0Hcl
         Tp0uVS9/BGlr3e/TCofUVJLmgniz26e9GweGjRQB1HB2//9sL4a4KgzB+LB/BSWtn9Ne
         Skx3up47Q8DlMBALItX6en1DBWhkQGN/3k56n7OVct3MSZrFdBQ593q8bZOjW5BcEAKH
         j+oqwl2boaLV3lyugMAmBS079Dk8uDZL+7Nnh/o/JZ5QVRSdEOBqr/YRTBSyIDFvsNRN
         ofsrXXSytgADVgo3U83+OcpVHE8v3dTnAaA82YQawlRfl4EXq8y/2SntghYmp5rM+si8
         lYPA==
X-Forwarded-Encrypted: i=1; AJvYcCW2pgFsd9POjftSBcF2UagsLBAoJAg3YFd89vXEgcOcljm3nLVFDYLiCV4qXBvksaq9R7ko6VTM3ECt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywka6VlZnC/lDPceeq6KNTffiDaLfamqPfX6jgGyNL0q352i0nv
	+taE/esG4i/4hfYhsjaXJusKDq+vOkdXKMXhQNtBu2R10ykpoxbbtHg8
X-Gm-Gg: AY/fxX70UJLSltBivhdvTuhGfDCKCGHOdUjqZIw8HYpch8QMffRjxOhe00EpyS/ZjPu
	Lka0om9UJCu7mZ+H9YNLTjsPPRG9B5rdRVw9fSEB6bYZE4+By4lonKiLrmMy3yc1+8HkGJtn5bZ
	gD1V1loPmrmQ221795OPhEMCZBi8r9pGOKP2oMo7/JStoQg/xMNCbNhnaQE4ZfP73mLKOTfrtTX
	NZO1DJugk5v6ITWXeKRNp7k1OjQSbrsvopBJMOqWihzYJDPuNX55ncxYX8VVFSj9v5dPUhX9pdb
	44P7VFtKYyXWLDrOr0ZHOYt7f/zQj8jTEjIDyhcoh+jSslOHQz7xiA9NzMWt3R42DLH2xYMUZ1O
	w1nd1vgCEuHrZtLe8cFiVkF4DFSoxzf+h0eRsS6CE1fDTDehb3DNOlpBswhkOaQJ/iY+iSy84PB
	kuWXvPkBx4+xZCkvPUcFzjSYkjVmryWHqralyUoywE+9imyhsnrKtH7WeOdMUg9nxjbn0ODns0o
	0iYczsA7435XEapCyjhc7U=
X-Google-Smtp-Source: AGHT+IEb5ar6TM/WR/l3CSudJ9bJ/KvuD26w9G8hDOQq44+5wMBJg8tkAOMbmfbWPSiXDyoVpP+ylA==
X-Received: by 2002:a05:600c:6994:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-47a8f904080mr173746195e9.17.1765985486324;
        Wed, 17 Dec 2025 07:31:26 -0800 (PST)
Received: from ernest.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1cb6b3sm43272875e9.3.2025.12.17.07.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:31:25 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	lakabd <lakabd.work@gmail.com>,
	Yong Li <yong.b.li@intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] gpio: pca953x: handle short interrupt pulses on PCAL devices
Date: Wed, 17 Dec 2025 16:30:25 +0100
Message-ID: <20251217153050.142057-1-ernestvanhoecke@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

GPIO drivers with latch input support may miss short pulses on input
pins even when input latching is enabled. The generic interrupt logic in
the pca953x driver reports interrupts by comparing the current input
value against the previously sampled one and only signals an event when
a level change is observed between two reads.

For short pulses, the first edge is captured when the input register is
read, but if the signal returns to its previous level before the read,
the second edge is not observed. As a result, successive pulses can
produce identical input values at read time and no level change is
detected, causing interrupts to be missed. Below timing diagram shows
this situation where the top signal is the input pin level and the
bottom signal indicates the latched value.

─────┐     ┌──*───────────────┐     ┌──*─────────────────┐     ┌──*───
     │     │  .               │     │  .                 │     │  .
     │     │  │               │     │  │                 │     │  │
     └──*──┘  │               └──*──┘  │                 └──*──┘  │
Input   │     │                  │     │                    │     │
        ▼     │                  ▼     │                    ▼     │
       IRQ    │                 IRQ    │                   IRQ    │
              .                        .                          .
─────┐        .┌──────────────┐        .┌────────────────┐        .┌──
     │         │              │         │                │         │
     │         │              │         │                │         │
     └────────*┘              └────────*┘                └────────*┘
Latched       │                        │                          │
              ▼                        ▼                          ▼
            READ 0                   READ 0                     READ 0
                                   NO CHANGE                  NO CHANGE

PCAL variants provide an interrupt status register that records which
pins triggered an interrupt, but the status and input registers cannot
be read atomically. The interrupt status is only cleared when the input
port is read, and the input value must also be read to determine the
triggering edge. If another interrupt occurs on a different line after
the status register has been read but before the input register is
sampled, that event will not be reflected in the earlier status
snapshot, so relying solely on the interrupt status register is also
insufficient.

Support for input latching and interrupt status handling was previously
added by [1], but the interrupt status-based logic was reverted by [2]
due to these issues. This patch addresses the original problem by
combining both sources of information. Events indicated by the interrupt
status register are merged with events detected through the existing
level-change logic. As a result:

* short pulses, whose second edges are invisible, are detected via the
  interrupt status register, and
* interrupts that occur between the status and input reads are still
  caught by the generic level-change logic.

This significantly improves robustness on devices that signal interrupts
as short pulses, while avoiding the issues that led to the earlier
reversion. In practice, even if only the first edge of a pulse is
observable, the interrupt is reliably detected.

This fixes missed interrupts from an Ilitek touch controller with its
interrupt line connected to a PCAL6416A, where active-low pulses are
approximately 200 us long.

[1] commit 44896beae605 ("gpio: pca953x: add PCAL9535 interrupt support for Galileo Gen2")
[2] commit d6179f6c6204 ("gpio: pca953x: Improve interrupt support")

Fixes: d6179f6c6204 ("gpio: pca953x: Improve interrupt support")
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/gpio/gpio-pca953x.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 0a3916cc2772..8727ae54bc57 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -943,14 +943,35 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	DECLARE_BITMAP(old_stat, MAX_LINE);
 	DECLARE_BITMAP(cur_stat, MAX_LINE);
 	DECLARE_BITMAP(new_stat, MAX_LINE);
+	DECLARE_BITMAP(int_stat, MAX_LINE);
 	DECLARE_BITMAP(trigger, MAX_LINE);
 	DECLARE_BITMAP(edges, MAX_LINE);
 	int ret;
 
+	if (chip->driver_data & PCA_PCAL) {
+		/* Read INT_STAT before it is cleared by the input-port read. */
+		ret = pca953x_read_regs(chip, PCAL953X_INT_STAT, int_stat);
+		if (ret)
+			return false;
+	}
+
 	ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
 	if (ret)
 		return false;
 
+	if (chip->driver_data & PCA_PCAL) {
+		/* Detect short pulses via INT_STAT. */
+		bitmap_and(trigger, int_stat, chip->irq_mask, gc->ngpio);
+
+		/* Apply filter for rising/falling edge selection. */
+		bitmap_replace(new_stat, chip->irq_trig_fall, chip->irq_trig_raise,
+			       cur_stat, gc->ngpio);
+
+		bitmap_and(int_stat, new_stat, trigger, gc->ngpio);
+	} else {
+		bitmap_zero(int_stat, gc->ngpio);
+	}
+
 	/* Remove output pins from the equation */
 	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
 
@@ -964,7 +985,8 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 
 	if (bitmap_empty(chip->irq_trig_level_high, gc->ngpio) &&
 	    bitmap_empty(chip->irq_trig_level_low, gc->ngpio)) {
-		if (bitmap_empty(trigger, gc->ngpio))
+		if (bitmap_empty(trigger, gc->ngpio) &&
+		    bitmap_empty(int_stat, gc->ngpio))
 			return false;
 	}
 
@@ -972,6 +994,7 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pendin
 	bitmap_and(old_stat, chip->irq_trig_raise, new_stat, gc->ngpio);
 	bitmap_or(edges, old_stat, cur_stat, gc->ngpio);
 	bitmap_and(pending, edges, trigger, gc->ngpio);
+	bitmap_or(pending, pending, int_stat, gc->ngpio);
 
 	bitmap_and(cur_stat, new_stat, chip->irq_trig_level_high, gc->ngpio);
 	bitmap_and(cur_stat, cur_stat, chip->irq_mask, gc->ngpio);
-- 
2.43.0


