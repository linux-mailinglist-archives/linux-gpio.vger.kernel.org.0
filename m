Return-Path: <linux-gpio+bounces-26427-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7938B8D9BC
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 13:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8237E179DFA
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 11:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3824125A35E;
	Sun, 21 Sep 2025 11:16:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E6D258EFE;
	Sun, 21 Sep 2025 11:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758453377; cv=none; b=YAlyCEtNSWEcLmorMxlv+zkJ/0fTsuQQ//zbQvXIZx670Px6tHVg5N0CoE01Y+70UoyZ6e/t8vInJNbfWS9o56vXW+dQGcLvYfABS8eQCsUJxqLOrBpZ4CHUcTSpE+v21fhliblF0qIBpqCh/vbucpRTnbtbOM+4OGY15SIkykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758453377; c=relaxed/simple;
	bh=c2740yO6MxvuEoukGw7+8iCx/7udjcL82xtrNvHYSBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOwhVFVZJGICQkNscMf0yqUQulHO43bBD3Ci5mlFxJU4zTLQYqcqNBxgWYCfRIspX6SkVBXQ6nWzWgK+rn/WyXmar88SBL8EY96yvwCA19QiU0gFi4YLVDLfX796JUtye+6uyBW0o0yf7R9WTY6TXGcYih1IFxB+KILDD1TpQW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: p0wUvB6/T9SnL7fQ134y0w==
X-CSE-MsgGUID: aOV0G3D1S5eewrwx4zEqpA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Sep 2025 20:16:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.3])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1834540061AE;
	Sun, 21 Sep 2025 20:16:02 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 1/2] pinctrl: renesas: rzg2l: Fix PMC restore
Date: Sun, 21 Sep 2025 12:15:52 +0100
Message-ID: <20250921111557.103069-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921111557.103069-1-biju.das.jz@bp.renesas.com>
References: <20250921111557.103069-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMC restore needs unlocking the register using PWPR register.

Fixes: 14c32dc1f63d ("pinctrl: renesas: rzg2l: Add function pointer for PFC register locking")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index f524af6f586f..94cb77949f59 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2993,7 +2993,11 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 		 * Now cache the registers or set them in the order suggested by
 		 * HW manual (section "Operation for GPIO Function").
 		 */
-		RZG2L_PCTRL_REG_ACCESS8(suspend, pctrl->base + PMC(off), cache->pmc[port]);
+		if (suspend)
+			RZG2L_PCTRL_REG_ACCESS8(suspend, pctrl->base + PMC(off), cache->pmc[port]);
+		else
+			pctrl->data->pmc_writeb(pctrl, cache->pmc[port], PMC(off));
+
 		if (has_iolh) {
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + IOLH(off),
 						 cache->iolh[0][port]);
-- 
2.43.0


