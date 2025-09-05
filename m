Return-Path: <linux-gpio+bounces-25668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C86B4547D
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 12:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86C94A02AF5
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663D72C0291;
	Fri,  5 Sep 2025 10:23:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3432A10A1E;
	Fri,  5 Sep 2025 10:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757067794; cv=none; b=vDVb/JWzD5pwwPRjmDU3nbHangTZmsYF3nuqwNL7ahg0NygnnFBbXJ472AFPih68ZDb+QmyvWe3rFCHKmrZTKqB8rvOn3iE+FGlktd+S9594AxSjBKdCBFLlDUs5rtgv/VdOKdSiZKGMJcarx2xYjvijaaduYYr1bfmdvV0VrtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757067794; c=relaxed/simple;
	bh=xNZaVpJ9uDU1mIxr8SBy/zb2WUGdg8/7mT+aTyDhZHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2KdytI1qO1sl6eCQbq2cS2hAp5Uj/iJVvXh+Cjm0k43nqBX4jSHC4ac8ktUea0rp9MXV8jwx5AZeRqFoQqWQqEg1EQhUaOZMusxTQbG4R3zTkjwKE+VMgRi4byQDi/qkZfhg+gT1DC1O/kIhhBYu/iS24u19wwqn0NCLZB9s3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C75C4CEF1;
	Fri,  5 Sep 2025 10:23:12 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: rzg2l: Fix PFC_SMT_mn register offset
Date: Fri,  5 Sep 2025 12:23:08 +0200
Message-ID: <6f71998cd83730f77e0ddeea4b822aa4f8b833e7.1757067771.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the RZ/V2H (Rev.1.01) and RZ/G3E (Rev.1.10) documentation,
the Schmitt Control Registers are located at offset 0x3500.

Fixes: 725933a54f718af5 ("pinctrl: renesas: rzg2l: Add support for configuring schmitt-trigger")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware.
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 79c7792c2f549dab..52a61901aef0f191 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -142,7 +142,7 @@
 #define PUPD(off)		(0x1C00 + (off) * 8)
 #define ISEL(off)		(0x2C00 + (off) * 8)
 #define NOD(off)		(0x3000 + (off) * 8)
-#define SMT(off)		(0x3400 + (off) * 8)
+#define SMT(off)		(0x3500 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 #define QSPI			(0x3008)
-- 
2.43.0


