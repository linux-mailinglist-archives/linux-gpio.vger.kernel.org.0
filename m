Return-Path: <linux-gpio+bounces-28002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40CC2FE82
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 09:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B8013A9D7A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 08:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A4BE2BDC2F;
	Tue,  4 Nov 2025 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r7/Zsfoc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9E7EEC0;
	Tue,  4 Nov 2025 08:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245070; cv=none; b=UCb1pZYFNyOtkzqVPdOlJW76XXqZIhPdyNZA+KkuGQuRt7Wy5bjdrtLV9V1PGufeO45BQNytH5DrAlrC6hJkF3Q+eXr+Ly6vLiTh9QuypFRqhJeIJeg7Ek/BK0bQ0aTv6VlNML8NBrlgS5+6QG3nWSsYk5KRNsG1zHozAhM67G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245070; c=relaxed/simple;
	bh=3xceHsxXhCdcgtIdMQ5qJFYY8DSrH0P3Oh57cMWibVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rN/krvQ8HbUw2u0Yzwqm6dWAVyqY34WHHFq6t3cCPpgCcZ3loEnKn/Rhjls6gKsvsqn8SsvMeZfunAGw6g2mcG0ZYO2Wx+sTv41Uw1du3nQupCxf+5WOjp2NMkadG/LWhNtEsafILjzXfFxppvGvniaAGvXRfViKcUiC6t+Cz5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r7/Zsfoc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF666C4CEF7;
	Tue,  4 Nov 2025 08:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762245067;
	bh=3xceHsxXhCdcgtIdMQ5qJFYY8DSrH0P3Oh57cMWibVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r7/ZsfocgWcavXRz5mce/0NqwSfnLGokwYxa4JjTB1YZVH1/up/3juZNYYvaSZ+cc
	 TbH18iCnMtmR2iwPzGm6gaFxXfwNPS/OSy9fcifBThKvJmWUfKEJiIJ++rI/cPE0Cz
	 gGCOzJYpl8BUNHelyuT8JbV7gga/BBib0waopzKLxFLtbJ6MFUX/2GoGxgmw6vyOTF
	 gnYdnpdKW5Zaavx/nEGOAWP8hfP8kF77c6lMwEsgSluecQojiCV+TczSEWaGfWa3Ot
	 St61y02YsPaSif1iRBhOYRJtcuhMcbaJdfNjoOELhUiYxxz6VKjLJeAozNZ4R54/8D
	 PrT4K5KYTJgTg==
Date: Tue, 4 Nov 2025 09:31:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 07/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 update PMIC examples
Message-ID: <20251104-awesome-tacky-magpie-bacd9f@kuoka>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-7-b8b96b79e058@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251103-s2mpg1x-regulators-v3-7-b8b96b79e058@linaro.org>

On Mon, Nov 03, 2025 at 07:14:46PM +0000, Andr=C3=A9 Draszik wrote:
> In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
> as a sub-PMIC.
>=20
> The interface for both is the ACPM firmware protocol, so update the
> example here to describe the connection for both.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 40 ++++++++++++++++=
++++--
>  1 file changed, 37 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml
> index 4a1e3e3c0505aad6669cadf9b7b58aa4c7f284cb..c25e155926e5f44bd74f195cd=
bff3672c7499f8e 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -45,6 +45,15 @@ properties:
>        compatible:
>          const: samsung,s2mpg10-pmic
> =20
> +  pmic2:

pmic-2

Are there more pmics? Bindings are supposed to be complete (see writing
bindings) and if you did follow this approach earlier, you would nicely
call first "pmic-1" (instead of "pmic") and then "pmic-2".

> +    description: Child node describing the sub PMIC.
> +    type: object
> +    additionalProperties: true

Best regards,
Krzysztof


