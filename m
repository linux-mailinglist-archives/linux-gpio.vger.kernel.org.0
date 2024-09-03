Return-Path: <linux-gpio+bounces-9611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 520F39695F1
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 09:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0D6D1C21553
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 07:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE391DAC60;
	Tue,  3 Sep 2024 07:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="eHCUsYDi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1039.netease.com (mail-m1039.netease.com [154.81.10.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A911D54ED;
	Tue,  3 Sep 2024 07:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725349640; cv=none; b=hA5nJmoRzmoSh6qOeLYnLs9vWb/LA4xFZcAT03GdVuddj7BVLDdMaHT0a+rtI8pFn/q1mVTiLK6GpClK2lAr4PRyIi9y6wk6c28kBsl1wtEqWpGa+tOlQwpMVLrDvrPrfBNjBUXQeZX/OILYkDTzOAwwSLxMLGvcFF3zELChzdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725349640; c=relaxed/simple;
	bh=hCiHTK06w23Zddhqps2mwwk9BO3ccbhl0gJYWdWVIHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sCPNSBFb3cAcKeVb1ShLGvXzkTWLfJPmOgMQNw7BHqXocDiAPDRPdTLna4Q4jZtWcKcU1WHJhmKvzBVsYZmYQG975drYRqkmYPP6RpmmFv/QGUqUvtt8F4+jL9vQ6n5oHAfoN8G3w2mrq6mRM5fterN9DzyH2Ia4WVzOpl8ytBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=eHCUsYDi; arc=none smtp.client-ip=154.81.10.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=eHCUsYDijVCUcxN5WpfM6rMoU/EtMl+FlpL0m4xDYX/kWcYs4aTZhpNYUnP864K/69dIWzDEpmNOtPg3TdSKD1ephNOcFUvyLoXvfLg7nfij5uiSrmanrAa9aTZs/2xewbQx5kp2QEA2QBbD1zIuH6qhP7Us7xa6TMzFDhCfzOo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=gdGxnEFCwoF+dZLxfO/pczGvZ3xJZOxamH4IgiqR/d4=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 046827E06E6;
	Tue,  3 Sep 2024 15:37:05 +0800 (CST)
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
Subject: [PATCH v3 03/12] gpio: rockchip: resolve overflow issues
Date: Tue,  3 Sep 2024 15:36:40 +0800
Message-Id: <20240903073649.237362-4-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNNGlZJSxodSx0fGB5MSkhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a91b6d0dbcf09cfkunm046827e06e6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MSI6CDo*EDI6PEkVSxxMFSke
	NTkwCktVSlVKTElOSE9CS0lMSElDVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUNPSTcG

Prevent overflow issues when performing debounce-related calculations.

Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 5f60162baaeb..6dcb8bb0d1b4 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -22,6 +22,7 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/units.h>
 
 #include "../pinctrl/core.h"
 #include "../pinctrl/pinctrl-rockchip.h"
@@ -209,11 +210,12 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 		freq = clk_get_rate(bank->db_clk);
 		if (!freq)
 			return -EINVAL;
-		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
+		div = (u64)(GENMASK(23, 0) + 1) * 2 * HZ_PER_MHZ;
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


