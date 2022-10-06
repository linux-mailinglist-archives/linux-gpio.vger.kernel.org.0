Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8F85F6915
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231742AbiJFOI0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbiJFOH2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:07:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63419AE845
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:07:04 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id s20so2845341lfi.11
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=tliBDU0fHhyGnakGMvfEdEtsKIiydxOxQywmOm5FLaU=;
        b=AKLVq7gLwIOC1GDHw4+K1dmf8/wrlqrKrerYCnuFLJ2P+wPEIv4qShkRUBO5lpMukK
         rrNq5JowFWxyhtEvF6bW/8k+Nj7i+0Ri1iKcg6jVtHCG0TCGHGYmDri8EvT+2s/5SoD1
         ZV95BzCpTVZ9Z6jNYVPMJWviGHdwFQE13p46CO4sQ5wm41gbQFsEt2KJd3W3fQ6su4Pv
         3Y5iFKFAuGvsvFcBxlfRC/ddoz0lGjwbm4BR/4Qcg5ZQgWnXjV0iSvebqbDv3368LWA+
         GgRs51XLwjqQfYP/ewKVNPsUMM4AnTvEVJzFFBPW2ue79RjI6q4R2HaVnhPVZ32NPsN5
         LHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tliBDU0fHhyGnakGMvfEdEtsKIiydxOxQywmOm5FLaU=;
        b=5YBrb8qd6X4rBRNTp6OHskIv96DWtgTQEh7UDKEpowkNRjwey7Y71z/FumSR/YaG2K
         dX0zJtxgilgf2HbM2iMUrhSLZIDzQPJZFI36YPd2Tv+6T7NpakfRoq/xQpSy5IFaCc3d
         oBAZsE7AW/qVWJ8Cyeup2AtUWyVXgOkxr1e0EmymBeuDQ3ChYLJfN1W+uekKHd9AnsN2
         tL7dRspq8lg7Cqn0/BCL0U5bcIL/jtlWooifDu6zMQ+8gve9Sb4dPEX2l++4fVKn4th4
         FJkXPHhUNLVIGYfIaRMxv9RlL6LM/UpBHPlpe8u7b+cUk44QsmidBR0Pok6h+bwvBW9Q
         Lc1A==
X-Gm-Message-State: ACrzQf1xpNKbhZ4YS50uqjUBzm3kZUmsppP/7cynmv/CEw3v9zjAYh5t
        SUh/aDFFoiMUJEObRZV5matAVQ==
X-Google-Smtp-Source: AMsMyM781+oeEAquoclKKgAQpsfrOf5fkqmk60q8PenhmGdVnDcItUtEdplxYU/1lb+nv4R+x+QsaA==
X-Received: by 2002:a05:6512:a93:b0:4a2:6bd4:e9d9 with SMTP id m19-20020a0565120a9300b004a26bd4e9d9mr59097lfu.100.1665065223686;
        Thu, 06 Oct 2022 07:07:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 16/34] dt-bindings: pinctrl: qcom,sm8450: drop checks used in common TLMM
Date:   Thu,  6 Oct 2022 16:06:19 +0200
Message-Id: <20221006140637.246665-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
References: <20221006140637.246665-1-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sm8450-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
index 9cd97a467648..7ab9a0eec017 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
@@ -60,6 +60,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -112,16 +113,6 @@ $defs:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1

