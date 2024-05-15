Return-Path: <linux-gpio+bounces-6397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF9F8C663D
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 14:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 865FDB21400
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 12:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCF07581D;
	Wed, 15 May 2024 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+cvnuk/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3583374432;
	Wed, 15 May 2024 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715775469; cv=none; b=NjPmFVDnSgTOYhH5TVJqn+6w69iAQPuIq9MBApud+pn/sTudaCXRGkoOVooFA9o7PJKPKNG8LV72J1VrFEhf6DESdZOSRMk0R4V0HHkcfrTWkedo6zZAeY8ZWepnyIdQztCIGmrHNDR22iaSvUfW43fKYXLXFSthWH32eT13zBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715775469; c=relaxed/simple;
	bh=eWkVo7uLTLFU9mkde8CYxCgnG0fOzVU2ly8xX0ik3Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4tDOp2w0ilLkg9AfK62fxLQT28FhL75RgF7NnS+X5zD4Rayj/gydUTbkk2uQdf3yj6zNjXYUBxmhmZLqpQWDFYlTfmFAzTHehEfZRKq7UNTpTKaWJwLSrL5WH+cVCbIkw7s0Y/avGYSUkkVh4/iDhBM0uHG96YTsHDIO/z7e3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+cvnuk/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51f72a29f13so8996078e87.3;
        Wed, 15 May 2024 05:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715775466; x=1716380266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKjMVOygJf4llOz3yuoJ/FqsNMdulqX0kUVtShPdWBE=;
        b=C+cvnuk/B3u5o/X8oNqo+Xw9yBjaCbgZn9rFufe5cVpVasEZV7XMq3Y5+9iBbCs7Tp
         dEDWo0KZ7rPnmlF6BmsELQT+0uI+ypzxEJ78ygrpcxuyH50dsZIuxX4xNa84gK0REFqy
         1w66ZSCNCk3s0sZjA9LcchiyPnE0iCH/Kf4KnYjP1r52bJv4RXuVlFYkaIoxdf5rRKcU
         VoNgUP/kRRoR2Bd3uVV3nl70TYDZoyprZWBCI9nr9dcX8no1VXW3+FVEv4QsayUQS2kf
         A+rs4e51Q5zeKB/4DikIcVWo/LWKNtebe8oKRq+8DNtDJG9YQl0hLKAcrZpmelsYneLr
         sy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715775466; x=1716380266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKjMVOygJf4llOz3yuoJ/FqsNMdulqX0kUVtShPdWBE=;
        b=GBZ4GQPYEqM9CiYryU7QGHayB1mbWtmUsDao11TXJJOPxbBzjOuLJcR3+4e4Y4hIHC
         CnmCTFGiqolt0RcYNBPosrNyPBMD8h7dNLakEZ9UVtaZ30bAiWjdPC+npe206JL5jk0T
         zPA7Ins4RVuQa8e7guUhzFW4ZUybq7eCgKpN+CESqDS2CZOuOsywulPDNZEgI6XiQpmT
         9GpKZikVQ15uH+ihyVOXBdovruzOI/5h+hkHheHKQc3/sjfzUtztp9mrfudztmkqsNOg
         OeZd4JlHG88RFrVNS7AVUjkyJ9mI/2gUJyN5+qQQWZE7jDUhzIHLTM6RWY+A4Tkb0jbh
         wBUg==
X-Forwarded-Encrypted: i=1; AJvYcCWmKvwlkKEvl+wh08LVvzxHogKM1dVogg9Jsvmt2X/Uy1rG11OoNWl/g9FFsALNHVKPgdmXgABmMc+B+0kNUoHLSioMP0ek5Uaz9L6EwYJ1BvSN/WvoYEH5OhvHmwf5ZqJS355vyQYgPdRHXvUoHmOD4BMt2OMbmNlrMi4oklI4pb3R6k0=
X-Gm-Message-State: AOJu0YzaFeeC+OTiT6/+DaG1IecC8G6pzhGgxk9ET5Wap9FHcgAXXgA/
	DVBmQSwbp+LuJ6OwztAvTgNxoCGiD+uH7ElZSnDNbPX2CkyiFSHXjycehg==
X-Google-Smtp-Source: AGHT+IEu6eXZiI2FM1gcXLheGWZY8zbpBrIt2I18KCAhXjSTZmF8Yk917x+UEnxKTYPurWvm+UHEGA==
X-Received: by 2002:ac2:5df1:0:b0:51b:4204:2f51 with SMTP id 2adb3069b0e04-5220ff71f7dmr10085290e87.8.1715775466187;
        Wed, 15 May 2024 05:17:46 -0700 (PDT)
Received: from yoga-710.tas.nnz-ipc.net ([178.218.200.115])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad684sm2515614e87.3.2024.05.15.05.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 05:17:45 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jianqun Xu <jay.xu@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Yashin <dmt.yashin@gmail.com>
Subject: [PATCH 1/3] pinctrl: rockchip: update rk3308 iomux routes
Date: Wed, 15 May 2024 17:16:32 +0500
Message-ID: <20240515121634.23945-2-dmt.yashin@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240515121634.23945-1-dmt.yashin@gmail.com>
References: <20240515121634.23945-1-dmt.yashin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the rk3308 iomux routes in rk3308_mux_route_data belong to
the rk3308b SoC. Remove them and correct i2c3 routes.

Fixes: 7825aeb7b208 ("pinctrl: rockchip: add rk3308 SoC support")
Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 3bedf36a0019..cc647db76927 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -870,9 +870,8 @@ static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
 	RK_MUXROUTE_SAME(0, RK_PC3, 1, 0x314, BIT(16 + 0) | BIT(0)), /* rtc_clk */
 	RK_MUXROUTE_SAME(1, RK_PC6, 2, 0x314, BIT(16 + 2) | BIT(16 + 3)), /* uart2_rxm0 */
 	RK_MUXROUTE_SAME(4, RK_PD2, 2, 0x314, BIT(16 + 2) | BIT(16 + 3) | BIT(2)), /* uart2_rxm1 */
-	RK_MUXROUTE_SAME(0, RK_PB7, 2, 0x608, BIT(16 + 8) | BIT(16 + 9)), /* i2c3_sdam0 */
-	RK_MUXROUTE_SAME(3, RK_PB4, 2, 0x608, BIT(16 + 8) | BIT(16 + 9) | BIT(8)), /* i2c3_sdam1 */
-	RK_MUXROUTE_SAME(2, RK_PA0, 3, 0x608, BIT(16 + 8) | BIT(16 + 9) | BIT(9)), /* i2c3_sdam2 */
+	RK_MUXROUTE_SAME(0, RK_PB7, 2, 0x314, BIT(16 + 4)), /* i2c3_sdam0 */
+	RK_MUXROUTE_SAME(3, RK_PB4, 2, 0x314, BIT(16 + 4) | BIT(4)), /* i2c3_sdam1 */
 	RK_MUXROUTE_SAME(1, RK_PA3, 2, 0x308, BIT(16 + 3)), /* i2s-8ch-1-sclktxm0 */
 	RK_MUXROUTE_SAME(1, RK_PA4, 2, 0x308, BIT(16 + 3)), /* i2s-8ch-1-sclkrxm0 */
 	RK_MUXROUTE_SAME(1, RK_PB5, 2, 0x308, BIT(16 + 3) | BIT(3)), /* i2s-8ch-1-sclktxm1 */
@@ -881,18 +880,6 @@ static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
 	RK_MUXROUTE_SAME(1, RK_PB6, 4, 0x308, BIT(16 + 12) | BIT(16 + 13) | BIT(12)), /* pdm-clkm1 */
 	RK_MUXROUTE_SAME(2, RK_PA6, 2, 0x308, BIT(16 + 12) | BIT(16 + 13) | BIT(13)), /* pdm-clkm2 */
 	RK_MUXROUTE_SAME(2, RK_PA4, 3, 0x600, BIT(16 + 2) | BIT(2)), /* pdm-clkm-m2 */
-	RK_MUXROUTE_SAME(3, RK_PB2, 3, 0x314, BIT(16 + 9)), /* spi1_miso */
-	RK_MUXROUTE_SAME(2, RK_PA4, 2, 0x314, BIT(16 + 9) | BIT(9)), /* spi1_miso_m1 */
-	RK_MUXROUTE_SAME(0, RK_PB3, 3, 0x314, BIT(16 + 10) | BIT(16 + 11)), /* owire_m0 */
-	RK_MUXROUTE_SAME(1, RK_PC6, 7, 0x314, BIT(16 + 10) | BIT(16 + 11) | BIT(10)), /* owire_m1 */
-	RK_MUXROUTE_SAME(2, RK_PA2, 5, 0x314, BIT(16 + 10) | BIT(16 + 11) | BIT(11)), /* owire_m2 */
-	RK_MUXROUTE_SAME(0, RK_PB3, 2, 0x314, BIT(16 + 12) | BIT(16 + 13)), /* can_rxd_m0 */
-	RK_MUXROUTE_SAME(1, RK_PC6, 5, 0x314, BIT(16 + 12) | BIT(16 + 13) | BIT(12)), /* can_rxd_m1 */
-	RK_MUXROUTE_SAME(2, RK_PA2, 4, 0x314, BIT(16 + 12) | BIT(16 + 13) | BIT(13)), /* can_rxd_m2 */
-	RK_MUXROUTE_SAME(1, RK_PC4, 3, 0x314, BIT(16 + 14)), /* mac_rxd0_m0 */
-	RK_MUXROUTE_SAME(4, RK_PA2, 2, 0x314, BIT(16 + 14) | BIT(14)), /* mac_rxd0_m1 */
-	RK_MUXROUTE_SAME(3, RK_PB4, 4, 0x314, BIT(16 + 15)), /* uart3_rx */
-	RK_MUXROUTE_SAME(0, RK_PC1, 3, 0x314, BIT(16 + 15) | BIT(15)), /* uart3_rx_m1 */
 };
 
 static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
-- 
2.39.2


