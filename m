Return-Path: <linux-gpio+bounces-28254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2577C412CF
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 18:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F254B188E55F
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 17:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD4C337B98;
	Fri,  7 Nov 2025 17:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmEyV2Zp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E953B33711C;
	Fri,  7 Nov 2025 17:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538149; cv=none; b=TvtNa4Ay/UDERKYAYRZjYcGje7hD9YZAZH/HSILSgu92G2/KbQPaywhNjUjt9dMwdHDQQH3LkdqeMqutEXXWGJviVK4Bit6bBdWsTmGDZhOV2lx+y+71wI2D3Uv/BdM/q3T2QA6bxeN709cJrvQygk8MndWRSjW5I4s3hfkFP38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538149; c=relaxed/simple;
	bh=KsHAutSO0+jRZTRW6v0AyBfmPVJSe4rt3XRnCMKT/PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwB6E/xDqQRXKHngn9V63xCbhZMUSbZicgDOcH9CCHY/7ghTFeZs4BsAtO3n0TxTn9C1UCx/jYMNh+GBiEezjC3iQ/jjla6ffgg2M4iUqnm4ygjApG7aLcWKJze98uw0+T8glC1SDFlQ3mcxYJN+YCcklGM0TVeXSPKswixoit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmEyV2Zp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E611FC4CEF5;
	Fri,  7 Nov 2025 17:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762538148;
	bh=KsHAutSO0+jRZTRW6v0AyBfmPVJSe4rt3XRnCMKT/PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmEyV2ZpjUej5W8g8xgZb7EpuJAvm5kbe8+m/iO75O2GYsgf3q56wN8hZd5HqOFXT
	 2r1BiaPOIA69I+l5TawWwV67Wm1/OWoGKVqA7IEob8yOCNfFJvnP9YbhbrgztrlolW
	 7Cx7CO1U+GQCpGrFygy5symEcjVZ96lURErnhNpKx+8kdfvwO7HF+AMQmF62O+SfaX
	 blOrfKF2KeibeVtSFz2UU01tjvjs8nC/HmVRolLEWuibu3UIe1aEbKjEfEnCoq2gyQ
	 +qcajAB8GBQhOGf6JvoMYWLGYAQNnBHOujyG53AlRjWq4QmexQ8dHEO03xpWvh0azT
	 MQSYK06zFzieA==
Date: Fri, 7 Nov 2025 17:55:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
Message-ID: <20251107-jasmine-unarmored-e3f5d544a1b7@spud>
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
 <20251107-washstand-motivator-c5e5e5d30dae@spud>
 <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ziqGf3BxzFRC7IT8"
Content-Disposition: inline
In-Reply-To: <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>


--ziqGf3BxzFRC7IT8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 06:49:13PM +0100, Christian Marangi wrote:
> On Fri, Nov 07, 2025 at 05:24:21PM +0000, Conor Dooley wrote:
> > On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> > > Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> > > minor difference on some function group (PCM and LED gpio).
> > >=20
> > > To not bloat the EN7581 schema with massive if condition, use a
> > > dedicated YAML schema for Airoha AN7583.
> >=20
> > You went to more effort than I would have here with that conditional!
> >
>=20
> Well it was suggested by Rob and it's honestly a copy paste of en7581
> with the relevant thing changed.
>=20
> > > +patternProperties:
> > > +  '-pins$':
> > > +    type: object
> > > +
> > > +    patternProperties:
> > > +      '^mux(-|$)':
> > > +        type: object
> >=20
> > What's up with this regex? Why does it allow either - or $?
>=20
> It's to permit either mux-* or unique node name with mux. Pattern is
> also used by mt7622 or other schema. Other use mux- to require a name
> after the mux.

Ah right, because you can have the config properties like drive
strength in the mux node, so sometimes a -pins has one mux node (mux:) if
all pins share settings and sometimes there could be multiple, which
requires a suffix.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ziqGf3BxzFRC7IT8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4ynwAKCRB4tDGHoIJi
0t0WAQCYi/sTEZGfOCnMpmD62rU4qQH2id+MTaCGOfbnq0m68QD4igxSe0PtzF/7
nBp3YwNExDkimenQ+/2opbkn97j/Cw==
=losc
-----END PGP SIGNATURE-----

--ziqGf3BxzFRC7IT8--

