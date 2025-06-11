Return-Path: <linux-gpio+bounces-21399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF13AD575E
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 15:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24F3716492A
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 13:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BFCD28B41A;
	Wed, 11 Jun 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLRupa31"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EE228A708;
	Wed, 11 Jun 2025 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749649140; cv=none; b=PKm5hPVFk8PsvKzhztXfm4YorMlryL8mgU6VZ0VcK8aBqR2XWHGOMtypeepISW1FMS5J5+EwOWhhQE+CtslDOGrsE9EXLsNh8mlULf1N9iC94NVpOiMhhI8rLp7EhPxiecmAojS4FRPFTnHTglmn+Vs7ubFOH6Sq72xW51D0SHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749649140; c=relaxed/simple;
	bh=63IhMGujIE76xxRJqBogkMKfsCEBW7EEoUN4xVCORIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH1fLlKA8YORIWIyd/ZULC1+O+woDFhQ+OdPlVJDb0LjbXRzKLxqZx19nUYgRB8kN8WbjlSld7urLf2kOrotM3ISbf+j1omqyH/szfuyBwUHnWdp1jRuvk8f9vN2Ht7gms+TlfPr+lJjcboDS/7yVuPALkOO/dRhIzoZoTfEfjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLRupa31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1064FC4CEEE;
	Wed, 11 Jun 2025 13:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749649139;
	bh=63IhMGujIE76xxRJqBogkMKfsCEBW7EEoUN4xVCORIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLRupa31DcdHMpeqvWd2JxRsIqMozTO0qVGc+ZgbEM98ciEypc8hKEqLBz/ZQB8pt
	 ACd9zXZIl+QoQ6cJ/6J1Ja/xd75SFkRbB00eHbUZDa/5QQVJFWCfSCMw8S9a+rMssb
	 iTbLlag1YXktOrn9OsznKb4izJ8GnqPTcbPOT2m0YMXhDvCTuKFc1E6BwgZZ5sLfkA
	 eN3DDJ7FmhQQ4ZLhQhRyS2akDjVaWUGJDpsD9tnEtcPIv9C6Hgcw0v6OtYoUNxAjkC
	 mbuiFOBWNwIQNjJ93HuYFoX4KVkYToJdLnGX2efT5lZEjIt1QYGaRq7XKEoAr9QGvK
	 UjRaoDR6JXq8g==
Date: Wed, 11 Jun 2025 14:38:54 +0100
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
Subject: Re: [PATCH v1 5/5] regulator: tps6594-regulator: Add TI TPS652G1
 PMIC regulators
Message-ID: <fcfc6310-4418-49e4-85de-f2a58f877a51@sirena.org.uk>
References: <20250611133137.1686183-1-mwalle@kernel.org>
 <20250611133137.1686183-6-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jFgXsVfndX71CoWO"
Content-Disposition: inline
In-Reply-To: <20250611133137.1686183-6-mwalle@kernel.org>
X-Cookie: No skis take rocks like rental skis!


--jFgXsVfndX71CoWO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 03:31:37PM +0200, Michael Walle wrote:

> +	} else if (tps->chip_id == TPS652G1) {
> +		nr_buck = ARRAY_SIZE(tps65224_buck_regs);
> +		nr_ldo = ARRAY_SIZE(tps65224_ldo_regs);
>  	} else {

These should all be converted to switch statements rather than if/else
chains for clarity and extensibility.  Otherwise this looks good.

--jFgXsVfndX71CoWO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJhu0ACgkQJNaLcl1U
h9CAcgf/cBq05ewfKtbZLh8OaZCa3NBuacDHtla43RZvmP2t+9Q5zGr3ApPCrGcK
Hjfk2Qu0WJ4WruAKN3Pb7y7A1GNoFFWoLSlTA/orPOMkGa2kgqAG2tKTqVD7cK6g
U5BvBor+udqMpUkyJGJhvCqRs57ANSP94gbnEv8LdoPBDEku1NqrIdmWh31cXCf+
q+1uZupN2GdwB16eAiJBAmHKIsylzqVlb3jfltY/kqOckEBOZmg4LKg+IjZUEyaC
ZA8crHWGG3wsMAjdSzObepydSfE+wqnU0iaD3hBAZ1SkXtW7dWAP2pCEb7MyWu4L
T7J+vfvZmtlD6TqK8fYHTWOtLK3I3g==
=sdkv
-----END PGP SIGNATURE-----

--jFgXsVfndX71CoWO--

