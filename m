Return-Path: <linux-gpio+bounces-22534-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00415AF0492
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 22:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5B1E3B423A
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 20:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB0F28504C;
	Tue,  1 Jul 2025 20:16:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F0B27FD52;
	Tue,  1 Jul 2025 20:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751401012; cv=none; b=vDjkJ0Al3ik0ha1nKt3g+6zq2nhZRsJGhHyD0TU/VLjdeugwIC+puJj1M7DqzxjtlayHELSCH2unlIsXuNJSl+6FEN6LyeTSULGZ4jbwacRKPPcrRKNz7gJlGUDNa2+1Ppogn2ogz0eapU1hwrBMemvnTXjuGkoy6D3BNhQzpmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751401012; c=relaxed/simple;
	bh=2nmS+ZO80l1f6pv4DQyGZ/GajhbX3jsugminurl4syU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oIU/pd1pQrr3F+gFbe2HK9ieBZZl86yKxTEjQvTVj9QONnHt11BAt9dU6z8w2B3PfnIrs/TEQWv72p7UOrEcgHTYCpT1jIiBnSeVvyU/braC2Q6Yw+Lyzv+5RLPjSozUspvUwxrL0FMW/YLMpOqlu8CiHnfkucU9wHH9iaRqouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 705651F0003D;
	Tue,  1 Jul 2025 20:16:49 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id E3C54AC9686; Tue,  1 Jul 2025 20:16:48 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id B6A8BAC9686;
	Tue,  1 Jul 2025 20:11:33 +0000 (UTC)
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
Subject: [PATCH 3/5] clk: sunxi-ng: v3s: Fix CSI1 MCLK clock name
Date: Tue,  1 Jul 2025 22:11:22 +0200
Message-ID: <20250701201124.812882-4-paulk@sys-base.io>
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

The CSI1 MCLK clock is reported as "csi-mclk" while it is specific to
CSI1 as the name of the definition indicates. Fix it in the driver.

Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index d12791b31a9d..86d933d1ac72 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -366,7 +366,7 @@ static const char * const csi_sclk_parents[] = { "pll-video", "pll-isp" };
 static SUNXI_CCU_M_WITH_MUX_GATE(csi_sclk_clk, "csi-sclk", csi_sclk_parents,
 				 0x134, 16, 4, 24, 3, BIT(31), 0);
 
-static SUNXI_CCU_M_WITH_MUX_GATE(csi1_mclk_clk, "csi-mclk", csi_mclk_parents,
+static SUNXI_CCU_M_WITH_MUX_GATE(csi1_mclk_clk, "csi1-mclk", csi_mclk_parents,
 				 0x134, 0, 5, 8, 3, BIT(15), 0);
 
 static SUNXI_CCU_M_WITH_GATE(ve_clk, "ve", "pll-ve",
-- 
2.49.0


