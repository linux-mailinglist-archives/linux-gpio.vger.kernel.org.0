Return-Path: <linux-gpio+bounces-8676-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD5594C75A
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 01:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFFC9B22612
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2024 23:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5E215FA66;
	Thu,  8 Aug 2024 23:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="FOMp9dCn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3080E13D8A2;
	Thu,  8 Aug 2024 23:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723159663; cv=pass; b=Z0GUS72YZ+dQRH6CF8zvGVIQDGKDDeZIpb9pvakBFusP1/wSDtDSBbuYiSoPnEK/N/baBRNp+Ch+58qFuHXEPpBdEK/qFNq807Zp3jZT7b7ILehhYJsoD1jf2nYDjAeS7HsUbhsOcWr9CV7kzMhZ9yyPp2QaOeuXapQh8goOoTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723159663; c=relaxed/simple;
	bh=Fan+AeqgbP/KN/rKM/Y8yCR1HuR/6XwWRRubUw9eXEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YL5qQ8WiKCyLJvfGw20PtnIvTcjAWjuuaudCa2RxeLh5np+3KN5m/mid6Tss90ipfuR4/ve4cuntcDSaSMFNEV+4h4VCxAZKpBNtSljjS5jeaK+pv6WzSFK8GFKN5WUpEVmN7cwqeJzUH+of5ajRBsq40WGlTx4y6DaaBTUV3qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=FOMp9dCn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723159648; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n5KwzOmKYXYMQBN4FW0HFDpL6KqNWC3quxcOsviWFEgC3T3s2RStDRhLEDwyQpMpSN2rMwWuOk2l+51414qNnjCk4IUjc5SShezs5UgIVfVOseu01kMyFNQP1gBaI6oYEf8qAoPGEu1cJHu17537AxVhkJT+M26NUCtWnkOKX+Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723159648; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VfUT4xTcC3SPu/QyTlrZ88bPNK/AOccXwvQbWbA5nC8=; 
	b=cGFqaa3VhgDL3rxx1Vhy65Eq+/c/TlUdC8KqjsguYpJ7d4puoLFhlr4ydshPwNtjuyCafkDEinB55aeCO1yRA/M/8NbwZxi8EkGsmQDpJM+BRdR+Wbp+ILFfcezvmRIndfYUKYU9y3COS7YhIDEz2/OT3abwTR0AEd6auYpeIfg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723159648;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=VfUT4xTcC3SPu/QyTlrZ88bPNK/AOccXwvQbWbA5nC8=;
	b=FOMp9dCncPDoh7fkLBg9sw3kYawN2Ntq0BiqXPI/qTXi5RoHJ6scj2FUf2zMv6WE
	jj23RrVhWT//SlCQJsXHWkxsapEtJUOIbznlLSd0A27e7yMqxsQMDSII5zd0KME7vZE
	QS/4pZTiz/BKUJNGChx0qy2yL46KiPgrWVW6eR8c=
Received: by mx.zohomail.com with SMTPS id 1723159646349956.1886049601594;
	Thu, 8 Aug 2024 16:27:26 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 08 Aug 2024 19:27:09 -0400
Subject: [PATCH] pinctrl: mediatek: common-v2: Fix broken bias-disable for
 PULL_PU_PD_RSEL_TYPE
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-mtk-rsel-bias-disable-fix-v1-1-1b4e85bf596c@collabora.com>
X-B4-Tracking: v=1; b=H4sIAExUtWYC/x2MSQqAMAwAvyI5G6hLi/gV8dDaqMGVRkQo/t3ic
 QZmIggFJoE2ixDoZuFjT1DkGQyz3SdC9omhVGWtGtXgdi0YhFZ0bAU9i3Ur4cgPeqWNHmqqtHG
 Q+jNQ0v+769/3AxUTspdrAAAA
To: Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External

Despite its name, commit fed74d75277d ("pinctrl: mediatek: common-v2:
Fix bias-disable for PULL_PU_PD_RSEL_TYPE") actually broke bias-disable
for PULL_PU_PD_RSEL_TYPE.

mtk_pinconf_bias_set_combo() tries every bias method supported by the
pin until one succeeds. For PULL_PU_PD_RSEL_TYPE pins, before the
breaking commit, mtk_pinconf_bias_set_rsel() would be called first to
try and set the RSEL value (as well as PU and PD), and if that failed,
the only other valid option was that bias-disable was specified, which
would then be handled by calling mtk_pinconf_bias_set_pu_pd() and
disabling both PU and PD.

The breaking commit misunderstood this logic and added an early "return
0" in mtk_pinconf_bias_set_rsel(). The result was that in the
bias-disable case, the bias was left unchanged, since by returning
success, mtk_pinconf_bias_set_combo() no longer tried calling
mtk_pinconf_bias_set_pu_pd() to disable the bias.

Since the logic for configuring bias-disable on PULL_PU_PD_RSEL_TYPE
pins required mtk_pinconf_bias_set_rsel() to fail first, in that case,
an error was printed to the log, eg:

  mt8195-pinctrl 10005000.pinctrl: Not support rsel value 0 Ohm for pin = 29 (GPIO29)

This is what the breaking commit actually got rid of, and likely part of
the reason why that commit was thought to be fixing functionality, while
in reality it was breaking it.

Instead of simply reverting that commit, restore the functionality but
in a way that avoids the error from being printed and makes the code
less confusing:
* Return 0 explicitly if a bias method was successful
* Introduce an extra function mtk_pinconf_bias_set_pu_pd_rsel() that
  calls both mtk_pinconf_bias_set_rsel() (only if needed) and
  mtk_pinconf_bias_set_pu_pd()
  * And analogously for the corresponding getters

Fixes: fed74d75277d ("pinctrl: mediatek: common-v2: Fix bias-disable for PULL_PU_PD_RSEL_TYPE")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 55 +++++++++++++-----------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index b7921b59eb7b..54301fbba524 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -709,32 +709,35 @@ static int mtk_pinconf_bias_set_rsel(struct mtk_pinctrl *hw,
 {
 	int err, rsel_val;
 
-	if (!pullup && arg == MTK_DISABLE)
-		return 0;
-
 	if (hw->rsel_si_unit) {
 		/* find pin rsel_index from pin_rsel array*/
 		err = mtk_hw_pin_rsel_lookup(hw, desc, pullup, arg, &rsel_val);
 		if (err)
-			goto out;
+			return err;
 	} else {
-		if (arg < MTK_PULL_SET_RSEL_000 ||
-		    arg > MTK_PULL_SET_RSEL_111) {
-			err = -EINVAL;
-			goto out;
-		}
+		if (arg < MTK_PULL_SET_RSEL_000 || arg > MTK_PULL_SET_RSEL_111)
+			return -EINVAL;
 
 		rsel_val = arg - MTK_PULL_SET_RSEL_000;
 	}
 
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_RSEL, rsel_val);
-	if (err)
-		goto out;
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_RSEL, rsel_val);
+}
 
-	err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, MTK_ENABLE);
+static int mtk_pinconf_bias_set_pu_pd_rsel(struct mtk_pinctrl *hw,
+					   const struct mtk_pin_desc *desc,
+					   u32 pullup, u32 arg)
+{
+	u32 enable = arg == MTK_DISABLE ? MTK_DISABLE : MTK_ENABLE;
+	int err;
 
-out:
-	return err;
+	if (arg != MTK_DISABLE) {
+		err = mtk_pinconf_bias_set_rsel(hw, desc, pullup, arg);
+		if (err)
+			return err;
+	}
+
+	return mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, enable);
 }
 
 int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
@@ -750,22 +753,22 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
 		try_all_type = MTK_PULL_TYPE_MASK;
 
 	if (try_all_type & MTK_PULL_RSEL_TYPE) {
-		err = mtk_pinconf_bias_set_rsel(hw, desc, pullup, arg);
+		err = mtk_pinconf_bias_set_pu_pd_rsel(hw, desc, pullup, arg);
 		if (!err)
-			return err;
+			return 0;
 	}
 
 	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
 		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);
 		if (!err)
-			return err;
+			return 0;
 	}
 
 	if (try_all_type & MTK_PULL_PULLSEL_TYPE) {
 		err = mtk_pinconf_bias_set_pullsel_pullen(hw, desc,
 							  pullup, arg);
 		if (!err)
-			return err;
+			return 0;
 	}
 
 	if (try_all_type & MTK_PULL_PUPD_R1R0_TYPE)
@@ -803,9 +806,9 @@ static int mtk_rsel_get_si_unit(struct mtk_pinctrl *hw,
 	return 0;
 }
 
-static int mtk_pinconf_bias_get_rsel(struct mtk_pinctrl *hw,
-				     const struct mtk_pin_desc *desc,
-				     u32 *pullup, u32 *enable)
+static int mtk_pinconf_bias_get_pu_pd_rsel(struct mtk_pinctrl *hw,
+					   const struct mtk_pin_desc *desc,
+					   u32 *pullup, u32 *enable)
 {
 	int pu, pd, rsel, err;
 
@@ -939,22 +942,22 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 		try_all_type = MTK_PULL_TYPE_MASK;
 
 	if (try_all_type & MTK_PULL_RSEL_TYPE) {
-		err = mtk_pinconf_bias_get_rsel(hw, desc, pullup, enable);
+		err = mtk_pinconf_bias_get_pu_pd_rsel(hw, desc, pullup, enable);
 		if (!err)
-			return err;
+			return 0;
 	}
 
 	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
 		err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
 		if (!err)
-			return err;
+			return 0;
 	}
 
 	if (try_all_type & MTK_PULL_PULLSEL_TYPE) {
 		err = mtk_pinconf_bias_get_pullsel_pullen(hw, desc,
 							  pullup, enable);
 		if (!err)
-			return err;
+			return 0;
 	}
 
 	if (try_all_type & MTK_PULL_PUPD_R1R0_TYPE)

---
base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
change-id: 20240808-mtk-rsel-bias-disable-fix-d0565c4e356b

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


