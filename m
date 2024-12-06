Return-Path: <linux-gpio+bounces-13585-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E78BA9E7633
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 17:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C9C286CFF
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Dec 2024 16:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED65206282;
	Fri,  6 Dec 2024 16:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCQESq+c"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5200F206273;
	Fri,  6 Dec 2024 16:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733502992; cv=none; b=kKkQ5SWAxRzs+M8l+3MBzlwEN2sAqceRqfc5WUNsV2wlmna0/iogCWg+3wwYRL0Nk/ssCRyDrIbuiNWaxeWwLe/w3cTjuCJvwzCOWJx+gEMPVV96vgj+8MxPYqHJD+3OBdJtdnpTkykNuQnHTSips91Ohr3bGmHoTjOlptjIaqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733502992; c=relaxed/simple;
	bh=f0JCSl3eEIe4O+kUioGo6uYxaUYIgbxlOJ/6YCCX/yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZ8txi4SNXCs3cRjIq5ih0V/ewqzU9QH9t0jn+AZWE5LF3SqPFz03kxvyOuItZG0pHM8usasHWqShplffWIwJcvn5y8S/W9RPJk+EBRa8nSWQWJiSm5+NriHocwUeAwTprGNelWBxIR3GGNOVP+AraAvKDfocEdmwYVW8FbHYmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCQESq+c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BF7C4CEDC;
	Fri,  6 Dec 2024 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733502991;
	bh=f0JCSl3eEIe4O+kUioGo6uYxaUYIgbxlOJ/6YCCX/yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCQESq+cthNqSRmp0E58nsxzIXebRU7wIeDl1EixTIgCgWyg/rIcoUXUnHBOShMRC
	 q8J/Hw1fW+ULA+4+DImPEc3LrBSjQL9uKPsMA5faEMsDy5sperzhhFsIYHLydEW9PR
	 /z9M21LyAJ2sIrUKnC3LWCoEqJj0b/X9lFEO1J8k+14NXClspMXZERORO7xwfz2Qrq
	 C9jxspLz8G0Ym1NhEx368qIAWWM8tqS6w4F8mtl16jGyrQLWksB2NLUfU7KI4CO8Jx
	 xelN9dCiHArIkPzkHm/nBfGZdMMCNkkYo50zGaMsGefrzGuoxPPtGDvdIbsxZDyjEX
	 B2o35vQCmlJOA==
Date: Fri, 6 Dec 2024 16:36:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
Message-ID: <20241206-steadying-rethink-fcc9b1b445ef@spud>
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
 <20241206102327.8737-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mJsvLRKjXssFipFR"
Content-Disposition: inline
In-Reply-To: <20241206102327.8737-2-biju.das.jz@bp.renesas.com>


--mJsvLRKjXssFipFR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 10:23:06AM +0000, Biju Das wrote:
> Add documentation for the pin controller found on the Renesas RZ/G3E
> (R9A09G047) SoC. The RZ/G3E PFC is similar to the RZ/V2H SoC but has more
> pins(P00-PS3). The port number is alpha-numeric compared to the number on
> the other SoCs. So add macros for alpha-numeric to number conversion.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--mJsvLRKjXssFipFR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1MoCwAKCRB4tDGHoIJi
0hj2AP4unMrXvo1Qrrho3o0LJXh2TDUrYOIIXhRGR6CeroHEugD/RNaZUThgh5/o
K/WCOf5p6rvRH5aNtaOmzXOHPK2ahQQ=
=1F44
-----END PGP SIGNATURE-----

--mJsvLRKjXssFipFR--

