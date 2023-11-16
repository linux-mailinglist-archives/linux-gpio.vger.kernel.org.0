Return-Path: <linux-gpio+bounces-206-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2C47EE2ED
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 15:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33F781F24B17
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Nov 2023 14:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B136321B3;
	Thu, 16 Nov 2023 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBOw/9G2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FD5328C2;
	Thu, 16 Nov 2023 14:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F44AC433C8;
	Thu, 16 Nov 2023 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700145339;
	bh=6Kn1U+qn6gfoSwPBsMGk4/t2qHphIqBsJSwlIIZY8gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBOw/9G2SLAkF927tJeI+f3v8LKCQZYB2RYsHiYEjm7ffMmfgbnB8/hb+pA66tboP
	 oWKkGhGuopbW5XyCOz6j0dum2GayeFQnH54N55kKo4nqZ/Hui1xl3XJedCeUizeLhV
	 3Nq37FJ5z5En1vqK92bOusuuZq2WZVIg9UWWorQYg5JtLYklM+MEKxSYHJwldfdklw
	 vwTmSPUi3VzT+2FNv4v/MEcmzMkALxzKfR5bn0vk2SSCkE6kIyGdHnelKEINifLsmd
	 m2jp5ULHanBjOIWvS8EDbNLNW2AB77WIxDF2SDCruX9z8F0QYnuzIcaM+h5R00IKyA
	 I1fIF0qc5AItA==
Date: Thu, 16 Nov 2023 14:35:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Chester Lin <clin@suse.com>
Cc: linus.walleij@linaro.org, Ghennadi.Procopciuc@oss.nxp.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	Chester Lin <chester62515@gmail.com>,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: s32g2: change a maintainer email
 address
Message-ID: <20231116-anything-statistic-0410278a2cbe@squawk>
References: <20231116001913.16121-1-clin@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XFHd10fz0iWRKVxR"
Content-Disposition: inline
In-Reply-To: <20231116001913.16121-1-clin@suse.com>


--XFHd10fz0iWRKVxR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 08:19:13AM +0800, Chester Lin wrote:
> I am leaving SUSE so the current email address <clin@suse.com> will be
> disabled soon. <chester62515@gmail.com> will be my new address for handli=
ng
> emails, patches and pull requests from upstream and communities.

Consider also updating mailmap.

>=20
> Cc: Chester Lin <chester62515@gmail.com>
> Cc: NXP S32 Linux Team <s32@nxp.com>
> Cc: Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Signed-off-by: Chester Lin <clin@suse.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinc=
trl.yaml
> index d49aafd8c5f4..a24286e4def6 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.y=
aml
> @@ -9,7 +9,7 @@ title: NXP S32G2 pin controller
> =20
>  maintainers:
>    - Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>
> -  - Chester Lin <clin@suse.com>
> +  - Chester Lin <chester62515@gmail.com>
> =20
>  description: |
>    S32G2 pinmux is implemented in SIUL2 (System Integration Unit Lite2),
> --=20
> 2.40.0
>=20

--XFHd10fz0iWRKVxR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVYotQAKCRB4tDGHoIJi
0jxiAP9qg9oojQRqaMa5oA5FjBPfXBrlQghFQaC637ksKm/TogEApk8zpPB35gXQ
0KHniR6mtOmrL84OcfZTJiqqxWywtQo=
=U5R6
-----END PGP SIGNATURE-----

--XFHd10fz0iWRKVxR--

