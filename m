Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 210C87BA43E
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Oct 2023 18:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbjJEQFI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Oct 2023 12:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237060AbjJEQDv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2023 12:03:51 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE748683B
        for <linux-gpio@vger.kernel.org>; Thu,  5 Oct 2023 08:57:32 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32488a22810so1039866f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Oct 2023 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521451; x=1697126251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylH3r2N4huNUb7il+GAvao+h0OGeqDeAdkjyqYnsGYw=;
        b=KiKTGGxBP6ZDFcKpuUl9/FXoOpG6W9/PCwrOD8gEpkVDDVnNjIQpMqIemF7mvLN4mi
         3bdUQFYAEkMxpCCEcdvgaJCSCFw0wEcwMNBL6DShp0JfirJZIAgMsnd35mk7Xqsme7sy
         RJxn8gA7UtpZ1RyX/V18ofP4e3XksSjmTq/IW6CcLKrlT5MpgA2y1QuJl2+4sXI85MuI
         LK8t9iiM8jT0LXv3jHPD89pilNQM64ilkqUdraBLQB2iqaf7prTGe9EHhFfg9hKcCocF
         zqfUBjHrkMgPyMvsy+jQ5kTWJCybS0AlFloapCly/g1pJI1wi6S6p6eYC0GO+LpFObg/
         m1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521451; x=1697126251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylH3r2N4huNUb7il+GAvao+h0OGeqDeAdkjyqYnsGYw=;
        b=vA3gscFm0H78PxIZouKX/CVcaX6qe2cqBt5Bcvu5H2mafibDykcp/EZn+HeHPJ71TB
         /PfP/DM5AsjPnshCtRnp/31M4U+C7CmS8IqNUeh3gV3TaINj3rcF7oCRbwv3VeJdSAIG
         DTsgnMgA57RM749/Ml4fPMunQNLMkxzIltMfF/310nsgp5WHS8HKyoHzu3mp5WdAuGVB
         d4Ooimi0HtE8G2VBb7q8Fy7cp3pdrzpz2xapOV7wLehF4r7fTJi/nypkvyWXNX/sxgb4
         jzwXUWha4S6wfPL3MDW1M3MMTeYuVXzF4j+CTbwiH6zi+fKwXm3EaODMaoNOdKZYJlGH
         E74Q==
X-Gm-Message-State: AOJu0YxxFp3v8Io1q55s/WgTD5huwqC2pOIkxGwS2BGnOxoNNVcWlFv2
        oqa1WEsxFY5Rv/oxwOt+jKNy4w==
X-Google-Smtp-Source: AGHT+IEPYyyM2IMYe/RJ0phQWyT/Pm8leTRtBdwsfcRau9xe1hKp1zxU0tWr3ekNb0EMRyzrKcPhlA==
X-Received: by 2002:a5d:4d12:0:b0:323:16c0:9531 with SMTP id z18-20020a5d4d12000000b0032316c09531mr5128395wrt.13.1696521451269;
        Thu, 05 Oct 2023 08:57:31 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:30 -0700 (PDT)
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
Subject: [PATCH 08/21] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date:   Thu,  5 Oct 2023 16:56:05 +0100
Message-ID: <20231005155618.700312-9-peter.griffin@linaro.org>
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

gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
where more than one pin controller can do external wake-up interrupt.
So add a dedicated compatible for it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 1de91a51234d..668fd903d06f 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -37,6 +37,7 @@ properties:
       - samsung,exynos7-wakeup-eint
       - samsung,exynos850-wakeup-eint
       - samsung,exynosautov9-wakeup-eint
+      - google,gs101-wakeup-eint
 
   interrupts:
     description:
@@ -99,6 +100,7 @@ allOf:
             enum:
               - samsung,exynos850-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
+              - google,gs101-wakeup-eint
     then:
       properties:
         interrupts: false
-- 
2.42.0.582.g8ccd20d70d-goog

