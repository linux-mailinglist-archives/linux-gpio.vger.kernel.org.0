Return-Path: <linux-gpio+bounces-9570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2734968716
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 14:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EE6A286B34
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E0A200108;
	Mon,  2 Sep 2024 12:07:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3AA185947;
	Mon,  2 Sep 2024 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725278837; cv=none; b=iGcvEb/ERxKbqjVV/Iv0HVccwECZeeozRSscotXcbK3SL8qCtCta+aoJ2PFC73/4L1hL+CfiM1cA9LnSFiWnpv/9TzRDhnSXeOdHaMYsKiLpTO4bTMYT6wvmHPWMaSWLccAkrlt7LcitMtlMIAxrF8LNlisg0Qb6HDIyzCpyBCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725278837; c=relaxed/simple;
	bh=t2gAYCu0IFtlBxt8ILp+o87E1796+jpbU0bKhjOXHMs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m+UdObFQs49G/G8Bnm56uemZZM+oDwOPUWuIsp9qzrMrRwWPT8TCHou5GTlkfeJBfgaOGeXZadMrkKzrF4OI0K2vG5iQOkwJqNh0FjFq61P+dpQt3ugDJqTDIn9l4iHgSAoQzKoQL9Ibrr39qp89GSR97iEu99EO/k+7hZvGJZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Wy6rl4qpnz1xwj4;
	Mon,  2 Sep 2024 20:05:11 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 9449C140360;
	Mon,  2 Sep 2024 20:07:11 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 2 Sep
 2024 20:07:11 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <michal.simek@amd.com>,
	<liaochen4@huawei.com>
Subject: [PATCH -next] gpio: modepin: Enable module autoloading
Date: Mon, 2 Sep 2024 11:58:48 +0000
Message-ID: <20240902115848.904227-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500020.china.huawei.com (7.185.36.49)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/gpio/gpio-zynqmp-modepin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-zynqmp-modepin.c b/drivers/gpio/gpio-zynqmp-modepin.c
index a0d69387c153..2f3c9ebfa78d 100644
--- a/drivers/gpio/gpio-zynqmp-modepin.c
+++ b/drivers/gpio/gpio-zynqmp-modepin.c
@@ -146,6 +146,7 @@ static const struct of_device_id modepin_platform_id[] = {
 	{ .compatible = "xlnx,zynqmp-gpio-modepin", },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, modepin_platform_id);
 
 static struct platform_driver modepin_platform_driver = {
 	.driver = {
-- 
2.34.1


