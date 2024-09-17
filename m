Return-Path: <linux-gpio+bounces-10225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B3597B393
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 19:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36A5AB21801
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 17:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C1417C991;
	Tue, 17 Sep 2024 17:33:22 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA63F8248C;
	Tue, 17 Sep 2024 17:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726594402; cv=none; b=m8hRJS9FAYlVvdyoPcIG5gTaT0UglXzjLi/6KO/A6TNhuy5i6ZmXt/yw28fENDI2Rf5d7D6SpayrIo6W0nE675ZrGrM14BVD/YUTPBRfYlvKfoCeHDEmww8vP7CnujGUjkb+3SjGzJkS+Qmiilh15c2nLoTQ5iKwUz2sQads/5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726594402; c=relaxed/simple;
	bh=zn7mr17iND6Qec4B93T1SZ0t0V+QUf+1/BFKuoV2TzE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=argUGOj0vizD4SzAIfpl7Enk42WvsnTVjGZAk1jHlzyNGf/7ub7HfPLBb3tw/gXj7VW2zm45troEigHRxvq/qjcGBNfxKdr6AWC+dw5jAfDOVmFstE89GHv4qFDKkM0YoiatZ2r7PCLi53B2vAWfcEf5STnAlpwFvm9WZ9HY97M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.10,235,1719846000"; 
   d="scan'208";a="222945896"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Sep 2024 02:33:18 +0900
Received: from mulinux.example.org (unknown [10.226.92.130])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0CDBD4011F7F;
	Wed, 18 Sep 2024 02:33:15 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/6] pinctrl: renesas: rzg2l: Remove RZG2L_TINT_IRQ_START_INDEX
Date: Tue, 17 Sep 2024 18:32:45 +0100
Message-Id: <20240917173249.158920-3-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
References: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RZ/V2H(P) has 16 IRQ interrupts, while every other platforms
has 8, and this affects the start index of TINT interrupts
(1 + 16 = 17, rather than 1 + 8 = 9).
Macro RZG2L_TINT_IRQ_START_INDEX cannot work anymore, replace
it with a new member within struct rzg2l_hwcfg.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 5a403915fed2..0aba75dce229 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -168,7 +168,6 @@
 #define RZG2L_PIN_ID_TO_PIN(id)		((id) % RZG2L_PINS_PER_PORT)
 
 #define RZG2L_TINT_MAX_INTERRUPT	32
-#define RZG2L_TINT_IRQ_START_INDEX	9
 #define RZG2L_PACK_HWIRQ(t, i)		(((t) << 16) | (i))
 
 /* Custom pinconf parameters */
@@ -251,6 +250,7 @@ enum rzg2l_iolh_index {
  * @func_base: base number for port function (see register PFC)
  * @oen_max_pin: the maximum pin number supporting output enable
  * @oen_max_port: the maximum port number supporting output enable
+ * @tint_start_index: the start index for the TINT interrupts
  */
 struct rzg2l_hwcfg {
 	const struct rzg2l_register_offsets regs;
@@ -262,6 +262,7 @@ struct rzg2l_hwcfg {
 	u8 func_base;
 	u8 oen_max_pin;
 	u8 oen_max_port;
+	unsigned int tint_start_index;
 };
 
 struct rzg2l_dedicated_configs {
@@ -2379,7 +2380,7 @@ static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
 
 	rzg2l_gpio_irq_endisable(pctrl, child, true);
 	pctrl->hwirq[irq] = child;
-	irq += RZG2L_TINT_IRQ_START_INDEX;
+	irq += pctrl->data->hwcfg->tint_start_index;
 
 	/* All these interrupts are level high in the CPU */
 	*parent_type = IRQ_TYPE_LEVEL_HIGH;
@@ -3035,6 +3036,7 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	},
 	.iolh_groupb_oi = { 100, 66, 50, 33, },
 	.oen_max_pin = 0,
+	.tint_start_index = 9,
 };
 
 static const struct rzg2l_hwcfg rzg3s_hwcfg = {
@@ -3067,12 +3069,14 @@ static const struct rzg2l_hwcfg rzg3s_hwcfg = {
 	.func_base = 1,
 	.oen_max_pin = 1, /* Pin 1 of P0 and P7 is the maximum OEN pin. */
 	.oen_max_port = 7, /* P7_1 is the maximum OEN port. */
+	.tint_start_index = 9,
 };
 
 static const struct rzg2l_hwcfg rzv2h_hwcfg = {
 	.regs = {
 		.pwpr = 0x3c04,
 	},
+	.tint_start_index = 17,
 };
 
 static struct rzg2l_pinctrl_data r9a07g043_data = {
-- 
2.34.1


