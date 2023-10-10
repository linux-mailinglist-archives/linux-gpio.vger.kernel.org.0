Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF987C44B3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 00:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344219AbjJJWuL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 18:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234709AbjJJWuC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 18:50:02 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866C09D
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:53 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32d80ae19f8so567908f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978192; x=1697582992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Hq9vS6neSumB86pCRKEyVFqMD1RM5EQzhHCNjwZkMA=;
        b=x9r1rWekcFEj4aw/+YmLonsUEaLeckF4ZK7Dvpp9HenatJn/RCTRSUWj/jWP6TltFM
         2xC1r545uwkdZRoe7flw0RuNRBF8KH8dLwsB/DY1E2l6aSR1WdtAo1vkrdrQdvj3iQFE
         gVylQmogeXEHRbpMI9szCJ6JYR8O034k3mzJnCjUYMkJXhgiq3aaHweI9IXTGOwmJmFf
         5DHrJLD3xNFedOUz/pImUtE/MB6DMkxPQhs043YbLsPtZxPfxHjBpYnz9fsUJXonhIAJ
         l5dHs9nsvTXehOw/TW/s8/eCfi3a+wnAfp+vJXQpZ4+iC/NaNSraF90l/vvM5uYC3U7U
         YYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978192; x=1697582992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Hq9vS6neSumB86pCRKEyVFqMD1RM5EQzhHCNjwZkMA=;
        b=a4E4PDJ74pEX1cphd28I/rAMqRgIDqZBr+ofmRMsFbrWEiHWO51EiqpkR8dsxoXdCU
         bwm+J9OUPaAZUk1SHntC8W76nAey8g1zz2lqP9KwvnZXipYd1ny/QgGBIk2X3nyoCMKD
         HqvmuIlY7gyP7nc5WqxdbuXYPfq0880YGx1nq0Uda56tOogZgHQTnmGt7Jkqn9BY1GRs
         KEljT/0wC/q+sATclajEBdKG+sjvUcw9DeE6Hid+O1/xwmsf/uZabCMW2VrWmONTKpNP
         jcdtWJES6ZrxoCNx7au6+l2M45lyF8xgr4vx/Gan+6a7LpKqhF40q++hBmDMyWgu/65W
         BN8w==
X-Gm-Message-State: AOJu0YzOJP5VMONEsiHQ5YoHbPK1VtpLE/orvifIp6YofG8VDuTG5WwR
        xJr6IqQGaviuB4IHbsl8J6JUCw==
X-Google-Smtp-Source: AGHT+IFq7RnQsFfD4fu2RfO3iXmtJntMfPE1V308P1kDHa+sR25ENbIusBbQyBhO9DhcGLgTsGUgpw==
X-Received: by 2002:a5d:69d0:0:b0:31f:fa61:961d with SMTP id s16-20020a5d69d0000000b0031ffa61961dmr18822018wrw.63.1696978191901;
        Tue, 10 Oct 2023 15:49:51 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:51 -0700 (PDT)
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
Subject: [PATCH v2 04/20] dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
Date:   Tue, 10 Oct 2023 23:49:12 +0100
Message-ID: <20231010224928.2296997-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
dt-schema documentation.

gs101 SoC has two CPU clusters and each cluster has its own dedicated
watchdog timer (similar to exynos850 and exynosautov9 SoCs).

These WDT instances are controlled using different bits in PMU
registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 8fb6656ba0c2..67c8767f0499 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -17,6 +17,8 @@ description: |+
 properties:
   compatible:
     enum:
+      - google,gs101-wdt                      # for Google gs101
+      - google,gs201-wdt                      # for Google gs201
       - samsung,s3c2410-wdt                   # for S3C2410
       - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
       - samsung,exynos5250-wdt                # for Exynos5250
@@ -42,13 +44,13 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+      Index of CPU cluster on which watchdog is running (in case of Exynos850 or Google gsx01)
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7 and Exynos850).
+      Exynos5420, Exynos7, Exynos850 and gsx01).
 
 required:
   - compatible
@@ -69,6 +71,8 @@ allOf:
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - google,gs101-wdt
+              - google,gs201-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -79,6 +83,8 @@ allOf:
             enum:
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - google,gs101-wdt
+              - google,gs201-wdt
     then:
       properties:
         clocks:
-- 
2.42.0.609.gbb76f46606-goog

