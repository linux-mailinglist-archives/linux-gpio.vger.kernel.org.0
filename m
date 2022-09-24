Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3AFD5E89C9
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 10:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233803AbiIXIGs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Sep 2022 04:06:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiIXIGC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2022 04:06:02 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22EA4123D91
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:32 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id i26so3481249lfp.11
        for <linux-gpio@vger.kernel.org>; Sat, 24 Sep 2022 01:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tI3YcFf7I0VJoXV1p2liiPk9SIh1pwH6bZoypN8Fx6k=;
        b=cWc7G8MNLRbZcxslT7vdZB+/ctFVAmxxoDJaqE4owUMdEs8S++51x+EjSTNA3u0R2g
         /2bJDt6gT+H0nBTSVhO+TRSyaL7gISRjYGZud88UNv+9FbmaBrXCnV6ZetVDWE1T8+hH
         5K3ESnAJVMG5RqSyheidTMQCDt9iZtkX8ozvfgQGpLG93xLfR4/y+pSmN5wSrAYAgF4Q
         LVVXHyYQ6YyxdGMKrhGehKafAQ/CsYB+TXKi2p29soCVnwqTLbT4YG83KOKdDrVZmt8p
         L0Q3mHwbo+EzF5dcRdlnUpYN98T74GVEQ3O6xxqEaddoVGpBeab8Zq7DgDiiAgBrzJC+
         KmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tI3YcFf7I0VJoXV1p2liiPk9SIh1pwH6bZoypN8Fx6k=;
        b=3+y0ruWz+JlL6fPHKmE8wzJwnDPc+qojVpTqkl3kmQQylRZkQdS1m7pJ+ZiixOGMjj
         bq9UeVQs0TzNPigWYB7mel0qviW57zbyUFtE7O2hfjRAgQrVZ/COm9Ddd+LyKzpdIOrD
         Zh/qdpa3uvnTHyBrSdOeVtQiNsl1z+I/uJ6DSecdgvqLdjbqaReFY60Ro1NNE7qO0eQO
         eTIVXC/KeBfbEjLokoj6Ky6CVjevLMVM2ZpTJ6Xarv88OlJzQUNBU9u5Hprz1Rt5cYiU
         FCDKk5yk8n1/U3tnnBxLztvxCCtCjngF1Yt0dE4vHzZuaxQwHQ0HkR5y2SsZYcqoidwD
         qoqw==
X-Gm-Message-State: ACrzQf0rRIyPabapjMqpMGtvaQ0BWb3R3wNMkBBsygDym9maZ0q/jngU
        WbX+jMJlxH7ZbV3gqi4Zlcn6BA==
X-Google-Smtp-Source: AMsMyM5QCZvY2kSyIDjhblOVJmECCo6yI6RDv8+qGfm/6pF5i4v72BGYL98vajM+mR/NUgglM2gnEg==
X-Received: by 2002:a05:6512:2820:b0:4a0:5395:20f0 with SMTP id cf32-20020a056512282000b004a0539520f0mr2479425lfb.384.1664006732189;
        Sat, 24 Sep 2022 01:05:32 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 19/32] dt-bindings: pinctrl: qcom,msm8953: fix matching pin config
Date:   Sat, 24 Sep 2022 10:04:46 +0200
Message-Id: <20220924080459.13084-20-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 .../bindings/pinctrl/qcom,msm8953-pinctrl.yaml     | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index d4da558cde54..c162796ab604 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -44,9 +44,17 @@ properties:
   gpio-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-msm8953-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-msm8953-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-msm8953-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -163,7 +171,7 @@ examples:
               #gpio-cells = <2>;
               gpio-ranges = <&tlmm 0 0 142>;
 
-              serial_default: serial-pins {
+              serial_default: serial-state {
                     pins = "gpio4", "gpio5";
                     function = "blsp_uart2";
                     drive-strength = <2>;
-- 
2.34.1

