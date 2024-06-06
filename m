Return-Path: <linux-gpio+bounces-7210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7A68FDCE1
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 04:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A8D0285F3E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 02:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E9E199B9;
	Thu,  6 Jun 2024 02:39:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63231B285
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 02:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717641589; cv=none; b=d5DR4ICne887Khq3YMfW8zmz9YPbYtIgufQxqA2fK1zxbH4ZHHYZTJSH/8qOtpnmLcWMkCU+nZx5eo3BDkyyOQNYbjvRvb6Lf8XOqbzTpBHnKLv5MrM2g9uHC5UZo5YYXYyHApBoIzQJOtjPEwqNCkmTE3+S/j1dQgBy7od8DbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717641589; c=relaxed/simple;
	bh=DHpacmr+1+C1jw2cfTs7qg1owQWJx+BzIC9c0gbL28Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VLz43mJAdlxWjommE259I4GWfYHny6UJGlWf41q7wQ6iOu0lLL53r5FP9NzvLNr1YVYmhTPmQpxhboXogkWJV1q42b7mN11sRSHJm+cr1xYM7a/scGnz1jjl2+xhiK2M84xj3RcBOJxk7DaEN5ZLUjbh8WFK4ZC/7lsNc7tSRh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VvpNL4XzzzwRV1;
	Thu,  6 Jun 2024 10:35:46 +0800 (CST)
Received: from dggpemm100019.china.huawei.com (unknown [7.185.36.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B41D18006D;
	Thu,  6 Jun 2024 10:39:44 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100019.china.huawei.com (7.185.36.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 10:39:43 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 6 Jun
 2024 10:39:43 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-gpio@vger.kernel.org>
CC: <linus.walleij@linaro.org>, <dan.carpenter@linaro.org>,
	<tony@atomide.com>, <haojian.zhuang@linaro.org>, <yangyingliang@huawei.com>,
	<liwei391@huawei.com>
Subject: [PATCH v2 3/3] pinctrl: ti: ti-iodelay: fix possible memory leak when pinctrl_enable() fails
Date: Thu, 6 Jun 2024 10:37:04 +0800
Message-ID: <20240606023704.3931561-4-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606023704.3931561-1-yangyingliang@huawei.com>
References: <20240606023704.3931561-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)

This driver calls pinctrl_register_and_init() which is not
devm_ managed, it will leads memory leak if pinctrl_enable()
fails. Replace it with devm_pinctrl_register_and_init().
And add missing of_node_put() in the error path.

Fixes: 5038a66dad01 ("pinctrl: core: delete incorrect free in pinctrl_enable()")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 040f2c46a868..ef9758638501 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -876,7 +876,7 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 	iod->desc.name = dev_name(dev);
 	iod->desc.owner = THIS_MODULE;
 
-	ret = pinctrl_register_and_init(&iod->desc, dev, iod, &iod->pctl);
+	ret = devm_pinctrl_register_and_init(dev, &iod->desc, iod, &iod->pctl);
 	if (ret) {
 		dev_err(dev, "Failed to register pinctrl\n");
 		goto exit_out;
@@ -884,7 +884,11 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iod);
 
-	return pinctrl_enable(iod->pctl);
+	ret = pinctrl_enable(iod->pctl);
+	if (ret)
+		goto exit_out;
+
+	return 0;
 
 exit_out:
 	of_node_put(np);
@@ -899,9 +903,6 @@ static void ti_iodelay_remove(struct platform_device *pdev)
 {
 	struct ti_iodelay_device *iod = platform_get_drvdata(pdev);
 
-	if (iod->pctl)
-		pinctrl_unregister(iod->pctl);
-
 	ti_iodelay_pinconf_deinit_dev(iod);
 
 	/* Expect other allocations to be freed by devm */
-- 
2.25.1


