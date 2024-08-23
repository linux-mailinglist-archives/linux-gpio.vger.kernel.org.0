Return-Path: <linux-gpio+bounces-9074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D65895D16F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC8521F237EA
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32721185E65;
	Fri, 23 Aug 2024 15:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Y846mzsG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m19731125.qiye.163.com (mail-m19731125.qiye.163.com [220.197.31.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E50188920;
	Fri, 23 Aug 2024 15:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427144; cv=none; b=kiYGTLrDgJqdKSRwbFDqT4H/kRvcTu/Gitvbcv/mTnw2v/9oLG3s8k+OSiX09Ci0/Rx8Us1Y49ASAnOy6nJo7JGk1UM8rwnGaCQwI3RMdzP0n5QLo7NrUqPY25MebHqCkjTJuad76zYvMgbq7lG2t3gXaHcibotcZCeKBxEOe8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427144; c=relaxed/simple;
	bh=tfaCEzlZ1LhNiIKfeFVTZb7lDH70RxZS7nJf7Bmy8lc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sktty+zia/BrQx31CZFalClGlytjv473SwKocoskaLh35ZrHIdu7Qjm18Y778KcVlfo7lu/7GSKPizl8ApCVTRpq8YHDxOXSOwr/UP6egCN4CAON2dVKliSd7JQtY+m79r4M+4dG7f4K3/fM+aHihhWxmcCrcahuYA4pY8MxMP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Y846mzsG; arc=none smtp.client-ip=220.197.31.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=Y846mzsGjepE5I9zVGhtEOkuo/VziAacg1VazjQ73SxbNO8es21Y8Wk7eQ+FsBKIpOVQV6e2JMBk1Z7e/U0kfnZYFx2pwbO2Z831PHwqbhl63jt43mvlIwZziWq0FHlIq0oZY0LYMQajFgOuWcGClgoFtZkGhkBDYGxRWSUpb+U=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=L9GlpNjSE4nJJrkD+TrY66Rr2oSAqGgJJBgFwS4eF04=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 1C02E7E03CC;
	Fri, 23 Aug 2024 11:45:05 +0800 (CST)
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
Subject: [PATCH v2] gpio: rockchip: Update debounce config function
Date: Fri, 23 Aug 2024 11:43:09 +0800
Message-Id: <20240823034314.62305-7-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhpIGlYaGkNISx5DHkweHkNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917d567d1e09cfkunm1c02e7e03cc
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MzI6FRw6SDI8EixIGTYzTgge
	VksaCitVSlVKTElPSENPTEtNSUxNVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSElCTDcG

In the GPIO with version number 0x01000C2B, debounce configuration is
already supported.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index c246f116a3b5..aff8bec79062 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -250,6 +250,8 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 			clk_prepare_enable(bank->db_clk);
 		else
 			clk_disable_unprepare(bank->db_clk);
+	} else {
+		return -ENOTSUPP;
 	}
 
 	return 0;
@@ -278,22 +280,11 @@ static int rockchip_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				  unsigned long config)
 {
 	enum pin_config_param param = pinconf_to_config_param(config);
+	unsigned int debounce = pinconf_to_config_argument(config);
 
 	switch (param) {
 	case PIN_CONFIG_INPUT_DEBOUNCE:
-		rockchip_gpio_set_debounce(gc, offset, true);
-		/*
-		 * Rockchip's gpio could only support up to one period
-		 * of the debounce clock(pclk), which is far away from
-		 * satisftying the requirement, as pclk is usually near
-		 * 100MHz shared by all peripherals. So the fact is it
-		 * has crippled debounce capability could only be useful
-		 * to prevent any spurious glitches from waking up the system
-		 * if the gpio is conguired as wakeup interrupt source. Let's
-		 * still return -ENOTSUPP as before, to make sure the caller
-		 * of gpiod_set_debounce won't change its behaviour.
-		 */
-		return -ENOTSUPP;
+		return rockchip_gpio_set_debounce(gc, offset, debounce);
 	default:
 		return -ENOTSUPP;
 	}
-- 
2.34.1


