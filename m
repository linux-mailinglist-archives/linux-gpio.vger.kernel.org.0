Return-Path: <linux-gpio+bounces-24189-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44307B20C98
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 16:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAFB5188EABD
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 14:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C191E2DAFCB;
	Mon, 11 Aug 2025 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XlSDErxm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA5A2D663F
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923512; cv=none; b=c7NFfqDXYPhd89WmKfpLa/bolFtTgMpEf18AuGJ2sWOskZOEgUembue0yLObme3/jyAxtkZbwwXsQDYRFNM6wTmpumg89YsyZ1QCuj/vdD/dplOSGGwbJcJGQFgomVfuqMSf9aYRJ9XCGSSihxgKlMW2TzjxXKMUflA/bN+9qDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923512; c=relaxed/simple;
	bh=TbQRXEWfGEAqwdEnUaUm6vGN0Pv/eFmzgGUL15Hx9qw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJ5gPcvCBujQMUrvMa4hlvpwgUcQ1Oo+MBj3nQ+FJ1lHh0nAVkzd0uI0obEWutENk9Oy5NXxblIXvoeZM2w5HUYAilbCGZEEtYpbh/hVftEUNhJCgGbKNGtoUP6aylbdRkEErXZuBGCligUKd/RqnRWtY4id2OV9gZwGaqGqEoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XlSDErxm; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-af96fba3b37so832347466b.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 07:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754923509; x=1755528309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1opvmD5Gf0O7HnczCsyP5v9V35Vbg6CWzWpnJdyIB0=;
        b=XlSDErxmwmXWOmH4sXmfOxm5sGHLpGCoacoV8U6j7wOMeMmB1x4gIS89hSUd8sJ+Z1
         jrWNLQ6JG21fD5CQNJOq0/0/iQf8KavDIpG1AtBkkDtvbphPbPbISUGIEOtqpVj61dIN
         WtisvmWetqgwcJrLYT8AoZ0hNWlWEdLZHuEPoahoFHlmRGdNk6spi30DwYcuXMSy/NTg
         h1jtux6PkKOZN4NJlytwe3d8zElTlwwoUssYBdCZHCkbHps+1cpkY6foRNdclgDER3Qr
         dMBfS6StNh88uLnxXSMr9u2Jh5GFYLv0T0HTwN3EvIy2+zw74FnBQHEoprBSXJmj0YWR
         2auA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923509; x=1755528309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1opvmD5Gf0O7HnczCsyP5v9V35Vbg6CWzWpnJdyIB0=;
        b=WB2LVzLYEw8w8lt+GW/mejZZakSnyYXo8AMy8Bz1RDqiLGQ8FRr8czTZZjAMHYf/IZ
         UGXd7+o1lN2MPfljOZjC5M0e/Sk580xPP+K5bldC0HCGnVRCp14vhbrwHyq7DzwIpwoF
         KdDdaep5nGUH2aLpWdfK4agbiV52WkV8wEe4RZb48CfxEtUqPxvJ1IX6keSrMnyq0Ckp
         l9J2xB9QGPmh8p8wcu7z3pOELNG4SiY/jKmoYlhZwjM8cHAuC6tp0wZz0h+mSmUEvXKl
         uuUZbZeByFoc3owXtcyLLuqUk9i+46m4mufCdokhFrHzPvk0QTAX3dgDP22GH13FVpkJ
         CbVg==
X-Forwarded-Encrypted: i=1; AJvYcCVhr/Ok76bbZuiyx4tNPzIwOhcLdlmtk4CuCTovdqbh4LqaIcg1OT+UQ9D2kyFLC0LbsRn2a7mivjda@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo7IX1CkoNTJacBu9p+IjV7Op1zvUNwIqqNN35QhCiUVa2KAH7
	kiHwk/lu9OyH4nF0gPlXlsuWZ7LM+AyOBcgY2USzYeesLWexisZq7dDkgXssLITW/k8=
X-Gm-Gg: ASbGncuIRfy7pfDo2pC3ml05PNpH/cqxhX6/K1rfQvnDP7xgajzOZYkpLgwXVjbUdgm
	HkGcBkazAoVEuZ0O+4vgmJdUmHZHjXjzpQnzR+GbNlnq7SwbXhwEWwP1XWHMh8Agoi6f1QFUPaQ
	6zhrGZJ05isGMTaouxKD5g3Jh7TDgOpJkNSMSDss+aJWvqXXsFuP24ZrAQ7tsuhbDC+O6W/tkv8
	DSlvYBvBpQdfHXWormIpqFxBY3EGZSY7ZdcqT9v38qE2cEdaAHz2jS8dix8J24h3+XYvB7Dg+rk
	vcOnOKzDiUcY9Na5oAO0Uu8kGv9EOdImssWQZ6lDKZOt+3jULlLNIYEmr67f0jS5z7h2V5exKSS
	xqn9eEiPZ4O9pucf6/fSR62Y8B9WN3MWBD1ozXx1i89cH8FVRu2F2S7SmRSmz1gTjCg==
X-Google-Smtp-Source: AGHT+IGnbODAKC0QhobAqDzUSNdh1Q7avIaZAEjyMZjxOFUSbgZxhg+kWhsqIK/Yr8CBAFklngPMcQ==
X-Received: by 2002:a17:907:3e1b:b0:af9:709f:970b with SMTP id a640c23a62f3a-af9c64b14bcmr1205314066b.46.1754923508614;
        Mon, 11 Aug 2025 07:45:08 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c157sm2040464466b.100.2025.08.11.07.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:45:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Broadcom STB pin controller
Date: Mon, 11 Aug 2025 16:46:51 +0200
Message-ID: <6fdbaf2bd0b72badbb5384e43b97bebcda4cc2f0.1754922935.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754922935.git.andrea.porta@suse.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Ivan T. Ivanov" <iivanov@suse.de>

The STB pin controller represents a family whose silicon instances
are found e.g. on BCM2712 SoC.

In particular, on RaspberryPi 5, there are two separate instantiations
of the same IP block which differ in the number of pins that are
associated and the pinmux functions for each of those pins. The
-aon- variant stands for 'Always On'.

Depending on the revision of the BCM2712 (CO or D0), the pin
controller instance has slight differences in the register layout.

Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
new file mode 100644
index 000000000000..28d66336aa2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,bcm2712c0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom STB family pin controller
+
+maintainers:
+  - Ivan T. Ivanov <iivanov@suse.de>
+  - A. della Porta <andrea.porta@suse.com>
+
+description:
+  Broadcom's STB family of memory-mapped pin controllers.
+  This includes the pin controllers inside the BCM2712 SoC which
+  are instances of the STB family and has two silicon variants,
+  C0 and D0, which differs slightly in terms of registers layout.
+  The -aon- (Always On) variant is the same IP block but differs
+  in the number of pins that are associated and the pinmux functions
+  for each of those pins.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2712c0-pinctrl
+      - brcm,bcm2712c0-aon-pinctrl
+      - brcm,bcm2712d0-pinctrl
+      - brcm,bcm2712d0-aon-pinctrl
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-state$':
+    oneOf:
+      - $ref: '#/$defs/brcmstb-pinctrl-state'
+      - patternProperties:
+          '-pins$':
+            $ref: '#/$defs/brcmstb-pinctrl-state'
+        additionalProperties: false
+
+$defs:
+  brcmstb-pinctrl-state:
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+    description:
+      Pin controller client devices use pin configuration subnodes (children
+      and grandchildren) for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode (either this or "groups" must be specified).
+        items:
+          pattern: '^((aon_)?s?gpio[0-6]?[0-9])|(emmc_(clk|cmd|dat[0-7]|ds))$'
+
+      function:
+        enum: [ gpio, alt1, alt2, alt3, alt4, alt5, alt6, alt7, alt8,
+                aon_cpu_standbyb, aon_fp_4sec_resetb, aon_gpclk, aon_pwm,
+                arm_jtag, aud_fs_clk0, avs_pmu_bsc, bsc_m0, bsc_m1, bsc_m2,
+                bsc_m3, clk_observe, ctl_hdmi_5v, enet0, enet0_mii, enet0_rgmii,
+                ext_sc_clk, fl0, fl1, gpclk0, gpclk1, gpclk2, hdmi_tx0_auto_i2c,
+                hdmi_tx0_bsc, hdmi_tx1_auto_i2c, hdmi_tx1_bsc, i2s_in, i2s_out,
+                ir_in, mtsif, mtsif_alt, mtsif_alt1, pdm, pkt, pm_led_out, sc0,
+                sd0, sd2, sd_card_a, sd_card_b, sd_card_c, sd_card_d, sd_card_e,
+                sd_card_f, sd_card_g, spdif_out, spi_m, spi_s, sr_edm_sense, te0,
+                te1, tsio, uart0, uart1, uart2, usb_pwr, usb_vbus, uui, vc_i2c0,
+                vc_i2c3, vc_i2c4, vc_i2c5, vc_i2csl, vc_pcm, vc_pwm0, vc_pwm1,
+                vc_spi0, vc_spi3, vc_spi4, vc_spi5, vc_uart0, vc_uart2, vc_uart3,
+                vc_uart4 ]
+
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+
+    required:
+      - pins
+
+    if:
+      properties:
+        pins:
+          not:
+            contains:
+              pattern: "^emmc_(clk|cmd|dat[0-7]|ds)$"
+    then:
+      required:
+        - function
+    else:
+      properties:
+        function: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    brcm_pinctrl: pinctrl@7d504100 {
+        compatible = "brcm,bcm2712c0-pinctrl";
+        reg = <0x7d504100 0x30>;
+
+        bt-shutdown-default-state {
+           function = "gpio";
+           pins = "gpio29";
+        };
+
+        uarta-default-state {
+            rts-tx-pins {
+                function = "uart0";
+                pins = "gpio24", "gpio26";
+                bias-disable;
+            };
+
+            cts-rx-pins {
+                function = "uart0";
+                pins = "gpio25", "gpio27";
+                bias-pull-up;
+            };
+        };
+    };
-- 
2.35.3


