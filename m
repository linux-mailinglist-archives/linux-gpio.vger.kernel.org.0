Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 388865EC80A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 17:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232458AbiI0Pg3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 11:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbiI0Pfk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 11:35:40 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3DFDF1D
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 08:35:11 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q17so11318848lji.11
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=a/30XpLg05lP1fCiQ5Ex9DrTpNtNR7LBlg8GeYriXvM=;
        b=phHYlT+QRbe+sHWRYfZZX07o3szcTyU3rsMUq3mnc80cOFouPurQtyXAd2dxG2nBeF
         vUp+0xTJRbaew4BzwFCjpmity4HV7rl767oVCNONxjO1AZrpZhnefpH05A1evIFzKBw2
         C2xZWFCU1TP45fzQiZrBcEL0t4xjQQHV2FC/saF+jqqEKlOyt9lfOzP2YrjP32emUDIL
         tDpJwHn84kkBu1lszhJYrVz9dX93z12osLDYozIgU09Q3b2qStftZxt3fvORgYex8Dh2
         3cqmLG6pY/ClZq5m2NnQOvxDyN1R1CNFj44jQ275W+2DkLXr0ax1i5oee0BvsMS5uONr
         cuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=a/30XpLg05lP1fCiQ5Ex9DrTpNtNR7LBlg8GeYriXvM=;
        b=mkcuN0lpOyWnF/1VCdTC1ehBl1N9EwRyqNAp4cmgljk8hCJlrzOBfBngIuyi+kJoKC
         Jv+w/pD9yelT6TUJIdSrd2OP9u8cLdPEzy9+eFOHpEjxfDQCPs3dXOIuy9o7tmWjkZmM
         Y+lyLZO+rWoHHnNCekJXpdaWZw8og37DqcGuDSYL72zmnx2+xGciYHnHV+/jmaQ1fxNL
         03U4D7B8W1j1OEIlveZ5lpKvmkppLBoXj5Ntqwzsq1mG+tthPcaBKigOT6TNfNSZxcl7
         oJQgfzQMAJjhOdvaTCIiiIQOekx8alju5ZymnJW5TCfM/T0BDK3I48qZkA1u+/+VRROa
         ajeA==
X-Gm-Message-State: ACrzQf0xamKzGqEaGsE9Ucu5DKJdcOdbzHALg+4omfTe2KlG9go6FkUj
        Pvijow6DazmML7Y6UkJ7zQE296abaLZIsg==
X-Google-Smtp-Source: AMsMyM4nzU37pD3JE/74DC8Y5b0AL0VwUV8CXSjoBKvT+6RnxdjOnEl7oDB0CowHVmmqp5ahufQTcg==
X-Received: by 2002:a05:651c:2381:b0:26c:5965:c9b4 with SMTP id bk1-20020a05651c238100b0026c5965c9b4mr9448725ljb.99.1664292910666;
        Tue, 27 Sep 2022 08:35:10 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:35:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 10/12] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: fix matching pin config
Date:   Tue, 27 Sep 2022 17:34:27 +0200
Message-Id: <20220927153429.55365-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
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

The LPASS pin controller follows generic pin-controller bindings, so
just like TLMM, should have subnodes with '-state' and '-pins'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../qcom,sm8450-lpass-lpi-pinctrl.yaml        | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index c17cdff6174f..c81fd74cde1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -43,9 +43,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sm8450-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sm8450-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sm8450-lpass-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -132,4 +140,28 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&lpi_tlmm 0 0 23>;
+
+        wsa-swr-active-state {
+            clk-pins {
+                pins = "gpio10";
+                function = "wsa_swr_clk";
+                drive-strength = <2>;
+                slew-rate = <1>;
+                bias-disable;
+            };
+
+            data-pins {
+                pins = "gpio11";
+                function = "wsa_swr_data";
+                drive-strength = <2>;
+                slew-rate = <1>;
+            };
+        };
+
+        tx-swr-sleep-clk-state {
+            pins = "gpio0";
+            function = "swr_tx_clk";
+            drive-strength = <2>;
+            bias-pull-down;
+        };
     };
-- 
2.34.1

