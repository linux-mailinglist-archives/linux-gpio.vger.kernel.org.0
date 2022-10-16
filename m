Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D03B6001FF
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Oct 2022 19:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbiJPREw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Oct 2022 13:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbiJPREV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Oct 2022 13:04:21 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A413DBF8
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:03:01 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id s17so4251942qkj.12
        for <linux-gpio@vger.kernel.org>; Sun, 16 Oct 2022 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwbF9jO+sY4vXoUZ33qB21i8B3HKy8zqWPUMYNOaFag=;
        b=xfVQjZU6bub+aj3q24K31f0HUe13QWSpmKZoEvahnkh6nevTasmX/qWL8N9W1gUiWq
         skO8EfDMYQBPAu63GtKNqxki2OJ5Fq0S9ZZfPsn1eNREEUxwO0QpkbuxBjAUajuGalL7
         Z3fmBey/38G2Smkz+ngsA5z0WAif/Y4FJ0ClnEcPww/BKB5soqGm+XgiPMa95sJU1FZR
         gV9ZRKcJTRCxsfxCNawusZE5iqkub1xNZkzyqVa3OwrKAen4gTcKR1R7Ndl6JXjQigkG
         4h0JBvsG66Q7EedO7oo5hCKbaW1L/o8hqmpndOadyTu5ewoMe/HrKmdLn0hhojKgZS0F
         uxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwbF9jO+sY4vXoUZ33qB21i8B3HKy8zqWPUMYNOaFag=;
        b=pbyTNPXtYUZskvTwY+X+/aVZuA4AuuscinXIsWKuHVe2/YLEXrrYz6WiUtuK+Hg0gt
         SMkChTm1mWJ/taaoB1R9KA0I5nbj3IURuQT9CJ0x10XOdP1zG3tgUryFVLyQJRo+5Zlq
         Hy5ZpbpZVIu6Nl0VPy0qlYc1aTLd1CZs50nOLdYVcmUvuRHsUWZ+cndnFhZ7TLwx84J9
         LAfrRcbPqLaUqicak2Uj7mMJlxP/XGn+5GlYCSFXKOEurp9OsMSN4EvGfh4nU9U/xow5
         dMhLMeDF2ZjZfCTogQWIFj6TL9fGrDDWQHzHNXdnAg4lB9AOuio3zGPz3s/iQsayqfxI
         2SCQ==
X-Gm-Message-State: ACrzQf1oxjvtdB8W2GQ6ZQzjh++D+AWIlDFk1E0IbX/0MwlMdzjmOQME
        4gAUfVcuhB61cmcG7n33Qurx4A==
X-Google-Smtp-Source: AMsMyM7pmHIuwR8ozBs4i43CdCIxFXrNRLVlZxMT6DmNk9TR18Qqp7lT67jdrboDmp5D0efhuvTBbA==
X-Received: by 2002:a37:bec5:0:b0:6ed:4eea:410b with SMTP id o188-20020a37bec5000000b006ed4eea410bmr5229498qkf.653.1665939771625;
        Sun, 16 Oct 2022 10:02:51 -0700 (PDT)
Received: from krzk-bin.hsd1.pa.comcast.net ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006ce7bb8518bsm7539967qkl.5.2022.10.16.10.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 10:02:50 -0700 (PDT)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 31/34] dt-bindings: pinctrl: qcom,sdx65: fix matching pin config
Date:   Sun, 16 Oct 2022 13:00:32 -0400
Message-Id: <20221016170035.35014-32-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
References: <20221016170035.35014-1-krzysztof.kozlowski@linaro.org>
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

The TLMM pin controller follows generic pin-controller bindings, so
should have subnodes with '-state' and '-pins'.  Otherwise the subnodes
(level one and two) are not properly matched.  This method also unifies
the bindings with other Qualcomm TLMM and LPASS pinctrl bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
index cdfcf29dffee..0f796f1f0104 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
@@ -49,8 +49,10 @@ patternProperties:
     oneOf:
       - $ref: "#/$defs/qcom-sdx65-tlmm-state"
       - patternProperties:
-          ".*":
+          "-pins$":
             $ref: "#/$defs/qcom-sdx65-tlmm-state"
+        additionalProperties: false
+
 '$defs':
   qcom-sdx65-tlmm-state:
     type: object
@@ -175,13 +177,13 @@ examples:
         };
 
         uart-w-subnodes-state {
-            rx {
+            rx-pins {
                 pins = "gpio4";
                 function = "blsp_uart1";
                 bias-pull-up;
             };
 
-            tx {
+            tx-pins {
                 pins = "gpio5";
                 function = "blsp_uart1";
                 bias-disable;
-- 
2.34.1

