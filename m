Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14A4326E175
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 18:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbgIQQ7A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 12:59:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:37572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728436AbgIQQ5M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Sep 2020 12:57:12 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1792E21D24;
        Thu, 17 Sep 2020 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600361829;
        bh=xuQmgvom3JUoAvAV6bjHRGM2H4w5dmPc0B4gmkTYQ6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2nIdFuBmgTsOPstR3DJ+GBSMq0yPAAhpUFrSGg0/b5nEQXGzDWyo4URkovlz+zduY
         TiGAzEIOjw5bQjqHndSbUTi23mZ6M981+fWk5OusyN4pN88Q7mqlhPf5azB2u/j/H4
         4bm/uys6PrWVv1lr1jiHQLAtdsXBSRv6ObSzXVeg=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        - <patches@opensource.cirrus.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Andy Teng <andy.teng@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Sricharan R <sricharan@codeaurora.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 13/13] ARM: dts: imx: align GPIO hog names with dtschema
Date:   Thu, 17 Sep 2020 18:53:01 +0200
Message-Id: <20200917165301.23100-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917165301.23100-1-krzk@kernel.org>
References: <20200917165301.23100-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

dtschema for GPIO controllers expects GPIO hogs to end with 'hog'
suffix.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/imx51-zii-rdu1.dts        | 2 +-
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi     | 8 ++++----
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-zii-rdu1.dts b/arch/arm/boot/dts/imx51-zii-rdu1.dts
index e559ab0c3645..ec8ca3ac2c1c 100644
--- a/arch/arm/boot/dts/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/imx51-zii-rdu1.dts
@@ -451,7 +451,7 @@
 			  "", "", "", "",
 			  "", "", "", "";
 
-	unused-sd3-wp-gpio {
+	unused-sd3-wp-hog {
 		/*
 		 * See pinctrl_esdhc1 below for more details on this
 		 */
diff --git a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
index 66b15748e287..c0a76202e16b 100644
--- a/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi
@@ -330,28 +330,28 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio3_hog>;
 
-	usb-emulation {
+	usb-emulation-hog {
 		gpio-hog;
 		gpios = <19 GPIO_ACTIVE_HIGH>;
 		output-low;
 		line-name = "usb-emulation";
 	};
 
-	usb-mode1 {
+	usb-mode1-hog {
 		gpio-hog;
 		gpios = <20 GPIO_ACTIVE_HIGH>;
 		output-high;
 		line-name = "usb-mode1";
 	};
 
-	usb-pwr {
+	usb-pwr-hog {
 		gpio-hog;
 		gpios = <22 GPIO_ACTIVE_LOW>;
 		output-high;
 		line-name = "usb-pwr-ctrl-en-n";
 	};
 
-	usb-mode2 {
+	usb-mode2-hog {
 		gpio-hog;
 		gpios = <23 GPIO_ACTIVE_HIGH>;
 		output-high;
diff --git a/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts b/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
index a0bbec57ddc7..3ec042bfccba 100644
--- a/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
+++ b/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
@@ -110,7 +110,7 @@
 };
 
 &gpio5 {
-	emmc-usd-mux {
+	emmc-usd-mux-hog {
 		gpio-hog;
 		gpios = <1 GPIO_ACTIVE_LOW>;
 		output-high;
-- 
2.17.1

