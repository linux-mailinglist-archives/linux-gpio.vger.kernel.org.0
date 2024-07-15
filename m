Return-Path: <linux-gpio+bounces-8213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA92693185E
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 18:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6587E283472
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2024 16:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B86A1C69D;
	Mon, 15 Jul 2024 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDtR7xjO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127F21C687;
	Mon, 15 Jul 2024 16:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721060386; cv=none; b=ONZkBLrxTq33x3+USCT5xSa4OM2NRE+iDGoV2KVe29sZmlNxyS6HnWQc/EJtAzh76dcHgSf8HB7lIqj79T+gdx584DlBv/4UsE2FHDHgNB6eTQtY3zAZR5F6o9Gh96LcFIg1qFT2YTQpthhe4YsFy3nZABSI6P51ZZQ18teN6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721060386; c=relaxed/simple;
	bh=Goo+c+1HMiEd01oz9jbdIxsNRW/Oq9AF9KfWhZwUinU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXTZ8ZXP4+rV96UeebWN2mm6Tgwz+Qb1H6pKc375EPg6nEyKnWRM8CakT2333Qt3CjjSLLTITEprv8/wTBiy9DptikojoqT4RwoXZb1a2AzOyde7odVWcduLqvlIjGdb80IRGGqPgUeTV9c/3ULA9yVSM1Tn0soYQWFfzDbaF+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDtR7xjO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DE7C32782;
	Mon, 15 Jul 2024 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721060385;
	bh=Goo+c+1HMiEd01oz9jbdIxsNRW/Oq9AF9KfWhZwUinU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDtR7xjOkBvSk59arTVWal5G6fNiHbghNkJiV9/d4KJIorUe6krL0w2w+9AZheTNN
	 Lydkb7lFflqjxF6/5NJNoPodiKOjnk7N1owu//MFT/NtWNEpmrguksbX7BdgPU5qZj
	 KUL4tlZaJVV9kwOhYCqvBNq9/j6m28cUXiQuwwBZ/Z78lDpU5ByNTRNjHof+iQ9amG
	 YN1+IQBvOxuYrOojLlGaD0XHyWR3e3TAL3ZWrqZ40LW0us6UQnoga3VhLHddFQ756r
	 dqao25HojMdlHc2B5ITD3M5pxzxefRxQtRgeclw9dN65hISko7AniFkWtp5Oc7w2Y3
	 JT38PH2C0w6tA==
Date: Mon, 15 Jul 2024 17:19:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pincfg-node: Add "input-schmitt" property
Message-ID: <20240715-strainer-creamlike-b1ff49b25c1f@spud>
References: <IA1PR20MB4953BB6E71CA3216E652E8B8BBA02@IA1PR20MB4953.namprd20.prod.outlook.com>
 <e74d1c2f-576d-4d97-89d2-5bdabe00fb58@kernel.org>
 <IA1PR20MB495302FAFD2003B831342CF4BBA12@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2LVcyejoJGAiq11e"
Content-Disposition: inline
In-Reply-To: <IA1PR20MB495302FAFD2003B831342CF4BBA12@IA1PR20MB4953.namprd20.prod.outlook.com>


--2LVcyejoJGAiq11e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 05:55:28PM +0800, Inochi Amaoto wrote:
> On Mon, Jul 15, 2024 at 11:21:25AM GMT, Krzysztof Kozlowski wrote:
> > On 14/07/2024 13:28, Inochi Amaoto wrote:
> > > On Sophgo CV18XX platform, threshold strength of schmitt trigger can
> > > be configured. As this standard property is already supported by the
> > > common pinconf code. Add "input-schmitt" property in pincfg-node.yaml
> > > so that other platforms requiring such feature can make use of this
> > > property.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> > > ---
> > >  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.ya=
ml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > > index d0af21a564b4..e838fcac7f2a 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> > > @@ -88,6 +88,10 @@ properties:
> > >      description: disable input on pin (no effect on output, such as
> > >        disabling an input buffer)
> > >=20
> > > +  input-schmitt:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: threshold strength for schmitt-trigger
> >=20
> > Strength in which units? This should have proper property name suffix.
> >=20
>=20
> I think it should be mV. Using voltage may leads to decimal.

The standard suffix for voltage is "-microvolts", so no issues with
decimals :) And with a standard suffix, the $ref can be dropped.

--2LVcyejoJGAiq11e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpVMHQAKCRB4tDGHoIJi
0ja0AQCZqLnQcGwiuqZl9Wl01OzS7MJeTSb10oFq99YFhdEHBAD/TthuyCPq5qa9
QNTpI62Qei1oN1LCLqbTiEv8v0EDQgM=
=fLLi
-----END PGP SIGNATURE-----

--2LVcyejoJGAiq11e--

