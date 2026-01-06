Return-Path: <linux-gpio+bounces-30200-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF908CF8851
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 14:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BEDC3075C87
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 13:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FF87DA66;
	Tue,  6 Jan 2026 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcTUDOjp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A233093B5;
	Tue,  6 Jan 2026 13:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767705741; cv=none; b=n3f2WHJCaoF+v9ZZnTTM4kqagldmo/BFEvQl5k6LZ4ih5SdCpQo/BgNXLJK+pwAqdSZ1LioGAsy4jw+OuKlOu0bL1LlhXE8z1M5c28gvWpo8GdsXXiNSw5gBZFe0MINgGi75Am7Qw5V6XxzSh5lndfbxIDbLxgqJCBhVY7Tem8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767705741; c=relaxed/simple;
	bh=JcdaLSx0K0EgEvnxOuFGVWeNzSNH/YVsKmeofI+eCaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXk9sk3jTeay7a9ThGaTtvitYPRERX9DJi9wAPFks/ypdqZ8xxop6hvA9hVa2MirNdMTGpwqsD8meeJAR2jp3KgjDMfRk67VxCaQS5bCGSnh+8S4+lG9jmik6KDuMT7RK+oFBsVfM9GnJUz9hPlKYtJaWV2PRu9o0j7ZndwxljI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcTUDOjp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EA1C116C6;
	Tue,  6 Jan 2026 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767705741;
	bh=JcdaLSx0K0EgEvnxOuFGVWeNzSNH/YVsKmeofI+eCaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcTUDOjpMgy3GRg16rzbnj+hKn0PQIzX2mTfe7IDFkmFhPAIkwfTtW7KBT8Z+qo9d
	 zMQfQIsW/QjUyBva1jz7lqJ87a7QWMItc3wEFyXxCNbWcfdIGer8CggdKcrzGEWupP
	 pyxj5Ttfi0SYV1YJbnPl7nR7G+N/t9peGbe8dKZBmkm56R6xhiNVnrURtZ2sRn1zH+
	 6+yAJVwvG+vVNvo2vXn7XSVRQuq/YL75lJGNF394p7Kla+bUS3DcmXHeofR393txMP
	 p9NDsZSWdIUZ7dnkQKbDvrus55gF5Xa0CAqSuzFZntrESYtFTkxufNSrarVcDWXSJz
	 Ob4+biImbjQlg==
Date: Tue, 6 Jan 2026 13:22:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] gpio: shared: another set of small fixes
Message-ID: <80b4b9ce-06f6-4be5-9021-12c291257590@sirena.org.uk>
References: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Atpz/0QATBPOfG6a"
Content-Disposition: inline
In-Reply-To: <20260106-gpio-shared-fixes-v2-0-c7091d2f7581@oss.qualcomm.com>
X-Cookie: Post no bills.


--Atpz/0QATBPOfG6a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 06, 2026 at 10:34:20AM +0100, Bartosz Golaszewski wrote:
> Here are three more patches fixing issues reported with shared GPIO
> management.

This fixes the problems I'm seeing on at least
k3-am625-verdin-wifi-mallow:

Tested-by: Mark Brown <broonie@kernel.org>

--Atpz/0QATBPOfG6a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmldDIgACgkQJNaLcl1U
h9CyVQf+JSIefIxKMqXGCxptNCLrUxElk5HQPRGRi5DgR3jMZQXARCZBcvC46mxC
Td3i9X6217oZnLOXm+dTghXd+EY7KKLRbdsRVf2/lBYBWFSUzy/nhrpNAU9Tw3Kf
5BBcfX28k6+j9G4ZzkdWZMT0+wTomgQ1QvzFnKunuhyoedz2+HKMCVkGURb/yk9O
25ktc+vD9gz6DdndZyG69UPF0lcpGZzgrkeD3KMd7lSBe3J2gy8s4fpgBtOc9P6y
B19t/xkAdoRA0EqJ/Z7tHRnCtigakWAR2aaiZrblS2w7xbSI7WY1JyRhB34Ad90p
/KPxnnPeep3pgAlFXvM1ftgQUPqMew==
=sVxG
-----END PGP SIGNATURE-----

--Atpz/0QATBPOfG6a--

