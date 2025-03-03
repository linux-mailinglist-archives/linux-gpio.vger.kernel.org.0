Return-Path: <linux-gpio+bounces-16976-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D9A4CCFF
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 21:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 149E93ABD44
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 20:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDF8235C04;
	Mon,  3 Mar 2025 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3aYwQLY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9662711CA9;
	Mon,  3 Mar 2025 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741035295; cv=none; b=hYM0ATiwpEgQRH32psathwvm0/ktqqrQ1WhMlYr1UrN/eroLmdYscCUI9xuwh13SHuxocKy4yz6uG9xGK7IcL1+bD1izA2dq4V34UVkLN4+lrrm6hXmUatcPzc7DdJPKuUc5MlEBSlltFRQTFevyWIFFzKiAmwZ44TeQIxO6DF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741035295; c=relaxed/simple;
	bh=8sKAqg+gUGLkXLgSLhywcAHvI/uGgduy0VUSsfjhpPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/TAgZorceZiFYX2k0DTU9xZYLiualRaKnC3+bIvUp0F67faxpZp4aoAsXMrAJzzJg8M4IYeTFYrblDNQW/lvye4a0LSd3nWuYW8YnZFzkKGNzGCEJJwg9rZ4Y7q4U5xxSDbRnNBN2izd8pNmy2vex0VAXDBFSIJ1lHrBT+LSLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3aYwQLY; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abf48293ad0so441914266b.0;
        Mon, 03 Mar 2025 12:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035292; x=1741640092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZV1Sc87tN2wDyrr8w4U/T//Mq5MgKYTQng7EZoAkc0=;
        b=C3aYwQLYTlKFQbus5CmKHI+Q6JY31m5NyoKa1yfG5jpvcmRxYReL+E76kts1D59T7m
         bcwo/0mnlxR8nAd9KX4Wo85OtPoOmaHf5SIaAhkupZf6bclvXAaoQH+f9jiytB5cBXto
         bd3/yEYxKbrpgTwyin65x1CzzW0EFs/6FCCORDKfvJ9gqpYX04dSQ5Z7jEMYkiaPP7Pt
         vCrWfsGTIaxm/kSEWSoHUW+8rpgycMyziePY7fEJEMhm68t1xlswTUN7W+bZhkkKiimr
         9QzR3DwUMYjebnyLYuBaqA2wMb2bn67wy7kMwk0E9EU+tIpf0po/Gq3UOxel9W4ON5n5
         qKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035292; x=1741640092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZV1Sc87tN2wDyrr8w4U/T//Mq5MgKYTQng7EZoAkc0=;
        b=ssYqIodrOxB5uVV3yZj8tZoVv30CmKSOZNhN8706SDyjLxinAWq/QnD+rTflZGjD7K
         5Gfd+e/YLwgaFUBbsGFPvJRFqwNy5hxKtYcsKOEPkBo524JrldBLNY1QjtK6Z8nZbguq
         fmGxRdb/tNJ/SQSwOuKbqaJ88tD2l/Auo8I5CJWfr/wOns8wEhEfboziMDk7qM2VYL8S
         3Zyb4T5t+WkRydUOmGxWt7Z+bJVpnQ1gRjiKUcbCdu461dOkkHW4d565aAQYKMSGtr7m
         zOepOPqu36Qj/IV5GqQ7s/eXQEXQjlYl5REQiGfJ45tYcU2wIETxFZPyLljTj+zTgeYi
         4jTw==
X-Forwarded-Encrypted: i=1; AJvYcCUNgShx9mfW8R/+U2AOvo7tHSm/e6TsZHbnmBFvGE+aTC08l8dANkzvVuQLZUWqjNoU4464/MXUajF4@vger.kernel.org, AJvYcCWKqtspZl01ErA2MyQrpFAdyUOdiBqI9NVB+SowW2Z0DlUGUaHwY1auY2yYRvWxjnUo2iPiwxjQ6P0Qu7bR@vger.kernel.org
X-Gm-Message-State: AOJu0YwrkSMQ6WXUH4HOQ2yfTRJRX/3fVWNoXiPwnSCMPR8/eom0yNRF
	GdKafIBjpQuce4AFdNsfxgABRh7ulf7OvZWAs7nspsoCB5so9dNV
X-Gm-Gg: ASbGnctJHTezUhxB1lZix3ByemsTqkXxCf8JR3+e8ceHGY8MA5TmvgUtOUN+6xee8+S
	/AGT3KeaKNA5DW7pXpD+rSuPsJ5YSHDj+T31IMEsj27EG7JPIbjBs5aUFo958Njptp3c6anFUk+
	8AMy0VtWnjdUH1ZhseeZkRcLK330q7//ISt721JoAQYzpnR8ztq9r/5Tn2NKbAGgNSMIvQkvGM+
	rdfuD4/CLoLaONTKQrtJCBvuXIt89QXWvjPOITbGGvG+zQcSRBtUIkN73dC+Bdd10Z6kA7zCpui
	UeEItwA1nLkYPOMIrmZgsOI4uIlSX642TLk5hcZXte8PyAEDVCm6T1Ya8bUErBdQrfxZD3kQYFn
	SNGKlOTI7qi5Q4FI=
X-Google-Smtp-Source: AGHT+IGedzWpJHscXDurL0luKHIRErVaMIRyvQlt37dMb33nm68RFWM49rbp21MYUquB+KF60dDgvQ==
X-Received: by 2002:a17:907:980b:b0:ac1:ddaa:2c03 with SMTP id a640c23a62f3a-ac1ddaa727dmr411554866b.0.1741035291599;
        Mon, 03 Mar 2025 12:54:51 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:51 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 03 Mar 2025 21:54:46 +0100
Subject: [PATCH v3 1/6] dt-bindings: pinctrl: Add bindings for BCM21664 pin
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-bcm21664-pinctrl-v3-1-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
In-Reply-To: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=6571;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=8sKAqg+gUGLkXLgSLhywcAHvI/uGgduy0VUSsfjhpPY=;
 b=imKoJZCCIN7s1kZiwY9VlOY0d9ZlxhC6MACJCLE2gCmKzCX2GXxfgYRnel7ZOuOnhTjcPCCNF
 z1t9uCgq/NzB6H4uKSEdbnRTpaqlkqmFL+/tHohNVoKOqO26WCNCHn0
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add device tree bindings for the pin controller included in the
BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
both chips use the same driver, but have different pins, and the
BCM21664 has 6 alt modes instead of 4.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Fix example for I2C pins
- Specify bias-pull-up/bias-pull-down as a boolean
- Add gpio16/gpio17 to list of I2C pins in slew-rate description
- Use additionalProperties: false on pin group and specify valid
  properties for more strict checking

Changes in v2:
- Drop "property: true" declarations which had no effect with
  "unevaluatedProperties: false"
- Define property limits for I2C pins only instead of standard pins,
  making the pin-specific "if" condition significantly smaller
---
 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 152 +++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1283a588416d406e6ca5add012cbaa569ef355ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm21664-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM21664 pin controller
+
+maintainers:
+  - Florian Fainelli <florian.fainelli@broadcom.com>
+  - Ray Jui <rjui@broadcom.com>
+  - Scott Branden <sbranden@broadcom.com>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: brcm,bcm21664-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '-grp[0-9]$':
+        type: object
+
+        properties:
+          pins:
+            description:
+              Specifies the name(s) of one or more pins to be configured by
+              this node.
+            items:
+              enum: [ adcsyn, batrm, bsc1clk, bsc1dat, camcs0, camcs1, clk32k,
+                      clk_cx8, dclk1, dclk4, dclkreq1, dclkreq4, dmic0clk,
+                      dmic0dq, dsi0te, gpio00, gpio01, gpio02, gpio03, gpio04,
+                      gpio05, gpio06, gpio07, gpio08, gpio09, gpio10, gpio11,
+                      gpio12, gpio13, gpio14, gpio15, gpio16, gpio17, gpio18,
+                      gpio19, gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
+                      gpio26, gpio27, gpio28, gpio32, gpio33, gpio34, gpio93,
+                      gpio94, gps_calreq, gps_hostreq, gps_pablank, gps_tmark,
+                      icusbdm, icusbdp, lcdcs0, lcdres, lcdscl, lcdsda, lcdte,
+                      mdmgpio00, mdmgpio01, mdmgpio02, mdmgpio03, mdmgpio04,
+                      mdmgpio05, mdmgpio06, mdmgpio07, mdmgpio08, mmc0ck,
+                      mmc0cmd, mmc0dat0, mmc0dat1, mmc0dat2, mmc0dat3, mmc0dat4,
+                      mmc0dat5, mmc0dat6, mmc0dat7, mmc0rst, mmc1ck, mmc1cmd,
+                      mmc1dat0, mmc1dat1, mmc1dat2, mmc1dat3, mmc1dat4,
+                      mmc1dat5, mmc1dat6, mmc1dat7, mmc1rst, pc1, pc2, pmbscclk,
+                      pmbscdat, pmuint, resetn, rfst2g_mtsloten3g,
+                      rtxdata2g_txdata3g1, rtxen2g_txdata3g2, rxdata3g0,
+                      rxdata3g1, rxdata3g2, sdck, sdcmd, sddat0, sddat1, sddat2,
+                      sddat3, simclk, simdat, simdet, simrst, spi0clk, spi0fss,
+                      spi0rxd, spi0txd, sri_c, sri_d, sri_e, sspck, sspdi,
+                      sspdo, sspsyn, stat1, stat2, swclktck, swdiotms, sysclken,
+                      tdi, tdo, testmode, traceclk, tracedt00, tracedt01,
+                      tracedt02, tracedt03, tracedt04, tracedt05, tracedt06,
+                      tracedt07, tracedt08, tracedt09, tracedt10, tracedt11,
+                      tracedt12, tracedt13, tracedt14, tracedt15, trstb,
+                      txdata3g0, ubctsn, ubrtsn, ubrx, ubtx ]
+
+          function:
+            description:
+              Specifies the pin mux selection.
+            enum: [ alt1, alt2, alt3, alt4, alt5, alt6 ]
+
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          slew-rate:
+            description: |
+              Meaning depends on configured pin mux:
+                bsc*clk/pmbscclk or bsc*dat/pmbscdat or gpio16/gpio17:
+                  0: Standard (100 kbps) & Fast (400 kbps) mode
+                  1: Highspeed (3.4 Mbps) mode
+                Otherwise:
+                  0: fast slew rate
+                  1: normal slew rate
+
+          drive-strength:
+            enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]
+
+          input-enable: true
+          input-disable: true
+
+          input-schmitt-enable: true
+          input-schmitt-disable: true
+
+        required:
+          - pins
+
+        additionalProperties: false
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          # Limitations for I2C pins
+          - if:
+              properties:
+                pins:
+                  contains:
+                    enum: [ bsc1clk, bsc1dat, gpio16, gpio17, pmbscclk,
+                            pmbscdat ]
+            then:
+              properties:
+                drive-strength: false
+                bias-pull-down: false
+                input-schmitt-enable: false
+                input-schmitt-disable: false
+
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl@35004800 {
+      compatible = "brcm,bcm21664-pinctrl";
+      reg = <0x35004800 0x7f0>;
+
+      dev-a-active-pins {
+        /* group node defining 1 standard pin */
+        std-grp0 {
+          pins = "gpio00";
+          function = "alt1";
+          input-schmitt-enable;
+          bias-disable;
+          slew-rate = <1>;
+          drive-strength = <4>;
+        };
+
+        /* group node defining 2 I2C pins */
+        i2c-grp0 {
+          pins = "bsc1clk", "bsc1dat";
+          function = "alt2";
+          bias-pull-up;
+          input-enable;
+        };
+      };
+    };
+...

-- 
2.48.1


