Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 902B05B543E
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiILGUT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229783AbiILGTS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:19:18 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDBD72AE29
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:39 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id y29so9325958ljq.7
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XCpzuH6l9uwERwbmApSAocGpO1WUQ+kJaH+BaZZ4Pgk=;
        b=jtakP6ORWyIKPUpkfqal/BV/8/ncUpbuF/5f34Fj9guQlNdQkZWt3NW9uM5z/4dA+Q
         bk/EgTX/eS9uwqh9E0VzpeV3+t5LfhSDSBe3pFFHuM6IZh7ZzimhHGoKLFNrGY+VOxIM
         5Q4Dq2dzny2t6jYuBcPQrjV+DS6WIEONEYjqdsLb+VZdZLHHMiUDqaZtdMgRURp2W33i
         mzeyml15vQ+BKAhYTYqnPqtjqlY5VouichDNzKL4BWZpjkBkitJaufC7NdSN9LfMOytL
         mBfR6ETq0FI2E9URYaX81M1b20WZCat4TS9yfNSGdcTjVmiyE5OGQIpZzgMlrLM/Jtzx
         NO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XCpzuH6l9uwERwbmApSAocGpO1WUQ+kJaH+BaZZ4Pgk=;
        b=kPcC3CxvyMhBXF0jTTfhhA1P+dlEm1OklBCY/CFCHAz9Fs2qD77dNGIseCXIuoJp2v
         MZr7SgbijOduFTwA3RK66fBLQ3z55rR1Mp1T8DuKW05VaH85oX1ApKkecJFls3XJl4n0
         lmG/FXhSPyn8Nf4NyIPIUyYJvZx13ToHF3uEJ+OsxzxSGp7luFRnZQzrkYegHmE6cNzK
         Y4o0AGopG+wEqHvDJ4q2NQoVGyzz874T4Zva/TMNXxt70ROZockuZB8o/bNUIJHyEYam
         zxRU4vZHHIg3rqIsTOZw3p9xBviIfzW2oHPk21Ca1M0p6BpLdruR7kjeIA5PEBghJb8A
         1TqQ==
X-Gm-Message-State: ACgBeo0w7G1hvWeV6hHHX/dxQaZvo1HCi+ePlkD5sF1hQg4jcuPsbPjm
        V/ESIJJw+dbxO/ILdWjJH7ANkQ==
X-Google-Smtp-Source: AA6agR6gVvk+wjJcy+GsVuOyXfIuM6E7NgxSoHfkKTcN9oVF2DXgcCNIutIim0ZgRFH40l3SGXWrdg==
X-Received: by 2002:a05:651c:44f:b0:26b:e48e:5b4e with SMTP id g15-20020a05651c044f00b0026be48e5b4emr4377596ljg.314.1662963518967;
        Sun, 11 Sep 2022 23:18:38 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:38 -0700 (PDT)
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
Subject: [PATCH v2 32/40] dt-bindings: pinctrl: qcom,sc8280xp-pinctrl: do not require function on non-GPIOs
Date:   Mon, 12 Sep 2022 08:17:38 +0200
Message-Id: <20220912061746.6311-33-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml      | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index 5147afc28721..8610f2701388 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -53,7 +53,6 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -113,7 +112,16 @@ patternProperties:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-1][0-9]|22[0-7])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

