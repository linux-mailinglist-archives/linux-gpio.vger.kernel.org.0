Return-Path: <linux-gpio+bounces-6989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE58D58CD
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 05:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA7191C218F4
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 03:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E584779B96;
	Fri, 31 May 2024 03:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ShTKNhQn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271447580A;
	Fri, 31 May 2024 03:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717124602; cv=none; b=cJz++ThR6CQQmOcCb9JDbsmZtcQ9TIeyVkFVSZ3kpPb64EbMYedlygphFSpj7MNdYCI5p7eannR6khUbkoZJYFTvZAA873l+3NsYoGTOqMGIpRWy9XpKtlF3Hwry6MICjxYOX8i+SJzheFyP5ux4ZwG3uQOAH1g7NbAAOU8ZJP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717124602; c=relaxed/simple;
	bh=laFNtMsFWaGO0tor3UYZWR+hz+iaDjqDjSLUrP6a4Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rF4zp0Usn3csjZCM3R7Iwb+fYdj5l0Em/8qkNgwfQ1g/YtuybHCBSKq1OD5FYpgVsAZjgccnbEldZdQzz8xwQxO71d3FnHS2xOguK9GFUrsUf7TAfXl2Bw5qNjYx4cUBYm4/2G7jw8+naumX0l4OeJK0mQjFc9LPV3zP2+AervY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=fail (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ShTKNhQn reason="signature verification failed"; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 79F58203FE;
	Fri, 31 May 2024 11:03:12 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717124593;
	bh=k1N7e/FjyGAeYdRbAGj1Fx0zqCZhv/g+FUwcaumYRs4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ShTKNhQnRUthkyPyWHBC1uP/46XIhgrddJloKwMvOfVX9Nj1zArKcGV2jxfz4jmGm
	 iYAGbiDTC1ZfSxUqOe0uKxSgH22IzXLUgn6Q65rxKPW7NKysvcZ2pwl8h41WKWveCW
	 nJlGcG87ika31jj0wSUIApQ5txiOTrn6JUC6GkfVCCuQQC1jSKenYqzatQhMHe3fwu
	 4OBNZWD0m85FXjiVYpFT8TrRtETaflznIWl7MlbpvYSlUrAmI4cS4y12PDKWgQYHiL
	 c4jkT5WOIKwjI5jgxbThLR/TdXO6mVo0L0LkPEoqvV3JnHYPMvuEJ4wJ6vVSbBw5Ka
	 ML+9Z2Uw52+HA==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Fri, 31 May 2024 12:32:49 +0930
Subject: [PATCH 3/3] dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Describe
 I3C, USB
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-3-a6fe2281a1b8@codeconstruct.com.au>
References: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
In-Reply-To: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

I3C1 and I3C2 become muxed functions in the mass production release of
the AST2600. Also document the USB2A device and USB2B HID mux options.

Squash warnings such as:

    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: pinctrl: usb2ad_default:function:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'ADC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1', 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPIT2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2', 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'LHPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACLINK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NR
 I4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PWM1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', 'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'SALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', 'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TACH1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', 'TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THRU1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', 'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', 'USB2AH', 'USB2AHP', 'USB
 2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3', 'WDTRST4']

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index d0a9cc2027f8..00b6974a5ed3 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -88,6 +88,8 @@ additionalProperties:
         - I2C7
         - I2C8
         - I2C9
+        - I3C1
+        - I3C2
         - I3C3
         - I3C4
         - I3C5
@@ -232,6 +234,8 @@ additionalProperties:
         - UART7
         - UART8
         - UART9
+        - USB11BHID
+        - USB2AD
         - USB2AH
         - USB2AHP
         - USB2BD
@@ -310,6 +314,8 @@ additionalProperties:
         - I2C7
         - I2C8
         - I2C9
+        - I3C1
+        - I3C2
         - I3C3
         - I3C4
         - I3C5

-- 
2.39.2


