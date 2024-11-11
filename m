Return-Path: <linux-gpio+bounces-12802-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F259C368E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 03:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E442D1C20A5E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 02:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40586F06B;
	Mon, 11 Nov 2024 02:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="ibkS0lHl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m17242.xmail.ntesmail.com (mail-m17242.xmail.ntesmail.com [45.195.17.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E924A17C77;
	Mon, 11 Nov 2024 02:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.17.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731292472; cv=none; b=FdqGrUwqs2fIHLbo0mwDJgH63w5vw0pAxcsZhYuvWYhLbMHHCcNHNVk4K5rDBqKLaFbAZJq1hA2Ka3ez8AeQ9PoEvQifr/eEW4d5IAJhUUhxNo2jv1SvlUrE+hqRjLkqWWIgCRi6Yln0aQAocwVEovcxB5aPA9uedggg7BaVDQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731292472; c=relaxed/simple;
	bh=5BDb8n6Fv+ulQa9vgEfSb3hKWY2VDtO/LxU42OdLKnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MXHdL7MTrbqY3j7t8tVYNZKrhKhNTTMJTcOFxf5bCcAgY4f2ozpYFlGxCRBYvpQipDMZTtrxa+DmD6mmJZC4VDVoi6fiFWZoo0S6nXrGB8+43LYJ9hASFC/Zio6QdSvyMnTkxIej7njpwQRqk9nbYeMJPWFcMmKpYcCv4xacdDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=ibkS0lHl; arc=none smtp.client-ip=45.195.17.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 258a5863;
	Mon, 11 Nov 2024 10:34:24 +0800 (GMT+08:00)
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
Subject: [PATCH v4 3/4] gpio: rockchip: support new version GPIO
Date: Mon, 11 Nov 2024 10:34:11 +0800
Message-Id: <20241111023412.3466161-4-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh9KTVZNHx5CGUxDGEtJHRhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93191284be09d8kunm258a5863
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PyI6Pyo*LjIsGixIFQgPGDIw
	SiFPCitVSlVKTEhKSUJJT01OTU9NVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBQkxKNwY+
DKIM-Signature:a=rsa-sha256;
	b=ibkS0lHl3WAGovAqwt6I2QzJkr3o2LKQurdk4Z5wZAjREOzatBMVcF/dGwKkU/zSxY7pA1ywtJsqYzutoiDcEou7Ay18WndGAjDBqhbe1OllBtbv8F5z4jn5lUfTT10+LtL/tTl+AZV7ankSjYbdqY6DwhBZ5xv8NRgbMvmSVjY=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=bIFozn1dLdf0C7nLDaLmVsjUKMTMdSphAW8shOvyaec=;
	h=date:mime-version:subject:message-id:from;

Support the next version GPIO controller on SoCs like rk3576.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index f05b92e0e977..b7a43e492965 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -35,6 +35,7 @@
 #define GPIO_TYPE_V1		(0)           /* GPIO Version ID reserved */
 #define GPIO_TYPE_V2		(0x01000C2B)
 #define GPIO_TYPE_V2_1		(0x0101157C)
+#define GPIO_TYPE_V2_2		(0x010219C8)
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
@@ -674,6 +675,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 		break;
 	case GPIO_TYPE_V2:
 	case GPIO_TYPE_V2_1:
+	case GPIO_TYPE_V2_2:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
 		bank->db_clk = of_clk_get(bank->of_node, 1);
-- 
2.34.1


