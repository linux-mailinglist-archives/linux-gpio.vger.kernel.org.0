Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC38D7C5BB3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 20:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234995AbjJKSt0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 14:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233219AbjJKStT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 14:49:19 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD31D3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:17 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-313e742a787so59249f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 11:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050156; x=1697654956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S362tpJExSD9AFXVozhsg8w79jdxlBQhALXvNfI38Lo=;
        b=qIzRaouvzI2bI7Ma67wYLbq0PguxxuRA/9z+HPMGps597b7cVUW4iC3z9E4dsMgHhJ
         yvT4itIu+8yJmW3rV9tdEhPPO4i6cLFb4kPpfrLZm5YGWbV+CUWq+Y8fWN4MqXV5/1KK
         DyLlUpB4Z5eb+v7Cgup2sbxu7TvMjlCJgihCguOQoSlNbA7KgeVjTA4bThVf2TCd8Y7F
         QAiUyPAMOtZqgEV0OMqKIyVliIUuQEuTeTpRzlqqofBn8MvGjGACmaHR+OwFGldoS4WI
         P4Xuz09/lNW3vdBJlPdc0pvXAFif1iA0mEKXV5o9UurpKUZjxJJC5vpJSsH1Zu2YDReK
         +gDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050156; x=1697654956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S362tpJExSD9AFXVozhsg8w79jdxlBQhALXvNfI38Lo=;
        b=Qdi57JmLSNDb97pdWpScSKqSHCfDVrprIaRotChmmkE3I2eidpB2KLEG9bAvBs/7KI
         ALcNpTeidxiSaI0IYUJhhpEhj8DQUSzE2/bhPZdQlxYG948bCSIt5hnz9hEw827eH711
         Q+mCLhaCkMwOs8aBXAj+wUMQUFtkiZCk+usP3VyqlVKodqLzUBR0fYFtX1DBDMsPXFC6
         gT+//bQmHjU0z+oloPf+81U056wJdVlVfirWegraNbjFqmSt0T2PLIgmzbAaf8RW6e/9
         hbQNdkEMqlkHQDGIRN23gDM7RPA9LuO7POHSZdrUYhCMzRK7Rob27UIM1OaVPYQeRAxJ
         mnBA==
X-Gm-Message-State: AOJu0Yx6LlY5ObeRtbu9xAoPLzM3LvzaFHNa4ptU9qTOoQuU+H+iMFYr
        j8aiWWBS9jWTewu6nRoWKWcYgw==
X-Google-Smtp-Source: AGHT+IGWXJgG8jQ2wZzHbOpholobKcSzj72Q/s7q+IO71JO3r66rxoX1o5QEGkQf6t3ixfI+6Nr3Zw==
X-Received: by 2002:a05:6000:71e:b0:329:2649:ced5 with SMTP id bs30-20020a056000071e00b003292649ced5mr20464742wrb.32.1697050155898;
        Wed, 11 Oct 2023 11:49:15 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:15 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 03/20] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date:   Wed, 11 Oct 2023 19:48:06 +0100
Message-ID: <20231011184823.443959-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
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
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 163e912e9cad..dbd12a97faad 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -30,6 +30,12 @@ properties:
               - samsung,exynos5433-fsys-sysreg
           - const: samsung,exynos5433-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+              - google,gs101-apm-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos5433-sysreg
-- 
2.42.0.655.g421f12c284-goog

