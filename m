Return-Path: <linux-gpio+bounces-23318-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C69B0660A
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F324C188A96E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B172BE7A7;
	Tue, 15 Jul 2025 18:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Gp3nGA96"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6DF2BE057
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604208; cv=none; b=r56xapxMUjZQvgXO7vlmmWKQK1JWZYO3/R+BevR5jdGsdq91Ew19QpmRA+qHfumw+0082esntr92Fe50kVMuq6E2jhia79V3FUAcPZOYZUk2Ozh8E8Rl0B95hrUyiR2zBf0Eu+hoQSYRvG78a5sJxzHismBmTZg5yNXDLc0/ob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604208; c=relaxed/simple;
	bh=8bOKmWSgvRff8JZ3ZnrMVOUApQFxHfkFIso+f1BkerQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nDya+7J3RbFjhmmLoqSoOeBeEHIFK8teT8yfQMhhC7/7fHYCkaRCSRjpjSmvCDys03M4WCtu1USZdT+Etr5+/D4SGc4a2gRkS/f1O+MtP3Spj4NEsDDM5yySBuYazksHSS6uJz1ZM2IsVLt1rKxmatzEHXtQlGNFXUNO7lrA8TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Gp3nGA96; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-ad572ba1347so817353166b.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 11:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604205; x=1753209005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Rz/CvVx0suUCLwJLQjKC4luh7DN8eMsyJIC67bj00g=;
        b=Gp3nGA96IBpVt8KM+VpGV22CnTTJX03oMtVKUMf5bXZbDi7iPCf7t/eXgC13LzESoa
         qlf619t5iw3w5tprpbufiI4/kaCFgq+7qLUN+gfEv/hl4V0BbDN1uC8g+uS0V5bwvdP7
         UjN31yistUzYHVyqUpt0NkLNwjf7eqbzDGLJqlI2WoqSkISt3cbP+JyfxyHZgx8E9opd
         +AIHPTeRxEgk3gILEDGWYv5TbIiRW8+75A0wBPhCynnhXJFqpFyXFUHcGr8VhPGDCGG+
         FwGdnGk/eAWQEn55VwJEtVpdK+d0jRIxwqn01jKJHMPtOOel6yE0XcnZupkyGCPsGzFR
         ec8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604205; x=1753209005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Rz/CvVx0suUCLwJLQjKC4luh7DN8eMsyJIC67bj00g=;
        b=hqP8ibNtkWFmqlB9fNArcz8AGz2hQI/I3wjtgTbIm0fdNRfwHXyu6n+VYwXw95tuNi
         IHTvK0peHC/yfzQeRoMSakqCSvtxm9BOs7QymcKQ7dIrNIO623tWOlcQANv46eU++Yj9
         NnmDcc6GUDguLR6V2Ii4Tii7/LFm3gXUI6jnS9ROoCeIagvXcExXeHr1P/XslAuE4haQ
         zA87mkcKCqNCzTeY5K+fo1DkdOG7lfTCqHj81b7ZjQCU6xzcDF+K4gCCIjFNWBL+1xXf
         QQ9uOifFkLTj5E2gcxMv/1gNkYsm6SFOMptZ+Gc6jbaq/8aU9ppZZ/I8Tr6SWN3Ogq1J
         LHxg==
X-Forwarded-Encrypted: i=1; AJvYcCVfYKmxG3Tz5LuK0deBz4IreJL63HQg0WXiX6NIpRtMH087YqNy7p3RyANNONVtCxtFOmFjnB7r87Pv@vger.kernel.org
X-Gm-Message-State: AOJu0YwXZYCzTc/PAm6yH7wbcXDJyl3TAHRU+Uz04wj+AqohqtEoP3Yd
	Mo16X7Ia9KLzIR6AtNR7QwZl24J69bBCx3lUMEur02jDuUB2xFTe3T8FQ4TnAiR7yMA=
X-Gm-Gg: ASbGncsf26fPA2fvawCWgEgpBU3nSgp1xv9gwnsfAgGcHMF3YN2tsLQUtlLGNZSUVdm
	oilA/RH51GmvntlNtHBCHT/rZYtwjRcr+OrL1s7E7+FZT2UbX6oSV7+pSYNV9uTwAOm09SMLl/Z
	8LsrDmDahua2/XmVza5bjQVnOwUkzSBzTDz8AEvVSTjsK46YYN9zAXGzgwcVjNIbH09Grm1SjNc
	zNSOtm/O1TWX13HeZQhqtZ3ISfXFDO4kIfJhYnc7dRQQldE5+6qLUwSqzxtDFIcj4kM3brIPezZ
	dukXXACKT6IaA9nlzqk5ZNTkN9hN6W3GdnW79gC7IYtWrhJ34fAR4wMgOwDepClNelbhfRozljO
	kbXKFECTavirwNsd1sdZr1oJ+wKmYbpqZd48G5+Br9Mkb8/bpSYslyz3m6M0L9DD1Rhwq
X-Google-Smtp-Source: AGHT+IF8ZBRa+AsJx7J92AOAyQE64jiGuu5X5WepNm19TkULb1JDRA5w4ABacxi9u/62Q4LV5Rd0bA==
X-Received: by 2002:a17:906:7308:b0:ae0:67b4:991d with SMTP id a640c23a62f3a-ae9c9b1fccbmr48071666b.35.1752604204645;
        Tue, 15 Jul 2025 11:30:04 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e826651csm1043690566b.101.2025.07.15.11.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:04 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
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
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB pin controller
Date: Tue, 15 Jul 2025 20:31:38 +0200
Message-ID: <97c650c9967c0c3381c383dfe68bbe6966912604.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
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
This patch is based on linux-next/master

 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
new file mode 100644
index 000000000000..467a9362dbf8
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml#
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
+      - function
+      - pins
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


