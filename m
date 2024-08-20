Return-Path: <linux-gpio+bounces-8862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FD295871C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 14:35:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 826061C20CD9
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Aug 2024 12:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C7A18FC68;
	Tue, 20 Aug 2024 12:35:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC4918DF6F;
	Tue, 20 Aug 2024 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157332; cv=none; b=XFShzPjOinKckjKvxjyXuxkofUViL/lazEKp/aoUCn/FgDpKEwgWgsHTUHTntSBbuIalhd4lmxqgrIS+t4h6NhwHxRa1TAUX2t3LTYO10pX+iKkaATDFYwtUNuQRPMzseJ5JmX6bT1p0aiXGsVRXl9ONI9gMS08CgVMTyqe4/l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157332; c=relaxed/simple;
	bh=Ey+2mQwCrnn4It7TxiH+tlv+dZB4jgHoJhow6i8k8jI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p7lHE8JyPReDkj1JGtDUnFnNHYGP2mByha/nFes5Aqaro/jw7x1hWV/r5BAT4YcMVrCpqnthyZgpsgHHudIcHEhpZuQKAq813yQ0iJlijsIaStf4t8FiIsnbKoVrRyNBnjdyutKzFruYVVYbJ92UDJbnziWR22K4hm7z30nYI4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wp84042Ffz1HGx5;
	Tue, 20 Aug 2024 20:32:16 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 98F851401F4;
	Tue, 20 Aug 2024 20:35:27 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 20 Aug
 2024 20:35:27 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-gpio@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linus.walleij@linaro.org>,
	<tychang@realtek.com>
Subject: [PATCH -next] pinctrl: realtek: fix module autoloading
Date: Tue, 20 Aug 2024 12:27:27 +0000
Message-ID: <20240820122727.42811-1-liaochen4@huawei.com>
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
 dggpemm500020.china.huawei.com (7.185.36.49)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/pinctrl/realtek/pinctrl-rtd1619b.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd1619b.c b/drivers/pinctrl/realtek/pinctrl-rtd1619b.c
index b07e50d6356d..e03e1fb09899 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd1619b.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd1619b.c
@@ -1575,6 +1575,7 @@ static const struct of_device_id rtd1619b_pinctrl_of_match[] = {
 	{ .compatible = "realtek,rtd1619b-pinctrl", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rtd1619b_pinctrl_of_match);
 
 static struct platform_driver rtd1619b_pinctrl_driver = {
 	.driver = {
-- 
2.34.1


