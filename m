Return-Path: <linux-gpio+bounces-7241-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA828FE6F6
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 14:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 272AC2855B8
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 12:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C836D194C9A;
	Thu,  6 Jun 2024 12:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="DNoHLgh4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFBF195F25;
	Thu,  6 Jun 2024 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717678689; cv=none; b=sdn9CLJct3R7R0JUroE7ZHAWg9HIMe+DjXTK3Q6SxogCU1lSCISSQzjNyHmPdeVln+df8SRedTOKVh5yAnLVPI9k6CDKy25HAfq94APwwwycMI4jbJuk2AuDjSfw/n9SryqG4tZ4jvoxpEEQ/2rhOpW7xamO+1tgZFZra/mysSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717678689; c=relaxed/simple;
	bh=nSDtWUoOkviqVSjwlwmEMKZsU1Ck6duiWVcABLyMnJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sx2nZEO/It5nCrDGrmPLtRUbI2mp7r2CuQNKykmfPuJl/dIU2mb8f2n/n8CUmvh2F0apmj6Xr65lJRBr2Z6spnljEID/NqcjjS08IEmORfCLyO5KmPYGs9j6bsadAnw00xo8piidyliBcgVEEGwB5vTEg2eXWKPVTHqlOD5/nMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=DNoHLgh4; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
From: Huang-Huang Bao <i@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1717678686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8CYQm7j2t9ji5vfaVStrG16PgJM6FurWlwvn6RUIGE=;
	b=DNoHLgh4pe/QTs9HyXQ6YPCBn543xR6rpfWDLp8gu/DvCGfAyS6x3B3f+BI3hI+RlUV5oc
	+7nUgn6K3jUGsIEcn4gMP1hRKe//KhWins1M1VDvmXbpbxQa/wCnln9aKyFXMD+fan7uyE
	Hc7iNN20OPN4TBFYlHDmxJ45jkr0upw=
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Huang-Huang Bao <i@eh5.me>
Subject: [PATCH v2 2/4] pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
Date: Thu,  6 Jun 2024 20:57:53 +0800
Message-ID: <20240606125755.53778-3-i@eh5.me>
In-Reply-To: <20240606125755.53778-1-i@eh5.me>
References: <20240606125755.53778-1-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pinmux bits for GPIO3-B1 to GPIO3-B6 pins are not explicitly
specified in RK3328 TRM, however we can get hint from pad name and its
correspinding IOMUX setting for pins in interface descriptions. The
correspinding IOMIX settings for these pins can be found in the same
row next to occurrences of following pad names in RK3328 TRM.

GPIO3-B1:  IO_TSPd5m0_CIFdata5m0_GPIO3B1vccio6
GPIO3-B2: IO_TSPd6m0_CIFdata6m0_GPIO3B2vccio6
GPIO3-B3: IO_TSPd7m0_CIFdata7m0_GPIO3B3vccio6
GPIO3-B4: IO_CARDclkm0_GPIO3B4vccio6
GPIO3-B5: IO_CARDrstm0_GPIO3B5vccio6
GPIO3-B6: IO_CARDdetm0_GPIO3B6vccio6

Add pinmux data to rk3328_mux_recalced_data as mux register offset for
these pins does not follow rockchip convention.

Signed-off-by: Huang-Huang Bao <i@eh5.me>
---
 drivers/pinctrl/pinctrl-rockchip.c | 51 ++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 78dcf4daccde..23531ea0d088 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -634,17 +634,68 @@ static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
 
 static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
 	{
+		/* gpio2_b7_sel */
 		.num = 2,
 		.pin = 15,
 		.reg = 0x28,
 		.bit = 0,
 		.mask = 0x7
 	}, {
+		/* gpio2_c7_sel */
 		.num = 2,
 		.pin = 23,
 		.reg = 0x30,
 		.bit = 14,
 		.mask = 0x3
+	}, {
+		/* gpio3_b1_sel */
+		.num = 3,
+		.pin = 9,
+		.reg = 0x44,
+		.bit = 2,
+		.mask = 0x3
+	}, {
+		/* gpio3_b2_sel */
+		.num = 3,
+		.pin = 10,
+		.reg = 0x44,
+		.bit = 4,
+		.mask = 0x3
+	}, {
+		/* gpio3_b3_sel */
+		.num = 3,
+		.pin = 11,
+		.reg = 0x44,
+		.bit = 6,
+		.mask = 0x3
+	}, {
+		/* gpio3_b4_sel */
+		.num = 3,
+		.pin = 12,
+		.reg = 0x44,
+		.bit = 8,
+		.mask = 0x3
+	}, {
+		/* gpio3_b5_sel */
+		.num = 3,
+		.pin = 13,
+		.reg = 0x44,
+		.bit = 10,
+		.mask = 0x3
+	}, {
+		/* gpio3_b6_sel */
+		.num = 3,
+		.pin = 14,
+		.reg = 0x44,
+		.bit = 12,
+		.mask = 0x3
+	}, {
+		/* gpio3_b7_sel */
+		.num = 3,
+		.pin = 15,
+		.reg = 0x44,
+		.bit = 14,
+		.mask = 0x3
 	},
 };
 
-- 
2.45.2


