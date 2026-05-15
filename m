Return-Path: <linux-gpio+bounces-36890-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDN3IY7NBmrynwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36890-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 09:38:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E1254AB3C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 09:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 961ED3004F19
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 07:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248923EFD00;
	Fri, 15 May 2026 07:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="WxtNl0oq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E713241139;
	Fri, 15 May 2026 07:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830731; cv=none; b=RdNJtQaLVxRF7SzAHK5WyeVnAKL/9w81wB/ZXyfq2ZCBuhU7cedz/Yajicj7npagc/LNpWipTTZ4q2a3ut4834wFIlZKmt5ZCru8k1aT4E5ZJ71lXiTNXom/vTXokWySKG09+m7NCpOfojCiduu6yxpzdfVfCIJk64ipx/4jS3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830731; c=relaxed/simple;
	bh=YRLf0lurFbfXEuuPH6jbfmoCndoC1re7fD+TOa1Oyjk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRcFTBakO/eDm4rkXSqrS6gKFgESR/hKKf4FGPFzLOa62PQ68C0lboqBYOXtC7ZElWA3eZ4unQAlSScbRhYR78K+jRBCX4u1NwYZNHtV+bRSz2XJheEHb4kD+L7nl64ATJ2prI9cvyFVGjPFLeA3M4smxi7kP9glssN3V1Gf7Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=WxtNl0oq; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778830729; x=1810366729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YRLf0lurFbfXEuuPH6jbfmoCndoC1re7fD+TOa1Oyjk=;
  b=WxtNl0oqqOIgV4I4JMpofPq2lFpHGNqDXjlNZddyqZY2zg3oBepwJueL
   w/UC2xhIrJSWyay3c/hknK3smE+Qh4k2MRkcJGbdXfKZDFqRo9nlsiM82
   lImuaHpt0aIC+12FOQdVGbrPol/R4MbBuTX24uw2cWxAZ3xMNpo4GdyFk
   pbSS5OabJTdE4Ks2lHhFxISIk9O7gtKv2uhItlOWMSaQ9W7ifjxCF0qdX
   eNsA4IpLQr5eTt2Gl1VCMo7Z29MWUB84jjt8zRKwCWQUEaLnSNFOBdPKx
   fhj6e3J5HDA8RDo8mo0N5CK6yBtmooJt9FZ5pMeGD8Vlo2qMx/FBgT2pS
   Q==;
X-CSE-ConnectionGUID: v9Dn61O4RUWO9G2t+3/DGg==
X-CSE-MsgGUID: h7E9LxoKTimEBkOISndbBw==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="224790273"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 00:38:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Fri, 15 May 2026 00:38:48 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 00:38:44 -0700
Date: Fri, 15 May 2026 08:38:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul
 Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt
	<palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 03/22] pinctrl: pinctrl-generic: Make the "function"
 property optional
Message-ID: <20260515-dandruff-shorts-d7417c6e977a@wendy>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-4-changhuang.liang@starfivetech.com>
 <20260514-operation-remix-9f9fcf9a6102@spud>
 <ZQ4PR01MB120245CDE718812D1C65638AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TfqgCJgMGabClEuj"
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB120245CDE718812D1C65638AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-Rspamd-Queue-Id: 49E1254AB3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36890-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

--TfqgCJgMGabClEuj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 05:55:48AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the review.
>=20
> > On Thu, May 14, 2026 at 04:11:59AM -0700, Changhuang Liang wrote:
> > > Some pinctrl subnodes only need to configure pin properties (e.g.,
> > > power-source, bias, drive strength) without assigning any mux functio=
n.
> > >
> > > Currently, the driver requires a valid "function" property for all
> > > pinctrl subnodes. This forces the addition of dummy or redundant
> > > "function" entries when only pin configuration is needed.
> > >
> > > Example use case:
> > > gpios-configs {
> > >     config {
> > >         pins =3D <0 1 2 3>;
> > >         power-source =3D <0>;
> > >     };
> > > };
> > >
> > > Make the "function" property optional. If it is missing, skip adding
> > > the mux map and only process the pin configuration.
> >=20
> > I looked through the series though and all controllers appear to have p=
ins and
> > functions, is it the case that gpio is the default for these pins, so y=
ou are
> > omitting the functions property when you are using the pin in gpio mode?
> > Saying that the functions property is "redudant" makes it seem like thi=
s might
> > be the case?
> >=20
> > I've got some feedback here, but I can't really provide it without know=
ing the
> > answer to that question.
>=20
>=20
> "From v1, copying Linus's suggestion:
>=20
> > +  This domain contains 4 IO groups which support voltage levels 1.8V a=
nd 3.3V
> > +  gpioe-spi - comprises PAD_GPIO_C0 through PAD_GPIO_C4.
> > +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> > +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> > +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> > +
> > +  Each of the above IO groups must be configured with a voltage settin=
g that matches the external
> > +  voltage level provided to the IO group.
>=20
> So your hardware has groups and support some properties on the group leve=
l.
>=20
> So expose these groups and make these properties configurable per group
> instead of inventing per-group properties.
>=20
> > +  gpioe-spi-vref:
> > +  gpioe-qspi0-vref:
> > +  gpioe-qspi1-vref:
> > +  gpioe-qspi2-vref:
>=20
> Create proper groups in the pin controller then use the
> standard pincfg property power-source =3D <...>; for this.
>=20
> Example for a simple default hog:
>=20
> pinctrl {
>     /* Hog the QSPI pins */
>     pinctrl-names =3D "default";
>     pinctrl-0 =3D <&qspi_default>;
>=20
>     qspi_default: pinctrl-qspi {
>         config {
>             groups =3D "gpioe-qspi-pins";
>             power-source =3D <2>;
>         };
>     };
> };
>=20
> The groups can be orthogonal to other pin handling, that's
> fine. Implement .pin_config_group_set in struct pinconf_ops.
>=20
> However, I found that pinctrl_generic_pins_function_dt_node_to_map() does=
 not=20
> handle the groups property,

That's kind of the whole point of the function, see the comment about
it:
/*
 * For platforms that do not define groups or functions in the driver, but
 * instead use the devicetree to describe them. This function will, unlike
 * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
 * and functions, create them in addition to parsing pinconf properties and
 * adding mappings.
 */

If you have the groups property in your devicetree, it contains strings
that the driver uses to match against the groups it has defined in it.
See my recently added microchip,pic64gx-pinctrl-gpio2 for an example of
that if you like.

However, if you are using the pins or pinmux properties, the groups are
not defined in the driver, and need to be created at runtime. That's
what pinctrl_generic_pins_function_dt_node_to_map() is for - it creates
the groups at runtime when using the *pins* and *function* properties.
It's in the name!

Judging by your drivers, and how many structures you have that look very
like groups from a quick glance, probably you can still make use of the
groups property. The equivalent function to
pinctrl_generic_pins_function_dt_node_to_map() when you're using driver
defined groups is pinconf_generic_dt_node_to_map().

Also, I notice that you never actually answered the question that I
asked:
> > I looked through the series though and all controllers appear to have p=
ins and
> > functions, is it the case that gpio is the default for these pins, so y=
ou are
> > omitting the functions property when you are using the pin in gpio mode?
> > Saying that the functions property is "redudant" makes it seem like thi=
s might
> > be the case?

Are you omitting the functions property from your nodes when they're
using gpio because it is a default, or is there some other reason why
you're omitting the functions property sometimes?


> currently, my node uses pins instead, so it looks like this:
>=20
> +&pinctrl_per3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gpios_configs>;
> +
> +	gpios_configs: gpios-hog-grp {
> +		gpios-hog-pins {
> +			pins =3D <PADNUM_PER3_GPIO_E0
> +				PADNUM_PER3_GPIO_E1
> +				PADNUM_PER3_GPIO_E2
> +				PADNUM_PER3_GPIO_E3
> +				PADNUM_PER3_GPIO_E4
> +				PADNUM_PER3_GPIO_E5
> +				PADNUM_PER3_GPIO_E6
> +				PADNUM_PER3_GPIO_E7
> +				PADNUM_PER3_GPIO_E8
> +				PADNUM_PER3_GPIO_E9
> +				PADNUM_PER3_GPIO_E10>;
> +			power-source =3D <JHB100_PINVREF_1_8V>;
> +		};
> +	};
> +};
>=20
> Best regards,
> Changhuang
>=20

--TfqgCJgMGabClEuj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbNXgAKCRB4tDGHoIJi
0hDOAP9QsmueYrhT6e0GNFL/p7Lhrcf5L/7S/ufZj4VmRodEHgD6A2+iq8ip2Jsc
wOX3AS5YYYdkLDxh/V4ZlxG20GuG9Qg=
=miil
-----END PGP SIGNATURE-----

--TfqgCJgMGabClEuj--

