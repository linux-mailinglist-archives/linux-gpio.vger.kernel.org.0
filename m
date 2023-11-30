Return-Path: <linux-gpio+bounces-785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A257FF3BF
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 16:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60F99281989
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 15:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2D8537E0;
	Thu, 30 Nov 2023 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6VxUD1L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9BA524AD;
	Thu, 30 Nov 2023 15:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76032C433C8;
	Thu, 30 Nov 2023 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701358735;
	bh=JyZrCEWuJr3UJ8ptLiE9BjwRcPlFLohLX1z4SZtoCc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6VxUD1LQowjoVs9LvLC0iPEFMTeayaZsbGh9fEpkTzbU/s8ZasCi6OGr4QqRJl4i
	 wyEH6YDAtumwM7d0HFn1SoVHPzxEt87wP+e7cvW3Yx+tY9q8KK/cBvZ2aupfb+dfm1
	 iSYFDaYgLIAMtrtlLlxH5rHR/un6vO0P0IhMDLqluNd+7xyJ353BiQPh3XrTKfL6dD
	 3X/PlCyW0X18LIt2KNGNg8qMPzpnTw10On00yWiGmITgojzcj+yj00AMR7n5rYTgsU
	 CWgmgyMxOVX4zG0D64mcvFbD549vWMaHOq1HDEnbHjp+i1etlwA2MPwGfHvDSYgSt+
	 jOsZSND46dRug==
Date: Thu, 30 Nov 2023 15:38:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sm8550-lpass-lpi: add
 X1E80100 LPASS LPI
Message-ID: <20231130-cushy-hamlet-c8b3a1d183ed@spud>
References: <20231129155738.167030-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BRctadQJgsOjKQYl"
Content-Disposition: inline
In-Reply-To: <20231129155738.167030-1-krzysztof.kozlowski@linaro.org>


--BRctadQJgsOjKQYl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 04:57:38PM +0100, Krzysztof Kozlowski wrote:
> Document the Qualcomm X1E80100 SoC Low Power Audio SubSystem Low Power
> Island (LPASS LPI) pin controller, compatible with earlier SM8550 model.
>=20
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  .../bindings/pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml     | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-=
lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lp=
ass-lpi-pinctrl.yaml
> index ef9743246849..ad5e32130fd7 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-lpi-pin=
ctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-lpi-pin=
ctrl.yaml
> @@ -16,7 +16,11 @@ description:
> =20
>  properties:
>    compatible:
> -    const: qcom,sm8550-lpass-lpi-pinctrl
> +    oneOf:
> +      - const: qcom,sm8550-lpass-lpi-pinctrl
> +      - items:
> +          - const: qcom,x1e80100-lpass-lpi-pinctrl
> +          - const: qcom,sm8550-lpass-lpi-pinctrl
> =20
>    reg:
>      items:
> --=20
> 2.34.1
>=20

--BRctadQJgsOjKQYl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWisigAKCRB4tDGHoIJi
0rOoAP4iSd2hLjqO+JZop/z26hiw97HgeEijD9cpN2iMMpFA4QD+LEM7VHDm/tnl
Jpm63MsCmEo9QRQ3HN7PIohIJlRnbwg=
=YhlU
-----END PGP SIGNATURE-----

--BRctadQJgsOjKQYl--

