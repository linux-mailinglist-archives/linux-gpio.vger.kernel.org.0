Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6C3438D1B
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 03:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbhJYBy3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 21:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbhJYBy2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 21:54:28 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400F1C061243
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 18:52:07 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m14so9217195pfc.9
        for <linux-gpio@vger.kernel.org>; Sun, 24 Oct 2021 18:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pensando.io; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Vjq+rSa9gbSDsQCsXle0HZRWSDqJFj/hBiJuzHGvBzo=;
        b=OEHfdiHdk2OljfY2CdEIVoggETFgCdzxMHtDS9xfSWAU1+9dUIe14eEYhny9qZAJoi
         OSqszYZU4ARmf+DNpssXhfxLhAsHaTTEa6xSkSmlR7sZwBudiWpTHnGJ5/CiQVHjCWnj
         b8G+Zvao3Xh5q6LNkZEi0WvLL7EWLjcFrAWaGjZ1k7sxZJGuQOo8kf0rO89SqfwX9HaI
         UKsc7OCiBt/D3Q1O2YKg7lIKaSwNtZizX4QSvmSHhdRPFi3tnEK9CMfyNyYpV23/xx8S
         jBjRKfyy/zMhjiVj3aG7CyjumAePbrRl4M6s84VeHS6HhxSso564RZEVH1TnQLZ0uc8q
         9IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Vjq+rSa9gbSDsQCsXle0HZRWSDqJFj/hBiJuzHGvBzo=;
        b=J7hegVwkdh7qswD4FerfPOyevO2PuPhejoajruvyKrrNzTp67Md8+RG1p7rphrehu9
         +94H7hsERVcMgDtFgv126B8W4b9c1Mxh7JC7ATzjWNxYQY1ZLLnsZ4GTQQjheCwN4IcU
         SCxaF/FCZwfwB74Bre9VRuZvfvJhWHaA6rPbSPv7cegepT1XBzfQQz4L/zqchwnCtLi6
         HzhLD/1SgsgctmYyqU4rCJvUnQV0v6KJdGmjq26VGZh0nEaNuFTfq5aWCyC230fXDeoz
         O39fUsX/SP6HKL/KmNEW+M0w3iNWHVQxqLPU/O/su2Cbq8f/sE4uqzItxqSq7k+HW7aw
         CO6Q==
X-Gm-Message-State: AOAM532kWSjRncgLq6aBuaIs3gJOzJl3/i6zybyg9rH1X/9G8fcUvEhA
        asY71Gmmf9dwxoKA0Vg1L8fyOg==
X-Google-Smtp-Source: ABdhPJw0NzV7rhCeq7vVD4JEjJLbRrhQlrjn9qVJVDLQcHWYA8K38AvzalYp2Q/bui5cwLRTPhS+rw==
X-Received: by 2002:a63:9d0d:: with SMTP id i13mr11241627pgd.117.1635126726811;
        Sun, 24 Oct 2021 18:52:06 -0700 (PDT)
Received: from platform-dev1.pensando.io ([12.226.153.42])
        by smtp.gmail.com with ESMTPSA id q10sm14855225pgn.31.2021.10.24.18.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 18:52:06 -0700 (PDT)
From:   Brad Larson <brad@pensando.io>
To:     linux-arm-kernel@lists.infradead.org
Cc:     arnd@arndb.de, linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        broonie@kernel.org, fancer.lancer@gmail.com,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, olof@lixom.net,
        brad@pensando.io, linux-gpio@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/11] dt-bindings: arm: pensando: add Pensando boards
Date:   Sun, 24 Oct 2021 18:51:46 -0700
Message-Id: <20211025015156.33133-2-brad@pensando.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025015156.33133-1-brad@pensando.io>
References: <20211025015156.33133-1-brad@pensando.io>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document the compatible for Pensando Elba SoC boards.

Signed-off-by: Brad Larson <brad@pensando.io>
---
 .../bindings/arm/pensando,elba.yaml           | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/pensando,elba.yaml

diff --git a/Documentation/devicetree/bindings/arm/pensando,elba.yaml b/Documentation/devicetree/bindings/arm/pensando,elba.yaml
new file mode 100644
index 000000000000..84bd9e7e98e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/pensando,elba.yaml
@@ -0,0 +1,20 @@
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
+    const: pensando,elba
+
+additionalProperties: true
+
+...
-- 
2.17.1

