Return-Path: <linux-gpio+bounces-20220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C40AB81B0
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 10:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6267C3BBC78
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 08:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DFD4292938;
	Thu, 15 May 2025 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gkmu0CWP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B60028F95B;
	Thu, 15 May 2025 08:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299302; cv=none; b=L3HxVEgQY6hrpmSEVhpD6c7Nz0VDexLNzCgSrI9mUkv3Z2m/f2VdB8NwHM8xPZh3TUBp1dRHgUac5yJO2d2NCB8iFqt38Q7Wd2qVxhxi12jm7kQXo+FkX2n0bAJVuyvGed3eU0DTUThqY0fcZKTRBeVCB/IitDfqh09TOiuPSyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299302; c=relaxed/simple;
	bh=LBRCYx6yEYw3JtcZjfSpiVcbjCjzsGhvOmR/nBYptGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXby/bQ/Q5HVWpm4qH9oO7lBiFjdr0qw3+1vAVzk1v0uT7aQSi3z5vqrEXCs0IeMORgsgSaboBUqs3eQbPBuLJ252MIsWZNNUOOmsGDMFHiAEoS3jJx0ssqnXVjVJT8jpJw8MXKwX6f19FwJUJFMoypl0V5vl+YUUOCBuSTgG24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gkmu0CWP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8211DC4CEE7;
	Thu, 15 May 2025 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299301;
	bh=LBRCYx6yEYw3JtcZjfSpiVcbjCjzsGhvOmR/nBYptGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gkmu0CWPpNp86K/Euz/Dm/e9t+19BBJ4AZWRaMDphQEk3US7k8Zey8c0olpWuVXM8
	 ZnipbUJLdpq/d4XbppKnYptDpShQmqzMqaVK5fY3RwEryRp3G5m9N4FilTcq2v6NdY
	 lHL3ByJ8wjGe5fczpts9EydsGOjjRTsoaCPg3MbVoJuxHxi8bHCU6UmUi9xFGatMpk
	 xpqNDhskY4sklfMIIaL8ZTog9/30KFvuwS5UnvetQqGl5imNwCKyP/8XEr6hsugkgp
	 76AIm57wcqumpg2zAvGvdj5vSm+PdbKgoAEtmK1/qWx43HX9XpxVHmu4Q5k4F/ULmu
	 XxNmuiDI4VUVQ==
Date: Thu, 15 May 2025 10:54:56 +0200
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Darren.Ye" <darren.ye@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 03/10] ASoC: mediatek: mt8196: support audio clock
 control
Message-ID: <aCWr4HDpEOr_jn3C@finisterre.sirena.org.uk>
References: <20250514081125.24475-1-darren.ye@mediatek.com>
 <20250514081125.24475-4-darren.ye@mediatek.com>
 <be75ac83-5421-4bb0-a28a-57be639f427c@collabora.com>
 <CAGXv+5Hj358gOBomY=KdwYojgpwxFP-tiM38Z18b63ie=922mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqANQ8hKcxHdPm61"
Content-Disposition: inline
In-Reply-To: <CAGXv+5Hj358gOBomY=KdwYojgpwxFP-tiM38Z18b63ie=922mg@mail.gmail.com>
X-Cookie: Well begun is half done.


--pqANQ8hKcxHdPm61
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 04:50:33PM +0800, Chen-Yu Tsai wrote:
> On Thu, May 15, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 14/05/25 10:11, Darren.Ye ha scritto:
> > > From: Darren Ye <darren.ye@mediatek.com>
> > >
> > > Add audio clock wrapper and audio tuner control.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--pqANQ8hKcxHdPm61
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmglq98ACgkQJNaLcl1U
h9B/xQf/WCgax1XZIrHI7sRyhwZ6FlzcWWzC/96GoahlhlHRo6AwJ7ves1riScIY
iWfySDDylRMd2YfjjtoaKosS1N3/jAK8cHbUwFhap4h1WSGltSq+V55v17AzaO+k
tn1SDdLEjA2pMy5+fatN3uVR2PheWLbi5mjxhXzxYTJW/lxfZ22kPl67IGqCFkpu
uh9U74kyhK2m7NnZvjAdwW8is3GrihqtIS7zoqcT3R4DLc3hYEQbJdFTjXzUFyZm
gG/cWOUHko4BbpK5jXfBEgFSDiOT6bzhnHZ1uE4S8ckah7tmctIdVZZ19mwZ5UWI
QAnFFOIaD+7/KimjanojcgHqkusz3g==
=hJfD
-----END PGP SIGNATURE-----

--pqANQ8hKcxHdPm61--

