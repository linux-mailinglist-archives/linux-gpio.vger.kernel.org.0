Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A77175ECB3E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Sep 2022 19:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbiI0RkX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 27 Sep 2022 13:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233271AbiI0RjQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Sep 2022 13:39:16 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140A51E3F71
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:38:38 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id j16so16824123lfg.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Sep 2022 10:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xB28Educepf+IPa2bu7radSAhQAuISxlsfTo2XNAGj0=;
        b=hSZRNPzh2KrqCkPodlMo83NivQfwuyoByIw3eM7iaH+BnC+Hgb2xxcRqOn6gHe+HSX
         xwVtW0OAh96LJdVzOtyg3dC/ajk3BsoLxuvtYxGRNtXk4E1oH0FABxEKIIRPyIgQhRy3
         V1ed6UxUDJgsxwKFRfSmAnTISNkOrfsEUzPavEkUuEJ0D0T4yVVXUw8Y7uji/rpYykWW
         id3algpFXucNGbclxuCeli9rBHVwLUAVEv6xZBRRTj9dAdaStYqSj9MUVfEp2EOjOQn+
         T2wwShUIO/wYQ2j3VPRe4igNtusVcVHg5GoDZq0kqU8AFXC+76jcFfTpz7M3yfj4h/51
         TKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xB28Educepf+IPa2bu7radSAhQAuISxlsfTo2XNAGj0=;
        b=mbK99GxmI+fO8TPaK5j2qQJshJSGjt6YYVuy/K8PRm01BPA2UyVuZ4BB8DLqWdgE8g
         VqDNtW4CcsHwhP8dhwOxgFSCY3DgcHNFd1gfP0oXYoYjhRAo5AnJ2LxktebiiwxxRaQz
         VaQ8s5+dBFRhdcL1IBo6Mvs6esBgA1uihOexLGSX4mVqqTtrzosSsvKabZDGuWnQkFsO
         vtPOoDVa8xAMhR3eRvO6V15U+GocYE0ZJQa5vLEzUlkTHdNPk3fXEpW2WmNmhvLUDsrd
         7KX4RS1uxJ+6o+IWuQjzXWFhldUtczFI8rEJ4W40n3qgxX1hJMirclzI9g7bac4kg/db
         RnoQ==
X-Gm-Message-State: ACrzQf2KXTmxWa5wVD/LLQUAveek5FUCOomf9rzZEUDHvSpb91n8XY/t
        rSiYuyZN7JQZV3NwCISYu8c8TA==
X-Google-Smtp-Source: AMsMyM48me0beCgoGDPz0SC/BrZGdw0oEi+C/2M2ntiEeXFZGZK3vCINmtJQYBq/UOACiNAw150GHQ==
X-Received: by 2002:a05:6512:3a91:b0:49a:d3f2:1b09 with SMTP id q17-20020a0565123a9100b0049ad3f21b09mr10707842lfu.255.1664300318409;
        Tue, 27 Sep 2022 10:38:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:38:37 -0700 (PDT)
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
Subject: [PATCH v3 18/34] dt-bindings: pinctrl: qcom,msm8909-tlmm: fix matching pin config
Date:   Tue, 27 Sep 2022 19:36:46 +0200
Message-Id: <20220927173702.5200-19-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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
---
 .../devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
index e03530091478..b1735918fa90 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8909-tlmm.yaml
@@ -43,8 +43,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-msm8909-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-msm8909-tlmm-state"
+        additionalProperties: false
 
 $defs:
   qcom-msm8909-tlmm-state:
@@ -136,13 +137,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio4";
                                 function = "blsp_uart1";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio5";
                                 function = "blsp_uart1";
                                 bias-disable;
-- 
2.34.1

