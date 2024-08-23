Return-Path: <linux-gpio+bounces-9073-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A765595D173
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 17:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 573ADB220F6
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 15:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90C618859D;
	Fri, 23 Aug 2024 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="PG0X56dX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m3299.qiye.163.com (mail-m3299.qiye.163.com [220.197.32.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5810538DCD;
	Fri, 23 Aug 2024 15:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427139; cv=none; b=gCm9cPEFqypORUT0FeDlFP78nPhiCAVFcLDkG0KYKIqHuOF2t9mjODFDStyiPP+A0XRMUUCkLCPhl9smwb5Djaw8b7mnf3v4Qaze7qYTdBiyvuhSHfNK0zW4w28fIG5z3RcyO4EM7CUPkmJuaW3ievmnUOCdnsre4fTI3AlcYlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427139; c=relaxed/simple;
	bh=rQii0oBq5qomxiuAfZ9W2LcD4mFuZolUuTeRd2nMWV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MFovFPs7gzelrFF01TJuGiZDE1SK4krvMY1q/y3t7yJQkO2wRVIflgDRhdVKjkamINBmb+9x9TpY5f3j7ffZ2R6zYL6UpoPK1d4YybETHxoroCnsCpY22AejziclyvmBDpiMZtHLLTLJJ8AxwXzfkAZOIYSDJabTsvi8RWixM2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=PG0X56dX; arc=none smtp.client-ip=220.197.32.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=PG0X56dX9eS7NjdXgLPOYU0ccjHLv3nwxAItYxLTOFxjR6cOYun4xYfG/hM7dJBLMuXH+eTNZ6fyYCL7JM8tfi6aLTBPoa2nDMzd6hcmaVRNkNZJaocLX2/yZ0zmVK4jKBNSnNj6fOv8S936safpH+ZnsuRgqstXXHVadwkg1Z0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=LWcU6RysEIzIJ6pAz/3hn/zvAsi9B5aKaEc9SGRcJtw=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 769137E0207;
	Fri, 23 Aug 2024 11:44:58 +0800 (CST)
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
Subject: [PATCH v2] gpio: rockchip: avoid division by zero
Date: Fri, 23 Aug 2024 11:43:04 +0800
Message-Id: <20240823034314.62305-2-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUgdSlZLHk9NH01MQkJPTx5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a917d56633709cfkunm769137e0207
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODI6Gjo5KjI3MCxCTjYpTg0p
	ChQKCT5VSlVKTElPSENPTUJCTEpMVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUhDSTcG

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


