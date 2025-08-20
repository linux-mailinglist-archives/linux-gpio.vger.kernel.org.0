Return-Path: <linux-gpio+bounces-24674-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A58B2E3DE
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 19:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27CF36004FC
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 17:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50865342CAF;
	Wed, 20 Aug 2025 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnXxuBq9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E361E342C85;
	Wed, 20 Aug 2025 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710368; cv=none; b=H1LvVraPqYu2nNpujmpuTdDHa4/nI7ETczM9zcu9/YJhTsq0wIMtsGFYSAyNpmAKk+wGI9yHJTWZPjJGEpOuVbU8Mzo8AhGiBdbeI2tWRU4X4otHNDAUzDAg2vVXmY93dd345QmF2d1vCH7A3h2mdsQStH+4o9N3hNMseW2cZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710368; c=relaxed/simple;
	bh=ZqeFO6HvfjccxgbJRn37HsDogI883Z0ye1Ok5+j3EBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8qfKrbNAKc1TLWebdR/aAlg7v//NXqAEt2/A0pk2EXbSer5BJZwnFItC6WxwT0d2nRGjhOoK5dMyggdlZzKfVRGGwWNp3m+nLL8XDidu1mLf7NjSNjjZXS6z4NSYr82/8HWIXH+zdqeO3M7hU+V0Y8gbdv7fcancYI+IcREmpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnXxuBq9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A08C113CF;
	Wed, 20 Aug 2025 17:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755710367;
	bh=ZqeFO6HvfjccxgbJRn37HsDogI883Z0ye1Ok5+j3EBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnXxuBq9DaMzoURintPzzDLWm6OGJtRPK5y6jTbj4z7Fe4QFIOGeMAm6xTyXlFlwz
	 I1zl0A27O5+l30TpOLpjgTLLT3IBhtn/oy3JXr6IOY17PGFSGAekC+hsYinNTrGBFk
	 iyi5XmYQfJfrXsrIMIx9mSXEVhtw5EJDcwvNR9/iaD0lQqiT+VhTajCOQjYaWm06jB
	 stPgfsAYA4tGBt+YkC71Gl8cggC5pcFKWJugxR6MwEfnWn+gBwjqX7RUh22ZwkEEu2
	 EFSJB4JzO4GLVaUVXC0doDoVm3oCa3OAU1BRy4BTWD+deENzt+8LIf/iP/tmJ3OedF
	 fG0lE3alkNn6Q==
Date: Wed, 20 Aug 2025 18:19:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org,
	ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net,
	dmitry.torokhov@gmail.com, edumazet@google.com,
	flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
	jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
	kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
	lgirdwood@gmail.com, linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
	matthias.bgg@gmail.com, mchehab@kernel.org,
	minghsiu.tsai@mediatek.com, mripard@kernel.org,
	p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org,
	sean.wang@kernel.org, simona@ffwll.ch,
	support.opensource@diasemi.com, tiffany.lin@mediatek.com,
	tzimmermann@suse.de, yunfei.dong@mediatek.com,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v1 00/14] MediaTek dt-bindings sanitization (MT8173)
Message-ID: <9401aab0-1168-4570-a0a1-1310f37142eb@sirena.org.uk>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/IS/CsiIsaaXgGuH"
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
X-Cookie: Semper Fi, dude.


--/IS/CsiIsaaXgGuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 02:12:48PM -0300, Ariel D'Alessandro wrote:
> This patch series continues the effort to address Device Tree validation
> warnings for MediaTek platforms, with a focus on MT8173. It follows the i=
nitial
> cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780177=
=2Ehtml)
>=20
> Similarly to the ongoing MT8183 work done by Julien Massot, this patchset
> eliminates several of the remaining warnings by improving or converting DT
> bindings to YAML, adding missing properties, and updating device tree fil=
es
> accordingly.

Same question as for that series, what's the story with
interdependencies between the patches?

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--/IS/CsiIsaaXgGuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmimA5MACgkQJNaLcl1U
h9CEfgf+Pr+Af7Z3trY1Qt1ap+qEJ57HkG6lF3iW60MvmprIVByI7krLMLxXZ09K
ggagUaBYGNe98N0oE1w0BjSlrjQxJkAkDTBS7pWP1kc001DinfldPd7bCVwY+3i/
59SETB3Wqun/8fKWU717tHGGGXQ0ruQ7y7dJbZNRCNIo8od7RIBHM2ev88Q8q6H9
wqdaDwKYMej3vW+Icx/xuH+VELI62AlrJ6W6XGDofU3hpvWHCvMN8GPcJnieHnZi
2iOYaasf79REJsNyLC6UqGXE1LBDcN3GkZDxou/yZ2kzh5h7obsGMg11oQS3/iI6
kvVcUoGo80bkRQrHEqntaPQqVwSecQ==
=rN98
-----END PGP SIGNATURE-----

--/IS/CsiIsaaXgGuH--

