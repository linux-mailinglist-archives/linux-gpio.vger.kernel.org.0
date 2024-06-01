Return-Path: <linux-gpio+bounces-7025-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF608D6F82
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2024 13:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCCC01C20B0B
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2024 11:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489E2335A7;
	Sat,  1 Jun 2024 11:37:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D3A1878
	for <linux-gpio@vger.kernel.org>; Sat,  1 Jun 2024 11:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717241856; cv=none; b=Gu2C5lxb4NgwgQoUOAAyVpsOe+ZHzLESFh7xNo9n+Z5OHSzTb6+S3cwI2t5Y5hedgf56ts6bBcyJ8t0ZfibSaYGVCt4pc3YJIhKSvT4wwootwp8RGcVxiSDiZI3jDp4GFeWo5lj2LmdWlwUumAhRF5OH7m3wl+lLvAyyZJ/6kZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717241856; c=relaxed/simple;
	bh=IVlaZKj+r9rplCnCEkCeN4eTGtjXZDbzUQbItAPkyz0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TEaUMyndRyorJcm1uWzt3bVynAEQgIf5j/uXSnzgGxo8JuY97gI+bEQ6XeNjApxI2EAuBJCpCgbZAkf8R2VD7VBnojuaRWlf1Hdntw+7h+NxQhxN7iVItXP7KzsWEizGl3/F0Zl4y9Wg34KSaob9OT8msakFeEGBdeab0bNJkjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VryXb4rXFzmWrS;
	Sat,  1 Jun 2024 19:33:03 +0800 (CST)
Received: from dggpemm500021.china.huawei.com (unknown [7.185.36.109])
	by mail.maildlp.com (Postfix) with ESMTPS id D9681180A9C;
	Sat,  1 Jun 2024 19:37:30 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 1 Jun 2024 19:37:30 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sat, 1 Jun
 2024 19:37:30 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-gpio@vger.kernel.org>
CC: <linus.walleij@linaro.org>, <dan.carpenter@linaro.org>,
	<yangyingliang@huawei.com>, <liwei391@huawei.com>
Subject: [PATCH] pinctrl: core: fix possible memory leak in error path in pinctrl_enable()
Date: Sat, 1 Jun 2024 19:35:02 +0800
Message-ID: <20240601113502.2709597-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)

In devm_pinctrl_register(), if pinctrl_enable() fails in pinctrl_register(),
the "pctldev" has not been added to dev resources, so devm_pinctrl_dev_release()
can not be called, it leads memory leak.

And some driver calls pinctrl_register_and_init() which is not devm_ managed,
it also leads memory leak if pinctrl_enable() fails.

To fix this, add a flag devm_allocated to struct pinctrl_dev, free the memory
by checking this flag.

Fixes: 5038a66dad01 ("pinctrl: core: delete incorrect free in pinctrl_enable()")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/pinctrl/core.c | 9 +++++++++
 drivers/pinctrl/core.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index cffeb869130d..374c36f5c759 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2125,6 +2125,13 @@ int pinctrl_enable(struct pinctrl_dev *pctldev)
 	error = pinctrl_claim_hogs(pctldev);
 	if (error) {
 		dev_err(pctldev->dev, "could not claim hogs: %i\n", error);
+		if (!pctldev->devm_allocated) {
+			pinctrl_free_pindescs(pctldev, pctldev->desc->pins,
+					      pctldev->desc->npins);
+			mutex_destroy(&pctldev->mutex);
+			kfree(pctldev);
+		}
+
 		return error;
 	}
 
@@ -2283,6 +2290,7 @@ struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
 		return pctldev;
 	}
 
+	pctldev->devm_allocated = true;
 	*ptr = pctldev;
 	devres_add(dev, ptr);
 
@@ -2319,6 +2327,7 @@ int devm_pinctrl_register_and_init(struct device *dev,
 		return error;
 	}
 
+	(*pctldev)->devm_allocated = true;
 	*ptr = *pctldev;
 	devres_add(dev, ptr);
 
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 837fd5bd903d..bf57ce4fe927 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -72,6 +72,7 @@ struct pinctrl_dev {
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *device_root;
 #endif
+	bool devm_allocated;
 };
 
 /**
-- 
2.25.1


