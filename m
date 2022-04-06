Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A204F6EA9
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Apr 2022 01:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238066AbiDFXjX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Apr 2022 19:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237965AbiDFXjS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 19:39:18 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEBB1FE57E
        for <linux-gpio@vger.kernel.org>; Wed,  6 Apr 2022 16:37:14 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id ku13-20020a17090b218d00b001ca8fcd3adeso7302026pjb.2
        for <linux-gpio@vger.kernel.org>; Wed, 06 Apr 2022 16:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gIzwccQNstjbI8Jl7SR9taQgWIVFJXtb5BS39OaAyj4=;
        b=tJSle1eBYuyRF/RzNLAbOHjceFghTYZ48wwtBV/h/pv2SngLWpQ/HePZR8bo4tZjkA
         ed7bgmE43wrskvYyLBX3FUuGPM8Ubn4nhrtimazbTf+wPJsEzkhp6NVByy2KHNNYWuE5
         NnBUffUZnblWHOe7wV3LPB9pI4rL22+Fon+K13e2nf9tFYv4lWzH4/kwGw9++j54TYTE
         2E34E0EFg//jGbw/L4pc4O+1MlumBxoPQcHWyD2fdoJbG1Ciez1+5DQIyeHJmyiSO0GW
         72P8Wca/hV4kX/JWqY8AJJ/4jRSMeImIVvD0H5UpApwWtPLEiFGENCn0nTTtvLlwisDJ
         1PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gIzwccQNstjbI8Jl7SR9taQgWIVFJXtb5BS39OaAyj4=;
        b=Hlifa7S5O7+Tyqo2imGkLeBYD6yRnCeQYpKWr+KSDkkwDGOCCwnuWZX3mqkcY0fwvB
         d0gO/sHy+359cfgwvNEi2BtBDty/3zfA4TKhJFltzFM3h/KPDQJ8e2RB4+No45X2/JrN
         h1mc1TL708f+dR+5naaCCes+iTO1dxdxcFX5Bu/CsqikXcEgtJvn71WA2YSot2tY2JjX
         9qK56q2savM9PxWdqwPbeEa7OgdVGz5hWghH67rpXcr7pzoLl21L7Q3XCLp3pB/pWN6F
         NpoGPmXA11g4+IwkN+9r7G45SNDXdx+2VYB6Lz22wNapW8igNUsbdKgbJAjKCkMuJENp
         baKA==
X-Gm-Message-State: AOAM531VvxGJBc85wlO6J3343XNyhPiGBan+erYYp4odVXZifI/s9/FS
        fvCJ2w2aj9vIFdhK9/iilfjREA==
X-Google-Smtp-Source: ABdhPJx5p2ryl+phBOsVWDdOQDKQvRDAZg+iuAsPG+ozWuTx1ku7n25dB4S8JPxvOXVotqcTQykyXg==
X-Received: by 2002:a17:90b:3b50:b0:1c7:5d55:3cb8 with SMTP id ot16-20020a17090b3b5000b001c75d553cb8mr12740813pjb.78.1649288233781;
        Wed, 06 Apr 2022 16:37:13 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id m21-20020a17090a7f9500b001c97c6bcaf4sm6903667pjl.39.2022.04.06.16.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 16:37:13 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, dac2@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] dt-bindings: spi: dw: Add Pensando Elba SoC SPI Controller bindings
Date:   Wed,  6 Apr 2022 16:36:42 -0700
Message-Id: <20220406233648.21644-6-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220406233648.21644-1-brad@pensando.io>
References: <20220406233648.21644-1-brad@pensando.io>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Pensando Elba SoC has integrated the DW APB SPI Controller
and requires the property pensando,syscon-spics for access
to the spics control register.

Signed-off-by: Brad Larson <brad@pensando.io>
---
Change from V3:
- Add required property pensando,syscon-spics to go with
  pensando,elba-spi

 .../bindings/spi/snps,dw-apb-ssi.yaml           | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index d7e08b03e204..41c3bbf5a55c 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -37,6 +37,21 @@ allOf:
     else:
       required:
         - interrupts
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - pensando,elba-spi
+    then:
+      properties:
+        pensando,syscon-spics:
+          $ref: /schemas/types.yaml#/definitions/phandle
+          description:
+            Phandle to the system control device node which provides access to
+            the spics control register
+      required:
+        - pensando,syscon-spics
 
 properties:
   compatible:
@@ -73,6 +88,8 @@ properties:
               - renesas,r9a06g032-spi # RZ/N1D
               - renesas,r9a06g033-spi # RZ/N1S
           - const: renesas,rzn1-spi   # RZ/N1
+      - description: Pensando SoC SPI Controller
+        const: pensando,elba-spi
 
   reg:
     minItems: 1
-- 
2.17.1

