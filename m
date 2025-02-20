Return-Path: <linux-gpio+bounces-16340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 599C8A3E702
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 22:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45E533AF860
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 21:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4F51F03FB;
	Thu, 20 Feb 2025 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="jlzZSQ5e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA4E1EE03C;
	Thu, 20 Feb 2025 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740088302; cv=none; b=kvZVbhXFEjYQafUTnyIqvuH08iBqVR5buCsyjiO8LnU9Z8ZTYgJQQBSZDyK6jgyfh3wa9yYIoF30kOmzPHlxV6FFUdaLF0xGaSZpiZULy4Uraut03QHTfZsi/6dguGv0PGD2o/OpNVHNEZHL6P9InFmwVUgzCRxiJ4uzVVZktoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740088302; c=relaxed/simple;
	bh=/WInj6KSFD9Eu7DaW+kzT33lE//eMMKTc6RI4U4iMZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mjOwGbE1nPSo7A9PohHQheF/B7Kuf20Ss9B+uL3MX03m7+cZ/tfwIhUnMvAK4V9vpAX+aujQFalau+D5MViPCR2Q3/ZHZsc8y7HininjB/CuWx60VCqjsK1S557SsFYtKEC5lPLnnmrb6nFrJwCTz+bTA/h2aggF9BJsUNgzbwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=jlzZSQ5e; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6av8FgpFHpUL/5MXXeDrhtI4EyYOqK8IX0qcjEcFmuw=; b=jlzZSQ5eGVUY42qT2r0KjjlV+v
	oviic2kKa4jyvgrJL4zbCKf0tWeZJX7Fe8miBNgNQfPzcEL/awPCdBB4d7B05bL5RGhtuurLxfNWC
	KkFyKTvblpFgCbrgc+q6i8Hey5oY4Tq4vBzTZ6Rq+G1T/4NxaSfDKKdh9KFeZ2zeFn/MCMHrmWyKe
	nUG/Oageoi4jm+HNcvFxIgh8VaXrEmDiwfPboXmPS5iqpM8U0tNF6S8gFgBUqxHVZY8h8pLscgPrd
	VWZOFjbeO4YK4IaLwaPlq773YVzsXXYEGX0LkRnpO4Zkl2eYRxKOmgs0J2ho8eblRoaGrBOqTPu3Q
	k1It5jbQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tlES7-0003Gb-UW; Thu, 20 Feb 2025 22:51:27 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Quentin Schulz <foss+kernel@0leil.net>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: nxp,pcf8575: add reset GPIO
Date: Thu, 20 Feb 2025 22:51:26 +0100
Message-ID: <1797373.X513TT2pbd@diego>
In-Reply-To: <20250220-pca976x-reset-driver-v1-1-6abbf043050e@cherry.de>
References:
 <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de>
 <20250220-pca976x-reset-driver-v1-1-6abbf043050e@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 20. Februar 2025, 10:56:51 MEZ schrieb Quentin Schulz:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> A few of the I2C GPIO expander chips supported by this binding have a
> RESETN pin to be able to reset the chip. The chip is held in reset while
> the pin is low, therefore the polarity of reset-gpios is expected to
> reflect that, i.e. a GPIO_ACTIVE_HIGH means the GPIO will be held low
> for reset and released high, GPIO_ACTIVE_LOW means the GPIO will be held
> high for reset and released low.
> 
> Out of the supported chips, only PCA9670, PCA9671, PCA9672 and PCA9673
> show a RESETN pin in their datasheets. They all share the same reset
> timings, that is 4+us reset pulse[0] and 100+us reset time[0].
> 
> When performing a reset, "The PCA9670 registers and I2C-bus state
> machine will be held in their default state until the RESET input is
> once again HIGH."[1] meaning we now know the state of each line
> controlled by the GPIO expander. Therefore, setting lines-initial-states
> and reset-gpios both does not make sense and their presence is XOR'ed.
> 
> [0] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf Fig 22.
> [1] https://www.nxp.com/docs/en/data-sheet/PCA9670.pdf 8.5
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  .../devicetree/bindings/gpio/nxp,pcf8575.yaml      | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> index 3718103e966a13e1d77f73335ff73c18a3199469..d08d3f848f82e74de949da16d26a810dc52a74e5 100644
> --- a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> +++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
[...]
> +  # lines-initial-states XOR reset-gpios
> +  # Performing a reset reinitializes all lines to a known state which
> +  # may not match passed lines-initial-states
> +  - if:
> +      required:
> +        - lines-initial-states
> +    then:
> +      properties:
> +        reset-gpios: false
> +

exclusion logic
Tested-by: Heiko Stuebner <heiko@sntech.de>

dtbscheck is happy when either reset-gpios or lines-initial-states is
present, but when both are present complains like

    rk3588-tiger-haikou-video-demo.dtb: gpio@27: reset-gpios: False schema does not allow [[205, 17, 1]]

as expected.



