Return-Path: <linux-gpio+bounces-6361-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BFF8C4E46
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 11:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13CB9B218A0
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 09:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCAC208CE;
	Tue, 14 May 2024 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0ikH23C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD593FC1F;
	Tue, 14 May 2024 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715677342; cv=none; b=ioo4vIvGTWhYDC/8C5qpeHyJVPnuTCcHkosxRenZCG2keEZjXtVRJOAQcjGLc8IlGOUKSSWv1bz67KdTnlbXe9ZjsABBjNCCkDSz3n3WKBc2QhEZDluweslCM96JUNtmkFainOkAgiOPbuaepr97q8x3F5NcO2D+L2sEZKGx8vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715677342; c=relaxed/simple;
	bh=dq+3dNl/Cgn0ftyFaKNE5FIf6AGfTJCK+jxS472G7zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWYgfgzXb4Uj6u6EHWkHM9hteh+BYZPtuI6r2IHHjdFDEMD/rZ4vJLwEzzpjSkrU7efMTAy8eDp64gCh4ktXRa7tc38amccW3VW0TCj2NOnRLHZVWBvzv6k2izrlninlncP6F+240wrZlS4eqfIuJarVZwPAScfLSHB051ADaeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0ikH23C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176ABC2BD10;
	Tue, 14 May 2024 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715677341;
	bh=dq+3dNl/Cgn0ftyFaKNE5FIf6AGfTJCK+jxS472G7zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0ikH23C4hVvHDm4IApvCPT61MxmuFXQs3Oqyo84bIJJ1gmUvIxkkLAcFX3azrT93
	 9zyYF80ggjIEmbAaXSpKT1OHBd/Wb1dXkBna/yoUu64g8pOh9i4JqrGhPVpw9K/w6w
	 sKwZI17ItYeFulmDnbfhZ8Glf/BtdV2fE8kTceUibep/K+NQC+ZN9mLRMm1ahTweHh
	 0LxFeUy5HASnlxwaQOPvNlSKRaX78pi9N05DfIASHx20b+TGEWPQoZp1yK0GdX9uOv
	 bSeOhzKACT6NruTmiL9xvOfYPSnRF7O3s0JzvKrATMq1niPdfBiYKVFh9sTpwZsoWw
	 D/DvJrQJwEo7Q==
Date: Tue, 14 May 2024 10:02:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	naresh.solanki@9elements.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
Message-ID: <d4c03f3b-a8ce-44bd-8897-8a2f276dede6@sirena.org.uk>
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
 <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain>
 <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
 <CALNFmy33wMHBcoU9ei0vVsn0gUM7-0jdkDDq_Loa3=mMWXiWcw@mail.gmail.com>
 <CACRpkdZhY_Yz2jHGXWO5_t8Qdey8me0Gytds7V64GYOFoEC2Dg@mail.gmail.com>
 <CAHp75VfA8G6KyhD5_HDyKWp5AdpsnnQ27gzTDRRjDRCVXkT-ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4mXBKb/9fYpeNFKE"
Content-Disposition: inline
In-Reply-To: <CAHp75VfA8G6KyhD5_HDyKWp5AdpsnnQ27gzTDRRjDRCVXkT-ag@mail.gmail.com>
X-Cookie: In the war of wits, he's unarmed.


--4mXBKb/9fYpeNFKE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 14, 2024 at 11:55:06AM +0300, Andy Shevchenko wrote:

> It's about introducing pages of virtual registers (from regmap p.o.v.)
> to access the banks of selectable registers. The cache most likely
> will be the same, i.e. MAPPLE_TREE.

If there's paging of registers then regmap supports this with the ranges
feature, you can tell regmap where the window is in the physical
register map and which register to use to switch pages and have regmap
export the underlying registers as a linear range of virtual registers.

--4mXBKb/9fYpeNFKE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZDKJgACgkQJNaLcl1U
h9D3Tgf/eawkpBC+TNPIWZ45IApZ6OiOvaArCouIcTfrOK/a0Dken4Ubf9OnSZAg
ZoE+nJFnU8aS1uUSWUvU7/VxJLM6GU5DcLG8HJT302vOdDa5WZjlV07bIslTmIVn
MS7QdSz9V07sryPC9Usipg/gUwxdPbL/umLCu+FcuwO8kI1tE6zAvxAlgSG6QqvF
Gw8JS6TIWUpKIWbTi7LBHWHhw23uyoTBXJmSjImQ7D6ZvE2agv/BxjK8eQz31pO6
fIsv0xjVXmdNgQKEBtRZxPByngdNPjp2rRbSvruyLoUO30e53hTYli9uDH2l2v+A
afmq8bh0jr26UgOjMU+J6TmoS6QL/w==
=IfmM
-----END PGP SIGNATURE-----

--4mXBKb/9fYpeNFKE--

