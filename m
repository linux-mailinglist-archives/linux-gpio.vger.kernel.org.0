Return-Path: <linux-gpio+bounces-7015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B331D8D64FC
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 16:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59678B29539
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 14:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30C857CAC;
	Fri, 31 May 2024 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtZN6to6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7865731B;
	Fri, 31 May 2024 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717167299; cv=none; b=c18JkwvqlJX4kD8sXL681kV0B2tMVylp3OUMfPWd3So1H4DXRl3iyYp7e8I6B4LJoVjck5iBkK55MeIz5/2wj4y1QYXfSNUqtJdH9a9cIUBw+hTa5pqDjjBcJQsDAO8lZKSoUnatcWRdlwmoYQGg/ukv/j+J5eRne3n7/BxwCPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717167299; c=relaxed/simple;
	bh=i1kVXZQpNzBXBNNszan6ktleQyNe1enP5ArnCCzpMqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLNOPsH0At43Cb8Vbz+Xp86sB6YEI3BS4ngvWM7WQwR9Ad9ZjxvGZgxuSa8zDZkTDSTjuDoAI2kcb/4xV2TQpTziCTX5tOt3H2Ndtw3dmkYgBG44ypQ/TUvS5n5AH/KVv8qGg1JEQlCNyPDPrH0WlF55Q+BpN4P/KdK18arM40o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtZN6to6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348C4C116B1;
	Fri, 31 May 2024 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717167298;
	bh=i1kVXZQpNzBXBNNszan6ktleQyNe1enP5ArnCCzpMqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QtZN6to6qAnOPYCaKPYRf+kYwMJx5/h1kWAJXYS4jKARUAa7q1dbdK3INmKVU7aJG
	 lEJ/RbTCPfSZg87sf08ia/5Y6NAP357hEzyQ0fg2fBn9KuzDznKgkKYm9k4KdPf1Z6
	 vktwZsf8K3vFl7zmsWjjHtz0WIFDOLNl4vT3B5Wl63ebXDUMJqB0/DD9X/JhH9a7jG
	 v8h9Ur+8O1cZNS+fF8u+5V9lpZarGf7T24Suh/eSb2e0YGWWL40BXceMsC1NUa+9b8
	 qOwmJaXqdXjUNJ8qTD+Edk0w29BFn7u8lcVZqsb1i2NZxc5ZPt5ZZtTLrlOC86WeQM
	 P9MNzlExsvkUw==
Date: Fri, 31 May 2024 15:54:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: brgl@bgdev.pl, linus.walleij@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: gpio: pca95xx: Document the TI TCA9535
 variant
Message-ID: <20240531-handheld-hunk-b09ce83401df@spud>
References: <20240531121801.2161154-1-festevam@gmail.com>
 <20240531121801.2161154-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zZuCGgq2NAC/g1/m"
Content-Disposition: inline
In-Reply-To: <20240531121801.2161154-2-festevam@gmail.com>


--zZuCGgq2NAC/g1/m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 09:18:01AM -0300, Fabio Estevam wrote:
> The TI TCA9535 variant has the same programming model as the NXP PCA9535.
>=20
> Document the "ti,tca9535" compatible string.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--zZuCGgq2NAC/g1/m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlnkvwAKCRB4tDGHoIJi
0nuKAQDGTY//RTAau/sijCBBkfvfLnspT3HW3Bn5D/j/mfVE1AD8D3kkzIzaasjk
n4NjJ7jIJJzLLnetYKLhCxYUYP0v/gU=
=hGNq
-----END PGP SIGNATURE-----

--zZuCGgq2NAC/g1/m--

