Return-Path: <linux-gpio+bounces-23737-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD9B104BE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:51:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 600223BAB54
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBFC2D6405;
	Thu, 24 Jul 2025 08:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="k4MdlrNz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9702D5C6E;
	Thu, 24 Jul 2025 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346453; cv=none; b=LbLzsiCmTwxhiuutMwLXqOYFa9XrLIlQvgxC5RtTqJwqqi1Zbad2tzdDkotRrq5SHsF8MBY+PczT+jzC8ijUvohM7BAXGM/7SJEmep+wU7aDuIIyWw0Am792Sl7vhIoencrn5q1xHkQylrj/fMOIpakQja3iut0XqRcpK5cxwfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346453; c=relaxed/simple;
	bh=c3mbvg3u8ROaaVs8EH08ECKYZrtr/aCMlnPYd9mL1/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VikmElCDJtSrIfcgo29lMotJqZK25sc7uGkNHUVCdF8MltsDbbqvlGzTXu2kAeqNL6Qsjqwr4eAN4WDGQEK1QPUwZxESY0QNiAHXRA3AHqh9V6cAGnSSpQWCEwR71dvHBcXJYLJpmq1UCNFTXfxK4ZlmvVOd9zGc7omjZ84k994=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=k4MdlrNz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346450;
	bh=c3mbvg3u8ROaaVs8EH08ECKYZrtr/aCMlnPYd9mL1/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k4MdlrNzkD4Rmw1BMR/lF2F0uaiAwVc82OaIwwu1Fbki6DayF4jykh+gTzEPdt//d
	 0SyD4eRgRLg9R8nuQipR7l7OzJ7gF9HT27S1UsB/mb8iqofl4/h1iefpl3xr8bfiyn
	 npCe2sAd5AyQc9QoJtz+q/BLXBlGrw+B3JnmpGItPJ4RqDI9Nm6RdlvVOW+dpU7n9E
	 ANXFwEfKPieMsmX5YcWJcrHhttc0AU8vHmJpUVUX1wclqmBu3X6RPjeRJJ8cg3lgrA
	 oT/pZ0DJQPtwT11WUhafef4x4nS8GhGHYrJTiJvDFoIlKq+DU93Fx70eMOJD3fzue7
	 hPUeh9yjNFyRA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8A8217E1110;
	Thu, 24 Jul 2025 10:40:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	jassisinghbrar@gmail.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	sean.wang@kernel.org,
	linus.walleij@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	atenart@kernel.org,
	jitao.shi@mediatek.com,
	ck.hu@mediatek.com,
	houlong.wei@mediatek.com,
	kyrie.wu@mediatek.corp-partner.google.com,
	andy.teng@mediatek.com,
	tinghan.shen@mediatek.com,
	jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com,
	olivia.wen@mediatek.com,
	granquet@baylibre.com,
	eugen.hristev@linaro.org,
	arnd@arndb.de,
	sam.shih@mediatek.com,
	jieyy.yang@mediatek.com,
	frank-w@public-files.de,
	mwalle@kernel.org,
	fparent@baylibre.com,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 32/38] arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
Date: Thu, 24 Jul 2025 10:39:08 +0200
Message-ID: <20250724083914.61351-33-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display related IPs in MT8183 are flexible and support being
interconnected with different instances of DDP IPs forming a full
Display Data Path that ends with an actual display output, which
is board specific.

Add a common graph in the main mt8183.dtsi devicetree, which is
shared between all of the currently supported boards, and do it
such that only a very minimal amount of changes are needed to
each board - the only required change was done in mt8183-pumpkin,
using a phandle to assign the display to DPI0.

All boards featuring any display functionality will extend this
common graph to hook the display controller of the SoC to their
specific output port(s).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |   8 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 239 +++++++++++++++++-
 2 files changed, 238 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index d5fcb010e1ac..cf1d33384bf0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -531,10 +531,8 @@ &dpi0 {
 	pinctrl-0 = <&dpi_func_pins>;
 	pinctrl-1 = <&dpi_idle_pins>;
 	status = "okay";
+};
 
-	port {
-		dpi_out: endpoint {
-			remote-endpoint = <&it66121_in>;
-		};
-	};
+&dpi_out {
+	remote-endpoint = <&it66121_in>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 3c1fe80e64b9..960d8955d018 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1667,6 +1667,21 @@ mmsys: syscon@14000000 {
 			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
 				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mmsys_ep_main: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&ovl0_in>;
+				};
+
+				mmsys_ep_ext: endpoint@1 {
+					reg = <1>;
+					remote-endpoint = <&ovl_2l1_in>;
+				};
+			};
 		};
 
 		dma-controller0@14001000 {
@@ -1733,6 +1748,25 @@ ovl0: ovl@14008000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL0>;
 			iommus = <&iommu M4U_PORT_DISP_OVL0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl0_in: endpoint {
+						remote-endpoint = <&mmsys_ep_main>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl0_out: endpoint {
+						remote-endpoint = <&ovl_2l0_in>;
+					};
+				};
+			};
 		};
 
 		ovl_2l0: ovl@14009000 {
@@ -1743,6 +1777,25 @@ ovl_2l0: ovl@14009000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
 			iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl_2l0_in: endpoint {
+						remote-endpoint = <&ovl0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl_2l0_out: endpoint {
+						remote-endpoint = <&rdma0_in>;
+					};
+				};
+			};
 		};
 
 		ovl_2l1: ovl@1400a000 {
@@ -1753,6 +1806,25 @@ ovl_2l1: ovl@1400a000 {
 			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
 			iommus = <&iommu M4U_PORT_DISP_2L_OVL1_LARB0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ovl_2l1_in: endpoint {
+						remote-endpoint = <&mmsys_ep_ext>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ovl_2l1_out: endpoint {
+						remote-endpoint = <&rdma1_in>;
+					};
+				};
+			};
 		};
 
 		rdma0: rdma@1400b000 {
@@ -1764,6 +1836,25 @@ rdma0: rdma@1400b000 {
 			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
 			mediatek,rdma-fifo-size = <5120>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma0_in: endpoint {
+						remote-endpoint = <&ovl_2l0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma0_out: endpoint {
+						remote-endpoint = <&color0_in>;
+					};
+				};
+			};
 		};
 
 		rdma1: rdma@1400c000 {
@@ -1775,6 +1866,25 @@ rdma1: rdma@1400c000 {
 			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
 			mediatek,rdma-fifo-size = <2048>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					rdma1_in: endpoint {
+						remote-endpoint = <&ovl_2l1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					rdma1_out: endpoint {
+						remote-endpoint = <&dpi_in>;
+					};
+				};
+			};
 		};
 
 		color0: color@1400e000 {
@@ -1785,6 +1895,25 @@ color0: color@1400e000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					color0_in: endpoint {
+						remote-endpoint = <&rdma0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					color0_out: endpoint {
+						remote-endpoint = <&ccorr0_in>;
+					};
+				};
+			};
 		};
 
 		ccorr0: ccorr@1400f000 {
@@ -1794,6 +1923,25 @@ ccorr0: ccorr@1400f000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ccorr0_in: endpoint {
+						remote-endpoint = <&color0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ccorr0_out: endpoint {
+						remote-endpoint = <&aal0_in>;
+					};
+				};
+			};
 		};
 
 		aal0: aal@14010000 {
@@ -1803,6 +1951,25 @@ aal0: aal@14010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_AAL0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					aal0_in: endpoint {
+						remote-endpoint = <&ccorr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					aal0_out: endpoint {
+						remote-endpoint = <&gamma0_in>;
+					};
+				};
+			};
 		};
 
 		gamma0: gamma@14011000 {
@@ -1812,6 +1979,25 @@ gamma0: gamma@14011000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					gamma0_in: endpoint {
+						remote-endpoint = <&aal0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					gamma0_out: endpoint {
+						remote-endpoint = <&dither0_in>;
+					};
+				};
+			};
 		};
 
 		dither0: dither@14012000 {
@@ -1821,6 +2007,25 @@ dither0: dither@14012000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dither0_in: endpoint {
+						remote-endpoint = <&gamma0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dither0_out: endpoint {
+						remote-endpoint = <&dsi_in>;
+					};
+				};
+			};
 		};
 
 		dsi0: dsi@14014000 {
@@ -1837,8 +2042,21 @@ dsi0: dsi@14014000 {
 			phy-names = "dphy";
 			status = "disabled";
 
-			port {
-				dsi_out: endpoint { };
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in: endpoint {
+						remote-endpoint = <&dither0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_out: endpoint { };
+				};
 			};
 		};
 
@@ -1853,8 +2071,21 @@ dpi0: dpi@14015000 {
 			clock-names = "pixel", "engine", "pll";
 			status = "disabled";
 
-			port {
-				dpi_out: endpoint { };
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dpi_in: endpoint {
+						remote-endpoint = <&rdma1_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dpi_out: endpoint { };
+				};
 			};
 		};
 
-- 
2.50.1


