Return-Path: <linux-gpio+bounces-9617-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0BE96971B
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 10:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37E421F24FA9
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 08:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3263F21018A;
	Tue,  3 Sep 2024 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="YUPQenCZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m127175.xmail.ntesmail.com (mail-m127175.xmail.ntesmail.com [115.236.127.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE7F1D4608;
	Tue,  3 Sep 2024 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352334; cv=none; b=ufwYzmXA/j1WFplF9P1o56wNU7KgSN1MYMn5Gxy+1R6vmpDeMuXsC/jiOf2K5xqsVQRYWYOwb6IIuPdpk25S/EOPhJfrE3NpXdes+D9+k83xMk0S7IjAjAXzuzJiTq+dNhdVBeoVvv/t+43uOe+7khGy6cuprBHg8QWTqaatWQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352334; c=relaxed/simple;
	bh=WWQw228zRuzv+kvvTmtPfc+AZ2pZtv72NUZ5SG/zNvI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QiMgE1tepCRpHPZlOP5umigokAKLWFdANOniistzyK2laTFe+TzXwfVH5+HHLHeJ3vGhMXQtJl8McCgi8/3ZKI/4VD9rrEFNhzQd8oeA1BojpMeqsrZqOy+/1w+j1J0z/bKoa+yLyINL/LwSR/w91fFaSLtWYNjJFHBi6nLKDwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=YUPQenCZ; arc=none smtp.client-ip=115.236.127.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=YUPQenCZLsF1LQYjiZQWJFdQfS1EbqjWN9BC3pkl+b59EEc0AKT9zaaK7QXHnMHeqUzze+eoOwnlkAqs3jDvg5zZnnJDON97rw+/PW3ylHjHJokBVdssjTAvtTZg577oVMxSeiwG3Y8OiNFv7MDV4UU8oKSGDO0E1ehlRtRUBxM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=aKIFSG7psQm1vWjapk5w2XfwNBNv7IDfrqqRzIJzccQ=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id B04CA7E06F3;
	Tue,  3 Sep 2024 15:37:04 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: [PATCH v3 02/12] gpio: rockchip: release reference to device node
Date: Tue,  3 Sep 2024 15:36:39 +0800
Message-Id: <20240903073649.237362-3-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903073649.237362-1-ye.zhang@rock-chips.com>
References: <20240903073649.237362-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRhNQ1ZIQ0lITEweQxpKTE5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a91b6d0d68609cfkunmb04ca7e06f3
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRg6Sxw5AjI3GklWPBMRFRlI
	UQsaCjVVSlVKTElOSE9CS0lOQkpLVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUhNSzcG

Added a call to of_node_put(pctlnp) in rockchip_gpio_probe to properly
release the reference to the device node, improving memory management
and preventing potential leaks.

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 712258224eb3..5f60162baaeb 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -715,6 +715,7 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	pctldev = of_pinctrl_get(pctlnp);
+	of_node_put(pctlnp);
 	if (!pctldev)
 		return -EPROBE_DEFER;
 
-- 
2.34.1


