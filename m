Return-Path: <linux-gpio+bounces-29071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A60FBC86E31
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 20:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 537D3351871
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 19:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27315325728;
	Tue, 25 Nov 2025 19:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vazonwgc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4582231C91;
	Tue, 25 Nov 2025 19:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764100511; cv=none; b=imm7MR8P5EPPkOkemvLGJ8r1wMgt6KQV2lOgJ02PQBqou1i1SgcK3ZM0ug1gkB85QyjL3J5mxlmFNtwsKbMfILU/PwRs4WXY0A7eGFvSoqDcgGvotfc0nESMvKNT6CyQBT2ABhc71YXyyXhYQjgkWr+P9ti/7W5t6CQ+ed34s20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764100511; c=relaxed/simple;
	bh=iAp76Gka612Ye/wfINz2wjP66qwVp2humAdQe1ux7Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p02x1xOOMo5N/jbzjuftGoegkVBcqOPiX5bz2kPzIRyuO5ne+QsQ8425oV6T/V4590nHoS8SK4OZz9f7OfSX+rgrnnAJCw/zCysWKz6khwXxnLHgLgreiINeyQqC3fbwinscCqQBmwEJRh80voQ4EkW5gmwFzQfL4bn+JDtodCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vazonwgc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4774EC4CEF1;
	Tue, 25 Nov 2025 19:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764100511;
	bh=iAp76Gka612Ye/wfINz2wjP66qwVp2humAdQe1ux7Aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VazonwgcBR2koc0DLhV4vEzFPdSWc9TGeyqigcZq9r7PWNztbFEMWhYJH/aAxJRf3
	 buiU/a0tBjr3iA8OEPoCVo7X8p0jh6NHndiQ6/2sHjIysZ/yfQH1aNGkr0m7MqT/LT
	 JYZfSmtAPz9vsoLxEAed7GYuDTT8Ao5EguAy4UPfRnVF097L6MOVoFN8CT3jxdC9Ym
	 Ly/PRqW4FYvmW1cBx3R+AwUyrKiv0a6MpOtXxkdxzPrbjtpjZ+8iattQ4cfvbW1tRc
	 UoAQBpkbOSvp1xDLJVYY7iuHb2mP+uEgx44odYpAqvcWG+0eAPFBaqizVWLMU+eJo3
	 qgGWz0ykihSxw==
Date: Tue, 25 Nov 2025 19:55:06 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
Message-ID: <20251125-sauciness-those-49593f401322@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251124-crayfish-lard-cc7519e1119e@spud>
 <CAD++jLkehJNGxxQJV6vOA9xurBjwpYcL1ufYBQEOqRjNG-h-fg@mail.gmail.com>
 <20251125-kindness-quicken-a70e3fdd0b8c@spud>
 <CAD++jLmO33B58WUxJiM7c6VCrkQ4nxOmodbOozNmS9LD1VDt1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dsH/YW6+WGU7skE6"
Content-Disposition: inline
In-Reply-To: <CAD++jLmO33B58WUxJiM7c6VCrkQ4nxOmodbOozNmS9LD1VDt1g@mail.gmail.com>


--dsH/YW6+WGU7skE6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 08:28:10PM +0100, Linus Walleij wrote:
> On Tue, Nov 25, 2025 at 6:47=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> > > > It seems to depend on aml_pctl_parse_functions() being called
> > > > during probe which creates the groups and functions.
> > > > There's a weird warning about expecting a function parent node that=
 seems
> > > > very amlogic specific too.
> > > >
> > > > In my eyes, there should be some generic dt_node_to_map helpers that
> > > > do it all for you on the "configuration entirely described in dt"
> > > > platforms because that's what stuff like spacemit k1 driver that do
> > > > this in their dt_node_to_map implementations.
> > >
> > > I think you're right!
> >
> > My dilemma now is what to call them and where to put them.
> > pinconf_generic_dt_node_to_map<something>() feels weird for something
> > that is also creating functions and groups, which I noticed because I
> > was having to include pinmux.h in pinconf.c so that I could call
> > pinmux_generic_add_function().
>=20
> pinctrl_generic_dt_node_parse_config() or so? Is it vague enough?

Probably too vague, since it's gonna be pins + functions specific, but
I'll do something along these lines. Where should I put it? Leave it in
pinconf-generic, but do some gating of it to only be exposed for configs
with GENERIC_PINMUX_FUNCTIONS enabled?

--dsH/YW6+WGU7skE6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSYJmgAKCRB4tDGHoIJi
0pKOAQCrieMpwNlZOnsi99MQYCOHOndgyApg4eY6d1WukPd14gD/WX20VQF6Vlwi
jX7KMvecUyBXmSkjVWKAWu3XDDjxLQ4=
=/uQe
-----END PGP SIGNATURE-----

--dsH/YW6+WGU7skE6--

