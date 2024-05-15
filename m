Return-Path: <linux-gpio+bounces-6403-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F898C6A64
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 18:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A355C1C2213C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 16:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1568C15625D;
	Wed, 15 May 2024 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqIn4OBj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C417643144;
	Wed, 15 May 2024 16:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715789841; cv=none; b=eNQ0+daUaZOSMHLR0GPw3ZxaEuW1Wz94Q46DJkGowKAW1TIC+GGRGotnsCFAqDRwS2jWe2H8iazFXDUmZR/fmEM07p6ABvPk8DC9XVYh+3ECWojCNyhACQAhRNIJjutMTPSDm8Hv5jkPdiUIDAt0RlqSmWisB6uTRwUb5T337zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715789841; c=relaxed/simple;
	bh=Up7Qd+RnNSE0g+RPd3RLKdbJ4Lsonuz8jKQ/5bGM+cI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Okw4Xsc2z1jRUsmzBdhR4jmoT/QGxcdpuKAZ32+Xo4tJi/82nsvkxMFLJNzHxX+Wh6dJRdLqtH+TOY2uRKN9cDeKw7Qtl3/9VmiGV2rNXZxg1DDKj5yUzSr3etsw1QdRBVyUIgENUYRkefYPWkJLWlu6DD7TlYWC0sOLjIetwfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqIn4OBj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF1FC116B1;
	Wed, 15 May 2024 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715789841;
	bh=Up7Qd+RnNSE0g+RPd3RLKdbJ4Lsonuz8jKQ/5bGM+cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqIn4OBj/Z4fZGbVuthGf2mXnKuXE6UMXatVzdZvXPJCD9CK1HjmGWm7z+ki+79JJ
	 l+MtyvK3Kl2jOwq/EZJjn0qEouFRmSUfE1lXyqqxIwbGrqd/Amydg8nOsomcnHKq3z
	 dtHevbEBNTf3hoHAVZBg8sh33QtY99heTNTfloY8vWzc3ryPB6gOMPC6x/tNuuTQv7
	 IPG5x+lcwZY8/O7nFko/axF4L7aZhDOiBK5cpLnEYx8M0Cm/0O71d06xHLM6/G1I/E
	 9Oz063wN+BCwtHfRdd80hMnw2sxn5Pdi9l1Apr2MNU8G8vxMsRQ09XsLWKO0OEw8ng
	 Xo5KONvwKJXCA==
Date: Wed, 15 May 2024 17:17:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Dmitry Yashin <dmt.yashin@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Jianqun Xu <jay.xu@rock-chips.com>, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: rockchip: add rk3308b
Message-ID: <20240515-exorcism-savage-14e78d3a8c61@spud>
References: <20240515121634.23945-1-dmt.yashin@gmail.com>
 <20240515121634.23945-3-dmt.yashin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lUv3gfX0lhAXHhn3"
Content-Disposition: inline
In-Reply-To: <20240515121634.23945-3-dmt.yashin@gmail.com>


--lUv3gfX0lhAXHhn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 05:16:33PM +0500, Dmitry Yashin wrote:
> Add compatible string for rk3308b pin controller.
>=20
> Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--lUv3gfX0lhAXHhn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkTgDAAKCRB4tDGHoIJi
0tumAQDKgVyAz45elnE7dPP9C+WkoMrgDSwJVx8keW09dm25cQD+PU11FfYGPlnI
D0cSeptu8Pnbd8cnxtLpzL8qCyNJNAk=
=vjeV
-----END PGP SIGNATURE-----

--lUv3gfX0lhAXHhn3--

