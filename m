Return-Path: <linux-gpio+bounces-9053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5253B95CD75
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5B90B233DB
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 13:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3A01865F5;
	Fri, 23 Aug 2024 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="jiTn11vt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m3288.qiye.163.com (mail-m3288.qiye.163.com [220.197.32.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA6816BE14;
	Fri, 23 Aug 2024 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724418748; cv=none; b=qOAHWIijxVwYptq6T70za4rN+TK6EyhnpgOny/HWwcM9slxCgBXdcrCbukd/z/uxLHJPolsQDf+WYyf3hEM8Eqm4TvMLmdZEBK50gVLOAuyrByc5ZdVSC2vllMKWYNtEY8pie+lOQfa9le79o1tfCVlVhN57yytH/WG/cdRuxvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724418748; c=relaxed/simple;
	bh=1VfQbjWS+6z2mD0CQrtZvs5NWWR86HhjlnQAFqhZ9Tw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vv2plvnQyuKJYzD59TM4Cg+r4wsWcqNftkLqJ/ROyZBnX+DyCkXN+DtcvIJPpp7iEQH9ORnPpSmmvyuFUaBnCDZplTT8OkM/cFVKfZzUZh/u3i1hNCP80zffbKVz8B6unVZ9TDy7VJD0laLfG+YywsP+QQ6AGtlgm8N/fbCbXZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=jiTn11vt; arc=none smtp.client-ip=220.197.32.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=jiTn11vtYuDeWdB68667tgi9pyyqszmnApIkCNbVnsqAk4SxE9WfnEP9itMvgfhuO4lxjpYN86CzGINoICX16MLvxRY1OPz6NOtY10C6HmKPngLd+rp5Q5SNrwCcM8tcZu6CbyTLV7vCnhUeRI+BTjWLEFzupkmMl7d/1XVbHU8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=AludWvTyCsSnun1czF/Np2s2IMxYrPapHyVaGwssSEk=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 7A1507E03D5;
	Fri, 23 Aug 2024 11:45:02 +0800 (CST)
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
Subject: [PATCH v2] gpio: rockchip: resolve underflow issue
Date: Fri, 23 Aug 2024 11:43:07 +0800
Message-Id: <20240823034314.62305-5-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkJMTVZJTk4YTE1KQ0lPT0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917d5672e609cfkunm7a1507e03d5
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MSo6HTo5FjI4KCxRCTYIThAO
	LhIKCzlVSlVKTElPSENPTEtITElNVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUxOTTcG

div_reg may be < 0 if debounce is zero, causing the unsigned int to
overflow.

Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index bf22b103b6a2..c3a87d075908 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -204,8 +204,8 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	unsigned int cur_div_reg;
 	u64 div;
 
-	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
-		div_debounce_support = true;
+	div_debounce_support = (bank->gpio_type == GPIO_TYPE_V2) && !IS_ERR(bank->db_clk);
+	if (debounce && div_debounce_support) {
 		freq = clk_get_rate(bank->db_clk);
 		if (!freq)
 			return -EINVAL;
@@ -216,8 +216,6 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 
 		div = (u64)debounce * freq;
 		div_reg = DIV_ROUND_CLOSEST_ULL(div, 2 * USEC_PER_SEC) - 1;
-	} else {
-		div_debounce_support = false;
 	}
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
-- 
2.34.1


