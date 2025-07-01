Return-Path: <linux-gpio+bounces-22536-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A9AF049F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C31AC165BF4
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAF92E3B0F;
	Tue,  1 Jul 2025 20:19:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7842E3372;
	Tue,  1 Jul 2025 20:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401168; cv=none; b=nksiRb50Dkf09du/uQ96h4mZSrLlmkoBQFQJLjJEZrRcn9aG/b5/zDeIJq/Otd7LGtEN9z79u2KjyP/tJOJQmbzkt79Bp/hKIWjhIwtmtJya6pC4VBuRK5D4Zxk/nqF+Foj9JwZUrnz6EEJh4YXTPf5/sO4S71Hm5I25qdZsCoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401168; c=relaxed/simple;
	bh=eTdiB+TyeObb5D0Oy2RdhXL7mUutM7cZ3MD00P9iWVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBau70s0r1mAc/y28tsNrRzK6TswEXz3TUMNPDw99sPwBXn8cxzTGhpdYizdjtZBsKe3SYw98Jr430nSytyzkwsXAMyTihPYLQhSiyB5HMme6tNAPLP7gCmcmj5VUKBpe7KuVWz36IFasODBRYOpT6w6FVHN2We9MZsIf1MMkso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B91A31F00036;
	Tue,  1 Jul 2025 20:19:24 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 48AFCAC96A5; Tue,  1 Jul 2025 20:19:24 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id F0064AC9688;
	Tue,  1 Jul 2025 20:11:38 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-gpio@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
Date: Tue,  1 Jul 2025 22:11:24 +0200
Message-ID: <20250701201124.812882-6-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201124.812882-1-paulk@sys-base.io>
References: <20250701201124.812882-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DE mixer clock is currently set to run at 150 MHz, while the
Allwinner BSP configures it at 300 MHz and other platforms typically
run at 297 MHz.

150 MHz appears to be enough given the restricted graphics capabilities
of the SoC (with a work area of only 1024x1024). However it typically
causes the DE clock to be parented to the periph0 pll instead of the
video PLL.

While this should generally not be a concern, it appears (based on
experimentation) that both the DE and TCON clocks need to be parented
to the same PLL for these units to work. While we cannot represent this
constraint in the clock driver, it appears that the TCON clock will
often get parented to the video pll (typically running at 297 MHz for
the CSI units needs), for instance when driving displays with a 33 MHz
pixel clock (33 being a natural divider of 297).

Running the DE clock at 297 MHz will typically result in parenting to
the video pll instead of the periph0 pll, thus making the display
output functional.

This is all a bit fragile but it solves the issue with displays running
at 33 Mhz and brings V3s to use the same frequency as other platforms,
making support more unified.

Also align and sort the fields of the v3s mixer config while at it.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 8b41d33baa30..35fdc2451060 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -670,12 +670,12 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer1_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
-	.vi_num = 2,
-	.ui_num = 1,
-	.scaler_mask = 0x3,
-	.scanline_yuv = 2048,
-	.ccsc = CCSC_MIXER0_LAYOUT,
-	.mod_rate = 150000000,
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0x3,
+	.scanline_yuv	= 2048,
+	.ui_num		= 1,
+	.vi_num		= 2,
 };
 
 static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
-- 
2.49.0


