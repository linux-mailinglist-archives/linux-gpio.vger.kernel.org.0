Return-Path: <linux-gpio+bounces-10723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4261198DE3E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 17:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08ACE281896
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 15:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3511D0B98;
	Wed,  2 Oct 2024 15:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLdb8/3X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE371CEEAF;
	Wed,  2 Oct 2024 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727881330; cv=none; b=gVYimK3TfijI9CwxDiLAy6o+GQZi+YcI82mZtH+JP3xUBUJKhL+YCN96sP850sPL9j6Ly++8P6lwIrZ57e3v1brPAraC1MTYQJHEFfK8WidacbO2blveGZgvJNhi4cV1v9yc9XJA6qK99a4KgBjUJWTJPlgy4QVYa7tw/Q/yXUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727881330; c=relaxed/simple;
	bh=z2eYCJF4rIaT1pnLBfDh2JPsO8OHxyySR91CO7CZvbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl8igaDfG1mYsQRTEGpukqAOKmAgtJYkrKEclrGOSU0Idawcm2MX3tVK/FLq76pn39TsgNGQN8ph+28eneS2FjiE2fZ6yGF684wBgiLbyVty67tQItm/AYTa9TWTC2FuiCxlilO0C2VGiwPOU9Tk0wQJMRmcjkR4ihzw7JJfBFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLdb8/3X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5445AC4CECE;
	Wed,  2 Oct 2024 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727881330;
	bh=z2eYCJF4rIaT1pnLBfDh2JPsO8OHxyySR91CO7CZvbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLdb8/3XqW+dtOmg1/V9DYQ2zsXnc5PHdh8zE8WSV495SS8dkn9pv+e9O/aBFtj7d
	 w+Du4JEb18zd/FEJJvTxz4SxflesPZYAs0jh6k+l5ShS7WyczZ++mDm0RZl3b7t+gb
	 UUtCTkXORS/FjnDLMSgPeSgaKU7YOzvOkh5ooWJIfsRZRrEXjiwCIMTCvR/NgGpegB
	 qJJO180lq9c6cbDCAdY/VV3luVAunJm57GeaM++nG7PLyq88H09xQqYDkfgCai3AMF
	 GYekK3sgjW3P0Cqo4bg7yFAEouqkvpyGQvLpoYgFH4PMUTALJ7LI+dvOoDsUDTjboM
	 3hRWB5ib85HeA==
Date: Wed, 2 Oct 2024 16:02:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: add S32G3 compatible for
 the SIUL2 driver
Message-ID: <20241002-finer-huddling-d02b451a7c16@spud>
References: <20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com>
 <20241002135920.3647322-3-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bn8q62BbtvVdo3hP"
Content-Disposition: inline
In-Reply-To: <20241002135920.3647322-3-andrei.stefanescu@oss.nxp.com>


--Bn8q62BbtvVdo3hP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2024 at 04:59:19PM +0300, Andrei Stefanescu wrote:
> The SIUL2 hardware module is also integrated into the S32G3 SoC. Add
> another compatible for it.
>=20
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

I'm not convinced that the representation here is correct for the
GPIO on these devices. See:
https://lore.kernel.org/all/20240926143122.1385658-3-andrei.stefanescu@oss.=
nxp.com/
Since GPIO and pinctrl share the same regions, that lack of conviction
extends to the pinctrl. I don't think adding another compatible here is
right, when I am already of the opinion that the binding is wrong for
the existing one.

> ---
>  .../bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinc=
trl.yaml
> index a24286e4def6..cff766c2f03b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.y=
aml
> @@ -25,8 +25,12 @@ description: |
> =20
>  properties:
>    compatible:
> -    enum:
> -      - nxp,s32g2-siul2-pinctrl
> +    oneOf:
> +      - enum:
> +          - nxp,s32g2-siul2-pinctrl
> +      - items:
> +          - const: nxp,s32g3-siul2-pinctrl
> +          - const: nxp,s32g2-siul2-pinctrl
> =20
>    reg:
>      description: |
> --=20
> 2.45.2
>=20

--Bn8q62BbtvVdo3hP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZv1gbAAKCRB4tDGHoIJi
0l1XAPwN6Pmv4rskvD0caLy6kyfvOdwcg4o9Ex7WCFpk3Uxn8AD/XWGCjgSBAdkO
P1iCIHPaeObx53gJF58fdBN0336chA8=
=Sq2D
-----END PGP SIGNATURE-----

--Bn8q62BbtvVdo3hP--

