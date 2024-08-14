Return-Path: <linux-gpio+bounces-8741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C109512EB
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 05:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AB871F25A30
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2024 03:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9129C3987B;
	Wed, 14 Aug 2024 03:09:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EA639879;
	Wed, 14 Aug 2024 03:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723604989; cv=none; b=YGy2oMGjMezlIqd9mPX8FXrolgoARIBeA4TdRSVOkKAw0VaMY4vKV3oOVqWYXvbfm/BRvoFgwyuubEa6LhBhL9rpnrNKQCtD9yBM6VNLH04JYsi37KvF3BfnVPpP1OBLVS5to4McaWK77x1edtEMmtW43XahDrzmnKrlveDDQfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723604989; c=relaxed/simple;
	bh=HSxV9DCwxnKbAClnBF2Sl7FFbF6SYtxpSn25/kSssvY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WKicVPxKBTRT+M2MW8dq5KL48PlpGNUdhO1nfPayQgRCXYbpxm8tyR3LuDqTW/eowvxRK41Lbp4YSVSBUIukR2Cqm+hW/E9Ch2zZtFOSxFCScOq1PhArNOWrqkd4uBYBqcg7bYJfl1tigkltCT9guv4B7K36/G1BOcn10wJmdFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WkCr82457zndv7;
	Wed, 14 Aug 2024 11:08:24 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 8DB4B1400FD;
	Wed, 14 Aug 2024 11:09:44 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 11:09:44 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linus.walleij@linaro.org>,
	<michal.simek@amd.com>
Subject: [PATCH -next] pinctrl: pinctrl-zynq: fix module autoloading
Date: Wed, 14 Aug 2024 03:01:55 +0000
Message-ID: <20240814030155.3876069-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500020.china.huawei.com (7.185.36.49)

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/pinctrl/pinctrl-zynq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index 0e8de27d0de8..caa8a2ca3e68 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1202,6 +1202,7 @@ static const struct of_device_id zynq_pinctrl_of_match[] = {
 	{ .compatible = "xlnx,pinctrl-zynq" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, zynq_pinctrl_of_match);
 
 static struct platform_driver zynq_pinctrl_driver = {
 	.driver = {
-- 
2.34.1


