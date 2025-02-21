Return-Path: <linux-gpio+bounces-16410-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D61DA400F8
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 21:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73B40188F1D1
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 20:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97856205E09;
	Fri, 21 Feb 2025 20:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBScdTv+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9375E1EEA2D;
	Fri, 21 Feb 2025 20:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169967; cv=none; b=q/pjEaHTSotlNqKNCjuIc1DNQEDCEI9jgUWDJSKhPNXQ9VSG+NT99i5QkJaSLp3xuYU1lgtol9hIGFkSxCFz5a6kSVlj0vI/H3HgFtcb29+CEjFc53IWoN3Sxlfe22bxzbqcJg+Clf7wMYOODW9I+ZFwlTKiRzKvBjMiKxP5hBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169967; c=relaxed/simple;
	bh=LrzKwcuKH+7lMFxFZZvTxrTIVtGnQjlfl1kXpaPq4+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pwqy/LgEqcOc6qCGkyh3B4AWtUZiA4tt7vOVGPHNPr2yS3O7VHZ+4gwV/VEMaWS4LOxv5qqYCmlAObuC868wrsEA/qH7Lh5MC9dqusMrVbKfkCBSN2zNellShUG+QuchuEoEJv1vLEHTY1neAUxrBW1OgviHywvufTmdU4P/ZQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBScdTv+; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ded51d31f1so4350238a12.3;
        Fri, 21 Feb 2025 12:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169964; x=1740774764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCn4OXt1rKFxWRXj+H4O8yAzMZpo+ImdOMNPkNdHGXo=;
        b=HBScdTv+wzY9TKokokt2A3bvU66xMHdNbz2qxu3MICv2aXJLdrbUFc3Cmg7M7Ki8gq
         1PEHzo7SUEU74g0Vz2GQApXC3eT1ZGzhI9WeWH72XEplpZWtUvGEXY8Xgiyb+CejpX/U
         DOOlbFNy/C36yqQyGFPdCv4HCXIfU2feh8q/wjq9mm9LesCpPDLTUJIu6dTa5TC9L7oo
         NHf/xh4PJH2fb7/+Firo28QjhuekD4io5abHCJcYwCkWS+/2sOEMdSpEhzgzYvuh6pHE
         yWS0wedYAQZZNhpJXItVdbsY40oUj+VV+yKUXB2ALanKhk+ScNu7TUV51vbGJcAAO1HO
         mGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169964; x=1740774764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCn4OXt1rKFxWRXj+H4O8yAzMZpo+ImdOMNPkNdHGXo=;
        b=TA3h2xqAPZyUvaaKdA2inp9iGWYRT70zFrq3rP4zUkWthCVkjWbU8cIcReG9m5WvBE
         JN17b8qHgHKaGD/x7Ly6cSw2A4rRfeNhE6TKBBRqCBy8fkbCJ5MDd4BE0Se3hPlXtG1q
         X6RGFxZKXNJjuO5YZWxRAgQw7crMiLGCgd69zaZJQTklqd5ZlTU5epsmJPEfjDkE37Lo
         TlZTG32YZ4K6lF9QE6vAv/ogQ0etP4ZFVfrIekPSlXXmhelMnatkOUYE225puwk+IcDq
         QyWSPViEd6lJufg59nsmzavmfXBLdps4NN/lQkkgsCDPglJHsHlMqBwlkn9p0XOvMILk
         ottw==
X-Forwarded-Encrypted: i=1; AJvYcCV8/cgGHzMdT6VkgXI5eOpMFhE14ZwNMfZ/lYC7GSJnhbJEToouTvewFeWhXqFsEIzEAIOouTzSLHPV@vger.kernel.org, AJvYcCW0k62j8/i+JoU853YPB024nrmMK78jHXM40Vkkgz8uWqt/WbwwULQekke52xjffl8yOPVyPwtM2zw1TM84@vger.kernel.org
X-Gm-Message-State: AOJu0YwVpPkJcn+3Z29sWZSg2IaZxtOBkPfWDafQMV7Svj/pefdM7HMm
	K37NA4JSg7aIEsumCqj0Pbqs7iaio6gTvuOsA6WC03CwjDR0bBKF
X-Gm-Gg: ASbGncsEON3eJmMbymFbRl+/UMpBkN1CALUWJ2LRlz03s+lT7b91K0uBbRHdoOHrZo+
	Sokw3hJHQ3Ie2VRmvjy9ytllti1xGaALIth4nh9zDJg1FjE36x6H54XkT6maFWH1PgmPvT84Sls
	BFbeWBPQRs341mmRvw1YA1uLb9RUC1fqBrAxkeZ7dnYgFkv1n/amF/k/V8hQwYQXPtskHbhOT/2
	eViomLP87be+yArkrgK3pAkop0sfAFz6129v3CYkGBDt2QCtldCGn1g6rvjmbOK6DmVUKoHImmo
	hrmiZjgBkEnmAeCCiMu2+YaNnYyUw4P60kUl549QQGl+aQouAVTP4yoFZ7r3Y4gi4TMd5a99
X-Google-Smtp-Source: AGHT+IFgnLCCi3RErue61glfb6xjxJDZZ92IhClCzKrH/m+jqwqtiTl7Ly7vqMdOKhmkffKjBQuywQ==
X-Received: by 2002:a05:6402:2347:b0:5d0:e563:4475 with SMTP id 4fb4d7f45d1cf-5e0b722c319mr4363564a12.29.1740169963795;
        Fri, 21 Feb 2025 12:32:43 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c418bsm14653485a12.24.2025.02.21.12.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:32:42 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:32:37 +0100
Subject: [PATCH v2 1/6] dt-bindings: pinctrl: Add bindings for BCM21664 pin
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm21664-pinctrl-v2-1-7d1f0279fe16@gmail.com>
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
In-Reply-To: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740169959; l=5996;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=LrzKwcuKH+7lMFxFZZvTxrTIVtGnQjlfl1kXpaPq4+8=;
 b=KiP8RteV4d7KyJ/O+JBJXcIu0smkdw/YjWP7kyB9+XWKukjr4V+K0sD4Od+UEIstpKIt1gJ+Z
 qfw1Y0ets6BADhHuoCft0/aZod8vHdFoUefvv+lPlqX9n+Nq//+jI63
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Add device tree bindings for the pin controller included in the
BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
both chips use the same driver, but have different pins, and the
BCM21664 has 6 alt modes instead of 4.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Drop "property: true" declarations which had no effect with
  "unevaluatedProperties: false"
- Define property limits for I2C pins only instead of standard pins,
  making the pin-specific "if" condition significantly smaller
---
 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..32b7e44e25900b9873790480b04f2feb9e54be02
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm21664-pinctrl.yaml
@@ -0,0 +1,138 @@
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
+        unevaluatedProperties: false
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
+          slew-rate:
+            description: |
+              Meaning depends on configured pin mux:
+                bsc*clk/pmbscclk or bsc*dat/pmbscdat:
+                  0: Standard (100 kbps) & Fast (400 kbps) mode
+                  1: Highspeed (3.4 Mbps) mode
+                Otherwise:
+                  0: fast slew rate
+                  1: normal slew rate
+
+          drive-strength:
+            enum: [ 2, 4, 6, 8, 10, 12, 14, 16 ]
+
+        required:
+          - pins
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+
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
+          bias-pull-up = <720>;
+          input-enable;
+        };
+      };
+    };
+...

-- 
2.48.1


