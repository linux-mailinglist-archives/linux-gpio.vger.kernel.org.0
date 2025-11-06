Return-Path: <linux-gpio+bounces-28232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFA7C3DEB7
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 00:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A243AFA76
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 23:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1A6357714;
	Thu,  6 Nov 2025 23:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHBjzhwt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFA42DA760
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 23:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762473453; cv=none; b=nizrE09fQ3EZUGGW1BV0EkqO9A5MmAwpY++Zgh97Mj7Z81hozU8KcpdztnU5OAxpLePLk9xg5BdBQe2QpRvgO+1z4mZophEFDTG4ko9deGc0pEOEPYvmfUptb9U16m2OcLHr8HzeaqNZjIlsanLdWHNvLIiXbQxZYMIdcm9TH1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762473453; c=relaxed/simple;
	bh=S0wUMOAVOxbzBTWfXRofYnuNI6umpvht4cRnF6EsP/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oW7WEOOnQVN7EMFZrYc70LiIXoGPGazchzE5BD8A11IjwPfluMz/YoeKcIWVbukfnaDMLdgB1/ZJYJO1Dh9sM1pAINa9SQCLGHLOlHPH2M+aNFUTFWUJd+Q34evl2fV2hJaXllm7poN75rsrENuTQmzITe7JaO6KRs3XBgyfXAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHBjzhwt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so803355e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 15:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762473446; x=1763078246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pilEeHQO+FyIhwT8vsqE7kBUhsB1RCnW8CxJp4flC8=;
        b=FHBjzhwtMfFcZxVp58juRQnFoTeqata+enXBQSDYphQYjUaSC207QI3gctjnH734Ye
         zXp19E8bIDx+ewSubIjjY5euQ6X7I9wRnR2UxdqlxsxoHchQHINTJxdWufbegmqEWkVL
         SJW57I324Rsh/dYov6GiQpSu/8Zvsg50ykmMxOwh7tQhzmDcnI/h6z+RcuAuFFDanQBV
         In7fbQRKK1zmK1B/1Cq3DNzVEQKwp+lUffmljLJzxYu8RFUjXJml0YK9D7zIsRxqRd9T
         TcqeKpS9xUwL8VdEfhXwM841aP1LkRvKBG6ZygoNHf+x3JBpvcf8dOFgWL+u1LT/EuAy
         H/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762473446; x=1763078246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5pilEeHQO+FyIhwT8vsqE7kBUhsB1RCnW8CxJp4flC8=;
        b=SaTcj9eTZRs8cSRZvrsW2t+1K3aDp53CSGpwMxcKvxniVENZsA30ac2HzWDPPdzrXh
         XVH/NfnHfjmCqxf6nMHZ15bJQ+RuuHA//7oCJlQAZLFZglsIDMOJTD3u1nXS9/GNDjFv
         UZgGRp+4nlLhYVIpTg8VIytKn1vroVtcMSPqyKZq3S274xTcn1Xzr+1Tj3R/ZpRlVC3r
         j2HzX9/OlS+yutVknqPAtS1JVY+z9/OUAHUtEEG3bzBso9+eNm+TKqFwHAPADgmP1BRT
         OzR2dKJJyYIkaeqxbhPzJ8FJ4Z6QjBJXofa9MFOBU3z6+rOE0XAQIr1X4218P+ZC+Z3k
         ykFA==
X-Forwarded-Encrypted: i=1; AJvYcCWe/kjli1UjehhEIl2+Um94oxL13+G5OlTOvP+omFiheA71roZxp1pg9gfogYi6x+P7eepofbwKQOyH@vger.kernel.org
X-Gm-Message-State: AOJu0YznFScEyT9J56HmuGaB5zVb9TfdNisxOTbgRHC6kMYBFSGC4XSm
	6hWsL/o04m4DzVaTDyk2VLUdAxrH2PC5BswUyGECVzbRO26kgb1Y/rj1
X-Gm-Gg: ASbGncsINYb4a3Y7iiAsGIG9WiUf3ZBWGmqgB1/hNaQS+CVpufbfvkGpJzJOAZAregl
	1c556tVuMEXp0PCOVcZRMR9kVHJrN/5H5RoRoK6mNc4486cbEZ5VmuknLqP5EmY0fzkA+nVwSYN
	fK7Zgxn2RyJwVkAd265An2Q9Yppb89fbSbmbRBKdji2afm97m379VjtASgcUQTzOTWTLlsuHNtT
	Ru26ST6rJps17uTlS1ANj1IHQ/rL031wNsPWcB67+88yx5gKu2w/HeSL8wJCIGBmzaKtj5tWWi/
	UZ+waS4wpm+2EpqrX6NunPyW5r1tZGpvPFUhjVaykdnS7avQ7UbKVAJYhvejXD5cMFLVyHuQCM4
	L1N0kNrOccpSSYvME21YMQpO0KqOkGqznByyPcZ4iO2sJh4b0sDl8NZXF80vdbWu+KKamG4IOf/
	toOaqHNrfdCkoa84rLZp+6VU0aPZvqhU064lrVhgb2
X-Google-Smtp-Source: AGHT+IFiGFqB4J9gek1K6j17BwTcn02sy4NVhdapLkhnQqeGimPYGisCjq2JiJN69nmdcO4xR909oA==
X-Received: by 2002:a05:600c:a4b:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-4776bcde4d5mr8079985e9.29.1762473445998;
        Thu, 06 Nov 2025 15:57:25 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm129470525e9.0.2025.11.06.15.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:57:24 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller
Date: Fri,  7 Nov 2025 00:57:07 +0100
Message-ID: <20251106235713.1794668-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106235713.1794668-1-ansuelsmth@gmail.com>
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
minor difference on some function group (PCM and LED gpio).

To not bloat the EN7581 schema with massive if condition, use a
dedicated YAML schema for Airoha AN7583.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../pinctrl/airoha,an7583-pinctrl.yaml        | 402 ++++++++++++++++++
 1 file changed, 402 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
new file mode 100644
index 000000000000..79910214d9b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -0,0 +1,402 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/airoha,an7583-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7583 Pin Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  The Airoha's AN7583 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: airoha,an7583-pinctrl
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - compatible
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+patternProperties:
+  '-pins$':
+    type: object
+
+    patternProperties:
+      '^mux(-|$)':
+        type: object
+
+        description:
+          pinmux configuration nodes.
+
+        $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        properties:
+          function:
+            description:
+              A string containing the name of the function to mux to the group.
+            enum: [pon, tod_1pps, sipo, mdio, uart, i2c, jtag, pcm, spi,
+                   pcm_spi, i2s, emmc, pnand, pcie_reset, pwm, phy1_led0,
+                   phy2_led0, phy3_led0, phy4_led0, phy1_led1, phy2_led1,
+                   phy3_led1, phy4_led1]
+
+          groups:
+            description:
+              An array of strings. Each string contains the name of a group.
+
+        required:
+          - function
+          - groups
+
+        allOf:
+          - if:
+              properties:
+                function:
+                  const: pon
+            then:
+              properties:
+                groups:
+                  enum: [pon]
+          - if:
+              properties:
+                function:
+                  const: tod_1pps
+            then:
+              properties:
+                groups:
+                  enum: [pon_tod_1pps, gsw_tod_1pps]
+          - if:
+              properties:
+                function:
+                  const: sipo
+            then:
+              properties:
+                groups:
+                  enum: [sipo, sipo_rclk]
+          - if:
+              properties:
+                function:
+                  const: mdio
+            then:
+              properties:
+                groups:
+                  enum: [mdio]
+          - if:
+              properties:
+                function:
+                  const: uart
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [uart2, uart2_cts_rts, hsuart, hsuart_cts_rts,
+                           uart4, uart5]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2c1]
+          - if:
+              properties:
+                function:
+                  const: jtag
+            then:
+              properties:
+                groups:
+                  enum: [jtag_udi, jtag_dfd]
+          - if:
+              properties:
+                function:
+                  const: pcm
+            then:
+              properties:
+                groups:
+                  enum: [pcm1, pcm2]
+          - if:
+              properties:
+                function:
+                  const: spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [spi_quad, spi_cs1]
+                  maxItems: 2
+          - if:
+              properties:
+                function:
+                  const: pcm_spi
+            then:
+              properties:
+                groups:
+                  items:
+                    enum: [pcm_spi, pcm_spi_int, pcm_spi_rst, pcm_spi_cs1,
+                           pcm_spi_cs2, pcm_spi_cs3, pcm_spi_cs4]
+                  maxItems: 7
+          - if:
+              properties:
+                function:
+                  const: i2c
+            then:
+              properties:
+                groups:
+                  enum: [i2s]
+          - if:
+              properties:
+                function:
+                  const: emmc
+            then:
+              properties:
+                groups:
+                  enum: [emmc]
+          - if:
+              properties:
+                function:
+                  const: pnand
+            then:
+              properties:
+                groups:
+                  enum: [pnand]
+          - if:
+              properties:
+                function:
+                  const: pcie_reset
+            then:
+              properties:
+                groups:
+                  enum: [pcie_reset0, pcie_reset1]
+          - if:
+              properties:
+                function:
+                  const: pwm
+            then:
+              properties:
+                groups:
+                  enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                         gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                         gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                         gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                         gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
+                         gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                         gpio42, gpio43, gpio44, gpio45, gpio46, gpio47]
+          - if:
+              properties:
+                function:
+                  const: phy1_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio1, gpio2, gpio3, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy2_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio1, gpio2, gpio3, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy3_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio1, gpio2, gpio3, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy4_led0
+            then:
+              properties:
+                groups:
+                  enum: [gpio1, gpio2, gpio3, gpio4]
+          - if:
+              properties:
+                function:
+                  const: phy1_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy2_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy3_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+          - if:
+              properties:
+                function:
+                  const: phy4_led1
+            then:
+              properties:
+                groups:
+                  enum: [gpio8, gpio9, gpio10, gpio11]
+
+        additionalProperties: false
+
+      '^conf(-|$)':
+        type: object
+
+        description:
+          pinconf configuration nodes.
+
+        $ref: /schemas/pinctrl/pincfg-node.yaml
+
+        properties:
+          pins:
+            description:
+              An array of strings. Each string contains the name of a pin.
+            items:
+              enum: [uart1_txd, uart1_rxd, i2c_scl, i2c_sda, spi_cs0, spi_clk,
+                     spi_mosi, spi_miso, gpio0, gpio1, gpio2, gpio3, gpio4,
+                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11, gpio12,
+                     gpio13, gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
+                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
+                     gpio27, gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
+                     gpio34, gpio35, gpio36, gpio37, gpio38, gpio39, gpio40,
+                     gpio41, gpio42, gpio43, gpio44, gpio45, gpio46,
+                     pcie_reset0, pcie_reset1, pcie_reset2]
+            minItems: 1
+            maxItems: 58
+
+          bias-disable: true
+
+          bias-pull-up: true
+
+          bias-pull-down: true
+
+          input-enable: true
+
+          output-enable: true
+
+          output-low: true
+
+          output-high: true
+
+          drive-open-drain: true
+
+          drive-strength:
+            description:
+              Selects the drive strength for MIO pins, in mA.
+            enum: [2, 4, 6, 8]
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl {
+      compatible = "airoha,an7583-pinctrl";
+
+      interrupt-parent = <&gic>;
+      interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+      gpio-controller;
+      #gpio-cells = <2>;
+
+      interrupt-controller;
+      #interrupt-cells = <2>;
+
+      pcie1-rst-pins {
+        conf {
+          pins = "pcie_reset1";
+          drive-open-drain = <1>;
+        };
+      };
+
+      pwm-pins {
+        mux {
+          function = "pwm";
+          groups = "gpio18";
+        };
+      };
+
+      spi-pins {
+        mux {
+          function = "spi";
+          groups = "spi_quad", "spi_cs1";
+        };
+      };
+
+      uart2-pins {
+        mux {
+          function = "uart";
+          groups = "uart2", "uart2_cts_rts";
+        };
+      };
+
+      uar5-pins {
+        mux {
+          function = "uart";
+          groups = "uart5";
+        };
+      };
+
+      mmc-pins {
+        mux {
+          function = "emmc";
+          groups = "emmc";
+        };
+      };
+
+      mdio-pins {
+        mux {
+          function = "mdio";
+          groups = "mdio";
+        };
+
+        conf {
+          pins = "gpio2";
+          output-enable;
+        };
+      };
+    };
-- 
2.51.0


