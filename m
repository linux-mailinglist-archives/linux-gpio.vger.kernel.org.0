Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B25B17C44B2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 00:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344186AbjJJWuK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 18:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234702AbjJJWuC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 18:50:02 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28373DD
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:56 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3296b49c546so4038581f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978194; x=1697582994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zurLR0/e73s9qaXsNiBj25J3OO2Gwg9apCX41yzLfwU=;
        b=vN7waHZJ1fE/CcYNyfTXYtR8ERDdtYJIeDhLqJw291GcLJFX0KecEkzom/XHOdNdti
         lh27WpfR7TENnqJEARGDk6cc0Ul8d/VcwkIzlUDWFFKtC7ic84bbBag59onJclssMUCz
         f6UE6uptuHo7a2+XNvfxbfoLP3PHIH84ejURu0oc/+SHj9edGpmQ0hw75WvkEGN7hEUK
         ACuu3C+KI5TlSKlEqg2veCSGNnOMrd/HX4/BzNfTIvOirMFxe3fUHxhGXjt8/5SNp3Yz
         t3KyHDwttKWjdISUekGBnBPlnyFECEZhwLxLmaV5rTfhNCijzR6npZY/whodkuHqkjLy
         r8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978194; x=1697582994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zurLR0/e73s9qaXsNiBj25J3OO2Gwg9apCX41yzLfwU=;
        b=rlRTw9KsJZmceP/kE0dS/Nb9HxC5p3/HbwgpRQCWgro2NsrFq08cfWwvA28z/3oBh2
         if2tpLUBsNzyfEMn6dRDtG3i+gdyVefu9RvXUc+sAY6tTv15SApPlRAIPu5UD/YrHCSU
         069Fe9F8rrxcvqlb4d0cCorEn8e7iLjZvif4ZcTm8tzBNMZ7wAyLMN1VYc1DocJwEMbQ
         K6uL9CqhfI9Z2mIq4KM7c5aQMSkNdL77vUbqos180DezYc9+UnU4yNLNGE2rW/xD7aOH
         0JUyrNFATNN4aqv3DLZiEvKjtgeN9x6lcdGaAnxvj3crRCdKsmbpW3wrb+KqX4LGbX5L
         LoVQ==
X-Gm-Message-State: AOJu0Yzn9vte/EQmnU8VGkgSWsBQ+JgwHE/1HtBMxbsmp6ZonLFFJQ+Q
        TdYhxWargAb8TYSGQ++S6NGqUw==
X-Google-Smtp-Source: AGHT+IEjsAdZZ2TrgAKTWEGnW3p1wMPoziKHfwDUL1AzluyyUU59YKFDtce6RDEjYzrGHYVBL9ceag==
X-Received: by 2002:adf:f40c:0:b0:324:8700:2fec with SMTP id g12-20020adff40c000000b0032487002fecmr15763212wro.64.1696978194557;
        Tue, 10 Oct 2023 15:49:54 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:54 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 06/20] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date:   Tue, 10 Oct 2023 23:49:14 +0100
Message-ID: <20231010224928.2296997-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Add maxItems of 50 for the interrupts property as gs101 can have
multiple irqs.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 26614621774a..2464bc43aacb 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -35,6 +35,7 @@ properties:
 
   compatible:
     enum:
+      - google,gs101-pinctrl
       - samsung,s3c2412-pinctrl
       - samsung,s3c2416-pinctrl
       - samsung,s3c2440-pinctrl
@@ -134,6 +135,24 @@ allOf:
           minItems: 1
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-pinctrl
+    then:
+      properties:
+        interrupts:
+          description:
+            Required for external wakeup interrupts. List all external
+            wakeup interrupts supported by this bank.
+          minItems: 1
+          maxItems: 50
+    else:
+      properties:
+        interrupts:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.42.0.609.gbb76f46606-goog

