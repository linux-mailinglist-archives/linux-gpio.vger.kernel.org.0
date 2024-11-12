Return-Path: <linux-gpio+bounces-12841-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD769C4C45
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 03:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AFA2B2594D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 02:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F17205ABF;
	Tue, 12 Nov 2024 02:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="fu2EHIOx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m127109.qiye.163.com (mail-m127109.qiye.163.com [115.236.127.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E7F433BE;
	Tue, 12 Nov 2024 02:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377385; cv=none; b=rJlMrXRj4Lp0DDNEam5CmiqLWcswMP3uH80zBGUUyme0DOKk4trW97hxoDk8vFUhnOZwszAvW85VIIITOkc43ZDajdMubkhU/g6ZmCXsPYcakGfktjyz7cUBftdoAPnyE89fUyZM17Qx57d4Lkjop8lDIHg2jPnsmcL4IQFa4cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377385; c=relaxed/simple;
	bh=ahjzUqaMdUrAy2wp/VjVAPMXaYb2DOZSLGxot3Mi9ww=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q8nG1uGcSPoubxl1gBJlb2mAfbYOPufPoFYPaaPa380yJBs7rMKu2nidmhSRCRRVrO5+M9JGu/K4WLZ4DhQO6tDlm/RFimJY/dtuD4U7ocHgLfi/cs+pkQIyKYWgbHy4TDJAiXDsopIdVYHzde1kLY7umy+dUcUoKkL22pEWOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=fu2EHIOx; arc=none smtp.client-ip=115.236.127.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 275d3f2e;
	Tue, 12 Nov 2024 09:54:16 +0800 (GMT+08:00)
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
	elaine.zhang@rock-chips.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 3/4] gpio: rockchip: support new version GPIO
Date: Tue, 12 Nov 2024 09:54:07 +0800
Message-Id: <20241112015408.3139996-4-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU4fTVZKTkpCGR9LS00eHh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931e14225209d8kunm275d3f2e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAw6GCo*CzIvPBorLzVJSSkK
	DwtPCj9VSlVKTEhKSExNT05MQ09OVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkpLQjcG
DKIM-Signature:a=rsa-sha256;
	b=fu2EHIOxhvP7wViWjo2YWfrsP9JuePzfDSPnG2LygmO3peRTME+AGx8WyAuLoKE6O6Fjzl/R5Gw97G+cJob66OkJe/KTTZRECzxPwv82N6HoyhpyuHy0Lg4gvdwkPSCXFTH/U+jqSClzdEVK7/2i9OJAUmC6M9TsWHp6/A1Vfbo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=KJVrsNmQEFDEWaKv1z6mIltDd6uza/zB/f3D7dwvf3A=;
	h=date:mime-version:subject:message-id:from;

Support the next version GPIO controller on SoCs like rk3576.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpio/gpio-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 49eaefeed8fa..c090cac694bf 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -35,6 +35,7 @@
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
 #define GPIO_TYPE_V2		(0x01000C2B)
 #define GPIO_TYPE_V2_1		(0x0101157C)
+#define GPIO_TYPE_V2_2		(0x010219C8)
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
@@ -670,6 +671,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	switch (id) {
 	case GPIO_TYPE_V2:
 	case GPIO_TYPE_V2_1:
+	case GPIO_TYPE_V2_2:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
 		bank->db_clk = of_clk_get(bank->of_node, 1);
-- 
2.34.1


