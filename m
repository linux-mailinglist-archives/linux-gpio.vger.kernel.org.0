Return-Path: <linux-gpio+bounces-7153-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB68FC4C6
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 09:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2058B1C20E11
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Jun 2024 07:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580BC18C34B;
	Wed,  5 Jun 2024 07:41:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F86518C347
	for <linux-gpio@vger.kernel.org>; Wed,  5 Jun 2024 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573272; cv=none; b=q9iZFhcQZt1PO3be+29Sz/oRJz8n8O97V3cBe971o6z9ST0Eg3oLSUAOreQqEeC0/WyzEETfqER0ES8mHy3RqXLJJCJWXaNkJ6u0x44poYHjTltgvHuX2adzcc/t30PhlNUwJ+/GmC9As/XmSNIBCnBHEWviBPhM3Ou7cP/PgZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573272; c=relaxed/simple;
	bh=thZM1k3vi1nXvaLP8yzEvfdn0DoKJX9r5QxEuBEWWq4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QHZNuT2l6wT63TDtaFQx1t9YQolDKzX9qo0GGTAlPbHKi4uIfMcN1J7E/Vxpf8nCuVv10pZfAXvVCa/GgCxhigeEhYs7pasfy7tzjZM26cwLSnH7iErvJ8bbpSzr0ScGUsvnGiv4RjoPHE1x/o1kL/Y4NAM89eUAxWuZGXk7Fio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VvK6V3FshzsSdd;
	Wed,  5 Jun 2024 15:37:06 +0800 (CST)
Received: from dggpemm500003.china.huawei.com (unknown [7.185.36.56])
	by mail.maildlp.com (Postfix) with ESMTPS id 1B26E14041A;
	Wed,  5 Jun 2024 15:41:03 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500003.china.huawei.com (7.185.36.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 15:41:02 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 5 Jun
 2024 15:41:02 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-gpio@vger.kernel.org>
CC: <linus.walleij@linaro.org>, <dan.carpenter@linaro.org>,
	<tony@atomide.com>, <haojian.zhuang@linaro.org>, <yangyingliang@huawei.com>,
	<liwei391@huawei.com>
Subject: [PATCH 2/3] pinctrl: single: fix possible memory leak when pinctrl_enable() fails
Date: Wed, 5 Jun 2024 15:38:26 +0800
Message-ID: <20240605073827.3380584-3-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605073827.3380584-1-yangyingliang@huawei.com>
References: <20240605073827.3380584-1-yangyingliang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)

This driver calls pinctrl_register_and_init() which is not
devm_ managed, it will leads memory leak if pinctrl_enable()
fails. Replace it with devm_pinctrl_register_and_init().

Fixes: 5038a66dad01 ("pinctrl: core: delete incorrect free in pinctrl_enable()")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/pinctrl/pinctrl-single.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index a798f31d6954..9eb7401eab13 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1329,7 +1329,6 @@ static void pcs_irq_free(struct pcs_device *pcs)
 static void pcs_free_resources(struct pcs_device *pcs)
 {
 	pcs_irq_free(pcs);
-	pinctrl_unregister(pcs->pctl);
 
 #if IS_BUILTIN(CONFIG_PINCTRL_SINGLE)
 	if (pcs->missing_nr_pinctrl_cells)
@@ -1879,7 +1878,7 @@ static int pcs_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto free;
 
-	ret = pinctrl_register_and_init(&pcs->desc, pcs->dev, pcs, &pcs->pctl);
+	ret = devm_pinctrl_register_and_init(pcs->dev, &pcs->desc, pcs, &pcs->pctl);
 	if (ret) {
 		dev_err(pcs->dev, "could not register single pinctrl driver\n");
 		goto free;
-- 
2.25.1


