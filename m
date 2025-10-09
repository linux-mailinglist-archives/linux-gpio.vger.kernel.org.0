Return-Path: <linux-gpio+bounces-26950-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE1BCA4C7
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 19:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E29271890CE4
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 17:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E286D228CB8;
	Thu,  9 Oct 2025 17:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgnRtmso"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B23A1F5827;
	Thu,  9 Oct 2025 17:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760029320; cv=none; b=b9qC7SDa904t4iE6dtY4BtToWnG+bHhn97eTBMNKLxq96WswzUSTG9UfeC617kWbRLlnuZBMNSDgRXxKJBI73OfP7XaiTcLWsihng40zE1crRBfi50ApjO45xfwmNzViY6eCTfAgg/jlNvHT1BSvDx7L0xhZ+4bHxsLr5DFIKe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760029320; c=relaxed/simple;
	bh=9upHRd42x7l6b9LCEj08BJQfsR/nvj8yR/xiIjTzuYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afFzwzCkQgDH4yAxr3hzAtDfeNuPlZONGw+KWEnWTG92rgqcCg7y24Y1SBvxIyawzUROGYSfD+uxFXTGymuIvNAGC9h+lMCcusi6WaV0wfk/QMUsDCk72UvH4BbJNy+1sx9QMlV7MXzJbHGqsUGIMNqnVX3nrBrd6u6/X9xkrzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgnRtmso; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24FF9C4CEF7;
	Thu,  9 Oct 2025 17:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760029319;
	bh=9upHRd42x7l6b9LCEj08BJQfsR/nvj8yR/xiIjTzuYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgnRtmsozWz6KlaxCM+dOnbdf+iYvesMFPD5uIItqRbIiN7maUnoOQqXguOX86wJt
	 8nKK629UUb7ipmVVYxILxSCZClWRMT/6yGN3kGRn4nPNTb07Pc3P5VzHFmVtsEZsL2
	 yH8jS4OgZDGbZYB4hA0cAwr33BqpoElLMzj7KDbNTU4C5wYcBHlf2h3CUwzL1sP6Dy
	 ApkqO9cjlIJvknDYp5q8lotWoG8n6+W79obnzdEBVBmn9Hs2PRydRGEBmiu/jYlaKQ
	 AFKzQGQb57fTHQq2XC9yIohw94XdGjZuBjAuci7w9CYMRCRmpIzXiSjIRrL4v0MoBZ
	 E+GMbkNi3eJww==
Date: Thu, 9 Oct 2025 18:01:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonas =?iso-8859-1?Q?Schw=F6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 11/24] dt-bindings: display: tegra: document Tegra132
 MIPI calibration device
Message-ID: <20251009-sycamore-blouse-ffa49a433f18@spud>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-12-clamor95@gmail.com>
 <20251008-craving-composite-81aa70b6e882@spud>
 <CAPVz0n1OEA=WHTzBtVBLQ=6vTAwG_uP1tC3Vbrb67wZDUtyVYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lLfqPiIZi9+97oI7"
Content-Disposition: inline
In-Reply-To: <CAPVz0n1OEA=WHTzBtVBLQ=6vTAwG_uP1tC3Vbrb67wZDUtyVYA@mail.gmail.com>


--lLfqPiIZi9+97oI7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 09, 2025 at 08:12:11AM +0300, Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 9 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 00:=
14 Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Wed, Oct 08, 2025 at 10:30:33AM +0300, Svyatoslav Ryhel wrote:
> > > Document MIPI calibration device found in Tegra132.
> >
> > Could you explain why a fallback is not suitable? The patchset is really
> > too big for me to trivially check that the change is correct.
>=20
> First of all, this compatible already exists in Linux kernel, I have
> just documented it to satisfy warnings. Secondly, each Tegra SoC
> generation has unique set of registers which should be configured.
> They all differ, hence fallback is not suitable here.

Okay, then put that in your commit message.

>=20
> > With an explanation,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1=
 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,t=
egra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,=
tegra114-mipi.yaml
> > > index 193ddb105283..9a500f52f01d 100644
> > > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114=
-mipi.yaml
> > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114=
-mipi.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >      enum:
> > >        - nvidia,tegra114-mipi
> > >        - nvidia,tegra124-mipi
> > > +      - nvidia,tegra132-mipi
> > >        - nvidia,tegra210-mipi
> > >        - nvidia,tegra186-mipi
> > >
> > > --
> > > 2.48.1
> > >

--lLfqPiIZi9+97oI7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOfqfgAKCRB4tDGHoIJi
0kyqAQCsM5oWNYYCPRvdfAibdHsLxF4cH4/ZYVzWrAFPREawOgEArA+RrpQ+YL+2
AfZZhjMQ2m8oD8KgCtb0KJ1/vdD7WQo=
=yp0k
-----END PGP SIGNATURE-----

--lLfqPiIZi9+97oI7--

