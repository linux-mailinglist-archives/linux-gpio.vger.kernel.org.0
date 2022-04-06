Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415C44F6E9B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Apr 2022 01:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237858AbiDFXjE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Apr 2022 19:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237841AbiDFXjC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 19:39:02 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552781FCD24
        for <linux-gpio@vger.kernel.org>; Wed,  6 Apr 2022 16:37:03 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id k14so3535928pga.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 Apr 2022 16:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=t9+gL+y5i/QNCIpTjrcXEFiRInISCquyFyxbsO8XL7I=;
        b=lQrv/P4hn6LlciweT4SqZd0iOxn/16y7L9KiKpSME26a0sh0Lx3lmpQx8Bux/PeMie
         6oESrbi1ZDk+AeB4gmp9ssD+tBtvnO/2e6lbfSO6V3ASIzy5nDRSQk9jvhj2SIRwyzOk
         4oCixuJcyRhb8Yi+pvL9vzv6O6fWGV3JixIG9gnQBbV48WcrzdWiyuRfUPDF5oVq4vaB
         OCzAzCbGVDlvE+xdjAgkkAZBUyFO3TpVStor6GDEcMP/4mNfEaILG/BR6y0kl5l9lQXK
         hA8tLndD13GXUQQcW1sY9MazzEHiVaJ6Hx+fO6hn8cr5F5kTGVjIgZo18icnwnNq7Rus
         VnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=t9+gL+y5i/QNCIpTjrcXEFiRInISCquyFyxbsO8XL7I=;
        b=NUiRld6QZhglUo79jHT0Mw8ktsVSrBG0MDPS3s1p6+Ws8uQKAljt8DWEU9Vxxw8a4g
         nBaotMzMvy/yh0xby6czx/ALPU1brQC89z6HlZiO5/QsCr5yM9t/5JKNQYkzej6nTD8P
         Qr2+ZDo4cW5iRV1L1SKhgIIprdej3huShJlT28BUO1teNaNqpR0AYVhf7x66Y5XjDdEY
         ol0rPRAwaMECP1uqr0bumo4Xfvc+i0ztGja9N1LqHZui/tF+C4PVwK/R7vyQ5yplJY02
         W1Q2swc5BohSdfgllc4koUWqhlYh95qjr9tXq/OqeHs38+xnKhnN47xluHHqUSVLzro3
         8T2Q==
X-Gm-Message-State: AOAM531hbmJGdOUktCCeE71w0CnT1e4JPW/ZFd8QEenWS0tvdM4ptLW6
        COpD5D+M6VoQM6zc8pcl/MRyJA==
X-Google-Smtp-Source: ABdhPJyoPs4NfFhETcRlRVHyTU1R8ztOjFcl2xaEAaNRVRkgtvbj80h35dMSkXq9sZjkkjDMfvNPiw==
X-Received: by 2002:a05:6a00:815:b0:4fb:e46:511c with SMTP id m21-20020a056a00081500b004fb0e46511cmr11195728pfk.54.1649288222881;
        Wed, 06 Apr 2022 16:37:02 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id m21-20020a17090a7f9500b001c97c6bcaf4sm6903667pjl.39.2022.04.06.16.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 16:37:02 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, dac2@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] dt-bindings: arm: add Pensando boards
Date:   Wed,  6 Apr 2022 16:36:38 -0700
Message-Id: <20220406233648.21644-2-brad@pensando.io>
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

Document the compatible for Pensando Elba SoC boards.

Signed-off-by: Brad Larson <brad@pensando.io>
---
Change from V3:
- Add description and board compatible

 .../bindings/arm/pensando,elba.yaml           | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/pensando,elba.yaml

diff --git a/Documentation/devicetree/bindings/arm/pensando,elba.yaml b/Documentation/devicetree/bindings/arm/pensando,elba.yaml
new file mode 100644
index 000000000000..61225f2d6ce5
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/pensando,elba.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/pensando,elba.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Pensando Elba SoC Platforms Device Tree Bindings
+
+maintainers:
+  - Brad Larson  <brad@pensando.io>
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+
+      - description: Boards with Elba SoC
+        items:
+          - enum:
+              - pensando,elba-ortano
+          - const: pensando,elba
+
+additionalProperties: true
+
+...
-- 
2.17.1

