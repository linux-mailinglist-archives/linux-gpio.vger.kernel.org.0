Return-Path: <linux-gpio+bounces-23735-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06183B104AB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFEA5174D5C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56ECF2D46C6;
	Thu, 24 Jul 2025 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lUB6PfHl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599F82D3EC7;
	Thu, 24 Jul 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346448; cv=none; b=gHS4ymXw/SBKD3VoQ40e+MFTrwcJdWKYvnKYebCC/sXR+BmOKtp+4aFDYPCeIyRKlqDm8tgdS0VLLcyg8+9BpPAygURVU0RuuvQSNg0XXwIVnbh08mp6BQmLka380csFYj/r74UMJ4KwtDn69Ir82sqJZos27LHtBQdgaslFOTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346448; c=relaxed/simple;
	bh=gK1J/nmFCA5iQ9wSL8DiDVmGg7vxkIBM8ZUzDwIVnuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QgrkKoCWG99o4zoFqMynP2dKVZNIpIXxI/69VaS6bgl4ChOcc2lE7oX4o9XchU53OW6KLPheG/RUjMbq5bfREtyfNJ0L0bvEkkfHL2aXFEM8oeqCzpO79kzwK4VUqy+4XbVtJlEVVhOhLE1AeOQAohNsBNXQyZdlbafmQLCn1MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lUB6PfHl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346444;
	bh=gK1J/nmFCA5iQ9wSL8DiDVmGg7vxkIBM8ZUzDwIVnuc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lUB6PfHldk1/DqKfzI6izO+niovtYwIkMrvgcmL1OQwo6Tm09al+7ptOWNzR79Av8
	 Jnelok5aFfAfnGxE3nJMexloNhycRwsPCeXNcVLo0/lNKs1R3R9vvbrVkZK8lCaurF
	 ATEs2O4H3KD8kaFftSzEVKYvXIix3mnqQL0Y+3MI1qpgR6F1LogcB5uuLpCYo/PYlL
	 4vMZ8i8aJqQVCwEnXAauhI/H7XWBdnVsRk/iCMzfQEeqUgXFJsIzaqvHKvdD4LDrlO
	 GxRvOwR2QK7oBibfE2eUAJ1IoZ+fBv5qGBCvU+PcmPiTTpTav8IG67ZMKtM/nr1OAr
	 FRHFFDMLhwi3Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 723B117E11FE;
	Thu, 24 Jul 2025 10:40:42 +0200 (CEST)
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
Subject: [PATCH 30/38] arm64: dts: mediatek: pumpkin-common: Fix pinctrl node names
Date: Thu, 24 Jul 2025 10:39:06 +0200
Message-ID: <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
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

Fix the pinctrl node names to adhere to the bindings, as the main
pin node is supposed to be named like "uart0-pins" and the pinmux
node named like "pins-bus".

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index a356db5fcc5f..805fb82138a8 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -198,8 +198,8 @@ &usb_phy {
 };
 
 &pio {
-	gpio_keys_default: gpiodefault {
-		pins_cmd_dat {
+	gpio_keys_default: gpio-keys-pins {
+		pins-cmd-dat {
 			pinmux = <MT8516_PIN_42_KPCOL0__FUNC_GPIO42>,
 				 <MT8516_PIN_43_KPCOL1__FUNC_GPIO43>;
 			bias-pull-up;
@@ -207,7 +207,7 @@ pins_cmd_dat {
 		};
 	};
 
-	i2c0_pins_a: i2c0 {
+	i2c0_pins_a: i2c0-pins {
 		pins1 {
 			pinmux = <MT8516_PIN_58_SDA0__FUNC_SDA0_0>,
 				 <MT8516_PIN_59_SCL0__FUNC_SCL0_0>;
@@ -215,7 +215,7 @@ pins1 {
 		};
 	};
 
-	i2c2_pins_a: i2c2 {
+	i2c2_pins_a: i2c2-pins {
 		pins1 {
 			pinmux = <MT8516_PIN_60_SDA2__FUNC_SDA2_0>,
 				 <MT8516_PIN_61_SCL2__FUNC_SCL2_0>;
@@ -223,21 +223,21 @@ pins1 {
 		};
 	};
 
-	tca6416_pins: pinmux_tca6416_pins {
-		gpio_mux_rst_n_pin {
+	tca6416_pins: tca6416-pins {
+		pins-mux-rstn {
 			pinmux = <MT8516_PIN_65_UTXD1__FUNC_GPIO65>;
 			output-high;
 		};
 
-		gpio_mux_int_n_pin {
+		pins-mux-intn {
 			pinmux = <MT8516_PIN_64_URXD1__FUNC_GPIO64>;
 			input-enable;
 			bias-pull-up;
 		};
 	};
 
-	ethernet_pins_default: ethernet {
-		pins_ethernet {
+	ethernet_pins_default: ethernet-pins {
+		pins-eth {
 			pinmux = <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
 				 <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
 				 <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,
-- 
2.50.1


