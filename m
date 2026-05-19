Return-Path: <linux-gpio+bounces-37142-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC0mKkVFDGrQcQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37142-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:11:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235657D3FD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 13:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E342D324478B
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 10:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643FA48AE11;
	Tue, 19 May 2026 10:38:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227003F0766;
	Tue, 19 May 2026 10:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.20.114.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187116; cv=none; b=qdyRK6xM2UbxmVy0mnIO7hrfKbxAJSf/dB26XilDeKShgbcWmnphTFDCWouPVUeEoEOQk1djsT7dkLesRqOhMed3rID7FVtFzA/D24rBIrnhbpnKRtrSnTPKSX5x7yBG0ze9XaKkXfVErXm9rnqvmPsSTlaYneZqvMbI2WPisu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187116; c=relaxed/simple;
	bh=vV2WiFb2H74twU92hl4oii+HoreUae5mnrMekDfF394=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=U9QSpI1W6dUoGuQfamFm/5DzEQXvoVVTS95zzheUf+lJiU21aRH+KAvj7h9acpYiah3W1iGpXIhY/NruCGKQFiZ7SCW0GHmexI4Yc+Iip08GQRWrx9whSLe2Y72r+F/GaWWBt/rL7v+RnKWTTFB6pZpUVd56LUME1/7C9nOznJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=none smtp.client-ip=211.20.114.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 19 May
 2026 18:38:20 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 19 May 2026 18:38:20 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 19 May 2026 18:38:13 +0800
Subject: [PATCH v4 2/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc1-pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260519-pinctrl-single-bit-v4-2-5fe568a8ffde@aspeedtech.com>
References: <20260519-pinctrl-single-bit-v4-0-5fe568a8ffde@aspeedtech.com>
In-Reply-To: <20260519-pinctrl-single-bit-v4-0-5fe568a8ffde@aspeedtech.com>
To: Linus Walleij <linusw@kernel.org>, Tony Lindgren <tony@atomide.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, "Lee
 Jones" <lee@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
CC: <patrickw3@meta.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<BMC-SW@aspeedtech.com>, <openbmc@lists.ozlabs.org>, Andrew Jeffery
	<andrew@aj.id.au>, <linux-clk@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779187100; l=16514;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=vV2WiFb2H74twU92hl4oii+HoreUae5mnrMekDfF394=;
 b=rvkr6k95X19Ngzcq/JZX7TnRh/TZnwST6Wtdkxc3q4W0c7qvKVprGzMXr/Cu5k6QwTxwTMerK
 xglLOToVM91DQediC9xtbR0ofQvXZ4OoyVCjJv27kCOgDhTWP9s0FTg
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-gpio@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37142-lists,linux-gpio=lfdr.de];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url,microchip.com:email,0.0.1.144:email,aspeedtech.com:mid,aspeedtech.com:email]
X-Rspamd-Queue-Id: 2235657D3FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SoC1 in the AST2700 integrates its own pin controller responsible for
pin multiplexing and pin configuration.

The controller manages various peripheral functions such as eSPI, LPC,
VPI, SD, UART, I2C, I3C, PWM and others through SCU registers.

The binding reuses the standard pinmux and generic pin configuration
schemas and does not introduce custom Devicetree properties.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 .../pinctrl/aspeed,ast2700-soc1-pinctrl.yaml       | 760 +++++++++++++++++++++
 1 file changed, 760 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
new file mode 100644
index 000000000000..76944fd14e2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml
@@ -0,0 +1,760 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/aspeed,ast2700-soc1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASPEED AST2700 SoC1 Pin Controller
+
+maintainers:
+  - Billy Tsai <billy_tsai@aspeedtech.com>
+
+description:
+  The AST2700 features a dual-SoC architecture with two interconnected SoCs,
+  each having its own System Control Unit (SCU) for independent pin control.
+  This pin controller manages the pin multiplexing for SoC1.
+
+  The SoC1 pin controller manages pin functions including eSPI, LPC and I2C,
+  among others.
+
+properties:
+  compatible:
+    const: aspeed,ast2700-soc1-pinctrl
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '-state$':
+    description: |
+      Pin control state.
+
+      If `function` is present, the node describes a pinmux state and must
+      specify `groups`.
+
+      For pin configuration, exactly one of `groups` or `pins` must be
+      specified in each state node. Group-level configuration applies to all
+      pins in the group. Pin-level configuration may be supplied in a
+      separate state node for individual pins; when both group-level and
+      pin-level configuration apply to the same pin, the pin-level
+      configuration takes precedence.
+
+    type: object
+    allOf:
+      - $ref: pinmux-node.yaml#
+      - $ref: pincfg-node.yaml#
+      - if:
+          required:
+            - function
+        then:
+          required:
+            - groups
+      - oneOf:
+          - required:
+              - groups
+          - required:
+              - pins
+    additionalProperties: false
+
+    properties:
+      function:
+        enum:
+          - ADC0
+          - ADC1
+          - ADC10
+          - ADC11
+          - ADC12
+          - ADC13
+          - ADC14
+          - ADC15
+          - ADC2
+          - ADC3
+          - ADC4
+          - ADC5
+          - ADC6
+          - ADC7
+          - ADC8
+          - ADC9
+          - AUXPWRGOOD0
+          - AUXPWRGOOD1
+          - CANBUS
+          - ESPI0
+          - ESPI1
+          - FSI0
+          - FSI1
+          - FSI2
+          - FSI3
+          - FWQSPI
+          - FWSPIABR
+          - FWWPN
+          - HBLED
+          - I2C0
+          - I2C1
+          - I2C10
+          - I2C11
+          - I2C12
+          - I2C13
+          - I2C14
+          - I2C15
+          - I2C2
+          - I2C3
+          - I2C4
+          - I2C5
+          - I2C6
+          - I2C7
+          - I2C8
+          - I2C9
+          - I2CF0
+          - I2CF1
+          - I2CF2
+          - I3C0
+          - I3C1
+          - I3C10
+          - I3C11
+          - I3C12
+          - I3C13
+          - I3C14
+          - I3C15
+          - I3C2
+          - I3C3
+          - I3C4
+          - I3C5
+          - I3C6
+          - I3C7
+          - I3C8
+          - I3C9
+          - JTAGM1
+          - LPC0
+          - LPC1
+          - LTPI
+          - MACLINK0
+          - MACLINK1
+          - MACLINK2
+          - MDIO0
+          - MDIO1
+          - MDIO2
+          - NCTS0
+          - NCTS1
+          - NCTS5
+          - NCTS6
+          - NDCD0
+          - NDCD1
+          - NDCD5
+          - NDCD6
+          - NDSR0
+          - NDSR1
+          - NDSR5
+          - NDSR6
+          - NDTR0
+          - NDTR1
+          - NDTR5
+          - NDTR6
+          - NRI0
+          - NRI1
+          - NRI5
+          - NRI6
+          - NRTS0
+          - NRTS1
+          - NRTS5
+          - NRTS6
+          - OSCCLK
+          - PCIERC
+          - PWM0
+          - PWM1
+          - PWM10
+          - PWM11
+          - PWM12
+          - PWM13
+          - PWM14
+          - PWM15
+          - PWM2
+          - PWM3
+          - PWM4
+          - PWM5
+          - PWM6
+          - PWM7
+          - PWM8
+          - PWM9
+          - QSPI0
+          - QSPI1
+          - QSPI2
+          - RGMII0
+          - RGMII1
+          - RMII0
+          - RMII0RCLKO
+          - RMII1
+          - RMII1RCLKO
+          - SALT0
+          - SALT1
+          - SALT10
+          - SALT11
+          - SALT12
+          - SALT13
+          - SALT14
+          - SALT15
+          - SALT2
+          - SALT3
+          - SALT4
+          - SALT5
+          - SALT6
+          - SALT7
+          - SALT8
+          - SALT9
+          - SD
+          - SGMII
+          - SGPM0
+          - SGPM1
+          - SGPS
+          - SIOONCTRLN0
+          - SIOONCTRLN1
+          - SIOPBIN0
+          - SIOPBIN1
+          - SIOPBON0
+          - SIOPBON1
+          - SIOPWREQN0
+          - SIOPWREQN1
+          - SIOPWRGD1
+          - SIOS3N0
+          - SIOS3N1
+          - SIOS5N0
+          - SIOS5N1
+          - SIOSCIN0
+          - SIOSCIN1
+          - SMON0
+          - SMON1
+          - SPI0
+          - SPI0ABR
+          - SPI0CS1
+          - SPI0WPN
+          - SPI1
+          - SPI1ABR
+          - SPI1CS1
+          - SPI1WPN
+          - SPI2
+          - SPI2CS1
+          - TACH0
+          - TACH1
+          - TACH10
+          - TACH11
+          - TACH12
+          - TACH13
+          - TACH14
+          - TACH15
+          - TACH2
+          - TACH3
+          - TACH4
+          - TACH5
+          - TACH6
+          - TACH7
+          - TACH8
+          - TACH9
+          - THRU0
+          - THRU1
+          - THRU2
+          - THRU3
+          - UART0
+          - UART1
+          - UART10
+          - UART11
+          - UART2
+          - UART3
+          - UART5
+          - UART6
+          - UART7
+          - UART8
+          - UART9
+          - USB2C
+          - USB2D
+          - USBUART
+          - VGA
+          - VPI
+          - WDTRST0N
+          - WDTRST1N
+          - WDTRST2N
+          - WDTRST3N
+          - WDTRST4N
+          - WDTRST5N
+          - WDTRST6N
+          - WDTRST7N
+
+      groups:
+        enum:
+          - ADC0
+          - ADC1
+          - ADC10
+          - ADC11
+          - ADC12
+          - ADC13
+          - ADC14
+          - ADC15
+          - ADC2
+          - ADC3
+          - ADC4
+          - ADC5
+          - ADC6
+          - ADC7
+          - ADC8
+          - ADC9
+          - AUXPWRGOOD0
+          - AUXPWRGOOD1
+          - CANBUS
+          - DI2C0
+          - DI2C1
+          - DI2C10
+          - DI2C11
+          - DI2C12
+          - DI2C13
+          - DI2C14
+          - DI2C15
+          - DI2C2
+          - DI2C3
+          - DI2C8
+          - DI2C9
+          - DSGPM0
+          - ESPI0
+          - ESPI1
+          - FSI0
+          - FSI1
+          - FSI2
+          - FSI3
+          - FWQSPI
+          - FWSPIABR
+          - FWWPN
+          - HBLED
+          - HVI3C0
+          - HVI3C1
+          - HVI3C12
+          - HVI3C13
+          - HVI3C14
+          - HVI3C15
+          - HVI3C2
+          - HVI3C3
+          - I2C0
+          - I2C1
+          - I2C10
+          - I2C11
+          - I2C12
+          - I2C13
+          - I2C14
+          - I2C15
+          - I2C2
+          - I2C3
+          - I2C4
+          - I2C5
+          - I2C6
+          - I2C7
+          - I2C8
+          - I2C9
+          - I2CF0
+          - I2CF1
+          - I2CF2
+          - I3C10
+          - I3C11
+          - I3C4
+          - I3C5
+          - I3C6
+          - I3C7
+          - I3C8
+          - I3C9
+          - JTAGM1
+          - LPC0
+          - LPC1
+          - LTPI
+          - LTPI_PS_I2C0
+          - LTPI_PS_I2C1
+          - LTPI_PS_I2C2
+          - LTPI_PS_I2C3
+          - MACLINK0
+          - MACLINK1
+          - MACLINK2
+          - MDIO0
+          - MDIO1
+          - MDIO2
+          - NCTS0
+          - NCTS1
+          - NCTS5
+          - NCTS6
+          - NDCD0
+          - NDCD1
+          - NDCD5
+          - NDCD6
+          - NDSR0
+          - NDSR1
+          - NDSR5
+          - NDSR6
+          - NDTR0
+          - NDTR1
+          - NDTR5
+          - NDTR6
+          - NRI0
+          - NRI1
+          - NRI5
+          - NRI6
+          - NRTS0
+          - NRTS1
+          - NRTS5
+          - NRTS6
+          - OSCCLK
+          - PE2SGRSTN
+          - PWM0
+          - PWM1
+          - PWM10
+          - PWM11
+          - PWM12
+          - PWM13
+          - PWM14
+          - PWM15
+          - PWM2
+          - PWM3
+          - PWM4
+          - PWM5
+          - PWM6
+          - PWM7
+          - PWM8
+          - PWM9
+          - QSPI0
+          - QSPI1
+          - QSPI2
+          - RGMII0
+          - RGMII1
+          - RMII0
+          - RMII0RCLKO
+          - RMII1
+          - RMII1RCLKO
+          - SALT0
+          - SALT1
+          - SALT10
+          - SALT11
+          - SALT12
+          - SALT13
+          - SALT14
+          - SALT15
+          - SALT2
+          - SALT3
+          - SALT4
+          - SALT5
+          - SALT6
+          - SALT7
+          - SALT8
+          - SALT9
+          - SD
+          - SGMII
+          - SGPM0
+          - SGPM1
+          - SGPS
+          - SIOONCTRLN0
+          - SIOONCTRLN1
+          - SIOPBIN0
+          - SIOPBIN1
+          - SIOPBON0
+          - SIOPBON1
+          - SIOPWREQN0
+          - SIOPWREQN1
+          - SIOPWRGD1
+          - SIOS3N0
+          - SIOS3N1
+          - SIOS5N0
+          - SIOS5N1
+          - SIOSCIN0
+          - SIOSCIN1
+          - SMON0
+          - SMON1
+          - SPI0
+          - SPI0ABR
+          - SPI0CS1
+          - SPI0WPN
+          - SPI1
+          - SPI1ABR
+          - SPI1CS1
+          - SPI1WPN
+          - SPI2
+          - SPI2CS1
+          - TACH0
+          - TACH1
+          - TACH10
+          - TACH11
+          - TACH12
+          - TACH13
+          - TACH14
+          - TACH15
+          - TACH2
+          - TACH3
+          - TACH4
+          - TACH5
+          - TACH6
+          - TACH7
+          - TACH8
+          - TACH9
+          - THRU0
+          - THRU1
+          - THRU2
+          - THRU3
+          - UART0
+          - UART1
+          - UART10
+          - UART11
+          - UART2
+          - UART3
+          - UART5
+          - UART6
+          - UART7
+          - UART8
+          - UART9
+          - USB2CD
+          - USB2CH
+          - USB2CU
+          - USB2CUD
+          - USB2DD
+          - USB2DH
+          - USBUART
+          - VGA
+          - VPI
+          - WDTRST0N
+          - WDTRST1N
+          - WDTRST2N
+          - WDTRST3N
+          - WDTRST4N
+          - WDTRST5N
+          - WDTRST6N
+          - WDTRST7N
+
+      pins:
+        enum:
+          - A14
+          - A15
+          - A18
+          - A19
+          - A21
+          - A22
+          - A23
+          - A24
+          - A25
+          - A26
+          - A6
+          - A7
+          - A8
+          - AA12
+          - AA13
+          - AA14
+          - AA15
+          - AA16
+          - AA17
+          - AA18
+          - AA20
+          - AA21
+          - AA22
+          - AA23
+          - AA24
+          - AA25
+          - AA26
+          - AB15
+          - AB16
+          - AB17
+          - AB18
+          - AB19
+          - AB20
+          - AB21
+          - AB22
+          - AB23
+          - AB24
+          - AB25
+          - AB26
+          - AC15
+          - AC16
+          - AC17
+          - AC18
+          - AC19
+          - AC20
+          - AC22
+          - AC24
+          - AC25
+          - AC26
+          - AD15
+          - AD16
+          - AD17
+          - AD18
+          - AD19
+          - AD20
+          - AD22
+          - AD25
+          - AD26
+          - AE16
+          - AE17
+          - AE18
+          - AE19
+          - AE20
+          - AE21
+          - AE23
+          - AE25
+          - AE26
+          - AF16
+          - AF17
+          - AF18
+          - AF19
+          - AF20
+          - AF21
+          - AF23
+          - AF25
+          - AF26
+          - B10
+          - B11
+          - B12
+          - B13
+          - B14
+          - B15
+          - B16
+          - B18
+          - B19
+          - B21
+          - B22
+          - B23
+          - B24
+          - B25
+          - B26
+          - B6
+          - B7
+          - B8
+          - B9
+          - C10
+          - C11
+          - C12
+          - C13
+          - C14
+          - C15
+          - C16
+          - C17
+          - C18
+          - C19
+          - C20
+          - C23
+          - C26
+          - C6
+          - C7
+          - C8
+          - C9
+          - D10
+          - D12
+          - D14
+          - D15
+          - D19
+          - D20
+          - D24
+          - D26
+          - D7
+          - D8
+          - D9
+          - E10
+          - E11
+          - E12
+          - E13
+          - E14
+          - E26
+          - E7
+          - E8
+          - E9
+          - F10
+          - F11
+          - F12
+          - F13
+          - F14
+          - F26
+          - F7
+          - F8
+          - F9
+          - G10
+          - G11
+          - G7
+          - G8
+          - G9
+          - H10
+          - H11
+          - H7
+          - H8
+          - H9
+          - J10
+          - J11
+          - J12
+          - J13
+          - J9
+          - K12
+          - K13
+          - L12
+          - M13
+          - M14
+          - M15
+          - M16
+          - N13
+          - N14
+          - N15
+          - N25
+          - N26
+          - P13
+          - P14
+          - P25
+          - P26
+          - R14
+          - R25
+          - R26
+          - T23
+          - T24
+          - U21
+          - U22
+          - U25
+          - U26
+          - V14
+          - V16
+          - V17
+          - V18
+          - V19
+          - V20
+          - V21
+          - V22
+          - V23
+          - V24
+          - W14
+          - W16
+          - W17
+          - W18
+          - W20
+          - W21
+          - W22
+          - W25
+          - W26
+          - Y11
+          - Y15
+          - Y16
+          - Y17
+          - Y18
+          - Y20
+          - Y21
+          - Y22
+          - Y23
+          - Y24
+          - Y25
+          - Y26
+
+      drive-strength:
+        enum: [4, 8, 12, 16]
+
+      bias-disable: true
+      bias-pull-up: true
+      bias-pull-down: true
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    pinctrl@400 {
+        compatible = "aspeed,ast2700-soc1-pinctrl";
+        reg = <0x400 0x2A0>;
+        sgpm0-state {
+            function = "SGPM0";
+            groups = "SGPM0";
+        };
+    };

-- 
2.34.1


