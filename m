Return-Path: <linux-gpio+bounces-13850-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C179F0788
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 10:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB509286557
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 09:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190E11AF0B7;
	Fri, 13 Dec 2024 09:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpgPUges"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286C1AB6CB;
	Fri, 13 Dec 2024 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734081497; cv=none; b=hLXMEurs5k1xXOWn7uaRedLF2XsudSgg910r0GD/EjlO5cTZYky9YA2i/PwEL2QAPpibscPENFZgKfYzN0zIRSzeVHAwYTTJBOfYxPE8LyF9b1KDugvtDAJNf6qhmQX1mKttbN5HXnPGALuVHM1TXZiDrVArK43me7/jl9IU3nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734081497; c=relaxed/simple;
	bh=50F8lzvkwofE8E594WChlhW/wIJ0vV/r+Oafv5taTGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEJcykbonvf/6IhMepET3ZMyGucayHeMdnxDQI4CazlRBJrfDL2HKeP7NOWU9HYvCX+WrH21tiqk2rNLCmiBWyWDALPjMsRLMKljBUgN82w09qlD+0Cb0uAPL+RAL7svr16UTxRVnfEY4GVlOqXMMrkNn1vgpA1NDCFBuvV9Lfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpgPUges; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593E3C4CED1;
	Fri, 13 Dec 2024 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734081497;
	bh=50F8lzvkwofE8E594WChlhW/wIJ0vV/r+Oafv5taTGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpgPUgesM7i0LrrUQpMsCjr/1XK14ByrihO4BH0gOP/7vCC4Y25Ny+iMjKCzj6Bdx
	 AlU3JwBmCuXEiGMP2iL4TypqHTZYpVQYG+ND22uRoP4tdpnHk0Z+qj9TKn23Z2kA9G
	 RnoAV1OVu64R7XB5+BN9EiakahM2nZ4APApFStkV7wcEcJIC5a/UQyqGO/JTbZnZp0
	 4ycDvoSjfPEFS0ylU1LsxZx/gM4sDLIk/Nc7nNn9O8Vg6KrM4DAk1heHV94112Jkhf
	 UHeNUUZj7gtb6D44PRpQ2wpZPiG46Ku2fTwPfjfVxwFDh+BowJ6QqY+NiNNGVD5e1Z
	 Q5Tst+dLrlORQ==
Date: Fri, 13 Dec 2024 10:18:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Message-ID: <cjf4n2tg5qcqpik3j6ufesl4lf2fftyccrqmurb2xvib6iyt2d@fbhkwoiwfjuy>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-1-44a7f3390331@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-1-44a7f3390331@raspberrypi.com>

On Thu, Dec 12, 2024 at 06:36:28PM +0000, Dave Stevenson wrote:
> Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> added the compatible strings for BCM2712, but missed out that the
> number of interrupts changed.
> 
> Update the schema to include the interrupt requirements.
> 
> Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        | 107 ++++++++++++++++++---
>  1 file changed, 93 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 6d11f5955b51..dd7dea60183b 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -56,22 +56,38 @@ properties:
>        - const: cec
>  
>    interrupts:

> -    items:
> -      - description: CEC TX interrupt
> -      - description: CEC RX interrupt
> -      - description: CEC stuck at low interrupt
> -      - description: Wake-up interrupt
> -      - description: Hotplug connected interrupt
> -      - description: Hotplug removed interrupt
> +    oneOf:
> +      - items:
> +          - description: CEC TX interrupt
> +          - description: CEC RX interrupt
> +          - description: CEC stuck at low interrupt
> +          - description: Wake-up interrupt
> +          - description: Hotplug connected interrupt
> +          - description: Hotplug removed interrupt
> +
> +      - items:
> +          - description: CEC TX interrupt
> +          - description: CEC RX interrupt
> +          - description: CEC stuck at low interrupt
> +          - description: Hotplug connected interrupt
> +          - description: Hotplug removed interrupt

You have chosen unusual syntax. There are no bindings doing this way, so
I really do not get which file you used as template.

Expected here are minItems and maxItems. These are the widest
constraints. Otherwise you are repeating the same in allOf:if:then. And
then the allOf:if:then: defines the items.

You can do the opposite - define the items here then just choose
constraints in if:then:. Less popular if you have list without common
part (so no minItems here), but sure, if you insist... yet you chosen
some third way of duplicating it in both places.

Look:
https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L127
https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml#L39
https://elixir.bootlin.com/linux/v5.19/source/Documentation/devicetree/bindings/example-schema.yaml#L91

There is nowhere syntax like here, with duplicating everything twice.

BTW, drop the full stop from your subjects in some other patches.
Subject never ends with full stop.


Best regards,
Krzysztof


