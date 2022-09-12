Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7675B543A
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbiILGUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiILGTQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:19:16 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCD612654A
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:36 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a3so1167207lfk.9
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ahz8RWfiLMT3ul4AnyZJntS/GGhk6GDdZTcm/1GzutM=;
        b=XQx4OVoUTJ8zLRAOaa2DLHo6FsqUUIRXo+DobwRnK46uXPNdF1oz4sHjHfhn7VBeDT
         mahjMNA/0pSp4sFed3g6hRqC4TNGf98zxdJP4fJ0bAMO+jXDBVlCcm/22OJUtITFD4O/
         wur/E97wbVnWoiHsX7BhwSEEUw0vEIXN4wsq+gsi8dyzZ6V4mW+R/wPZ+g3jpOJk945n
         PzOkt9Gq9JKCsg8yTiSqodf20oBnJZUyFFnkP+L8X03h8qML8onuvOzimpqXQ25Zn7Aa
         BML63mdsfED5Jh7SwV5al2fDm7IAdAg+bdsyLk+uEk3Q6NfPT/BkJMX/utA0Xh5tFfLW
         BiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ahz8RWfiLMT3ul4AnyZJntS/GGhk6GDdZTcm/1GzutM=;
        b=BSkgelFsVwDOpzcYXSWUPuTzCqG/pkBwUG5sKOSFL/tgy36pwIJM9frpS7iLuI4d+T
         dY7DiAZg6gGCS8VWnIymaSOEjaZ/7G3Iq8AqAoy9B12xurTRMWIXXaaPr+VNuNLM6Pd7
         X0uk2NuE3C2VgonQ6MbBsTpQKFWyEuo4DWjTgHmQlWl8RJVMVLXGqF9Ztl3SS1lWsX9f
         t+oVLo61wEos25tGX2O45TtbK42XIrO2lRg5F6dB0ae2JKDHGM9YpOKqE952mACSR6d/
         kACVsEqSmxchy6ieMahe+QBmzenXpFe8p2S7U8z7dbIE4CSHUczOTzwhiSp7JnJwGS2f
         X1EA==
X-Gm-Message-State: ACgBeo0OMLYQTs+Iv+2a2blAGNGWmFXRfKFwumqbeOYVyOKZG4rmv6+o
        HZMYbC/hIQWkadtbhOe0xrjERA==
X-Google-Smtp-Source: AA6agR6CgY6b4wbJXemoxfp6L/GXP1ptnkEcrWxGnEEWlQ57O7w2lOc9yEmiwDdK056mFItPqrKlwQ==
X-Received: by 2002:ac2:4e10:0:b0:49a:d44b:426 with SMTP id e16-20020ac24e10000000b0049ad44b0426mr860979lfr.234.1662963500925;
        Sun, 11 Sep 2022 23:18:20 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:20 -0700 (PDT)
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
Subject: [PATCH v2 21/40] dt-bindings: pinctrl: qcom,sm8450-pinctrl: do not require function on non-GPIOs
Date:   Mon, 12 Sep 2022 08:17:27 +0200
Message-Id: <20220912061746.6311-22-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required:

  sdc1-clk-pins: 'function' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Another question is whether 'function' should be disallowed for such
pins?
---
 .../bindings/pinctrl/qcom,sm8450-pinctrl.yaml        | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
index 87347e9c5f1c..296f503c1d97 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
@@ -53,7 +53,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -105,7 +104,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

