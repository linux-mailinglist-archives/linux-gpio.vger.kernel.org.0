Return-Path: <linux-gpio+bounces-21799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62093ADF1FC
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 17:58:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA5597A261F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 15:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACC52ED871;
	Wed, 18 Jun 2025 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+ysl2En"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4597198A2F;
	Wed, 18 Jun 2025 15:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750262303; cv=none; b=AB1Ol4E+rt6qgsYPBvhZKcaaWy9UWMu5jxYUBu0YeX8xtw6TYByW70YPs44TNrg9FgG6c6aPKMjgSmevDLKBHxkdPGMOGQzSyvKy48NIPkWFYB8MBcNigLnsGmYblMz3TWPLShVOoJQR22SEQha2JdhugEEjOJLuWOa2DVK48zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750262303; c=relaxed/simple;
	bh=W3cSbpbAeTtEUnbGwlkU4DS4C49KOuT0YThhNsJs5bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9SX1M8kUgbOaXAsPBv1C3ZpjN+DSouV9YNouUouvsHx6inHXqZzKIS4LDU41B7VXbV7qKymoqggfYFCJBmv/6yK68Zzrx7QY8i/xoIWpzclD9ORu6OUGt9TSgO1/gGl6hoPs8tBDjXMSYocjs60UIgGm3HJtf1+6rPwzifL+1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+ysl2En; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A44C4CEE7;
	Wed, 18 Jun 2025 15:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750262302;
	bh=W3cSbpbAeTtEUnbGwlkU4DS4C49KOuT0YThhNsJs5bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j+ysl2Enq25Bb/DRl+8JLiHDiiZBjFe3zvUqpRVKlVqv4Qfd+tMMCSc9umHN0fe+u
	 8wZqk26+vUbgaziRPgbi1jpDemDa26ntkrRp2tkn+ie8Qgi74xlQaeVvXOJGTrloMq
	 4y/CM50bLYktsxCxDlBUvG/cMOWOnm0XPyVebu+BxhMKcCQhgHjdT1420M/RD3ESG4
	 Gg6o64H9D17sFXZtHNgD27DIxR3WtAZ+69epDgD6g3y7JlbqADpFvHMTjyH2318omt
	 tSZnmtAiihyYTLfPlK2tKR5MfMU/vnqAQ9r9q9lGHD+ve3Uy4Eidh74amhTN0Iyhj0
	 58w7YBlge/FHg==
Date: Wed, 18 Jun 2025 16:58:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Maria Garcia <mariagarcia7293@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maria Garcia <mgarcia@qblox.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: pca95xx: add TI TCA6418
Message-ID: <20250618-concierge-fencing-e62c1e884ce9@spud>
References: <20250617204402.33656-1-mariagarcia7293@gmail.com>
 <20250617204402.33656-2-mariagarcia7293@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qERtATDEhjwRBM4E"
Content-Disposition: inline
In-Reply-To: <20250617204402.33656-2-mariagarcia7293@gmail.com>


--qERtATDEhjwRBM4E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--qERtATDEhjwRBM4E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFLiGQAKCRB4tDGHoIJi
0p4yAQCRimq22+Rc1QPstE+Qc0b9aS3m+2t8waTdqH+DCFvnVAEAkSG0FNjQly4l
fAEs1uRv7QwKmG8JEfRHp76Atmn5Vgs=
=Tgmc
-----END PGP SIGNATURE-----

--qERtATDEhjwRBM4E--

