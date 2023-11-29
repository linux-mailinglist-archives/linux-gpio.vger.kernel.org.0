Return-Path: <linux-gpio+bounces-632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E59437FCD04
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 03:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C3631F20FD4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 02:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA8E627;
	Wed, 29 Nov 2023 02:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D4F19A4
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 18:40:21 -0800 (PST)
Received: from dggpemm100024.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Sg3NK230NzShP1;
	Wed, 29 Nov 2023 10:36:01 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100024.china.huawei.com (7.185.36.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 10:40:19 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 29 Nov
 2023 10:40:19 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-gpio@vger.kernel.org>
CC: <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
	<asmaa@nvidia.com>, <yangyingliang@huawei.com>
Subject: [PATCH] pinctrl: mlxbf3: fix wrong return pointer check in mlxbf3_pinctrl_probe()
Date: Wed, 29 Nov 2023 10:44:25 +0800
Message-ID: <20231129024425.4049758-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

Fix wrong return pointer check after calling devm_platform_ioremap_resource().

Fixes: d11f932808dc ("pinctrl: mlxbf3: Add pinctrl driver support")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/pinctrl/pinctrl-mlxbf3.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mlxbf3.c b/drivers/pinctrl/pinctrl-mlxbf3.c
index 7d1713824a89..ffb5dda364dc 100644
--- a/drivers/pinctrl/pinctrl-mlxbf3.c
+++ b/drivers/pinctrl/pinctrl-mlxbf3.c
@@ -259,16 +259,16 @@ static int mlxbf3_pinctrl_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->fw_ctrl_set0);
 
 	priv->fw_ctrl_clr0 = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(priv->fw_ctrl_set0))
-		return PTR_ERR(priv->fw_ctrl_set0);
+	if (IS_ERR(priv->fw_ctrl_clr0))
+		return PTR_ERR(priv->fw_ctrl_clr0);
 
 	priv->fw_ctrl_set1 = devm_platform_ioremap_resource(pdev, 2);
-	if (IS_ERR(priv->fw_ctrl_set0))
-		return PTR_ERR(priv->fw_ctrl_set0);
+	if (IS_ERR(priv->fw_ctrl_set1))
+		return PTR_ERR(priv->fw_ctrl_set1);
 
 	priv->fw_ctrl_clr1 = devm_platform_ioremap_resource(pdev, 3);
-	if (IS_ERR(priv->fw_ctrl_set0))
-		return PTR_ERR(priv->fw_ctrl_set0);
+	if (IS_ERR(priv->fw_ctrl_clr1))
+		return PTR_ERR(priv->fw_ctrl_clr1);
 
 	ret = devm_pinctrl_register_and_init(dev,
 					     &mlxbf3_pin_desc,
-- 
2.25.1


