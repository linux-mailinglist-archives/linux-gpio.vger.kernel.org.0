Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 131577C44B7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 00:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344242AbjJJWuL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Oct 2023 18:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234654AbjJJWuD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Oct 2023 18:50:03 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBFAF2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:57 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40535597f01so58603945e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Oct 2023 15:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978196; x=1697582996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4qKMp7WKTgYWQn4jdaHUw1RN+hYCPkZJUgFKC+LCBg=;
        b=vEg2JvS2P4cPdjf97YddAJjciyShFEruYZVqqx6QI+cM/9KqgXPUK/JX7Fsg27mijC
         +xikWtTXE/BTYifhtxw0Nraj+vpNdllf2dbFOsoXD4SG2nyMISUXry9uBV+UAgdpsd24
         1DZmSKv+d23bmNXwK8W5Bfs7AoWeGJkgrTfeGK/PmCQZeelJNCqj9LWedwPJqQnzXmXp
         rjaWm9Gy9pI4Mlc/3gHs17CT2nx8ZKmM62gS6qYHwkX23Kg3AURhDUOwXZJuDhqlTGNa
         n5GoNFEe1+SNpGCdFdfdVuS8gJmJ/NWyy5Rh5xpFeCVS9PFWnTu6B3MvWJ+oxS0Ml++k
         lnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978196; x=1697582996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4qKMp7WKTgYWQn4jdaHUw1RN+hYCPkZJUgFKC+LCBg=;
        b=tIxqF6hk+acYukSCyYdg4KgGmYYcKOGEDdyApcxKPdqZc01WuP24GD2nlobZKBiIOP
         trY5hyhJ92bgzwgROL7kW3iYYpqnsFD7r7nUYeIiqbNWQQTMc0cAn4fSZYs6cErDiwAY
         v1Ukw4aDmKOs2Ce0n7R43GZHK1IDlKzVRL5lAHTm9NIOS6zLtO+fBtSo3rKyK3cOGmGy
         ut5rSNBGrGDK8OnzpVH7+q/To1ybaO2Op5+69QSrkI/Qz1ePqcDAT7uIyZgn5lhmWmZ1
         V7EmQGH6Kg7D2ZLWeqI9XoXwTabpOiVYNwavA16zsQvxYEXIAqW5rV313HsQnW/jvUG/
         luDw==
X-Gm-Message-State: AOJu0YzROeY44FuMMPODs0XcuN7LQsk28XM8noOopRlmiA6iEIapKdtE
        Q2f78KiO/wCPzqdrIKy7s4I1Og==
X-Google-Smtp-Source: AGHT+IEloZuZCLDePUs0QPFYOcybxWTkJkyfed9V3vJNhMuLIOUj4aXik2RMdRgdMNiAXc/amo3vnw==
X-Received: by 2002:a1c:7212:0:b0:401:bdd7:499d with SMTP id n18-20020a1c7212000000b00401bdd7499dmr17694790wmc.25.1696978195874;
        Tue, 10 Oct 2023 15:49:55 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:55 -0700 (PDT)
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
Subject: [PATCH v2 07/20] dt-bindings: pinctrl: samsung: add gs101-wakeup-eint compatible
Date:   Tue, 10 Oct 2023 23:49:15 +0100
Message-ID: <20231010224928.2296997-8-peter.griffin@linaro.org>
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

gs101 is similar to newer Exynos SoCs like Exynos850 and ExynosAutov9
where more than one pin controller can do external wake-up interrupt.
So add a dedicated compatible for it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 1de91a51234d..7cddce761c46 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -29,6 +29,7 @@ description: |
 properties:
   compatible:
     enum:
+      - google,gs101-wakeup-eint
       - samsung,s3c2410-wakeup-eint
       - samsung,s3c2412-wakeup-eint
       - samsung,s3c64xx-wakeup-eint
@@ -99,6 +100,7 @@ allOf:
             enum:
               - samsung,exynos850-wakeup-eint
               - samsung,exynosautov9-wakeup-eint
+              - google,gs101-wakeup-eint
     then:
       properties:
         interrupts: false
-- 
2.42.0.609.gbb76f46606-goog

