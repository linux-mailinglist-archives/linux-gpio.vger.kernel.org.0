Return-Path: <linux-gpio+bounces-26789-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EADBB71A5
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 16:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A0FA84ECBE9
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 14:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8721EF091;
	Fri,  3 Oct 2025 14:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Jqn+Dkpm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C71B6D06;
	Fri,  3 Oct 2025 14:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759500089; cv=none; b=o0PaI12hORDnqzCM6uUW8IBAaKt7KD+GelpjHQ2VqfLp2l+l0uxLN3E6tPwhtAk2DTBOz4rBXAlW59Raszr5IWdBozIwkvjRXMgfvV2LCLzdOVRJhWoCywf7UXKoX8tj9TH0lO3oTkD2mF5IeRBZNn0vef/Ed/nmpKEIXDyzgeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759500089; c=relaxed/simple;
	bh=cPM9JXOFF7ibYCync3LVv1ejPvu2H2nbyMWY+uEM8fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AkUk279336O5weKDeEERtSGygG4eWU5dMGUZyK3GkRbhzCPD/I+EqpA6goJGzJkCkKNm0Ao2Ds5NwNNJ3wptTSDRvllE+BcDuHzaW9iDGYt6aPTTnl8YXHULG9piURnILZ8n17D+Nis87BAl7+QmrpRRE5A67W8OlitnXR+AGY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Jqn+Dkpm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759500085;
	bh=cPM9JXOFF7ibYCync3LVv1ejPvu2H2nbyMWY+uEM8fU=;
	h=From:Date:Subject:To:Cc:From;
	b=Jqn+Dkpm/6ZZ4hoK26JhVgFO+BgPcu2yKhvOdOLJ9s4p64cRHMjPyg067uVA4p2xP
	 YC216rYbMMlz2URqwyzEmfm2aSBkto2O8EuwaxFa2xjJDul5gkc9ABYFguXOMPdaNE
	 bMMsu4RWd+HpC99KBXa1+w6oEBaaP4YlC9suVWD6C1swgsFKU4EW9rfyHBRs4Ts0tB
	 Nb0afsfdenqo6Ld2bNsVWB4QIMZouhkcgOLtKa2Ve8mGrH7hemRcCEz2xVfbv0ikVz
	 U9U2TcbUayoEgpSQDKZ1Zdex9BrgoZqiCQLpwU3zSFdxsMZ/SRwINS2ekvj8l0IMxl
	 1y83eqj3Rb17Q==
Received: from yukiji.home (lfbn-idf1-1-2269-27.w92-151.abo.wanadoo.fr [92.151.67.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A6AF17E00AC;
	Fri,  3 Oct 2025 16:01:24 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 03 Oct 2025 16:00:28 +0200
Subject: [PATCH] pinctrl: mediatek: mt8196: align register base names to
 dt-bindings ones
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-fix-mt8196-pinctrl-regnames-v1-1-4d22031140f0@collabora.com>
X-B4-Tracking: v=1; b=H4sIAPvW32gC/zWNywrCMBBFfyXM2oE8sNb+inQR07EOmLROUimU/
 rvB4vJcLudskEmYMnRqA6EPZ55SBXNSEJ4+jYQ8VAar7dlo7fDBK8bSmmuDM6dQ5IVCY/KRMjZ
 6cLq9uOCtg2qYher9Z7/1Bwu9lxopxwh3nwnDFCOXTiVaC/5D0O/7F5BslyeeAAAA
X-Change-ID: 20251003-fix-mt8196-pinctrl-regnames-60d30873ca23
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Cathy Xu <ot_cathy.xu@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759500084; l=1688;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=cPM9JXOFF7ibYCync3LVv1ejPvu2H2nbyMWY+uEM8fU=;
 b=JXCauQA7P83lu0MWupp+csOkf8/00iSvFsB4NG3QcNCOYDGebAwMM4pGIw8azXZaBdIdsbgz4
 6zaoOSPcvTtATRzWZCKGcIjBG96I2R03fKa4898kgQb6oyAQafqHvD7
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

The mt8196-pinctrl driver requires to probe that a device tree uses
in the device node the same names than mt8196_pinctrl_register_base_names
array. But they are not matching the required ones in the
"mediatek,mt8196-pinctrl" dt-bindings, leading to possible dtbs check
issues.
So, align all mt8196_pinctrl_register_base_names entries on dt-bindings
ones.

Fixes: f7a29377c253 ("pinctrl: mediatek: Add pinctrl driver on mt8196")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8196.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8196.c b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
index 82a73929c7a0fc0fb841b5fe313d905c8478044a..dec957c1724b014522a70ed38057e162fe9e25af 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8196.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
@@ -1801,10 +1801,8 @@ static const struct mtk_pin_reg_calc mt8196_reg_cals[PINCTRL_PIN_REG_MAX] = {
 };
 
 static const char * const mt8196_pinctrl_register_base_names[] = {
-	"iocfg0", "iocfg_rt", "iocfg_rm1", "iocfg_rm2",
-	"iocfg_rb", "iocfg_bm1", "iocfg_bm2", "iocfg_bm3",
-	"iocfg_lt", "iocfg_lm1", "iocfg_lm2", "iocfg_lb1",
-	"iocfg_lb2", "iocfg_tm1", "iocfg_tm2", "iocfg_tm3",
+	"base", "rt", "rm1", "rm2", "rb", "bm1", "bm2", "bm3",
+	"lt", "lm1", "lm2", "lb1", "lb2", "tm1", "tm2", "tm3",
 };
 
 static const struct mtk_eint_hw mt8196_eint_hw = {

---
base-commit: 4a7bcf9e0158d9976525370ff84401a1e955bbee
change-id: 20251003-fix-mt8196-pinctrl-regnames-60d30873ca23

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


