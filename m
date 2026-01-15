Return-Path: <linux-gpio+bounces-30605-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5237D24BF9
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 14:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B2F8310EA37
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 13:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9E23A0B3F;
	Thu, 15 Jan 2026 13:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QR33SHzm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3700393DE6;
	Thu, 15 Jan 2026 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483743; cv=none; b=uMM7KQqf0BebtHdIEeNCwDGXIEDmXN2G42K5Cmwe9e2HVv/qZsCc8CDENOwugPV57kDgx0qgwGo+3o175deHXhFgiA05FMyRlB6Eszb0rqkrixQlgRshY8oF6Uy+Fp5Dkj3/bzvvwviDWXgCKs+4S4SMP7KJCfU9JEGdJZRjrVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483743; c=relaxed/simple;
	bh=QOXBWbkjoSpnu+ZLRfl6NoXgt9CjWwZy/+mvtRCDjew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxLgN/ENI3iTYdxIDAOm7zO6uO35VkzIlbdiGMGZQTppGo5ygTPhyG6P0CzqqIH0SOXzwjtyv4pACMRx5Aur8lOpTLvvcb6tZiaKBhAY+AaG4iWpoQWGzBq1iGeVauP8uNzP1XrGUUfUUnOjvg/a92s5OlmVOrF/DXzRmoUTMYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QR33SHzm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F198C16AAE;
	Thu, 15 Jan 2026 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483743;
	bh=QOXBWbkjoSpnu+ZLRfl6NoXgt9CjWwZy/+mvtRCDjew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QR33SHzmY7npV6+EgHAYfyIJT6QBRTf91Ci+1x7lH9yDmwUXqOgO3uBAAEpK+veve
	 mQ+/6JDXXIN76X0/2QE4v/pGyfPo++ZdtobeiL+ruet53GjFGS0EHgCiNpieXnExpI
	 B+OOUYNLuwdmi+kwlq6qP9s4hRR1qo1ehJKs3iN8wXAHnTnOj7tdu0v/LgUFalA6we
	 3ZI2fwh4XpIaMRdFZl0M8b1+GWJ3CNi3E3aI9CadjjvNzDV/aAb7e13mhTOEYfRJB7
	 uqTgJzMhrtzZgW8GxzvQB3fzNn2kKWak0oVjRtCPUF4zZXylvfftzjzzaqNnABUfsm
	 rkxTsoQpc9uow==
Date: Thu, 15 Jan 2026 14:29:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, brgl@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, robh@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: gpio: Add Tegra264 support
Message-ID: <20260115-tactful-porcupine-of-felicity-ead58d@quoll>
References: <20260114103846.687338-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260114103846.687338-1-pshete@nvidia.com>

On Wed, Jan 14, 2026 at 10:38:44AM +0000, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller device tree bindings with
> support for the GPIO controller found on Tegra264. The number of pins
> is slightly different, but the programming model remains the same.
> 
> Add a new header, include/dt-bindings/gpio/tegra264-gpio.h,
> that defines port IDs as well as the TEGRA264_MAIN_GPIO() helper,
> both of which are used in conjunction to create a unique specifier
> for each pin.
> 
> Document nvidia,pmc property referencing the PMC node providing the
> parent interrupt domain. GPIO driver uses this to select the correct

Why do you need to reference parent interrupt not via interrupts but
custom phandle?

> PMC,falling back to compatible-based lookup only if the phandle is
> absent.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  .../bindings/gpio/nvidia,tegra186-gpio.yaml   | 10 +++
>  include/dt-bindings/gpio/tegra264-gpio.h      | 61 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/tegra264-gpio.h
> 
> diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
> index 2bd620a1099b..93150504c03c 100644
> --- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
> @@ -86,6 +86,9 @@ properties:
>        - nvidia,tegra234-gpio
>        - nvidia,tegra234-gpio-aon
>        - nvidia,tegra256-gpio
> +      - nvidia,tegra264-gpio
> +      - nvidia,tegra264-gpio-uphy
> +      - nvidia,tegra264-gpio-aon
>  
>    reg-names:
>      items:
> @@ -110,6 +113,10 @@ properties:
>        ports, in the order the HW manual describes them. The number of entries
>        required varies depending on compatible value.
>  
> +  nvidia,pmc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the PMC node providing the parent interrupt domain.

You should require it for the new devices/compatibles.

> +
>    gpio-controller: true
>  
>    gpio-ranges:
> @@ -157,6 +164,8 @@ allOf:
>                - nvidia,tegra194-gpio
>                - nvidia,tegra234-gpio
>                - nvidia,tegra256-gpio
> +              - nvidia,tegra264-gpio
> +              - nvidia,tegra264-gpio-uphy
>      then:
>        properties:
>          interrupts:
> @@ -171,6 +180,7 @@ allOf:
>                - nvidia,tegra186-gpio-aon
>                - nvidia,tegra194-gpio-aon
>                - nvidia,tegra234-gpio-aon
> +              - nvidia,tegra264-gpio-aon
>      then:
>        properties:
>          interrupts:
> diff --git a/include/dt-bindings/gpio/tegra264-gpio.h b/include/dt-bindings/gpio/tegra264-gpio.h
> new file mode 100644
> index 000000000000..d7baceace474
> --- /dev/null
> +++ b/include/dt-bindings/gpio/tegra264-gpio.h

Use filenames matching compatible or bindings file.
nvidia,tegra264-gpio.h


Best regards,
Krzysztof


