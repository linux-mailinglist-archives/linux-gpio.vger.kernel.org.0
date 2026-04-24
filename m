Return-Path: <linux-gpio+bounces-35509-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DU4Jv6j62nIPgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35509-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 19:10:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C8461A64
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 19:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B51BF3026CA8
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 17:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F004133E346;
	Fri, 24 Apr 2026 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONhycMRj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC62033C1AD;
	Fri, 24 Apr 2026 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050118; cv=none; b=PVTXc/FOIpWTeQmCTBzxFWKEwsGEgvikJzTLP4ui3674RNVbAgr4GO9pH7sJwcyzh3RowuG+e+v/PnxcuzeUtu7xjH59E0KtiKhsTQXguoWnREz34I7pXuIZEZW9UyQDXdLoFr0EYpuEuDA5ROU45vt6CAwayjxH9Vv9remnN8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050118; c=relaxed/simple;
	bh=2GVsFCx4KosclkJej36I7xIXKXkZWqFz2ettm9BJffQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDNxG5ot3Y01tCYANzVR8X0LLDVy63PlUmMHYrUg76iq8zym6MHGHDDeG5e9pwlmQV2j+ClHNBEWZWeC36LHnR8ga9i//JX2glRjYyeLpXWcd1H71Au5cwXoBOMSAa16Jq5AXVT4lZOIBokMUoHE8SiRNvHIn4r8i0orIOEaLb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONhycMRj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41ABAC2BCB5;
	Fri, 24 Apr 2026 17:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050118;
	bh=2GVsFCx4KosclkJej36I7xIXKXkZWqFz2ettm9BJffQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONhycMRjKSNjYrHo7khtfvuuklElvJ8jLdxrHDsOSYsKQdV5nHhA32gUQzj7h42oD
	 qAtiTBJrhco9B4oEPpIUN/vDgAgjvfD3Z+x9AiqRDMm/Acj0NlHSmjmj0v/nDHYIYX
	 m2t1GZ7FgGckj2+bSUOKmtOIIwWdrYtHoiptiHAkz1pqcxAMt+eTzrH4kFnITDep20
	 y9YF2x9wRrq5KeBen38NHfBk2VTPY+NGLzqTqCUyntys8/K8rKfxUcS3mpcnJ39FkK
	 asW2bMAQAIDqdN9CQdQ2BTvjnMt4jXhuZgibSKZEO4aFN27aQH6+G2cQbHPVupE7ur
	 iCEGgJDiqqZog==
Date: Fri, 24 Apr 2026 18:01:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 20/20] riscv: dts: starfive: jhb100: Add pinctrl nodes
Message-ID: <20260424-bok-storm-4f4583686777@spud>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-21-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DqhoXpfq+UgDU/hi"
Content-Disposition: inline
In-Reply-To: <20260424111330.702272-21-changhuang.liang@starfivetech.com>
X-Rspamd-Queue-Id: 211C8461A64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35509-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]


--DqhoXpfq+UgDU/hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 04:13:30AM -0700, Changhuang Liang wrote:
> Add pinctrl nodes for starfive JHB100 SoC. They contain
> pinctrl_per0/pinctrl_per1/pinctrl_per2/pinctrl_per2pok/pinctrl_per3/
> pinctrl_sys0/pinctrl_sys0h/pinctrl_sys1/pinctrl_sys2.
>=20
> Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>

What did Lianfeng do? A signoff alone suggests something is incorrectly
attributed here.

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../boot/dts/starfive/jhb100-evb1-eth.dts     |  27 +++++
>  arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi |   4 +
>  .../boot/dts/starfive/jhb100-pinctrl.dtsi     |  19 ++++
>  arch/riscv/boot/dts/starfive/jhb100.dtsi      | 107 ++++++++++++++++++
>  4 files changed, 157 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts b/arch/risc=
v/boot/dts/starfive/jhb100-evb1-eth.dts
> index 62cd046e1224..f7e82f9d0ff1 100644
> --- a/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> +++ b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> @@ -4,3 +4,30 @@
>   */
> =20
>  #include "jhb100-evb1.dtsi"
> +
> +&pinctrl_per0 {
> +	gpioe-i3c0-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOB8-11, 32-33=
 */
> +	gpioe-i3c1-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOB12-15, 34-3=
5 */
> +	gpioe-i3c2-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOB16-23 */
> +	gpioe-i3c4-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOB36-43 */
> +};
> +
> +&pinctrl_per1 {
> +	gpioe-spi-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOC0-4 */
> +	gpioe-qspi0-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOC5-11 */
> +	gpioe-qspi1-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOC12-19 */
> +	gpioe-qspi2-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOC20-27 */
> +};
> +
> +&pinctrl_per2 {
> +	gpionw-vref =3D <JHB100_PINVREF_1_8V>; /* VREF for GPIOD19-30 */
> +};
> +
> +&pinctrl_per3 {
> +	gpios-vref =3D <JHB100_PINVREF_1_8V>; /* VREF for GPIOE0-10 */
> +};
> +
> +&pinctrl_sys2 {
> +	gpiow-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOA36-39 */
> +	gpiow-inner-vref =3D <JHB100_PINVREF_3_3V>; /* VREF for GPIOA40-43 */
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi b/arch/riscv/b=
oot/dts/starfive/jhb100-evb1.dtsi
> index 462b6fb7953b..acd5949bcfdb 100644
> --- a/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
> @@ -3,7 +3,9 @@
>   * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
>   */
> =20
> +#include "jhb100-pinfunc.h"
>  #include "jhb100.dtsi"
> +#include "jhb100-pinctrl.dtsi"
> =20
>  / {
>  	model =3D "StarFive JHB100 EVB-1";
> @@ -29,4 +31,6 @@ memory@40000000 {
> =20
>  &uart6 {
>  	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart6_pins>;
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi b/arch/risc=
v/boot/dts/starfive/jhb100-pinctrl.dtsi
> new file mode 100644
> index 000000000000..d12b79376521
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (c) 2025-2026 StarFive Technology Co., Ltd.
> + */
> +
> +&pinctrl_sys2 {
> +	uart6_pins: uart6-grp {
> +		uart6-tx-pins {
> +			pinmux =3D <PINMUX(PADNUM_SYS2_GPIO_A38,
> +					 FUNC_SYS2_UART6_TX)>;
> +		};
> +
> +		uart6-rx-pins {
> +			pinmux =3D <PINMUX(PADNUM_SYS2_GPIO_A39,
> +					 FUNC_SYS2_UART6_RX)>;
> +			input-enable;
> +		};
> +	};
> +};

Could we get some more examples, to exercise each pin controller?
Is that impossible without adding more peripherals other than uart?

Cheers,
Conor.

> diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/d=
ts/starfive/jhb100.dtsi
> index 700d00f800bc..74d427d7f2df 100644
> --- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
> @@ -425,6 +425,18 @@ per0crg: clock-controller@11a08000 {
>  				#reset-cells =3D <1>;
>  			};
> =20
> +			pinctrl_per0: pinctrl@11a0a000 {
> +				compatible =3D "starfive,jhb100-per0-pinctrl";
> +				reg =3D <0x0 0x11a0a000 0x0 0x1000>;
> +				resets =3D <&per0crg JHB100_PER0RST_GPIO_IOMUX_PRESETN>;
> +				interrupts =3D <60>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl_per0 0 0 60>;
> +			};
> +
>  			per1crg: clock-controller@11b40000 {
>  				compatible =3D "starfive,jhb100-per1crg";
>  				reg =3D <0x0 0x11b40000 0x0 0x1000>;
> @@ -440,6 +452,18 @@ per1crg: clock-controller@11b40000 {
>  				#reset-cells =3D <1>;
>  			};
> =20
> +			pinctrl_per1: pinctrl@11b42000 {
> +				compatible =3D "starfive,jhb100-per1-pinctrl";
> +				reg =3D <0x0 0x11b42000 0x0 0x800>;
> +				resets =3D <&per1crg JHB100_PER1RST_IOMUX_PRESETN>;
> +				interrupts =3D <61>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl_per1 0 0 36>;
> +			};
> +
>  			per2crg: clock-controller@11bc0000 {
>  				compatible =3D "starfive,jhb100-per2crg";
>  				reg =3D <0x0 0x11bc0000 0x0 0x1000>;
> @@ -461,6 +485,30 @@ per2crg: clock-controller@11bc0000 {
>  				#reset-cells =3D <1>;
>  			};
> =20
> +			pinctrl_per2: pinctrl@11bc2000 {
> +				compatible =3D "starfive,jhb100-per2-pinctrl";
> +				reg =3D <0x0 0x11bc2000 0x0 0x400>;
> +				resets =3D <&per2crg JHB100_PER2RST_IOMUX_PRESETN>;
> +				interrupts =3D <62>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl_per2 0 0 31>;
> +			};
> +
> +			pinctrl_per2pok: pinctrl@11bc2400 {
> +				compatible =3D "starfive,jhb100-per2pok-pinctrl";
> +				reg =3D <0x0 0x11bc2400 0x0 0x400>;
> +				resets =3D <&per2crg JHB100_PER2RST_POK_IOMUX_PRESETN>;
> +				interrupts =3D <63>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl_per2pok 0 0 18>;
> +			};
> +
>  			per3crg: clock-controller@11c40000 {
>  				compatible =3D "starfive,jhb100-per3crg";
>  				reg =3D <0x0 0x11c40000 0x0 0x1000>;
> @@ -480,6 +528,18 @@ per3crg: clock-controller@11c40000 {
>  				#reset-cells =3D <1>;
>  			};
> =20
> +			pinctrl_per3: pinctrl@11c42000 {
> +				compatible =3D "starfive,jhb100-per3-pinctrl";
> +				reg =3D <0x0 0x11c42000 0x0 0x1000>;
> +				resets =3D <&per3crg JHB100_PER3RST_IOMUX_PRESETN>;
> +				interrupts =3D <64>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl_per3 0 0 11>;
> +			};
> +
>  			sys0crg: clock-controller@13000000 {
>  				compatible =3D "starfive,jhb100-sys0crg";
>  				reg =3D <0x0 0x13000000 0x0 0x4000>;
> @@ -513,6 +573,53 @@ sys2crg: clock-controller@13008000 {
>  				#clock-cells =3D <1>;
>  				#reset-cells =3D <1>;
>  			};
> +
> +			pinctrl_sys0: pinctrl@13080000 {
> +				compatible =3D "starfive,jhb100-sys0-pinctrl";
> +				reg =3D <0x0 0x13080000 0x0 0x800>;
> +				resets =3D <&sys0crg JHB100_SYS0RST_SYS0_IOMUX_PRESETN>;
> +				interrupts =3D <56>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl_sys0 0 0 4>;
> +			};
> +
> +			pinctrl_sys0h: pinctrl@13080800 {
> +				compatible =3D "starfive,jhb100-sys0h-pinctrl";
> +				reg =3D <0x0 0x13080800 0x0 0x800>;
> +				resets =3D <&sys0crg JHB100_SYS0RST_SYS0H_IOMUX_PRESETN>;
> +				interrupts =3D <57>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl_sys0h 0 0 12>;
> +			};
> +
> +			pinctrl_sys1: pinctrl@13081000 {
> +				compatible =3D "starfive,jhb100-sys1-pinctrl";
> +				reg =3D <0x0 0x13081000 0x0 0x1000>;
> +				resets =3D <&sys1crg JHB100_SYS1RST_SYS1_IOMUX_PRESETN>;
> +				interrupts =3D <58>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl_sys1 0 0 8>;
> +			};
> +
> +			pinctrl_sys2: pinctrl@13082000 {
> +				compatible =3D "starfive,jhb100-sys2-pinctrl";
> +				reg =3D <0x0 0x13082000 0x0 0x1000>;
> +				interrupts =3D <59>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl_sys2 0 0 37>;
> +			};
>  		};
>  	};
>  };
> --=20
> 2.25.1
>=20

--DqhoXpfq+UgDU/hi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeuiAAAKCRB4tDGHoIJi
0rW5AP9ktwCVW5LRPVXVFklvVpQefHXwVkUhNzJjPS0ZMNA0LgEA9Imph0GBt+JF
fE6HN543JjjqciJ8ylRkVmuxVwhtpgQ=
=Y7fR
-----END PGP SIGNATURE-----

--DqhoXpfq+UgDU/hi--

