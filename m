Return-Path: <linux-gpio+bounces-6341-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 317258C449D
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 17:52:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E8781C22CA0
	for <lists+linux-gpio@lfdr.de>; Mon, 13 May 2024 15:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982C0154BE8;
	Mon, 13 May 2024 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/ylobXw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45275154454;
	Mon, 13 May 2024 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715615549; cv=none; b=L8UdWHWTzyZ9Pb9nUWyqRZtTgiKpN3ciSWpJx7QzazSVWmGYvpys70oOyA2TUphThWFuj5JnQzl0osq/tTRi+7sutydzIVxjX3e6FJrqnxoy6LlmLHcuEXrXMRRXX7bVHQWVCE07Q+ZtU0l9qeZUFxLh8IoNxKaN1s3HBLmafYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715615549; c=relaxed/simple;
	bh=75oUXoThArbKO9d+Z2VBTAalA0tvT0Hl3rs3i7zDhpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLeU8tqnUPUejVam7XJci36zGcoLfiHS8noLV7yyNURcRplygSsYC/cIILY4Npjf+nh/l6I1gA/ygUi0aG4/TYhnai/x1lRMabd0T+Rkdq30ULaYQz8nHj49J0yKSZ84hiEukgFS76bIYGr2WReXuW9G1HETvmsjCNOjCWDoLVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/ylobXw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A04C113CC;
	Mon, 13 May 2024 15:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715615548;
	bh=75oUXoThArbKO9d+Z2VBTAalA0tvT0Hl3rs3i7zDhpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/ylobXwd7VbMVe5SZijuHybR9/viyvDmLqnsjPI5wKdNrwYWOV9ldFMfbYgMjSW3
	 CT1ar1NzJbZmkRAtbn5WLVNOxJKSJWm9n4yiHl75DDaX0eCqrgOR4+Jx2bq9/up9Nf
	 frU78yhv9D+8CZwH8XqhNZcObRSxLJxqY096ijIm+pQ/SOaGG9xYrG8r1AYAjcl8Wk
	 23yXpcQwUIuaYpr+1W0EzoxJbOSoQiDmgj1FAmXmpsJbPWjSXcPqb7glY1tevr3jHn
	 hXMfdIP6cAEGP0zy8SpJyz5VoUIt+PlmlXmvhAB84ZEVOGBlQ4Al9k0s704R9UU3e1
	 iAe6gIP0jxQqQ==
Date: Mon, 13 May 2024 16:52:23 +0100
From: Conor Dooley <conor@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: imx: Support i.MX91 IOMUXC
Message-ID: <20240513-unmarked-lurk-70edc676de22@spud>
References: <20240513-imx91-pinctrl-v1-0-c99a23c6843a@nxp.com>
 <20240513-imx91-pinctrl-v1-1-c99a23c6843a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IB6mHrhOGrSkI2CG"
Content-Disposition: inline
In-Reply-To: <20240513-imx91-pinctrl-v1-1-c99a23c6843a@nxp.com>


--IB6mHrhOGrSkI2CG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2024 at 05:20:46PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> i.MX91 and i.MX93 share similar design. They could share same dt-binding
> doc, so rename fsl,imx93-pinctrl.yaml to fsl,imx9-pinctrl.yaml and add
> i.MX91 compatible string
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--IB6mHrhOGrSkI2CG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkI3NwAKCRB4tDGHoIJi
0pgzAQD3d1IeZ8b0wLTFJJ95fjJ2Q609ddPtd03Luv1hdENw4AEAsk0RA/+UlonM
ssqf2EyqMRFAysuP6wxT2tTHB0c1RAY=
=hAAr
-----END PGP SIGNATURE-----

--IB6mHrhOGrSkI2CG--

