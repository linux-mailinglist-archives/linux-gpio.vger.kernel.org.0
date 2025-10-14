Return-Path: <linux-gpio+bounces-27131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0BBDAE30
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 20:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 374093BDFB6
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 18:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78282F5A37;
	Tue, 14 Oct 2025 18:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/lNTyQT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFF97083C;
	Tue, 14 Oct 2025 18:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760465097; cv=none; b=SevmRgaMoxkMP1i59uoAvz9MF/iISsaMEwusKgZai/uVKWdEKziE8U/8t2G9Bb/LONFN6T/nZJ2fJxOkiegak6N/ehO9EkhaWV96jfOW7oGwE7jITCjMXt8ptrmhYcKLhL6yDO5zOkWkTo0je/YoUWcx36V6Cdw5rWOq0xa7LmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760465097; c=relaxed/simple;
	bh=XkTcoOEhikNfdYenQLoMD9cYANodz0P4ptRHT0QHziE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfLrCo/EATpvnWD3BbpBzqp/KBO+ryNzq+xFkK7iY2dU3qBLefxhtqJC3kNckn8DqMEjQiURHqz3xh6LyGqW0FmMpg/+oEkI6grKyBd9yEHEi2SUhxCwgV0hzF0N4W5jpzVK/Yb5JOEMtVqsSRsxgrNLcJzTFl9LgyhZPOp1v9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/lNTyQT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06192C4CEE7;
	Tue, 14 Oct 2025 18:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760465097;
	bh=XkTcoOEhikNfdYenQLoMD9cYANodz0P4ptRHT0QHziE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R/lNTyQTzb3SyPdkaaWt6zYajhsIj9ue5ZW3m4AoH1QSaO1cyKOV/F+vFemY/qQuL
	 p9jqcYtb7P2yBuPbsh8H3fYdPegq73HDq+kg+cDAxtMiHtrMaCkbTjmRiHYKGut1YB
	 c1z/aSN0KLwwYDrfjKAoJeBWXjxTUN0MQ/KnXTIUZfwRCLfdPABADNZYQ2EWhYP7Dg
	 GABee502iJOBShuJ1xHVMit13DhyyiOb0+hk3Rh7w8Mc/1hZCAMrKHE9LvJQS3zoRb
	 qJXQFGcKsG9ySjQNX65Nc/KYtujILQbuCWnasJSciwib8fRTxLcAlKk05FtphzQYyo
	 Kj/US40GGssFg==
Date: Tue, 14 Oct 2025 19:04:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v3 02/10] dt-bindings: pincfg-node: Add properties
 'skew-delay-{in,out}put'
Message-ID: <20251014-barbecue-crewman-717fe614daa6@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="797F+UieUNy4iCeD"
Content-Disposition: inline
In-Reply-To: <20251014140451.1009969-3-antonio.borneo@foss.st.com>


--797F+UieUNy4iCeD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 04:04:43PM +0200, Antonio Borneo wrote:
> Add the properties 'skew-delay-input' and 'skew-delay-output' to
> specify independent skew delay value for the two pin's directions.
> Make the new properties unavailable when the existing property
> 'skew-delay' is selected.
>=20
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  .../bindings/pinctrl/pincfg-node.yaml         | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b=
/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index cbfcf215e571d..c3deb103d816b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -153,4 +153,26 @@ properties:
>        pin. Typically indicates how many double-inverters are
>        used to delay the signal.
> =20
> +  skew-delay-input:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      this affects the expected clock skew on input pins.
> +      Typically indicates how many double-inverters are used to
> +      delay the signal.

This property seems to be temporal, I would expect to see a unit of time
mentioned here, otherwise it'll totally inconsistent in use between
devices, and also a standard unit suffix in the property name.
pw-bot: changes-requested

> +
> +  skew-delay-output:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      this affects the expected delay before latching a value to an
> +      output pins. Typically indicates how many double-inverters are
> +      used to delay the signal.
> +
> +if:
> +  required:
> +    - skew-delay
> +then:
> +  properties:
> +    skew-delay-input: false
> +    skew-delay-output: false
> +
>  additionalProperties: true
> --=20
> 2.34.1
>=20

--797F+UieUNy4iCeD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6QwwAKCRB4tDGHoIJi
0vcqAP9GGuk9psTaHkfPXjaUQtfxqAsXqRhqDaXExHqvhEHf5QD9FGn7+lMqWTn3
gkgqoVZu1cClK8lWAtm67p7nBAiJ1gs=
=upTw
-----END PGP SIGNATURE-----

--797F+UieUNy4iCeD--

