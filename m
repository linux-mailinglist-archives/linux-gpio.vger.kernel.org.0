Return-Path: <linux-gpio+bounces-13926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8DA9F3A47
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 20:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 671861646E8
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 19:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7328620CCD8;
	Mon, 16 Dec 2024 19:53:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4DD20765F;
	Mon, 16 Dec 2024 19:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378831; cv=none; b=a2m1KSqAgqf0PfZUnqm0pcw8Lwj03EHNsuRg4Ih7Ga/B8weMTpguaqpj3lLNVn5AnZnkhyKQgEtxtB3/xX+Oc+YuvR1TmFChFgaZmG7a829aOmX5NoxFiKFQHo9WPGubKTRBuFCGdj2JXKGEABoRb/PClDKUkUtcz/HTb20iFAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378831; c=relaxed/simple;
	bh=/d5Hz7MZ25rEoSZPJMN/gZrUxbL4u37m3x35qURLbnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3aZTwkfO4SjPj/FEt2NolNwD4t+kG3MdslFKOEGEtxFbE3n+FQzyVMwwIBUYdekquRFyS8cZyv2NFjp0Xcb6PxCPI1NWru+Vbd5EAjWBr4+Wmg+lvhCQYpnFm55m6Rk2oDO23acK9PBh2CIewGTpT4N3A1kG8TUpxngc4M0tJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ZqEcFmsdRaKRWKfB8RNm4w==
X-CSE-MsgGUID: MO5/WkEbSyu/31u6oc6L4A==
X-IronPort-AV: E=Sophos;i="6.12,239,1728918000"; 
   d="scan'208";a="228014624"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Dec 2024 04:53:48 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8E73840638D0;
	Tue, 17 Dec 2024 04:53:39 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 3/7] pinctrl: renesas: rzg2l: Update r9a09g057_variable_pin_cfg table
Date: Mon, 16 Dec 2024 19:53:13 +0000
Message-ID: <20241216195325.164212-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently r9a09g057_variable_pin_cfg table uses port 11 instead of port PB
as mentioned in the hardware manual. Update the r9a09g057_variable_pin_cfg
table with alpha-numeric port names to match with the hardware manual.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Included header file renesas,r9a09g057-pinctrl.h
 * Updated r9a09g057_variable_pin_cfg table replacing PORT_PB->RZV2H_PB
   macro.
v3:
 * New patch.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 1a7be7d7b520..b5af69af937a 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -26,6 +26,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 
+#include <dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
 #include "../core.h"
@@ -382,12 +383,12 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 }
 
 static const u64 r9a09g057_variable_pin_cfg[] = {
-	RZG2L_VARIABLE_PIN_CFG_PACK(11, 0, RZV2H_MPXED_PIN_FUNCS),
-	RZG2L_VARIABLE_PIN_CFG_PACK(11, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(11, 2, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(11, 3, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(11, 4, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
-	RZG2L_VARIABLE_PIN_CFG_PACK(11, 5, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZV2H_PB, 0, RZV2H_MPXED_PIN_FUNCS),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZV2H_PB, 1, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZV2H_PB, 2, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZV2H_PB, 3, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZV2H_PB, 4, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
+	RZG2L_VARIABLE_PIN_CFG_PACK(RZV2H_PB, 5, RZV2H_MPXED_PIN_FUNCS | PIN_CFG_IEN),
 };
 
 #ifdef CONFIG_RISCV
-- 
2.43.0


