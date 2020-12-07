Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31AED2D195E
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 20:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgLGTVv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 14:21:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgLGTVu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 14:21:50 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F697C061794;
        Mon,  7 Dec 2020 11:21:10 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id v14so263101wml.1;
        Mon, 07 Dec 2020 11:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zylEI6CcMfx3340XcVxqekMWc+x0EUU5Bcvj/U4ci3w=;
        b=su6qmX3rrtyjcmsNYMj+5csq2QZt7MIyCA6zPCI+CKsReebbaIGPeqoE9rAIeJyOZ2
         ETnRfgAZaLDKU35DSaJt5Rn9/5hdamHriSJ57x2rNcywDuTaKN/kYGuAHNyOalwBHmrj
         V95qbMZUY8he9OA49WZP2bgS+hWAKmBRdpOyuc9Tu6igRqW0YPMGhoN5YwlgTzre1mZk
         xU+zqCSi1b9+SftkMyUCl7AcrFni0C9Gq2jCnG3Y0kN+9SYI6GXyHYV6CrE4UGT8wqnM
         kyAJYJognS9wa7RSkfBnqORy+zwS6PchpoGLuZZuoz8sTkdZtIoBuJIe2WkjdvF7zTw2
         vUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zylEI6CcMfx3340XcVxqekMWc+x0EUU5Bcvj/U4ci3w=;
        b=PllnkJaxNOXA63YpsEoZ2HaXi1johS2mPJGvpTy8F0cFV703RDwsTDAjtC2kfcDD+3
         SC7qY51Siwq8TIl8XHG6lemK/NlE9VFxR4nmjJmMT+yL2f8LsmBHW3JlcOabM8EmHgjM
         YyyurSCblSBrdeRwAQ1PllWAVtPKdVQulx0dgwhONtIB6Skh6yd6IbUdhKOvH+X6zJIG
         gPGzsFHlJEpdiNKdlSSIjtzsRGpaliVp32YxJh0Cl7r3d7yS51I83hDYwLvTwQlKAzve
         VfJr791XsJQuGNlaVNL3AlT6/eXxZaWUu4KoMpLEUk9f4Z+j6B3ydE238pnxBkWNJdeh
         0nFQ==
X-Gm-Message-State: AOAM531Ktrq4rOOVIAvmm5n/XIrZxLvoRIRDgNZhV0W9CNptmmOT9mQt
        eWOpggdFagQrE6jfYpmo2do=
X-Google-Smtp-Source: ABdhPJyt0/Qconi9t/A+JJhuYY5aNpD+2nmst15ubn8hBqgWpjWaOuDHYE0U1Yy3ke0BFC1bTUJtdg==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr329188wmi.45.1607368869097;
        Mon, 07 Dec 2020 11:21:09 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id 20sm276978wmk.16.2020.12.07.11.21.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 11:21:08 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        yanaijie@huawei.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org
Subject: [PATCH 1/3] dt-bindings: pinctrl: rt2880: add binding document
Date:   Mon,  7 Dec 2020 20:21:02 +0100
Message-Id: <20201207192104.6046-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201207192104.6046-1-sergio.paracuellos@gmail.com>
References: <20201207192104.6046-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit adds rt2880 compatible node in binding document.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../pinctrl/ralink,rt2880-pinmux.yaml         | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
new file mode 100644
index 000000000000..d946219a115c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ralink,rt2880-pinmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink rt2880 pinmux controller
+
+maintainers:
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description:
+  The rt2880 pinmux can only set the muxing of pin groups. muxing indiviual pins
+  is not supported. There is no pinconf support.
+
+properties:
+  compatible:
+    enum:
+      - ralink,rt2880-pinmux
+
+  pinctrl-0:
+    description:
+      A phandle to the node containing the subnodes containing default
+      configurations.
+
+  pinctrl-names:
+    description:
+      A pinctrl state named "default" must be defined.
+    const: default
+
+required:
+  - compatible
+  - pinctrl-names
+  - pinctrl-0
+
+patternProperties:
+  '^.*$':
+    if:
+      type: object
+      description: |
+        A pinctrl node should contain at least one subnodes representing the
+        pinctrl groups available on the machine.
+      $ref: "pinmux-node.yaml"
+      required:
+        - groups
+        - function
+      additionalProperties: false
+    then:
+      properties:
+        groups:
+          description:
+            Name of the pin group to use for the functions.
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
+                 pcie, sdhci]
+        function:
+          description:
+            The mux function to select
+          $ref: "/schemas/types.yaml#/definitions/string"
+          enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
+                 mdio, nand1, nand2, sdhci]
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    pinctrl {
+      compatible = "ralink,rt2880-pinmux";
+      pinctrl-names = "default";
+      pinctrl-0 = <&state_default>;
+
+      state_default: pinctrl0 {
+      };
+
+      i2c_pins: i2c0 {
+        i2c0 {
+          groups = "i2c";
+          function = "i2c";
+        };
+      };
+    };
-- 
2.25.1

