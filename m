Return-Path: <linux-gpio+bounces-6766-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1268D2533
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 21:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56C6B1F29D6B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C3317DE0F;
	Tue, 28 May 2024 19:50:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4254D17BB24
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 19:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925811; cv=none; b=pC+JNPCKmPQwBatU8RQ22SxjCLVPuoU87gKmpWWCBYdayoliko2GNmXTEOtvE79JWMhPdaA4szgnsrrcgcuC7EjC4ryTkjwgifpZGxMpVAUnbskmvpLb7+zYMlC3ex65WWr0OlGmaE3hbGgeoagNwYoUI3dW1H+C0aKL77Ex/PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925811; c=relaxed/simple;
	bh=FrmTkfRDuYE6W4f7/PX+9pEDuWfj94rVrXbxlYtzyFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aa1pPqTfTqrDrrGJMduYUEe5NaIuIjRpH0LEqlzHIttnkdvnBfWJgVeqo2jgqJ10AjHDjaVwmsQ4N5g8fKSH9HZqVJkHYHnBJTldbRck7e7NB6sQLhtyP2AevpvUxe1wLwfIXTNiBMF0WeErzA+31rNx+9W0apMkX2xCDBv9VBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 7afd847c-1d2b-11ef-aaf5-005056bdd08f;
	Tue, 28 May 2024 22:50:05 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 10/11] pinctrl: mediatek: Convert to use func member
Date: Tue, 28 May 2024 22:45:01 +0300
Message-ID: <20240528194951.1489887-11-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert drivers to use func member embedded in struct function_desc,
because other members will be removed to avoid duplication and
desynchronisation of the generic pin function description.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c | 10 +++++-----
 drivers/pinctrl/mediatek/pinctrl-moore.h |  4 +---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index d972584c0519..aad4891223d3 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -56,7 +56,7 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	dev_dbg(pctldev->dev, "enable function %s group %s\n",
-		func->name, grp->grp.name);
+		func->func.name, grp->grp.name);
 
 	for (i = 0; i < grp->grp.npins; i++) {
 		const struct mtk_pin_desc *desc;
@@ -620,12 +620,12 @@ static int mtk_build_functions(struct mtk_pinctrl *hw)
 	int i, err;
 
 	for (i = 0; i < hw->soc->nfuncs ; i++) {
-		const struct function_desc *func = hw->soc->funcs + i;
+		const struct function_desc *function = hw->soc->funcs + i;
+		const struct pinfunction *func = &function->func;
 
 		err = pinmux_generic_add_function(hw->pctrl, func->name,
-						  func->group_names,
-						  func->num_group_names,
-						  func->data);
+						  func->groups, func->ngroups,
+						  function->data);
 		if (err < 0) {
 			dev_err(hw->dev, "Failed to register function %s\n",
 				func->name);
diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.h b/drivers/pinctrl/mediatek/pinctrl-moore.h
index 5945e4fe021f..229d19561e22 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.h
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.h
@@ -45,9 +45,7 @@
 
 #define PINCTRL_PIN_FUNCTION(_name_, id)							\
 	{											\
-		.name = _name_,									\
-		.group_names = id##_groups,							\
-		.num_group_names = ARRAY_SIZE(id##_groups),					\
+		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
 		.data = NULL,									\
 	}
 
-- 
2.45.1


