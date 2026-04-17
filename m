Return-Path: <linux-gpio+bounces-35212-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALGeAO5a4mn65AAAu9opvQ
	(envelope-from <linux-gpio+bounces-35212-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 18:08:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFBC41CEB0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 18:08:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 441A43040ABE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 16:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B57B33120C;
	Fri, 17 Apr 2026 16:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+ZilaRD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0E029A32D;
	Fri, 17 Apr 2026 16:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776442025; cv=none; b=L8eYIhGtxw1NhS+ImkTr799FD+Q02nOfXrSqUjQCxjsIDl5lKb6ZuDPj4pF6LGvbXbP4vik/2O49OooeQyLTIbcDhN6ZiaVGOOXGcS21X/c3UndC54q4PpLXzURUTF8Nd9SnrDxGyLfgozRs5NV2j1kL93mC67oOy41X9wir/VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776442025; c=relaxed/simple;
	bh=NQgku0XmKRU6rgKiAn/DW7pVK31ikSdLl/YitlLG/B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCz8Il82Rx4y9MLjGSGPiRChjQBH487j4BCr8fCC/wK9jPM6Jva8I2ZHsemKsUho/G/pE5eWkloTV783OJUoZS+x1ux1Pp7F2DRNmjbwvuWQehpDqGU6nGVuuO9vbMvu3n65+IJHpj4pblc0A3BU9BOV3pwLtTZjheF4yBNQths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+ZilaRD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C29ACC19425;
	Fri, 17 Apr 2026 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776442025;
	bh=NQgku0XmKRU6rgKiAn/DW7pVK31ikSdLl/YitlLG/B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O+ZilaRDHbIpuk+btUy0PJqf2nDXeW9zyi9F0lc1bgO07JLLXlhdnIAxV0pt3QMbJ
	 OZFjEc0Y4ag0wOuAXrdgkKVpb+Ivj0UkYvf9rieoR7CGQXx1W4NmEtWs+AuaMI/nrH
	 hugHPhq3slfvFe/Yk0er0AkKjCzK1BYcR9U0RlhZmJAaDri7QRdLTGRBBGRu6USD84
	 HnJe9ERiefV9hM7c0qA11VHA8ZpivyLxv/QjHa5cMtcfm2Aico6mlC+UUyCPz/RVI5
	 dVsYHkDOne5Z1zIpQyWFf4YLtAkzqyKyOyVcKiyGzyaaZkpHkgMGS9qB/orNZUrrGG
	 8yLX+nhkmwKeg==
Date: Fri, 17 Apr 2026 17:06:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: pinctrl: Add
 aspeed,ast2700-soc0-pinctrl
Message-ID: <20260417-anemia-borrower-fb90ac02b417@spud>
References: <20260416-upstream_pinctrl-v7-0-d72762253163@aspeedtech.com>
 <20260416-upstream_pinctrl-v7-1-d72762253163@aspeedtech.com>
 <20260416-brutishly-saga-ba7168a4cd14@spud>
 <OSQPR06MB7252EB0C2A1A3313DE49406B8B202@OSQPR06MB7252.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/e075MT9JwuwmUji"
Content-Disposition: inline
In-Reply-To: <OSQPR06MB7252EB0C2A1A3313DE49406B8B202@OSQPR06MB7252.apcprd06.prod.outlook.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35212-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7CFBC41CEB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--/e075MT9JwuwmUji
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 02:20:25AM +0000, Billy Tsai wrote:
> > > +=A0=A0=A0 properties:
> > > +=A0=A0=A0=A0=A0 function:
> > > +=A0=A0=A0=A0=A0=A0=A0 enum:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMC
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGDDR
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGM0
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPCIEA
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPCIEB
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGPSP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGSSP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGTSP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGUSB3A
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAGUSB3B
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC0PERST
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC1PERST
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - TSPRSTN
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - UFSCLKI
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AD0
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AD1
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AH
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHPD0
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXH
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXH2B
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHD1
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHP2B
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AXHPD1
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BD0
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BD1
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BH
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHPD0
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXH
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXH2A
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHD1
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHP2A
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BXHPD1
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXH
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXH2B
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHD
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHP2B
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AXHPD
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXH
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXH2A
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHD
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHP2A
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BXHPD
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VGADDC
> > > +
> > > +=A0=A0=A0=A0=A0 groups:
> > > +=A0=A0=A0=A0=A0=A0=A0 enum:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCCDN
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG1
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG4
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCG8
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - EMMCWPN
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - JTAG0
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC0PERST
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - PCIERC1PERST
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - TSPRSTN
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - UFSCLKI
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2A
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AAP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2ABP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2ADAP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AH
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2AHAP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2B
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BAP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BBP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BDBP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BH
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB2BHBP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3A
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3AAP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3ABP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3B
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BAP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - USB3BBP
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB0
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VB1
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - VGADDC
> > > +=A0=A0=A0=A0=A0 pins:
> > > +=A0=A0=A0=A0=A0=A0=A0 enum:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AB13
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AB14
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AC13
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AC14
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AD13
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AD14
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE13
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE14
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AE15
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF13
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF14
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - AF15
>=20
> > Why do you have groups and pins?
>=20
> > Is it valid in your device to have groups and pins in the same node?
>=20
> The intent is to support both group-based mux selection and
> configuration, as well as per-pin configuration.
>=20
> In our hardware:
>=20
> - `function` + `groups` are used for pinmux selection.
> - `pins` is used for per-pin configuration (e.g. drive strength,
>   bias settings).
> - `groups` may also be used for group-level configuration.
>=20
> As a result, both `groups` and `pins` may appear in the same node,
> but they serve different purposes and do not conflict:
>=20
> - `groups` selects the mux function and may apply configuration to
>   the entire group.
> - `pins` allows overriding or specifying configuration for individual
>   pins.
>=20
> In most cases, only one of them is needed, but both are allowed when
> both group-level and per-pin configuration are required.

To be honest, that sounds like your groups are not sufficiently
granular and should be reduced such that you can use them for pin
settings.=20

--/e075MT9JwuwmUji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeJaoQAKCRB4tDGHoIJi
0oi8AQDp1gAb3AolAjABIl6fBvoBypslFDHqFAcNj6E2DlBE3QEA6Q6j2LCAIPOl
0A+dbl1IvfSrQZC4005IZCZMYdRgOgE=
=ZteU
-----END PGP SIGNATURE-----

--/e075MT9JwuwmUji--

