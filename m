Return-Path: <linux-gpio+bounces-29727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37962CC9EE9
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 01:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33B163027DA7
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Dec 2025 00:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3704230264;
	Thu, 18 Dec 2025 00:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFlBAcyK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8A918B0A;
	Thu, 18 Dec 2025 00:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766019313; cv=none; b=L+YjclPLq8ntIddX9hqIRmAkjRacTYcw1AmIf5M7IbGfPesLGfBFWWTdsdHyL4bMlR/6hRU+hLt9PXRlWxoqAzOLJyPMLE4buYewfNvIEzfpvKG+DadAPyunIVFBj4oOztINCOTXgfhOMMouXBKxHWJL7oxdk4Sx2k/J6G7lIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766019313; c=relaxed/simple;
	bh=c7r3XGYdnbH0YLqKseoZnmXUFq4OpyTH4YhApLZ6gPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJkhUyfRQet6JGS0UVsKXcIQzzs1S4zRsKiL4SEhFaspwT1FlZ0R2fw9wWejruNljzyzWAUIGyO+l9XtYKwE5cvAwN/XafUEHsLtf4kVdUr62FbIc95iTfsrq4CMcVIpoWtYurUSsLSsp+CLNlmpoacZZI0V4DcfEoGFEdFyq+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFlBAcyK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E43C4CEF5;
	Thu, 18 Dec 2025 00:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766019311;
	bh=c7r3XGYdnbH0YLqKseoZnmXUFq4OpyTH4YhApLZ6gPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFlBAcyKoCWi4H9AsPL9e2b8gD77ZSZzlYR7srmV+SG7JVlnwAGg/oR3MYlPfF074
	 g/zuJDke+ZPwjw1JWKvsOnvgyVFkDds7dPwD7l6xbwIH8DIwMjPv4692ISfE/y3WO0
	 NdEhjcIkTTwD8KzuCl5wGAldkhcliIKDrKIUUefPRQj4lvMI8NBKhoooCvkE6CrRXy
	 FCIR6dR2FpAQJuHGzkDvcESNEeSEd2qRyhGIGxWkP234TIGPmGEANY1SSbiMF7RErD
	 FlYcWo+6KF0QJGctBZqdNUaNtLGI8QSvULHlNwsQd4R0atSv2bQSzLtX17lUruUPqh
	 x/GupUHvQL0Yg==
Date: Thu, 18 Dec 2025 00:55:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: Add compatible string opencores,gpio
 to gpio-mmio
Message-ID: <20251218-muzzle-diploma-25832f4af271@spud>
References: <20251217080843.70621-1-shorne@gmail.com>
 <20251217080843.70621-2-shorne@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8ioU3Q3GhU7zpU6g"
Content-Disposition: inline
In-Reply-To: <20251217080843.70621-2-shorne@gmail.com>


--8ioU3Q3GhU7zpU6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8ioU3Q3GhU7zpU6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUNQ6AAKCRB4tDGHoIJi
0gLOAQDHC7gBoaQ+OeVHePJmsGTXbCnVXSGhKsO6Ad0j9zQlhQD9FXgwSD4W2j49
IBZJIupmlSajED9iTcFF2KsTwRJOSQ8=
=Qjhp
-----END PGP SIGNATURE-----

--8ioU3Q3GhU7zpU6g--

