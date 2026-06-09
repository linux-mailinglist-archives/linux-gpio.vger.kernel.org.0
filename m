Return-Path: <linux-gpio+bounces-38161-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o0ciGNXMJ2rN2QIAu9opvQ
	(envelope-from <linux-gpio+bounces-38161-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 10:20:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F0665DB08
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 10:20:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=DB5rB350;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38161-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38161-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C398309BF1A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 08:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8ED3EEAEC;
	Tue,  9 Jun 2026 08:13:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED133EDE64;
	Tue,  9 Jun 2026 08:13:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992837; cv=none; b=OxB+2YnfINSk0qH18unDXBNSi5vpAVZBC4pVcq17eX+8k9Pl8VTqI29LCzB0qIdzLj5ylbmPlHwdVVvGI6m5w3WISoZkb4HW4XDIWN2SJTiR6IKd/KUSi4/XgHJNcdGUQnZtuncQlmAKGa/zps2yvlo5Kn4ZraTRRxzHj/sj4yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992837; c=relaxed/simple;
	bh=ndg4zfj6eHURyeX3YFUhtfw53BUBtjqFldZvPpjbIFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Buf/r+APcl3HYTflmSXlrQGCQfJPKpcp8tb1ghSKIEKGpQZYBaKJncSviY6tXKC+YmPjUn5jkLchuNXpsAXqNBRUIljFWeIg7jwjl6iUalYIKOvqde/b4wCdtGR3bpnuRI/6oEzWf7yfh00l6eOn9aaMDJ+akGhDe9tDikyGSM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DB5rB350; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7A4CC4AF48;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780992836;
	bh=ndg4zfj6eHURyeX3YFUhtfw53BUBtjqFldZvPpjbIFM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DB5rB3503xShGiyarKKvrHYvXw+zaWZLLlSXLj/+vv2bbJL0NXBxXO/pSivFLTI9O
	 rPZ8L27Rlc9zpgEpTgxArEDjuPA2HICSXZOr2bdUTeQjjNxkule+7Zre8kgikklrIP
	 1Lov9oA67S3VGTvHyMFG/uWDcupQjaIIbwsA6NiMcLysBEiFTNJx4CX7z8dctcZkjN
	 QEv+qFWVctGPffmwrmiATYeo0od/vrjB6/LB5XtWF9RO/oh0HQixO4iWeFL9NX/4bi
	 Y2vk97zkqmKWCFH7hvmPEz78SUpBD6kzt6ZHct5fFtd92tToNqHMm4xBz8u5gW+96L
	 KgHgCQWn7B2HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6E0CD8CA4;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 09 Jun 2026 10:13:49 +0200
Subject: [PATCH v4 6/6] ARM: dts: qcom: Add Samsung Galaxy S4
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-mainline-send-v1-sending-v4-6-83768fbf404d@alex-min.fr>
References: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
In-Reply-To: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780992834; l=11902;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=nctRB+KA+oUj8EPwfdjz/B+lJlxwLzH4CwLXPFywPY8=;
 b=U80ELQyGqWqDbDuzC0HkfjeNdREk1eC0vr1yyVDU2DXLCXT7fWUSaaTfLjUdPtV/qMdkbLyhP
 fmPrdzhXv7ZB3KaMGH4DV7jqFrv/IofA1jJWp5rLH6nC13WB4T6MW0/
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38161-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:linux@gurudas.dev,m:linusw@kernel.org,m:robin.clark@oss.qualcomm.com,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:phone-devel@vger.kernel.org,m:contact@alex-min.fr,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[contact@alex-min.fr]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34F0665DB08

From: Alexandre MINETTE <contact@alex-min.fr>

Add a device tree for the Samsung Galaxy S4, codenamed jflte.

This has been tested on a Samsung Galaxy S4 GT-I9505. The initial support
covers UART, USB peripheral mode with USB networking, the front LED and
the physical buttons.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../boot/dts/qcom/qcom-apq8064-samsung-jflte.dts   | 481 +++++++++++++++++++++
 2 files changed, 482 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 32a44b02d2fa..6f89ba426f98 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-apq8064-sony-xperia-lagan-yuga.dtb \
 	qcom-apq8064-asus-nexus7-flo.dtb \
 	qcom-apq8064-lg-nexus4-mako.dtb \
+	qcom-apq8064-samsung-jflte.dtb \
 	qcom-apq8074-dragonboard.dtb \
 	qcom-ipq4018-ap120c-ac.dtb \
 	qcom-ipq4018-ap120c-ac-bit.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts
new file mode 100644
index 000000000000..75ae19af96e5
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-samsung-jflte.dts
@@ -0,0 +1,481 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/qcom-rpm.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "qcom-apq8064-v2.0.dtsi"
+#include "pm8821.dtsi"
+#include "pm8921.dtsi"
+
+/ {
+	model = "Samsung Galaxy S4 (jflte)";
+	compatible = "samsung,jflte", "qcom,apq8064";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &gsbi7_serial;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops@88d00000 {
+			compatible = "ramoops";
+			reg = <0x88d00000 0x100000>;
+			record-size = <0x20000>;
+			console-size = <0x20000>;
+			ftrace-size = <0x20000>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		key-home {
+			label = "Home";
+			gpios = <&pm8921_gpio 30 GPIO_ACTIVE_LOW>;
+			debounce-interval = <5>;
+			linux,code = <KEY_HOME>;
+			wakeup-source;
+		};
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm8921_gpio 35 GPIO_ACTIVE_LOW>;
+			debounce-interval = <5>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+		};
+
+		key-volume-down {
+			label = "Volume Down";
+			gpios = <&pm8921_gpio 37 GPIO_ACTIVE_LOW>;
+			debounce-interval = <5>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			wakeup-source;
+		};
+	};
+
+	i2c-led {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm_pinmux 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm_pinmux 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led-controller@30 {
+			compatible = "panasonic,an30259a";
+			reg = <0x30>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				function = LED_FUNCTION_STATUS;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@2 {
+				reg = <2>;
+				function = LED_FUNCTION_STATUS;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@3 {
+				reg = <3>;
+				function = LED_FUNCTION_STATUS;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+
+	i2c-muic {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm_pinmux 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm_pinmux 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		max77693: pmic@66 {
+			compatible = "maxim,max77693";
+			reg = <0x66>;
+			interrupt-parent = <&tlmm_pinmux>;
+			interrupts = <55 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-0 = <&muic_int_default_state>;
+			pinctrl-names = "default";
+
+			muic: muic {
+				compatible = "maxim,max77693-muic";
+				safeout1-supply = <&esafeout1_reg>;
+				safeout2-supply = <&esafeout2_reg>;
+			};
+
+			regulators {
+				esafeout1_reg: ESAFEOUT1 {
+					regulator-name = "ESAFEOUT1";
+				};
+
+				esafeout2_reg: ESAFEOUT2 {
+					regulator-name = "ESAFEOUT2";
+				};
+			};
+		};
+	};
+};
+
+&gsbi7 {
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+
+	status = "okay";
+};
+
+&gsbi7_serial {
+	pinctrl-0 = <&gsbi7_uart_pin_a>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pm8821 {
+	interrupts-extended = <&tlmm_pinmux 76 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&pm8921 {
+	interrupts-extended = <&tlmm_pinmux 74 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&riva {
+	pinctrl-0 = <&riva_wlan_pin_a>, <&riva_bt_pin_a>, <&riva_fm_pin_a>;
+	pinctrl-names = "default";
+
+	vddcx-supply = <&pm8921_s3>;
+	vddmx-supply = <&pm8921_l24>;
+	vddpx-supply = <&pm8921_s4>;
+
+	status = "okay";
+
+	iris {
+		vddxo-supply = <&pm8921_l4>;
+		vddrfa-supply = <&pm8921_s2>;
+		vddpa-supply = <&pm8921_l10>;
+		vdddig-supply = <&pm8921_lvs2>;
+	};
+};
+
+&rpm {
+	regulators {
+		compatible = "qcom,rpm-pm8921-regulators";
+
+		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
+		vdd_l24-supply = <&pm8921_s1>;
+		vdd_l25-supply = <&pm8921_s1>;
+		vdd_l26-supply = <&pm8921_s7>;
+		vdd_l27-supply = <&pm8921_s7>;
+		vdd_l28-supply = <&pm8921_s7>;
+		vin_lvs1_3_6-supply = <&pm8921_s4>;
+		vin_lvs2-supply = <&pm8921_s1>;
+		vin_lvs4_5_7-supply = <&pm8921_s4>;
+
+		pm8921_l1: l1 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-always-on;
+			bias-pull-down;
+		};
+
+		/* mipi_dsi.1-dsi1_pll_vdda */
+		pm8921_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+
+		/* msm_otg-HSUSB_3p3 */
+		pm8921_l3: l3 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3500000>;
+			bias-pull-down;
+		};
+
+		/* msm_otg-HSUSB_1p8 */
+		pm8921_l4: l4 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		/* msm_sdcc.1-sdc_vdd */
+		pm8921_l5: l5 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		/* earjack_debug */
+		pm8921_l6: l6 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		/* mipi_dsi.1-dsi_vci */
+		pm8921_l8: l8 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		/* wcnss_wlan.0-iris_vddpa */
+		pm8921_l10: l10 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+			bias-pull-down;
+		};
+
+		/* mipi_dsi.1-dsi1_avdd */
+		pm8921_l11: l11 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+
+		/* touch_vdd */
+		pm8921_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		/* slimport_dvdd */
+		pm8921_l18: l18 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+			bias-pull-down;
+		};
+
+		/* touch_io */
+		pm8921_l22: l22 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		/*
+		 * mipi_dsi.1-dsi_vddio
+		 * pil_qdsp6v4.1-pll_vdd
+		 * pil_qdsp6v4.2-pll_vdd
+		 * msm_ehci_host.0-HSUSB_1p8
+		 * msm_ehci_host.1-HSUSB_1p8
+		 */
+		pm8921_l23: l23 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		/*
+		 * tabla2x-slim-CDC_VDDA_A_1P2V
+		 * tabla2x-slim-VDDD_CDC_D
+		 */
+		pm8921_l24: l24 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1150000>;
+			bias-pull-down;
+		};
+
+		pm8921_l25: l25 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+			regulator-always-on;
+			bias-pull-down;
+		};
+
+		pm8921_l26: l26 {
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-always-on;
+			bias-pull-down;
+		};
+
+		pm8921_l27: l27 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		pm8921_l28: l28 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			bias-pull-down;
+		};
+
+		/* wcnss_wlan.0-iris_vddio */
+		pm8921_lvs1: lvs1 {
+			bias-pull-down;
+		};
+
+		/* wcnss_wlan.0-iris_vdddig */
+		pm8921_lvs2: lvs2 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs3: lvs3 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs4: lvs4 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs5: lvs5 {
+			bias-pull-down;
+		};
+
+		/* mipi_dsi.1-dsi_iovcc */
+		pm8921_lvs6: lvs6 {
+			bias-pull-down;
+		};
+
+		/*
+		 * pil_riva-pll_vdd
+		 * lvds.0-lvds_vdda
+		 * mipi_dsi.1-dsi1_vddio
+		 * hdmi_msm.0-hdmi_vdda
+		 */
+		pm8921_lvs7: lvs7 {
+			bias-pull-down;
+		};
+
+		pm8921_ncp: ncp {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+		};
+
+		/* Buck SMPS */
+		pm8921_s1: s1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			qcom,switch-mode-frequency = <3200000>;
+			bias-pull-down;
+		};
+
+		pm8921_s2: s2 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		/* msm otg HSUSB_VDDCX */
+		pm8921_s3: s3 {
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1150000>;
+			qcom,switch-mode-frequency = <4800000>;
+			bias-pull-down;
+		};
+
+		/*
+		 * msm_sdcc.1-sdc-vdd_io
+		 * tabla2x-slim-CDC_VDDA_RX
+		 * tabla2x-slim-CDC_VDDA_TX
+		 * tabla2x-slim-CDC_VDD_CP
+		 * tabla2x-slim-VDDIO_CDC
+		 */
+		pm8921_s4: s4 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+			qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
+		};
+
+		/*
+		 * supply vdd_l26, vdd_l27, vdd_l28
+		 */
+		pm8921_s7: s7 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <3200000>;
+		};
+
+		pm8921_s8: s8 {
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2200000>;
+			qcom,switch-mode-frequency = <1600000>;
+		};
+	};
+};
+
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+
+	status = "okay";
+};
+
+&pm8921_gpio {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio30", "gpio35", "gpio37";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <PM8921_GPIO_S4>;
+	};
+};
+
+&tlmm_pinmux {
+	gsbi7_uart_pin_a: gsbi7-uart-pin-active-state {
+		rx-pins {
+			pins = "gpio83";
+			function = "gsbi7";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		tx-pins {
+			pins = "gpio82";
+			function = "gsbi7";
+			drive-strength = <4>;
+			bias-disable;
+		};
+	};
+
+	muic_int_default_state: muic-int-default-state {
+		pins = "gpio55";
+		function = "gpio";
+		drive-strength = <2>;
+		input-enable;
+		bias-disable;
+	};
+};
+
+&usb_hs1_phy {
+	v3p3-supply = <&pm8921_l3>;
+	v1p8-supply = <&pm8921_l4>;
+	extcon = <&muic>;
+};
+
+&usb1 {
+	dr_mode = "otg";
+	extcon = <&muic>, <&pm8921>;
+
+	status = "okay";
+};

-- 
2.43.0



