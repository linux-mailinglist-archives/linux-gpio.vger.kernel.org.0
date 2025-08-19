Return-Path: <linux-gpio+bounces-24546-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C95B2C2AD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F120B188D3C4
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BA43314C2;
	Tue, 19 Aug 2025 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OW0uyy5S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6231FE47C
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605103; cv=none; b=YakSGxbLs3GhTzIrIRukub1Q3vf7FfnZyLfpAPfV3olClfjok51io6YLuHtgeaHLO+SSw42U8351EU1bhkB7J4h/dgkuU0j+V0D8R/0jjUpjOhbrr+pQi9F5nl1gDO1ApufR7YJ3LJcBSeKZed1P68OZismxfpLvxpMMSPBlQxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605103; c=relaxed/simple;
	bh=HN0sij1BsoWtoIN7+67MgxV0qfk46KpnyOLGtDsFasA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6tMY5xZpD+bELPAKf4ukQ09Vrv6FQNvXZvlpsQ+4rf62v026YDawv7GFfMjtgp/7T3ysAVgqy1lkDISi0cDHk73a6FWcCk8uu5QJv0tiOVM/ek0069PFeam2RHMbnzmW1DJPBRuqOVMcywkOiYR19Gsz7B732KUaVTEh6omdvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OW0uyy5S; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HN0s
	ij1BsoWtoIN7+67MgxV0qfk46KpnyOLGtDsFasA=; b=OW0uyy5SwoKR90sXQxOS
	GpZce9mtHfke53eyuZb7zjxlE+W++nQgPN1t+7mYASvaiP0aH5MCaojFmp/kRYQA
	tUrIadWopPzO7xAs6+xDv+qGIJZrK4Kl3Qn+QDTQ1gPdmA7YQBGOBElVliPs5Wno
	KXt67tZQk1YdpHfCOva3vszBKGYH/ngwO0a9OXTNI6mZGnIlGo37Jo5XRtoE8Ffv
	nh8aqWsdxdm2CBxDxvgD/JnuuNhkDf6r4Q6T6lswaxvSVJr7pnkOUSWH9Hd+QhK/
	sACPtlGSRcRY2XPos+8bcweLM4k80XizrZgRsZAAOrD9xHhwZzhte4NliTybfC16
	YQ==
Received: (qmail 2774639 invoked from network); 19 Aug 2025 14:04:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Aug 2025 14:04:56 +0200
X-UD-Smtp-Session: l3s3148p1@8bgTqrY80rxtKLOA
Date: Tue, 19 Aug 2025 14:04:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 13/21] pinctrl: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aKRoZiPYd9N6ir95@shikoro>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-14-wsa+renesas@sang-engineering.com>
 <CACRpkdZgmW9MXAKbMxQ9dHz8-Oi8pVCPqnV5OE3FbA4KT+0yQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N28sSKS2A8Oc3REC"
Content-Disposition: inline
In-Reply-To: <CACRpkdZgmW9MXAKbMxQ9dHz8-Oi8pVCPqnV5OE3FbA4KT+0yQw@mail.gmail.com>


--N28sSKS2A8Oc3REC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Patch applied, rebased on top of Adrea della Porta's changes
> and fixed the two new instances as well.

Thanks, Linus, for the additional work.


--N28sSKS2A8Oc3REC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmikaGMACgkQFA3kzBSg
Kbb74xAAhRrd6lm5HXiKfqH0Q4CtdhLGzvIPcykTwisCig21gHZTDQ6aSwzUTRZo
/eosWrDdr65IEDdLgQlS9j9ZcGW/oOkDdrddc+hH49r0JlH1iwDV8JZyYWZ2cpZx
62GQyqkv54wdvKzmMyzyevdlDK6F6c5tNymvgbKe+6+q3dWLAjPDfjkCxzxGXGMT
oXWSODH8bNJTskSkvdbH2KT82uKqtxT1FqwdB0QtmZjQKVYubUMw/2xMexZBCzqw
NnF2i+8roAsbK7feXuRF6C03ee2N//yW2ycSjRgAHBJ31PQ26nUN+hZChqnVFuvZ
hIZGkRE2VALfPEzccR3sywF9ydm1UygHdeyQ1mz41/qJnjzmZlFcFln6bwGrjUrU
a7YXku3BquEzRlOnrP5CpX/GHPReWNq25NaXx2KFD4L+p9C5kTwoQu0J5O9WT+9y
AGJIFkt//itJoU9CNGd0liSETnyW7w7CvyVZeVpaF0bfjL7uxt3Fp2N55f7EYUYo
k7cXPoMh0WSO5MmPF/zodoaVM7V51sM9fm8vMH94JsJMBO4EGroaQ9V2Hys6qsqx
3mf90e/N6vcuVDWtJjLtn9KPd0p81hbNKDk0QD+RETXGyPKcdnyZZNJV05lQFw+g
HvxrXLaIFyFHyNww4mR+ZBUU0/uxtJCib4/r41NUuwrnPYzGnKw=
=7bpa
-----END PGP SIGNATURE-----

--N28sSKS2A8Oc3REC--

