Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1625F692B
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 16:09:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbiJFOIu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 10:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231817AbiJFOIE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 10:08:04 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE45AA6C3E
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 07:07:19 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a12so2357810ljr.7
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ffrZlWhWALv9ZHVXm4CUthNCnfvzTcP8RIEkQS+jo/U=;
        b=REXPOF9FG/8vG8rVapuNbr8392SSdHtdNdVqlR2F/N+qHHlS2huWvI2uR5kvwgTvDo
         mZ5Mfu21oXW+ePky2iZ1me4WViLeYtqqUMhCRHFkL+Sp7z6luhQXg9yOjwwX5cBZcBRI
         SDKjc6LbpzAnThyjjT3dXKhchURw3Jl6fUGCjQp5DB7e7AAg8rD0A6u4KzqfXPQ6HWbN
         aa4fVaDdH9aXik9A0hqYE2MQ0BuRpx64J22poQj8CeaZWDYfcCytyGbIfOELsDUZ/TXl
         jBK/DhSAziqyEkPr+ReVMA+EnUDXsn2KWytDcGb+8aWLkCQgZdfPLvUdbUNWUCj2jskS
         5Ynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ffrZlWhWALv9ZHVXm4CUthNCnfvzTcP8RIEkQS+jo/U=;
        b=dvOIHbnplEfBRnA1Yz66T2LC8vxqUI5EHLi3P/QeggqQzZMQtFiH06r/Vcb6dSIgkD
         U1/UTXHdc737BEv3r8ybUgK3HgiCrorokwOsRmweuKRZ/juRPvIQMpt+yrBCYf836RfY
         EiOqipiG+33ooN+2htsh6WvGtKMVnbR6EjiTMNLLoHZTmL2PH7RCnZLKIP4T4Kr9fwqI
         ATIt56DwzGUSmIAdbHVBPzG6r6dr2NMDLyl2Jz41kXQh0RwM0deHnX/OzFSoGdjR3qAg
         B/UX4wGoy86HzCScWcYzqDrWBZ/0wqntUK7KJQq1N9shYQkVIGFC3/mLIOHvF13eocoC
         kPrg==
X-Gm-Message-State: ACrzQf0haFoANAHdSz2avyKbg5uKAMybfEFDHlMWRyPaGPeXr46OvaBl
        2KrcYPVbhDVp41PglOR2lp+vAg==
X-Google-Smtp-Source: AMsMyM7GTYiWGaCGuSoacfgHkmwnlfJD8dzjrEChyOQ7/TT1tOknx19Wa1eDghFxLB7ega+Yt+yhXQ==
X-Received: by 2002:a2e:8181:0:b0:25f:e028:a67 with SMTP id e1-20020a2e8181000000b0025fe0280a67mr1908562ljg.89.1665065231721;
        Thu, 06 Oct 2022 07:07:11 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z3-20020a056512370300b004a2386b8ce8sm1833929lfr.211.2022.10.06.07.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:07:11 -0700 (PDT)
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
Subject: [PATCH 22/34] dt-bindings: pinctrl: qcom,sc8280xp: minor style cleanups
Date:   Thu,  6 Oct 2022 16:06:25 +0200
Message-Id: <20221006140637.246665-23-krzysztof.kozlowski@linaro.org>
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

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), use double quotes consistently and drop redundant
quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml       | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index 886d4e76af44..ec0e4bf9e0af 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -10,8 +10,7 @@ maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
 description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SC8280XP platform.
+  Top Level Mode Multiplexer pin controller in Qualcomm SC8280XP SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
@@ -25,10 +24,10 @@ properties:
 
   interrupts: true
   interrupt-controller: true
-  '#interrupt-cells': true
+  "#interrupt-cells": true
   gpio-controller: true
   gpio-reserved-ranges: true
-  '#gpio-cells': true
+  "#gpio-cells": true
   gpio-ranges: true
   wakeup-parent: true
 
@@ -39,7 +38,7 @@ required:
 additionalProperties: false
 
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
       - patternProperties:
@@ -47,7 +46,7 @@ patternProperties:
             $ref: "#/$defs/qcom-sc8280xp-tlmm-state"
         additionalProperties: false
 
-'$defs':
+$defs:
   qcom-sc8280xp-tlmm-state:
     type: object
     description:
-- 
2.34.1

