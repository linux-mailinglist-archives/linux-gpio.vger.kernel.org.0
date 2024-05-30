Return-Path: <linux-gpio+bounces-6962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 571288D4FDC
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 18:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0488B1F21CD9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 16:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7181CF94;
	Thu, 30 May 2024 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKvxHvoM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303476AA1;
	Thu, 30 May 2024 16:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717086744; cv=none; b=GRouoT0ISK2PhiXq2OIjqkMRhPxktqIaeOmwJz7PoBlW73dxQAatH0oH00Esm3bKfB9caY8+8glZkblwR70T9Z4NocWJSmCVfU2gjjAKQ5r+BfgCGI5aZl98k62z/5JSgAp7d+8Ff+zsyFFURN2iU936QDV8r/4Cw/wC5cKie5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717086744; c=relaxed/simple;
	bh=OTxGST8XNys/EMwG0Pwv+gYvKJ4FkO3COc6Hrnsr/N0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLV/JaEUYh1CrPT82yBpysErDEB2BwK4VNolMFa5Lc0JBtLC+B9eEG0b7jTRuEbsFPBEipZwvow/AF1kH7ei6t56zlYWcjA93ceYC9uo3cz6O2muIVMYzIsGBKO46/yFcCqmyttwGptBz6K/Ny5q5Ikjkggu5PDxCPJd00WVDYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKvxHvoM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E210C2BBFC;
	Thu, 30 May 2024 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717086743;
	bh=OTxGST8XNys/EMwG0Pwv+gYvKJ4FkO3COc6Hrnsr/N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eKvxHvoM9L970qC3PjwvD1ebAgB5Vi646X7qIhRXWCXnd7/3doEc1y4ujhtgFhD8g
	 l/+ReQeD5E/fcCAcUmTpGfT4opDuTSLFcSruguuvMC20E2PxjrvBlCSHqAAV9KTboJ
	 dTJxgTFwui+e9wwVabEhdQbSGfESq48OKRRZ6BRylIv2I4EFhOrnU29AX5zdhZTFYk
	 b6jz8MQnCMTZJ4+SHtGwNLT+xHsvrlG7ulQQyTZ/iPaRv7ILgPVeA/JjQ2K/fdiTEz
	 ZcW0g3k43jd/iDhQanVRc/ABP4L7qbWHWj4qkbQZ76cFI2baA3NQNWGz9tQAdUrT0j
	 8qBv6ZvTLmf1w==
Date: Thu, 30 May 2024 17:32:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: gpio: aspeed,sgpio: Specify
 #interrupt-cells
Message-ID: <20240530-italics-ultra-6322f9475567@spud>
References: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
 <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-2-912cd16e641f@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xWG7h6S3iMDrMBsD"
Content-Disposition: inline
In-Reply-To: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-2-912cd16e641f@codeconstruct.com.au>


--xWG7h6S3iMDrMBsD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 11:09:49AM +0930, Andrew Jeffery wrote:
> Squash warnings such as:
>=20
>     arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: sgpio@1e780200: '#in=
terrupt-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
>=20
> Also, mark #interrupt-cells as required. The kernel devicetrees already
> specified it where compatible nodes were defined, and u-boot pulls in
> the kernel devicetrees, so this should have minimal practical impact.
>=20
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--xWG7h6S3iMDrMBsD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZliqEwAKCRB4tDGHoIJi
0qKtAQDGasgNuDwkEHMlzMlvShE+BwoFZbZJcIXDNIgOUmaUgAEAvGgvfp+FbII6
TqchReUrnKMkeo00YnftuwduREe17gk=
=emAm
-----END PGP SIGNATURE-----

--xWG7h6S3iMDrMBsD--

