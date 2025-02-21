Return-Path: <linux-gpio+bounces-16398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 408AFA3FC32
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 17:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00C1B16EA4C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 16:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF97F204F80;
	Fri, 21 Feb 2025 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LjA3vTep"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937AA1F541E;
	Fri, 21 Feb 2025 16:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156603; cv=none; b=DGfEskqR1iS2wb2Tdh8BAxIBVQHIp0foIYsGyQR1ThHIM7MUH0RHQK9NWRhyHRY8Ooa8M9qnmUbEP22c3hUlf9SRNz3E8k5/UzcWPfbwz6RnW0iPfk1oXKmhEr9ybrRdxtqbx64GHswQ7iKUgUF/G1juwm2BF53p53jO0qbAySk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156603; c=relaxed/simple;
	bh=HKZcN/N3DkLXI9MD8YSc47ay4XjK1Ufz25FqRlPNRR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJQaQ7L4rCVlLsJx7+KJQc7E/oR8QlCKG1iCRjp1+WQ6pPw02S/oPWd3el4dmaYer2JbJ2XlRZZeYlJiwgG+cks+BIujOA1qO9i4pHDXhmTtbQVdrfXzrU9HRVbTLC6eYNdBYXAcd7D6OolNtWRqQ3gw9VNbsMufPwCiPoed+VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LjA3vTep; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 118D47E0;
	Fri, 21 Feb 2025 17:48:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740156509;
	bh=HKZcN/N3DkLXI9MD8YSc47ay4XjK1Ufz25FqRlPNRR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LjA3vTephYLSQCNAvtloKyj1bbMpwxl+8ohGv3Z9J60JyPPTAXJSdxT3vyCt3zKfl
	 i+3T/PnBmY9nGLkVp7L2HWB3c2tmf2OfYdVd14YctWkN/SJKTIE+HYCfBnZgqz9ycw
	 O9neFqiYuF448HVouYBA1StFySYbDpTYJscDusE4=
Date: Fri, 21 Feb 2025 18:49:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: nxp,pcf8575: add reset GPIO
Message-ID: <20250221164935.GA15988@pendragon.ideasonboard.com>
References: <20250221-pca976x-reset-driver-v2-0-a2bcb9fdc256@cherry.de>
 <20250221-pca976x-reset-driver-v2-1-a2bcb9fdc256@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221-pca976x-reset-driver-v2-1-a2bcb9fdc256@cherry.de>

On Fri, Feb 21, 2025 at 11:14:26AM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> A few of the I2C GPIO expander chips supported by this binding have a
> RESETN pin to be able to reset the chip. The chip is held in reset while
> the pin is low, therefore the polarity of reset-gpios is expected to
> reflect that, i.e. a GPIO_ACTIVE_HIGH means the GPIO will be driven high
> for reset and then driven low, GPIO_ACTIVE_LOW means the GPIO will be
> driven low for reset and then driven high. If a GPIO is directly routed
> to RESETN pin on the IC without any inverter, GPIO_ACTIVE_LOW is thus
> expected.
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
> Tested-by: Heiko Stuebner <heiko@sntech.de> # exclusion logic
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  .../devicetree/bindings/gpio/nxp,pcf8575.yaml      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> index 3718103e966a13e1d77f73335ff73c18a3199469..633ac5cfa04a10bcbb748b6580938cddae9e5596 100644
> --- a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> +++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> @@ -73,6 +73,44 @@ properties:
>  
>    wakeup-source: true
>  
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +    description:
> +      GPIO controlling the (reset active LOW) RESET# pin.
> +
> +      The active polarity of the GPIO must translate to the low state
> +      of the RESET# pin on the IC, i.e. if a GPIO is directly routed
> +      to the RESET# pin without any inverter, GPIO_ACTIVE_LOW is
> +      expected.

I'd reflow this text to 80 columns, like the next paragraph.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +      Performing a reset makes all lines initialized to their input (pulled-up)
> +      state.
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:
> +            contains:
> +              enum:
> +                - nxp,pca9670
> +                - nxp,pca9671
> +                - nxp,pca9672
> +                - nxp,pca9673
> +    then:
> +      properties:
> +        reset-gpios: false
> +
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
>  patternProperties:
>    "^(.+-hog(-[0-9]+)?)$":
>      type: object

-- 
Regards,

Laurent Pinchart

