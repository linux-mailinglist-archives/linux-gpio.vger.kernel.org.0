Return-Path: <linux-gpio+bounces-9032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F28EE95C823
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 10:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8E831F21B6D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 08:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5A2144D0A;
	Fri, 23 Aug 2024 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Zkn6ylco"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m15588.qiye.163.com (mail-m15588.qiye.163.com [101.71.155.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AF77346D;
	Fri, 23 Aug 2024 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724401945; cv=none; b=mmMKWU73aPPRgkXGOXf4kTA5hnoqdNX0t0oiaQe0sSkOULwT6GKqGsJBlL0QoZdcqJZ4LB0QONwvBtBbSWW63vLmrXiOXr96TQ/CDPo23TaAK43OPAFF8WoB3v9wJGZZmkEXeANqVzJz1FUkD6mWJkUdNlniXHQ2z6N+JKN22EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724401945; c=relaxed/simple;
	bh=0ajsovgm8gokEKk5AkuBSCapKRdO7ppjM/xTlcS3sH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jc28sYIkger2pLYxXKngOV056q+Qfy5kPgBbaYU/Es4BV+6hdODExrZtwIEHEHpfjsEPxK1r+tsFyT18/W01Xu35EUvCYT1Vxuc2QrwwYGOHx8EaYdKtRSNSRTkS5nPl7wuFfVIdz0Mkh0+vbSGKi/KCg1iHZJXDTz+eT9WUyBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Zkn6ylco; arc=none smtp.client-ip=101.71.155.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=Zkn6ylcoVbTJckdIEBreZbOQG/pfX3mPGJX6PsYEVHuhr4rPxCUWbkwtbYyfql0LTNXTpfGjGAGAcm5fXGgSJDuhtSI+2fOzX4S23FFInoGj7Au9AH0SziiAPjh06b2n2dyBPFA7KnK68srUvZCUc2Rs3XGXbhwlcroavIugBxU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=apRmS241b/aRkrNBwUlbeYm8yi6KsELv22IMtcVzCc0=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 5EEE27E03EE;
	Fri, 23 Aug 2024 11:45:06 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: linus.walleij@linaro.org,
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
	elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: [PATCH v2] gpio: rockchip: support 'clock-names' from dt nodes
Date: Fri, 23 Aug 2024 11:43:10 +0800
Message-Id: <20240823034314.62305-8-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823034314.62305-1-ye.zhang@rock-chips.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlJHlZJThofHxgYHUhCHU5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917d56824209cfkunm5eee27e03ee
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTI6URw5GjIwQyw2NzQTTlE#
	OgwwCQhVSlVKTElPSENPTEtMTENKVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBT01LSTcG

Added support for retrieving clocks using 'clock-names' from dt nodes

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 42 ++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index aff8bec79062..25ddf6a82c09 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -646,23 +646,12 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	if (!bank->irq)
 		return -EINVAL;
 
-	bank->clk = of_clk_get(bank->of_node, 0);
-	if (IS_ERR(bank->clk))
-		return PTR_ERR(bank->clk);
-
-	clk_prepare_enable(bank->clk);
 	id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
 	/* If not gpio v2, that is default to v1. */
 	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
-		bank->db_clk = of_clk_get(bank->of_node, 1);
-		if (IS_ERR(bank->db_clk)) {
-			dev_err(bank->dev, "cannot find debounce clk\n");
-			clk_disable_unprepare(bank->clk);
-			return -EINVAL;
-		}
 	} else {
 		bank->gpio_regs = &gpio_regs_v1;
 		bank->gpio_type = GPIO_TYPE_V1;
@@ -722,10 +711,29 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 
 	raw_spin_lock_init(&bank->slock);
 
+	bank->clk = devm_clk_get(dev, "bus");
+	if (IS_ERR(bank->clk)) {
+		bank->clk = of_clk_get(dev->of_node, 0);
+		if (IS_ERR(bank->clk)) {
+			dev_err(dev, "fail to get apb clock\n");
+			return PTR_ERR(bank->clk);
+		}
+	}
+
 	ret = rockchip_get_bank_data(bank);
 	if (ret)
 		return ret;
 
+	bank->db_clk = devm_clk_get(dev, "db");
+	if (IS_ERR(bank->db_clk)) {
+		bank->db_clk = of_clk_get(dev->of_node, 1);
+		if (IS_ERR(bank->db_clk))
+			bank->db_clk = NULL;
+	}
+
+	clk_prepare_enable(bank->clk);
+	clk_prepare_enable(bank->db_clk);
+
 	/*
 	 * Prevent clashes with a deferred output setting
 	 * being added right at this moment.
@@ -734,9 +742,8 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 
 	ret = rockchip_gpiolib_register(bank);
 	if (ret) {
-		clk_disable_unprepare(bank->clk);
-		mutex_unlock(&bank->deferred_lock);
-		return ret;
+		dev_err(bank->dev, "Failed to register gpio %d\n", ret);
+		goto err_unlock;
 	}
 
 	while (!list_empty(&bank->deferred_pins)) {
@@ -769,6 +776,12 @@ static int rockchip_gpio_probe(struct platform_device *pdev)
 	dev_info(dev, "probed %pOF\n", np);
 
 	return 0;
+err_unlock:
+	mutex_unlock(&bank->deferred_lock);
+	clk_disable_unprepare(bank->clk);
+	clk_disable_unprepare(bank->db_clk);
+
+	return ret;
 }
 
 static void rockchip_gpio_remove(struct platform_device *pdev)
@@ -776,6 +789,7 @@ static void rockchip_gpio_remove(struct platform_device *pdev)
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(bank->clk);
+	clk_disable_unprepare(bank->db_clk);
 	gpiochip_remove(&bank->gpio_chip);
 }
 
-- 
2.34.1


