Return-Path: <linux-gpio+bounces-9019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9D195C3F0
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 05:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A415C1F2456F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 03:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1263FBA5;
	Fri, 23 Aug 2024 03:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Bz9IFpiy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1973196.qiye.163.com (mail-m1973196.qiye.163.com [220.197.31.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EBF762D0;
	Fri, 23 Aug 2024 03:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385137; cv=none; b=BdMjmLPGUYX1h0wFxOZze2b63j9G6p/5Uu+rs88awWgv8+aIyGSXWZjLu7fSNyn8YabBZAdKURRgwE9Hl/WDhNHiu6DnET+a2jYls3gT+OtQD2z+ZBXYIQIgYUkDdFDkRT9Cbhngzfb/sqF7t6MTfBeoTzAgfLoqZ/zrWRXiXNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385137; c=relaxed/simple;
	bh=OnYJ8PxUrRxU8L463SDY13PSihEaaPnMtZlOg0qTBl8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mnEkILBdSPaSB5zx1YpmqhQBELbHfvBez/7QNf6pqxsZttJfq7RVPh+Quj/v2g9vcdW+zb3KK51TOUbnY7MDv7kpSpX2YHiUvbGe6+Eu3k+FkdxOxsxI/ZVou5ks+cz/njh2YgeyCgF0pRwLlD57pHnx9wOvZat2cEX6XQUK1Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Bz9IFpiy; arc=none smtp.client-ip=220.197.31.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=Bz9IFpiy268CyAP1qfIFGlZ/ayx6Mtjr+z9BhGwIX3Ocl1WXhpPM2xIFAy4ewpcFiMdazmkhSqFjljgn9ZRfKkeUZ3QZZHK7Cse3rkuEi9Ir8ln9WaJR2jSQuJMzwolH0xT7VX8hSHYIDU7MMOG+e5kUysSq/wO6sISDB+by0iw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=vfagnm/2cZBspp0iuuHjQlsoD4A5ZXzku9bzq7Fy2kI=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 2E8007E03DF;
	Fri, 23 Aug 2024 11:45:01 +0800 (CST)
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
Subject: [PATCH v2] gpio: rockchip: resolve overflow issues
Date: Fri, 23 Aug 2024 11:43:06 +0800
Message-Id: <20240823034314.62305-4-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0MeGlYdHkwfQhodSBgfQh1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917d566dcd09cfkunm2e8007e03df
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBg6Kio4TzI3KCweTjQ9ThEa
	PRoKCx1VSlVKTElPSENPTEtJSEJLVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSU5DTDcG

Prevent overflow issues when performing debounce-related calculations.

Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 5f60162baaeb..bf22b103b6a2 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -209,11 +209,12 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 		freq = clk_get_rate(bank->db_clk);
 		if (!freq)
 			return -EINVAL;
-		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
+		div = (u64)(GENMASK(23, 0) + 1) * 2 * 1000000;
+		max_debounce = DIV_ROUND_CLOSEST_ULL(div, freq);
 		if (debounce > max_debounce)
 			return -EINVAL;
 
-		div = debounce * freq;
+		div = (u64)debounce * freq;
 		div_reg = DIV_ROUND_CLOSEST_ULL(div, 2 * USEC_PER_SEC) - 1;
 	} else {
 		div_debounce_support = false;
-- 
2.34.1


