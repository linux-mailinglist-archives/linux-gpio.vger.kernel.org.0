Return-Path: <linux-gpio+bounces-13973-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19D9F4F63
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 16:26:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 566D3188177F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435211F707F;
	Tue, 17 Dec 2024 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="surdXdAQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA3F148850;
	Tue, 17 Dec 2024 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734449125; cv=none; b=LONeAG5whK1ymGZ+U2eaNaozmZdoZa3f/v0g9wg4qGTvjLkXX7AQ9hvtGwyjOoRQslzRJaAhhFFgTARFOV4mgiCQxpPfoyr8j2m/yZmPFd0x8KH7rYFcZJlGq+lJzFxGpQ6Ae9jUCBZoCOuGgTVCDpMQIIeAwRKpGyzxWitnHfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734449125; c=relaxed/simple;
	bh=xF7XHujity5scj+ZoZxl3/FeA8+0vXNW1+WLCBMoSeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmPHq/vMH8ves7/ZDVq8pUYUd/144SzTUY3YEwZRSCgdww3lhjtutNnZq+NCkh2iqhOgjJpgrvxO1TKBoZrM4CBYGTJsUojay1X3dgDh94rh04+xkq2XpN/vPVdQvaXPxycls88zUNdg0987zALXRJSjxjezdqhgDk3BhdntkVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=surdXdAQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301D8C4CED3;
	Tue, 17 Dec 2024 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734449124;
	bh=xF7XHujity5scj+ZoZxl3/FeA8+0vXNW1+WLCBMoSeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=surdXdAQ4pfd/NNBphfDXOstNord1NVdJHbDCHj76GPSLO6B9MgbJBf+8H/V8JpGk
	 n1JtUREOx+PZ72voyNeMz17B3ul/VgAwCyD+cMfPrBeX9PvhRznR6CAOpF1/tAtl7X
	 iIiZDVVp9jAg1Swu+QnFYxy4lOdDu9bBHa/94fLpP5bVWuivZXphmzJzU4VsClFX+X
	 4nZJFig/3b/OdVhvmvE3eKOVhzGQ3YzmpO/HnBp+2yWgkaD7+wx4gQ2oeu4AB138dy
	 eA+ThOzynKJlyegcOWMzOn+L5g21Q/klS05r8csAOjxJoPonep04W7rbqIDcgxCBrd
	 CY6+q5oXxU9ww==
Date: Tue, 17 Dec 2024 09:25:22 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: gpio: fairchild,74hc595: Add
 latch-gpios property
Message-ID: <20241217152522.GA1813602-robh@kernel.org>
References: <20241213-gpio74-v1-0-fa2c089caf41@posteo.net>
 <20241213-gpio74-v1-2-fa2c089caf41@posteo.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241213-gpio74-v1-2-fa2c089caf41@posteo.net>

On Fri, Dec 13, 2024 at 06:32:48PM +0100, J. Neuschäfer wrote:
> The Fairchild MM74HC595 and other compatible parts have a latch clock
> input (also known as storage register clock input), which must be
> clocked once in order to apply any value that was serially shifted in.

That sounds like all the existing parts have the signal and it is 
required to operate? Or just needed to write settings, but not read GPIO 
input state for example?

If the new parts are usable without latch, then they should have a 
fallback compatible. If they aren't usable, then it should be 1 binding 
patch.

> 
> This patch adds a latch-gpios property to the binding to allow
> specifying a GPIO that connects to the latch clock.
> 
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> ---
>  Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> index 629cf9b2ab8e4a63fbe17f56792a46d2066d40c3..38d473a3852154e53faec88dc911dc0a4f9cbd1f 100644
> --- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
> @@ -34,6 +34,10 @@ properties:
>      description: GPIO connected to the OE (Output Enable) pin.
>      maxItems: 1
>  
> +  latch-gpios:
> +    description: GPIO connected to the latch clock or storage register clock pin.
> +    maxItems: 1
> +
>  patternProperties:
>    "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
>      type: object
> 
> -- 
> 2.45.2
> 

