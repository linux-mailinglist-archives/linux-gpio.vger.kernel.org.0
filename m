Return-Path: <linux-gpio+bounces-29219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC7C9E1F1
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 09:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0ABDE348E27
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 08:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C72629C35A;
	Wed,  3 Dec 2025 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4quYip7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46971221555;
	Wed,  3 Dec 2025 08:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764749033; cv=none; b=ER6RYqFa28+u7EWSSNF3dk0oIqC+UldTC0GTYsxNK3WuX6ZgUL08G+ICTMK7iecRABmUxU7bMJ6getXryJ1PQklvF3oeMeipVhe/AP8K50Irm0B+GR/OLO3pgN7gsyDTyjfbT6ms8AhLvNsjgupU8ZlsNwKthBJxJeqHTyvqaYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764749033; c=relaxed/simple;
	bh=S/bIgXbztD6yIqM/o6ZEvMgPPfTEua622q9ir/yW0yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5KWxsD6dl3jkkSm1venu0UY5/PxWodGLY/ykXBzVNYvv7Bsaw2iTu8O6Bg8YkA/NwyjzaOrlHWVe87q+TGfQ9SWlUBroXvphmxwPybkf6M/Zo/qaZd90M7Nhdqxgg4UjYHzNyBQCO5EHp0F59/rXYOIqf1mmdqYSZt8iI66gYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4quYip7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F70AC19422;
	Wed,  3 Dec 2025 08:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764749031;
	bh=S/bIgXbztD6yIqM/o6ZEvMgPPfTEua622q9ir/yW0yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4quYip7av0fIaZtuWpIYDEOtdJN+jeXK2LpAvOU5X2FzU9uSbd+zZYCebDMCdTwe
	 tYZMaW67jOsvR0WUoqWSypvMsbAwP3HBvsXlx0xi/VPLIRzd0VdVID4nUwLHEzJmPM
	 6sTyaRpdsVeYEEVKAFfhT4851oxYFPThGeDghV9fUFGjhuVUOD3xYV8CM07fUSTp3R
	 qcJgG13JTOVqj57SWeYWnEnxfW1AqHaMBAj5N5e6s3s2ISPE9nh5vtTFP1BL5jcUGg
	 b7V9o4jlJxCUUnFu9ELcGeL6t5Sc05fPEZCyXPZuGmUKY6MvKup+vCM3ZcClhw9k9O
	 laPaoOXaOCW+g==
Date: Wed, 3 Dec 2025 09:03:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: pinctrl: renesas,r9a09g077-pinctrl:
 Document GPIO IRQ
Message-ID: <20251203-furry-amigurumi-ocelot-dda208@quoll>
References: <20251121112626.1395565-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251121112626.1395565-4-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121112626.1395565-4-cosmin-gabriel.tanislav.xa@renesas.com>

On Fri, Nov 21, 2025 at 01:26:21PM +0200, Cosmin Tanislav wrote:
> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
> 
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
> 
> Document the required properties to handle GPIO IRQ.
> 
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>  .../pinctrl/renesas,r9a09g077-pinctrl.yaml        | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
> index 36d665971484..1e171b443da1 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
> @@ -49,6 +49,17 @@ properties:
>    gpio-ranges:
>      maxItems: 1
>  
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +    description:
> +      The first cell contains the global GPIO port index, constructed using the
> +      RZT2H_GPIO() helper macro from <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
> +      and the second cell is used to specify the flag.
> +      E.g. "interrupts = <RZT2H_GPIO(8, 6) IRQ_TYPE_EDGE_FALLING>;" if P08_6 is
> +      being used as an interrupt.
> +
>    clocks:
>      maxItems: 1
>  
> @@ -119,6 +130,8 @@ required:
>    - gpio-controller
>    - '#gpio-cells'
>    - gpio-ranges
> +  - interrupt-controller
> +  - '#interrupt-cells'

This is technically an ABI break thus commit msg must explain WHY
breaking ABI is necessary and what is the impact on users.

If your driver keeps things backwards compatible, then briefly mention
it in the commit msg that you require it only for complete hardware
picture. Or for whatever other reason.

Best regards,
Krzysztof


