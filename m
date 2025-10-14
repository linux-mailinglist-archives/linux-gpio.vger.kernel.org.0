Return-Path: <linux-gpio+bounces-27105-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9ABDA003
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03B483A9929
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EF82BE031;
	Tue, 14 Oct 2025 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XnDmjJCJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB0F29BDA9
	for <linux-gpio@vger.kernel.org>; Tue, 14 Oct 2025 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760452246; cv=none; b=JDKWb5SbN9sNoDpTADfUS1KOovbZvjrbNdDci2X2xbnCkT7T14eYh4hwUfl/DZ2z+RKwU5GCgRuvPqFRxNBtpR2K9PVXcYzqMhNe9auytMks9OmozkmrLjuuPsLiJe39IdkFTIUrtfxiksxHSc4mpUX1nA9+Bg9izOsKM9M4Fn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760452246; c=relaxed/simple;
	bh=lmyEFnb3rou3T29UZK/sbNnlwieTzVpKAj+DLZhNS/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N62yfPVFRajtefd/t/AxbvPh2+2Hl7/MG9We3KtftZVe5HLpezdwJGzojs3imbe18dXum8kZHKnGN3d32lAFYnnmOhP0EOAQ2QhJKvv39qhDHgtkE/M6C9k9YvhcNpNjpIMLjKotAqx8m3o61G3uUeRQpukVuWkbpNKJ/vI6lxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XnDmjJCJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wVaO
	xQ5fv5jrDfBBuBq5m0mQE4kjfRcP5F7ECYlPJL0=; b=XnDmjJCJf/e0+D7ZOOpm
	vb3HFnucGnhx3G66gU/QBXJdHXIoRoJNCAKJeUu2b5uFSZS0gLYOPbO3JlxSCU6A
	kd/rSnjgqd406F+B+q+1CpoSN2ELk46Wr6Qhm7Qcl+fx9NUsSSK+iXleR45SUPtb
	Q/UVPHG6WZfWro0S7ckNIpo4bM3r6TDGWi+qS5Mw2K8DgQHhFQb8SaNCVw7fGNIm
	M4dqdN32dCnarMtCiE6S2fyP7G4HFROxflK4nYpFBw+IS9yQ4RZgCsc0FIRbvkwB
	4ueIfsWUlvSoWRsUp9ToEh05jdP1+MNntA8+8LvP2k/Cbnz7phExHksv1A7+17U4
	Jg==
Received: (qmail 3000523 invoked from network); 14 Oct 2025 16:30:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Oct 2025 16:30:42 +0200
X-UD-Smtp-Session: l3s3148p1@nBSBOh9B/wRtKPEV
Date: Tue, 14 Oct 2025 16:30:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 7/8] soc: renesas: Add support for Renesas RZ/N1 GPIO
 Interrupt Multiplexer
Message-ID: <aO5ekPxeg7tdFlHi@shikoro>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
 <20250922152640.154092-8-herve.codina@bootlin.com>
 <CACRpkdZPURiag1cUQZ319_QA83u+qOCSRALxpe10_+cTcevy+Q@mail.gmail.com>
 <20251001174205.71a08017@bootlin.com>
 <CACRpkdZ1qg6ecA5DyVEGUHQxLh0SnC=GC5JZdevT99YVWU0ypA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s0BX72F7mRu03JEh"
Content-Disposition: inline
In-Reply-To: <CACRpkdZ1qg6ecA5DyVEGUHQxLh0SnC=GC5JZdevT99YVWU0ypA@mail.gmail.com>


--s0BX72F7mRu03JEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

giving some details about the HW until Herve can return to this topic.

> Are these IRQ lines ever muxed for anything else than
> GPIO? In that case go ahead with this solution, I guess.
> But the title of your patch seems to suggest it is
> only used by GPIO.

True, it only muxes 96 GPIOs to the 8 available irqs.

> If it is only used for GPIO, why make it a separate
> driver instead of just putting the muxing into the
> GPIO driver?

Because the HW design kind of suggests it, I'd think. The GPIO
controller is a standard Synopsis one ("snps,dw-apb-gpio") without any
extras. The GPIOMUX (which is extra) is according to the docs part of
the system controller with a dedicated set of registers. Luckily,
self-contained and not mangled with other functionality.

I am just stating where this comes from. I haven't looked into the
details of your suggestion. It may or may not make sense to add this to
the Synopsis driver with a dedicated compatible for RZ/N1D. I'll leave
this for Herve, though.

Happy hacking,

   Wolfram


--s0BX72F7mRu03JEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjuXpAACgkQFA3kzBSg
KbZ50Q/+Nv6tC7a/spZ1gdx4lLrfThzj43fuAydmqVYZUCb+H2YhdYpYWZp2u9UK
JqD7HJypFbMeFX2P/JgJBGNwPy0tBNgBWUz+yBd7JCuhQePY1OsaWYD3RyvC1AID
UEeZ7QltxuHqoMIQfH2mk0Q5v8CmtsDY+Pk9g2cS7IYfg9S2Lsar2WU8UpvAuCyt
TktyLQ4NyMAl5Iwr7T/ZkKLNAkSxJ1sH3YZ+pit+aQ5PNbHPYJzrDkD0/DhqohgB
eyNnno1zPlrI2ujNj/rhtjsGr+d87qhMwwPHpL7fXKnjPe2imo2K9FYjmPORpTbZ
Yt0+oVAT6OIwXl+TcRfhrS//61p9DJIZKAKvETymyOpPqnaFCCJm26IugSmuC1C6
56EZ0Gsc4GOKm4YZ0qGBmUriGRPoYBGaU6UglyNrqGrmcj2P5B4rr/isOOjy3baE
fiMYvzr6opP/h1xhcV0cWBld15YGfEn+1kKOt+JGixgpbJjq4CAKkMnDk/CxVuVm
CoCMZD3HVscS+/vSb4OuQiJbzSNotc0nxNCZcM50Pl5MBhfeMt10/fxFqpgdL3Sf
jFj10D4FvstEb+ASTd+hMwDiuuhHK3nh0RKXL8+N7XKRrKtYqR6Cbkh+tAIYe+HO
0WK1Q0CJJ+ydmLLJw4XgGtTILkBATJixuJAF5uJVV1QJQE60GPs=
=R48r
-----END PGP SIGNATURE-----

--s0BX72F7mRu03JEh--

