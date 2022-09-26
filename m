Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8467F5E9AE4
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 09:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234141AbiIZHqo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 03:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234233AbiIZHp3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 03:45:29 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F991B7A4
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:51 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id s6so9478993lfo.7
        for <linux-gpio@vger.kernel.org>; Mon, 26 Sep 2022 00:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lMBveZFkgrYcH7gLjkthX6/xgtG5HWpV1ZO7qGMNEaE=;
        b=xx/8kVnepWUDXK3BIPh4oLdP90dN8y9MdIgJZkBkc1K0/zk/Xj1RVRrsTGSCdaQsoH
         k4rJKZXSqgzXpz0AtBch1ScCRfXcjL+KSFhEGNj2ljRlepm6OI7VE+Z7MOxY49EDYvDW
         fH8j9saomGhzuNPsoCbh2gcImz3tuVvsuZ/VSQM6KcoKuSHmcujLQlRQSDsovt2FapVB
         JXAZJSrE06LcaLAKcm5ElMfFBBcY0ho4il04uL2VQPIexY+W4HkFCSJWF/iffcggZjcd
         F10sBO1HC/wd1IUA3dgExQIYZoaRKU4QtKrJAEU8qsT8upaXzj2yb4w3kJ9Z1APmUZWp
         C6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lMBveZFkgrYcH7gLjkthX6/xgtG5HWpV1ZO7qGMNEaE=;
        b=UstH3o2f7WOq0fP+shHHslxR8EuaWCaA8Da6v7QxQkgACbdViTZg7Iw7iI1/xKcvAV
         YngOjFN1RaLuDL/FCmmlYpFHXyQNVRCUZqErjOKai48eY6k/uzJi7FbD3o2oErYdYcLR
         JVS3aBJ8Ik88Vmh3NER84cB+pYElZiSB+rNqDXt1faH1Lz+wiFNzfuiO0gBftHSPAxxr
         36Pdu2Xhufa8t+MHPJVO50aQ0+kaZuQqUydRm8siXoTLzWdm+dM1SAUhSPTBD5Uagkw4
         a42u7x4W7ugYq7LnXXrHeb1k9wfdj67U9NNzfxif05Jrapu4XH8i7O3QtI6NkQ5Vqoz6
         PDUg==
X-Gm-Message-State: ACrzQf0rgk2okcRJkaOMKzPfegrWUofLl8Kpd8lmSs9Rsq+flr6f67uL
        b+hdaBl+YCeI5DAPAmdIvS9JTw==
X-Google-Smtp-Source: AMsMyM4hSig/ICFy8nRLGrGA2BQKLVDYEWBFQo3tIcNMkLiErdqlMGKBcs0HiQ6QAEjH8X8mjQNQAw==
X-Received: by 2002:a05:6512:311a:b0:498:f5dc:799d with SMTP id n26-20020a056512311a00b00498f5dc799dmr8078813lfb.501.1664178290604;
        Mon, 26 Sep 2022 00:44:50 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:49 -0700 (PDT)
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
Subject: [PATCH v2 14/33] dt-bindings: pinctrl: qcom,msm8226: use common TLMM schema
Date:   Mon, 26 Sep 2022 09:43:56 +0200
Message-Id: <20220926074415.53100-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Reference common Qualcomm TLMM pin controller schema, to bring other
regular schemas and additional checks, like function required only for
GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index ecb90c77f666..4420bb23c9dc 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -60,7 +60,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -101,12 +101,11 @@ $defs:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
-- 
2.34.1

