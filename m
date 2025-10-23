Return-Path: <linux-gpio+bounces-27566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF35FC03121
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 20:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACC654EF3DD
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Oct 2025 18:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655DB29992A;
	Thu, 23 Oct 2025 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZl+5n9u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2782836A6;
	Thu, 23 Oct 2025 18:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761245449; cv=none; b=tLlKlpkQiTR+4/P352WpvNI+1MsjNMf2jH7JnORDmbriEE0CzenR/wa3U2IDoEnVtd+AY2kguaeiKqEQvud5UkPO24BFBNuUwajgyZ1KVcGI+iqOr7QmmLgpFtvxMbn/Jd1hjwkUq+dHoeI8p/YNMTXHH67GQzIoYH4Ex9liYdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761245449; c=relaxed/simple;
	bh=pmkyy2iRIDR1hgrgKOXi1EcISl1p6QEbGBXwWbteuVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFd1VlrnN0M77ldep/9AvF9c9ebLxvV+RkNGkpCGChLj2F/A5+Q4geKkh0uadoC69q8/C2ViNeXnaQ0ZQFsrHIsSk8pDTaUsslHRo8rsETymHueIua3Fqp6y+f1DPDBkWIzPIRzTwAkev/hkOeQUltdiMx0Kqa/3mfMqEROp9z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZl+5n9u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5E0C4CEFD;
	Thu, 23 Oct 2025 18:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761245448;
	bh=pmkyy2iRIDR1hgrgKOXi1EcISl1p6QEbGBXwWbteuVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZl+5n9uvNCE31Qo09O3KwUURfiUcdSN9aEx/GcGhai6II3myGrfG2YkIFNE0K0V6
	 FX0N2kamEmionLI4TqLH8RGLuO519ty2RvjjIBdULcTN/4ba6bj5x48r8iJti/MwbL
	 jMTEuYkIYYBnuapX9PPyqGPSmgwbr7lQLu5PVeb/UTGgack4qxS/MkMDndWW5Rd7oh
	 YqcQoxNM52fen9U2Gj8m8yalWAhL2WHsxuEk3CQUpUnZwZ3p/t7V5TttjFfteVjiBy
	 2NOUUW1EyXqRAwqGW8djEhLU5c70+B2OFVgFipS3lhJSgS17kFmmV9ggted1bZ6jXl
	 UuFPt1C8HPecg==
Date: Thu, 23 Oct 2025 19:50:43 +0100
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
Subject: Re: [PATCH v4 11/12] dt-bindings: pinctrl: stm32: Support I/O
 synchronization parameters
Message-ID: <20251023-mop-deuce-2a5b364c5cf2@spud>
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-12-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9MD3BrnpDScLq+jf"
Content-Disposition: inline
In-Reply-To: <20251023132700.1199871-12-antonio.borneo@foss.st.com>


--9MD3BrnpDScLq+jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 23, 2025 at 03:26:59PM +0200, Antonio Borneo wrote:
> +        # Not allowed both skew-delay-input-ps and skew-delay-output-ps

I think this sort of comment is effectively pointless, it just
reiterates what the binding says below it. If you wanna have a comment,
explain why they cannot coexist.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +        if:
> +          required:
> +            - skew-delay-input-ps
> +        then:
> +          properties:
> +            skew-delay-output-ps: false



--9MD3BrnpDScLq+jf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPp5AwAKCRB4tDGHoIJi
0nzFAPkB+S3fwX4Vb86zDJEk5T4qXXJxIkXaxZXRkZAETxDq4QEAzciIBv0IWNBE
6H75honujjY5hI9iJiWp4q/TraC1EAE=
=tf6q
-----END PGP SIGNATURE-----

--9MD3BrnpDScLq+jf--

