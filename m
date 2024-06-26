Return-Path: <linux-gpio+bounces-7727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C6918073
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 14:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D28872867CD
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 12:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB09181BA1;
	Wed, 26 Jun 2024 12:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZdVMn565"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD09180A8E
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403335; cv=none; b=XvxGGZxl7A3DBw9fdvVhcU+4Fu/ygYme6Ra9gSjqq9mqetq6/QucNKlWMvxsNtVn723S7e+E9wrNLgbRBlCH8kqFtdbPd6yjJrGICXwYtp1LY8OEjIpRZ8F3qMBlmgQUSXqAXsNOgYdHww1R4CHgRMOYJVnigHczMIhhc4Zgyao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403335; c=relaxed/simple;
	bh=K8CFtC/BQ1NSBa5PTyocHu/8UmRsW3sdLhXbzU88obM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuTgSpWnEsBbNm1xZzhts8aQLgAQjCCR2kYTCDFxWQm4mfFCQYzGtqSTWBU8Oyk5z8pdIKd9V1LocwCnP+oNxLg/sW0y0EwvJlLu8TBTcvjMswRiK16vfUL6pOKs5eo7FRnc/DnR1ydD4itixIShbnwiTyukKKjsz210sgTWnlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZdVMn565; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=K8CF
	tC/BQ1NSBa5PTyocHu/8UmRsW3sdLhXbzU88obM=; b=ZdVMn565NKxA7xvgTfEr
	pHzsqbFWTIN+mvhHZMiDiHwmUSLC8Kx8z30RIZDAi/G6rPiHj1bzLe0ZaIxtrQcc
	I7Br0rfryhpWK/KKLG33dD2S34TLxD6vBr5lDaC0rlN/66FWZ1WBEZUzP/5zcKc2
	v/yqGpr+A2A8rrp51Fh1j6O7mHedkMTwN9MgiNGgFk1O6Sv9dUSel8U9FuCI3Sa5
	NgnYOa2g8X2P6HQoJInfBKDs2VhJP/5RiGEtJb2SnHbz2s1GBxI74nN5H5k82N7w
	NGKUR86xCfdtUWz+YaIRvfWurgBfadG6NULw2tYbdUee4lcpkVEs9W/L3SAJ8kSH
	Rw==
Received: (qmail 562103 invoked from network); 26 Jun 2024 14:02:08 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 14:02:08 +0200
X-UD-Smtp-Session: l3s3148p1@wkmfyMkbQq1ehhrE
Date: Wed, 26 Jun 2024 14:02:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v10 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <umh6v3unptgsi7ph6l4s3txxyubyuzesscyddhtx4deqglc46h@c5shp5oienvi>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-renesas-soc@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
References: <20240620094159.6785-1-wsa+renesas@sang-engineering.com>
 <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
 <CAMRc=McPFAKh61r_L4kpTdD2HJCWo_u_=Wt3bJ5SMVmtSgE8oA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="opqqj3lpr4uiw5ia"
Content-Disposition: inline
In-Reply-To: <CAMRc=McPFAKh61r_L4kpTdD2HJCWo_u_=Wt3bJ5SMVmtSgE8oA@mail.gmail.com>


--opqqj3lpr4uiw5ia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I want to put my GPIO virtual consumer module in here as well so how
> about calling it "GPIO debug utilities"? I can tweak it when applying.

Totally fine with me.

Thanks!

--opqqj3lpr4uiw5ia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ8AzwACgkQFA3kzBSg
Kbaryw//QVXrqkGjTMzvIaQjDO6/q7NEAPthF4i6G2qNbubLPMOkzE2IezQLSwEb
SxPCvs1POwEOFhViPvXR+QjM0YFV9FHwy6Iwpk0UltiIPUm8DG2IFdud7cuJMENl
asARBWooefbRonqNc8EFf2yjtjZpHgiSY8KuMklr5JSMPOwj+tic9yuTXHZiFcpt
F7n4mvOhuRsWI34/eVVQQXAahaNfYOzZ3LY9X8w+ZNPhVQtx2Ho8fDi8gEy6ZKYW
mM2CrJYO/BxCfsz1Ka6yeISw3/t1/0+6AKYECHghz7ZP3Ms3MeNR5OSm4xDg+dNp
FPHLfebMIJhGsBiGduoD8lAavtC5BYz6Sqb0Ncajxs2FX+GVXlCDF6UnGMtzoqwU
VTrQYQbiEaWjH6A86ZJWf5pmkuoQDhhBBuXaQi3rzyUb7NSJve69BMrRGPF9ZvEQ
PcpV5Nus2ENLpZ/O+oKBNpTaxr4hgGjI00lj/D+yRMkKdeDPzrFlnYJFe3pEEmqg
bqE2WuTOJYSaCJn181WHjkxcn5t4HwXw1rk4xCFhf65jdl1AkOiWONJnr2yF0P6J
jMxnrjq3fHsqny8Ud5K0CSBlaIJN0O6/2w7SLlrEqim7VjldIF6JoIfaMr4B50+Z
f4kgxdSk0XBpgooPyUFJD0OK8yY+mo8eb4gcLihsXNaE1hkpvc4=
=v+0q
-----END PGP SIGNATURE-----

--opqqj3lpr4uiw5ia--

