Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10E056001E8
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiJPREW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiJPRDr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:03:47 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420B83847E
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:02:46 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id o2so5421516qkk.10
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFK0jWSBGCqHueR6jez0prdbdNbJLNaBR9Qi0IdExSc=;
        b=zM+iLqfMP+UU5vkPKb2LwCNmEiZ1PnkKbrNOVbBM2k84fnpKFxK4IsXeYL0jdLkYqP
         pDGpl0cabRXNtidN57wKwwRLrG066yDvuTnpcyZ7bCMjwuG8E8WxnKz3LSMFSKxamrs3
         pI5SZ1Ab1iefp8n60rSG+Dbn5HanzJ7xSemWpPhOMJKnSY5HJJ6Sq+J6YB4EpfbuQlxP
         rusH8zqSQFQKQNW9aH4N4/MCmfMU5tBgwZOBArLKlGMGgv1wDTyMWxfnDWfvw67s5rKQ
         rd50puphYKyhm6mDorZjC2E62ZyyGqzh9r/D7LRZ25SXmhGgFjWLZAUpGboZbZIe567i
         Takg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFK0jWSBGCqHueR6jez0prdbdNbJLNaBR9Qi0IdExSc=;
        b=nFRjlibVT0fUzri8KJNLHh3kyOxeyH43P2b1s9u2aNua/BQmQ/xwAXDhXiHxOirTcQ
         0uPd+ni7WYxHtCAo9HVbTozS0WfmaxhWNmEnR2pDxSGpKcu3bB9j9bIDwbOGm8gc3Kaa
         NZucdnvzTYJMpSQlDt8jlK+vaIjPw4qqe7EQrNA50I4jh6a4g399w//q/rx6n4mvMqZy
         QBaS/HwBJ9ggmJ47kX5QdKNMnMSqhpr6Rka9INwuXdkDSnXUI10+5AnEeLPjwZ3GNBr/
         VWflPkZ/c0/dIqorNxuIiyVcbVG5U1lKYeEWeSPrvHpIv1CY6cAUG/HBzuWXGeW5acRV
         P1RQ==
X-Gm-Message-State: ACrzQf3AX0iQfsVOigHBhynENvYX5twQh+32rL5qszYqcjIio5pXwNFk
        Hq5/iDXr23vk7mIkIrObgqbtSw==
X-Google-Smtp-Source: AMsMyM5U2K1P00nn7xYLNqgRZOyv9OWbs7X6iQiZkEA8plFM5LMLik5TRB52zGFgIXEZqu9gTrFysQ==
X-Received: by 2002:a05:620a:430d:b0:6d3:9dc9:d83d with SMTP id u13-20020a05620a430d00b006d39dc9d83dmr5142464qko.224.1665939756080;
        Sun, 16 Oct 2022 10:02:36 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:02:33 -0700 (PDT)
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
Subject: [PATCH v5 28/34] dt-bindings: pinctrl: qcom,sdx55: fix matching pin config
Date:   Sun, 16 Oct 2022 13:00:29 -0400
Message-Id: <20221016170035.35014-29-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
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
(level one and two) are not properly matched.

  qcom-sdx55-telit-fn980-tlb.dtb: pinctrl@f100000: 'pcie_ep_clkreq_default', 'pcie_ep_perst_default', 'pcie_ep_wake_default' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'

This method also unifies the bindings with other Qualcomm TLMM and LPASS
pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sdx55-pinctrl.yaml       | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index a38090b14aab..fff57abf4fbc 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -45,9 +45,17 @@ properties:
   gpio-reserved-ranges:
     maxItems: 1
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-pins$':
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sdx55-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sdx55-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sdx55-tlmm-state:
     type: object
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
@@ -146,7 +154,7 @@ examples:
                 #interrupt-cells = <2>;
                 interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
 
-                serial-pins {
+                serial-state {
                         pins = "gpio8", "gpio9";
                         function = "blsp_uart3";
                         drive-strength = <8>;
-- 
2.34.1

