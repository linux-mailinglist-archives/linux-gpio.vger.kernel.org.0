Return-Path: <linux-gpio+bounces-12804-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3027A9C3692
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 03:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8AF81F21097
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 02:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2D3143871;
	Mon, 11 Nov 2024 02:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="S4nbMRNX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m244.xmail.ntesmail.com (mail-m244.xmail.ntesmail.com [45.195.24.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94B13B592;
	Mon, 11 Nov 2024 02:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.24.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731292477; cv=none; b=MuuVuglh9Qn+OK1Eh4DWsMLGjp1EzCJ7FBTGhUUTB/V5ueRDSVqhj6J2GlhaHVCZHxVkwijO2DZKtXNHOPbk5l7ircexcaocZIjg8WRXZYyV/aWG8URg6KCasFGCD7vHRXmXcS3EBT2DX/ZXpXRX+NcbyajCacj3Lvj7JzhZO98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731292477; c=relaxed/simple;
	bh=k31nfqs4XLuqABw+CYqLzarfy971jg3wjtFI/OPU2Vo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JX4bXWCvhQ2JxSXIRZ9/mnX+zMIoop5CF1JF6hntTkvQjGkKOdXBqxcIOWZbx+fNxhbHQ6NvnSJKUiIFN9vPPrT+aNGhzZMS+HAfler/1SvJwmstHkgO1ffbr7MSzTPlYxmex7H+e8vyv6BZOvNaT7GG3IFLuewTrGpyExj0stA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=S4nbMRNX; arc=none smtp.client-ip=45.195.24.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 258a586a;
	Mon, 11 Nov 2024 10:34:25 +0800 (GMT+08:00)
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
Subject: [PATCH v4 4/4] gpio: rockchip: Set input direction when request irq
Date: Mon, 11 Nov 2024 10:34:12 +0800
Message-Id: <20241111023412.3466161-5-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ08fSVZIHUJMHU9JH0xLGUNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9319128a6a09d8kunm258a586a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODo6Exw4IzIfCiwBMw4xGDwN
	LBRPCRlVSlVKTEhKSUJJT01MSUtKVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBQkxJNwY+
DKIM-Signature:a=rsa-sha256;
	b=S4nbMRNXQ3eIAPG7NtbSJ2jTJJEm67pkoMh0tQThPPA69ReLy4qvuPUjnOY8dTv+sNY4CgwNRfrSFeCtucZnG4AiAXrQi9aIIKakdR2IK1wbuG6HTjYpmljpsbNf5C1TfPrjKAvLCLlQ7Boe02/1kr/q8nEsO6PQotNNHFxn1qA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=wA6Lfw0pVK4KIHrVEahwSZAHmfqAeDyaeLLez6Fbs2s=;
	h=date:mime-version:subject:message-id:from;

Since the GPIO can only generate interrupts when its direction is set to
input, it is set to input before requesting the interrupt resources.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index b7a43e492965..40c2476699aa 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -476,8 +476,11 @@ static int rockchip_irq_reqres(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct rockchip_pin_bank *bank = gc->private;
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 
-	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
+	rockchip_gpio_direction_input(&bank->gpio_chip, hwirq);
+
+	return gpiochip_reqres_irq(&bank->gpio_chip, hwirq);
 }
 
 static void rockchip_irq_relres(struct irq_data *d)
-- 
2.34.1


