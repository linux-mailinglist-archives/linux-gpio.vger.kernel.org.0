Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3319B5B4DCA
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 13:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbiIKLMZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 07:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiIKLMT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 07:12:19 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F3832B8D
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:17 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id f14so9403454lfg.5
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4rHHwOUbpZ1zz0X1ZCBP3fMB8RXmrk772qwdEx5p1YY=;
        b=Fu8ptctQDaI2uIgJo8917Xzo89LGap2DEDz7xxZZ0J+f8RgN6xDMxGGSW5uxQ6Lb5Y
         EQAoRbF9O2Dp2tgZrGjw2/ToX3w2pCWo9ecmTrDPZoAtOHFSgYLaPesqs2xuKWclWSVK
         LC9LGiEQRPl4QmWPkb5KIj/hxgX4cMmNIpccy0Cr3HqDIXWQSgI5q1VOACFcubb9Rdiw
         StDJp2/wTqZH3pyLXYAwnI+O13nxXvgl0p1BXSlaqfsadVrbhfJS8MM2jHrLGmMIgBk1
         gr8qXUG2XR7cuUwh97Z99HEoynxvzaVyo3SdHewyTyrLglE1k7Ta0PYRlUmLYwN3ja/O
         j7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4rHHwOUbpZ1zz0X1ZCBP3fMB8RXmrk772qwdEx5p1YY=;
        b=ur8AMy+zMVCUIQNUmKGFsLUKfImNni0I5+ykymF0ZecTWrF5u1WTu8k9f0TLsagCK5
         3UMHxrUuS/esHAGdXfCbVy9G7Bvknsfla2c3N5REVF8HDx9MCeC/N/EK2Ja1oYqFtRGF
         WpaDVvtuUQBSrNFmukmnrMKsJmwKtLS8K96IlJce37neqgHOljGLSh0u6UpFEd3njnnm
         IoVKjHQeBWyYxLDnhoKqv4dj4DL33ZUc6Tuz+FJ0D365uswg4E0sexqZSW7/hrvsjryC
         tUbUXRT8+f+rpgpxYSLOsB3Js0frx7mWuCdvlSubBCAmkpGkM9q5rMNVP2OhLCbmmO9f
         16WA==
X-Gm-Message-State: ACgBeo1zKY5BrIuLk5IV99ktmS66/Q/p0lr5NvSyDQ/00mcS7kVa3B9P
        vw1GJIo4XSXFYtAN9Ny7gNdHCw==
X-Google-Smtp-Source: AA6agR5qnkA8Y8vV+2+FmuTE621GPU+psjfZnO6j9Nu+3Q+XpjYO4iEuWqxxbJXj4X6NC6K02mMQwQ==
X-Received: by 2002:a05:6512:2a88:b0:499:3bde:9630 with SMTP id dt8-20020a0565122a8800b004993bde9630mr2705951lfb.147.1662894736724;
        Sun, 11 Sep 2022 04:12:16 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/40] dt-bindings: pinctrl: qcom,sm6375-pinctrl: fix matching pin config
Date:   Sun, 11 Sep 2022 13:11:30 +0200
Message-Id: <20220911111200.199182-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
References: <20220911111200.199182-1-krzysztof.kozlowski@linaro.org>
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

Matching PMIC GPIOs config nodes within a '-state' node by '.*' pattern
does not work as expected because of linux,phandle in the DTB:

    'pins' is a required property
    'function' is a required property
    'rx', 'tx' do not match any of the regexes: 'pinctrl-[0-9]+'
    [[59]] is not of type 'object'

Make the schema stricter and expect such nodes to be either named
'pinconfig' or followed with '-pins' prefix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
index 3908807a8339..50f0ca5ab7e7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6375-tlmm.yaml
@@ -44,8 +44,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sm6375-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sm6375-tlmm-state"
+        additionalProperties: false
 
 $defs:
   qcom-sm6375-tlmm-state:
@@ -142,13 +143,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio18";
                                 function = "qup13_f2";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio19";
                                 function = "qup13_f2";
                                 bias-disable;
-- 
2.34.1

