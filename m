Return-Path: <linux-gpio+bounces-7240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF728FE6F3
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 14:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 381AB28375F
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 12:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D90195F02;
	Thu,  6 Jun 2024 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="JzPFRzXl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534061953BE;
	Thu,  6 Jun 2024 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678686; cv=none; b=Nmc7NN+K6O/pqxxLjol3JQMZD2VAVP7tEMIirc1l6+FuFekfJrmw8QFkH7K91w9REJkdVylUrDprf22MkWn8Yc7Ypt7UWuKUm5DMk8g8cpzBGHHTXE1YBizRBUxQ9M6KjctTQ8PfwJwCQdxlT7wM0FBciMoBU5da9YYGOP8/3SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678686; c=relaxed/simple;
	bh=EJeN2WVimoZPUq49zQhU43cbcGY9Zd4lUjWK+/7V8qY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFYaWaZgwIcgtAUJgvxqts9A/V6IuFQKvVzPjVD7yo1skofnH/7DsqeJVfcl7KohCJx/lxYOi0MH7AB9g6qECSzaf0qUOzfYZnmXY5RCS1xqqJLQFMi8ADsrvXoXU497GROBXSZO/2FilN6oH67DWQuSmyCtyYf2mrbVWBk4FoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=JzPFRzXl; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
From: Huang-Huang Bao <i@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1717678683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9aGbCJYC5tQIh+V38eaRg/TEw5yXNqXj9kU8kT92Cps=;
	b=JzPFRzXlwauoFclfUckhLzsumIZFUHKZTz3F69hs/aFkkPnv9lsJWxZHzxunf6gpRYqSYg
	i5sHtPROQDiqXANTLzVLz5cFSCDpFXLP2kR9qBsdAnAf6Mcn+TWfnLq+w37aIJVDPrbKKD
	qtVzbUzb7Q/MaW/Z/uPKof6+UmsGH50=
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huang-Huang Bao <i@eh5.me>
Subject: [PATCH v2 1/4] pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins
Date: Thu,  6 Jun 2024 20:57:52 +0800
Message-ID: <20240606125755.53778-2-i@eh5.me>
In-Reply-To: <20240606125755.53778-1-i@eh5.me>
References: <20240606125755.53778-1-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinmux bits for GPIO2-B0 to GPIO2-B6 actually have 2 bits width,
correct the bank flag for GPIO2-B. The pinmux bits for GPIO2-B7 is
recalculated so it remain unchanged.

The pinmux bits for those pins are not explicitly specified in RK3328
TRM, however we can get hint from pad name and its correspinding IOMUX
setting for pins in interface descriptions. The correspinding IOMIX
settings for GPIO2-B0 to GPIO2-B6 can be found in the same row next to
occurrences of following pad names in RK3328 TRM.

GPIO2-B0: IO_SPIclkm0_GPIO2B0vccio5
GPIO2-B1: IO_SPItxdm0_GPIO2B1vccio5
GPIO2-B2: IO_SPIrxdm0_GPIO2B2vccio5
GPIO2-B3: IO_SPIcsn0m0_GPIO2B3vccio5
GPIO2-B4: IO_SPIcsn1m0_FLASHvol_sel_GPIO2B4vccio5
GPIO2-B5: IO_ I2C2sda_TSADCshut_GPIO2B5vccio5
GPIO2-B6: IO_ I2C2scl_GPIO2B6vccio5

This fix has been tested on NanoPi R2S for fixing confliting pinmux bits
between GPIO2-B7 with GPIO2-B5.

Signed-off-by: Huang-Huang Bao <i@eh5.me>
---
 drivers/pinctrl/pinctrl-rockchip.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 3bedf36a0019..78dcf4daccde 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -634,12 +634,6 @@ static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
 
 static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
 	{
-		.num = 2,
-		.pin = 12,
-		.reg = 0x24,
-		.bit = 8,
-		.mask = 0x3
-	}, {
 		.num = 2,
 		.pin = 15,
 		.reg = 0x28,
@@ -3763,7 +3757,7 @@ static struct rockchip_pin_bank rk3328_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
 	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
 	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
-			     IOMUX_WIDTH_3BIT,
+			     0,
 			     IOMUX_WIDTH_3BIT,
 			     0),
 	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
-- 
2.45.2


