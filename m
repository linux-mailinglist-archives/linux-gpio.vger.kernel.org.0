Return-Path: <linux-gpio+bounces-21538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20509AD8B98
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 14:06:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7C4A1758A4
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Jun 2025 12:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A8322DA0C;
	Fri, 13 Jun 2025 12:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bg2u0S+J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC37275AE0;
	Fri, 13 Jun 2025 12:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816415; cv=none; b=Hh9jYYN3fnDvFN1EVvaF4zJyljPeNqBrF6OM44WIZbh5TD7jvEog10Mvf2Se2RoZnL1qja1rQyJK+tm696j2m+TEIXdkN43psxzUoYMyayBNNf3dKSUct4MT/lgn5bqZItC9zXjxAwjEmd6PDtoALDAPQ1eEJwJnGiHnG9C4BLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816415; c=relaxed/simple;
	bh=TiQqE1Z2DV9FD+lu+Yip6J3M0Ufq8nrVULS0oIlvyVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNr1NlGDvrjX2uad3qFVyrCFF96P+VoEmg12d27OTVLsuUPrX69JGRhjP5lUhXRqemIh+Sc8zIBLjyQbe/3KFVtxC9dyzgHm1n91d3gMhlDC0/9q41LCkSMufvZPeKGzs0306pWPBbUuBhaCZQgI+UaIV4CR/JVU+udin0/VTfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bg2u0S+J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A35C4CEE3;
	Fri, 13 Jun 2025 12:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749816414;
	bh=TiQqE1Z2DV9FD+lu+Yip6J3M0Ufq8nrVULS0oIlvyVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bg2u0S+JEzNeUQS50r0k8QObhc7cAY0s5/+EnNhTB5aH8MqHMJ8mnCcpHLlStt2zN
	 xpIMdNB54znoVvZ2oPJ+Z8XtSOiqxI2abuP4374c6hUXWi3/vM9vo/91coBEF7+Ec5
	 yqG/f3w3obCGeShnX2Anajn7oYbN+iknxTdfucNcOuyo+Vci1aT2MtOmrHhYlB0lQg
	 /Nimd9U4mdx6Y3+mf+U98DzX2+I1vuFDexarZrO1ABf3Tm8+mFBEBUfaX/PvjEqhNh
	 5VyJOYRyBbhi/h7hX0zI0tOK983P46Da7dSOVmuGVQSrrpur0502lROP20utV/o77n
	 BfVS8s4lkG5cA==
Date: Fri, 13 Jun 2025 13:06:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 5/7] regulator: tps6594-regulator: remove hardcoded
 buck config
Message-ID: <d1926a06-dadf-403b-8232-1a1d38d408e0@sirena.org.uk>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250613114518.1772109-6-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HEqA/7HSWDarX2pg"
Content-Disposition: inline
In-Reply-To: <20250613114518.1772109-6-mwalle@kernel.org>
X-Cookie: Use extra care when cleaning on stairs.


--HEqA/7HSWDarX2pg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 13, 2025 at 01:45:16PM +0200, Michael Walle wrote:
> Commit 00c826525fba ("regulator: tps6594-regulator: Add TI TPS65224 PMIC
> regulators") added support for the TPS65224 and made the description of
> the multi-phase buck converter variable depending on the variant of the
> PMIC. But this was just done for MUTLI_BUCK12 and MULTI_BUCK12_34

Acked-by: Mark Brown <broonie@kernel.org>

--HEqA/7HSWDarX2pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMFFgACgkQJNaLcl1U
h9Dn+Qf+Ppz/gDwcz+TK1JYPSFATWyAc4FHLWfitUfPcKAcL6vqKETiOy00mzAyo
RefVeVo51GRpb0wqGY6mN3B5ezDh+eKY6qOHWXTW2N3cT6NTnLln00uKT/79Q6An
UKRCmJOmrEvhaajHemHhmqb6PsmtrKO2yn90lYYOD/YXOS/iIcfFAXzDNXQ89pmI
E/+pRZv5kpebQH70TTCpGArWMYQTVU/ELEZG8FumES1+K53BQUnq7UrlzSwbsOPN
EZ2OIVT5Q9svu9348wlKTPb74b6O8G3JcKkKVz4+O+qNSqK5f7r7WOJufbQgYG2Y
ZFBrvwiRBiVscAVbw/bTkPra4Hay7A==
=pDdp
-----END PGP SIGNATURE-----

--HEqA/7HSWDarX2pg--

