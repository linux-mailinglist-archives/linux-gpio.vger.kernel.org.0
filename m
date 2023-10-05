Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A427BA439
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 18:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236272AbjJEQFG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 12:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235880AbjJEQDr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 12:03:47 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF0B86803
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 08:57:26 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4053c6f0db8so10295445e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521445; x=1697126245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJY5YzgjF6JlKZ8w8bEEVJWVaD5OM94gHSjpC6e/tYU=;
        b=NZJtyAUmqCnPHXpOwrhYGZpGfzxJOiYvHXFpRUCEHQdWEjCLogFfV9F7v7NcT2RlkU
         u9ozCQxwMSmOoMygxK5UwogrRjtBfQQa5pVq6LASjv3fqT3XRQ1ojOVLtifl4w1HhEgO
         kvQvFWgOnGei3Wqb0xrZU+keHscXL9w3wjS+P5lPiq93/eurG1sCep8/jijzH+lS6Xmz
         flhRovigTT8duxbceUvFiq2aOpq3Cr2OocveK5AJm/QEtciOWHo/Ms0tzziJD+0Han46
         ZaoNRbgPTyVoIEKPY0b/yWpLf8jEG3erJJdjUbFbDXE9TfGXXruupDjATFHM7/YxqZcW
         Uq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521445; x=1697126245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJY5YzgjF6JlKZ8w8bEEVJWVaD5OM94gHSjpC6e/tYU=;
        b=D89bW+VCT7w9vil0f7pbJgjCmAFfA72xB2pTLYaA7m5aaXbOI+NmG+xS+1r8bULfxE
         ZBrX7bdvuEqd9ZTQ3dduAGGzb8DyGL+Ii8/doFa/zF3ELnJn1dp+rJ9k0yTrSB/GE30m
         lWZzkMQrt+uq/OKuozT0K1rMHoJkW2hbtLgRbsMHiTYNCvs1vlVXIuhQ4FJoaIfessLZ
         Z15eAcj1/+0f5KQflKvOMxgXw1ue1eJJKQIUE2cD0WbbO+qWY4KVdykBl7oJUWL9JcVn
         5sN3kxbABX3dpQmhnsgY1vwLaglsMvybNNeulAaEB27+wKrNX4PpLA6yuQ4IgE0V3UG2
         6wIw==
X-Gm-Message-State: AOJu0Yx8eGCknZLe4r9RMhJK6IhVCXXsXsRozAqYasR/XiUHB5nxzJgo
        CkujX0jRdNQoMD77rOBAffUbpg==
X-Google-Smtp-Source: AGHT+IGiE4LAahvWXJtk7tI8KG5YKIIkGsBVrQ6crOBhLdNhWbs7O377srtrTm+hbZwXS/xfBg4ukg==
X-Received: by 2002:a5d:5912:0:b0:31f:f11b:8b68 with SMTP id v18-20020a5d5912000000b0031ff11b8b68mr4581645wrd.71.1696521445200;
        Thu, 05 Oct 2023 08:57:25 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:24 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 04/21] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date:   Thu,  5 Oct 2023 16:56:01 +0100
Message-ID: <20231005155618.700312-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
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

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml        | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 163e912e9cad..02f580d6489b 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -50,6 +50,13 @@ properties:
               - samsung,exynosautov9-peric1-sysreg
           - const: samsung,exynosautov9-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+              - google,gs101-apm-sysreg
+          - const: google,gs101-sysreg
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.42.0.582.g8ccd20d70d-goog

