Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EEE3B8B2A
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jul 2021 02:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbhGAAYz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 20:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238112AbhGAAYy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jun 2021 20:24:54 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE37C0617AD
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jun 2021 17:22:24 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id j24so4264753pfi.12
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jun 2021 17:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HSdm070R4SM/eRkEfUHVyZ+M0Thpoj9fAA1Eqy/QCP4=;
        b=iDwJzjkg/Cb6xXcKJDcqkbedHRnU0N//h3MMRTg1+KnfRnJ9qoHHXuILtF5nlFNPto
         iGbKzvpVlyvCYQIRO74L9lyd8SjvhqGEx/t74r5T+zwGx1ahklXn/88A2YoeJpqyyQF3
         S++9jMJ/COOuShtlkkwQ3eJWPXVj8O4lYr53RtUIMFUBgPNHJnxHtQ3piI/m5Y6pp0Hj
         MrXHcnFcFRQbIUeX9jP8zLrY3jx3xXSVvqn8Jwudz/vVTOWDJ3ss3woHtWwfUDpyEi9v
         h0/SlzMlAMIfHY0xOxhvwFfFknUwaRARZ4jZQL2bFiHWmpyNvPw5YdkOuoivOpgvC/oA
         8tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HSdm070R4SM/eRkEfUHVyZ+M0Thpoj9fAA1Eqy/QCP4=;
        b=Fh0yDjoVOS1LIuTC761EDLb375/OA7ikS+bhgCzaChl5gl0IUJCs66f2xWInME9BNW
         zI1Un2CkJGJN8hdsz0OYo2YS2DcsEgu1GUIRfXfUAw2k0o7//wUYq5hKPe4bnzF6qVZI
         uj19H37P2Uvju57yOZ2V6gIcGLgcjKHHIAdE7WFeeyqwqZ5X2/hzEAOVJyRhhXLMHWqB
         PHmJm+AMnBuyUSHrxv8TofEal4CoVtNzvffeW4WKslhS1OtYeJQq7jRU3AShpdoXUHm1
         pmg21rw0TSZpWF1xY0X0oOJJ/6YxKeKgKvVwxOrHvg7XvqYVrrNcZZ58jqyfwqAMNIbs
         6Azg==
X-Gm-Message-State: AOAM531YA5Y6S0bQPqC07kiSCkq6R0qbUrabPc2vtB515p2GQWGEFvmU
        JfyIABpw7FFnTrjp7Gjc6pSQJA==
X-Google-Smtp-Source: ABdhPJwSc0jIQ5LQ/MzvbgRgWdx1LngPkR32e6yXQdiDE/tHcpJn4TAdr2Bfkm/OdpsyZEgOtzaDJg==
X-Received: by 2002:a62:380c:0:b029:2f7:4057:c3ed with SMTP id f12-20020a62380c0000b02902f74057c3edmr38802381pfa.21.1625098943069;
        Wed, 30 Jun 2021 17:22:23 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c0:4701:ae70:8687:fcbc:6b3d:c844])
        by smtp.gmail.com with ESMTPSA id v6sm25117495pgk.33.2021.06.30.17.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 17:22:22 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Drew Fustini <drew@beagleboard.org>,
        Huan Feng <huan.feng@starfivetech.com>
Subject: [RFC PATH 1/2] dt-bindings: gpio: add starfive,jh7100-gpio bindings
Date:   Wed, 30 Jun 2021 17:20:38 -0700
Message-Id: <20210701002037.912625-2-drew@beagleboard.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210701002037.912625-1-drew@beagleboard.org>
References: <20210701002037.912625-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings for the GPIO controller in the StarFive JH7100 SoC [1].

[1] https://github.com/starfive-tech/beaglev_doc

Signed-off-by: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
---
 .../bindings/gpio/starfive,jh7100-gpio.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
new file mode 100644
index 000000000000..8c9d14d9ac3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/starfive,jh7100-gpio.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/starfive,jh7100-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7100 GPIO controller
+
+maintainers:
+  - Huan Feng <huan.feng@starfivetech.com>
+  - Drew Fustini <drew@beagleboard.org>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jh7100-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
+    minItems: 1
+    maxItems: 32
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - "#interrupt-cells"
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+examples:
+  - |
+      gpio@11910000 {
+        compatible = "starfive,jh7100-gpio";
+        reg = <0x11910000 0x10000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <32>;
+      };
+
+...
-- 
2.27.0

