Return-Path: <linux-gpio+bounces-9653-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBDC96A011
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CFFF285650
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0302118453F;
	Tue,  3 Sep 2024 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="IUKg42GN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m3270.qiye.163.com (mail-m3270.qiye.163.com [220.197.32.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554EE3C485;
	Tue,  3 Sep 2024 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725372733; cv=none; b=CuUH5SomoasE7tDw+5fFEz65U0wgFCw+GKBJRpOfBbCHc0mN535kvMCGUsVUVwnDkSov0CJrpHXpyxficb6tS5s57da8F2Iyn0pkKDtxKnLOOR3ZOfZuIsj0tT+lcy4mF7sQrIY4IHjR49gGNcq6NJWK7fGH+Q2R0Wh3GtFF6Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725372733; c=relaxed/simple;
	bh=B2hSD/hfy8ZZHjqE3dI25ob3WX7HmZH+tuiyzq6q/J8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PCPslDkn6NxDCoNlr6ZSdJESXQd2LuuApQFc+7Q76l+w/kp492sa+cNWCr6phphvzSckhToiHl8MbHcxlCfc//YJe9xGxpp0oysEQvoXalDOmebPUQYjOEpARENs350M3/D8RhgF8GqvAoGVk/skXl4jPD3mOAF0WPTmES5tZ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=IUKg42GN; arc=none smtp.client-ip=220.197.32.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=IUKg42GNT3xefHxZljlCyU0i5Ir/n0Tdxfi7ukaqzx/HGz+c4C/Idpy4zESZzqtC+jSEj0N09lQzk/dLj2E3YOLA/4szuvdCjKxw6CHBIh9oPIdzHOKMqYiGb1FeEyhCMHzmvRhc09QFRUi/Wb0f4QaqCxH8AXHk8KvtEAYkVmU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=i3Ih0qHoA8BaoqENjDe44S2TQECjEhO9KvAw8e9oDoQ=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id D3C227E03F6;
	Tue,  3 Sep 2024 15:37:08 +0800 (CST)
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
Subject: [PATCH v3 05/12] gpio: rockchip: fix debounce calculate
Date: Tue,  3 Sep 2024 15:36:42 +0800
Message-Id: <20240903073649.237362-6-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ04dTFYYTE1PQ0MZTklLGUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a91b6d0e6d209cfkunmd3c227e03f6
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NS46Aww6IjIrS0kZLBJKFRhO
	H1FPFDVVSlVKTElOSE9CS0hLSktIVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUJDSjcG

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
index 26191197cd37..75355f799751 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -213,13 +213,13 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 		freq = clk_get_rate(bank->db_clk);
 		if (!freq)
 			return -EINVAL;
-		div = (u64)(GENMASK(23, 0) + 1) * 2 * HZ_PER_MHZ;
+		div = (u64)(GENMASK(23, 0) + 1) * HZ_PER_MHZ;
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


