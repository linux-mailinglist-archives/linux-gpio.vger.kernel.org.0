Return-Path: <linux-gpio+bounces-36909-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN9XCgr4BmpUpwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36909-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:40:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6BC54D82F
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8913830CE8C8
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AD043C073;
	Fri, 15 May 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0Ih20V3a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE0B3D170D;
	Fri, 15 May 2026 10:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839585; cv=none; b=jazz/gILWkVvKUFpPvfwFiXqyJ9pl8eUJNNCTJ6obEtBVk5prE0TIe0cIvKiYQ2a8mkbtK3NEiJ62Fp8hdLfIliG2rt1U/c20AIKohTNOVbXsMqjCeEY3SgC4vZM4Ti3UBeItJpPxOCJptXExOBYFQq5UGz6ilkszj9NSMMH5oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839585; c=relaxed/simple;
	bh=Tt8o4wmWv7FBD8c1FR41Koq5aNB7M2BPgy0ZMMxct8g=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHul1zeThf5NLjb5Ro6fDmgw4E0Ir9WMWOeag7j7NEzxZSIDJTS3xgdETTNoFPhSjGRpjUp1kXZPyARjBpHfCZ1ybf8Ls5UYTSBuVPNN0tyVV5pZOzTFvre39IwGf0GIX/cAqdur3kRm4Q5SwJvIm8X9zQtoyVdRvDHVO8K/wzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0Ih20V3a; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778839584; x=1810375584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tt8o4wmWv7FBD8c1FR41Koq5aNB7M2BPgy0ZMMxct8g=;
  b=0Ih20V3aLTBrBl/UZ+1/PjcadnbxKih9tftWFW/0HPV196oe+6hqiszr
   ewpZRfqSrEoolqk6jrGqvc02nio4QOB8hAFbW2VZNNkBa68UmURaD7U9c
   Fx9au9aR3UgR+GFNiLQLAEfpdWXMGL7LnGaBwivL45CdKotYI38lj1peD
   wNkYkVtqFpi2GM+HPq4RcUdlMYToEQrguVzj1S3gcY4YvvWpher/6xpmw
   c6wDnuKstmpHQIL/8Pzx1Uv0JtdY7tjBVKw3kfXfU1DWJ5i5hKqkpVFQG
   BqxEZojjbWokzbiiae38lrBpB9cWTF2Vkj5UiCVQhonYTzLNn68wP/DPv
   g==;
X-CSE-ConnectionGUID: o9rrxM+iSRKeBuLs0oESHA==
X-CSE-MsgGUID: fQzx7hEJQgO9SWwp0ra30g==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="56789153"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 03:06:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Fri, 15 May 2026 03:06:21 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 03:06:18 -0700
Date: Fri, 15 May 2026 11:05:40 +0100
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
Subject: Re: [PATCH 0/9] riscv: ultrarisc: add DP1000 SoC DT and pinctrl
 support
Message-ID: <20260515-brink-dealer-d0610c0dbc7b@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Zg1zeyfmQCNl+VVp"
Content-Disposition: inline
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
X-Rspamd-Queue-Id: 2D6BC54D82F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36909-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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

--Zg1zeyfmQCNl+VVp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, May 15, 2026 at 09:17:56AM +0800, Jia Wang wrote:
> This series adds initial Devicetree support for the UltraRISC DP1000 RISC=
-V
> SoC and two DP1000-based boards (Milk-V Titan and Rongda M0).
>=20
> The series introduces the required DT bindings, adds the DP1000 pinctrl
> driver, and provides the initial SoC/board DTS files.
>=20
> Notes:
>   - Clocks are configured and enabled by firmware before Linux boots. Lin=
ux
>     does not manage clock rates or gating at runtime on this platform.
>     Therefore the initial DT only models the fixed clocks required by
>     standard drivers, and no clock controller/driver is provided.

I really disagree with this approach. In my experience it never ends up
working out and ends up being disruptive, because it is either an over
simplification of the clock tree and condenses multiple different clocks
into one where rates are similar or because firmware changes mean clock
rate changes down the line. I would much rather you modelled the clocks
accurately, even if that just means that a read-only clock controller is
implemented. Alternatively, if firmware does all of your clock control,
you can implement this using rpmi/mpoxy using clk-rpmi.c

>   - The DP1000 pinctrl binding supports two child node styles under the s=
ame
>     controller compatible:
>       * legacy DP1000-specific nodes using phandle-array properties
>         "pinctrl-pins" and "pinconf-pins"
>       * generic pinctrl nodes using "pins", "function" and generic pin
>         configuration properties
>     The legacy form is kept for compatibility with existing vendor DTs.

Why would we want "legacy" stuff in mainline when this is a brand new
platform? "legacy" vendor devicetrees are not something that mainline
cares about, sorry.

Additionally, these pinctrl patches should be sent standalone to the
pinctrl maintainers, they're likely to go through lots of revisions and
a different maintainer applies them.

>   - The bindings for "ultrarisc,dp1000-uart" and "ultrarisc,dp1000-pcie" =
are
>     being reviewed in separate series, since the DP1000 SoC DTS introduced
>     here uses those compatibles:
>     * Link: https://lore.kernel.org/lkml/20260429-ultrarisc-serial-v7-3-e=
475cce9e274@ultrarisc.com/
>     * Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-2-989=
35f6cdfb5@ultrarisc.com/
>   - ARCH_ULTRARISC support is being reviewed separately:
>     * Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-989=
35f6cdfb5@ultrarisc.com/

IMO, this patch needs to be in this series so that it compiles.

Cheers,
Conor.

>=20
> Testing:
>   - dt_binding_check and yamllint (all new/modified binding YAMLs)
>   - dtbs_check and dtbs (RISC-V, including dp1000-milkv-titan.dtb and
>     dp1000-rongda-m0.dtb)
>   - Kernel build for RISC-V and boot-tested on DP1000 (Milk-V Titan and
>     Rongda M0)
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
> Jia Wang (9):
>       dt-bindings: vendor-prefixes: add Rongda
>       dt-bindings: riscv: cpus: Add UltraRISC CP100 compatible
>       dt-bindings: riscv: Add UltraRISC DP1000 bindings
>       dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl bindings
>       riscv: dts: ultrarisc: Add initial device tree for UltraRISC DP1000
>       pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl driver
>       riscv: dts: ultrarisc: add Rongda M0 board device tree
>       riscv: dts: ultrarisc: add Milk-V Titan board device tree
>       riscv: defconfig: enable ARCH_ULTRARISC
>=20
>  .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 168 ++++
>  Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
>  .../devicetree/bindings/riscv/ultrarisc.yaml       |  27 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  MAINTAINERS                                        |  15 +
>  arch/riscv/boot/dts/Makefile                       |   1 +
>  arch/riscv/boot/dts/ultrarisc/Makefile             |   3 +
>  .../dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi  | 107 +++
>  .../boot/dts/ultrarisc/dp1000-milkv-titan.dts      | 182 +++++
>  .../dts/ultrarisc/dp1000-rongda-m0-pinctrl.dtsi    |  85 ++
>  arch/riscv/boot/dts/ultrarisc/dp1000-rongda-m0.dts | 111 +++
>  arch/riscv/boot/dts/ultrarisc/dp1000.dtsi          | 851 +++++++++++++++=
++++++
>  arch/riscv/configs/defconfig                       |   1 +
>  drivers/pinctrl/Kconfig                            |   1 +
>  drivers/pinctrl/Makefile                           |   1 +
>  drivers/pinctrl/ultrarisc/Kconfig                  |  23 +
>  drivers/pinctrl/ultrarisc/Makefile                 |   4 +
>  drivers/pinctrl/ultrarisc/pinctrl-dp1000.c         | 112 +++
>  drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.c      | 746 +++++++++++++++=
+++
>  drivers/pinctrl/ultrarisc/pinctrl-ultrarisc.h      |  71 ++
>  .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  65 ++
>  21 files changed, 2577 insertions(+)
> ---
> base-commit: 50897c955902c93ae71c38698abb910525ebdc89
> change-id: 20260316-ultrarisc-pinctrl-efa6e24c4803
>=20
> Best regards,
> -- =20
> Jia Wang <wangjia@ultrarisc.com>
>=20

--Zg1zeyfmQCNl+VVp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbv9AAKCRB4tDGHoIJi
0owyAP98o2Gi+WPgvPXDb2eegMxaGOqaR/US3qNCty4tHANZqgEA1vZfx3qOE2A4
JvyDT2lpoJ17eKlYt9elN5N+5alSIQI=
=6JcX
-----END PGP SIGNATURE-----

--Zg1zeyfmQCNl+VVp--

