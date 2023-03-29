Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACDF6CD587
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 10:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbjC2Izw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 04:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbjC2IzW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 04:55:22 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8981546A3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:55:07 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so9081443wmq.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfv77BVZkJVCikonyTsjNYks4OjSzyX47Vy4hDh/Sg0=;
        b=6SQOn3AJXk0D5Kmi5TeP8s87oZ3KX+eIQfpKDAuDtGetLDd9+GVbBxu4RqkbYL8PHE
         DfVRGafoTh26zXW+hO1Frc4nH4o3B6J6VH1tYwtwNURXrES+YzDKk99tSeWDlliCqwzq
         zUjdWynxSFX0vAiT8DiuQRVAcQlqJrOy4fHil/9G9VZnThrzNNGk2rRGIZax8sItmxVZ
         mFOktn0S90ci9viYPO0tkYCC1tQy1oRQUbhucGHnZ88doT3Aupn3OP5uNpgwM5GK6tz9
         Zeoo15TMG0l1qb4Os2mOV1uTiHn/b0L9LaKoJSip+Cd5CO7+fzzYnPd1jLzlAE+2lKTu
         a3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfv77BVZkJVCikonyTsjNYks4OjSzyX47Vy4hDh/Sg0=;
        b=e8VRYnKFXPU22CisfGlrkBnCa17GDSmVP+ceaiXnQBMONFfjKbOZQdby5pIH37f8hp
         q9DSHzPmeOEGAX/0CnRDNEEQpC3G7HtQcp0fJPrbVCEzs9++1EcVRdQbOQl6YxjOZoek
         rXJZqgjTR4fV247JTNcToqIBiCUlYeHLqHlmWq2cZ5pO4ZtKOzw8HH/Z7OHbLkmBBxeg
         UhEM3r26XJ6DCNDlMlGTbBnO5htUviFpdYofXXOEB8onGZ9OyoAhr2GWrv1gW8HuBuyH
         /EWG576L+GA3pPGwJCUzyFqIx52zpnmXrCaTE39/7olpK7iWjeJGbPS9U0QrcMcKhppy
         CApQ==
X-Gm-Message-State: AO0yUKX7veT7BUxyYZyyBEh1TKgUka8oBa3+oRfjx5TbYwLjc1lpV0sW
        4XEiPS655CqNPqnNb/MZgWGkgA==
X-Google-Smtp-Source: AK7set/NurkZ3bIlLrAgkr2Y6JZgLdOtnj5zDBVm+jrx0GGKfsz6ayM5R8SktVJ0Y4FoVQt2ebs1jQ==
X-Received: by 2002:a05:600c:20f:b0:3eb:5ab3:b6d0 with SMTP id 15-20020a05600c020f00b003eb5ab3b6d0mr14323525wmi.6.1680080105715;
        Wed, 29 Mar 2023 01:55:05 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:05 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Wed, 29 Mar 2023 10:54:32 +0200
Subject: [PATCH v3 11/17] arm64: dts: mediatek: add usb controller support
 for mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-11-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=C4mUGelmedcnsN+galzBspSPAKiY8Y1mIDOmQThfXX8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcIyxSg+PaknWT166wpFSYZfFQS1WkE9JumQvN
 r/47U5WJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHUReesD/
 9Qb6O84sJevPXhmoLp2Gww0rkY/wGRPEGhBPMtfdiR5LM+AiXe24K1XkDzxLktmXzK+/9Fa7OA0yo7
 hvMCbtYq4McT6FnpWYmbHBx1MBvi4w/TimSalwDbqWhAWeRcKF1o3mwtOjqsoonDX1659VvaLRpd1D
 j/eSGdU/OM+1SXVft/W+cCmln8toeVaxzbtErhbJY1f9BUuUK4fA+jvrAUIeUxGy6md37tS2OiczNz
 4GCQaCo6lBbBmBY/LiG7VphksjdUyITtup1O2TLYY2Mj+5B2gcryHrDTiS9nhj6ICXuMzenIQ8n55k
 i9Q0iGBKds6nxmpkP+qfFKnNR4J+LabVedbbscReeTzGmy3gLOwAQc/Y3b/uJTYARd7o8yz0FBW+KV
 o0AOU4XAd+dHvn+HxQuUoYDqhrcYFZJB+sH6ukVGQ/7SWl4xSOefWZ8M/Z0gXFNW7zTpqTgXJp8COd
 a22ukHnSgKftyzmwPEuHIuANmIs/jMxvNmlguRvAtyNn5bBzUERa9RdVmhsc4LhBI9/rp8HxC6VH66
 ygLXqfqP5SLBN7Y5yIawKtk/ssllkPGTtdlfVqoRYMO04qvkJDhaik6aoH+bu0WQ1ufMBOtAE2jvj0
 nCt6N/VUzwEzbBt5zSb7HBBAGaKzBGwVpyhM0/g0NhfugxFDEwgoszrw6cdA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch add support for SuperSpeed USB, in OTG mode, on micro connector.
It also add support for the Extensible Host Controller Interface USB.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 22ec332fe9c9..868ee0d160e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -319,6 +319,28 @@ &pwm {
 	status = "okay";
 };
 
+&ssusb {
+	pinctrl-0 = <&usb_pins>;
+	pinctrl-names = "default";
+	maximum-speed = "high-speed";
+	usb-role-switch;
+	dr_mode = "otg";
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+
+	connector {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		type = "micro";
+		id-gpios = <&pio 17 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&usb_otg_vbus>;
+	};
+};
+
+&usb_host {
+	vusb33-supply = <&mt6357_vusb33_reg>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins>;
 	pinctrl-names = "default";

-- 
2.25.1

