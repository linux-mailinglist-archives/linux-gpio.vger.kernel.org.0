Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236815E927D
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Sep 2022 13:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbiIYLHR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Sep 2022 07:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbiIYLG4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 25 Sep 2022 07:06:56 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5651D32A9D
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:30 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a3so6754866lfk.9
        for <linux-gpio@vger.kernel.org>; Sun, 25 Sep 2022 04:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=6qiFysm9YOq22jr+04Jj1ATXUz8nTarw0VSyiTjbRuo=;
        b=KQj4Lxpy7J5c5gtfdn2MCnns59x82sYbZgv+SsKYGc+KtkPtQbxD9V5MkvijEtFyop
         jWaT/Pr8UzaITtZMpFladmxahteM8r9ioOmcbUY0Hjy0TLxqt3vdxo18/9pfQqOaaroh
         uShMvSt9QU+U9eIGk3G3X/dyK+m1Hoktrh8qT9X+EGLy/4lKUikwo+BoogkZE91S0/Sv
         JRTYnbzoRIy8bQWk4J0RsFOR8zOXWzX2rVVTnGsuO22Fm1uCqQnaR3LQl5utfJOJXDIQ
         dw/HvaUkKjlP1KrQ2iXnlStpbSIBfQkX/zwXzD8vzO23hplm+UiLWIur5cWzWr8s2TTw
         KcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=6qiFysm9YOq22jr+04Jj1ATXUz8nTarw0VSyiTjbRuo=;
        b=Rw9Fp8GHroIAz1jgSjYirdVwzJFfI7qEn881UoIa/Cwf12r1ZC2ElemuXhks9hK16a
         R8mOnuVtz+BDHo029sw3ob7JLV23VXMpBaVmAYoEOZBNsmdQTTR51XGI8jstUBXWNhCH
         NxTXLFN1+vPh6n/N3Dmm+XK2Bk8TUjLPQ4nwO9UgxihErsieGQUFIHBJh3aTaPAqfU+1
         l6xirXZWVC12Yrk5PkiNhyjtExoMjL+slzHhqtGsBUbj5T6jk0tlfBCGiOFDkCTifJQL
         poByo5ucDmi4qtS/tVgAQDtVPxPC//GQB2f5iNcZaXO/Iuoi/V828a29AgPgPbNPy5jc
         nhFQ==
X-Gm-Message-State: ACrzQf0o6nwcdazo+pKgfRxztwoBnhH4Q0N3yviw77tZvU8r+0XT6i9a
        YcCzlUog8GFP+CA3M5tAKfCWIg==
X-Google-Smtp-Source: AMsMyM7oWDuDuRm2HN3Eq/tJq4ODnuaLzn5fRVS06W0QrFg8y8fwIm4+jL3RjWbiYRuP+iBkrdqwjA==
X-Received: by 2002:a05:6512:1289:b0:49f:1b3d:88c5 with SMTP id u9-20020a056512128900b0049f1b3d88c5mr6834604lfs.499.1664103989735;
        Sun, 25 Sep 2022 04:06:29 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u19-20020ac258d3000000b00492dadd8143sm2177265lfo.168.2022.09.25.04.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 04:06:29 -0700 (PDT)
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
Subject: [PATCH 15/15] dt-bindings: pinctrl: qcom,sc7280: correct number of GPIOs
Date:   Sun, 25 Sep 2022 13:06:08 +0200
Message-Id: <20220925110608.145728-16-krzysztof.kozlowski@linaro.org>
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

SC7280 has 175 GPIOs (gpio0-174), so correct size of gpio-line-names and
narrow the pattern for matching pin names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 1db05c43d58c..2a6b5a719d18 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -43,7 +43,7 @@ properties:
     maxItems: 1
 
   gpio-line-names:
-    maxItems: 174
+    maxItems: 175
 
   wakeup-parent: true
 
@@ -70,7 +70,7 @@ $defs:
           subnode.
         items:
           oneOf:
-            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|18[0-2])$"
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-6][0-9]|17[0-4])$"
             - enum: [ sdc1_rclk, sdc1_clk, sdc1_cmd, sdc1_data, sdc2_clk,
                       sdc2_cmd, sdc2_data, ufs_reset ]
         minItems: 1
@@ -132,7 +132,7 @@ $defs:
       - if:
           properties:
             pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|18[0-2])$"
+              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-6][0-9]|17[0-4])$"
         then:
           required:
             - function
-- 
2.34.1

