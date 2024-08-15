Return-Path: <linux-gpio+bounces-8757-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BC1952A0A
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 09:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D07B1F22C77
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 07:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F201318005B;
	Thu, 15 Aug 2024 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="gzncVyWX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1011.netease.com (mail-m1011.netease.com [154.81.10.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB317AE1E;
	Thu, 15 Aug 2024 07:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723707743; cv=none; b=r9K3bCnHS2+9aWgYngBWk4DKf17cdKEjPWRcy3y36EgogoRMd7RFLAGjgiA+oLzzJpgb1fGv9T0Ta+KUNnb4x9H4sR6OgHxDADS/z0y8KOBNTTzNE3LOmwaqsV9DHlhxENeUqPtyJMSr3pVX+BxQOVyjT/jc8Bl1BOW3LzzRIc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723707743; c=relaxed/simple;
	bh=IUoU0evK108cGwUabHeOJiFilA00P3KteYqQNAOXZis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gb3oRGlsJZja/48pQz/C7MfUBJonMlZkCvwyJ8x3H+YOdp8vu0Ay3Gn7ojkU/XuSvE5G+dPmPnysvCNx8OwPwb1ENiF89F7GmYmMM12OLDcGYieXMWfB4t/Jf3WLyG0FxDce0CEaxDwFj1gLBGm294Z9EFXlK95+NdhSStfSzHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=gzncVyWX; arc=none smtp.client-ip=154.81.10.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=gzncVyWXfocTxrJzIY8LGR51gA747d2sNU9qBnLbkbv82O0/Ur09Gan27GLh6EAT/vX31oCRKDbJn0BqfOx2D3F81Qfkh+2MRix8qEUNEGIhZ9kmtB4cYkXyfMKTMQHMg6x2PoFPhQTj8XO54RUFVjyEDkGvTSR+HcbzKqPwabw=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=2QShOFaveS16tJsLgPPj33xTluN1/nR9oSlDVNUkxAk=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id E03E07E0375;
	Thu, 15 Aug 2024 15:17:20 +0800 (CST)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: [PATCH v1 2/5] gpio: rockchip: support GPIO_TYPE_V2_2
Date: Thu, 15 Aug 2024 15:16:48 +0800
Message-Id: <20240815071651.3645949-3-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
References: <20240815071651.3645949-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhlCQ1ZMGk9DTUIaS0JDH0pWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9154e5f20209cfkunme03e07e0375
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PTY6Cyo5STIwLUNONCohKFET
	HgNPFDNVSlVKTElITEtNSU9JS0JNVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUxJTjcG

Support GPIO_TYPE_V2_2

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 251961a876a9..b2f26a16b1f6 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -32,6 +32,7 @@
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
 #define GPIO_TYPE_V2		(0x01000C2B)  /* GPIO Version ID 0x01000C2B */
 #define GPIO_TYPE_V2_1		(0x0101157C)  /* GPIO Version ID 0x0101157C */
+#define GPIO_TYPE_V2_2		(0x010219C8)  /* GPIO Version ID 0x010219C8 */
 
 #define GPIO_MAX_PINS	(32)
 
@@ -624,13 +625,17 @@ static void rockchip_gpio_get_ver(struct rockchip_pin_bank *bank)
 {
 	int id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
-	/* If not gpio v2, that is default to v1. */
-	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
+	switch (id) {
+	case GPIO_TYPE_V2:
+	case GPIO_TYPE_V2_1:
+	case GPIO_TYPE_V2_2:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
-	} else {
+		break;
+	default:
 		bank->gpio_regs = &gpio_regs_v1;
 		bank->gpio_type = GPIO_TYPE_V1;
+		pr_info("Note: Use default GPIO_TYPE_V1!\n");
 	}
 }
 
-- 
2.34.1


