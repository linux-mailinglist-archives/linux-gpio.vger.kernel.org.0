Return-Path: <linux-gpio+bounces-8756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0D8952A0B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 09:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7431B224B0
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 07:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2058183CDD;
	Thu, 15 Aug 2024 07:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="kIJSRYOW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m1011.netease.com (mail-m1011.netease.com [154.81.10.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6E6179965;
	Thu, 15 Aug 2024 07:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723707743; cv=none; b=g5H4LuLEeiw07o/p1n+HwMSBlaQdXO3TuQlhO3OdwSNSLQLLL56HbrnhoPMR22xJA5Slu134X+jphSYISEMNSQTs25523oYc9Hoawr8K8x+fUIzc+YrxVMk8U6r5UXFmz2r6uCFw/BzxBWa7l4YWGd9NFVD/hV63hQI8P406V80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723707743; c=relaxed/simple;
	bh=TMw1J3WRNSf1HULFQnXoxUDJBUdiSKByVK/H+ALM0Ac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WGM9PWKylkJV7h6aj2e/t5BjVn8Izm2YF8RC2Lbt/95nKKt1zbeV3FDvGHZMLllbLpXO30HXFUUHu9vN3Mu4eq8UnPW3tHX6JwQSQigVAHnEX4nVEFWhprnoSsCnhyroW80bni1oAGjrcxaFzs962mKDT0K3vZHygDlKPJjbhN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=kIJSRYOW; arc=none smtp.client-ip=154.81.10.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
DKIM-Signature: a=rsa-sha256;
	b=kIJSRYOWf1NbBI0Z4aJx7NOrs7padLP6aFkeqA15yJcQSOkYfGCG9JaIn57sU3FT50wcB2oGGn2km20AalEbRShkL0VT11R0M2ZS8D2jDLxvuMawhIHlFaQFFbzhvuS4fc+sZLw14XeVfCmleheoov/ePeE9ipMKMCMwS0siaNk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ZXDKYDxb8/Z3wgTYIrp6fPv247TBs7d7CIyWIE94EEE=;
	h=date:mime-version:subject:message-id:from;
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 32CE87E03C8;
	Thu, 15 Aug 2024 15:17:22 +0800 (CST)
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
Subject: [PATCH v1 3/5] gpio: rockchip: Set input direction in irq_request_resources
Date: Thu, 15 Aug 2024 15:16:49 +0800
Message-Id: <20240815071651.3645949-4-ye.zhang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh4aQ1YaQ0JJHhodQhkaSk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9154e5f70d09cfkunm32ce87e03c8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K0k6CDo6CDIzOUM#QyoxKFEh
	Dy0KCwJVSlVKTElITEtNSU9ISE5NVTMWGhIXVQIeVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlXWRIL
	WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUpMTTcG

Set input direction to avoid FLAG_IS_OUT in gpiochip_lock_as_irq

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 drivers/gpio/gpio-rockchip.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index b2f26a16b1f6..8949324ed816 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -475,6 +475,8 @@ static int rockchip_irq_reqres(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct rockchip_pin_bank *bank = gc->private;
 
+	rockchip_gpio_direction_input(&bank->gpio_chip, d->hwirq);
+
 	return gpiochip_reqres_irq(&bank->gpio_chip, d->hwirq);
 }
 
-- 
2.34.1


