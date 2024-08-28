Return-Path: <linux-gpio+bounces-9254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5614A962264
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 10:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8935D1C21620
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 08:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C62B15B98E;
	Wed, 28 Aug 2024 08:40:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A360F8288F;
	Wed, 28 Aug 2024 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724834420; cv=none; b=HEACgXnEj1soRLFCl1gYVktEP66TZBHJoE3rGsB09jzvN1HdYhZIsR34khh5f3O8omy28X9QxVksnVnaSUo4smbAD+QeNyHup7L2IVD6kNZhG+wC1ZgOJTto1gCfRwV5M3KEB4i+ZxP1ATdVSkhmxP29zak2reYKPLMNNqnAtHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724834420; c=relaxed/simple;
	bh=j805Jr3asHAIe8ISvsaNPdAkf6ziOcJ5IkdNLIWyWYw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bgn4KNkdbcz0p5XEVzPhMIaeL3F6RR0qr8v49t9uqcLfIwaQUBhhqkRU1F4glTFpishaXD1Qy9C2srMCMW0AVDGgsf5z+MVs6m5NoDxf8NWgN6H0z2YIMr8wLJzIJiBv6BXNwePbnKYG9EZBKw9UXPkJY4DVd3yc8wPaihK7thg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WtyXJ3S4Xz1S98V;
	Wed, 28 Aug 2024 16:40:00 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 43A251A016C;
	Wed, 28 Aug 2024 16:40:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Aug
 2024 16:40:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <rjui@broadcom.com>, <sbranden@broadcom.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <linus.walleij@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] pinctrl: bcm: Use devm_platform_ioremap_resource_byname()
Date: Wed, 28 Aug 2024 16:48:10 +0800
Message-ID: <20240828084810.2526847-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)

platform_get_resource_byname() and devm_ioremap_resource() can be
replaced by devm_platform_ioremap_resource_byname(), which can
simplify the code logic a bit, No functional change here.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/pinctrl/bcm/pinctrl-ns.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index 6bb2b461950b..bacc1a00506d 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -211,7 +211,6 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
 	struct ns_pinctrl *ns_pinctrl;
 	struct pinctrl_desc *pctldesc;
 	struct pinctrl_pin_desc *pin;
-	struct resource *res;
 	int i;
 
 	ns_pinctrl = devm_kzalloc(dev, sizeof(*ns_pinctrl), GFP_KERNEL);
@@ -226,9 +225,8 @@ static int ns_pinctrl_probe(struct platform_device *pdev)
 
 	ns_pinctrl->chipset_flag = (uintptr_t)device_get_match_data(dev);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					   "cru_gpio_control");
-	ns_pinctrl->base = devm_ioremap_resource(dev, res);
+	ns_pinctrl->base = devm_platform_ioremap_resource_byname(pdev,
+								 "cru_gpio_control");
 	if (IS_ERR(ns_pinctrl->base))
 		return PTR_ERR(ns_pinctrl->base);
 
-- 
2.34.1


