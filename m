Return-Path: <linux-gpio+bounces-31312-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AACkOLude2nOGAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31312-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:49:47 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1B5B336D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 18:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E19D2303B7D6
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B82E3559C9;
	Thu, 29 Jan 2026 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRvFeRcM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC50352F9E;
	Thu, 29 Jan 2026 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708767; cv=none; b=FRc/u/U043XsDvnmv96Si1sZHd6yNE58cJTWf2UQ02kGGuHmBoFFhzWEFl5EIlIXqWdjgbzthfYGstGwTc/TkUs+n8U/uwNops1dLx3w0hAjMOj9GTENKjUBYHqgkFK3QF2vfzCAHQdBUL3CMq79MSY5PP6kWVz/3QTIxG8f4kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708767; c=relaxed/simple;
	bh=VVq9bg5Svv1PZCEEKIt1CNdbxjCPsE8VzPpiALSeuX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uawIB7RM8rUb8hrhHmBow7cBTlHBYsQfaCyGTAob+aToI6ATWnD8hZqroTuetTlN4NSooaqhjxI0Y4zd1W3gpA/M+tVu2OW5Fpn3U35dUY/HSoG0iKTDw3mo7rY0Qf+EFJh4UEusXTjwszkBQzrBr3UGCvkd0d3d0xt1Af2v+5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRvFeRcM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351E6C4CEF7;
	Thu, 29 Jan 2026 17:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769708767;
	bh=VVq9bg5Svv1PZCEEKIt1CNdbxjCPsE8VzPpiALSeuX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uRvFeRcMuB+8w4O1LCn6pOVjK/PJ0HMVqZlqeNUofmY2bqNQrougNHj5jZnahtvyt
	 AK3tOWfvbJ+T+K2BDPja+kZojW4peF3shTT1/A5xTBimZ3bdAPXn1os0M4H4H3gbsd
	 XDtCeOObLzMcz4DVvjJPgDiKarzdIH2StHhFFtIHm/diY6JoUg7kFvHdKhEs7yO0uE
	 BfeRUYe9R2vsz6dMccmCepJUzOoBjk++tiDX5Y4y1E2fgkETKN39P0Q5sdLgqFalA7
	 jaQ3R7Oh6UOGLjw2hMw+ecW9TShfF87LTb9yKoRg+vBDB66kUIUjIC15TJNJfjgHsE
	 JMVF3w+EA2VRg==
Date: Thu, 29 Jan 2026 17:46:01 +0000
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
Message-ID: <20260129-snort-maroon-c0478598c227@spud>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
 <e70c010cb8c599d342807af146bd5c2a6d6cb4c5.1769681553.git.biju.das.jz@bp.renesas.com>
 <20260129-skyline-romp-e81f8ec9ae1f@spud>
 <TY3PR01MB11346C5187C5A0A3745B6F870869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NRYMWB8YWWQr21by"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346C5187C5A0A3745B6F870869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
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
	TAGGED_FROM(0.00)[bounces-31312-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 8E1B5B336D
X-Rspamd-Action: no action


--NRYMWB8YWWQr21by
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2026 at 05:43:09PM +0000, Biju Das wrote:
> Hi Conor,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 29 January 2026 17:41
> > Subject: Re: [PATCH RESEND 1/9] dt-bindings: pinctrl: renesas: Document=
 reset-names
> >=20
> > On Thu, Jan 29, 2026 at 10:16:36AM +0000, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > All SoCs has multiple resets. Document reset-names property.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml   | 15 +++++++++++++=
++
> > >  arch/arm64/boot/dts/renesas/r9a07g043.dtsi        |  1 +
> > >  arch/arm64/boot/dts/renesas/r9a07g044.dtsi        |  1 +
> > >  arch/arm64/boot/dts/renesas/r9a07g054.dtsi        |  1 +
> > >  arch/arm64/boot/dts/renesas/r9a08g045.dtsi        |  1 +
> > >  arch/arm64/boot/dts/renesas/r9a09g047.dtsi        |  1 +
> > >  arch/arm64/boot/dts/renesas/r9a09g056.dtsi        |  1 +
> > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi        |  1 +
> > >  8 files changed, 22 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-=
pinctrl.yaml
> > b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> > > index 00c05243b9a4..fbbba53cde9b 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl=
=2Eyaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl=
=2Eyaml
> > > @@ -78,6 +78,16 @@ properties:
> > >            - description: PFC main reset
> > >            - description: Reset for the control register related to W=
DTUDFCA and WDTUDFFCM pins
> > >
> > > +  reset-names:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: rstn
> > > +          - const: port
> > > +          - const: spare
> > > +      - items:
> > > +          - const: main
> > > +          - const: error
> > > +
> > >  additionalProperties:
> > >    anyOf:
> > >      - type: object
> > > @@ -152,10 +162,14 @@ allOf:
> > >        properties:
> > >          resets:
> > >            maxItems: 2
> > > +        reset-names:
> > > +          maxItems: 2
> > >      else:
> > >        properties:
> > >          resets:
> > >            minItems: 3
> > > +        reset-names:
> > > +          maxItems: 3
> >=20
> > This is minItems, no?
>=20
> Oops, Will fix it in next version.

w/ minItems
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NRYMWB8YWWQr21by
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXuc2QAKCRB4tDGHoIJi
0imOAP9ievOEPu45UJgguV+sYd7Np7OsBopeZhHrdotBZ44iGAD/e72lfrJ1ba2g
H2NcMfGib19d9V90m5bGTI44VBy/dQ8=
=R972
-----END PGP SIGNATURE-----

--NRYMWB8YWWQr21by--

