Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6415F66E5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 14:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbiJFMu7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 08:50:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231683AbiJFMuZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 08:50:25 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CECA50FF
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 05:48:19 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id m14so2117643ljg.2
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 05:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7tlOCAYHN2Y3xhk9dkRfACKtc8xJakVTM1MhtXVqD2k=;
        b=h6eKJMBwdqEDbYhlDNvQMGzlvN8Pa38wra1+xznZsxMnN19YeNfaMgb6HBKXpzPjY9
         6aF3RdewoNONIgx+DUMHXi3gcYS3RgqCJqmE+cM4EJxvQziRGGM32g9ORI2KcTlG/otc
         bjLP9sVNtxZpRO/V69FsIzXnf/h0i7ykTclWTpdupfEndx3XQpZCM3H2LazzbSryazeL
         xXyXWvpK3B3aHS4JPwI0J7zKpuaebWwIESNuYejSvcuHstHNG2Yq6mF/ZJaZdMJgn8oJ
         kAx+qhYGmkBr/wJBlz5pZKnTpGfiAbDOCIWPI0UgeV0HJmeJhyZrilPscrdFnMYaPUFN
         xn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7tlOCAYHN2Y3xhk9dkRfACKtc8xJakVTM1MhtXVqD2k=;
        b=hOvzxAAU1WeO3pqHfPrA4Fxn8AizqUFUnGxw66Pvw5KYcb9VJ64evTUet7TmCE337O
         FirmkuQk99Lk1+VAHDbyNi48sqoEr93NN7C8mCdCuuTLnwaog/RaiGF9iuRqRp33fUqo
         MNtYQos0F3I/dHdSHYiJbKOSZywfsFn007fJH8I+oNTY+o7HIg6xpemQqkjCzNhcXW3k
         G6pni7tB7/l2tnH3ORBDsDk9mLOR6bGl6zACEpIVoQww3Q9hHbrnCqYwbMdLYm4qtJ5O
         UNWnxlTPfV9rgeTRsz2m1cNs64TnHL9/edtSdyTlFzX/lRjTeERCw5Z3q1Oq8UueHW4y
         mV4A==
X-Gm-Message-State: ACrzQf1zsEhtqU9aPYoHXFyWOtbHV3od1DCM9LsjkEb5jIfBdyex5hRS
        lZ6qWM0QdUmZbaBP8V8EURWwDw==
X-Google-Smtp-Source: AMsMyM6KB4PUR76oRiqHSfHeSpFj4MsWPum8TlsqfYEZxykqXezsZsEKCGvLVpxvpoX3bGnm+yB47Q==
X-Received: by 2002:a2e:9f41:0:b0:26d:ee3d:ea0c with SMTP id v1-20020a2e9f41000000b0026dee3dea0cmr1795404ljk.328.1665060460579;
        Thu, 06 Oct 2022 05:47:40 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497a3e2a191sm2687659lfb.112.2022.10.06.05.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:47:40 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 33/34] dt-bindings: pinctrl: qcom,sc7280: fix matching pin config
Date:   Thu,  6 Oct 2022 14:46:58 +0200
Message-Id: <20221006124659.217540-34-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
References: <20221006124659.217540-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

