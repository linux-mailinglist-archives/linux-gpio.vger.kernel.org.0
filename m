Return-Path: <linux-gpio+bounces-6239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 962428BFC6E
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 13:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C76131C22FFE
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 11:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F76839FE;
	Wed,  8 May 2024 11:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjWCU0oM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C245018;
	Wed,  8 May 2024 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715168508; cv=none; b=rcv9D8DCoXpu0yoJYLJ2O5g1adnDVW5g8DHr+0hfZwt+NiJNxezszwWyk8um37CO2GtxEjkMJPCV0Q7cGTIhLbD+HRdctIGW3a8VShjKQXNBTjOwVWYbkhZgZb+fW3gzQH1Y1UFTd5NLAycR79IHxSP/mOlq8FTxiGev4WJbOnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715168508; c=relaxed/simple;
	bh=S46HwLr17tH08+TRizfIdIjC/J7jZ/ETH3qJImqj9P8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3l6jfvZjP3LSMgy546BeYbNZxbEapauKY0NJ7TsXInO4j4QG6aqmkq3oYkctNCu2weubWFmhAMPQVnjf6EalXAkNKGSInFTaMbGnBcmSlX050Wv2+4Xt1tgiShfSWNyFXdyj/uvnvVEnK0se9BNkJ2i8YDJwunervbGB4YKLx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjWCU0oM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B08C3277B;
	Wed,  8 May 2024 11:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715168507;
	bh=S46HwLr17tH08+TRizfIdIjC/J7jZ/ETH3qJImqj9P8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NjWCU0oM/07qgdlJpK0eTNpD/OZfK1FfSQRXEgArJ1GDV+DyFKCZoB+3ezdre8Akk
	 EVzjttt2xD0nsFo3Z5poaJfl3U0zXCyZtw0UoM9L6klGYa9XXkfeaPUcnK4NOr7xAH
	 qsRdlvEpE2M+Gn3ALLi0cQs8a2GvLXjZWDQ+0/b/ZKlt8a/OqXi77J8oeNr+0rzHdE
	 Lmt2tdnkNGVzhBPzJkJ5wXZ7ZvrJM2A48H9JnSwwU1RDsWmdIj1O/grrVO9oeR3jqB
	 9/L1FvknQx3P5P4xttFXkzQEnDZ4Roqvlqmvs7gZ/g9mTEsjdXOmy531pRId3SGG9K
	 QO7xu/8U03rzg==
Date: Wed, 8 May 2024 20:41:43 +0900
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <Zjtk90ZoKvFrmi1L@finisterre.sirena.org.uk>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <Zjkq_nWyvc6bUtiu@surfacebook.localdomain>
 <ZjpMeVk_HiixZUEu@hovoldconsulting.com>
 <CAHp75VdUFMvkj-r76H7GFZdpcoh_nb8v6CBj4wBHztNhiaWULQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WOUJEMZDjv5vndYJ"
Content-Disposition: inline
In-Reply-To: <CAHp75VdUFMvkj-r76H7GFZdpcoh_nb8v6CBj4wBHztNhiaWULQ@mail.gmail.com>
X-Cookie: Accuracy, n.:


--WOUJEMZDjv5vndYJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 08:22:34PM +0300, Andy Shevchenko wrote:
> On Tue, May 7, 2024 at 6:44=E2=80=AFPM Johan Hovold <johan@kernel.org> wr=
ote:

> > > > [ johan: rework probe to match new binding, amend commit message and
> > > >          Kconfig entry]

> > > Wouldn't be better on one line?

> > Now you're really nit picking. ;) I think I prefer to stay within 72
> > columns.

> Not really. The tag block is special and the format is rather one
> entry per line. This might break some scriptings.

No, really - the above is absolutely fine, random notes in the middle of
things are reasonably common and scripting that can't cope with them is
going to encounter a bunch of problems.  This stuff needs to be readable
by humans and this is just a stylistic preference on your part.

--WOUJEMZDjv5vndYJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY7ZPYACgkQJNaLcl1U
h9BDMAf/c6jnrB5DGzsK8YxcJFkAon0+x6MNIbq3mZGjufO9NdnEf0FSC6u51Aad
nSF6gSZe49arslXszvjwJJszRuYMga7OQzwRwROoqxxWfKx29XcXappYyYeA/mBN
Vfxej1jCTKxQpogB+Ma5J3AFcNf0diNSG/V3ZF/YCYv4aW7vNwthkuKVgjnU+GsX
Y/0hNkfrBIilPzomD0DxG3aSNhHMs0BCENrTDHDY4zONqoGdqotH4aUQZN+wdPTL
UcEUImtpVm2e7yJBHM9HXOLtOAsYhwmy08gvgDAZig/JFOIykDo1NLqINmmV0Q2V
MBTJQFmsBLt6fu6YfbdeF9deJqFC3w==
=xko8
-----END PGP SIGNATURE-----

--WOUJEMZDjv5vndYJ--

