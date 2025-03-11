Return-Path: <linux-gpio+bounces-17462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020C6A5D071
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 21:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B55C3B3FB9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 20:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2230E264615;
	Tue, 11 Mar 2025 20:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tjeq6X04"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D098C2641C3;
	Tue, 11 Mar 2025 20:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741723668; cv=none; b=NXNDRoPNWQIPSv5yY0d9jx0r+GO0jcWjyJ0GgyyKNMvlmo7bIj5+WwF85fDarEvkVrln3qSOCIYskAaCiXY6PfJYVF3MlR77Jxwe4tdq+NHT3BuMGsJefFZSv32F3S2axsj1Ypr3nNtqQ01v8nvN2qfSVk3HEmT4FQMKYce8OcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741723668; c=relaxed/simple;
	bh=kypsoT+y8Xwt8jAYhLNEnwar1djrWfc1JLO5IbchjC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B523K5qL4TWgucpbsXhFpGb807S/k44+ArhKBZwcy6cq/TcAfgo+VOhFR+rGKaS6M9mlVQS5SLG6YG0bVPQodXsHxFqLWEQaglYYpk0Ir6I6bSrKVaQ0aqKCcXQGlDCiAnpPHqNFzoLlLmW11dW1yitl6I9NZljIRcpYHOGeapA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tjeq6X04; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF50C4CEE9;
	Tue, 11 Mar 2025 20:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741723668;
	bh=kypsoT+y8Xwt8jAYhLNEnwar1djrWfc1JLO5IbchjC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tjeq6X0429QkGYOfvtTSP68hCTEAk7tXifXZWYmaYPtIW1yT3Z41d3tlZ6tAEBjV6
	 Nu5ijlgHQ8JR3KznPZcuksAkqMTzcrY0zIikKCMTg9syTFJy/7+Sd5RSy63wTFYru0
	 4b87SAF4Ki23rjhuGrZV/ndPPHutoLSxxVBdiShjCDPfg01YMYUslYfTknrK/mqRyu
	 kr2vBuysMCVssvx/2bGh2sClVnz81+Y36YPSlAuKj8angw/Kx9mARrh7Gxbbr5IJIg
	 MoU+KZjksqaamOCy4qFUJF8+2Aia6G7AuovSHoL3JC1GLRErJqW0/4dtK7h4BXEOKB
	 gysic/nHt3nUQ==
Date: Tue, 11 Mar 2025 21:07:45 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Add gpio-ranges property for EN7581 gpio controller
Message-ID: <Z9CYEZloamPhVdBS@lore-desk>
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="icN7TOB+24o1XSzr"
Content-Disposition: inline
In-Reply-To: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>


--icN7TOB+24o1XSzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Introduce missing gpio-ranges property for Airoha EN7581 evaluation
> board
>=20

Hi Linus and Angelo,

is it fine if this series goes via linux-mediatek tree?
en7581_pinctrl node is only defined there for the moment.

Regards,
Lorenzo

> ---
> Lorenzo Bianconi (2):
>       dt-bindings: pinctrl: airoha: Add missing gpio-ranges property
>       arm64: dts: airoha: en7581: Add gpio-ranges property for gpio contr=
oller
>=20
>  Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml | 3=
 +++
>  arch/arm64/boot/dts/airoha/en7581-evb.dts                            | 4=
 ++++
>  2 files changed, 7 insertions(+)
> ---
> base-commit: a8a297e8bb3dd304cac77f7c435a4983d885a657
> change-id: 20250307-en7581-gpio-range-fceb30c7e2c9
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--icN7TOB+24o1XSzr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ9CYEQAKCRA6cBh0uS2t
rMEWAP46Y725zv4QZ2O/ml8GZ0JZ2mc8jhx0fJFGt3Hkmmo2AAD/aNhB7oE+OqvP
7D82+qP5g/4Qg6+HtlRX/B6Gk78LYQg=
=nXDU
-----END PGP SIGNATURE-----

--icN7TOB+24o1XSzr--

