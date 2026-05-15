Return-Path: <linux-gpio+bounces-36914-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGbPFn72BmpUpwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36914-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:33:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9354D677
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5E183038657
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B630A44103E;
	Fri, 15 May 2026 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vrfDlSvS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B44B429802;
	Fri, 15 May 2026 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840976; cv=none; b=co/OLztpoMJQNfTS1h789CUQGoDdl9N6yrlzqE7MHGp6rBmuEDii+VZxMbsgNgIx2+7inmCv3LGrf1yWHV1FJ8w3itgptc3NSnka1bx4z9qeI0YK3hcm2b4H05pWCKE5JsPfMYZZChYwITACVHe3WFG+yWVbqek6LbC1LMB7jr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840976; c=relaxed/simple;
	bh=nkuM2Sf1wZOAgpLMQwczjxbbHxEBXV42mJs4czexDiM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZjBkQqb80pyRmNIdyIE2Y5B4t2R+UE/jFxxJo58i3zwLPnDNJeiTeBUxFcawyCINZzR2gXEIP4wG/3Gv8qCTONREwEweSBTyxu2u1mZyzgwqagQoKno6XhKZiPxMnzXUPX4CN55ucxYdy0LfAb9BtseBO6bAk/75RyJixkp+P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=vrfDlSvS; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778840975; x=1810376975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nkuM2Sf1wZOAgpLMQwczjxbbHxEBXV42mJs4czexDiM=;
  b=vrfDlSvSxlKOPpG47zOBD8rat4NOi9z0Xb47udcvg9i3tBZu3+tWwWg9
   dwwOijuOgf5nvfYYDm2OGyUjpsQWhnbT+UiY4/+x49ZSkTxJTqrXiE6gT
   I4rlSfmHjNoNl54xX4q9RuNvjL86JlKhh8dqoiPgqwxNNP9HcnfyWLWgP
   igkaRmFk5hRovfIh8e/ZTIcvIMJ3g1td7WE724tplPXZHs9Cif+BIzhST
   kVCzlZDLZpD7t2EuJkoCGuYhWjCDaXZrZmUZZ8GxrENSw0XAMAgQ7d2nM
   QMKzKddpPqX4MAcDU+6aUU7pvaOwS+senARh5VJWhqXQrPZ+bC2uYJAaB
   g==;
X-CSE-ConnectionGUID: 5N7ot1SSRMOKRGHqqa0i7w==
X-CSE-MsgGUID: A19Up0eVRFG9aIc9Wm+zBQ==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="56789946"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 03:29:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 03:29:33 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 03:29:30 -0700
Date: Fri, 15 May 2026 11:28:52 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jia Wang <wangjia@ultrarisc.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Conor Dooley
	<conor@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 7/9] riscv: dts: ultrarisc: add Rongda M0 board device
 tree
Message-ID: <20260515-frisbee-clench-4029b6dd8169@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-7-bf559589ea8a@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zs1VOpITnaK5peJo"
Content-Disposition: inline
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-7-bf559589ea8a@ultrarisc.com>
X-Rspamd-Queue-Id: 34F9354D677
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36914-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

--zs1VOpITnaK5peJo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 09:18:03AM +0800, Jia Wang wrote:
> Rongda M0 is an mATX motherboard based on the UltraRISC DP1000 SoC.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  arch/riscv/boot/dts/Makefile                       |   1 +
>  arch/riscv/boot/dts/ultrarisc/Makefile             |   2 +
>  .../dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi    |  85 ++++++++++++++++
>  arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts | 111 +++++++++++++++=
++++++
>  4 files changed, 199 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 69d8751fb17c..702882974251 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -12,3 +12,4 @@ subdir-y +=3D spacemit
>  subdir-y +=3D starfive
>  subdir-y +=3D tenstorrent
>  subdir-y +=3D thead
> +subdir-y +=3D ultrarisc
> diff --git a/arch/riscv/boot/dts/ultrarisc/Makefile b/arch/riscv/boot/dts=
/ultrarisc/Makefile
> new file mode 100644
> index 000000000000..d01a770d3cba
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_ULTRARISC) +=3D dp1000-rongda-m0.dtb
> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi =
b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> new file mode 100644
> index 000000000000..101b416b1079
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include "dp1000.dtsi"
> +
> +&pmx0 {
> +	i2c0_pins: i2c0-pins {
> +		pins =3D "PA12", "PA13";
> +		function =3D "func0";

This is what I meant about func0 btw, and having this be "i2c" etc instead.
> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts b/arch/ri=
scv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> new file mode 100644
> index 000000000000..6f72d60ad55e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright(C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#include "dp1000-rongda-m0-pinctrl.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model =3D "Rongda M0 Board";
> +	compatible =3D "rongda,m0", "ultrarisc,dp1000";
> +
> +	aliases {
> +		serial0 =3D &uart0;
> +		serial1 =3D &uart1;
> +		serial2 =3D &uart2;
> +		serial3 =3D &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	gpio-poweroff {
> +		compatible =3D "gpio-poweroff";
> +		gpios =3D <&gpio_b 0 GPIO_ACTIVE_HIGH>;
> +		active-delay-ms =3D <100>;
> +
> +		status =3D "disabled";

Why bother adding the nodes if they are disabled? What enables them?

> +	};
> +
> +	gpio-restart {
> +		compatible =3D "gpio-restart";
> +		gpios =3D <&gpio_b 1 GPIO_ACTIVE_HIGH>;
> +		active-delay =3D <100>;
> +
> +		status =3D "disabled";
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_pins>;
> +};
> +
> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_pins>;
> +};
> +
> +&i2c2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c2_pins>;
> +
> +	rtc@32 {
> +		compatible =3D "whwave,sd3078";
> +		reg =3D <0x32>;
> +	};
> +};
> +
> +&i2c3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c3_pins>;
> +};
> +
> +&spi0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi0_pins>;
> +};
> +
> +&spi1 {
> +	num-cs =3D <1>;

Why is num-cs set at the board level here?

> +
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&spi1_pins>;
> +};
> +
> +&uart0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart0_pins>;
> +};
> +
> +&uart1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart1_pins>;
> +};
> +
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart2_pins>;
> +};
> +
> +&ethernet {
> +	phy-handle =3D <&phy0>;
> +	/*
> +	 * YT8531 RGMII timing on this board requires no PHY internal delays.
> +	 * Using "rgmii-id" together with rx/tx-internal-delay-ps results in RX=
 CRC
> +	 * errors and no usable traffic, so keep plain "rgmii" here.
> +	 */
> +	phy-mode =3D "rgmii";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		phy0: phy@0 {
> +			reg =3D <0x00>;
> +		};
> +	};
> +};
>=20
> --=20
> 2.34.1
>=20

--zs1VOpITnaK5peJo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagb1ZAAKCRB4tDGHoIJi
0o+fAQD9XS5KDJh/3QJQuSBXX+9SrfBNGTmsJNyM+6lvPdXtBAEA6pTrGaiA09d4
/FltcTWdd8tEr2ljtRwB4Uu0fWGGgQE=
=JFBV
-----END PGP SIGNATURE-----

--zs1VOpITnaK5peJo--

