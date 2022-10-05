Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD705F5941
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Oct 2022 19:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiJERof (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 5 Oct 2022 13:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbiJERoc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Oct 2022 13:44:32 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8AD67F129;
        Wed,  5 Oct 2022 10:44:29 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so1449068wmq.1;
        Wed, 05 Oct 2022 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PVLrACcSKUPhaj5dkzpeft8dc3na+SzUoUyCH0CxQdc=;
        b=Tk4NjlU+VOxHKIsEw2EUSin/HX3FoWKLmZDv+lcKUEwSnubc6aCGjIstUP7FTRKgVb
         e8NlpqANvLc9Ca9bOuoszGrTmUDZt+YBTNZvt0XmTMrTcdRfwisuQFqlXLU5q4oWOcuR
         G6tbtgu+mXDWEs/+SH1rY+WHzr1fUlYhEcNiMwzqpFipDjENrHwchoTkq8Ti0E7Oa3Pw
         6m4NsWxD/AP57pE4hFKmh2aqGTvLH9MoZUJ/itR8u0F1i06mlGX/huBDFhjIUtssD8a5
         R/5GCsiuYRtpZflMuyLafy9rBFuJoO7CRSyhw9Ttpz8v3g0W1TRhv4eGI2uCn+tn5G1F
         2UBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PVLrACcSKUPhaj5dkzpeft8dc3na+SzUoUyCH0CxQdc=;
        b=u/PwAN9IEKreTNELQ14LhKn1QQXp21rWO7Etn7OPr7bgn2NdGbQ5bronhdX8UgCHr1
         yNmishZIGyqLhvb/DdJJ8Rv6DU4KPWBZmRjJkVRGS28bCSvVYhfmuttMswT1u0i5v3ca
         qk4VaB6BSh3GZPbk5O76MHeXkQcmczntS8shjnPnH3JBd2se+FkAyr0ujbGk4Gi6iqWJ
         HldQRAy3PzdBqj2NqDRZNAHzdcGzBJrFk/uJbQYEKLmR7bl2jmETsEqHep33Zd8y5st1
         GPNVYfr9JORoVpesiW0J+HTE4RlVGisBH8gJiJLu9Qy696zk1AWm2/Z1y8G6a3Fc+a9t
         ffWA==
X-Gm-Message-State: ACrzQf20stEz+NjSDRxq5UTig/thMkiOLztgoiY1pLshUzxx/uoY5NdY
        KMuYM0oOyxXr3a4IGGO/n+U=
X-Google-Smtp-Source: AMsMyM4gY77KwLcvBY22FBZ6f45NZC/vKIzozOpZ3dpyCHDyD7Xdmj00U0N53CsRSoou0ilOyTDH5g==
X-Received: by 2002:a05:600c:348e:b0:3b4:a9f1:c240 with SMTP id a14-20020a05600c348e00b003b4a9f1c240mr4126831wmq.192.1664991867935;
        Wed, 05 Oct 2022 10:44:27 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id c6-20020a5d4146000000b0022a403954c3sm16075491wrq.42.2022.10.05.10.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:44:27 -0700 (PDT)
From:   Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Yassine Oudjana <yassine.oudjana@gmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT bindings
Date:   Wed,  5 Oct 2022 20:43:40 +0300
Message-Id: <20221005174343.24240-8-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221005174343.24240-1-y.oudjana@protonmail.com>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add -pins suffix to pin configuration nodes to follow DT bindings
and pass dtbs_check.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 15616231022a..0c2b477184ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -135,70 +135,70 @@ pio: pinctrl@10005000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		uart0_pins_a: uart0 {
+		uart0_pins_a: uart0-pins {
 			pins0 {
 				pinmux = <MT6797_GPIO234__FUNC_UTXD0>,
 					 <MT6797_GPIO235__FUNC_URXD0>;
 			};
 		};
 
-		uart1_pins_a: uart1 {
+		uart1_pins_a: uart1-pins {
 			pins1 {
 				pinmux = <MT6797_GPIO232__FUNC_URXD1>,
 					 <MT6797_GPIO233__FUNC_UTXD1>;
 			};
 		};
 
-		i2c0_pins_a: i2c0 {
+		i2c0_pins_a: i2c0-pins {
 			pins0 {
 				pinmux = <MT6797_GPIO37__FUNC_SCL0_0>,
 					 <MT6797_GPIO38__FUNC_SDA0_0>;
 			};
 		};
 
-		i2c1_pins_a: i2c1 {
+		i2c1_pins_a: i2c1-pins {
 			pins1 {
 				pinmux = <MT6797_GPIO55__FUNC_SCL1_0>,
 					 <MT6797_GPIO56__FUNC_SDA1_0>;
 			};
 		};
 
-		i2c2_pins_a: i2c2 {
+		i2c2_pins_a: i2c2-pins {
 			pins2 {
 				pinmux = <MT6797_GPIO96__FUNC_SCL2_0>,
 					 <MT6797_GPIO95__FUNC_SDA2_0>;
 			};
 		};
 
-		i2c3_pins_a: i2c3 {
+		i2c3_pins_a: i2c3-pins {
 			pins3 {
 				pinmux = <MT6797_GPIO75__FUNC_SDA3_0>,
 					 <MT6797_GPIO74__FUNC_SCL3_0>;
 			};
 		};
 
-		i2c4_pins_a: i2c4 {
+		i2c4_pins_a: i2c4-pins {
 			pins4 {
 				pinmux = <MT6797_GPIO238__FUNC_SDA4_0>,
 					 <MT6797_GPIO239__FUNC_SCL4_0>;
 			};
 		};
 
-		i2c5_pins_a: i2c5 {
+		i2c5_pins_a: i2c5-pins {
 			pins5 {
 				pinmux = <MT6797_GPIO240__FUNC_SDA5_0>,
 					 <MT6797_GPIO241__FUNC_SCL5_0>;
 			};
 		};
 
-		i2c6_pins_a: i2c6 {
+		i2c6_pins_a: i2c6-pins {
 			pins6 {
 				pinmux = <MT6797_GPIO152__FUNC_SDA6_0>,
 					 <MT6797_GPIO151__FUNC_SCL6_0>;
 			};
 		};
 
-		i2c7_pins_a: i2c7 {
+		i2c7_pins_a: i2c7-pins {
 			pins7 {
 				pinmux = <MT6797_GPIO154__FUNC_SDA7_0>,
 					 <MT6797_GPIO153__FUNC_SCL7_0>;
-- 
2.38.0

