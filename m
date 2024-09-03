Return-Path: <linux-gpio+bounces-9697-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD096A58D
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 19:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D506285836
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 17:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BED218E35F;
	Tue,  3 Sep 2024 17:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="a4ohL4Hl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1039.netease.com (mail-m1039.netease.com [154.81.10.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E5418BC3A;
	Tue,  3 Sep 2024 17:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385335; cv=none; b=kww1ojFO8mOFz/iuGYs45uqY0FJ2wF2txvalCRtUBV7BslFZDwuVKYyTtbFbnKcZn8x7EQFhX1Ae3hWssw7TTuozsQvYEjL/xGqhrbCMQwBrFEsoyQDhSAGRcrXK456cvv6W0AOXhklKeyur4NROvgIfCwAhMJt87qfSjYo3Xqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385335; c=relaxed/simple;
	bh=vc4ibhCpA4+1yW78pSHP7JSRblwfVrAHR54EsFS+sMk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wn164mDMLCcqI4BZ6oDX4DXnSABCLu453ByFUfLAtnMXh79EHvCTk9lh90kPGGdM6zy9VBftXs2aW8qNa+Af9NwYTikvI0twLRbgz04i5yGDpgr4KJ/wd8mvIO77PwycyrUkD/Fcs5uvh4L568t8rO7jeIII2UmTaPaP4oY6Jb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=a4ohL4Hl; arc=none smtp.client-ip=154.81.10.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=a4ohL4HlhTGP0jZauLjo3lFgPfY9LKR56FWV/mpCdiukP1y4Z1B2Its+Wx5Onl0z2/qCz8veBBULfNMFBVXUfbGBHqjSlKjSz8dyz5rw1H8XQWV5G7b+x0Ht4u8UZ2WCvGDPpJNO7pTMK81jHObSG1dB/JjGp1GZxVVhyFNnPG4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=tuUUQKIit1GImHErvUOMrTxOdciWFx+2Duf2CiFkka8=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 6C1FB7E0196;
	Tue,  3 Sep 2024 15:37:07 +0800 (CST)
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
Subject: [PATCH v3 04/12] gpio: rockchip: resolve underflow issue
Date: Tue,  3 Sep 2024 15:36:41 +0800
Message-Id: <20240903073649.237362-5-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk9JTVYeHk9JTxlNQx9CHk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a91b6d0e13409cfkunm6c1fb7e0196
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OSo6DAw4EzI9EklKFhwoFSEs
	TjwwCxpVSlVKTElOSE9CS0lDTE5MVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUxCQjcG

div_reg may be < 0 if debounce is zero, causing the unsigned int to
overflow.

Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 6dcb8bb0d1b4..26191197cd37 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -205,8 +205,11 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	unsigned int cur_div_reg;
 	u64 div;
 
-	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
+	if ((bank->gpio_type == GPIO_TYPE_V2) && !IS_ERR(bank->db_clk))
 		div_debounce_support = true;
+	else
+		div_debounce_support = false;
+	if (debounce && div_debounce_support) {
 		freq = clk_get_rate(bank->db_clk);
 		if (!freq)
 			return -EINVAL;
@@ -217,8 +220,6 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 
 		div = (u64)debounce * freq;
 		div_reg = DIV_ROUND_CLOSEST_ULL(div, 2 * USEC_PER_SEC) - 1;
-	} else {
-		div_debounce_support = false;
 	}
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
-- 
2.34.1


