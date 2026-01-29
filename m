Return-Path: <linux-gpio+bounces-31313-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J3yEiCee2nOGAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31313-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:51:28 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97CB33C0
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29AF8306EB70
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D273559E0;
	Thu, 29 Jan 2026 17:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGh+Ik2c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88735580E;
	Thu, 29 Jan 2026 17:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708812; cv=none; b=f0DvHH9N7S+0xm1OeJEKjppoM9xeyp9zKWwayJKoh2TGnvXBL+npGK3ys3bmM+j8LqJ7oEPDxm+BRVl5uxcOYZkCo4NGeceSnVN7fiPhLnkpn22AXLRplFnGtN2BSPI0nJiFJnqABww1tDXvQ+y3nhH4FSeHGFQk7nOmEcey5Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708812; c=relaxed/simple;
	bh=qsIrj8w3tywmIkeE49CGLnTEaBOmOsWsY6QmqZSSa1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghkVVSgCHA1kI0FbwIH/xGmvyxKdUL3u8dMoAsHQXig0aoWUnqicvVh3N7s5W96HYCfJhvs+muFA/3tfECmxhTeCvsw+G8t5xM3p1IgBCc1vzj7xFto5/6usoixv6RSFEXJ02mQ8zieCrOU37FMS6Fsb872DZ0xoLzDoUW2fg6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGh+Ik2c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A6DC4CEF7;
	Thu, 29 Jan 2026 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708811;
	bh=qsIrj8w3tywmIkeE49CGLnTEaBOmOsWsY6QmqZSSa1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGh+Ik2cUO83ZtrPe3rvho6W6cBZNU2X5adNoZMNLDG4tu0DSyL9R4PI6R5OAmR3Z
	 w08r5hjatQEwyTecib6QrHti8nexhyWvfTSFSQD8N7n6H4WM4I99Y3bR6Pxd9rFP62
	 8GbkAeFXt4orT6vOc1SfBVCBslLsW5jk/OHkz0ZI1GdsX9l+52hB/ICPbHyJfJSy3Q
	 xZeOpS+ROfw3Tgvp7RVlIVaXahCuLIf6+yw/OmDak2CaJCHaovx8nJE0xe+nscOdI3
	 TMcBuc1GPgooKuuL6FibJ+6J8usZSH1d7+PkfN7aAJEwFNwWILI+ghf/z9FvPU08tX
	 udVMX+J4K10zw==
Date: Thu, 29 Jan 2026 17:46:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"magnus.damm" <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Document
 reset-names
Message-ID: <20260129-cherub-prenatal-7882029a9027@spud>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
 <e70c010cb8c599d342807af146bd5c2a6d6cb4c5.1769681553.git.biju.das.jz@bp.renesas.com>
 <20260129-skyline-romp-e81f8ec9ae1f@spud>
 <TY3PR01MB11346C5187C5A0A3745B6F870869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20260129-snort-maroon-c0478598c227@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zyAULGCdrqpTp1A4"
Content-Disposition: inline
In-Reply-To: <20260129-snort-maroon-c0478598c227@spud>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31313-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,glider.be,kernel.org,baylibre.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email,renesas.com:email]
X-Rspamd-Queue-Id: EA97CB33C0
X-Rspamd-Action: no action


--zyAULGCdrqpTp1A4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 05:46:01PM +0000, Conor Dooley wrote:
> On Thu, Jan 29, 2026 at 05:43:09PM +0000, Biju Das wrote:
> > Hi Conor,
> >=20
> > Thanks for the feedback.
> >=20
> > > -----Original Message-----
> > > From: Conor Dooley <conor@kernel.org>
> > > Sent: 29 January 2026 17:41
> > > Subject: Re: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Docume=
nt reset-names
> > >=20
> > > On Thu, Jan 29, 2026 at 10:16:36AM +0000, Biju wrote:
> > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > All SoCs has multiple resets. Document reset-names property.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml   | 15 +++++++++++=
++++
> > > >  arch/arm64/boot/dts/renesas/r9a07g043.dtsi        |  1 +
> > > >  arch/arm64/boot/dts/renesas/r9a07g044.dtsi        |  1 +
> > > >  arch/arm64/boot/dts/renesas/r9a07g054.dtsi        |  1 +
> > > >  arch/arm64/boot/dts/renesas/r9a08g045.dtsi        |  1 +
> > > >  arch/arm64/boot/dts/renesas/r9a09g047.dtsi        |  1 +
> > > >  arch/arm64/boot/dts/renesas/r9a09g056.dtsi        |  1 +
> > > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi        |  1 +
> > > >  8 files changed, 22 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2=
l-pinctrl.yaml
> > > b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > > > index 00c05243b9a4..fbbba53cde9b 100644
> > > > --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinct=
rl.yaml
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinct=
rl.yaml
> > > > @@ -78,6 +78,16 @@ properties:
> > > >            - description: PFC main reset
> > > >            - description: Reset for the control register related to=
 WDTUDFCA and WDTUDFFCM pins
> > > >
> > > > +  reset-names:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - const: rstn
> > > > +          - const: port
> > > > +          - const: spare
> > > > +      - items:
> > > > +          - const: main
> > > > +          - const: error
> > > > +
> > > >  additionalProperties:
> > > >    anyOf:
> > > >      - type: object
> > > > @@ -152,10 +162,14 @@ allOf:
> > > >        properties:
> > > >          resets:
> > > >            maxItems: 2
> > > > +        reset-names:
> > > > +          maxItems: 2
> > > >      else:
> > > >        properties:
> > > >          resets:
> > > >            minItems: 3
> > > > +        reset-names:
> > > > +          maxItems: 3
> > >=20
> > > This is minItems, no?
> >=20
> > Oops, Will fix it in next version.
>=20
> w/ minItems
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Actually, can you remove the dtsi changes from the binding patch? I
forgot they were in here.

--zyAULGCdrqpTp1A4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXudBgAKCRB4tDGHoIJi
0gl4APsGY71+dJcIN810DMoOBwuHslu2v1Q6aWYJKHhLYWJVCQEA68GqFxnorXh8
ZXAQ30VQxnGVogtj1UBqGsNvFBFbtgE=
=VPay
-----END PGP SIGNATURE-----

--zyAULGCdrqpTp1A4--

