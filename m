Return-Path: <linux-gpio+bounces-265-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7297F1781
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 16:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D95CC1C217E9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 15:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322C11DA31;
	Mon, 20 Nov 2023 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCgpEN1Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17DD1D55D;
	Mon, 20 Nov 2023 15:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161FBC433C9;
	Mon, 20 Nov 2023 15:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700494797;
	bh=JgmVlAD0SVlJwutybmB0QZ20Wz0K+sINDxYtLsbPzX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCgpEN1YXbuhuRySf7/jaCTIIj+j7Wj8bejNx/SYNsjABBuzqqSdM0NgPT05UNIWa
	 Nvsx8gG6Ky9D8CNCBGuarzZ4hFb81oa9J8Kg4ehL4qcB6vck3OjH9LJOa1tZ72L0iA
	 csiBwFfp31jDIAE2EbzI8KB2OdD0YXNLMFrHMMsSw/ZcxmeB8oBempmRHAWwapwObs
	 GGzWEMdvXDducbBRvFYQE7cyngvjnPVbqOoAx4p11NBLrVw84zBZtphM2i7hItc8Xv
	 XJzqlyXDQmpOfqhlnH6PH0/U3FVWaIXfg/0X9LTuBnDJdjpzVRL9CIP3VyTzKgYA51
	 5+zB6irvoN7Xw==
Date: Mon, 20 Nov 2023 15:39:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux@armlinux.org.uk, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	linus.walleij@linaro.org, p.zabel@pengutronix.de, arnd@arndb.de,
	m.szyprowski@samsung.com, alexandre.torgue@foss.st.com, afd@ti.com,
	broonie@kernel.org, alexander.stein@ew.tq-group.com,
	eugen.hristev@collabora.com, sergei.shtylyov@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 09/14] dt-bindings: net: renesas,etheravb: Document
 RZ/G3S support
Message-ID: <20231120-colonize-stagnant-014b8c3e088a@spud>
References: <20231120070024.4079344-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120070024.4079344-10-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EsTjh6DiHZ+G5q0D"
Content-Disposition: inline
In-Reply-To: <20231120070024.4079344-10-claudiu.beznea.uj@bp.renesas.com>


--EsTjh6DiHZ+G5q0D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 09:00:19AM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Document Ethernet RZ/G3S support. Ethernet IP is similar to the one
> available on RZ/G2L devices.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--EsTjh6DiHZ+G5q0D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVt9xAAKCRB4tDGHoIJi
0pyUAP4uVNs4gjXhcdJ2Mkl6p+n4LaYxSVRlvGqfTmIxUltbsQD8CiHoPxqOlRnY
S3CJKejSMjx7ZsCqXgD0ENkvFY5Pww8=
=dkRN
-----END PGP SIGNATURE-----

--EsTjh6DiHZ+G5q0D--

