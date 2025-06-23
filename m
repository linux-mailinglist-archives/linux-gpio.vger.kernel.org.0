Return-Path: <linux-gpio+bounces-22018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C313CAE4B05
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 18:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26D34188436D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 16:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94192BEC57;
	Mon, 23 Jun 2025 16:16:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A79D2BD03C;
	Mon, 23 Jun 2025 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695408; cv=none; b=YX3QaztNQNkJV+MK6D4xHBqNFtgJ2w4s1UzcAYXuLxoUrdeHkZ033t7yjt5bfCb0nG8IMg79yScW+1k+iXvj+1Kj03OtzUToWx4H+Xf2dBbK8AZ4lOpNTu+z6BOp2h75bgerpTb5iaF2/HpHallJ8zjLz5qDBn7HXGNCaka7UJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695408; c=relaxed/simple;
	bh=jQ4xlqhFn0ZfFN9Q4Ia5pnIE8D84XwipZ3o6gw4E4A0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kBwbQywHSV1zLQCTl34yuZCw1j1WkwbDUShXLqbBgM1YiY6SsKRt1tzJO5pzNZAq0N8G5d3kd9KpUeBuuuPTjMk9+769H7Vw2HDfc6REtcpjZOJH6UBvdHNouXiXSTrmO8UqVEMKpwBnZmMm/Hda8oJD10gWZUuVeFlqe2kRAgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.107.46])
	by smtp.qiye.163.com (Hmail) with ESMTP id 19a4befb5;
	Tue, 24 Jun 2025 00:11:26 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Tue, 24 Jun 2025 00:11:14 +0800
Subject: [PATCH 2/2] pinctrl: canaan: k230: Fix order of DT parse and
 pinctrl register
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-k230-return-check-v1-2-6b4fc5ba0c41@whut.edu.cn>
References: <20250624-k230-return-check-v1-0-6b4fc5ba0c41@whut.edu.cn>
In-Reply-To: <20250624-k230-return-check-v1-0-6b4fc5ba0c41@whut.edu.cn>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Ze Huang <18771902331@163.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ze Huang <huangze@whut.edu.cn>, Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750695080; l=1474;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=jQ4xlqhFn0ZfFN9Q4Ia5pnIE8D84XwipZ3o6gw4E4A0=;
 b=BW1xbdBcCeD5Ugnf74Fpk3TlQf9LeMPCirXZrokIrdcxVtCpIQPuI38jU2pfVWCVvYQvexL9R
 pTPyVkKl+cDDl7U7cGDYoKbaJG2DhGhQ7ylQ5UkFX4ruRoAhQAVyj1K
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTEodVkJNQxlDH0NMHU0aSFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS0xVT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTEpVSktLVUpCS0
	tZBg++
X-HM-Tid: 0a979d8f087203a1kunm95855067303c24
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Myo6Dio*STExLCIcTU4yTjER
	GFEaFBxVSlVKTE5LTUJOS0NCSkpPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS0xVT01ZV1kIAVlBSU1LSDcG

Move DT parse before pinctrl register. This ensures that device tree
parsing is done before calling devm_pinctrl_register() to prevent using
uninitialized pin resources.

Fixes: 545887eab6f6 ("pinctrl: canaan: Add support for k230 SoC")
Reported-by: Yao Zi <ziyao@disroot.org>
Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 drivers/pinctrl/pinctrl-k230.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-k230.c b/drivers/pinctrl/pinctrl-k230.c
index 4976308e62372c744738dd8372e73b2494e38e0b..d716f23d837f7a70993a75346561ef0b1e07c3eb 100644
--- a/drivers/pinctrl/pinctrl-k230.c
+++ b/drivers/pinctrl/pinctrl-k230.c
@@ -590,6 +590,7 @@ static int k230_pinctrl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct k230_pinctrl *info;
 	struct pinctrl_desc *pctl;
+	int ret;
 
 	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -615,13 +616,15 @@ static int k230_pinctrl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(info->regmap_base),
 				     "failed to init regmap\n");
 
+	ret = k230_pinctrl_parse_dt(pdev, info);
+	if (ret)
+		return ret;
+
 	info->pctl_dev = devm_pinctrl_register(dev, pctl, info);
 	if (IS_ERR(info->pctl_dev))
 		return dev_err_probe(dev, PTR_ERR(info->pctl_dev),
 				     "devm_pinctrl_register failed\n");
 
-	k230_pinctrl_parse_dt(pdev, info);
-
 	return 0;
 }
 

-- 
2.50.0


