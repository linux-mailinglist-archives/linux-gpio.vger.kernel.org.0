Return-Path: <linux-gpio+bounces-9282-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 765DA962D07
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 17:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20C171F283D4
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 15:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E411A1A2C38;
	Wed, 28 Aug 2024 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSHlBo+l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD2036130;
	Wed, 28 Aug 2024 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724860423; cv=none; b=lwlY+/Cskz0Fz0zfyEAJ9/3EsbW6T6wuAL0gUDwtuZA0+PmJc341xSCzpgyRcHCB5OzqXYWl2lmYlqZcyQUsG9OkPB2/LFKqlN1KFVMOSMqmEYvswhVAUd6kFgnCV3kGiErno0aV5rp7qke0MirK2LvKqthHJpQbxfIJXBn2BQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724860423; c=relaxed/simple;
	bh=FceCKpvwCfYxeVjhu7dja8rLnOmk8oo7I++7LCS81Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpGreNAnheUVzblTwTNOyv5uwyvqbPL2VAmXW4zBXu+EpSZs2b5AFSEAkVwqREq+wB7gy3GbiD8G3ta9Q/fQRhVmbKfEEmr3/8AjsxlpHOpnjWGDqd8ZGYrK0w/d4G5BiwaixQ45sE8PWRrx1oyKIEn1WW4eCI7fsYb3+glj6lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSHlBo+l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31BEEC4CEC4;
	Wed, 28 Aug 2024 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724860423;
	bh=FceCKpvwCfYxeVjhu7dja8rLnOmk8oo7I++7LCS81Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSHlBo+lH7EtoI6uF+gIKcgjd9oBGCAmJJm51PU7R5og/9T8YIhusI+lD6Hjb8iLY
	 hAtNShc4mk69/Qc56HZoyml4uqh0lO47YpsTrZ4etaMElT9d+jlndSc/aHWkasKc+D
	 FV2ucl0nT3Q6yVPGQh/I/y+0jmwJksKsfxZ+7OROHiB2iWyYav4i3Ds10emSgnx5ol
	 A7CWs3QoFl6kfXs6Ti6gV2IJRdAb8w/tX1vfgZjkT9i/46Exm4qV1f563eSGQh4Wxh
	 1M5e+xKvpzP8ShQEOfg7M/f91GjOc52bGt4cB3H6My1e9dFCLU9wGhhvvhPlbPsy+i
	 19ckAowLYmw5w==
Date: Wed, 28 Aug 2024 16:53:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] dt-bindings: gpio: simplify GPIO hog nodes schema
Message-ID: <20240828-goofiness-haven-6d22011353e4@spud>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
 <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OayRlMiikjtxs/jT"
Content-Disposition: inline
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-3-63b83e47d804@linaro.org>


--OayRlMiikjtxs/jT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 11:35:59AM +0200, Krzysztof Kozlowski wrote:
> The core schema in dtschema already strictly defines contents of nodes
> with "gpio-hog" property (with additionalProperties: false), thus the
> only thing device schema should do is: define "type: object" and
> required "gpio-hog".  Make the code a bit simpler by removing redundant
> parts.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml          | 11 ------=
-----
>  Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml     | 11 ------=
-----
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml     | 11 ------=
-----
>  .../devicetree/bindings/gpio/microchip,mpfs-gpio.yaml        | 12 ------=
------

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


Cheers,
Conor.

--OayRlMiikjtxs/jT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs9H/wAKCRB4tDGHoIJi
0r7DAQDw7o8LeA1EG/uppquSI4wvHkpnTbF9vLKnFD2DK5QubgEApnVKe+GiJvsk
xuyCPYk1pqnyzWfnNVW7zYqynGfKLQ8=
=DkUp
-----END PGP SIGNATURE-----

--OayRlMiikjtxs/jT--

