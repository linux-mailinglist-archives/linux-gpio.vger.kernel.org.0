Return-Path: <linux-gpio+bounces-6758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C567F8D251C
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 21:50:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77C20283E24
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6617B17839A;
	Tue, 28 May 2024 19:50:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3137177982
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 19:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925800; cv=none; b=P1KQxmnJK3M40njkhDxJpXtdvSi9L1CDy+PBYYZN28xQRngg7LG1ReRPidjDLwGS/eYJ8gyoZlEW2mF+d/S/0hytlxRvRYtsCnU5k+3JYepUXxY644JCzlZ4wyMmxahFWw1fUjfRWg13MrEREq17Rq+9fbyGJDQ8LRZqCI5pulY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925800; c=relaxed/simple;
	bh=1XtJWJ5PeRCirDjIxVIenINEe49dxjFUvbLv8ITaSpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbZiPle9/ewdN9n/9IFRvre7eP8EORr35Zevr1GtJJDhvoKqecgYEOu59trYTpw3w3wnQG/Gd+GR0b0qnd5sw/6DC/dTm4O4z6vvFJSVxm6bhcmhsd9kJR38tdw/SO667vhz5Zbf6jVGSAcpixL+BgneemxL6NEQwkSNO37qraw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 74d7eea0-1d2b-11ef-8d3a-005056bd6ce9;
	Tue, 28 May 2024 22:49:56 +0300 (EEST)
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
Subject: [PATCH v2 01/11] pinctrl: berlin: Make use of struct pinfunction
Date: Tue, 28 May 2024 22:44:52 +0300
Message-ID: <20240528194951.1489887-2-andy.shevchenko@gmail.com>
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Since pin control provides a generic data type for the pin function,
use it in the driver.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/berlin/berlin.c | 21 +++++++++------------
 drivers/pinctrl/berlin/berlin.h |  6 ------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index 9550cc8095c2..c372a2a24be4 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -27,7 +27,7 @@ struct berlin_pinctrl {
 	struct regmap *regmap;
 	struct device *dev;
 	const struct berlin_pinctrl_desc *desc;
-	struct berlin_pinctrl_function *functions;
+	struct pinfunction *functions;
 	unsigned nfunctions;
 	struct pinctrl_dev *pctrl_dev;
 };
@@ -120,12 +120,12 @@ static const char *berlin_pinmux_get_function_name(struct pinctrl_dev *pctrl_dev
 static int berlin_pinmux_get_function_groups(struct pinctrl_dev *pctrl_dev,
 					     unsigned function,
 					     const char * const **groups,
-					     unsigned * const num_groups)
+					     unsigned * const ngroups)
 {
 	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 
 	*groups = pctrl->functions[function].groups;
-	*num_groups = pctrl->functions[function].ngroups;
+	*ngroups = pctrl->functions[function].ngroups;
 
 	return 0;
 }
@@ -153,7 +153,7 @@ static int berlin_pinmux_set(struct pinctrl_dev *pctrl_dev,
 {
 	struct berlin_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 	const struct berlin_desc_group *group_desc = pctrl->desc->groups + group;
-	struct berlin_pinctrl_function *func = pctrl->functions + function;
+	struct pinfunction *func = pctrl->functions + function;
 	struct berlin_desc_function *function_desc =
 		berlin_pinctrl_find_function_by_name(pctrl, group_desc,
 						     func->name);
@@ -180,7 +180,7 @@ static const struct pinmux_ops berlin_pinmux_ops = {
 static int berlin_pinctrl_add_function(struct berlin_pinctrl *pctrl,
 				       const char *name)
 {
-	struct berlin_pinctrl_function *function = pctrl->functions;
+	struct pinfunction *function = pctrl->functions;
 
 	while (function->name) {
 		if (!strcmp(function->name, name)) {
@@ -214,8 +214,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	}
 
 	/* we will reallocate later */
-	pctrl->functions = kcalloc(max_functions,
-				   sizeof(*pctrl->functions), GFP_KERNEL);
+	pctrl->functions = kcalloc(max_functions, sizeof(*pctrl->functions), GFP_KERNEL);
 	if (!pctrl->functions)
 		return -ENOMEM;
 
@@ -242,8 +241,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 		desc_function = desc_group->functions;
 
 		while (desc_function->name) {
-			struct berlin_pinctrl_function
-				*function = pctrl->functions;
+			struct pinfunction *function = pctrl->functions;
 			const char **groups;
 			bool found = false;
 
@@ -264,16 +262,15 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 				function->groups =
 					devm_kcalloc(&pdev->dev,
 						     function->ngroups,
-						     sizeof(char *),
+						     sizeof(*function->groups),
 						     GFP_KERNEL);
-
 				if (!function->groups) {
 					kfree(pctrl->functions);
 					return -ENOMEM;
 				}
 			}
 
-			groups = function->groups;
+			groups = (const char **)function->groups;
 			while (*groups)
 				groups++;
 
diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berlin.h
index d7787754d1ed..231aab61d415 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -28,12 +28,6 @@ struct berlin_pinctrl_desc {
 	unsigned			ngroups;
 };
 
-struct berlin_pinctrl_function {
-	const char	*name;
-	const char	**groups;
-	unsigned	ngroups;
-};
-
 #define BERLIN_PINCTRL_GROUP(_name, _offset, _width, _lsb, ...)		\
 	{								\
 		.name = _name,						\
-- 
2.45.1


