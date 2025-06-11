Return-Path: <linux-gpio+bounces-21339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0112BAD4EEE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 10:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35C5F7AB5AD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 08:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD6524291B;
	Wed, 11 Jun 2025 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTAE3pxw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509BD2BD11;
	Wed, 11 Jun 2025 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749632147; cv=none; b=kDCw1TAHsK8gOqPq+q7r6X1Bliq9RUeLBCI1EGLnIQYF1Fmff8dD3CbsTmROMlDlFVTAKcmPgsVR+moGhBoIW53fXrvQCci4wPDrDlaUipWf9vFN/KcxHWRMIHO5mwj7I+mdtPvISzw3LNYd3CK8jKkWSN2YpUy3QVOyYutwVjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749632147; c=relaxed/simple;
	bh=6d/kwVtsJUb6UGpgzU7hhzpSd4al/5RJeq1TyB54wSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROO/OkfohahKc3tRn0hLndIobUhqYWoYstuJfKIiC25hLGVVsuas0u/4u74WcLWPzvBo94B0xsyu1qBMb4+nRwBEnvpRXXPpg3m1LAtqI0zNm+Wm3jxUEHIgpe5/WMPsOOba4ih6S//aRK2k/jOI4sw7PFzhk2jQXrniVPgdAjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTAE3pxw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DD7C4CEEE;
	Wed, 11 Jun 2025 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749632146;
	bh=6d/kwVtsJUb6UGpgzU7hhzpSd4al/5RJeq1TyB54wSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTAE3pxwvtwy4i4IfJxVZjwbEaCrCicfY+3E4hcOMddWrD/mECITAyNfVudOaIo30
	 mP86ea8Hnv4ej7dXA08zjzos8wcnfJnGokEHDkXBzZh3foMZDPbMXlY774t7uP462u
	 rDSwEv/YyF4xTeAMyiEuzywjLWxjzDxZ3z0KqWh9AhgMS4S6gdmVFsm2aCBGtqtZxZ
	 yYMmYX89RKUOfhtFOeE+Fncm6xn4Kp3qVH57cDlaPrCfzEI5AgHytdzunab0YYNAqt
	 +tdwjy9Jwz1q9qEMcZWJmF36fmpPnR+LHmHAQ4ImitSvIJ7R7DEZv3ABx6LURGcNkK
	 Su7rRLQrw5Cfw==
Date: Wed, 11 Jun 2025 10:55:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Peter Griffin <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/17] regulator: dt-bindings: add s2mpg10-pmic
 regulators
Message-ID: <20250611-statuesque-dolphin-of-felicity-6fbf54@kuoka>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
 <20250606-s2mpg1x-regulators-v2-2-b03feffd2621@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250606-s2mpg1x-regulators-v2-2-b03feffd2621@linaro.org>

On Fri, Jun 06, 2025 at 04:02:58PM GMT, Andr=C3=A9 Draszik wrote:
> The S2MPG10 PMIC is a Power Management IC for mobile applications with
> buck converters, various LDOs, power meters, RTC, clock outputs, and
> additional GPIO interfaces.
>=20
> It has 10 buck and 31 LDO rails. Several of these can either be
> controlled via software or via external signals, e.g. input pins
> connected to a main processor's GPIO pins.
>=20
> Add documentation related to the regulator (buck & ldo) parts like
> devicetree definitions, regulator naming patterns, and additional
> properties.
>=20
> S2MPG10 is typically used as the main-PMIC together with an S2MPG11
> PMIC in a main/sub configuration, hence the datasheet and the binding
> both suffix the rails with an 'm'.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> v2:
> - drop | (literal style mark) from samsung,ext-control-gpios
>   description
> ---
>  .../regulator/samsung,s2mpg10-regulator.yaml       | 147 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   1 +
>  .../regulator/samsung,s2mpg10-regulator.h          |  48 +++++++
>  3 files changed, 196 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-=
regulator.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpg1=
0-regulator.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..82f2b06205e9bdb15cf90b1e8=
96fe52c335c52c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulat=
or.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/samsung,s2mpg10-regulator.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S2MPG10 Power Management IC regulators
> +
> +maintainers:
> +  - Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> +
> +description: |
> +  This is part of the device tree bindings for the S2MG10 Power Manageme=
nt IC
> +  (PMIC).
> +
> +  The S2MPG10 PMIC provides 10 buck and 31 LDO regulators.
> +
> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
> +  additional information and example.
> +
> +definitions:
> +  s2mpg10-ext-control:
> +    properties:
> +      samsung,ext-control:
> +        description: |
> +          These rails can be controlled via one of several possible exte=
rnal
> +          (hardware) signals. If so, this property configures the signal=
 the PMIC
> +          should monitor. For S2MPG10 rails where external control is po=
ssible other
> +          than ldo20m, the following values generally corresponding to t=
he
> +          respective on-chip pin are valid:
> +            - 0 # S2MPG10_PCTRLSEL_ON - always on
> +            - 1 # S2MPG10_PCTRLSEL_PWREN - PWREN pin
> +            - 2 # S2MPG10_PCTRLSEL_PWREN_TRG - PWREN_TRG bit in MIMICKIN=
G_CTRL
> +            - 3 # S2MPG10_PCTRLSEL_PWREN_MIF - PWREN_MIF pin
> +            - 4 # S2MPG10_PCTRLSEL_PWREN_MIF_TRG - PWREN_MIF_TRG bit in =
MIMICKING_CTRL
> +            - 5 # S2MPG10_PCTRLSEL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
> +            - 6 # S2MPG10_PCTRLSEL_AP_ACTIVE_N_TRG - ~AP_ACTIVE_N_TRG bi=
t in MIMICKING_CTRL
> +            - 7 # S2MPG10_PCTRLSEL_CPUCL1_EN - CPUCL1_EN pin
> +            - 8 # S2MPG10_PCTRLSEL_CPUCL1_EN2 - CPUCL1_EN & PWREN pins
> +            - 9 # S2MPG10_PCTRLSEL_CPUCL2_EN - CPUCL2_EN pin
> +            - 10 # S2MPG10_PCTRLSEL_CPUCL2_EN2 - CPUCL2_E2 & PWREN pins
> +            - 11 # S2MPG10_PCTRLSEL_TPU_EN - TPU_EN pin
> +            - 12 # S2MPG10_PCTRLSEL_TPU_EN2 - TPU_EN & ~AP_ACTIVE_N pins
> +            - 13 # S2MPG10_PCTRLSEL_TCXO_ON - TCXO_ON pin
> +            - 14 # S2MPG10_PCTRLSEL_TCXO_ON2 - TCXO_ON & ~AP_ACTIVE_N pi=
ns
> +
> +          For S2MPG10 ldo20m, the following values are valid
> +            - 0 # S2MPG10_PCTRLSEL_LDO20M_ON - always on

No, use standard regulator properties - regulator-always-on


> +            - 1 # S2MPG10_PCTRLSEL_LDO20M_EN_SFR - VLDO20M_EN & LDO20M_S=
FR
> +            - 2 # S2MPG10_PCTRLSEL_LDO20M_EN - VLDO20M_EN pin
> +            - 3 # S2MPG10_PCTRLSEL_LDO20M_SFR - LDO20M_SFR in LDO_CTRL1 =
register
> +            - 4 # S2MPG10_PCTRLSEL_LDO20M_OFF - disable

I don't think we allowed such property in the past. I don't get what is
here the actual signal - you described registers in multiple places, not
signals. Few of these duplicate standard properties, so this looks like
exact copy of downstream which was doing exactly that way and that was
exactly never upstreamed.


> +
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 14
> +
> +      samsung,ext-control-gpios:

enable-gpios


> +        description:
> +          For rails where external control is done via a GPIO, this opti=
onal
> +          property describes the GPIO line used.
> +
> +        maxItems: 1

And this can be dropped.

Best regards,
Krzysztof


