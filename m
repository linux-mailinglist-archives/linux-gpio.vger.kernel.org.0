Return-Path: <linux-gpio+bounces-8861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD8D958713
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 14:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC637282C92
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 12:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7594418EFF4;
	Tue, 20 Aug 2024 12:34:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA681CAAC;
	Tue, 20 Aug 2024 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157250; cv=none; b=LARHHQl9b2UJHYk95wbI8hZPdM2Qa/7uf/GzHz2JL9xMmcU1bZt/OyFde3TA+k5EeRRBaIsT+XwLa/Hmt3rOk59l3hybmYPieSnTQefDDnnpC59E7aNlehOmFGxKU+FQFRsoZefiBAJbne7Du0xNP+hm0BXXMS8q4F8gWrmsgJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157250; c=relaxed/simple;
	bh=u6qJXV5QxOYH5gw+RpuDO/sKZv/gyYeneYhpFGRl/Tg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YcfAbYihPRdCr3OMTz9ijZB7NJFBmb89WfrJHjmlqbJuQ8wyb5fVx1Vb7MKFEJyaO4CeAhfQEGqIg+TBObN6PA/dZrBwCL7Rbxi2Vzt9i972a9ZoKAW4S6QuJwQFHSw+tXxVOPHRCV51EQHEKE8Q5KxFhMQwP5YNk0TaKqg8QVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wp83m5kpjzhY0f;
	Tue, 20 Aug 2024 20:32:04 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id E47461800A0;
	Tue, 20 Aug 2024 20:34:04 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 20 Aug
 2024 20:34:04 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-gpio@vger.kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linus.walleij@linaro.org>,
	<florian.fainelli@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>, <wahrenst@gmx.net>,
	<wens@csie.org>
Subject: [PATCH -next] pinctrl: bcm2835: fix module autoloading
Date: Tue, 20 Aug 2024 12:26:04 +0000
Message-ID: <20240820122604.42736-1-liaochen4@huawei.com>
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
 dggpemm500020.china.huawei.com (7.185.36.49)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 184641e221d4..cc1fe0555e19 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1280,6 +1280,7 @@ static const struct of_device_id bcm2835_pinctrl_match[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, bcm2835_pinctrl_match);
 
 static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 {
-- 
2.34.1


