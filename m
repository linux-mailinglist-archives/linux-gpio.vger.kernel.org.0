Return-Path: <linux-gpio+bounces-9655-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5679F96A013
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 16:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DC881C2466C
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 14:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272FE186E3D;
	Tue,  3 Sep 2024 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="QE83XfVJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m3273.qiye.163.com (mail-m3273.qiye.163.com [220.197.32.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149553BB24;
	Tue,  3 Sep 2024 14:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725372734; cv=none; b=hMgVo9uiEJlJveinDH3X9qQHhBAh6U07NCPtDS/oPGQs/u8Q4/WyFkBYHLYgOt7n/EQKSlAX6fM2NEEXrnf3AYNuAAjkv147esstGL/pZQJ0qONxFx5tPiUZHRQoldMPFFHnRk2MnRpaXaagLVfuO51tt8wMrea+SlJweNCRno0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725372734; c=relaxed/simple;
	bh=rQii0oBq5qomxiuAfZ9W2LcD4mFuZolUuTeRd2nMWV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tIk77w4QFm0kIFwLpWv9F+UXSwDGGUqmJ0PYTKvya1eMkHFoBkDuvzEB3Ini8IkkP7WLlztf+c6ZEUA2Mvjo18vRxLjAb/BH7ZnUYaR8W731Pg8+vCKZu05jHDSeQcHpId79ZjosWT6iMyRW+U5r5rpwPbR8l0qWaR5vucD69sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=QE83XfVJ; arc=none smtp.client-ip=220.197.32.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=QE83XfVJnV872hJcBU3fCDGXKPJcRmU2IbwwAUj1MFHXdryNNCujqgVyPsWLD/oY+Bdl12msXxMHPJJS9gKSgGSyQF5FfH22M9ijvEpHaubR0/f6IFqc6YKofEaaxMPfAYPKCexKbacA6Qq4HBXYe50ututOjywi/tNf7VCVFpc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=LWcU6RysEIzIJ6pAz/3hn/zvAsi9B5aKaEc9SGRcJtw=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 1E0FE7E06CB;
	Tue,  3 Sep 2024 15:37:03 +0800 (CST)
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
Subject: [PATCH v3 01/12] gpio: rockchip: avoid division by zero
Date: Tue,  3 Sep 2024 15:36:38 +0800
Message-Id: <20240903073649.237362-2-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRkfTVZCShhKH0lNH05JHUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a91b6d0d04409cfkunm1e0fe7e06cb
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pi46EBw*CTI6NEkUFhwVFSIf
	PwEaCRZVSlVKTElOSE9CS0lPTUpIVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSU9LSzcG

If the clk_get_rate return '0', it will happen division by zero.

Fixes: 3bcbd1a85b68 ("gpio/rockchip: support next version gpio controller")
Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 0bd339813110..712258224eb3 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -207,6 +207,8 @@ static int rockchip_gpio_set_debounce(struct gpio_chip *gc,
 	if (bank->gpio_type == GPIO_TYPE_V2 && !IS_ERR(bank->db_clk)) {
 		div_debounce_support = true;
 		freq = clk_get_rate(bank->db_clk);
+		if (!freq)
+			return -EINVAL;
 		max_debounce = (GENMASK(23, 0) + 1) * 2 * 1000000 / freq;
 		if (debounce > max_debounce)
 			return -EINVAL;
-- 
2.34.1


