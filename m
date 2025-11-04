Return-Path: <linux-gpio+bounces-28004-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79214C3002E
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 09:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 843DA3BC39F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 08:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0516320CD1;
	Tue,  4 Nov 2025 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnhENImu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED40320CB5;
	Tue,  4 Nov 2025 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245446; cv=none; b=nvwHpI0LuJKmQqEfG2sgcidIumkgjwUhAHtLPHFrHm6ruWBxZYOqe6MisCYDV7TErS8569bcSyRBmrUo03NQEaE0OHkLhKZLso396Z828yhiNmJRRrkpGWV+9WUhdeXrXqEE+dHDwhPMdrNJlJOD+yoPo6fC5IrcrQnR+IDi08M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245446; c=relaxed/simple;
	bh=foCiIsSb/QzMBNXONPuDU6fZ9CxIPNvgssjQ2N/7VoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpiDIBT2l8pnsBo9v3nip2dB+ptZodQP59aNwFFrVl8bsHDq/IO4AyFxwi1TjT+oe5FYDStm0hr5LyD2Pj6r2RuI0RROwCtfm1yRMYgHC63jcBC7n8dTM+RkFa0uwjCnsLpqckrDIOMInaLzK36WxqlUYOA44S2+kwds2AHs+/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnhENImu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A4C6C4CEF7;
	Tue,  4 Nov 2025 08:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762245446;
	bh=foCiIsSb/QzMBNXONPuDU6fZ9CxIPNvgssjQ2N/7VoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnhENImuJBLXNH+o0kZQcdwodiyRLlSXdWyu1XnV/mhLcHwQxruBSL7BD4oHTnxi6
	 krFMSBEr0oC2n60Dzs+iWBUtWZFUd3ZDac2CKTZwJwyHzZlM0P//vOBAgKtHTs0KhZ
	 jh+SE2ZYfz51op7vPIygdx8IKi+yXPj4j/tpnge8z5T1BlYjU+Z9LOu1gcgQayn0w6
	 2ODs2KBnAFB4AhIgMeXn4s/LYLfWqDvglIDo9j3fl9mV/4IPN9my5BC3+UYlO9wbAL
	 GEKHX4YhnTwt7FelTjy8M4pw5mDFwLoBvwEtJAqATKCrBw2rR1g7cm6mKXRbek8JeY
	 QJroEwaNsjFDA==
Date: Tue, 4 Nov 2025 09:37:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 06/20] dt-bindings: mfd: samsung,s2mpg10: Add
 s2mpg11-pmic
Message-ID: <20251104-glossy-frog-of-grandeur-a345d1@kuoka>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-6-b8b96b79e058@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251103-s2mpg1x-regulators-v3-6-b8b96b79e058@linaro.org>

On Mon, Nov 03, 2025 at 07:14:45PM +0000, Andr=C3=A9 Draszik wrote:
> +  "^vinb[abd]-supply$":
> +    description: |
> +      Phandle to the power supply for the additional buck rails of the S=
2MPG11
> +      PMIC. The mapping of supply to rail is as follows::
> +        vinba - bucka
> +        vinbb - buck boost
> +        vinbd - buckd
> +
> +  "^vinl[1-6]s-supply$":
> +    description: |
> +      Phandle to the power supply for one or multiple LDO rails of the S=
2MPG11
> +      PMIC. The mapping of supply to rail(s) is as follows:
> +        vinl1s - ldo1s, ldo2s
> +        vinl2s - ldo8s, ldo9s
> +        vinl3s - ldo3s, ldo5s, ldo7s, ldo15s
> +        vinl4s - ldo10s, ldo11s, ldo12s, ldo14s
> +        vinl5s - ldo4s, ldo6s
> +        vinl6s - ldo13s
> +
>  required:
>    - compatible
>    - interrupts
> @@ -81,3 +102,23 @@ allOf:
>        properties:
>          regulators:
>            $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
> +
> +      patternProperties:
> +        "[^m]-supply$": false
> +
> +  - if:

OK, so this explains why earlier you put $ref in if:then:. I propose to
move it to separate new MFD schema, because half or more of properties
are not applicable between each of the devices.


Best regards,
Krzysztof


