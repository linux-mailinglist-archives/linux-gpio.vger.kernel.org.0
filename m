Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3CE441166
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Nov 2021 00:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhJaXTe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Oct 2021 19:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbhJaXTd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Oct 2021 19:19:33 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77815C061714;
        Sun, 31 Oct 2021 16:17:00 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id f4so290696edx.12;
        Sun, 31 Oct 2021 16:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dIz+D2qZaiI589Z0uFKXbOXgf85hUO1jhwoeXytI7HM=;
        b=O6qXLStaG8EkmcoZl1p0aD8NXcDO4zYgxIxTAiR7w3F+7ZIHIyhwZtSvArE0Hd7Gnn
         zMa7bmZzWjcPo1ic8zNGYwN+p4rFDK+ujtjhxB+054c5adLN500VV1kYItyxwQhV1Iqr
         aiWATM0Teu7u/X6iZ9lUSW0P5WE1IJiUTNjlCOHk15ArDkRE5c1MfFiYp9OX8p4hVnB4
         FDN34iXhq8Vxq3KkWkTXiG/q/DsUe4pwPv4wfDWhb3ZiFmeFIVhlN/AhrndaWQyXKaxh
         UsY2yY9Aoc9wDmXdEEPhnSqZwFCahqOzGlZJn3BEfZc7jyhkoaIQwE20Nh5sereCXwDT
         eW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dIz+D2qZaiI589Z0uFKXbOXgf85hUO1jhwoeXytI7HM=;
        b=PU/mYObWM9pVhns3VEpCKMAHHRfKstmw2QfW0fzpRPIeESqEVajDrKP8jwk4fx5sdU
         3KeG4oTGMdtUexDGlKSq03LQ4ZFMnp7uOY4TenvMZTw+8CicUwbx+MT8GoZMqgN6p+1P
         rpp6jxY7R0u8cwbMlxuqPZcmh5R7m9hiqmjVTbHAc6r8ShuuEogtdH++r1vUImSwo5Xn
         oHm8zAh0dzkeIlUq1A9bhMxpjYNZ26zzV4e0vcLkRd+yfD6QiPPoG9hxDolOA3aA3weI
         ka0hR7GLVqjDGJPYVivL1eo/4pEPUsixAz5BxIF0tx0AKayFJ/VHZMdWMZzeRW5aRabX
         Fp9A==
X-Gm-Message-State: AOAM5311QR0BwEzaLSsGmc3swexpbxSzdE7tXKYw8EBHN3YOuKRCbEBy
        dIpO1VTTykWvOxxODgKMrCY=
X-Google-Smtp-Source: ABdhPJz4UjttpxK+IJQasRgvFv2IwRTWmnxmGl2gXT5ChlMy5E83j9TTMFRQCi6oHMotYIYdP0i+Iw==
X-Received: by 2002:a17:907:7b99:: with SMTP id ne25mr1131888ejc.15.1635722219069;
        Sun, 31 Oct 2021 16:16:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:368f:2080:eab:126a:947d:3008])
        by smtp.googlemail.com with ESMTPSA id hq33sm276290ejc.119.2021.10.31.16.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 16:16:58 -0700 (PDT)
From:   David Virag <virag.david003@gmail.com>
Cc:     David Virag <virag.david003@gmail.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: samsung: Document Exynos7885
Date:   Mon,  1 Nov 2021 00:15:11 +0100
Message-Id: <20211031231511.46856-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document compatible string for Exynos7885 SoC.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
  - (none)

 Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index b8b475967ff9..9e70edceb21b 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -22,6 +22,7 @@ Required Properties:
   - "samsung,exynos5420-pinctrl": for Exynos5420 compatible pin-controller.
   - "samsung,exynos5433-pinctrl": for Exynos5433 compatible pin-controller.
   - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
+  - "samsung,exynos7885-pinctrl": for Exynos7885 compatible pin-controller.
   - "samsung,exynos850-pinctrl": for Exynos850 compatible pin-controller.
   - "samsung,exynosautov9-pinctrl": for ExynosAutov9 compatible pin-controller.
 
-- 
2.33.1

