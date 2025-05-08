Return-Path: <linux-gpio+bounces-19780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A15A1AAFDBC
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 16:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1B2B3AB95B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 14:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88842777E8;
	Thu,  8 May 2025 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+M9OZh3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603DA8460;
	Thu,  8 May 2025 14:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715809; cv=none; b=srd6SADYuU/HRJokX32cYpeO7ywE8FlWVvN4ctGeJAsyrQoRjNhtwelEiOF4IMUE9QyGYWKyQpm9sLY18MmuxtnrD57tGs+CgKrt5V+x6yQTzvR+xOBWxNo5dztidfRAkp8PLcxqxai28KYysmOGEH0CIaHdYXeNltbeoyuknKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715809; c=relaxed/simple;
	bh=Fy8C4VUCTqo3ySjqlhBabDqwrzsmZ4nkLoYPReSi/sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCbUFYBsX7ZAnBZzJSAn49vUJtuooc4iRdEuEHPQttL9AYMQx4om6HX9glkYchlB3pyKuVVuJiNg81XLCSVh+8bCxNWpnWUk9bKN5Rt4VeZ4b26xG/79W4ya3qbRQsVVNN/rXqccjGCuawD2gJPC7dzHjC4E+oyTtkkKHYE/gPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+M9OZh3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12324C4CEE7;
	Thu,  8 May 2025 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715808;
	bh=Fy8C4VUCTqo3ySjqlhBabDqwrzsmZ4nkLoYPReSi/sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+M9OZh3xL+Cbfb2Uz0mclgmyDMz0d2cCrjI45KKCaMFeJFYV2ND9fPzfuI7wKpW8
	 RdL6nPCoIgRDfk8gvtSh4eGoNF1kFbPq5cCjJkTAXlb8HHREcON8e1hvUbwciyzyLH
	 uMDTYjuxibaVUghc0nDrvO38ODUN4bS9pp+uokBU6W3uZqPT7lnIuVkjswFzrBCHI0
	 Kfu81tcLA+Bvm14qTgk8hV8snvNse8/eTcgkA4ZxszPXfX8dUBQPHIqyQ4uyYAcDO1
	 VyHkIYs4rPr+gM5vHjnZbaZN+H+5V5J0Me+uNjMN7FuQKMrZQ+gnVYfEze8sofIWQB
	 nOWxokYERitpw==
Date: Thu, 8 May 2025 15:50:04 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,pinctrl-a4: Add missing
 constraint on allowed 'group' node properties
Message-ID: <20250508-friction-alkaline-eb7a13adfd32@spud>
References: <20250507215852.2748420-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8tifkVQIif/uYh2+"
Content-Disposition: inline
In-Reply-To: <20250507215852.2748420-1-robh@kernel.org>


--8tifkVQIif/uYh2+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 04:58:51PM -0500, Rob Herring (Arm) wrote:
> The "^group-[0-9a-z-]+$" nodes schema doesn't constrain the allowed
> properties as the referenced common schemas don't have constraints.
> Add the missing "unevaluatedProperties" constraint.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--8tifkVQIif/uYh2+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzEnAAKCRB4tDGHoIJi
0oVDAQDMi8soyiPVhpBpLfEFuyYCWl4lF9cfYxPAEoX5IXL0bgEAha4WdDsoiQtW
m2PJDug/Jx+98RsDsFgvfNbXOR1KtAQ=
=+VMJ
-----END PGP SIGNATURE-----

--8tifkVQIif/uYh2+--

