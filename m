Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413FA53FE79
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jun 2022 14:13:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242467AbiFGMNo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jun 2022 08:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243494AbiFGMNm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2022 08:13:42 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC038C4E97
        for <linux-gpio@vger.kernel.org>; Tue,  7 Jun 2022 05:13:40 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id u12so34802695eja.8
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jun 2022 05:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zD7WXjHKnOOdAs/2q46R5gmJNVeU3dxPe4dDabLcQvY=;
        b=LjRRrSmSTZ3zi8QCgFXJAGaDa2Ryz6vspfZoyyftrFhsXyhRaucC/1bKq8VOgz9EOS
         gsNnlW/BXHJ4BfFq0byWHCb+uUv2+DXKqSAghiyMcAEhoTC8d2k0EIvhljJsmYO7Q2d5
         NJQDXL2lpFABGN4H+hdXKXfiVIY0kq8kil55uTaQUrqGH5vmpv8O14dVik0WcJI3/ToS
         0/KwKiPNGZ/OkQaMCcvEYMooeh5ms5K1p40Fmn2dTpjUgU6wvTKy7EE4C5cc4IURBPCn
         AdduBW245z7CQux9yrOoqSwOaTFMVZRQNPegpJLX6GgL/Q2U2PDEnJGc6IH6MVdXf5aO
         Do+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zD7WXjHKnOOdAs/2q46R5gmJNVeU3dxPe4dDabLcQvY=;
        b=7u/V5F3RZcqZpF0q1kis4Ku4aGjpN6jPzb9nlrUHEmLKxehm9N40lteqTTdswolPXY
         c3W1q4aZJb3H3rZKE2qunfoZanp6sH0AttQFdwtq36VqU8+VBk1h1FQinvZCcOLsBLlq
         jiplndUvGE2EWbazTLwlkPuGFTlu3P+ONilf65t+qHBBHotcKgS0ikmoPjr2BPyI/z8E
         sL0PEd3jCUQ8VlZ89BnLWZVUltmSMrRsD3A6I5YcvblDf+w/zdYfZ1HTiEcmla2aEwFU
         ceaThPNpWFZ6kMo07ViOVrvSIWmmXiWoR/QfiJmpQXFHbe9hOgxkpJ9TTEQ3r6+Si/i7
         SHWg==
X-Gm-Message-State: AOAM533rOsLGk97yg8+AUIO99KA8LvNgruMskaOWADJhdTG0C2n/kjWP
        RJ2jsjhF+deCGyajeDE9lNdQ9A==
X-Google-Smtp-Source: ABdhPJy9ErtNMrjxPqGpfnfj+AXYhngpmrALPZs6T0DtTpjfQ4zIzsuFm9KrZWaVDAqft1jzcvQh/A==
X-Received: by 2002:a17:907:7fa9:b0:711:d214:36cd with SMTP id qk41-20020a1709077fa900b00711d21436cdmr8018509ejc.600.1654604019564;
        Tue, 07 Jun 2022 05:13:39 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id fg16-20020a1709069c5000b006fe8d8c54a7sm7542749ejc.87.2022.06.07.05.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 05:13:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: pinctrl: sunplus,sp7021-pinctrl: reference generic schema
Date:   Tue,  7 Jun 2022 14:13:35 +0200
Message-Id: <20220607121335.131497-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Reference generic pin controller schema to enforce proper root node
name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml
index d8e75b3e64f1..15092fdd4b5b 100644
--- a/Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/sunplus,sp7021-pinctrl.yaml
@@ -288,11 +288,14 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: "pinctrl.yaml#"
+
 examples:
   - |
     #include <dt-bindings/pinctrl/sppctl-sp7021.h>
 
-    pinctl@9c000100 {
+    pinctrl@9c000100 {
         compatible = "sunplus,sp7021-pctl";
         reg = <0x9c000100 0x100>, <0x9c000300 0x100>,
               <0x9c0032e4 0x1c>, <0x9c000080 0x20>;
-- 
2.34.1

