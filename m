Return-Path: <linux-gpio+bounces-13763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F59A9ED03B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1DEA1884AB5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 15:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7231DD0D6;
	Wed, 11 Dec 2024 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uwdZuG/9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBBC1D8DFB;
	Wed, 11 Dec 2024 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931904; cv=none; b=dUk9rSGtUWf/+5n3LAgqN6YCAIyVbrT8QeZvsG8m/m+Ca3OPALhUYVDvA8jEKSlGdrK/6+XHOFSHtwxzeErlQ57Efd/4D+5FnTQPP3UNsjVACR7YWBFSycTK5ksrhvtvxv+/3ibZ9VQQxMWfP0z+f+6QNAN8ASqCboUTWvdkvho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931904; c=relaxed/simple;
	bh=vHm0I24vOCK9hphozbx59ldx5MK6x+yw152du/dxzQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNiRADiNOK9KCkICOBtSIcqY7Nc2KVrAGd++ENetmIfj6e6fyNHO+0d9iv4CMo2th3LpHxwMxLsMkdIGB/C/DvOKoFJZ5zd7/V36j/r3Ic9r+9bZXyDBtfk5gWoD4ae21iHvL6HqOUy1kcbEr4XeDS4oGG9FL/OFda7SV7/pBlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uwdZuG/9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB6CC4CED7;
	Wed, 11 Dec 2024 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931904;
	bh=vHm0I24vOCK9hphozbx59ldx5MK6x+yw152du/dxzQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwdZuG/9DGh1Kv6z9czTnByEkoQ7zv0Ni6reos4sf6Y+LDh737/aEjnOnrpzbywKM
	 MI7cbuFIN67NNDauEeu/pvjX/UM8XiGRcVOdHbwnmkMeK3I/BKuIxFewEB0AJUqmZo
	 YMo4QxJ6xG3o5gY7sE1SlZUtBDdAZ0OwjKEQwI3FItt3VwFzlA9Tv4cnPG/MzfGNC1
	 0TkVsoLpJP/U21I4jq7fnEBgdnT9JH/+4pj74d419+luMBlcSTGzSLnfkROYMdhreS
	 7PtOaZx+l/aRJG0ONrGstgp7mn7m5hCcPSwh89UlGIdIaN3TUHrMdvnTGujDQTUBhc
	 o+xjgo1wLNXqg==
Date: Wed, 11 Dec 2024 15:44:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <3b090335-20b4-4d73-aabc-ddac98311e33@sirena.org.uk>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-3-andrei.stefanescu@oss.nxp.com>
 <20241211124454.GE7139@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wVbzCNTZslHN//4Y"
Content-Disposition: inline
In-Reply-To: <20241211124454.GE7139@google.com>
X-Cookie: Every path has its puddle.


--wVbzCNTZslHN//4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 11, 2024 at 12:45:56PM +0000, Lee Jones wrote:

> Seeing as the vast majority of this 400 line driver pertains to Regmap
> handling (!), would you be kind enough to cast your expert eye over it
> please?

Is there something specific you're concerned about there?  It looks like
it's just data which should be fine.

--wVbzCNTZslHN//4Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdZs3cACgkQJNaLcl1U
h9DjSwf/a3+f8IyMBTLXlpe5a4EfnD4elhoE27ywlRj5aQYmHVvYh/b/32n4w27U
WkS8gziks+D3cLHY34wMDKv+Vvv20SrhfVTUIOjfzNibhRpIb4QhaQE6BBd4+iXa
aRkjxjYkPEUnAkkREJnTqhHddR1J3iNLi6ADGPmzRPd3vHbF5gwg7RytZpJPyYjr
y65mFPZIQQXb/9w3cEp9UTUyrpOy7bjV1eeoGj+SlnFmGipONjjS56azAV4IxBg4
2xgFkB28tT7gNMWacjT3ha8MGAKRPK+GFzYiVxFJo6nsBkajTLZ1RyVI+fjiFY8Q
yyJ5g5C3ZWYjAL87ug96nFUMV/sC8A==
=0gSx
-----END PGP SIGNATURE-----

--wVbzCNTZslHN//4Y--

