Return-Path: <linux-gpio+bounces-23738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970DAB104BF
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 051E51645A1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7FA2D77EF;
	Thu, 24 Jul 2025 08:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="J2yy0BZV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A452D5C9F;
	Thu, 24 Jul 2025 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346457; cv=none; b=GcwMD39hfOoIEdEzlBOkkmbwkDzXiotMD+DkeQu3kfMVE6SEdEDlUC27xXpE+YIJOVsd96ySLDg/XiW+KeFotRj4EWflE+FJkD7e/C4gqJcL61Cv3fylSTTLclAL1ly3lCeBImQexi0knWzBSNtIboCPnqTMEI3/mdBoC0KiITw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346457; c=relaxed/simple;
	bh=TVuhnwDPPn4uO0H+b17b7IVpJHImbqjOWxlQ//0buiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoCUroSiapePanEmbqZQW4xHJ9qlIEZSrR+AYKufUZZj6EWCzYUCObRWXD8eBP7HXLqOr+p8vJrZquMkWiquz2NDe7wLTB1f8iql7Wxz6VlBjrHmi5dsGsA4mqEBWCO9b33Va5XNQ5rm9CKVF8dTB0791zlM0il278+qX4o3u4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=J2yy0BZV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346452;
	bh=TVuhnwDPPn4uO0H+b17b7IVpJHImbqjOWxlQ//0buiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J2yy0BZVaUqs+CkIuOcB1kvo8eR/4NQyCVbhCChcVvbxM9A5O8hBJpwauT9gAKdFx
	 YD0icu7eBQu7YdjnfuP27dGBTF5EaPRSrX7KQevmPr1GUF0XuHw7UFgCWOTmvmztKn
	 foBtU6MhcG3K75MOeYNbgeLIEwFbdFy7T2nyRWb3GpKXqH5Dn9taziJvJ4Q1alh/CE
	 G/ivgeRss8z0iFvSfka2JIuLDNKeKFR6BvGxTXIu4Q0d7/ybnyuEheXdOsbl66/aJt
	 dvpKmS+uNdxQNB34w0vVNEUoUKBrPqdGL4PovLpwQiUFbPZp676MGQ+W80ShRiL7CP
	 cwSR8zYZFUkZA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65C2517E0FC2;
	Thu, 24 Jul 2025 10:40:50 +0200 (CEST)
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
Subject: [PATCH 33/38] arm64: dts: mediatek: mt8183-kukui: Move DSI panel node to machine dtsis
Date: Thu, 24 Jul 2025 10:39:09 +0200
Message-ID: <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
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

Not all of the kukui machines have got a real DSI panel, infact,
some of those have got a DSI to eDP bridge instead: this means
that the address and size cells are necessary in the first case
but unnecessary in the latter.

Instead of adding a bunch of /delete-node/ which would impact on
human readability, move the entire panel node declaration to each
of the relevant Kukui machine dtsi: even though this introduces
some duplication, the advantages in readability surclass that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  5 ----
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 27 ++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 28 +++++++++++++++++++
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 28 +++++++++++++++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 23 ---------------
 5 files changed, 83 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index f2afca63c75a..1b74ec171c10 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -93,11 +93,6 @@ cros_ec_pwm: pwm {
 	};
 };
 
-&dsi0 {
-	status = "okay";
-	/delete-node/panel@0;
-};
-
 &dsi_out {
 	remote-endpoint = <&anx7625_in>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index 472d4987615a..d71972c94e42 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -61,6 +61,33 @@ &bluetooth {
 	firmware-name = "nvm_00440302_i2s_eu.bin";
 };
 
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel: panel@0 {
+		/* compatible will be set in board dts */
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
+		backlight = <&backlight_lcd0>;
+		rotation = <270>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	remote-endpoint = <&panel_in>;
+};
+
 &i2c0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index 1b21e3958061..b702ff066636 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -42,6 +42,34 @@ pp1800_lcd: pp1800-lcd {
 	};
 };
 
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel: panel@0 {
+		/* compatible will be set in board dts */
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
+		backlight = <&backlight_lcd0>;
+		rotation = <270>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	remote-endpoint = <&panel_in>;
+};
+
 &i2c0 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index a85c73b43195..b6cfcafd8b06 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -45,6 +45,34 @@ &bluetooth {
 	firmware-name = "nvm_00440302_i2s_eu.bin";
 };
 
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel: panel@0 {
+		/* compatible will be set in board dts */
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
+		backlight = <&backlight_lcd0>;
+		rotation = <270>;
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+};
+
+&dsi_out {
+	remote-endpoint = <&panel_in>;
+};
+
 &i2c0 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 8f3a0e85b4ed..4ac0a60fdd24 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -252,29 +252,6 @@ &cpu7 {
 
 &dsi0 {
 	status = "okay";
-	#address-cells = <1>;
-	#size-cells = <0>;
-	panel: panel@0 {
-		/* compatible will be set in board dts */
-		reg = <0>;
-		enable-gpios = <&pio 45 0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&panel_pins_default>;
-		avdd-supply = <&ppvarn_lcd>;
-		avee-supply = <&ppvarp_lcd>;
-		pp1800-supply = <&pp1800_lcd>;
-		backlight = <&backlight_lcd0>;
-		rotation = <270>;
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-			};
-		};
-	};
-};
-
-&dsi_out {
-	remote-endpoint = <&panel_in>;
 };
 
 &gic {
-- 
2.50.1


