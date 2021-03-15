Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A4333B164
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 12:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbhCOLmx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 07:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbhCOLmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 07:42:22 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADE1C061574;
        Mon, 15 Mar 2021 04:42:21 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l11so8515769wrp.7;
        Mon, 15 Mar 2021 04:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4PtUTvTTy5IEt95MI00SzqUb3UhyjiIbEmYvWqon9w8=;
        b=eYQLy4WdtEaHJeLrGOJ2o/0tzYrOHoyMJiY8ydMQGHpHEDpXFhW/r4JgZ5PpMh6cTC
         UZszagxWfwpGsFbXFL+O8X0lX7wlHw0NyVB//tScOBl/jibmEcgNhTudrdfL2vPAAXB7
         vwk8MXOTn8wLGIAOGoQMEDnxLf3lJ21mBEuY8WA+sbHOBzkXcZVA5RnjAjn7rfLXmdyr
         mwIxB5SBjVFFjcpUZ3212WLkG0/VYjSb1kN03tgtfhCLu/xiKVTvOOW5GHuL13+d1DyV
         U65qsWxW7rkiCDDvp4GsiDXU9sn4kRnWMad5wUEGmeOyaLPJWQLFuuC7xD6QpZkvd17a
         W36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4PtUTvTTy5IEt95MI00SzqUb3UhyjiIbEmYvWqon9w8=;
        b=abv3i3XMXR+2zwnKy0OQkEMrUdFnrz2etn0UqcDMAQ/V9cggGpMbll8HF5IELSy7n5
         gQRr68+tGS9CrUhQQuQbECY3a1WmGiD5fDnLhhxZoHSNAdMihtGN9A8MfokBoevoQd9o
         6WZj/fu++Dg263IaOo4hT7U75OlUCR3UE1JkmhWywCiLdBvEbXXwc2fwaSrhfZv7RxPW
         lBIo46bcEXvDZzZ+LYnu8fZ+6hTGFf9+fcYE4lBjBvay3PNpnjArHlzshqmNbeygfgE5
         gC7akeIEwHOwrCBPAbpRXJ6XT8ZTnkB94IG98lxOWFT4mwVJybNk93YlevUEok+o2CFE
         ZoUw==
X-Gm-Message-State: AOAM533FhUWvM0vvgemc+UjGlL2uxSjKaYQmchR4XtjXueeR81fwBYBm
        qn4/y/BOcLMMRB/toaiXVm5PlPbWGQFngw==
X-Google-Smtp-Source: ABdhPJy8OY5lwvsOtHRb4uSqOHmXY0J08aSlHfgeWzwTnqif0H2YKQTQF2aYo/NWtCkcuf0Uw9FgTw==
X-Received: by 2002:adf:c389:: with SMTP id p9mr26852284wrf.410.1615808539892;
        Mon, 15 Mar 2021 04:42:19 -0700 (PDT)
Received: from skynet.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id v189sm12648187wme.39.2021.03.15.04.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:42:19 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 03/22] dt-bindings: add BCM63XX GPIO binding documentation
Date:   Mon, 15 Mar 2021 12:41:55 +0100
Message-Id: <20210315114214.3096-4-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210315114214.3096-1-noltari@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding documentation for the GPIO controller found in BCM6318, BCM6328,
BCM6358, BCM6362, BCM6368 and BCM63268 SoCs.

Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v7: new patch, splitted from pinctrl documentation

 .../bindings/gpio/brcm,bcm63xx-gpio.yaml      | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
new file mode 100644
index 000000000000..94a4f00ae2c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/brcm,bcm63xx-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM63xx GPIO controller
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+  - Jonas Gorski <jonas.gorski@gmail.com>
+
+description: |+
+  The GPIO controller node should be the child of a syscon node.
+
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm6318-gpio
+      - brcm,bcm6328-gpio
+      - brcm,bcm6358-gpio
+      - brcm,bcm6362-gpio
+      - brcm,bcm6368-gpio
+      - brcm,bcm63268-gpio
+
+  data:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Offset in the register map for the data register (in bytes).
+
+  dirout:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Offset in the register map for the dirout register (in bytes).
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - gpio-controller
+  - gpio-ranges
+  - '#gpio-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@0 {
+      compatible = "brcm,bcm6328-gpio";
+      reg = <0x0 0x10>;
+
+      data = <0xc>;
+      dirout = <0x4>;
+
+      gpio-controller;
+      gpio-ranges = <&pinctrl 0 0 32>;
+      #gpio-cells = <2>;
+    };
+
+  - |
+    gpio@0 {
+      compatible = "brcm,bcm63268-gpio";
+      reg = <0x0 0x10>;
+
+      data = <0xc>;
+      dirout = <0x4>;
+
+      gpio-controller;
+      gpio-ranges = <&pinctrl 0 0 52>;
+      #gpio-cells = <2>;
+    };
-- 
2.20.1

