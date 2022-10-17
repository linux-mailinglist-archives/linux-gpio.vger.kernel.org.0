Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D13C4601D50
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Oct 2022 01:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiJQXJn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 19:09:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbiJQXIn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 19:08:43 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D02E680EA1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:08:26 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id mx8so8312554qvb.8
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 16:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVC3ghBKeR0GAUNqyIpEEaoUzp0peyvvuM658LrOc7c=;
        b=A1Dwq2eHGqSxuSokp6paAN4PzX0JQKNbDkcc6zuogZyUqpVqMv6hgSmYwEh8ojRmBH
         ysB3GMhs4GDK7bTnxy1hNCkqgkMhm0MB7U+IuMTyJAiFJzm4zgdgFHCgoFgcG3JpM3qp
         dGpdb4y/IQkkRdpRvQqsUoqp9v/Zd8btqhE1amypPDfoL0OdpvN1tn4z0Fu/bSwlINJp
         bTsTkpAmfMU7XRHT0g8DuyuYT1wMVxGuIw0cOH1SIl9JjlACjlOKS7790a1Cyjs8zeWv
         YzlofUrYynGwVTqctGoDDEEgxBDKhaGwbTzBc9iiJ8M6WdPzqeqAX5J4A7VT5nl9GUpR
         9iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVC3ghBKeR0GAUNqyIpEEaoUzp0peyvvuM658LrOc7c=;
        b=L4JwHDrXXt+IttDpPY6uuCJhMknFhNGPHrOYKwB8Rhop+jykKY6K9jTUtKQkRtD+Ay
         KdFnM736WEdrlZ65pIwF3mx2c93v8qAhH3NolCeTIDbAw9K2RuSsZ/WiIAS44FAIaXxU
         fYg4vNraMtbbKftgfZskVtQUC44f2HY1M/iklbSfSw96OquSHKCLO+YAbzbQFLeRHixg
         4yaZ4Ildy3TyEaBHt9LhnIe1THvb+7bSUJOmPNRQmE4B+yVmgrRDhT99uAT7C5sV9Qz6
         H0MDLKqy1LzXeKVoZhzo0A9PQj/GNCQgRKuoEAiXjItet3EnD6HqlERBGOAHmSv1fjRx
         02bw==
X-Gm-Message-State: ACrzQf0cWUhW5dgsmjQWXhaP5qzq3dtCqrEoVtbVC9WBRVTqX8Mjo9i4
        gXSeL7S/haKbW0tP7HAy85M2kw==
X-Google-Smtp-Source: AMsMyM4M9yTz+qEWvxVZ/9FZg2wDwXIsV3BpOaX2FDHe3VnNdD2ZDIFhku7yRpmbMEEE+TEMfIWqxA==
X-Received: by 2002:ad4:5962:0:b0:4b1:d684:f726 with SMTP id eq2-20020ad45962000000b004b1d684f726mr10083552qvb.31.1666047692166;
        Mon, 17 Oct 2022 16:01:32 -0700 (PDT)
Received: from localhost.localdomain (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id fg11-20020a05622a580b00b0039cb9b6c390sm729670qtb.79.2022.10.17.16.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:01:31 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 30/33] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: minor style cleanups
Date:   Mon, 17 Oct 2022 19:00:09 -0400
Message-Id: <20221017230012.47878-31-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
References: <20221017230012.47878-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), use double quotes consistently and drop redundant
quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml    | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
index edf38c774514..7d2589387e1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
@@ -4,15 +4,14 @@
 $id: http://devicetree.org/schemas/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
-  Low Power Island (LPI) TLMM block
+title: Qualcomm SC8280XP SoC LPASS LPI TLMM
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  LPASS LPI IP on most Qualcomm SoCs
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SC8280XP SoC.
 
 properties:
   compatible:
@@ -35,7 +34,7 @@ properties:
 
   gpio-controller: true
 
-  '#gpio-cells':
+  "#gpio-cells":
     description: Specifying the pin number and flags, as defined in
       include/dt-bindings/gpio/gpio.h
     const: 2
@@ -120,7 +119,7 @@ required:
   - clocks
   - clock-names
   - gpio-controller
-  - '#gpio-cells'
+  - "#gpio-cells"
   - gpio-ranges
 
 additionalProperties: false
-- 
2.34.1

