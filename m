Return-Path: <linux-gpio+bounces-27418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2536FBFAA39
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 09:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 46A405076A5
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 07:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA082FB61C;
	Wed, 22 Oct 2025 07:41:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0982FB097;
	Wed, 22 Oct 2025 07:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118896; cv=none; b=TugCHdXbvFllf/1PolqCUBeaSjI1IsBg6ZvU++ZFVip/h+361E8CQapFn0S2VCBIWFWs3SPmUEu2rA+LnjyfNCRvI92QoL0cncfbszqLrZh3jx3Pc9mOee+vHRn2bW3odQTwc5bOBizzEuOqGMhLcj0Cf/hgiV9gM79v6XCiO1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118896; c=relaxed/simple;
	bh=QGvghVdZeHNgJp8I5CtrM9Hp+1y1sMOYQhyX0Teuka8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pXTPGaL6Jxw/FE3HdlFC3kaV0gyiDFG7p2JxISHr+NDEcy0itevTaiJmf2GFEPNUkhSLPSr3MI6ToWM2xfyD9ZFfmb444rhPwTx0L7f/AcjVvLGie1s1JQd1F4ssm08n1TWfofAugQUZ8Knt/+2/PMVtE/vpyUH20tqtH1ZlJ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: aIAKL2f4Q7SXye2L9587IA==
X-CSE-MsgGUID: xD7YSYiJTEKIp2qUojD5Mw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Oct 2025 16:41:33 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.88])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3861C4006DED;
	Wed, 22 Oct 2025 16:41:29 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: 
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: remove useless wrappers
Date: Wed, 22 Oct 2025 10:40:58 +0300
Message-ID: <20251022074100.1994447-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rzg2l_gpio_irq_set_type() and rzg2l_gpio_irqc_eoi() only call the
equivalent parent functions, replace their usage with the parent
functions and remove them.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 947bce7bfc0e..f25ecada5c69 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2494,16 +2494,6 @@ static void rzg2l_gpio_irq_enable(struct irq_data *d)
 	__rzg2l_gpio_irq_enable(d, true);
 }
 
-static int rzg2l_gpio_irq_set_type(struct irq_data *d, unsigned int type)
-{
-	return irq_chip_set_type_parent(d, type);
-}
-
-static void rzg2l_gpio_irqc_eoi(struct irq_data *d)
-{
-	irq_chip_eoi_parent(d);
-}
-
 static void rzg2l_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
@@ -2539,8 +2529,8 @@ static const struct irq_chip rzg2l_gpio_irqchip = {
 	.irq_enable = rzg2l_gpio_irq_enable,
 	.irq_mask = irq_chip_mask_parent,
 	.irq_unmask = irq_chip_unmask_parent,
-	.irq_set_type = rzg2l_gpio_irq_set_type,
-	.irq_eoi = rzg2l_gpio_irqc_eoi,
+	.irq_set_type = irq_chip_set_type_parent,
+	.irq_eoi = irq_chip_eoi_parent,
 	.irq_print_chip = rzg2l_gpio_irq_print_chip,
 	.irq_set_affinity = irq_chip_set_affinity_parent,
 	.irq_set_wake = rzg2l_gpio_irq_set_wake,
@@ -2640,7 +2630,7 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
 		 * interrupt.
 		 */
 		raw_spin_lock_irqsave(&pctrl->lock, flags);
-		ret = rzg2l_gpio_irq_set_type(data, irqd_get_trigger_type(data));
+		ret = irq_chip_set_type_parent(data, irqd_get_trigger_type(data));
 		if (!ret && !irqd_irq_disabled(data))
 			__rzg2l_gpio_irq_enable(data, false);
 		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
-- 
2.51.1.dirty


