Return-Path: <linux-gpio+bounces-10468-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB79877EA
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 18:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6184128664A
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Sep 2024 16:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E610158A13;
	Thu, 26 Sep 2024 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRO/1lry"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4389E3F9D5;
	Thu, 26 Sep 2024 16:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727369735; cv=none; b=nyR9BoU6Go1zN3bXGWZxcDUqLlLW/B2IC6XoPp6RU68K1JRBs+VzBBIA8By9s9K7gxueLBsWFgqxzz2IWXSmqHosh6mElFzHRJPNbYUEgXcH6cChu4GqsTKFZrIgsCz6WR1llEurO0NYuK7XmrH+tbl7dCa6RAHnu4aKDdnPydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727369735; c=relaxed/simple;
	bh=0cy9otmnPPXzdVeNfrVkQsGQlELKXLGB4d+u+FMomtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBZcMRmdiArMJmWPl+mEhGQhFiA+W9Al3l32nz0S/eBHgrBpSyc/xu35YFSiuD+q+wgWKOKSIicCI87Q9LYVMOYcmKZitpKgztnD36aOg9jE4iHV17PySsE/wxkRov2topN3buDVfXyo/HCzoVt4fJmYcKMc7MEYk6MEJ3yflzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRO/1lry; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA60FC4CEC5;
	Thu, 26 Sep 2024 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727369734;
	bh=0cy9otmnPPXzdVeNfrVkQsGQlELKXLGB4d+u+FMomtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRO/1lry9ZGcnELOsD8KJjQQOjV120MEfQ7zdSZ0SbLhwpMvF1DoCIm02iTTOudMY
	 nC4KA4GXRnGN8DL6bWGR7FXEaKsacXOY9UoynsMfwFZ8mQoZTnZu786nZss7lR6+cE
	 GOwQldF3HYIfdRcwAKFglOrte6B/a5XDU1U5q6ECLQZ14VhPSOub63EQTExQSmwxOX
	 Jdg1WG8wPWsz1KCEUUYVOxRghrjQlFOhPJ2psnnt8t8UhVNOvOuV2LkRLs3ely1OIb
	 csPnxfQTJeIDKdwa1yuETaCWlIP/rmJ/O0x6BZGH712Jp9mxDuP+OBsbIMUngKRGXh
	 FktDddQXwIU2g==
Date: Thu, 26 Sep 2024 17:55:30 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: st,nomadik-gpio: Add missing
 "#interrupt-cells" to example
Message-ID: <20240926-grazing-subsystem-67346a9d98db@spud>
References: <20240925173504.1906872-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6XITQ/aJcYDuOBEP"
Content-Disposition: inline
In-Reply-To: <20240925173504.1906872-1-robh@kernel.org>


--6XITQ/aJcYDuOBEP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 12:35:03PM -0500, Rob Herring (Arm) wrote:
> Enabling dtc interrupt_provider check reveals the example is missing the
> "#interrupt-cells" property as it is a dependency of
> "interrupt-controller".
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--6XITQ/aJcYDuOBEP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvWSAgAKCRB4tDGHoIJi
0qsjAQDWt6pGoSgkVYwLh9bU6yUOqjycuEWRAAQURv31R5Er5wEAwWtRvXSFSSMl
zP6+xkn2jeT/20GJ8MduTjCudamUjQU=
=JQON
-----END PGP SIGNATURE-----

--6XITQ/aJcYDuOBEP--

