Return-Path: <linux-gpio+bounces-29948-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC77CDFCAF
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 14:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 670EA300F33F
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4693A31DD90;
	Sat, 27 Dec 2025 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="bC6exZdb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1973192.qiye.163.com (mail-m1973192.qiye.163.com [220.197.31.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D895C3128CD;
	Sat, 27 Dec 2025 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840755; cv=none; b=p99jWJesJ87RQhBCf6wjfC5acHKV8BGbNhH95iElsf/Bfr1eUoXzyv7XMsXHHOCbkihv14/nxewA2ybBvcuCLRFHYaz/aTWulrrV2enFwVUJhamfNlATNsBKvvPTvJ2Cu4VYA63HPsuIsZ+9394PST9ELXpNZhgnkQiZNqEPu0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840755; c=relaxed/simple;
	bh=mai/qavLD7A2q7N+r8XyBKi8RI97KnH6yhf+yvobCew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jXH2c35eSRt/IK8g6YrjLV1zqgpYbFsBDxj4QnADfad8QYdGGL4zROnqcVm2jH5EXkP1xlhLY5oGaPJMiKB6Em+KJqaje7cQO4KhzRGj5u93rHSG87TeCffTbrUUfsY2+scMFHKWRPM20JNKO1P4802K1LnaZmtTWHiuTpQy9pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=bC6exZdb; arc=none smtp.client-ip=220.197.31.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ebf64e06;
	Sat, 27 Dec 2025 19:50:04 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 4/7] gpio: rockchip: support new version GPIO
Date: Sat, 27 Dec 2025 19:49:54 +0800
Message-Id: <20251227114957.3287944-5-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b5fa4f3d609d8kunm85cc97d2e30a05
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGRlIQlYYSR1CHRodT09DGBpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bC6exZdbJV5uWp0lB/ND7hHaFfXL7bv3RJwjGwFqc6ybX7WUaJJmHHTJiUrHZwdgiK8PXyc7jzwz+YYoLsnvuBusdD/WVfNpxSB9rl3Dg5Qnmqhq6EPInqMSP9uycCwYjQ2EZE+hy9p50IukpjR1Fphfn8hqGZ9PJQPoxIgvM8s=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=2RsNzulXAZLkL2QafonCahbYbZr1u/QuXtoWJZpywhQ=;
	h=date:mime-version:subject:message-id:from;

Support the next version GPIO controller on SoCs like rv1126b.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpio-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 47174eb3ba76..c3e831c6bcf1 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -36,6 +36,7 @@
 #define GPIO_TYPE_V2		(0x01000C2B)
 #define GPIO_TYPE_V2_1		(0x0101157C)
 #define GPIO_TYPE_V2_2		(0x010219C8)
+#define GPIO_TYPE_V2_6          (0x01063F6E)
 
 static const struct rockchip_gpio_regs gpio_regs_v1 = {
 	.port_dr = 0x00,
@@ -674,6 +675,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank)
 	case GPIO_TYPE_V2:
 	case GPIO_TYPE_V2_1:
 	case GPIO_TYPE_V2_2:
+	case GPIO_TYPE_V2_6:
 		bank->gpio_regs = &gpio_regs_v2;
 		bank->gpio_type = GPIO_TYPE_V2;
 		bank->db_clk = of_clk_get(bank->of_node, 1);
-- 
2.34.1


