Return-Path: <linux-gpio+bounces-9632-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC13D969C7C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 13:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D493A1C22C64
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 11:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA7B1C7686;
	Tue,  3 Sep 2024 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="To3Vw5zw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155105.qiye.163.com (mail-m155105.qiye.163.com [101.71.155.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4D71A42A5;
	Tue,  3 Sep 2024 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725364335; cv=none; b=JmhzdLBIMLZofLylc7KKg/dNf2RmL4a0P9vsa5s0JFBigt2hJUi5OIFjpqNVQwcTy0brRJ6zSSP2l9KCmrMVyQ6craNGTCL9Ywgv7v6M5Ot/OTDsstD0UxunABv7j/9VMT4Pz/kOhaKTsZCWIH8Dt2v2TstCFGpCnukjoX7YGwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725364335; c=relaxed/simple;
	bh=/S8XOHFxbVEtAyE1h6Vc8n06lJUypImotz6dPyDbh7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lvE8AGhm5Rkuj+Ql7FupT5in6ZWeyneb1sa64olfnQH7QNWlM6pgPcYcYNjbaUF5gKMsESgieaLy39VLUI4OGMZraDoM5EE0cqPohX70SSB1IKoZ23eLXlYDt+6j5WpQp6Gaw2waXZ9ZePHmjn2DUDhHNhHxBraTFD5pPnY0+5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=To3Vw5zw; arc=none smtp.client-ip=101.71.155.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=To3Vw5zwDTrHkUlidzc1QbyWCgNJMuMTi0h7dyi+1imDW5AcuFSUMZlSXmM/F0LHjf3w1Mop8cvPi4z5O4N5fj5/eaSg2VGdSSJLJ595pu7IhDgYr2U1G1RE2l0Z6i3R7dRlGZ9tCbgIxNWNKXnuF8nMyUXSFjJkoGuO1I9b6hY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=YHgiyOsxvY6K4cw4rtUovbYtN4FFCAToL86cwycTCM4=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 41FA27E0380;
	Tue,  3 Sep 2024 15:37:14 +0800 (CST)
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
Subject: [PATCH v3 09/12] gpio: rockchip: change the GPIO version judgment logic
Date: Tue,  3 Sep 2024 15:36:46 +0800
Message-Id: <20240903073649.237362-10-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxpJH1ZCTx0ZGR4dSk5JT09WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a91b6d0fbdb09cfkunm41fa27e0380
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCI6DDo*AzI6OEk3PBxPFQgT
	MjAKFDdVSlVKTElOSE9CS0hOTkpIVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUxOSzcG

Have a list of valid V1 IDs and default to -ENODEV.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 04a24f1d77eb..579701ad3c6f 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -658,13 +658,20 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 
 	id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
-	/* If not gpio v2, that is default to v1. */
-	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
-		bank->gpio_regs = &gpio_regs_v2;
-		bank->gpio_type = GPIO_TYPE_V2;
-	} else {
+	/* The GPIO version ID is incrementing. */
+	switch (id) {
+	case GPIO_TYPE_V1:
 		bank->gpio_regs = &gpio_regs_v1;
 		bank->gpio_type = GPIO_TYPE_V1;
+		break;
+	case GPIO_TYPE_V2:
+	case GPIO_TYPE_V2_1:
+		bank->gpio_regs = &gpio_regs_v2;
+		bank->gpio_type = GPIO_TYPE_V2;
+		break;
+	default:
+		dev_err(bank->dev, "cannot get the version ID\n");
+		return -ENODEV;
 	}
 
 	return 0;
-- 
2.34.1


