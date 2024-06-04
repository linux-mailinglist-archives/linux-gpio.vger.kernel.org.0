Return-Path: <linux-gpio+bounces-7137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 032208FBC88
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 21:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 342AE1C20F98
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 19:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7254114AD32;
	Tue,  4 Jun 2024 19:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vK7F3jEG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE3E801;
	Tue,  4 Jun 2024 19:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717529328; cv=none; b=KY2eC0nfskoDFT7EvVb4+R4Ovq/an0BanCfSTmtPvYTeZCc8TgFjWc5+kDa/OW/18HuFz7oOVbg78ZmcyGtfm6jL7nW0HzJZntkp6q0GxT8vGfaUKoCI11Io0c5cBmiPYQuClB40Vjjg6ij0O2U1C/PaYzPRgE4lg4KVa7lgvGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717529328; c=relaxed/simple;
	bh=7/YcOy5Bf8pm94Kwy+b+flUypYkdMlrw6zcx/ybLGuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ybqw6b0WgXn8fAq2WP6ifmKDYgRvn1magPHGCq1AvvmXvvubCrPkHI47m9LxikWWjYZbihNGiHT2tg0xge9sVt63gzT/uAhtmTtz7IPzNpD0KIu9OIf+8bRRBbDg6Hn2zWhN87+4U8VhLXz/JESMZx2Iuo+4v8CEvCKthE0aJ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vK7F3jEG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79729C4AF07;
	Tue,  4 Jun 2024 19:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717529327;
	bh=7/YcOy5Bf8pm94Kwy+b+flUypYkdMlrw6zcx/ybLGuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vK7F3jEGOjMbKRZze0jBxvQ//AVTxTuyb+zDGaNWmASMZLHJSKK6opW4zt9ThqqGS
	 YP8yXb6UeS+dNo9xrrMjsAXCpNnMMqShGQW+udQCzhEQ520sDsDy9fPNywWxypWEJY
	 vANanpCnS9hhUCvb64WlYdqF4awaf3DskFK2+sPplxQtUFJHSR/ipnLLJaTybrnAD1
	 CVj/6S1tEMJA+8J5Z890PfFpOUNJPi/X5JML9a0RrOzKGejMNbKK33y+gyYksBoF1M
	 B4zQ4tPepefkaEY8ccktPzR4eFyvEoTT05NW9A64PE81KWhhGaJe1Xb4Nz8vSZGV3c
	 EZeDWmIslG5xg==
Date: Tue, 4 Jun 2024 14:28:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
	linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] dt-bindings: pinctrl: aspeed,ast2600-pinctrl:
 Describe I3C, USB
Message-ID: <171752932281.1150170.5170215514575189840.robh@kernel.org>
References: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
 <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-3-a6fe2281a1b8@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-3-a6fe2281a1b8@codeconstruct.com.au>


On Fri, 31 May 2024 12:32:49 +0930, Andrew Jeffery wrote:
> I3C1 and I3C2 become muxed functions in the mass production release of
> the AST2600. Also document the USB2A device and USB2B HID mux options.
>=20
> Squash warnings such as:
>=20
>     arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: pinctrl: usb=
2ad_default:function:0: 'USB2AD' is not one of ['ADC0', 'ADC1', 'ADC10', 'A=
DC11', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', =
'ADC6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'EMMC', 'ESPI', 'ESPIALT', 'FSI1'=
, 'FSI2', 'FWQSPI', 'FWSPIABR', 'FWSPID', 'FWSPIWP', 'GPIT0', 'GPIT1', 'GPI=
T2', 'GPIT3', 'GPIT4', 'GPIT5', 'GPIT6', 'GPIT7', 'GPIU0', 'GPIU1', 'GPIU2'=
, 'GPIU3', 'GPIU4', 'GPIU5', 'GPIU6', 'GPIU7', 'I2C1', 'I2C10', 'I2C11', 'I=
2C12', 'I2C13', 'I2C14', 'I2C15', 'I2C16', 'I2C2', 'I2C3', 'I2C4', 'I2C5', =
'I2C6', 'I2C7', 'I2C8', 'I2C9', 'I3C3', 'I3C4', 'I3C5', 'I3C6', 'JTAGM', 'L=
HPD', 'LHSIRQ', 'LPC', 'LPCHC', 'LPCPD', 'LPCPME', 'LPCSMI', 'LSIRQ', 'MACL=
INK1', 'MACLINK2', 'MACLINK3', 'MACLINK4', 'MDIO1', 'MDIO2', 'MDIO3', 'MDIO=
4', 'NCTS1', 'NCTS2', 'NCTS3', 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4',=
 'NDSR1', 'NDSR2', 'NDSR3', 'NDSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'N=
RI1', 'NRI2', 'NRI3', 'NR
>  I4', 'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PWM0', 'PW=
M1', 'PWM10', 'PWM11', 'PWM12', 'PWM13', 'PWM14', 'PWM15', 'PWM2', 'PWM3', =
'PWM4', 'PWM5', 'PWM6', 'PWM7', 'PWM8', 'PWM9', 'RGMII1', 'RGMII2', 'RGMII3=
', 'RGMII4', 'RMII1', 'RMII2', 'RMII3', 'RMII4', 'RXD1', 'RXD2', 'RXD3', 'R=
XD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', 'SALT14', 'SALT15', =
'SALT16', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'S=
ALT9', 'SD1', 'SD2', 'SGPM1', 'SGPM2', 'SGPS1', 'SGPS2', 'SIOONCTRL', 'SIOP=
BI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIOSCI', 'SPI1', =
'SPI1ABR', 'SPI1CS1', 'SPI1WP', 'SPI2', 'SPI2CS1', 'SPI2CS2', 'TACH0', 'TAC=
H1', 'TACH10', 'TACH11', 'TACH12', 'TACH13', 'TACH14', 'TACH15', 'TACH2', '=
TACH3', 'TACH4', 'TACH5', 'TACH6', 'TACH7', 'TACH8', 'TACH9', 'THRU0', 'THR=
U1', 'THRU2', 'THRU3', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART10', 'UART11', =
'UART12', 'UART13', 'UART6', 'UART7', 'UART8', 'UART9', 'USBAD', 'USBADP', =
'USB2AH', 'USB2AHP', 'USB
>  2BD', 'USB2BH', 'VB', 'VGAHS', 'VGAVS', 'WDTRST1', 'WDTRST2', 'WDTRST3',=
 'WDTRST4']
>=20
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml         | 6 =
++++++
>  1 file changed, 6 insertions(+)
>=20

Acked-by: Rob Herring (Arm) <robh@kernel.org>


