Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 026795EC7FC
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 17:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232611AbiI0PgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 11:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232486AbiI0Pf3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 11:35:29 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF84BBCB7
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 08:35:08 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 10so16316843lfy.5
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HDa8wjH/lG/uqvKI36+FyWXipqAIVdMoas6P1y2oLK4=;
        b=ecgorGBLuqdqP98aUYHnZRcGkxti8LuMg0VQSKOA+pSCx3YkGNZjAipkTbzzHaGI5z
         nVjFk3Rt1LxsaiNOnEr6TkpiJ8hy6O2eb1Zqs9jMj+G1VIiwmhPbaG0ODQ1TLoyIPtry
         H4QDfiGSlQidwRTjLoOscBbT9iu7tphAdbXUKZTuvMKz3ZJQHa8irlAEVZdXF0jnBzx7
         1Sp9lmG2vpznPRjvLm/axzsFfXCxiuOUifHh8ZnUo0Br/kbhpnnD/6j1EVzyUAzYqy0b
         OFF/JWxqTJK/ns6OU8Od7dgaxet8sC+3hDzlnFd3i3BeFcsK933TRkkvkfKaebrkzH4L
         n9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HDa8wjH/lG/uqvKI36+FyWXipqAIVdMoas6P1y2oLK4=;
        b=WO6zGSMKTB3NvpvD8xHArMbbKbUqvklzSczhCnIGL+l/cHhLW2I3rnMrfu98oa53+o
         p6MqriOsoE1Lhf2Tr7lAtjIXvjbYBfF4LLP6N1/C+iOf0boH/p1lHr9greSZw/bKPE42
         mmNTI6D4UB05qMZBKxaygjIPRSdD2us4WbNAkgOMYwmcXvuanurpN1FlQSp11VPW5lIO
         6bydggR5HiXLbfaUK63IPOSr2yKvJiyvQPCRAzxwXETlImmZnGPu/093vdbEN1y7TcsM
         gQeugQeM0EyEJ1OTNA2FBAV3zF5MRqd+o2NFhxTH7sq1R7Px98HAQenV6i0jn59AUX/Y
         gvpw==
X-Gm-Message-State: ACrzQf1r2otPVvvcZaEQqabIcRJjrn10vv+M4CU4E/PA+5dSgX6+Ppdp
        qjzBv0QvUYi10XQzqK+LRgl2og==
X-Google-Smtp-Source: AMsMyM6gvxJW7RUzRiMxPRd9DkCTVgwJIaA97CwE8S5qgmiVMbzvmsYzObj0QBQs+l5FpW3xkqVRdw==
X-Received: by 2002:a05:6512:3ca0:b0:49f:f620:b826 with SMTP id h32-20020a0565123ca000b0049ff620b826mr12636816lfv.375.1664292907692;
        Tue, 27 Sep 2022 08:35:07 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:35:06 -0700 (PDT)
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
Subject: [PATCH v2 09/12] dt-bindings: pinctrl: qcom,sm8250-lpass-lpi: fix matching pin config
Date:   Tue, 27 Sep 2022 17:34:26 +0200
Message-Id: <20220927153429.55365-10-krzysztof.kozlowski@linaro.org>
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

  qcom/qrb5165-rb5.dtb: pinctrl@33c0000: wsa-swr-active-pins: 'pins' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../qcom,sm8250-lpass-lpi-pinctrl.yaml        | 36 +++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
index 06efb1382876..78da5d2bb353 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
@@ -42,9 +42,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sm8250-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sm8250-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sm8250-lpass-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -130,4 +138,28 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         gpio-ranges = <&lpi_tlmm 0 0 14>;
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

