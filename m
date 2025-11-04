Return-Path: <linux-gpio+bounces-28001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5591AC2FE01
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 09:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DC73A343F6B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 08:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FD3311979;
	Tue,  4 Nov 2025 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUEo8+hc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D793016EF;
	Tue,  4 Nov 2025 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762244933; cv=none; b=hkh4FopGA/ARiaZXtUcWBkJSu4dpNzWOkqKDD2jY92IhrhoiRjWGuko1i8cnrndfAgBLv+u6pUfXwYWjShJPe6wgewyQw//tCPbZjq/K6cS49kgmjUW7jPapyDg+G0cUI4zwPx85T6mwZNSgu/07MmOMuUf2SSN3VeOm7ara+bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762244933; c=relaxed/simple;
	bh=WfLEI8T0KL5DnxSxkYFNzlS30mf4/YKb7CiaGxx1sh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQ6gzJQOEvfPhcFsu/5WR4rIENw0wNHVelmHVD5vPpvSq7e/IYvDDKiMsDPRq0ziJkho0HXCaoJLgSghZz+1qhiGQW4gguAJ/Uaucq2Coe32pEhUGNj6GVFUHSff6gRpJQKN3Smnp9vL/akKCqmweCiQtnGHkL6LW84ZUyXXrW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUEo8+hc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3F5C4CEF8;
	Tue,  4 Nov 2025 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762244933;
	bh=WfLEI8T0KL5DnxSxkYFNzlS30mf4/YKb7CiaGxx1sh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUEo8+hc15tqRWLPXZGfelPypwQqARyzy5Vpz+G1nE4SeqWY+KnavMmgSTF0VJgPW
	 MIDu0kwJYh7KDn5AItG8KcTnZCLshtYWjq/QamqlumrrMcE07zXYEYjLvAE/VCDcJn
	 iIE3PiLcHJb6CBYwwXiaMfR7KWH+CZcJ/J5KU1jKwQtK7JN7raEkKUqAIhDYPVl8KP
	 wocm5mRH75tjgrzgDKP6G06KFR1CmFu1Rvh/pd1cWm4wRIYlTP/F/613dOozVB9O8T
	 Bb3xMZCXivoYqQQzvxKS7lTbqdMcpswMe06K/ADsII49LzEWBaauwfTvD1SVsCTS2t
	 WoEHod0e1TpKg==
Date: Tue, 4 Nov 2025 09:28:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 05/20] dt-bindings: mfd: samsung,s2mpg10: Link
 s2mpg10-pmic to its regulators
Message-ID: <20251104-elegant-imposing-boa-6279ca@kuoka>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-5-b8b96b79e058@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251103-s2mpg1x-regulators-v3-5-b8b96b79e058@linaro.org>

On Mon, Nov 03, 2025 at 07:14:44PM +0000, Andr=C3=A9 Draszik wrote:
>  required:
>    - compatible
>    - interrupts
>    - regulators
> =20
>  additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,s2mpg10-pmic
> +    then:
> +      properties:

This is not correct now. You do not have other variants here and ref
should be directly in top level "regulators" part of schema.


> +        regulators:
> +          $ref: /schemas/regulator/samsung,s2mpg10-regulator.yaml
>=20
> --=20
> 2.51.2.997.g839fc31de9-goog
>=20

