Return-Path: <linux-gpio+bounces-10774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A648198EADA
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 09:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C638B2360C
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Oct 2024 07:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EDC126BFC;
	Thu,  3 Oct 2024 07:54:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E90F53363;
	Thu,  3 Oct 2024 07:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727942046; cv=none; b=lEUl1QAMSBxi6PneAjL5w/NehPI/s2M2RbBV0feiqdDa2wSYjryEeGTcm4xUANZmk3fQ6e/SZt0a7bhJ9k1XcTD4+rPsJk58w+QeFNouGHa0L/AuKreac4ym3CJwWYGyRpRktbsO0qhTLo3IJyj7Mn915NzhLjQE57tPildLjPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727942046; c=relaxed/simple;
	bh=H6VQY9Pn72NUJVxUOPqR3lmynbUA1CBzBg+zyA1xKxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhQP86PyPy+KiVMhagcW+PVsX0ILeXg+KeRwfmjI0g8bD+djYnqvM6BIlZc1Di1eD/HJkvAqq5c9MfKtxItV/ovX/+F1WCnwkbwtS1i419ls8s44SbiQNRh+2GGQoxX0HRF1OQoylkLUliY78IZ6Gwwf3AVTXD0wHnikPkrpBgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,173,1725289200"; 
   d="scan'208";a="224648449"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Oct 2024 16:53:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.119])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5FC74400C738;
	Thu,  3 Oct 2024 16:53:45 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	"nobuhiro1 . iwamatsu @ toshiba . co . jp" <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH] pinctrl: renesas: rzg2l: Fix missing return statement
Date: Thu,  3 Oct 2024 08:53:39 +0100
Message-ID: <20241003075342.17244-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the missing return statement on the error path for
rzg2l_pinctrl_register().

Fixes: f73f63b24491 ("pinctrl: renesas: rzg2l: Use dev_err_probe()")
Reported-by: nobuhiro1.iwamatsu@toshiba.co.jp <nobuhiro1.iwamatsu@toshiba.co.jp>
Closes: https://lore.kernel.org/all/OS0PR01MB638837327E5487B71D88A70392712@OS0PR01MB6388.jpnprd01.prod.outlook.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 5a403915fed2..f913e8385ead 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -2710,7 +2710,7 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
 
 	ret = pinctrl_enable(pctrl->pctl);
 	if (ret)
-		dev_err_probe(pctrl->dev, ret, "pinctrl enable failed\n");
+		return	dev_err_probe(pctrl->dev, ret, "pinctrl enable failed\n");
 
 	ret = rzg2l_gpio_register(pctrl);
 	if (ret)
-- 
2.43.0


