Return-Path: <linux-gpio+bounces-15763-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0C6A31094
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 17:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 086493A2639
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 16:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6103E25333C;
	Tue, 11 Feb 2025 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsboMWEK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161801EC006;
	Tue, 11 Feb 2025 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289806; cv=none; b=Ualbqk9yNOpsld5fezi5kjmYITy1tyvf/XgH8p+uFJ4kDqVy2t51NxHXiU27lwOiDHM351Ras4E66ZPBK80j3dnW7ej0agigvUKVjBCvtpx1GdCFzEOhcrejS0DpI0pXloqeH4is8Wad2x/xRkExiYB78BRqFiZO3w53lToPUrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289806; c=relaxed/simple;
	bh=kxsQpoTjlLuo+6/EAnaIsucfdhVApFWZkHMOYayispo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4PnZvTFCGMyYJ6L/GXg+qDr8jCA+I8wxvLChnt0P0iMxi45MAYL5uZ99qSx0ukixdkz9CKfrw95yMZG2pEmggA3BILhwunBkswXZZ4hbwOLPRbh55gomjxeKSHXBphjky8r0mGWwoiJ2Kc0UQDYPZ3Uyt3dROp0jERIoR+KyGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsboMWEK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2475CC4CEDD;
	Tue, 11 Feb 2025 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289805;
	bh=kxsQpoTjlLuo+6/EAnaIsucfdhVApFWZkHMOYayispo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsboMWEKxcBqWSFSXuyBDASztly9n6g9HZFzVedkONqJ/LTS7KtxduERL6VZCsaU8
	 xWYLjH2gjbSfZSCjAG44Ew9qAbrO8br6kLkRDuqylqTDju/RC2hpVfgtMdhrIYaoZr
	 14HTmal0YOxMazPUM9bCN+GJkg9Qpfdp6sqS69Ln2TRY6VeQA8pXpbWmK6XQOJqGud
	 YZiXqN/r2VhYgE6qtnXCoKXTjG3RbTL5xlBOcfKD7p2ztXOabrtcYtM+eLU45iemQI
	 ZBQh/VV8q+aw8IcIEl68Xhz/cVEgpprOS2DdhIzfrOMvhGU7UJTuDe6ajVIG5EFT/v
	 JyzYELfDmLllw==
Date: Tue, 11 Feb 2025 16:03:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] pinctrl: spacemit: enable config option
Message-ID: <20250211-nature-kilt-9882e53e5a3f@spud>
References: <20250207-k1-pinctrl-option-v1-1-e8a7e4d8404f@gentoo.org>
 <20250207-promenade-hazily-d7900cbc127e@spud>
 <20250207223705-GYA7567@gentoo>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h4BMHotDS+6K3/CI"
Content-Disposition: inline
In-Reply-To: <20250207223705-GYA7567@gentoo>


--h4BMHotDS+6K3/CI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 10:37:05PM +0000, Yixun Lan wrote:
> On 16:49 Fri 07 Feb     , Conor Dooley wrote:
> > On Fri, Feb 07, 2025 at 08:11:42PM +0800, Yixun Lan wrote:
> > > diff --git a/drivers/pinctrl/spacemit/Kconfig b/drivers/pinctrl/space=
mit/Kconfig
> > > index 168f8a5ffbb952cbeae3e3401c11149558e0a84b..aa3dea535def87ed75d86=
bc555b2b90643adbdea 100644
> > > --- a/drivers/pinctrl/spacemit/Kconfig
> > > +++ b/drivers/pinctrl/spacemit/Kconfig
> > > @@ -7,6 +7,7 @@ config PINCTRL_SPACEMIT_K1
> > >  	tristate "SpacemiT K1 SoC Pinctrl driver"
> > >  	depends on ARCH_SPACEMIT || COMPILE_TEST
> > >  	depends on OF
> > > +	default ARCH_SPACEMIT
> >=20
> > This is effectively just "default y", since ARCH_SPACEMIT is a
> > dependency.
> >=20
> right, this is the plan, it make sense to bundle this config to ARCH_SPAC=
EMIT

I don't think I was clear, I was trying to say that you should do
s/ARCH_SPACEMIT/y/ on this line.

--h4BMHotDS+6K3/CI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6t0yQAKCRB4tDGHoIJi
0ttiAQDhOzm3TQQpYRWDC95izVfWpwHd1wIcfyQIYKv5Il1fiwD/aVhzIBicKSq1
x84qPJr6FO+I8bqpCddzB7pysdOBHAc=
=8t5s
-----END PGP SIGNATURE-----

--h4BMHotDS+6K3/CI--

