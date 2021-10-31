Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF63B440F35
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Oct 2021 16:50:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhJaPxS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Oct 2021 11:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhJaPxS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Oct 2021 11:53:18 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F887C061570;
        Sun, 31 Oct 2021 08:50:46 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 5so55133176edw.7;
        Sun, 31 Oct 2021 08:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2bexitaDg2Y3iHmlrxKLSrp7oBsCielhGeP4I3npPL0=;
        b=Oi8mqhgYucm5S3SnE2QAgz/5r3Up0npR9CXiFb9fQeYftCEDT+0feuzkiXb0m2jYAL
         BLG12UhjyEc5cy/uMKXH65cRQ8ru08RrdmCrmowxQYujXGi1bxgDTYk6MRgT3zTO03gz
         VfpgEzbFADCzgg2iuqT1xGqsdmOTavqMptDiie+FePRKLsU114WF3ki+ey2AQBLLe9ms
         PFy0tShfELbDqWkM4mxyqkSPWuU64F4mIZ2Nobj/MgbyXIxIZ2b/dXL7HpPmnq/yrxSb
         Fo6nEMLYI+cUl1ivfzRtrGl8SFOJ+HFs1SLyueVeXS1sWv6LtB72bOykxlSEjD2w1x3m
         0c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2bexitaDg2Y3iHmlrxKLSrp7oBsCielhGeP4I3npPL0=;
        b=jnEN+3STRCpk2cdetOdVfJm1vAg3bEH1Kcyjk4KHBZjJ9Rj9nmNz80GXDb/1XIGtSM
         a5Gbo3lNpsIxPGFh2l6Jfj7l6vpIWTRngPz+dTVsy0PQZ/YwFKSi7U9wf4Gp+O3y6Hwk
         wi0CgNDg9W0KdBIEICLDITmcVUr46TFVZbOtweGaR0REQ88pR+J4be8I2YaZ37i/1DLR
         W8mAVLSsxJKhM08ncVL/IC6bLYrQ+XEqL5M5tlvGtUeM2LxY3qF1b/Zkeavu3ISyQpD3
         u4DCFm16iWnIJAAgcTKbven10RmEPEy7JQVg/R0ufzMnMUbwjqjWSctmhbxZZq8PVKN5
         SRGg==
X-Gm-Message-State: AOAM531EUjHR/tuItFnquBRlsqV+CMfyVN/Rt6npYNbTkHmZQn8YQaoJ
        0YKKkE/N6hlB25hPrfi+o6PX1uKSvEsF0Ar5bkE=
X-Google-Smtp-Source: ABdhPJxwwW5vIy6HG/vxjYZiKRswnJqJuNZmWRiFSIuKKTkD3uJZMaHZj1eVoc3/WqQP+E2K55zaJQ==
X-Received: by 2002:a05:6402:1801:: with SMTP id g1mr6676528edy.107.1635695444412;
        Sun, 31 Oct 2021 08:50:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:ab88:368f:2080:eab:126a:947d:3008])
        by smtp.googlemail.com with ESMTPSA id cs20sm1550167ejc.105.2021.10.31.08.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 08:50:43 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: pinctrl: samsung: Document Exynos7885
Date:   Sun, 31 Oct 2021 16:48:51 +0100
Message-Id: <20211031154851.20103-1-virag.david003@gmail.com>
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

