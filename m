Return-Path: <linux-gpio+bounces-12803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDEB9C3691
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 03:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1922B21851
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 02:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EBF13CFBD;
	Mon, 11 Nov 2024 02:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="PMDf6IZa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m243.xmail.ntesmail.com (mail-m243.xmail.ntesmail.com [45.195.24.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119CE2E630;
	Mon, 11 Nov 2024 02:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.24.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731292475; cv=none; b=jX47Og2ZLut0l+Ikuv+yOgMWBITJ9r8F6Y/xcnilB5xGufl920d9fXqLWn2ixZeBxDSVAZKVwQBJBVbx5Y8Pkc9OFLNz+raGEl+QbF2MlyaeEB95AGCOG+cNp8nKhx65CEckAYzgUOb2CvGjygPTrLaqbZD+ScMjyoy7cQqU0NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731292475; c=relaxed/simple;
	bh=hmbUtbzsm+2OKk8+VMFcgl6I8Mg6iPnYhEmNILMppbk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Soz2HF2XtwrxRpPWJZ0kmC4yySvrbG6cprgxPPMsZTlu1X0P+zy1jLWKdvxkFdKLK4zIuCCJd04guLsRW6VwnEKOD385jMY2joICpAg04uZDZQKx5c4pg/JoQpgYLCTETrOnowLWezP0DzU44SpMfUvQet5MlRIq78lx8ok2BFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=PMDf6IZa; arc=none smtp.client-ip=45.195.24.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 258a5851;
	Mon, 11 Nov 2024 10:34:22 +0800 (GMT+08:00)
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
Subject: [PATCH v4 2/4] gpio: rockchip: change the GPIO version judgment logic
Date: Mon, 11 Nov 2024 10:34:10 +0800
Message-Id: <20241111023412.3466161-3-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxlJS1YfTUNKSE1NThpKSENWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9319127de209d8kunm258a5851
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Py46Khw6FjIjEixKMw8qGDFW
	HUoaFAtVSlVKTEhKSUJJT01PSkJNVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkhPQzcG
DKIM-Signature:a=rsa-sha256;
	b=PMDf6IZaMBzkQAOU0WNh1boWHdQwaHX7M5knKr110MgtXf/f1kJs/a+nRS3PgETWkfOjjoMBP3OYfr5J8OpzrCBxQkm+LW7WAy/TYag5/HYkvJC5Dzr1qAQzmAPb3jmyHu1D09PLVHslTuJDAFkCmURbIxiofL6DE57qmOEauHo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=vWJG8cvhxWAUIWFD+PqmL7Rgp7985cdAoAUoZrwNjjs=;
	h=date:mime-version:subject:message-id:from;

Have a list of valid IDs and default to -ENODEV.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 71672d654491..f05b92e0e977 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -667,8 +667,13 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	clk_prepare_enable(bank->clk);
 	id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
-	/* If not gpio v2, that is default to v1. */
-	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
+	switch (id) {
+	case GPIO_TYPE_V1:
+		bank->gpio_regs = &gpio_regs_v1;
+		bank->gpio_type = GPIO_TYPE_V1;
+		break;
+	case GPIO_TYPE_V2:
+	case GPIO_TYPE_V2_1:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
 		bank->db_clk = of_clk_get(bank->of_node, 1);
@@ -677,9 +682,10 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 			clk_disable_unprepare(bank->clk);
 			return -EINVAL;
 		}
-	} else {
-		bank->gpio_regs = &gpio_regs_v1;
-		bank->gpio_type = GPIO_TYPE_V1;
+		break;
+	default:
+		dev_err(bank->dev, "cannot get the version ID\n");
+		return -ENODEV;
 	}
 
 	return 0;
-- 
2.34.1


