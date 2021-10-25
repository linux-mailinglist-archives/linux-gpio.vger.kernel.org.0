Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C5F438D21
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 03:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232129AbhJYByf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 21:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbhJYByd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 21:54:33 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5B4C061764
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 18:52:12 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id gn3so7084409pjb.0
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 18:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gRd+RlVLZdu2e4cewW0/Ur3V/oVt9QlpNhBXQEbtHVc=;
        b=meCBAmuRcaBBzXvw2aIzrz5WcBDbY4G4NP0hyRptI7+H1CduSFxgamDAS47gpgtYu4
         eeZigcteWARCfs6adcNJ/JrxfCgH6tImH25tjPhyLkhus8kxtbP8c0//4jzVJ88nNFyb
         lPKmiPxWk/gugRegCg553xppYKAL8liZkOhKLhk5e2z8k5FvsoklpqT1XSU41BcylUsI
         juXXoUttyyuXkBUa6i5rGjInZlUTxLQyT8Lb6ldti+1R0QcBhOyKDlSsMOFywVurzgdP
         vX/JI92XRazZK2phbuppB0yfnNPwLj5DLfO/WaYvlSpvuBOG8AmQ53EPPn5ybaQzzdKj
         ajJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gRd+RlVLZdu2e4cewW0/Ur3V/oVt9QlpNhBXQEbtHVc=;
        b=4Ntpusp91drjFI33V05i2/ap1gq0Cb0IYghx54h/2X+X6e9TM9UA6MLeyiQeuSppP2
         N1z7IruEjkptP8fYuHgjxbDs9vT9FA7kDhZX3jf77SEWBWLY6aVkZpIoytwmMqG9gjHs
         hkbUK/Y/fS6x5zSwEP3kx5cRnQZGU5nvklQPd/Y8JC2jKksNlhGgPji92NKfRWPLGiBx
         aYtefCvl8jLzyBs+5sHIoeQ0PY0fXBckM5WxmMyAm9sggv5nni2XD1J1cs7rfP5niYnd
         anrKu7QCCGGv8IfYD82PPQLVfCADCsJesy+xE4pug0dHa/3Y02K/uugFYGFnEHUAML/A
         /3VA==
X-Gm-Message-State: AOAM530RvbB8b8nDzXt2hDVmoyYtZNB41Qmp3jbXKeg9eNg5LcZWwLFx
        nF3zlGbwEpDzsSfyWn/swB42Mg==
X-Google-Smtp-Source: ABdhPJxuUmAc+grc3TitHnXVwBQJMnHzMIBQfbm+w4plWIkTkOTL/0HHOucMVEz0h2CNOcR+M9qUVg==
X-Received: by 2002:a17:90a:6b0a:: with SMTP id v10mr31822835pjj.130.1635126731699;
        Sun, 24 Oct 2021 18:52:11 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id q10sm14855225pgn.31.2021.10.24.18.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 18:52:11 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/11] dt-bindings: mmc: Add Pensando Elba SoC binding
Date:   Sun, 24 Oct 2021 18:51:48 -0700
Message-Id: <20211025015156.33133-4-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025015156.33133-1-brad@pensando.io>
References: <20211025015156.33133-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Pensando Elba ARM 64-bit SoC is integrated with this IP and
explicitly controls byte-lane enables resulting in an additional
reg property resource.

Signed-off-by: Brad Larson <brad@pensando.io>
---
 .../devicetree/bindings/mmc/cdns,sdhci.yaml         | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
index af7442f73881..6c68b7b5abec 100644
--- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
@@ -15,13 +15,16 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - socionext,uniphier-sd4hc
-      - const: cdns,sd4hc
+    oneOf:
+      - items:
+        - enum:
+            - socionext,uniphier-sd4hc
+            - pensando,elba-emmc
+        - const: cdns,sd4hc
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     maxItems: 1
-- 
2.17.1

