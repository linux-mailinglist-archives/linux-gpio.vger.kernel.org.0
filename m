Return-Path: <linux-gpio+bounces-36911-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HJcBhLyBmohpQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36911-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:14:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D888954D201
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFAF4300D4E1
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B4E43E9F8;
	Fri, 15 May 2026 10:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wvO9zBa+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A7B3CF664;
	Fri, 15 May 2026 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778839730; cv=none; b=a2WBsrZg6G6QgACTdEo6kPWA4OHQx2SJJ/2n8sbZEQjsTjKHYh9K0vO2Cqi2Ychl2APjOgEydg7Yfiw18G0NbW/8wetKK9x4U4RZ6riM8N5PFGWPkWLVHtSeHMaAD0MhorGDsaTnrrSFRO+ff8XXcxRBFdQljsQCgAe6RI95zww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778839730; c=relaxed/simple;
	bh=68cBE+E7krc/yQQ7bawOf+XK6T02GAKG9lPaqwKTlQM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eq3OlXBksdUZLe7+88gz0MpaCt7+Mw/iS8UXcS9NbvovI6uBG5ptrNXyjdqyF6e+1pTl5WYb+RCAYdBArY2l3wHU7q1ncpdQUuKak/BPoUxz8iJHhPEO4STgyedzp6+w1V/83hKkkN4TdQ+M+a4pDcKu8Bty4jyCXA267cwbAB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=wvO9zBa+; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778839728; x=1810375728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=68cBE+E7krc/yQQ7bawOf+XK6T02GAKG9lPaqwKTlQM=;
  b=wvO9zBa+3o1UlU+PC3+g0krPAjYW/qw08QOZlYPJRB7eMjc7IIdndgOi
   boLWGXyhS9+8J3AO8HP7G3T4jMzIRMUYPBTJHaNxKu/4gkKX6UKLsN8zI
   S1pPSNFC++xxRZgcoCe29DKzsbnCj/ABBmYs+QvDW0e3D/dqkxk5eRDFw
   xpsxLu3zWsWaKL8gZfNWd4O5QEttwfpv3TaAbwo2DuSnDHjKd8jzITiF8
   4gNKs1F6uwX27sQOgLRcLS0ugrOme0e5ZPv7ltPvg4U8WeJf0z4RoYXn/
   1dv/MMf6i/2JCZKw/L52GIRS5YN0Lk5jEe2csSgRIexZRFza0zKEwN4CN
   g==;
X-CSE-ConnectionGUID: MwkWFtK8Tc6INnEjCwjUfQ==
X-CSE-MsgGUID: fet69JvFQE2z7lxPetrrqg==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="66243734"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 03:08:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 03:08:47 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 03:08:44 -0700
Date: Fri, 15 May 2026 11:08:06 +0100
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
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add UltraRISC DP1000 bindings
Message-ID: <20260515-cyclic-frequency-50d690821af1@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-3-bf559589ea8a@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aCKnMLL/2dELPqOT"
Content-Disposition: inline
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-3-bf559589ea8a@ultrarisc.com>
X-Rspamd-Queue-Id: D888954D201
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
	TAGGED_FROM(0.00)[bounces-36911-lists,linux-gpio=lfdr.de];
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

--aCKnMLL/2dELPqOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 09:17:59AM +0800, Jia Wang wrote:
> Add DT binding documentation for the UltraRISC DP1000 SoC.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../devicetree/bindings/riscv/ultrarisc.yaml       | 27 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  6 +++++
>  2 files changed, 33 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/ultrarisc.yaml b/Doc=
umentation/devicetree/bindings/riscv/ultrarisc.yaml
> new file mode 100644
> index 000000000000..d4421c2ef945
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/ultrarisc.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/ultrarisc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UltraRISC SoC-based boards
> +
> +maintainers:
> +  - Jia Wang <wangjia@ultrarisc.com>
> +
> +description:
> +  UltraRISC DP1000 SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - rongda,m0
> +              - milkv,titan
> +          - const: ultrarisc,dp1000
> +
> +additionalProperties: true
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b2040011a386..5bf971ff48b2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23082,6 +23082,12 @@ F:	include/dt-bindings/power/thead,th1520-power.h
>  F:	include/dt-bindings/reset/thead,th1520-reset.h
>  F:	include/linux/firmware/thead/thead,th1520-aon.h
> =20
> +RISC-V ULTRARISC SoC SUPPORT
> +M:	Jia Wang <wangjia@ultrarisc.com>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained

You work for ultrasoc, probably this should be "Supported".

> +F:	Documentation/devicetree/bindings/riscv/ultrarisc.yaml

There's no git tree here where patches for the platform will be applied
before sending them on to the SoC maintainers. Are you expecting me to
apply patches for this platform?

> +
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
>  M:	Jack Wang <jinpu.wang@ionos.com>
>=20
> --=20
> 2.34.1
>=20

--aCKnMLL/2dELPqOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbwhgAKCRB4tDGHoIJi
0vFDAP9/U7yDOql0mWJq913tte1U4UXAD3DS6B2k8IWw8F+SCwD/dop+0s4Rw7tn
F9b4uZN0qNakBefohN5nlJh9V09ADAA=
=Nrlh
-----END PGP SIGNATURE-----

--aCKnMLL/2dELPqOT--

