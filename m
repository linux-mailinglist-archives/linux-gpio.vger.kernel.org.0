Return-Path: <linux-gpio+bounces-28385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C5C51998
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 11:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 00F4C4F4624
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 10:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08E13002DE;
	Wed, 12 Nov 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcjdsSen"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25522FE06F;
	Wed, 12 Nov 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942196; cv=none; b=na5mx64bPFFGK3Y3s7NUYwbuUGmTbAJxJfTr60M/3Gwy8ZlKBoflSnTQZhurBtJ8Hg+e93fATkOER9khi9CHHc/hrCVcqhoaOxxo8X5ie9ceGWfsWrXf6I3hUfj10syO6NPxsJM3Y9RMFuFywpLMI1l2fi5IUy/DQzpayTXwuYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942196; c=relaxed/simple;
	bh=h8uSR1ocMfXRsHBdg93iaXgXPSeXabEf7Rj4gpBt6BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJd/gUQ1vAMmrSi+Li7wAQeQbOijxoAbcwrhe6/S6YJRROBdoCr7UymGSOuALVfQlujlzG7QtJP4I2zc1KwpNohzn156doAU1hmQn+8qCgCKRMC071IVYWKqteZOyurFzh91MxA7Kc7gDkIhWTIHIrBqBMv2FKYBqmrG6Pot1NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcjdsSen; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07D4C4CEF8;
	Wed, 12 Nov 2025 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762942196;
	bh=h8uSR1ocMfXRsHBdg93iaXgXPSeXabEf7Rj4gpBt6BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DcjdsSenYwGXYPwcWHE/iaya2z/ywxacImyAtsJDj459kphsIEcJBXPw0Sd2ds3KA
	 XGcWZ9n0in9buIeOM+R8Wha6uTQdQMRn/9+aSbSG+JsbAVNjZJT3tr+y9a4ewHICK2
	 JOsHjHV8BOChjUVkDU7VlkM+xwlOZqZiGWoXXHVweAAv+NHoast9GhangzTsbE2bzl
	 hHpPycdGfk08RIFf3HCZZWoKmTm2Kgputd1j+1n8a5ohHaYRyCBlDz39rBjMAmz050
	 5s0NdGFxk9lywW60Y37DuSnKoXL+MqUznT0XvFYCfqvydyFQMJObByAMCHiyvsPWG6
	 8ht75lJ6z0zsQ==
Date: Wed, 12 Nov 2025 11:09:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 05/20] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to
 its regulators
Message-ID: <20251112-cautious-proficient-petrel-934119@kuoka>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
 <20251110-s2mpg1x-regulators-v4-5-94c9e726d4ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110-s2mpg1x-regulators-v4-5-94c9e726d4ba@linaro.org>

On Mon, Nov 10, 2025 at 07:28:48PM +0000, Andr=C3=A9 Draszik wrote:
> Update the regulators node to link to the correct and expected
> samsung,s2mpg10-regulators binding, in order to describe the regulators
> available on this PMIC.
>=20
> Additionally, describe the supply inputs of the regulator rails, with
> the supply names matching the datasheet.
>=20
> While at it, update the description and example slightly.
>=20
> Note: S2MPG10 is typically used as the main-PMIC together with an
> S2MPG11 PMIC in a main/sub configuration, hence the datasheet and the
> binding both suffix the supplies with an 'm'.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> ---
> v4:
> - separate bindings for s2mpg10-pmic and s2mpg11-pmic (Krzysztof)
>=20
> v3:
> - move to new samsung,s2mpg10.yaml file
> - move all patternProperties to top-level
> ---
>  .../bindings/mfd/samsung,s2mpg10-pmic.yaml         | 57 ++++++++++++++++=
++++--

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


