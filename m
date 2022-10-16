Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940626001A6
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiJPRC3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbiJPRBt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:01:49 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2DD37FA3
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:01:38 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id m6so5435690qkm.4
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0qog3y6/pjQRMdLgI2wTjHB+zwmYy9wpugBMuJA3qs=;
        b=S2l1QZkwPPLd78+/YAMB53iEVSUZLee5wjy+1OGrOq/SMcUiBdeBstBh4hQ8ONivsc
         XipJSvPgmtrVjg/+gE1NDXf3Jp61FPF6DH6Nb4834W9pcBodQ3eY7mhOgwcsXw9SaOVC
         p3T3JOLivtNP6fWrkNSaP0bVlUnK9wONOOlTmQBc87eMKvM7riI1jatuyEofmKD9WtTW
         h2liQgz8iCyhfwy0ccVujw2TdLVEuU3VfuKtxM3e3QN8tkQv1tWBaW1Hcn5ozgJB6++n
         2ATbn7ZkdzooFyA7wN4TxdvWa0tXbfqIrQAjixS0I9hyuoV1mpmIJwibpVupQzJsxmOj
         jiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0qog3y6/pjQRMdLgI2wTjHB+zwmYy9wpugBMuJA3qs=;
        b=EpnSRUBUhh5AsqJrvDwdCEj9MvAelWdmrgxuh36sfW/+/sXP6tEHPBwAwyetHg69Tk
         LECtNwjQjQ57dFvFcraKg0N5f3g5s/MDCzRW7LSj55BwqvMDTrgymmHupq4tuUqZ78WR
         /GrR+gBvJR30nsr/KL8zrTQ/6MIYf+M8l0/5LtrVCus7/HMZxn83ntCKzrf6+6zAMJR1
         AjO/8UeMqZKH91BNMR2jJcFTCZR4rgeqa0uQ94YK4s4pYXMj/jmgHdr6Ha5nzOkER03J
         u3feiYbUozX+G3pQkzpyHPGsPPuIKHNd3m/u0iafQayMOrNfc/j5XXFWSn1IbxBzaKuy
         7aDA==
X-Gm-Message-State: ACrzQf2E1m7m8V/2Ab5LbJxcbruC+aizsPUHrH7d6fKXiiCD2h2YFZJE
        1ZQDWeq1OvZrhNQWUCN5R36gTg==
X-Google-Smtp-Source: AMsMyM6MtCjQycs7nk7Y2Cj3Eozd1PZzqeVTiF3BMcX4ERUMeptvdy1JEhSONNP01z6Zu+TtfqBFcg==
X-Received: by 2002:a05:620a:4107:b0:6ee:ce95:1d15 with SMTP id j7-20020a05620a410700b006eece951d15mr5102309qko.266.1665939698601;
        Sun, 16 Oct 2022 10:01:38 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:01:36 -0700 (PDT)
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
Subject: [PATCH v5 07/34] dt-bindings: pinctrl: qcom,tlmm-common: add common check for function
Date:   Sun, 16 Oct 2022 13:00:08 -0400
Message-Id: <20221016170035.35014-8-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.  Add a check for this in common Qualcomm TLMM pin
controller schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,tlmm-common.yaml    | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index c88c8dcb69d9..e1354f0c64f8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -65,10 +65,6 @@ additionalProperties: true
 
 $defs:
   qcom-tlmm-state:
-    allOf:
-      - $ref: pincfg-node.yaml#
-      - $ref: pinmux-node.yaml#
-
     properties:
       drive-strength:
         enum: [2, 4, 6, 8, 10, 12, 14, 16]
@@ -82,5 +78,21 @@ $defs:
       output-high: true
       output-low: true
 
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+      - if:
+          properties:
+            pins:
+              items:
+                pattern: "^gpio"
+        then:
+          required:
+            - function
+        else:
+          properties:
+            function: false
+
     additionalProperties: true
 ...
-- 
2.34.1

