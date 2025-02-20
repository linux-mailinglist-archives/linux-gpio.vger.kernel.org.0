Return-Path: <linux-gpio+bounces-16290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D774DA3DA09
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12DFD3AABB3
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 12:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D641FC7E8;
	Thu, 20 Feb 2025 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ec7ISYIy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BF01FBE8F;
	Thu, 20 Feb 2025 12:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054284; cv=none; b=jE/3qUlU1GLXQDA3WC5giQfj3492UaUEb/TRbpxyxqb+idI1StsRyTOYYy/foRvl3LsoRUVEbp2CaQx41q5HenhxF0nL4fG3B5Q/TX0OKY5lyVKc2IDEtvGRPN8fpQSCQQbn/mlruqHPs8I3Hz7rF9PFinZhs18ZN5coFdlzR5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054284; c=relaxed/simple;
	bh=Tu6kHcip9wT6NuYvevfbwekjEW8uMu2I+njT1S0ZChs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABmvMF5T6bAqoGxXNb1ZQkmn59xZxPNEZ5cp0zXogk5WdQ7Ask2fe2ZeWuIHQwC8dqzVxcp+3wExESKR4br4TcXxY3w9G+MTrIUkFyOX8T/GqPN6rwlLyBEEz1IjzTtQXL31KIJnZdCXiCDajHVuIc46duETNYGLQPQLTo37mkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ec7ISYIy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A39E5526;
	Thu, 20 Feb 2025 13:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740054196;
	bh=Tu6kHcip9wT6NuYvevfbwekjEW8uMu2I+njT1S0ZChs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ec7ISYIyxKj7p1aDBfI0cs3o71ZuFypwEgzlAlAm3Yq34BA92sPP0qFKffE4LIOY/
	 Tvo/hWawHXXn/WmsFBnlkaacx8+W3GXgc97kLzUhoM5XnAfq3gvbOZktYt/AVVACQF
	 A20vMZ82NFDzQUwN+W2xeykEgmq2dyXQn0UV8eFY=
Date: Thu, 20 Feb 2025 14:24:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: nxp,pcf8575: add reset GPIO
Message-ID: <20250220122424.GB20111@pendragon.ideasonboard.com>
References: <20250220-pca976x-reset-driver-v1-0-6abbf043050e@cherry.de>
 <20250220-pca976x-reset-driver-v1-1-6abbf043050e@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220-pca976x-reset-driver-v1-1-6abbf043050e@cherry.de>

Hi Quentin,

Thank you for the patch.

On Thu, Feb 20, 2025 at 10:56:51AM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> A few of the I2C GPIO expander chips supported by this binding have a
> RESETN pin to be able to reset the chip. The chip is held in reset while
> the pin is low, therefore the polarity of reset-gpios is expected to
> reflect that, i.e. a GPIO_ACTIVE_HIGH means the GPIO will be held low
> for reset and released high, GPIO_ACTIVE_LOW means the GPIO will be held
> high for reset and released low.

I think the convention in DT is the opposite. The DT property is
"reset-gpios", no "resetn-gpio", so the polarity should indicate how to
drive the GPIO to assert a logical "reset". GPIO_ACTIVE_LOW should mean
that the chip will be in reset when the physical GPIO is 0.

Could DT maintainers confirm this ?

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
> @@ -73,6 +73,39 @@ properties:
>  
>    wakeup-source: true
>  
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO controlling the (reset active LOW) RESET# pin.
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
> 

-- 
Regards,

Laurent Pinchart

