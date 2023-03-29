Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEEC26CD56D
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Mar 2023 10:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjC2IzS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Mar 2023 04:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbjC2IzF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Mar 2023 04:55:05 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B22A44230
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:55:01 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id t4so9615970wra.7
        for <linux-gpio@vger.kernel.org>; Wed, 29 Mar 2023 01:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rZkILxJ6Vtdq68bw7xQdkDENEKZGoEfmbEhpMPLgunQ=;
        b=Ny6tinp4SScaEinyAVcA1g96VbU9Zxjhx6xZKgAWThDifejuVWHjbMCEh8U35ZiJDA
         QDApYEsf3dDAPyRUrmaq6lvd+o3Enf6XO2kMBa8uzVjx8XnKuGUZXyNIjKKDeGdem1Xw
         klMSHcxFwQ1GZaQ9C5xtA0BZ/lr5jcX3oJuRWXp3UXv1NX1KzYr32sHxZzwugmQ/7+DD
         OzEqJwGTaCfgPrtash0//Vyzey3EO2Vwtek1zQpUnllh+K0ckgTqIfndRzTFhKdN6niq
         B5rmTjQRK9JNE9hSdAjQ8q8SKjJJoAuAbj21qpWVqTbSGnOHJvHOY7M71j4AmTUwrPnV
         mOmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZkILxJ6Vtdq68bw7xQdkDENEKZGoEfmbEhpMPLgunQ=;
        b=gnat+jFM0n60P3Exw6d9G2LNCKNH+G1WRGmYgHmSnCUHIkX4Z4CXR/xEuPr5I5NGKN
         naRctWwzWERPjEA1w9p2WFSf+7O1RLigM5gwwU2yjwZicncaU+JD6Z314wNKXi00Oaab
         6FX3eyxn+vKxmb79ZIYmZBAuAfvPtwrkvGy/SZZqHJuXQ4r2XMoUB5TiyA9D0uv90Hv6
         Nvs1pPU3DQOk2Z+hW3+swsum31vDSGA+SrINm8qbg8VzhIf1BNaUic8E++dWx2w2GtKH
         3wSJ+uDVPy0GNxzX7xMKoRQYsbASJq++Ax+QpSoZOGj0lkTenCwCk22P5ILwNpSQiJCl
         9VbQ==
X-Gm-Message-State: AAQBX9cvCXODAVAWx7hSDFltDWzScE58/CjUoGcsUgU5zvnCW/s6LXIs
        5wC4XaMV/ASgeDTtL9wmZe/hkQ==
X-Google-Smtp-Source: AKy350b0yT6nbLsCeQANzdZ+qiRWtYtBEfnPCEpncN68p3xH4zjYNQ4QUiexTT7C9yCqb/8lv8XpIg==
X-Received: by 2002:a5d:4092:0:b0:2dc:c0da:405 with SMTP id o18-20020a5d4092000000b002dcc0da0405mr15607320wrp.34.1680080100138;
        Wed, 29 Mar 2023 01:55:00 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:54:59 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Wed, 29 Mar 2023 10:54:27 +0200
Subject: [PATCH v3 06/17] arm64: dts: mediatek: add pwrap support to mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-6-0003e80e0095@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Ay42OqgaWXvHkBRm3v2vHFu33Ywvrn6P8agKkr3sTyA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcx8eMVGJOaH7KITHH1a/93g25ff5aNwraFW5C
 H2SwKpOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURfNjEA
 CUT9/wBAHlA652cq3MF4x2dcUTdIqyBnrdlzHUyA6XXI+4fkuTT6Dp9y9lJwNhF6JYdUM/4F0+03wa
 eZQIGESAlZ14lE0A/YhobEfW+ZPGWjOcTpFg9JM125YacFOXXwHRQIW4oSYIfIt1fm9MgptEXuX3a5
 axWlnc57w1loWLZ9QKEEsF3KwS7mlaMeRyr4Fr+fMvPqRyKDL5fwYAKiCY2OK6CqEJYtdd59KB+hkS
 bXh7CWFkVTJpeDtcqryZwkbY22zs7gKe7UzZUBORIYXUFsqcpJuwXjpEbXWNMw5xYhx5Npxkcij4ES
 MUb8xt4CUCTX1/LaPd78oSpUQF+JVvWte2KV/qaEmcsFA4WWDkL5bnYYiJUrTln+amy8vkgJm55txQ
 KhKJCFyIuOs2QmoLQlnjOgTpBqQTRG4vPaooD6StLWW6wfgJtNFLyH03zP0Gdfeo6OeliK86/J+GDY
 +nlTO41FutAeGc1LuyqKa/X8znvJ4KPuPnRGemO5wQNxcLJt1m/yUYragSFKAVXAfdq8hSgeS9iOLe
 iKcK/+t1R+S0xHMwj1bjHOobNj2V0DcTj3LGUr/jZF2felDdBV0uhTnOQCmMeiRuqgkDJ1gLt5J8i6
 LGVwP7CuiByV0hAZn7C6sunGcK+2z8LuK32i5nAZ88t+wTqFZOrLUlP+HOlw==
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

In order to use the PMIC, the pwrap support should be added
to allow communication between the SoC and the PMIC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index e018df6844f6..687011353f69 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -186,6 +186,18 @@ apmixedsys: syscon@1000c000 {
 			#clock-cells = <1>;
 		};
 
+		pwrap: pwrap@1000d000 {
+			compatible = "mediatek,mt8365-pwrap";
+			reg = <0 0x1000d000 0 0x1000>;
+			reg-names = "pwrap";
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&infracfg CLK_IFR_PWRAP_SPI>,
+				 <&infracfg CLK_IFR_PMIC_AP>,
+				 <&infracfg CLK_IFR_PWRAP_SYS>,
+				 <&infracfg CLK_IFR_PWRAP_TMR>;
+			clock-names = "spi", "wrap", "sys", "tmr";
+		};
+
 		keypad: keypad@10010000 {
 			compatible = "mediatek,mt6779-keypad";
 			reg = <0 0x10010000 0 0x1000>;

-- 
2.25.1

