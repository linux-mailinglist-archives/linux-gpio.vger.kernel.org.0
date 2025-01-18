Return-Path: <linux-gpio+bounces-14928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B8A15B30
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2025 04:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F7C83A91E9
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jan 2025 03:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1D18634F;
	Sat, 18 Jan 2025 03:14:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4397BAEC;
	Sat, 18 Jan 2025 03:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737170076; cv=none; b=kvAdaD5xne1ZDyYmVaMQ3MST86lb+EO3K81gSTyxOVdj7IIM1X8Bpw+Y8AkUp9UlGE1sV6YECj4Hn9hv1fg3di+Sj3ZQKEIrQV8YzwQTtPL4IB8o1R603BEvxltIq3OdeqJ6OvSSNAFGFk/ZmPnmUaNxYttRdO65r8Xr2h5+tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737170076; c=relaxed/simple;
	bh=sE/V5thDQjRxU95DQy94FsY26DU9FBg2rxmLYhwApcw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vArTn3yZ/5rs+yyD502ujj9HU+a78eLWKbiGRvf16Sw0+3+fvSnJqbULU+3Zxtj6wOQQ5xIqA+x6CdMQRu5I4KjHmu3GeA9oUwp75UAXrSS65S/08zoMOuCisMvQO5bcWi4tQeankDcFhEbLMksHqD8szMrEl46d9f/RXUUpOGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YZh5X5GmkzjYCG;
	Sat, 18 Jan 2025 10:54:24 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 518031401E9;
	Sat, 18 Jan 2025 10:58:19 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 18 Jan
 2025 10:58:18 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <linus.walleij@linaro.org>, <yuehaibing@huawei.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] pinctrl: pistachio: Remove dead code in pistachio_gpio_register()
Date: Sat, 18 Jan 2025 11:11:45 +0800
Message-ID: <20250118031145.243104-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf500002.china.huawei.com (7.185.36.57)

fwnode_irq_get() was changed to not return 0, so this check is dead code now.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/pinctrl-pistachio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 53408344927a..8c50e0091b32 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1393,12 +1393,6 @@ static int pistachio_gpio_register(struct pistachio_pinctrl *pctl)
 			dev_err(pctl->dev, "Failed to retrieve IRQ for bank %u\n", i);
 			goto err;
 		}
-		if (!ret) {
-			fwnode_handle_put(child);
-			dev_err(pctl->dev, "No IRQ for bank %u\n", i);
-			ret = -EINVAL;
-			goto err;
-		}
 		irq = ret;
 
 		bank = &pctl->gpio_banks[i];
-- 
2.34.1


