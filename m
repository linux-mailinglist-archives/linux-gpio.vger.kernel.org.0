Return-Path: <linux-gpio+bounces-7136-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E925B8FBC85
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 21:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D1A21C20F98
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 19:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051D114B061;
	Tue,  4 Jun 2024 19:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnRHsQUR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF2E13777D;
	Tue,  4 Jun 2024 19:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717529309; cv=none; b=SIAvbfh1rVXoKaVViE1rolLcXYLj26IxsPAcaYpaPKui1E6k4CPJyPD4WHuO58ZPWoVSAltVa9laorT5hLzdVdrUfoHFXjs4HRYhB0Lfn5FEotC8CZXi0vHbNnQHCS0tEhlMPBTREPYLS0SwHDOQG6f+bWIU1lsaNjGEgKa71bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717529309; c=relaxed/simple;
	bh=yHhhDzlKF7G9fNEWVYCNK4S9k0Vpn9UqS34WAkP/yZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WpjiX0mknEEP8Qv9IOyWaUjufxhWdfIqYoiW7o7cXbXrknMbVIQAZnt0hTgHEdo1x118B+xI4gpEcBWLUboCJBT5+cM/bcQBy+pKPtNOz6ee2cGHjg4EpnoZgCp6hXcUnE6/m/xALRQsSqnYAmc65S2I00PXswYR4ym5W+TGW5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnRHsQUR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A6BC2BBFC;
	Tue,  4 Jun 2024 19:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717529309;
	bh=yHhhDzlKF7G9fNEWVYCNK4S9k0Vpn9UqS34WAkP/yZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnRHsQURR862djue5zJjpjLjcKh9JCBLSihkDF3AkUsroMfcaMVj7x/t92zNGR/Or
	 EXQ9GpsVdJ0WqUWYUcAu/nbjc2hLd/LF9GE9c2HAOTjCyzFdZbN7Ue8PauJyMXkjVj
	 DacvAsT1AWIVZvD+OAprGqKIfUIl67a3URummRJRlThTg0EUW2gOFnZ7S9fpwB6Hyu
	 pqjD5L2ZSjjpPSiQIbGZI8rU3A1UxE+HjjokMcmmt8ifMq/dcb0l5rw10EYvRvUJDF
	 oPcbnkH3jUpUTkwyp5nf92bLd0G4lWiDEbxuJhi24buBFjzx6lo9n1TB6K7s12H+Wo
	 dJR2pqGFTpUfA==
Date: Tue, 4 Jun 2024 14:28:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
	Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: aspeed,ast2500-pinctrl:
 Describe SGPM
Message-ID: <171752930363.1149680.127041721707495986.robh@kernel.org>
References: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
 <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-2-a6fe2281a1b8@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-2-a6fe2281a1b8@codeconstruct.com.au>


On Fri, 31 May 2024 12:32:48 +0930, Andrew Jeffery wrote:
> Squash warnings such as:
>=20
>     arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: pinctrl@80: sgpm_def=
ault:groups:0: 'SGPM' is not one of ['ACPI', 'ADC0', 'ADC1', 'ADC10', 'ADC1=
1', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'AD=
C6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'DDCCLK', 'DDCDAT', 'ESPI', 'FWSPICS=
1', 'FWSPICS2', 'GPID0', 'GPID2', 'GPID4', 'GPID6', 'GPIE0', 'GPIE2', 'GPIE=
4', 'GPIE6', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C3', 'I2C4', '=
I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'LAD0', 'LAD1', 'LAD2', 'LAD3', 'LCL=
K', 'LFRAME', 'LPCHC', 'LPCPD', 'LPCPLUS', 'LPCPME', 'LPCRST', 'LPCSMI', 'L=
SIRQ', 'MAC1LINK', 'MAC2LINK', 'MDIO1', 'MDIO2', 'NCTS1', 'NCTS2', 'NCTS3',=
 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'N=
DSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', =
'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PNOR', 'PWM0', 'PW=
M1', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'RGMII1', 'RGMII2', 'R=
MII1', 'RMII2', 'RXD1', '
>  RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', =
'SALT14', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'S=
ALT9', 'SCL1', 'SCL2', 'SD1', 'SD2', 'SDA1', 'SDA2', 'SGPS1', 'SGPS2', 'SIO=
ONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIO=
SCI', 'SPI1', 'SPI1CS1', 'SPI1DEBUG', 'SPI1PASSTHRU', 'SPI2CK', 'SPI2CS0', =
'SPI2CS1', 'SPI2MISO', 'SPI2MOSI', 'TIMER3', 'TIMER4', 'TIMER5', 'TIMER6', =
'TIMER7', 'TIMER8', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART6', 'USB11BHID', '=
USB2AD', 'USB2AH', 'USB2BD', 'USB2BH', 'USBCKI', 'VGABIOSROM', 'VGAHS', 'VG=
AVS', 'VPI24', 'VPO', 'WDTRST1', 'WDTRST2']
>=20
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml | =
1 +
>  1 file changed, 1 insertion(+)
>=20

Acked-by: Rob Herring (Arm) <robh@kernel.org>


