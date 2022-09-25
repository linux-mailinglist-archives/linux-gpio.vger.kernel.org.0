Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A94A5E9284
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Sep 2022 13:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232526AbiIYLHF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Sep 2022 07:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbiIYLGq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Sep 2022 07:06:46 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D3432A88
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:29 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bu25so4877173lfb.3
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rNmuq6Pz/aQimtSFRDztgTKbC2bR/H3agu5f7rLSCzg=;
        b=lhJfbmpDRntGIA0lyGbpPFdxSL7LkkbDcSHLKx5kr2eyNINm46ButiPOlF2FISPfxE
         80sUZGn3W3k4q/PI+P8VdfSPssC1XVeXgAvb/GQteMnLUT3kj9127EDDjrI1ReAhYxgj
         zIAxzKcCEr4A4LPRIWYkqwjiHm4rpeq2i3ky14spG9fOtEc8l0gVq90KwTddK04nxh/7
         +o1XViC/Xrb0pcIOpH3AlHdMFvrdcKct+NIBfV3+1cXPWrmqnsOLQrzCe/LAOLRSymeY
         66vrUoj43MefTQXEOW2D3Hja7+yJbAalEFRsXY9Yb0MLNifujuB8ukeyTcHDUkuOIAJi
         /v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rNmuq6Pz/aQimtSFRDztgTKbC2bR/H3agu5f7rLSCzg=;
        b=oTFa05RbkDvCWgMB+bV9OS4wSN5DES9BYUWh9K9eTFtV9rGbBlS+0tORGgRCVgo0f9
         duGQNb8uio66uH6x/t9YRjROJZwE6KvBh9JObPmXtNBCeP7DCXvLXyO8XWtqYC7Uy9FM
         49Ewq8m5/BWYIQyLjdobcUeAXJ9YrGO7F9976J4cQPlPneP7PiC1W9Dfuox9VkpNgznD
         OhPtfgsSMIqbs/lhlKXvFUTUcrGf+xa+KER2YZxCxCNBd8nj2ZVjMcSIUpwURQtPjWcE
         jS+qdWqIEYTHOAuGwsCV9+HgrXYKadgMOOWTlnNqmTtRJS4ga6kBVHIcQUK89dh1q/En
         Cu9Q==
X-Gm-Message-State: ACrzQf081GzdBKrMu1oqEn574LueNAU3KPFwVUllkdPTqtJsF/wXFLaV
        QFkRQCA5LCHGb4RgzHIj40sk7A==
X-Google-Smtp-Source: AMsMyM4txj2HUIrIkQAQSjBq6E0F7asYTAwikStWbcb62DKC9PGIn9NKOhN8u2/lAgEiptWnmHq0BQ==
X-Received: by 2002:a05:6512:31ce:b0:49a:d42f:f4a3 with SMTP id j14-20020a05651231ce00b0049ad42ff4a3mr6681567lfe.171.1664103988770;
        Sun, 25 Sep 2022 04:06:28 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 14/15] dt-bindings: pinctrl: qcom,sc7280: add bias-bus-hold and input-enable
Date:   Sun, 25 Sep 2022 13:06:07 +0200
Message-Id: <20220925110608.145728-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
References: <20220925110608.145728-1-krzysztof.kozlowski@linaro.org>
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

The SC7280 pinctrl driver supports bias-bus-hold and input-enable, and
DTS already use it (sc7280-idp).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 4606ca980dc4..1db05c43d58c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -117,13 +117,11 @@ $defs:
           Selects the drive strength for the specified pins, in mA.
 
       bias-pull-down: true
-
       bias-pull-up: true
-
+      bias-bus-hold: true
       bias-disable: true
-
+      input-enable: true
       output-high: true
-
       output-low: true
 
     required:
-- 
2.34.1

