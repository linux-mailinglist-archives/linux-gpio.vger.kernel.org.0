Return-Path: <linux-gpio+bounces-14008-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEE69F77A1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6DCF7A38A0
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E03E2206A5;
	Thu, 19 Dec 2024 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSVwBsXZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4214A21CFF4;
	Thu, 19 Dec 2024 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597721; cv=none; b=syTLwiaemtnsnWz92lzNHdLtHwm0OARXK6itJBXYWY+Tp2xcASYvbEVjV3wIpJuw970WiCjvfa1jLRw3ytMbfJyc/78UqubVmaLgpm50mhgqgfxE07i7G6vqnINN8kKm1JH2MXAD999ArHS31WEGhFYeyNNPtjOXnp47n90sMss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597721; c=relaxed/simple;
	bh=EkcnPB9WBd/TNqG00+8vwrlF/Hfm2d74IUOXRibreB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2TDovpKPIb8XcOra19uwstTZoSE9UIASdAOocAcJoaf9MWZ1l2YO5fYgTTPIWiHixFPVQoZbk9el/PxcPEtwVbz0rLyrT9lpn3/XtCmOG5TFqZtdbrlyH5yG9W72ypAJguPYbkCG5lOdFvLHr83Kla6XpLrymCSB0qxdTprMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSVwBsXZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EA9C4CED0;
	Thu, 19 Dec 2024 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734597720;
	bh=EkcnPB9WBd/TNqG00+8vwrlF/Hfm2d74IUOXRibreB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSVwBsXZOOPUXdDt31Z0SB68MwUpAMHI+qUtla7oQExLQYez0KZvnNrfUsrvp2ESs
	 w+n2m/laXsCukY5YwQO6A4kMcLHru0ZgYbCLUSUvgA7nj6tZXUZlFh1ZetxzoaFAQv
	 HgjS1uh1MT87iOL39Ky6GtLgF4cyJXgyMs5kca5QA6zflbbqeFyVpZQTRoiu4pkQ16
	 k/eTsTQxAL53LWip218huMV7Q3eP0OG1ujQPOSqSwpreuXrMjnLYLiuaQNPo39nFPG
	 uNG5GItgnfImkpkd1GeAQwhj/rewb8bULqqaTlNr7EMt4Rh6NvfzBdCCp3tTTYZBS2
	 Nh7l6IBxEymEA==
Date: Thu, 19 Dec 2024 09:41:57 +0100
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
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Fix BCM2835 HVS bindings
 for BCM2712
Message-ID: <lzvcaspulvsulbulqinzftt3xtdyro64hi674u2bnkpvbrihri@e2o247mjom5s>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>

On Wed, Dec 18, 2024 at 02:48:33PM +0000, Dave Stevenson wrote:
> Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> added the compatible string for BCM2712, but missed out that
> the number of interrupts and clocks changed too, and both need to be
> named.
> 
> Update to validate clock, interrupts, and their names for the variants.
> 
> Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
>  1 file changed, 70 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> index f91c9dce2a44..fd25ee5ce301 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> @@ -20,11 +20,20 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 3
>  
>    clocks:
> -    maxItems: 1
> -    description: Core Clock
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
>  
>  required:
>    - compatible
> @@ -33,17 +42,64 @@ required:
>  
>  additionalProperties: false
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - brcm,bcm2711-hvs
> -          - brcm,bcm2712-hvs
> -
> -then:
> -  required:
> -    - clocks
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm2711-hvs
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Core Clock
> +        interrupts:
> +          maxItems: 1


clock-names and interrupt-names: false, unless driver needs them but all
this should be explained in the commit msg because it would be a change
to the binding.

> +
> +      required:
> +        - clocks
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm2712-hvs
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: disp
> +        interrupts:
> +          items:
> +            - description: Channel 0 End of frame
> +            - description: Channel 1 End of frame
> +            - description: Channel 2 End of frame
> +        interrupt-names:
> +          items:
> +            - const: ch0-eof
> +            - const: ch1-eof
> +            - const: ch2-eof
> +      required:
> +        - clocks
> +        - clock-names
> +        - interrupt-names

My previous comment still stands. Reply to people's feedback instead of
ignoring it.

Best regards,
Krzysztof


