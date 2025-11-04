Return-Path: <linux-gpio+bounces-28000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 390BAC2FE70
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 09:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E21319400B9
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 08:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC174306B0D;
	Tue,  4 Nov 2025 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHTNFFwo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D70238C0A;
	Tue,  4 Nov 2025 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762244809; cv=none; b=Hkf6GFLpVxxO/dGuiJviAL/AeR5L9SbQNKNsbvZsWAUiJnoKvYrkLnLNZI5w8KtSck//DUJRQfv/69CpllM64J+wIBBh0/EK7SGRA+cHnQqQjdq15FvaPvg7w18Te2Pz9ByDFVgFKadnTpCeZV5o6UDHVi14JvYipNzbCR5i1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762244809; c=relaxed/simple;
	bh=QngsHx6OSbSqgWI2TNR6ndZiCeINsFmjJj+LGU2l0Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HlvffEtMRH57SvI86rfYzXNavtx4iPW5wrDJ9PUUnbNmY4Vn3K1gCa9p48B6ocB5l/UVULuOiWMuG4MoEhtkXpRgb8xz2+GrPOpFcxy6TLRNbWkQOsYeqBn0AyS2NBswzESQ8JVjG1U3oY9TFqPua+t185j1BZydynqwf3fJeg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHTNFFwo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE83C4CEF7;
	Tue,  4 Nov 2025 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762244809;
	bh=QngsHx6OSbSqgWI2TNR6ndZiCeINsFmjJj+LGU2l0Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHTNFFwopoBoO3ow6ttZSRT3t+xiKykircWNlwOI4gZY6Tlyi5u2syGcnSBhFnq7J
	 tyr5tTL+Pl66H5dIGnbO+4qf9EG+qDc9Bh/tMCp4nrRGfuIrYn4xyUhfs3/GfQ4qgh
	 OH+CWNIU/PBJg/JG+wjnANhDsRwayyTX71T1FOhJMHoQDvhslZbEYMWSm6NHHl4mBn
	 /dJFDNG2EegaAPY3xFh8kXgY/RCm6ogaPIepDHR3Xj6+tu48vvmYDwQ/laq5orhVtb
	 TZKXKF00uUJbUU8xalVbtp9psDCYjfpK0hWYMdomtUHz1RySVY/9oM+bSdPZFZmx7V
	 sJmQdjx7aZnRw==
Date: Tue, 4 Nov 2025 09:26:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 02/20] dt-bindings: mfd: samsung,s2mps11: split
 s2mpg10 into separate file
Message-ID: <20251104-armored-vehement-boar-55bde4@kuoka>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-2-b8b96b79e058@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251103-s2mpg1x-regulators-v3-2-b8b96b79e058@linaro.org>

On Mon, Nov 03, 2025 at 07:14:41PM +0000, Andr=C3=A9 Draszik wrote:
> +properties:
> +  compatible:
> +    const: samsung,s2mpg10-pmic
> +
> +  clocks:
> +    $ref: /schemas/clock/samsung,s2mps11.yaml
> +    description:
> +      Child node describing clock provider.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    description:
> +      List of child nodes that specify the regulators.
> +
> +  system-power-controller: true
> +
> +  wakeup-source: true
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - regulators
> +
> +additionalProperties: false

You need a complete example here.

Best regards,
Krzysztof


