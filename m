Return-Path: <linux-gpio+bounces-9020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A62FD95C486
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 07:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31775B2394A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 05:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F101924B29;
	Fri, 23 Aug 2024 05:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="U3IO2ifS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1039.netease.com (mail-m1039.netease.com [154.81.10.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC59522EEF;
	Fri, 23 Aug 2024 05:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724389338; cv=none; b=NUcew9esLjdDS+VHo85xvySS6MFEFxUh13AlSpG1+ob0Auo9TmbsSYvjiXDBBTE2xLq5cnYinf0qY/29Jw6h+tHV2jo7Q95SfVJHNsXgSj59zNQm0d7A4pLmidLBG0blPNIFRWNc1y8v1sBRloAWDRX68fJdDF4IiQ+rmqqYD3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724389338; c=relaxed/simple;
	bh=U6EnM8BEPvbVip7JrWNu2UhZAytitRU596asDYnBXSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j/vPrDDNwGpGhr+M6gb8Z9QleaUyvwRrnpDsdCDA4jXw+HdCWr8KHfIFJGtT4xioewsvWO5mINAiaQt68egXKkqLbrsf+/cLDyLf8007yj+N0WXvNqHj9iIoFStkjsVpc8/0Jcqjn3qoHghF1ueP9nJTGQfaGkzuCdvUHmc4tPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=U3IO2ifS; arc=none smtp.client-ip=154.81.10.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=U3IO2ifS7bZblh3ncfTheL87g+du6/V6JCW4kDK4mo0x8c9l1ZUFVVk9k7JaNuHnvk9D7ySpglR/VmbqGhDZSrWVhiJsJQZ4vLpcDlZ1YMCknJMKqa5obU3+ngZURhD+yH36/58ZkzqjjNqyDEaPjPjQ9ukB6EhTP/aSrtQsyeU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=RWY1mGIMsLUT7JW6qJplDPglts8Ocj6h19INpsPBB+E=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id CBE9A7E039B;
	Fri, 23 Aug 2024 11:45:03 +0800 (CST)
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
Subject: [PATCH v2] gpio: rockchip: fix debounce calculate
Date: Fri, 23 Aug 2024 11:43:08 +0800
Message-Id: <20240823034314.62305-6-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhgfHVYaGU9LSExCT01KGB9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917d56782309cfkunmcbe9a7e039b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PhA6Cgw4CTIrQywfCTY4TgkC
	EDkKCwNVSlVKTElPSENPTEtOS0tOVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUJOTDcG

The previous configuration ensured that signals with a duration greater
than the debounce value would always be detected, while signals with a
duration less than debounce / 2 would always not be detected. After the
modification, it is changed to ensure that signals with a duration greater
than 2 * debounce will always be detected, while signals with a duration
less than debounce/2 will still not be detected.

Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index c3a87d075908..c246f116a3b5 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -209,13 +209,13 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 		freq = clk_get_rate(bank->db_clk);
 		if (!freq)
 			return -EINVAL;
-		div = (u64)(GENMASK(23, 0) + 1) * 2 * 1000000;
+		div = (u64)(GENMASK(23, 0) + 1) * 1000000;
 		max_debounce = DIV_ROUND_CLOSEST_ULL(div, freq);
 		if (debounce > max_debounce)
 			return -EINVAL;
 
 		div = (u64)debounce * freq;
-		div_reg = DIV_ROUND_CLOSEST_ULL(div, 2 * USEC_PER_SEC) - 1;
+		div_reg = DIV_ROUND_CLOSEST_ULL(div, USEC_PER_SEC) - 1;
 	}
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
-- 
2.34.1


