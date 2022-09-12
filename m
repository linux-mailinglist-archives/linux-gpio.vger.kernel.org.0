Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E71D85B5468
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbiILGVe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiILGVE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:21:04 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171642BB24
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:56 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z20so9338325ljq.3
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=isoYJKBwL9O1ZTWOtoJy6YqcTPPUMcFYuBQOWK2a8G0=;
        b=Sn5uYWupsTjYshBneVtvzhVm3tf9tCxdh4UlYVFBt+IUS0/qO8AZG6l1xAt8OTwdcw
         LqSgZqKAY72eXW7HIgMULuiRS3xGprajeZGJiGeCelFx7FciQ6ekWDZRaV8/z10dk4gS
         127eQTscFSplDtvT8htQc83JifHjo++wfC1ErJCMomo10pyjyMeliT0Iu/Pc69Cq7JTf
         kkzYKb2Zh66/CVOvi25eYko/MCV67RJbLzmpxKnHCPokSsNSre0NdELFow6p5CRQ+CDu
         d8hREZz8A0EG//L7Kr5EffVi2u2ONDT3bjh4v7h1YagyiR6TD43pdXyGcUg74p0EUZs6
         /ZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=isoYJKBwL9O1ZTWOtoJy6YqcTPPUMcFYuBQOWK2a8G0=;
        b=MiZIYi593Y3dw8okFxyxP8MWQzWbPjngqbhX0fcvf4NsPVwQONESCcZNcz19Ezt/Kn
         dpuAPDEBe7b+RFX6h5yXYXCK72VtJiAUBpLWTrF9TQ9+lgk7FWvX7sdEHD7+eHZPjzMY
         cBBZxrdt0CyNTTFtbobK4lOV46rWc8XYriIPzC2D37rq8a9Qt27/9A1BXZ7aDZaSj1+R
         d1dOlxjjuQAhEfSYry0VPQJ1xZp8kxQ11iuijOircvMSbqLv4qWMxuTn3QVZPwyHVVGR
         87CNzuInAXiSbSb+O+V6FSW3Wc6Bh5Z2OUwy8Jn/MiA0dIQAECIZgub9m8ODTZLeFJ2k
         MC1Q==
X-Gm-Message-State: ACgBeo0FcTxysfQpMEzgjURgyv514AK2IIK+LEEKx7He5mIU0655WRyM
        7nd0MweN7YromhYAOmkQyDJOTQ==
X-Google-Smtp-Source: AA6agR4xwxfcUqidIq62wQLoSkaPFn1oBOsoXm32yp4o95+WVvQIOqMOm3t2WCydvzEkLmkKr0zW7Q==
X-Received: by 2002:a2e:978f:0:b0:26a:a62e:8f2c with SMTP id y15-20020a2e978f000000b0026aa62e8f2cmr7369259lji.153.1662963513116;
        Sun, 11 Sep 2022 23:18:33 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 28/40] dt-bindings: pinctrl: qcom,sc8180x-pinctrl: fix matching pin config
Date:   Mon, 12 Sep 2022 08:17:34 +0200
Message-Id: <20220912061746.6311-29-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
References: <20220912061746.6311-1-krzysztof.kozlowski@linaro.org>
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

Make the schema stricter and expect such nodes to be followed with a
'-pins' suffix.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
index 86509172603d..646fabdf81f7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
@@ -51,8 +51,9 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sc8180x-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sc8180x-tlmm-state"
+        additionalProperties: false
 
 '$defs':
   qcom-sc8180x-tlmm-state:
@@ -137,13 +138,13 @@ examples:
                 };
 
                 uart-w-subnodes-state {
-                        rx {
+                        rx-pins {
                                 pins = "gpio4";
                                 function = "qup6";
                                 bias-pull-up;
                         };
 
-                        tx {
+                        tx-pins {
                                 pins = "gpio5";
                                 function = "qup6";
                                 bias-disable;
-- 
2.34.1

