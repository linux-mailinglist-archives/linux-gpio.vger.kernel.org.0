Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A21E5E9B1E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbiIZHsz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbiIZHrv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:47:51 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4664A38684
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:45:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bu25so7596983lfb.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Zawl5uwjby0oyqN1nYVliQNubSbgLZAX+iK/cI5YQFc=;
        b=cnbHQr0Qor+baK/DW6RDWKmvrA6pubJlhEthFrOjL3IkshsAW6Xja8dsIbXMhZ+qcK
         PqES8iL0N2FMGPg/lvsiBeSlXyk1H988pnhvSldvcvSsiVjIWOBIwW51JV9UK0/TS4Ei
         3suj9jYCiBQ5NZDVfgUfMYztop49noQQ3C1jAEWE7QqI/UnG2DKIwRl9TrnwOHTdJWka
         2AwZrqec97sJL3frWglQh5+83vhq0JOdiRNOdxoOrDXysAwxI1H3QnBxFylatTwcX9kx
         1SqaEin0/lV0V9pV+z8KbBwOQbS6RIGPC7rFtf4LQ+IQ3rVwnKVauu5G0Pi1PsTkocJL
         +XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Zawl5uwjby0oyqN1nYVliQNubSbgLZAX+iK/cI5YQFc=;
        b=RTcyzRzIOXUtcusWtOMlD5DWMP6mQpYrsuT7Opkd/CrtPs1qA8xalSgOVYRrAPgOJJ
         pcZd7QYzh1ewgAkRlQ6whiSesiUWCz45DPoP8V5kG2U6KucjZ3VHiyu6PZ3V5EzOLVi9
         sPhStUi9sfP2VtelJCWdiA2ZcMI2ZTMQczi0Cg+xolS2VvrRGRfNC7LhoUu9HYRdqf2H
         a3VY3d7cFkmVY8wSjRbK4upIFLuzFAKvCeIBLA5CXWnEcrjwaZoML6MfvAXAFGviDYz9
         pPk7NdM0NxOOZwTHBj6EQqnmOjymMo3H8ZkJ8RKCASDz2kJBVSIZuFUaE1TwjjIYCQRO
         y5Gw==
X-Gm-Message-State: ACrzQf1I4PXFT4xGVHc7ZHAzn/7tZeRBuLtkozezi4YQ9FrUKJXhi+AS
        Z6RMrolWQf5TUaf3qoo+cxoB2Q==
X-Google-Smtp-Source: AMsMyM5cN7gvIDE1qC331/IQZfoXmEjUaQy9m85Qbqs4iOb9sT2pvPXPNoiQlgw+5bEdOIlV5gAW+g==
X-Received: by 2002:ac2:464b:0:b0:49e:b29c:2b04 with SMTP id s11-20020ac2464b000000b0049eb29c2b04mr8034527lfo.127.1664178326692;
        Mon, 26 Sep 2022 00:45:26 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:45:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 32/33] dt-bindings: pinctrl: qcom,sc7280: fix matching pin config
Date:   Mon, 26 Sep 2022 09:44:14 +0200
Message-Id: <20220926074415.53100-33-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sc7280-pinctrl.yaml      | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index ad3496784678..4606ca980dc4 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -47,9 +47,17 @@ properties:
 
   wakeup-parent: true
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sc7280-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sc7280-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sc7280-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -162,7 +170,7 @@ examples:
         gpio-ranges = <&tlmm 0 0 175>;
         wakeup-parent = <&pdc>;
 
-        qup_uart5_default: qup-uart5-pins {
+        qup_uart5_default: qup-uart5-state {
             pins = "gpio46", "gpio47";
             function = "qup13";
             drive-strength = <2>;
-- 
2.34.1

