Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E241151E9B1
	for <lists+linux-gpio@lfdr.de>; Sat,  7 May 2022 21:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1446991AbiEGTxa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 7 May 2022 15:53:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446947AbiEGTxX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 May 2022 15:53:23 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE2618393
        for <linux-gpio@vger.kernel.org>; Sat,  7 May 2022 12:49:30 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e2so14235787wrh.7
        for <linux-gpio@vger.kernel.org>; Sat, 07 May 2022 12:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=muzSmk4HxrsIFmpzKu6rGnfQn249TNHvGp/FqIyK43w=;
        b=KPftFVj2wgxX8C02mxFoARQwk0V476TUyK139A8Wd93ZvqhkkiAVO93ODAwoEH8ap7
         3Pd6nmxqiSqbo6Dx3sZjLNlzd5jQPXB2f3SvdrOOuKfuXWFpDW7a72SMnFxM3f6TIy9Z
         G0c3LyAgcyC6GVsvHg0pORfDNnGqSN6VZtIjyfO+k90DJGWN8gVJ7a2dvyCTfn8Cf1Id
         9xzzR9K16ikCM6SGNtYrfI5OuUcGmIgvocIY140cW44lLV1XWq/e3ldunBHEgoQP0Cuq
         QqbzAUR076WLoaS7t2cbbwZbS2ZPKJytlQmaOPLI2eMLlv6qckjb0foDKDZ0u/ZDLELo
         81pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=muzSmk4HxrsIFmpzKu6rGnfQn249TNHvGp/FqIyK43w=;
        b=41gr2uw7AxWm64FUWchRT0oIex4KSXxG5gcr8Q55cMz1kyWbqr7ZchC+Y0hMgN3BSJ
         MX9yqvwCyAn30E88CAVKyeEnNvgayckSryLV0wwNTW0mYUVAuRwFPjSfdyhYuUMDI0bM
         2nZ3xgmKXjIB1AbiKLy3bFuLgfSpjj66o8/LY7p0Gwus8B8TZquNQHSWRIOIVBrWL5Gz
         6OGEmx0AKZ+HzV07qPzHtAf3rzKZiz25kn84TgS/0Becn7BiauhaPdjMZuJhkuF+5Qzs
         7fXuBiJbUQUkncOI8/NSvtwZnxy6HZj9OsIFoqbXmxftb3bx0XGd9otKx5mBVujZ9oES
         7Ehg==
X-Gm-Message-State: AOAM533WxhO6J8rZd7+NkLJPUM0t+p+brCV5yBenmTewhIQpSNu7c8wL
        bIlY4RgI3625yr626f4GwfKPbg==
X-Google-Smtp-Source: ABdhPJw4a64BTiPPtVqCq4tVSggp892p05eZRr6miMyOtU/Bck3iGmFAEFv2OSfIK4a12mA0wCXyHA==
X-Received: by 2002:adf:eac6:0:b0:20a:e096:c4 with SMTP id o6-20020adfeac6000000b0020ae09600c4mr7507435wrn.139.1651952969051;
        Sat, 07 May 2022 12:49:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003942a244ec4sm8535027wms.9.2022.05.07.12.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 12:49:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, David Heidelberg <david@ixit.cz>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/11] arm64: dts: qcom: msm8994-msft-lumia-octagon: add PM8994 pin properties
Date:   Sat,  7 May 2022 21:49:10 +0200
Message-Id: <20220507194913.261121-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
References: <20220507194913.261121-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The bindings require that every pin configuration comes with 'function'
property.  There is also no 'drive-strength' property but
'qcom,drive-strength':

  msm8994-msft-lumia-octagon-cityman.dtb: gpios@c000: amsel-high-state: 'oneOf' conditional failed, one must be fixed:
    'drive-strength' does not match any of the regexes: 'pinctrl-[0-9]+'
    'bias-pull-up', 'drive-strength', 'function', 'pins' do not match any of the regexes: '(pinconf|-pins)$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index 9161b9e1bda1..abe746e88ce1 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -521,19 +521,22 @@ &pmi8994_gpios {
 	 */
 	hd3ss460_pol: pol-low-state {
 		pins = "gpio8";
-		drive-strength = <3>;
+		function = PMIC_GPIO_FUNC_NORMAL;
+		qcom,drive-strength = <3>;
 		bias-pull-down;
 	};
 
 	hd3ss460_amsel: amsel-high-state {
 		pins = "gpio9";
-		drive-strength = <1>;
+		function = PMIC_GPIO_FUNC_NORMAL;
+		qcom,drive-strength = <1>;
 		bias-pull-up;
 	};
 
 	hd3ss460_en: en-high-state {
 		pins = "gpio10";
-		drive-strength = <1>;
+		function = PMIC_GPIO_FUNC_NORMAL;
+		qcom,drive-strength = <1>;
 		bias-pull-up;
 	};
 };
-- 
2.32.0

