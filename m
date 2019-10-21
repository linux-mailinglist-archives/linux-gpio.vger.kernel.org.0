Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84566DE4BE
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 08:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfJUGoa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 02:44:30 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46429 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfJUGoa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 02:44:30 -0400
Received: by mail-pg1-f194.google.com with SMTP id e15so7129898pgu.13
        for <linux-gpio@vger.kernel.org>; Sun, 20 Oct 2019 23:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=P585Wb4GdNSdANLbtZBTejDHy0hzt6pLG6Y0SHAZ9bU=;
        b=o2UCcVa98LWeVYND0PE/v8hZfB6qvv7otuszYHpwOafbshMElcl2fopVc68goHvkSU
         4osSwuadu1/VmaP0pLtxQKWtvAHZjAbwXkJelhOa3PgwYAHDSwuEH9Ggv1L6RW1qguu1
         FWyVBRvOZbpj9GlVvA40GiIUh8M0+AJVzBXrFHzz9zAU1HElW1NHOHZctsx/WFe/jdQI
         3MjIj195CY/+vzsde3JHST48qEYNuagUXETObyQdmtnR6EfpH5aEy8B0HvhyYmbPmVgS
         9Ppwb539dHA3fbb/ONOn8qyo0Asm7y4sNhwbi6Eotg5qRu5+H/iYKdxJ7OsyHlLKFRc1
         V/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=P585Wb4GdNSdANLbtZBTejDHy0hzt6pLG6Y0SHAZ9bU=;
        b=O35J9hGLo7HwnHtoTtz61w+OnElDeCO0aBgkUH0Eee73T8v2fq45l59iIB1k9vMa//
         BIAzx+6zpex5cH6WCM+d3/SdQEuY25JaNyp/gZJaApegP+7ofkHZxSauTZ1n6bIvjYLt
         WOETnvVHVFU5fuZrwUnvI7KzfiWtPF6AFD6dtOzt8ij8uWyLKhelAUn7h667kdAAe+NT
         6tZ5qguDWk04USMJ2cOsDi+jdg7c6QqpOLx40VoG8Zu0F0TcjiICiudlK8ra8DsCG0ev
         cptfEjfd9LwGUU9g2QZZbiGi4XnZT2hwKaEfg3syAz4Svd2NMNVn/wPBrMbgpqpqM1O9
         qySA==
X-Gm-Message-State: APjAAAWYjKlhghjYy3iyoZrcUnCme45McK4OZdomjMjxbwtBz0hU2Vrb
        /eOdez0IjKqExQ7ziNCFKnBN
X-Google-Smtp-Source: APXvYqzT1XpwNz5+vlVRLju+CTTRBtcnDqb2C9zsWzuD9d6oV4fIlpTWzzYHcDfIgijryYQagwybBA==
X-Received: by 2002:a63:a02:: with SMTP id 2mr106677pgk.389.1571640269210;
        Sun, 20 Oct 2019 23:44:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:700f:8db6:2442:890f:ac37:8127])
        by smtp.gmail.com with ESMTPSA id d4sm13156624pjs.9.2019.10.20.23.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 23:44:28 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: gpio: Add devicetree binding for RDA Micro GPIO controller
Date:   Mon, 21 Oct 2019 12:14:10 +0530
Message-Id: <20191021064413.19840-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org>
References: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add YAML devicetree binding for RDA Micro GPIO controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/gpio/gpio-rda.yaml    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rda.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
new file mode 100644
index 000000000000..6ece555f074f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-rda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RDA Micro GPIO controller
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+properties:
+  compatible:
+    const: rda,8810pl-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  ngpios:
+    description:
+      Number of available gpios in a bank.
+    minimum: 1
+    maximum: 32
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - ngpios
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+...
-- 
2.17.1

