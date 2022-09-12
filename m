Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811775B53EC
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Sep 2022 08:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiILGSV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Sep 2022 02:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbiILGSQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Sep 2022 02:18:16 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D56626138
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:02 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id y29so9324614ljq.7
        for <linux-gpio@vger.kernel.org>; Sun, 11 Sep 2022 23:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=fEX3mEf1YS0VEGkwrFu/5ECJ6Ev0hCKVagP2clm1WMU=;
        b=fVTuBzBUkJ22VyHG6FNWHCYgoRTNWjgDMyVIXuk5sPhnDy9eMiAtlWYY0PFzdJhw/U
         9+5yWBbsHubw+nvqkA1HLrAS/8/1lKSI5915T74J9v3RSmSdCTTb2ln2Mzu/JiXtj3FS
         1MvRPCL0Fgc68BNi4TdRhQmgamnDzYCS2SyWM62/DGd0wh9wSpjiSqyyPqLoPWD0bFc4
         NZig99eryWwBIx55fgIpZSlt1dV7SbwapfQ+IWbWLtWq4Twl0Sxb/mXCLlWbuvHGahnO
         wnSj3BnhqAjSGvLRc8QAuakyz8X1izLxPP0juDBdmNoLgP0IfekWnN7fOnFYPg4moGi6
         4xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fEX3mEf1YS0VEGkwrFu/5ECJ6Ev0hCKVagP2clm1WMU=;
        b=MDg6S/wNWL/igsu9D76vR3EOwjd1HT5D10W5zAYvdEHjmMQD2+l00k2r0Fn1W3I89B
         ZckwQeCp8K6ikpgpgLWNiDt/u7NS1gPCU9t3Z/0d4oNi0/NllSo4hRPHe5Xsg1Am2A9G
         AbyHHBgKG5lY8RD3y7NPofjGDchzzcmISf3y07wSpD8th0pIJVJn0AAvnb8wJUpc8Bzn
         HI3zlVgc2Xcctv1ZLyCRYdzV198aXZRX8BGU0Dlan7I6on0bUzp7JpHqTV3+R9KUqRNp
         RiF1WkJ8+zaSfy1uOfVzWPyyZTcjQHoY5Wy/BgIGBaZrGUC3Xb2CCgnyHoSRgZM7tbaF
         zcmA==
X-Gm-Message-State: ACgBeo1+Wnht8ynWTgLyaGPaaV1EN7gl8yB/YDNmZp44VeKvXgyKoLQN
        wkDFj+yLhzAUyVyLkhhJfNxuqg==
X-Google-Smtp-Source: AA6agR4M8TAMHhPFbvbyPN9nvAjoUxf1GnokNm6GLAPiY8e/5IWPCyGMpO033fwrrhvc4VXrB2/CtQ==
X-Received: by 2002:a2e:5cb:0:b0:26a:b1bc:bba5 with SMTP id 194-20020a2e05cb000000b0026ab1bcbba5mr6959655ljf.93.1662963480813;
        Sun, 11 Sep 2022 23:18:00 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t19-20020ac24c13000000b004996fbfd75esm876805lfq.71.2022.09.11.23.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:18:00 -0700 (PDT)
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
Subject: [PATCH v2 05/40] dt-bindings: pinctrl: qcom,sm6125-pinctrl: do not require function on non-GPIOs
Date:   Mon, 12 Sep 2022 08:17:11 +0200
Message-Id: <20220912061746.6311-6-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sm6125-pinctrl.yaml        | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
index 84ed16f9915d..735eb5d6834d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6125-pinctrl.yaml
@@ -61,7 +61,6 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -112,7 +111,16 @@ $defs:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio[0-9]|[1-9][0-9]|1[0-2][0-9]|13[0-2]$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

