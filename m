Return-Path: <linux-gpio+bounces-25049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3BCB39D9F
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 14:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 144D11BA4A06
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 12:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE2530E843;
	Thu, 28 Aug 2025 12:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K0hOY4fG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70775260575
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756385154; cv=none; b=fdSw4sLk1hwzWauZvn06lT3B6/I83EJMdmeTAs5cmoM2qQP7L1GAxDewhjJVSl6F60DkDOT22sKBN473/Ndnit2DRDhztdQT41A9MBxxoHf1PnF+88RWOKCmHrkV2HaVug4yTP2vGUDluRXOUIm2OmZqIi0eW7gpiHerWK+VEPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756385154; c=relaxed/simple;
	bh=D7JlYqTpC+y/zZZEn8ZQupPVDg0KbxwSki5Ii7Uk1fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKK29rvT8Vle9ga8IlqFYI3NWo07uOLD6WL1lF6x4FX6wkJvZkOfvOwUrQneW4q6DM/i9MyCIrfSFrCgYFwoi/nVLKFwYGKFx0T+Co98KA8fKD9oEleoXDktkVwFcZpedDdwJO6HzGZ3xh9oLdpGRZPA6vN9z5m1ObsLanm/Z5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K0hOY4fG; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so122403066b.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756385151; x=1756989951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBz+6uZRhAuIyPnfIHCkIx6hrzv/9myk5UkNLISEK7M=;
        b=K0hOY4fGjxWam9gHmMC5R9JsaRzC5yNxheSpRs11yyUVma0Wud9HhCym96gUouJ46A
         36+XMx7Jm/OX64qGmQrV8Wex1AhCYgWrEVOc4cOdPrqIpOlo4CHtQepToxGl5MAiMxz8
         L6gc2WUU10HI9LVbwCNWY1+5jIpGSxy45j4r95Wcl6Qb90ixxpbOZ9mkuMfR2iCBfOfH
         r2lqhjvYeR1Md+V4Oqjh7u7mhO/0rYE49GNyOuIf+HSAoBjfiNCHDYSvXQEY1Vy5c2Ee
         nNlNqYItFHLoFueGsGf0A9IA6yb0Ll/czC8UBHUDo5+g07Hoc8YcqxZeKX4wYLiq+dZz
         MQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385151; x=1756989951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uBz+6uZRhAuIyPnfIHCkIx6hrzv/9myk5UkNLISEK7M=;
        b=O0pBh6/VHq+ZVZFgVw/4k3y0Uo/6T8r3BFwYb9MpuHA9UVC4UUn6fr91FH8f0q6WAm
         IpupOgggrLqhNkKQRoJIvNzjL9C31z8hTvnbpLKLROejtfbzEsYcvmPRQtHtCoata5RU
         Kj7ezZ3BsBlXoe/ETZkka5o92+S6Njw90j0b8dcgBT5kLcbgfYG9wB29fbYVLxCve5mO
         3OmMMHmIgRjJBrqx56B18bFH1XQpcIl3rHDKHqipoufgS73aUzpr4CRJNZTIyYo01IPt
         PLXGPFy3/f2XSoGM31O2iLNfWIJYt+h8QMozFYX11PFhgkY48lf/cYVOlu26pVqmFOxU
         nS5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkic/l0w0rMVxaGxSHZ4jRoJAl6peujxr99Wbp93R3BxuODyeI8Z5G2sVR+k91IhK4JALvcT1G/7j8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2sPhGzoEGnEYzhdYh1Ls+OI19qgRIzazoV3PLH1C2Trp9qgqC
	TXYIQ93DN016XuJj478wVsu/rvByQyEo8E01vhb2nQGPR0Crs1lYQyixx0DELgdZjzQ=
X-Gm-Gg: ASbGncs2irae23dy9LeKpIOaIPPA7IUvU0zM2TK0CnrUkvT9PcONN3aSJkfxrS/ZHbC
	8RWq0kAVbgoQBC/ckOn0Ui5bHFeZ74MY+k1B9ymD6+CI3pXTfiIb5VNC2xA89KJYCR6POjs+r4G
	dZ9zJYj8PMP4Q0hsfVVIMvkgUcupk3f0dJy/iZJTdAfeYsG8OrurL6mvKOLR6p1bMuQL9W1wzrd
	9Ko+dKzpLwWoxbDio5LXcmSacAdytp4RTKNAOlfngacKeLJemJawmb1wuItNzI2G5w088QbXDNy
	dSplzfE0NZsLqGWphcAswn6lG9eXpoyfsLsEaYRe2/Z/50phwVAAhqcz6NseGcoGEJY9cXfYTdv
	iA9HX01nGW+JDMeLg4v30OOF1HkmOJvQlvFojgppRPpQBzqmq1PKsVZA2QXis//z5w3ggWVR6rL
	UtuajzKs2CxE9XZqJdR4FUVe1urDA=
X-Google-Smtp-Source: AGHT+IGPdnslhHtWwDXi8CWf0WUgTci6zKmKHxIJAPlEjB/fI84WomFtAqz/+4k3SGbnuYIM9OOe/w==
X-Received: by 2002:a17:907:3d91:b0:afe:8bee:fdb9 with SMTP id a640c23a62f3a-afe8beefe3dmr1180328466b.28.1756385150607;
        Thu, 28 Aug 2025 05:45:50 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afedaa774d1sm186721966b.89.2025.08.28.05.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:45:50 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Broadcom STB pin controller
Date: Thu, 28 Aug 2025 14:47:38 +0200
Message-ID: <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756372805.git.andrea.porta@suse.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
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
 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
new file mode 100644
index 000000000000..1e5d5234ee8d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
@@ -0,0 +1,137 @@
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
+description: >
+  Broadcom's STB family of memory-mapped pin controllers.
+
+  This includes the pin controllers inside the BCM2712 SoC which
+  are instances of the STB family and has two silicon variants,
+  C0 and D0, which differs slightly in terms of registers layout.
+
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
+    description: >
+      Pin controller client devices use pin configuration subnodes (children
+      and grandchildren) for desired pin configuration.
+
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
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
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


