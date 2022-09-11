Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D585B4DC0
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Sep 2022 13:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbiIKLMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Sep 2022 07:12:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbiIKLMQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Sep 2022 07:12:16 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593D732B8E
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:15 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id u18so10358664lfo.8
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 04:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7BAXPGxWo40q91XDsq23ZI9ewONcXW0hOeLyfkEAbn4=;
        b=DyF+J3EmHQHuNVgK+TPDZe28N7cH8+NQm2tTpC+va/NuZzlLQGg15BlVMUi0wZtlns
         sM9LOBW7InI69qkSLZCDjyAZOPfUOh25OLoW+JPaNq/6+V2JB0Uez7Ri//WaSshyA5rQ
         ptmj4QBCWa/ybz4Ewj1uo6JkewNxm5+XgWsCYMtO+tu/691rvhTMHsoqDVfiYKvpzWOa
         yIOKRiY/RjwWh9+urJNLJGP5D+piWLn54pt3NhdT78Ezfv1aXRND90a9UK6PhtadPadF
         LmVC4jjgoiiHiVKplM5WacmR8VS6j90Fd9+aKUrOkJ6/D1uzXvItXd+qKpHHWrLjPn9R
         Wnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7BAXPGxWo40q91XDsq23ZI9ewONcXW0hOeLyfkEAbn4=;
        b=4oKtLJ5tePiBjkw8MWKjL3PuP34YJivjS41mgHl6YMpWkr97GWHGPQxExSvHIUOF5f
         oV3sJMrZUfQieeiAC6TSRjqcsgHd1kXhpTlCVAsKdejgYLq9a6kwmcoUpw2D98LpY0mL
         ANs9cgrWsNVNewskLL/46vWuifuLYBwg5Yn/LgpAsOMniZvlKXAGacIc126gD7ZON8pi
         7yqKK+etn77nknqSx+whnN8qQ4henhgI+RVBtDRQ/mIUVxM+09hyKWejUnJbDmkKyVGT
         LHjU3fkD3GgqlM+SFn/m99dtj1STcoNiAdoQyLp3O4EhwiTd7r73QmM1pDLLwu3PuKJN
         qx/A==
X-Gm-Message-State: ACgBeo1ZF32Y2xZw+BL1HsbVJiNonMnPur/O25c2UH+Dl/1TR2rQNJUu
        5T4KETTzNoeGn1bMGuEmy8ftxA==
X-Google-Smtp-Source: AA6agR79XuwzYM7RRzJeJ5CZNI2AZ0IPbPuBDyEanulOIsldJ64eLJr0RroHmIteVNwWvI3jcpvClw==
X-Received: by 2002:a05:6512:c2a:b0:497:a1ee:7a21 with SMTP id z42-20020a0565120c2a00b00497a1ee7a21mr7230608lfu.221.1662894733296;
        Sun, 11 Sep 2022 04:12:13 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025dfd8c9287sm607365ljc.69.2022.09.11.04.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 04:12:12 -0700 (PDT)
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
Subject: [PATCH 07/40] dt-bindings: pinctrl: qcom,sm6350-pinctrl: fix matching pin config
Date:   Sun, 11 Sep 2022 13:11:27 +0200
Message-Id: <20220911111200.199182-8-krzysztof.kozlowski@linaro.org>
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
 .../devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
index 898608671c4b..85a4ff5a5625 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-pinctrl.yaml
@@ -44,8 +44,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sm6350-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sm6350-tlmm-state"
+        additionalProperties: false
 
 $defs:
   qcom-sm6350-tlmm-state:
@@ -133,13 +134,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio25";
                                 function = "qup13_f2";
                                 bias-disable;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio26";
                                 function = "qup13_f2";
                                 bias-disable;
-- 
2.34.1

