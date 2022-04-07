Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E43514F6ECD
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Apr 2022 01:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237907AbiDFXjt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Apr 2022 19:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237908AbiDFXjR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 19:39:17 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFEF71FD56C
        for <linux-gpio@vger.kernel.org>; Wed,  6 Apr 2022 16:37:09 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id s2so3910334pfh.6
        for <linux-gpio@vger.kernel.org>; Wed, 06 Apr 2022 16:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0OrPaJyrNtxdYQN2eUUc53MSYLY563Wz1I/VuReoN00=;
        b=Dbg6SprLBcZ/b+fA0iU9Xy+06BmvDC2M6BrIIsneZxH5B4//nq+XUL431w4efQ5rL3
         8N8kA5Yg7I/wIxbqnKh5WgI/hwl9bQfrxlYHE29WJoeTMhuZZVsPinrLf+g52Nd0qnLh
         sBjOnKCa/sTDmuScW4GN/5Eht4Wji1OlUf4OPloSwCqyx18qR8D4D62NLMEU5psH2hS1
         uLkteB1vO06tjmYLlmkLnx3okSIcrjLPJpOi+nLMpKvDLaJAcNi4MRdtVBdDHJMmPjHI
         k+U/78EiYPCHWXZSQKLRkpraXX1zNwG4p0Fw8OzjiGrbabHFv+UyA8a6bviZTodNkW7e
         vO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0OrPaJyrNtxdYQN2eUUc53MSYLY563Wz1I/VuReoN00=;
        b=xvAH77mPbb+tahmrNliinwNa4xbB5Qr9Ou/wTP2F2BZw7YAEHhRHgtLhSJAXKo5hQI
         j8Juv/WQDo2d43gVueEdqNKxxv2A6/zupV6L+y2uE+ogqFuBC3uZL3pdZ3anlC5StoKn
         FGBk6qIbEZVWKop8QKB6ZfV7SGziv/Ym8Oe6ohHwefrPdBtPxCKoy0rzS6y5spM6Zvpl
         EByujARW7Voxfq5/mU7PU1+ogErkyhM4JTcHmh1hl8KRO/e5LO6rNXOwXkm1hfUurOl0
         zLq1iXteHlpde7e07xP8bQWUuv7b30UOYR6CpijkPR79PqUTLUHWhqY++MaaTjQMIRcA
         FrCw==
X-Gm-Message-State: AOAM531OYjhDBjXj73PqioQOQQOpfPFju6+UxodTWu/TAWrBiubSnOVU
        MoF7FyEUvH7JTW5h35LGS90l/w==
X-Google-Smtp-Source: ABdhPJy16RLl1fbmdH/DVh4KgzoGeIdWjm0Exvh4PryssRnqUrTSm9dnSx3oYd3qoOZxW5jIO5aCWQ==
X-Received: by 2002:a63:b24b:0:b0:398:9894:b8be with SMTP id t11-20020a63b24b000000b003989894b8bemr9237480pgo.108.1649288229198;
        Wed, 06 Apr 2022 16:37:09 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id m21-20020a17090a7f9500b001c97c6bcaf4sm6903667pjl.39.2022.04.06.16.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 16:37:08 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, dac2@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] dt-bindings: mmc: Add Pensando Elba SoC binding
Date:   Wed,  6 Apr 2022 16:36:40 -0700
Message-Id: <20220406233648.21644-4-brad@pensando.io>
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

Pensando Elba ARM 64-bit SoC is integrated with this IP and
explicitly controls byte-lane enables resulting in an additional
reg property resource.

Signed-off-by: Brad Larson <brad@pensando.io>
---
Change from V3:
- Change from elba-emmc to elba-sd4hc to match file convention
- Use minItems: 1 and maxItems: 2 to pass schema check

 Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
index 4207fed62dfe..278a71b27488 100644
--- a/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
@@ -19,10 +19,12 @@ properties:
       - enum:
           - microchip,mpfs-sd4hc
           - socionext,uniphier-sd4hc
+          - pensando,elba-sd4hc
       - const: cdns,sd4hc
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   interrupts:
     maxItems: 1
-- 
2.17.1

