Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCE06686A86
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Feb 2023 16:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbjBAPnd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Feb 2023 10:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbjBAPna (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Feb 2023 10:43:30 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B30721E0
        for <linux-gpio@vger.kernel.org>; Wed,  1 Feb 2023 07:43:27 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id bk16so17700181wrb.11
        for <linux-gpio@vger.kernel.org>; Wed, 01 Feb 2023 07:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPa7H1up+Az85ZjO9SEc8vDajv1jrdObTnlN/HBB+Nw=;
        b=MJhfVU0j1TG9YBPOl/Wh8uSACPotq/MWa+rfiZFrKYoyoQasmFtLYl5r4zqphi6Obz
         QQ0t28oJo+3aQ9DfEk0NH7+bASI5+TZxNkHGwxAfuAISuB7nozV6UeRuxyFlbA4DfwRh
         F2JktmejZ49rOe/ohfHLgF4sSptWmRHImxWuVvnzo+ePmsYw/e+qMUHqoJXfk4soFagv
         VecwKZU3ZI63E352iJ+t1Swn1VhDBLREt5pcCIzNJJ35FYDMfjPwbLU3gBLbd7x9H10d
         WHtISL7mTCdflWo6qjhnNz0e4l9grgQUKuFBkT+zN0EnoHtU8wjSlY+NIRMP4HVTE7PX
         nBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPa7H1up+Az85ZjO9SEc8vDajv1jrdObTnlN/HBB+Nw=;
        b=fKPoS6dH1w8LGpXhChnnJ6cwOlka3bYJQDHLkw/HG4J70mwtK1nZGpNBl6vC8YyXhL
         57/bSfe6VieheBcsJSaih8+vxDIA2Ptm9szUetaCnLMi3N9gl4ab7g9lD617u/7wbNaU
         bcfsQTrHAoIElDwl7/E8sFnjRYvT+wjjW9AVhRseX5JSKJpSyTMdvP6CRXSXuu3Kg0CF
         g+oS/ItO7I3RA4qiaYW0DYz7jeCTOWxVFn5bZ2Gf/4r9ANl4a76608j9bQ5Kpu8+hOmF
         b3xrDSBIfNj/bgwSsOXrAnmjGlI+qgLxeYSHPW09uBcUXUuZufwzesaju+IjsD+eeMx9
         tu3A==
X-Gm-Message-State: AO0yUKUmh54PCVyIkZbVQz7kUGYUBRItBzirFZvdx1ze+T9P+Mw7bIkC
        MOe21MQt1Gwid0NEgE6fdxAjwFuvpgo6nuNl
X-Google-Smtp-Source: AK7set9PQcFgM0EqdGQF+5zGz3q7jNt/e/dDExpzM6xD7uGuXpe2zT1DhbMIft81u6i1t/Lpy+iOPg==
X-Received: by 2002:a05:6000:12c6:b0:2bf:f4f7:be9c with SMTP id l6-20020a05600012c600b002bff4f7be9cmr2008644wrx.14.1675266206005;
        Wed, 01 Feb 2023 07:43:26 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d598f000000b002bdff778d87sm19374487wri.34.2023.02.01.07.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 07:43:25 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] arm64: dts: qcom: sm8350-hdk: align pin config node names with bindings
Date:   Wed,  1 Feb 2023 16:43:19 +0100
Message-Id: <20230201154321.276419-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bindings expect pins to be named with certain pattern.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Endless work... People keep sending patches without running dtbs_check
faster than I am fixing existing warnings.
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index df841230d1b7..ece1a7cb8b3b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -723,7 +723,7 @@ usb_hub_enabled_state: usb-hub-enabled-state {
 	};
 
 	lt9611_state: lt9611-state {
-		rst {
+		rst-pins {
 			pins = "gpio48";
 			function = "normal";
 
@@ -731,7 +731,7 @@ rst {
 			input-disable;
 		};
 
-		irq {
+		irq-pins {
 			pins = "gpio50";
 			function = "gpio";
 			bias-disable;
-- 
2.34.1

