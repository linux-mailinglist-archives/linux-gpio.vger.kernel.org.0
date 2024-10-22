Return-Path: <linux-gpio+bounces-11775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 100889AB42B
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 18:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F3B8B22EE7
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474371BC06C;
	Tue, 22 Oct 2024 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPWbsKoJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF362136345;
	Tue, 22 Oct 2024 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729615092; cv=none; b=UOlq+fPTtvMgbbZ6QOP0IUDt3sj1WPCGnUFPQyqD9Gsjd0ffjEkhL8iUli64og/ZEWHNRGxsgLslIo1jwOVKR2eokPnrA4Y6b0KZJRW7Pjb383j3dpeAMxlfvvowBr8myY6TfsXnyczbnGuzrlthCTryekbXOzxbgvM9O3pI3ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729615092; c=relaxed/simple;
	bh=x365vfZcwOL/Kx8CbJaN5XUaJiNoO7EftBuEebNOTpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lc7kYCDmJo67z7x/uO0reJBcjQHnVtCn7yjptmbBRIO1XTIWgX71IO47t4eaAq7BQM+7rCn7GaY0R9uM6JwNcGHoKlcSKMmlfuiNZYvr/VucPMNmT0TwErVJNJ0F5r6WO2PrX1CFaeqohMtfe9pY0j4/xPp68qWk10WSlKG7pUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPWbsKoJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE30CC4CEC3;
	Tue, 22 Oct 2024 16:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729615091;
	bh=x365vfZcwOL/Kx8CbJaN5XUaJiNoO7EftBuEebNOTpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPWbsKoJv+eBfGCCmSRZP0amck6NKkyJ9B7bDAqCXLBSCNYQWSb5Gibnj7wkfYWS7
	 G1XA5uKX7cqj8bGD9FOpIMHvJBZSc4jo+XLKXhvUv7L1DAjtFCmt3HrzsC8rw6RuJ8
	 azis5p/Q75f7zgREgqDwJNHs2l9hXMKC0PvSi8JHpZChCbw0p2miKCMHY4RNTrSxs+
	 dZfWCw/M3/AfJ812VM/7DE3UauXh1BzReBKheJ9z5/CySuZxy5IKvjmF2i5BAOosBo
	 6Faw5oONF3jaNHpSNyllxbE3lJmGHP8kO0xcvp8yXjJb04p3xsoG+zd31pvkj/8RE5
	 99nFxxVonb3Mg==
Date: Tue, 22 Oct 2024 17:38:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Melody Olvera <quic_molvera@quicinc.com>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: Add
 SM8750
Message-ID: <20241022-stoic-props-fb09384c4357@spud>
References: <20241022064245.22983-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j8d5r80CqIdQPr5f"
Content-Disposition: inline
In-Reply-To: <20241022064245.22983-1-krzysztof.kozlowski@linaro.org>


--j8d5r80CqIdQPr5f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 08:42:45AM +0200, Krzysztof Kozlowski wrote:
> Document compatible for Qualcomm SM8750 SoC LPASS TLMM pin controller,
> fully compatible with previous SM8650 generation (same amount of pins
> and functions).
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--j8d5r80CqIdQPr5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxfU7gAKCRB4tDGHoIJi
0hRPAP91AW90yGsTA6HzxcerSeDrVaNzYAgKbfL3FmGSybZndQD+J8kMR3awoB/3
vDzopa2+qrVMC0Guq+NPz/6ZiYW/ogE=
=Gfn2
-----END PGP SIGNATURE-----

--j8d5r80CqIdQPr5f--

