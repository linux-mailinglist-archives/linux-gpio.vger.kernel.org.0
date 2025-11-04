Return-Path: <linux-gpio+bounces-28008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16186C30547
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 10:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4818742271F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 09:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BCE3112D3;
	Tue,  4 Nov 2025 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIKCGYiu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CBA2D2384;
	Tue,  4 Nov 2025 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762249193; cv=none; b=iNkUcTK1TgMqJjtw+mkHAv6RKEzpOY7WUYv1l2Zu856/6w0ELUEohOuPb3SkgMjIy6i4FPWYjxd/M+AwlW5aQjR/zyYf5mHruNYb7TiKSYpNQhm9tmR4PmO2xN4Kk0387XtmSltJSX015aLMkF+LKn5mP6xyqpkw1+/vzfqSzOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762249193; c=relaxed/simple;
	bh=zeVddxiuCAy3GSY9vxx7eRWDkcHX9f0QBGNcByXvWOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFVxjJOizhekGw1S7SdjXtuk1g27Q47CrC0sNQn9N0YXEkP1IBMuFb4WYJvWaDpc465j4/Upbo28LZsyPheayR8aSQtOhZGcvFhyE+dngBxHNtM0tX1PtXtutitXWhvonmDde0a+U9kTbmxlL6rbF8tUkZnWW5nfsSliBt1XUks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIKCGYiu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D78C4CEF7;
	Tue,  4 Nov 2025 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762249192;
	bh=zeVddxiuCAy3GSY9vxx7eRWDkcHX9f0QBGNcByXvWOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hIKCGYiuqv+AqFQ8ooAvxdIaMxJ48WnNmf0fJneKbSpfnUvuLGxjaV8Ln9Dxm+fUW
	 1hHr5Y8u3/kM+urYsiqTsp7BO24NetLeTRGV3gLrOkzny4D0CP7skd80EEIrehfiw0
	 p6aREp29HoRPUhb3KUZBqZgKS0qw14qKT5C9ijCrpeX9Dh25FwCVC+ZTXNg06difTc
	 2AZjJfETGVjyawbVkuqxmA/eoIbClYYsq9ydhBr7ENimdH6SR0J7jSKgskEinmBheO
	 o4ntsyOrPsaYlEKqdMGke1BIewpjSjjepA9Ks4DGS7bSbc6k4sy64uEAJQIz3ot6Cu
	 K7EFum+Se0jsg==
Date: Tue, 4 Nov 2025 10:39:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 04/20] regulator: dt-bindings: add s2mpg11-pmic
 regulators
Message-ID: <20251104-zircon-lobster-of-agility-cbcbb0@kuoka>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-4-b8b96b79e058@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251103-s2mpg1x-regulators-v3-4-b8b96b79e058@linaro.org>

On Mon, Nov 03, 2025 at 07:14:43PM +0000, Andr=C3=A9 Draszik wrote:
> +  The S2MPG11 PMIC provides 12 buck, 1 buck-boost, and 15 LDO regulators.
> +
> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
> +  additional information and example.
> +
> +definitions:

defs:


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
> +            - 0 # S2MPG11_PCTRLSEL_PWREN - PWREN pin
> +            - 1 # S2MPG11_PCTRLSEL_PWREN_MIF - PWREN_MIF pin
> +            - 2 # S2MPG11_PCTRLSEL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
> +            - 3 # S2MPG11_PCTRLSEL_G3D_EN - G3D_EN pin
> +            - 4 # S2MPG11_PCTRLSEL_G3D_EN2 - G3D_EN & ~AP_ACTIVE_N pins
> +            - 5 # S2MPG11_PCTRLSEL_AOC_VDD - AOC_VDD pin
> +            - 6 # S2MPG11_PCTRLSEL_AOC_RET - AOC_RET pin
> +            - 7 # S2MPG11_PCTRLSEL_UFS_EN - UFS_EN pin
> +            - 8 # S2MPG11_PCTRLSEL_LDO13S_EN - VLDO13S_EN pin
> +
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 8
> +
> +      enable-gpios:
> +        description:
> +          For rails where external control is done via a GPIO, this opti=
onal
> +          property describes the GPIO line used.
> +
> +    dependentRequired:
> +      enable-gpios: [ "samsung,ext-control" ]
> +
> +properties:
> +  buckboost:
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Properties for the buck-boost regulator.
> +
> +    properties:
> +      regulator-ramp-delay: false
> +
> +patternProperties:
> +  # 12 bucks
> +  "^buck(([1-9]|10)s|[ad])$":
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Properties for a single buck regulator.
> +
> +    allOf:
> +      - $ref: "#/definitions/s2mpg11-ext-control"

defs

> +
> +    properties:
> +      regulator-ramp-delay:
> +        enum: [6250, 12500, 25000]
> +        default: 6250
> +

=2E...


> +    allOf:
> +      - $ref: "#/definitions/s2mpg11-ext-control"
> +
> +    properties:
> +      regulator-ramp-delay:
> +        enum: [6250, 12500]
> +        default: 6250
> +
> +additionalProperties: false

This goes to the end, after allOf, see example-schema.

> +
> +allOf:
> +  # Bucks 4, 6, 7 and 10 can not be controlled externally - above defini=
tion
> +  # allows it and we deny it here. This approach reduces repetition.
> +  - if:
> +      anyOf:
> +        - required: [buck4s]
> +        - required: [buck6s]
> +        - required: [buck7s]
> +        - required: [buck10s]
> +    then:
> +      patternProperties:
> +        "^buck([467]|10)s$":
> +          properties:
> +            samsung,ext-control: false

Best regards,
Krzysztof


