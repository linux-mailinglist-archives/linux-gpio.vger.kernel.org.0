Return-Path: <linux-gpio+bounces-28386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFEAC519AE
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 11:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4120C3AF42E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 10:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD373002CB;
	Wed, 12 Nov 2025 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owB01Lqi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7362522068D;
	Wed, 12 Nov 2025 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942238; cv=none; b=RBL9k4mC/MEpPRIjETJIJfs8I1N0H7FnxP9IeahWd/waSW+PKHIvnH0pc5h7SRFGNQN3Alm20JEb2+fus0HWKWFH4N9RGdqeSQXBjKy6WYU5yrSaqbtmsIrBSK9CZ379hFL9r88JQUgWtRFQnCPD+rE06H/RypdaXb2CJf20wcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942238; c=relaxed/simple;
	bh=OI4OUlvhHmDSAzWOa/KlNdjQ8BpXsKJB7zSPJd/P6F8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFuY7Odx2XA5gdxff95NoXu0S5Ju5rpX7aeaRre4UTEPnH6JprzTYDkdyqHdIIKvw7w4vCBomSN09LgYMXyYDiw6/h0d/m1XF/kawUGDPbUlrMZYyP315AyT1xBS/pI2r7i+yBhkCu3olV1BXfOLyPGuMna2AQrPAtimyFEsyQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owB01Lqi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A061EC16AAE;
	Wed, 12 Nov 2025 10:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762942238;
	bh=OI4OUlvhHmDSAzWOa/KlNdjQ8BpXsKJB7zSPJd/P6F8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owB01LqiOZhRt6lQkLYrDIKUxIaRF3ajlHqurrNjK9jZeTgy+J9AnzbT7B4MfCiKj
	 5ERwfd67DAGdbfY12lFCv4KLfi+JwHF2NZjcin5p+4mxug0QSCUtwtQr2sA9aZnafN
	 VSXxV6ONT5U6tpZWLzUr6SYwI5MApyvbYGLcFKM+sD/kzG5driYk5m1zFYM3Pp54H1
	 tWKQUlNquokdosF93TVtmG5PxllL5qHRFZQ/aGOtGMJP8WCSfh7Qv1S869GUJT+03V
	 fUvmG69RDVO02rcOK7CH2MYr8KsjP5cowwxa0bwoCpZdZ3La6NbR3sWyHek8g2eqFI
	 KkWexN3WkJA+w==
Date: Wed, 12 Nov 2025 11:10:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 06/20] dt-bindings: mfd: Add samsung,s2mpg11-pmic
Message-ID: <20251112-winged-kangaroo-of-superiority-af06a2@kuoka>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
 <20251110-s2mpg1x-regulators-v4-6-94c9e726d4ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110-s2mpg1x-regulators-v4-6-94c9e726d4ba@linaro.org>

On Mon, Nov 10, 2025 at 07:28:49PM +0000, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG11 PMIC is similar to the existing S2MPG10 PMIC
> supported by this binding, but still differs enough from it to justify
> a separate binding.
>=20
> It is a Power Management IC for mobile applications with buck
> converters, various LDOs, power meters, NTC thermistor inputs, and
> additional GPIO interfaces and typically complements an S2MPG10 PMIC in
> a main/sub configuration as the sub-PMIC.
>=20
> Like S2MPG10, communication is via the Samsung ACPM firmware and it
> therefore needs to be a child of the ACPM firmware node.
>=20
> Add the PMIC, the regulators node, and the supply inputs of the
> regulator rails, with the supply names matching the datasheet.
>=20
> Note: S2MPG11 is typically used as the sub-PMIC together with an
> S2MPG10 PMIC in a main/sub configuration, hence the datasheet and the
> binding both suffix the supplies with an 's'.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


