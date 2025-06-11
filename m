Return-Path: <linux-gpio+bounces-21352-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E622AD4F4F
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 11:06:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D6EA4609EE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C932638B2;
	Wed, 11 Jun 2025 09:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ct1t4/MZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B986725B319;
	Wed, 11 Jun 2025 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632603; cv=none; b=YxO5sa+bjAb18AjlkiKRE2TxOxpRbG64Ztlsr/LF2huWwpbBodIR0SbVKMVW64bTHdsiP+ff8jWvCLU25DtYz1WHO1mC7Efe3u641U3B2MwQU5utM8xxUFMy9B+j7vhwFjy/XTGGDF8hHGMfJTV9VTzgQS1RxpCG4iKNItnvlqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632603; c=relaxed/simple;
	bh=LR0ScLb3B0pWpx2JevJTdXw+LhGP4n0nD2dkkCT4ys8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvcF2/CvDv7ujhTkM4gAijE5cMSqRITERiQPD9Px5LvWQCoEidzRsWAhMBxx35kjbCX9XfBIEk2SonFlV3g29KPgj1vQjGLfTYsNFAiaySMUxfeNTGiK6yy+ThUpJMYQ7m6O1X4PIW3d/aXcFo8PEh4mz45LQZjHWlbJLWUoKoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ct1t4/MZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1F5C4CEEE;
	Wed, 11 Jun 2025 09:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749632603;
	bh=LR0ScLb3B0pWpx2JevJTdXw+LhGP4n0nD2dkkCT4ys8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ct1t4/MZm6IcJZPKJXXJWn3xfCjFD9mzar/H+bpuC+zMuiP/Ir9jCCeV0piYch9Wx
	 OdFfFT1R2EoPcK0ZMO8O7Ep1zyEp+XnQxCRlCyJ/hafnvcED0EIuWTcjAliCnbOJpo
	 nS5fLUyoDK8ijrACDivb2QYGLW/+IBip2TBMxRCluvWbRcnK9TapV6XL8GgZCUXxCR
	 QljAcXo6PyY/4/RNUmCHR5aUMXEwKbDSrHY5fOr1ZoP1fYJkm2TiV2iYU5ssrBpars
	 6BQkYta+o3pbX+RO3NibHVB5IK4RyHdZ5EOMQnBvNfg4fkBWm+E5UFTnauMYH5MZdD
	 y+Jr0Jnxmd9Cg==
Date: Wed, 11 Jun 2025 11:03:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Griffin <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 04/17] dt-bindings: mfd: samsung,s2mps11: add
 s2mpg10-pmic regulators
Message-ID: <20250611-fierce-whimsical-aardwolf-6cd33b@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
 <20250606-s2mpg1x-regulators-v2-4-b03feffd2621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250606-s2mpg1x-regulators-v2-4-b03feffd2621@linaro.org>

On Fri, Jun 06, 2025 at 04:03:00PM GMT, Andr=C3=A9 Draszik wrote:
> Add a regulators node to the s2mpg10-pmic to describe the regulators
> available on this PMIC.
>=20
> Additionally, describe the supply inputs of the regulator rails, with
> the supply names matching the datasheet.
>=20
> Note 1: S2MPG10 is typically used as the main-PMIC together with an
> S2MPG11 PMIC in a main/sub configuration, hence the datasheet and the
> binding both suffix the supplies with an 'm'.
>=20
> Note 2: The binding needs to switch from 'additionalProperties' to
> 'unevaluatedProperties', to allow adding the specific -supply
> properties for S2MPG10 only, as otherwise we'd have to resort to a
> global wildcard with negating inside each of the compatible matches.

I think this binding is getting too complicated. Maybe s2mpgXX should
have their own file.

Best regards,
Krzysztof


