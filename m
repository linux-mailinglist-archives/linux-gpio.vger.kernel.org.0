Return-Path: <linux-gpio+bounces-12839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7476F9C4C18
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 02:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 310661F21DD8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 01:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77292204F81;
	Tue, 12 Nov 2024 01:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="F3MHuWUS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m121147.qiye.163.com (mail-m121147.qiye.163.com [115.236.121.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4033020495C;
	Tue, 12 Nov 2024 01:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.121.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731376469; cv=none; b=qrCimj/0WxpX8Vvh4uDT/dfDcTKIidkn8y24xRYliz53Qxc9gSozgzF/9OvoEbUptVLVIrJTCOAj36wY58Ye+ysr9eylTX1+T6NwMqiDPP8eessPt1gmbnffjyN0Z0Opon2gwLBY74fP6DbNscToP+cop/YH+nd/VxE45B6UxS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731376469; c=relaxed/simple;
	bh=fE7zm9tjfVdPksokzMrpzgROw8rWpB41j1e8I07ChXY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rwDXE+h+iYLjzI6rtdoL1R/60vE/gEhRy5uAPAvn4MRYo/UVh4w9ioE3HpDthm5kh46Bvjyvyhmb0cJ5vd8Ex2ATBNIs6B7+JUZTSDMhi7bJDEwGECrawsq/qqI6vq2KUtmU5M8L2v4lgWV87IT/BLt36vp9UkShIsJ0OMtd9v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=F3MHuWUS; arc=none smtp.client-ip=115.236.121.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 275d3f25;
	Tue, 12 Nov 2024 09:54:14 +0800 (GMT+08:00)
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
Subject: [PATCH v5 2/4] gpio: rockchip: change the GPIO version judgment logic
Date: Tue, 12 Nov 2024 09:54:06 +0800
Message-Id: <20241112015408.3139996-3-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUtKTlZJSBkaGUweGh8eSB9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a931e141c3309d8kunm275d3f25
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRA6FQw6PzIqDho4LzRNSRoO
	GklPFDFVSlVKTEhKSExNT05NSk1LVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkhPTzcG
DKIM-Signature:a=rsa-sha256;
	b=F3MHuWUS3d7N2TMf+DeNGtdsPILAIO8YupTzq3wteHiaqL+olK0mBrcHFnMpuC24nnfkMFmf9vzEWW1Gxl+n7X97MPwUR/6DY09A7rFs6Uafk8hKCVfY94VFNAo01nyQCTTnin82eB7UOhofz6rkiNHw5IQs4jjmF1o0bZLIOtE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=02V1JqzOhH1cFyOmJm73EPScEZkCm2Urre1Jqg9gWPc=;
	h=date:mime-version:subject:message-id:from;

Have a list of valid IDs and default to -ENODEV.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpio/gpio-rockchip.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 702e711f9c23..49eaefeed8fa 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -667,8 +667,9 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	clk_prepare_enable(bank->clk);
 	id = readl(bank->reg_base + gpio_regs_v2.version_id);
 
-	/* If not gpio v2, that is default to v1. */
-	if (id == GPIO_TYPE_V2 || id == GPIO_TYPE_V2_1) {
+	switch (id) {
+	case GPIO_TYPE_V2:
+	case GPIO_TYPE_V2_1:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
 		bank->db_clk = of_clk_get(bank->of_node, 1);
@@ -677,9 +678,14 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 			clk_disable_unprepare(bank->clk);
 			return -EINVAL;
 		}
-	} else {
+		break;
+	case GPIO_TYPE_V1:
 		bank->gpio_regs = &gpio_regs_v1;
 		bank->gpio_type = GPIO_TYPE_V1;
+		break;
+	default:
+		dev_err(bank->dev, "unsupported version ID: 0x%08x\n", id);
+		return -ENODEV;
 	}
 
 	return 0;
-- 
2.34.1


