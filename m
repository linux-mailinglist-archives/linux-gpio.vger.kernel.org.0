Return-Path: <linux-gpio+bounces-14279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E54BD9FD39B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 12:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92D413A1C7E
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Dec 2024 11:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5484D1F238A;
	Fri, 27 Dec 2024 11:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="EQ1S957n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F831F2385
	for <linux-gpio@vger.kernel.org>; Fri, 27 Dec 2024 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297757; cv=none; b=GERvbx2+ZPdHGtIS1oF83hasB6qV2gY5IyilGq7UvIOanceMv2WVYPBdQiQAxHG3tP/w/KDMDTw6t6fX5R7RuKmIRFFDNre6huoFcBIFiNpip/Aw0YdZGrF9A/x1UPlNeeMrZmt/6WHy43AP8ac0HuxpkJ6hVKFsY2HXklnVjMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297757; c=relaxed/simple;
	bh=CfKDzLVW2HjbFGzbatG7QU1ZUM6EVKr2pWjYtibsVk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gLqxA8hOzsbWdzFxOpwY7DmMmewZbIEXtJ9S/Fk2AEgZIoEfasEpNZ80fXIOjbGFdkgI4y0XZ6Wt5bhLqVOfXnMgqeqp4s2yNwEtw8nH0SseDNCL1j+4HMCiTKY7Q2MwtyqNqcLsu8SzLzfTRH9fcpoHZ6UM58x936DriC/mKAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=EQ1S957n; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id QzTEtac50nNFGR8DRtXDMX; Fri, 27 Dec 2024 11:09:13 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8DOt78jjWvXpR8DQt9oeX; Fri, 27 Dec 2024 11:09:13 +0000
X-Authority-Analysis: v=2.4 cv=LtdZyWdc c=1 sm=1 tr=0 ts=676e8ad9
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=9cU--O3412mDuayuQzEA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NlbeabqHXI3xJyUbgyHJpY/hBcQISwAxP63/wwrSWEY=; b=EQ1S957nbN777vON3I8QTMMMFW
	1uOLRCM0sOq+ABpPkeK17FyEUYh5iqUuS26JxwigRCx+nCGoQ+qxcYELTE6SS+7KMZ/IKgLcYwPKV
	FmYCRln9U/ixt4dsnINtk6oVtkxuOgbW7ziKb3FRTyqSvq3bgK50atqdRjla6G7zJo7VMNb04VHjL
	UhLuilOXwt9o/rlb1JNWWatD8IPi0PobuGbLW1Lr/1YTqRi1S7G2ohZuRbzzvq4v2hcL9hG5tOvMw
	w9EbNuut4paHzhrWJYDr9Qwbtq2jQ8b/IcCWQEIJjsUrw0NNWxzAIpbu6sV9bfl6hf3aPe+XkTJoO
	E/vHBJIg==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8DL-000bEK-1q;
	Fri, 27 Dec 2024 16:39:07 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:37:57 +0530
Subject: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for a100/a133
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=4202;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=CfKDzLVW2HjbFGzbatG7QU1ZUM6EVKr2pWjYtibsVk4=;
 b=w92t7AAtXU2zxZzSIWLpVoKxCoU0b+V1CAvgST0eKbfVPBunyhuYXv732riqMFfymg0JfvgjF
 mFkIQo7jCTgCY7CZCZ1tkYb7WKenMTLWY5GhJa/+YHWGCJYyna6m1eO
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR8DL-000bEK-1q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 312
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfHKFrsONle/7BPg1nC0rWJdE/LSi9SyN63rfEe3IuVVPe+/g48PLpbH9wwEB/QepWvKJOFdViYIC4DiPzkCD05BjWrszKX69SMpm9b/oHMFN1GAXZgxh
 mz2f1ochXi7wfU2ZO7bOyIJ0QFqLTn/YdKS36qxCyOzCpvtIy0Stvm4zuklPkQNa8x3ie24f/ITGZbaeXtMnPDrL7Of9A2OAvgk=

lvds, lcd, dsi all shares the same GPIO D bank and lvds0
data 3 lines and lvds1 pins are missed, add them.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
index df90c75fb3c5..b97de80ae2f3 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
@@ -256,72 +256,84 @@ static const struct sunxi_desc_pin a100_pins[] = {
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D12 */
+		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3P */
 		  SUNXI_FUNCTION(0x4, "dsi0"),		/* DP3 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 8)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D13 */
+		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3N */
 		  SUNXI_FUNCTION(0x4, "dsi0"),		/* DM3 */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 9)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D14 */
+		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D0P */
 		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 10)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D15 */
+		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D0N */
 		  SUNXI_FUNCTION(0x4, "spi1"),		/* CLK */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 11)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D18 */
+		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D1P */
 		  SUNXI_FUNCTION(0x4, "spi1"),		/* MOSI */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 12)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D19 */
+		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D1N */
 		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 13)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D20 */
+		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D2P */
 		  SUNXI_FUNCTION(0x4, "uart3"),		/* TX */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 14)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D21 */
+		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D2N */
 		  SUNXI_FUNCTION(0x4, "uart3"),		/* RX */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 15)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D22 */
+		  SUNXI_FUNCTION(0x3, "lvds1"),		/* CKP */
 		  SUNXI_FUNCTION(0x4, "uart3"),		/* RTS */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 16)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D23 */
+		  SUNXI_FUNCTION(0x3, "lvds1"),		/* CKN */
 		  SUNXI_FUNCTION(0x4, "uart3"),		/* CTS */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 17)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* CLK */
+		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D3P */
 		  SUNXI_FUNCTION(0x4, "uart4"),		/* TX */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 18)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
 		  SUNXI_FUNCTION(0x0, "gpio_in"),
 		  SUNXI_FUNCTION(0x1, "gpio_out"),
 		  SUNXI_FUNCTION(0x2, "lcd0"),		/* DE */
+		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D3N */
 		  SUNXI_FUNCTION(0x4, "uart4"),		/* RX */
 		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 19)),
 	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),

-- 
2.39.5


