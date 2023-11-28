Return-Path: <linux-gpio+bounces-596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3D7FBF47
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 17:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40409282A02
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 16:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D4758AC1;
	Tue, 28 Nov 2023 16:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKD719tJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C89A37D31;
	Tue, 28 Nov 2023 16:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B11C433C9;
	Tue, 28 Nov 2023 16:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701189441;
	bh=Rkd2WObdqH5uyXpuMYX4mfs7gUlcc9XyM6odEGDd6zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKD719tJUPV7x06fQ4wUQOdLYKRHwTYW8djLX2ZVzUjYTFhF4K8srnifyC+ebImgl
	 sPCxll/LdF/rbFKQuAjq6TsZq39WxvF4Dt8d+QtdXqj+IPJ4YRXrZVbMwdcRcRb2Fr
	 q+FZNB6R6UsaWyVG3vCbr0mtede+P5GAVA19+QF+5IztWPIVy1HXASNzumQRtyqIyN
	 zGGOKa4PwNeFL/FSf7rBN+iJRYkyNHZBJ50BYlU7qiAAueOWamhyzjIjhrsH1E5VsF
	 10vaONG+jJasv8oR1UL4lOdtDfR41xUWoD4KwF3SOLmigDMwE9US3XND4NrQzjmptj
	 mV8BQfdM55WkA==
Date: Tue, 28 Nov 2023 16:37:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	thomas.petazzoni@bootlin.com, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, u-kumar1@ti.com
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: pinctrl-single: add
 ti,j7200-padconf compatible
Message-ID: <20231128-obsessive-vessel-9dde08c823e1@spud>
References: <20231128-j7200-pinctrl-s2r-v1-0-704e7dc24460@bootlin.com>
 <20231128-j7200-pinctrl-s2r-v1-1-704e7dc24460@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1WiGEFq1eieLw4sy"
Content-Disposition: inline
In-Reply-To: <20231128-j7200-pinctrl-s2r-v1-1-704e7dc24460@bootlin.com>


--1WiGEFq1eieLw4sy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 04:34:59PM +0100, Thomas Richard wrote:
> Add the "ti,j7200-padconf" compatible to support suspend to ram on
> j7200.
>=20
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--1WiGEFq1eieLw4sy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWYXOwAKCRB4tDGHoIJi
0lZYAP0VgA4r/SbyFNFipdXQIjedIczLudV1H+qbE9BZCRhYaAD/fOCazM+LUpxl
yiDLCw83aMiMjGVy8VieNXylZrJqXQs=
=AtN7
-----END PGP SIGNATURE-----

--1WiGEFq1eieLw4sy--

