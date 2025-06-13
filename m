Return-Path: <linux-gpio+bounces-21537-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B66AD8B95
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 14:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DD7D1762F0
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469F92DECBE;
	Fri, 13 Jun 2025 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttk1X+Mk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF5E275AE0;
	Fri, 13 Jun 2025 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816387; cv=none; b=JFIrdqHKHvBg6Uy0RH6J8gc2IiPqm+/yZTbfQififemN0EL5ibfV7Cm3Gg2IWzrUD4Ab509csk5A1yjfGt8EpRylu3jr41ly0qwMlzNJehUNsvqS1baH+ASTtbo/DGnQ7KTJON9uhYJgiDtgVhf5CSrHlNtopQRCRXZH8bc6PpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816387; c=relaxed/simple;
	bh=BIcsBpXHfXg03QbBX/sXqJvQoxzxig2Amk4AM52b4sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHOZyD3M9+K8u4o4F1zch6fVihWmRcvHBhgbBU+ram3Y5uBjB8HUma4XWvlkUi/0foDFmMH4L3UrkBRoXa6YMgAvCJyjX1Y0riIp8CPyv2p/jIhniawZjBcjSjgsCbiO+oqbnEhyk4ZRbGMsu6RrZ2IpuE57GQFrFPx3V6lBG4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttk1X+Mk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBC6C4CEE3;
	Fri, 13 Jun 2025 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749816386;
	bh=BIcsBpXHfXg03QbBX/sXqJvQoxzxig2Amk4AM52b4sE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttk1X+MkvCC7Ja1zP/HhV6+6hna5AOx6Y0TQ/OXdzLpvonfo99unp+lCgJgjJ4PQb
	 i11+5rxF//qC9iFdcWhW+BMMIytwFy8zioHYocuZs/KxTKDcV8ILMWeURa7jYemhYo
	 pf5Kj101PR2mXf27UE1A0VZ+FwHL69xejbtKEuogc7BuRPwkLrK1f1jFJ/Ht1Jdg+x
	 2ginz21DEcBSoPhHI0iPp3R5whixINH5i3ooeiWiJAmwPjnujL2gghqRQN3mcy5IpO
	 GCGERLbZBTaNUAx2xJ8XWxttYeiG961Cudcbx4clrDizqJA61nI5Tvm7ugY41dXXd+
	 FJ2DcLpF+Q45Q==
Date: Fri, 13 Jun 2025 13:06:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 4/7] regulator: tps6594-regulator: remove
 interrupt_count
Message-ID: <8b9ee827-5ff0-441b-91fc-e406228a818a@sirena.org.uk>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250613114518.1772109-5-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pygDtv5/4tghC/Gq"
Content-Disposition: inline
In-Reply-To: <20250613114518.1772109-5-mwalle@kernel.org>
X-Cookie: Use extra care when cleaning on stairs.


--pygDtv5/4tghC/Gq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2025 at 01:45:15PM +0200, Michael Walle wrote:
> In .probe() interrupt_count and nr_types is essentially the same. It
> contains the number of different interrupt per LDO or buck converter.
> Drop one. This is a preparation patch to further simplify the handling
> of different variants of this PMIC.

Acked-by: Mark Brown <broonie@kernel.org>

--pygDtv5/4tghC/Gq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMFDwACgkQJNaLcl1U
h9AESgf9EMglMJXR+X0w+foDQ06ENi3AEXht5sWJBdcVGPF7p3s9sPW/pLMs5hHp
H2MrAM5P8h0cDiZ2EbzAGoZkeGHKQombn3NEnJ8HZTP1U9Qmx4YVXkWJLn1IwPxO
4vvvhaU/rQwqXYb+dMRdzbfjrucXBLdpor7PBi9pI7YSg2WXP9AeSWEFlRSrB1GP
xeZQ7jdRpqCY88RzSx4pkin+tWQDzzy/eo5VdfyBnsahcf/Mr+fOmvD9eAlYFWDb
B1F9zgGAt9+iu694OPLuQKSku+5OwqVg7tDDvllbrUErNz4XKkCBZsK22KWSA8Ms
1RiG8DBx1aTx1fAX0vOQIr8KQF3Yiw==
=RnCE
-----END PGP SIGNATURE-----

--pygDtv5/4tghC/Gq--

