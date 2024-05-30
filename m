Return-Path: <linux-gpio+bounces-6914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 673EC8D47CE
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 11:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7EBBB250CA
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 09:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B596317C7B3;
	Thu, 30 May 2024 08:58:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FAE176AC7
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 08:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059490; cv=none; b=u56A5/oYAWOD6SeNXWBM9mgKm161r1KOaxgF2JPZhlZbl6vI5bULJfot14xq+o562Dxc06MZQa3ZLk/Ys5IBheTqUSki9QhrRrcXRSR93Zh5vtQ1bSjzzCpC8ygqnRdF+SHdsyZ2dZetQqC9bavt8wZ9mbpxp/ILG9iHgKaMS8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059490; c=relaxed/simple;
	bh=UUNlZAPD7ufWrtpQqrGWyMeB5Qmh9EtgLPVDRPhTSwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFS5aZdCcMw2P9ry/XaDKeExdRPgtTDYVCLxZ1Q1nETTBTotxTULq5Hw+r8XeDbewcgW6fUA4ZahGCDQmZid6uVWSoKFM6iRW7qSFYaS4s/QamOyuI9NH1+chcdKEaGv8i4iz6oWNQbJne9kH7QqmurAsrayc+i8MNZgDsZIJUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id bac30c71-1e62-11ef-8e2e-005056bdf889;
	Thu, 30 May 2024 11:58:06 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 02/11] pinctrl: equilibrium: Make use of struct pinfunction
Date: Thu, 30 May 2024 11:55:11 +0300
Message-ID: <20240530085745.1539925-3-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
References: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Since pin control provides a generic data type for the pin function,
use it in the driver.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 24 +++++++++++++-----------
 drivers/pinctrl/pinctrl-equilibrium.h | 12 ------------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 6e1be38865c3..a6d089eaaae5 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -566,8 +566,8 @@ static const struct pinconf_ops eqbr_pinconf_ops = {
 	.pin_config_config_dbg_show	= pinconf_generic_dump_config,
 };
 
-static bool is_func_exist(struct eqbr_pmx_func *funcs, const char *name,
-			 unsigned int nr_funcs, unsigned int *idx)
+static bool is_func_exist(struct pinfunction *funcs, const char *name,
+			  unsigned int nr_funcs, unsigned int *idx)
 {
 	int i;
 
@@ -584,13 +584,14 @@ static bool is_func_exist(struct eqbr_pmx_func *funcs, const char *name,
 	return false;
 }
 
-static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
+static int funcs_utils(struct device *dev, struct pinfunction *funcs,
 		       unsigned int *nr_funcs, funcs_util_ops op)
 {
 	struct device_node *node = dev->of_node;
 	struct device_node *np;
 	struct property *prop;
 	const char *fn_name;
+	const char **groups;
 	unsigned int fid;
 	int i, j;
 
@@ -620,15 +621,16 @@ static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
 
 		case OP_COUNT_NR_FUNC_GRPS:
 			if (is_func_exist(funcs, fn_name, *nr_funcs, &fid))
-				funcs[fid].nr_groups++;
+				funcs[fid].ngroups++;
 			break;
 
 		case OP_ADD_FUNC_GRPS:
 			if (is_func_exist(funcs, fn_name, *nr_funcs, &fid)) {
-				for (j = 0; j < funcs[fid].nr_groups; j++)
-					if (!funcs[fid].groups[j])
+				groups = (const char **)funcs[fid].groups;
+				for (j = 0; j < funcs[fid].ngroups; j++)
+					if (!groups[j])
 						break;
-				funcs[fid].groups[j] = prop->value;
+				groups[j] = prop->value;
 			}
 			break;
 
@@ -645,7 +647,7 @@ static int funcs_utils(struct device *dev, struct eqbr_pmx_func *funcs,
 static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 {
 	struct device *dev = drvdata->dev;
-	struct eqbr_pmx_func *funcs = NULL;
+	struct pinfunction *funcs = NULL;
 	unsigned int nr_funcs = 0;
 	int i, ret;
 
@@ -666,9 +668,9 @@ static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 		return ret;
 
 	for (i = 0; i < nr_funcs; i++) {
-		if (!funcs[i].nr_groups)
+		if (!funcs[i].ngroups)
 			continue;
-		funcs[i].groups = devm_kcalloc(dev, funcs[i].nr_groups,
+		funcs[i].groups = devm_kcalloc(dev, funcs[i].ngroups,
 					       sizeof(*(funcs[i].groups)),
 					       GFP_KERNEL);
 		if (!funcs[i].groups)
@@ -688,7 +690,7 @@ static int eqbr_build_functions(struct eqbr_pinctrl_drv_data *drvdata)
 		ret = pinmux_generic_add_function(drvdata->pctl_dev,
 						  funcs[i].name,
 						  funcs[i].groups,
-						  funcs[i].nr_groups,
+						  funcs[i].ngroups,
 						  drvdata);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register function %s\n",
diff --git a/drivers/pinctrl/pinctrl-equilibrium.h b/drivers/pinctrl/pinctrl-equilibrium.h
index 83768cc8b3db..b4d149bde39d 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.h
+++ b/drivers/pinctrl/pinctrl-equilibrium.h
@@ -67,18 +67,6 @@ struct gpio_irq_type {
 	unsigned int logic_type;
 };
 
-/**
- * struct eqbr_pmx_func: represent a pin function.
- * @name: name of the pin function, used to lookup the function.
- * @groups: one or more names of pin groups that provide this function.
- * @nr_groups: number of groups included in @groups.
- */
-struct eqbr_pmx_func {
-	const char		*name;
-	const char		**groups;
-	unsigned int		nr_groups;
-};
-
 /**
  * struct eqbr_pin_bank: represent a pin bank.
  * @membase: base address of the pin bank register.
-- 
2.45.1


