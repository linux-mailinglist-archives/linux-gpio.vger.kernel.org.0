Return-Path: <linux-gpio+bounces-27484-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB679BFD813
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 19:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5C2950587B
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Oct 2025 17:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E917279DCF;
	Wed, 22 Oct 2025 17:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q0IwOI2F"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA7B35B138;
	Wed, 22 Oct 2025 17:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761152971; cv=none; b=jIM2EMRyP+faBpZsBFFdiAHWxq4biWGyHcxehJ4o3MNQHSdbfzkdU5Arq0ZGJCayjx8+WwgPKn9AnToLAmeZ4d0pxjBN/PY36CTRr8KjSMHlQiXa8J0ndcFJ/sqip5fiuvf5TDLEkIsoM8MhvwdcZfIFW4aYLqS0oep3IZqXufY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761152971; c=relaxed/simple;
	bh=DEV3f1qr4I/J6PFM8ig4H0L1KWQJuTXPz1S0HlQRAFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CI1p/wVnzpweKhEUxLuSoXmjoRyoX/PjgSAbSdqruqtibndyIKXXXDwfUhgbSRjs6O8PYVrJUfFIFmy+3fzhwSprFYCzFsnEu1uyspke6TS2UPalssuDkbXNYQ8jzW/tCmKRRDBPX+Z6p36E8LvCB/QgLgyu28Fvh87HqsDvD1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q0IwOI2F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E728C4CEE7;
	Wed, 22 Oct 2025 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761152970;
	bh=DEV3f1qr4I/J6PFM8ig4H0L1KWQJuTXPz1S0HlQRAFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q0IwOI2FoPf81jk2UVHGMXtRwbk27NLpssxyrcg73JxP/henebG3qgsP/XDREXSgh
	 9ySyZGkQk2SAqJW9Cbh10wutSIiVlOpgEIRQT9bR9QJEEOX9Ex6pcHPDvPBcRI2KtL
	 sJzCiOt5IAa2A58RtlOiCSbwIrhUIGMLVAfu0RKrA2Ny55U66Ts+oUdatYY/UCtboZ
	 OVaARFJEf7f2bQs0YaPtY86EefNAGXgrVvkaPfFAWmIPsB+wUeQE7gLKyUN38iK/KT
	 n9j6vL4F03qIvcl5xZexi1HmMFCBPB/Jk4jms9UdzMkUEZjvEAIMzjP9Z1ZKgGZK9X
	 uJ6ANgHi3SFeQ==
Date: Wed, 22 Oct 2025 18:09:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: toshiba,visconti: Fix number
 of items in groups
Message-ID: <20251022-unblock-bolster-a68db7abea21@spud>
References: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jEiR7/UvURY53tPu"
Content-Disposition: inline
In-Reply-To: <20251022133425.61988-3-krzysztof.kozlowski@linaro.org>


--jEiR7/UvURY53tPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 03:34:26PM +0200, Krzysztof Kozlowski wrote:
> The "groups" property can hold multiple entries (e.g.
> toshiba/tmpv7708-rm-mbrc.dts file), so allow that by dropping incorrect
> type (pinmux-node.yaml schema already defines that as string-array) and
> adding constraints for items.  This fixes dtbs_check warnings like:
>=20
>   toshiba/tmpv7708-rm-mbrc.dtb: pinctrl@24190000 (toshiba,tmpv7708-pinctr=
l):
>     pwm-pins:groups: ['pwm0_gpio16_grp', 'pwm1_gpio17_grp', 'pwm2_gpio18_=
grp', 'pwm3_gpio19_grp'] is too long
>=20
> Fixes: 1825c1fe0057 ("pinctrl: Add DT bindings for Toshiba Visconti TMPV7=
700 SoC")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--jEiR7/UvURY53tPu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkPxQAKCRB4tDGHoIJi
0mHlAQCPnuNveKAFO8hQ6LEWORXLQB3dye0vywcucV2ehC2QfQD6AkB+iEzJLWkI
RxnecE2XQiF/7bDTAoTsDon6zVWieQM=
=LT1e
-----END PGP SIGNATURE-----

--jEiR7/UvURY53tPu--

