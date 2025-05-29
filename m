Return-Path: <linux-gpio+bounces-20687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A46AC7685
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 05:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 408D49E4D84
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 03:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D52246767;
	Thu, 29 May 2025 03:40:47 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C3820B7EC;
	Thu, 29 May 2025 03:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748490047; cv=none; b=ULpgvh+PAY05x8iGfNMXXB5A3NpU7e9zavuyYQuZwXuxG06ppOl7BF8z1CDKZypMrFbZu9BtwIyLZmMBHtEPLLuoE6LnaEwAF7h0taJ9S7HEhLzii3bERTZd6TSVELZ2lZUnAdBaDKt62g2Gs4kEjS/8//j9r9kkjBqfZNR6PCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748490047; c=relaxed/simple;
	bh=ggjIwPtL31FOb/CNMpd6E/AbPIXUeqyY3wx7tZImobQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=smZv8wQnBVlSrBTgBsGXh6BluO2M3EBVDM8IQ/bFfpz3sQIiDEMN614XP7m3X8rQuTCQiOniXl6J75+eAbjCzlYe/56oBYILlnGVx+uIt1kyCoQG7iWzKpFj7BNj/a4PxIa+vDyKCdhDb60inqGFTMMBnvQEUJukPZ+TXIboTLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4b7Bqc4d8bzQjyn;
	Thu, 29 May 2025 11:36:28 +0800 (CST)
Received: from dggpemf500006.china.huawei.com (unknown [7.185.36.235])
	by mail.maildlp.com (Postfix) with ESMTPS id E7D37180B53;
	Thu, 29 May 2025 11:40:35 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 dggpemf500006.china.huawei.com (7.185.36.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 May 2025 11:40:35 +0800
From: Yang Shen <shenyang39@huawei.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <f.fangjian@huawei.com>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Update HiSilicon GPIO driver maintainer
Date: Thu, 29 May 2025 11:40:23 +0800
Message-ID: <20250529034023.3780376-1-shenyang39@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500006.china.huawei.com (7.185.36.235)

Add Yang Shen as the maintainer of the HiSilicon GPIO driver,
replacing Jay Fang.

Signed-off-by: Yang Shen <shenyang39@huawei.com>
Reviewed-by: Jay Fang <f.fangjian@huawei.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d2074d16107..77e3b08f71ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10757,7 +10757,7 @@ S:	Maintained
 F:	drivers/dma/hisi_dma.c
 
 HISILICON GPIO DRIVER
-M:	Jay Fang <f.fangjian@huawei.com>
+M:	Yang Shen <shenyang39@huawei.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/gpio/hisilicon,ascend910-gpio.yaml
-- 
2.33.0


