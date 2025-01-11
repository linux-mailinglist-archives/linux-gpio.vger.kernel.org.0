Return-Path: <linux-gpio+bounces-14683-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 488AAA0A2F3
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2025 11:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A70C188C240
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jan 2025 10:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4907D1917EB;
	Sat, 11 Jan 2025 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gc4rA1m5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF79214E2C2;
	Sat, 11 Jan 2025 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736592651; cv=none; b=G7CTta6k0zFZXqxR3XcPsRE81Mt83F7li9ybgLpQv1lDoEIo7yzzkh6E6T3hzwP/QgCQlkAZzjYWCEIcUcxBAx7f3zblriIwHiRhdF1BUt/kTI3T676peIGTWF2WKOeIoGOQlzUFhW2iCZ1+lsDThFEfpvKedv8ZWDyTxTk3Qlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736592651; c=relaxed/simple;
	bh=6H7mqgtjDqxxpuJcQGmQRoaOPqsjXHlYEEshni72eCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=So8vyyWc1h/V7p/KriKzyjzRBw9IbdIwQqEIKQ17Bba0KMc7Lnw625C24vkimvmR5QhZOo8+0El3wIyC1ReVh8ghivoQp/i6479gv2ZziG0Vb04QQHUw6BaFtwKJdiz/uvTJAXt/8xaC9q7pLkw/Xt02IuuebjvMg5ItpSqQZv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gc4rA1m5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AEDC4CED2;
	Sat, 11 Jan 2025 10:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736592650;
	bh=6H7mqgtjDqxxpuJcQGmQRoaOPqsjXHlYEEshni72eCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gc4rA1m5Wev8AnaZqamLaO5ITJaCk0d/45hpUM4zSEl+lneqjxzGRuMOOPDvhO2QS
	 LZ5ncqg8W57AkHh1hrmrwp9lrarvqWn2o7ncuAl3ySRGkZbuA7GUACTYjRNj0vigue
	 ePOAM+Egqm+Px9dV9Q82+yFwDBm8TuskmKMtv5jpWheUFnmrugw/O3gGeYAQHhThD9
	 b0eoUv3OMyEsqJfyqsH2puqNbo5WpbDlkxt761u54QMyi86iNHUhH20S3ncYLXVFB7
	 8xRthH1PyFJksJFhtFjpMYFPCEIhM3zNPRPnaxLpb0680LKdgVOY3dc7SDc8nHdNcn
	 7dmBEEzeevfnQ==
Date: Sat, 11 Jan 2025 11:50:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>, 
	"Geert Uytterhoeven via gmail . com" <geert@linux-m68k.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: fairchild,74hc595: use a fallback
 for Semi MC74HC595A
Message-ID: <2pe3fr5fbt6ifbttknplrkiqhq4gv7qn5pcz7um36hdlcmwud3@jqray4yn75gk>
References: <20250110130025.55004-1-brgl@bgdev.pl>
 <20250110130025.55004-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110130025.55004-3-brgl@bgdev.pl>

On Fri, Jan 10, 2025 at 02:00:25PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> This model is 1:1 compatible with fairchild,74hc595 so use the latter as
> a fallback instead of adding a new stand-alone compatible.
> 
> Fixes: 0ba6cec7acbb ("dt-bindings: gpio: fairchild,74hc595: Add On Semi MC74HC595A compat")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../devicetree/bindings/gpio/fairchild,74hc595.yaml    | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> index a209c5b4f6e0..da462dddb140 100644
> --- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> @@ -28,10 +28,12 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - fairchild,74hc595
> -      - nxp,74lvc594
> -      - onnn,74hc595a
> +    oneOf:
> +      - const: fairchild,74hc595
> +      - const: nxp,74lvc594

Keep enum for these two, preferred pattern.

> +      - items:
> +          - const: onnn,74hc595a
> +          - const: fairchild,74hc595

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


