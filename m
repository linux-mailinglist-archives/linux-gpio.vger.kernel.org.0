Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B007D55DF
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Oct 2019 13:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729031AbfJMLk4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 13 Oct 2019 07:40:56 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43154 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728956AbfJMLkz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Oct 2019 07:40:55 -0400
Received: by mail-pg1-f196.google.com with SMTP id i32so8417156pgl.10
        for <linux-gpio@vger.kernel.org>; Sun, 13 Oct 2019 04:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=P585Wb4GdNSdANLbtZBTejDHy0hzt6pLG6Y0SHAZ9bU=;
        b=Sq/HNP5QsB5o9F9tBTKX7L0Z4FVLC9h6ADI4RXKZarXPk/p/8UNkZ86I+L11wvyGVV
         WW8lS+FpIJyO77xwLrV2x1AfGD6yZENx63WR/afl2Tyt4GVgcX6zmS/G67iyJNlikhf4
         s+R/CfgSkBDkP+rEZhiDL3NLFfwyKzzfmUMd6ekeh0dVZER5Ro6A9nJ/dVS9craL7b1M
         WDfkcbovDfQ+6LC95Cl4ViIvZxDEAHrsGpeZsmnj4t4etr4FLdjkcFuzOnaFw/LzkjzP
         U8wiHmqErCnk7duw39vPp9nejXK5KcCFcbZQIVf01CsY/HkWyagT7sBFbM0wjaosBS4y
         jJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=P585Wb4GdNSdANLbtZBTejDHy0hzt6pLG6Y0SHAZ9bU=;
        b=cJLc8LYytXjxDt4x3hWFZ2ZdiqdgBX9LxWfUydipD0OYyfZ2m1Viswpzdq0AOXcq+5
         g1o3L1wDkQaGObDxnMM0VK/At3g/d6S1GyWzERE8TI1ChUscjwzTK/wxExJS86T+c0XU
         ayZ913jVAH9wqAZw6q9WpT/o1U+aMOb+QiuXFg9c4H40aK+ZavPB0p5yYev2RHBHQXbC
         ycKXW3Kki06tl5MveW6QxdEeCkEG079dZLXBFI2oBJ+3mKALqAKuGUX25SvCyPlcqSzN
         VIISDwFnkXELnWfa1E3H3IRdMqv+15H2Yxv4rWXti8Vxsq3DlB5b3KGPx8c1HY9eVKCn
         xrJw==
X-Gm-Message-State: APjAAAXwUpG/EHS/JZBcxbI2TsMS3smlckEMjXIt4OVGD6R3K3OzgGT0
        tGSvC3C31wxzEoy0J1swriBTpIdoLg==
X-Google-Smtp-Source: APXvYqyMXRTeohc8dPr4H7XQBAdVm22v+b+6KvEJVppA+/URrgFtQ3sqxCvRnoWI0vBfzbygNAih/w==
X-Received: by 2002:a65:6408:: with SMTP id a8mr27308726pgv.357.1570966853733;
        Sun, 13 Oct 2019 04:40:53 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:8e:4f53:b957:652b:7622:f311])
        by smtp.gmail.com with ESMTPSA id g12sm23165736pfb.97.2019.10.13.04.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 04:40:53 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, orsonzhai@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/4] dt-bindings: gpio: Add devicetree binding for RDA Micro GPIO controller
Date:   Sun, 13 Oct 2019 17:10:34 +0530
Message-Id: <20191013114037.9845-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191013114037.9845-1-manivannan.sadhasivam@linaro.org>
References: <20191013114037.9845-1-manivannan.sadhasivam@linaro.org>
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

