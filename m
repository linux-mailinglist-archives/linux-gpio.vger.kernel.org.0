Return-Path: <linux-gpio+bounces-21340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1389DAD4EFE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B8E3A6966
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E755C244661;
	Wed, 11 Jun 2025 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ry/wUV//"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6E624339D;
	Wed, 11 Jun 2025 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632276; cv=none; b=iLb3mFaK1T7OWuDlu0bItrgNbCb9RFFj/iuNMXrZ5UaKOm4ZAJU1ioA0pbstoNcp8dQq9H3db8Yv9KyGzV1z2VCM2Yl5pemGB4b/ebzjDMhp4VSnL3dTkrkXKc2mbq+hpeQhsikr2NdLPqW7g6uje8Dg4iazT2ncTV41cZiFgpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632276; c=relaxed/simple;
	bh=oCz3V+7ZTi4hFmVrBJWM7NCWZDfRFBK/IEiwC/HpnyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkiVSZSjWnWs1rGRk7lUtG3Q8oTotxIVMKWYUpZpHlzToH+e6E1CJGwam+kQm27I6DaFcgA/gYhj3d/l4vEfjzAPgviyq/y8ZBAolBaVtOr7E9sbKx1yAWG44VeTbrW3nAewjJDdXsVHZxs4P8XO4qJnGcmahbgxSONXrU0lneo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ry/wUV//; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE43C4CEEF;
	Wed, 11 Jun 2025 08:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749632276;
	bh=oCz3V+7ZTi4hFmVrBJWM7NCWZDfRFBK/IEiwC/HpnyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ry/wUV///yloc7ZH6Z3DbDtkoWmr7OVO/u0DivsYbyhoZBnaBorMu9v5hUhXBncNC
	 YoxHmILhOHrEfJTJi0nHycFYs0UF0JcddVe3oB/pN4P7zz17WOTVk+KbvIOlNb9myu
	 ZW0Hlant5vbqQnPMJDnN4ewgVxmw3geWBQP3BkyDtrq8zeJoh0mdV2luoHm9sOpnHT
	 X5m/7JqIF5vcvfqNeYMeCUlvkque0Bc+1nmQ6L6uIEiAeJSQ2p+pKhiZVkJT52E0uS
	 SuuZ1pg1RU391hCzzdzM67q0tYp1DfBLnKyVQ+5oMURIFdL5U+vYL3fzjeA77sX7wR
	 Sfc8KkK5zWsIA==
Date: Wed, 11 Jun 2025 10:57:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Griffin <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 03/17] regulator: dt-bindings: add s2mpg11-pmic
 regulators
Message-ID: <20250611-spectral-bullfrog-of-perfection-cb8e01@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
 <20250606-s2mpg1x-regulators-v2-3-b03feffd2621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250606-s2mpg1x-regulators-v2-3-b03feffd2621@linaro.org>

On Fri, Jun 06, 2025 at 04:02:59PM GMT, Andr=C3=A9 Draszik wrote:
> The S2MPG11 PMIC is a Power Management IC for mobile applications with
> buck converters, various LDOs, power meters, and additional GPIO
> interfaces. It typically complements an S2MPG10 PMIC in a main/sub
> configuration as the sub-PMIC.
>=20
> S2MPG11 has 12 buck, 1 buck-boost, and 15 LDO rails. Several of these
> can either be controlled via software or via external signals, e.g.
> input pins connected to a main processor's GPIO pins.
>=20
> Add documentation related to the regulator (buck & ldo) parts like
> devicetree definitions, regulator naming patterns, and additional
> properties.
>=20
> Since S2MPG11 is typically used as the sub-PMIC together with an
> S2MPG10 as the main-PMIC, the datasheet and the binding both suffix the
> rails with an 's'.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> Note: checkpatch suggests to update MAINTAINERS, but the new file is
> covered already due to using a wildcard.
>=20
> v2:
> - fix commit message typos: s2mp1 -> s2mpg1
> - mention GPIOs in commit message
> ---
>  .../regulator/samsung,s2mpg11-regulator.yaml       | 150 +++++++++++++++=
++++++
>  .../regulator/samsung,s2mpg10-regulator.h          |  18 +++
>  2 files changed, 168 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-=
regulator.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpg1=
1-regulator.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f2d596642501c197e2911ee3b=
9caac189cf541a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg11-regulat=
or.yaml
> @@ -0,0 +1,150 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/samsung,s2mpg11-regulator.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S2MPG11 Power Management IC regulators
> +
> +maintainers:
> +  - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> +
> +description: |
> +  This is part of the device tree bindings for the S2MG11 Power Manageme=
nt IC
> +  (PMIC).
> +
> +  The S2MPG11 PMIC provides 12 buck, 1 buck-boost, and 15 LDO regulators.
> +
> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
> +  additional information and example.
> +
> +definitions:
> +  s2mpg11-ext-control:
> +    properties:
> +      samsung,ext-control:
> +        description: |
> +          These rails can be controlled via one of several possible exte=
rnal
> +          (hardware) signals. If so, this property configures the signal=
 the PMIC
> +          should monitor. The following values generally corresponding t=
o the
> +          respective on-chip pin are valid:
> +            - 0 # S2MPG11_PCTRLSEL_ON - always on

Use regulator-always-on

> +            - 1 # S2MPG11_PCTRLSEL_PWREN - PWREN pin

That's duplicating regulator in standby properties.

> +            - 2 # S2MPG11_PCTRLSEL_PWREN_TRG - PWREN_TRG bit in MIMICKIN=
G_CTRL
> +            - 3 # S2MPG11_PCTRLSEL_PWREN_MIF - PWREN_MIF pin
> +            - 4 # S2MPG11_PCTRLSEL_PWREN_MIF_TRG - PWREN_MIF_TRG bit in =
MIMICKING_CTRL
> +            - 5 # S2MPG11_PCTRLSEL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
> +            - 6 # S2MPG11_PCTRLSEL_AP_ACTIVE_N_TRG - ~AP_ACTIVE_N_TRG bi=
t in MIMICKING_CTRL
> +            - 7 # S2MPG11_PCTRLSEL_G3D_EN - G3D_EN pin
> +            - 8 # S2MPG11_PCTRLSEL_G3D_EN2 - G3D_EN & ~AP_ACTIVE_N pins
> +            - 9 # S2MPG11_PCTRLSEL_AOC_VDD - AOC_VDD pin
> +            - 10 # S2MPG11_PCTRLSEL_AOC_RET - AOC_RET pin
> +            - 11 # S2MPG11_PCTRLSEL_UFS_EN - UFS_EN pin

Now I have doubts these are real signals. Are you saying that S2MPG11
has a pin named UFS_EN (such pin on ballmap)?

> +            - 12 # S2MPG11_PCTRLSEL_LDO13S_EN - VLDO13S_EN pin
> +
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 12
> +
> +      samsung,ext-control-gpios:

Same comments as previous patch.

Best regards,
Krzysztof


