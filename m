Return-Path: <linux-gpio+bounces-22027-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66736AE4DB3
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 21:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1389175A72
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 19:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2FF29DB78;
	Mon, 23 Jun 2025 19:40:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9765F19C554;
	Mon, 23 Jun 2025 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750707645; cv=none; b=jPJeD1xEQUKbTQeIqMfMvfAB4nJ+kuAiZlF/r9Uk2Kge82aqnKUgwHcTzj7QzL46jI7qkzDFL3PCB8geGolUoJkKEUDWAygllaPtbdhZqG15wbYT5OjKCMcYpHZiJN9xprCgFUrvO7N4ro5BMdXpw0r3S98r3BjFmI+6QTgNhBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750707645; c=relaxed/simple;
	bh=oeVpu5QnQ6dzADH8jDwya/HzQz1GbvZCFygSNBb/pdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNSfi45b9/gFkd3GjJiawHICv17k2RIcB7AvKoAtUOFaOBiRX7HuYy/DPIqFS55PKsgAlyfqHGguqjoMdn2cS/EiZiEreVPLvCp79P4NoY8tcNJaCiybZcruFzx906W7WjB+0AK4v3/t/kGMqV7Zp16P6bfuIIf+jDb8SEJPpTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [27.18.107.46])
	by smtp.qiye.163.com (Hmail) with ESMTP id 19a4befb4;
	Tue, 24 Jun 2025 00:11:23 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Tue, 24 Jun 2025 00:11:13 +0800
Subject: [PATCH 1/2] pinctrl: canaan: k230: add NULL check in DT parse
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-k230-return-check-v1-1-6b4fc5ba0c41@whut.edu.cn>
References: <20250624-k230-return-check-v1-0-6b4fc5ba0c41@whut.edu.cn>
In-Reply-To: <20250624-k230-return-check-v1-0-6b4fc5ba0c41@whut.edu.cn>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Ze Huang <18771902331@163.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ze Huang <huangze@whut.edu.cn>, Yao Zi <ziyao@disroot.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750695080; l=1429;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=oeVpu5QnQ6dzADH8jDwya/HzQz1GbvZCFygSNBb/pdc=;
 b=08O/OJqdhaptAZ8XPC9n41X9RUWWU9Fh8iHKgm7F4Qnc13ZXjUaSiy3wtcUfSlAafuPFJNgbo
 X42nDIwQZHLDjrU7DXAfzUtPZrSv+1sHvXbgEa8zvjK2qvdjbIb+EUm
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUNPVk4YTk4ZTUNNS0lMHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS0xVT01ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTEpVSktLVUpCS0
	tZBg++
X-HM-Tid: 0a979d8efcb603a1kunm95855067303bfd
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N1E6Exw6IjE1EiICCE8DTj03
	Gi4KFEtVSlVKTE5LTUJOS0NOQk5OVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS0xVT01ZV1kIAVlBSU5PSzcG

Add a NULL check for the return value of of_get_property() when
retrieving the "pinmux" property in the group parser. This avoids
a potential NULL pointer dereference if the property is missing
from the device tree node.

Also fix a typo ("sintenel") in the device ID match table comment,
correcting it to "sentinel".

Fixes: 545887eab6f6 ("pinctrl: canaan: Add support for k230 SoC")
Reported-by: Yao Zi <ziyao@disroot.org>
Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 drivers/pinctrl/pinctrl-k230.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-k230.c b/drivers/pinctrl/pinctrl-k230.c
index a9b4627b46b01237801103df566b9391f8be21b8..4976308e62372c744738dd8372e73b2494e38e0b 100644
--- a/drivers/pinctrl/pinctrl-k230.c
+++ b/drivers/pinctrl/pinctrl-k230.c
@@ -477,6 +477,10 @@ static int k230_pinctrl_parse_groups(struct device_node *np,
 	grp->name = np->name;
 
 	list = of_get_property(np, "pinmux", &size);
+	if (!list) {
+		dev_err(dev, "failed to get pinmux property\n");
+		return -EINVAL;
+	}
 	size /= sizeof(*list);
 
 	grp->num_pins = size;
@@ -623,7 +627,7 @@ static int k230_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id k230_dt_ids[] = {
 	{ .compatible = "canaan,k230-pinctrl", },
-	{ /* sintenel */ }
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, k230_dt_ids);
 

-- 
2.50.0


