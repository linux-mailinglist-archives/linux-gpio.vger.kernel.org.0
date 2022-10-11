Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF7395FB9A1
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Oct 2022 19:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbiJKRa1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Oct 2022 13:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbiJKR31 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2022 13:29:27 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CEC473C1E
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:27:02 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id h15so4556333qtu.2
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2022 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdHWG9STLFoJNAEerqd2Zwv5GCqu6vn0zX4QG4Ug8c8=;
        b=KcrJYpBFlsPV8ZiVPdY+YKARalTP/XEoODqHpzW7gfiOqMbtPj37XGC9i9NNyWcSEL
         u8N40IAVSWtFbOz3CmhbHdOgXuFyD5zjT2a5ApUYhmrMZPC4iwE1U2aD6UK6YUaa+f68
         PETrJPB97Mu99Kxh03ZL+YAgscZVwAiBCrCire1T0IFeViGMDBN3H11qsWiKEib57ipj
         EPMyr7nurfyeLXOgfjsRVGbGYgteS3UC4niCajYbx48MxPXN/Ze5XZB3eQbkfj8UL+Oz
         +QYhizxJeXKd6eIdLY/lzeLQ+CQDQ5nigRWNBHg1l10qA2iatzl/QRnG+nH/3G9bSW4W
         6I7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdHWG9STLFoJNAEerqd2Zwv5GCqu6vn0zX4QG4Ug8c8=;
        b=nggsa7EXhV+yPMaIJM+eRhI3JZxCSao5bsBnAX0FsuY4kxuRzoqeSDA4+iA37zQBNh
         Yyp5F8uIH01nMi5Vjl0jrPVJ6PgnZbd3YdonjtuPHDlu5F0/5sj4EFEJrW3DUdWFbCmX
         xa6efDmZWR6bGbCx7vAHqbV8ykhxk4V5oW0oPjzVpFjwZsz9Nq/s+Kg+3kZ9RpbsED/h
         mBjs+K8uw46QeTF0sHcnporn258x6Nf9Vdam302haQr+taFMKNHTV1Eap7bleGOqq2EZ
         RqaD/WFarJnxN2I+LXyvRvPjn05B1cwcEACX2B8oTrF3jS9dNZ4hGMevf4dGyLMLaVhs
         xHAg==
X-Gm-Message-State: ACrzQf1vw8SSvzlRcYgCoNojFJoRBu40/YgXlI7U3+I9lD2nIvSouktC
        8jT2ok4K8MVh/A+mwi1Huclliw==
X-Google-Smtp-Source: AMsMyM7jgMmqmceW2skD4Ce9DcGvAVcFDemD3J++qeb0Mh1hDexgf92TQE4MI2lLyXoGobR6OXirXg==
X-Received: by 2002:ac8:5741:0:b0:39b:ddca:545 with SMTP id 1-20020ac85741000000b0039bddca0545mr5064995qtx.630.1665509202012;
        Tue, 11 Oct 2022 10:26:42 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:41 -0700 (PDT)
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
Subject: [PATCH v2 23/34] dt-bindings: pinctrl: qcom,sm6115-tlmm: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:47 -0400
Message-Id: <20221011172358.69043-24-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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
pinctrl bindings), use double quotes consistently, drop redundant
quotes and rename file to match compatible (to match coding convention).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 ...qcom,sm6115-pinctrl.yaml => qcom,sm6115-tlmm.yaml} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{qcom,sm6115-pinctrl.yaml => qcom,sm6115-tlmm.yaml} (95%)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
index 3f5f5229a86c..ed68c4ee032f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-tlmm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/qcom,sm6115-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm6115-tlmm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm Technologies, Inc. SM6115, SM4250 TLMM block
@@ -10,8 +10,8 @@ maintainers:
   - Iskren Chernev <iskren.chernev@gmail.com>
 
 description:
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SM4250/6115 platforms.
+  Top Level Mode Multiplexer pin controller in Qualcomm SM4250 and SM6115
+  SoCs.
 
 properties:
   compatible:
@@ -36,9 +36,8 @@ properties:
   gpio-reserved-ranges: true
   wakeup-parent: true
 
-#PIN CONFIGURATION NODES
 patternProperties:
-  '-state$':
+  "-state$":
     oneOf:
       - $ref: "#/$defs/qcom-sm6115-tlmm-state"
       - patternProperties:
@@ -46,7 +45,7 @@ patternProperties:
             $ref: "#/$defs/qcom-sm6115-tlmm-state"
         additionalProperties: false
 
-'$defs':
+$defs:
   qcom-sm6115-tlmm-state:
     type: object
     description:
-- 
2.34.1

