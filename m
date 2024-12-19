Return-Path: <linux-gpio+bounces-14007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D479F7790
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 09:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 326001676E9
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 08:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BEF21C173;
	Thu, 19 Dec 2024 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFfIWyK6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9F1FC7DB;
	Thu, 19 Dec 2024 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597526; cv=none; b=Iw+KqU3sFYZRm9qJ9bohq55HMnYpCTYRTl8KRNMx4NbNFuXq0/2ZzT7y1YH2kOuZNISEBPUeiVhRkYC8e9SoTCnrigNA7qPkymcDxgeSCsHvm+s9neBVIQgF0TPfzIE1uQG6oShI8P/ulErFRgTr9jcoCGtSQEv4E3URA9TX7So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597526; c=relaxed/simple;
	bh=z973hMVDazsCaCVq8CENGRtlOUvc9ByRfPeM4Ms7dU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cVmz5rJ5PfAoNk5fO6sVJXBvjazCn6V4X7GD7hDEYrODaaWhfrZ1iwfxvsEPD9lhzca1+AZPmPqA6V03ELaggUCWcILN2Yvk3DOrYKMD2TWKIY6yXltcexNkGyuV1RdsR/5r8/9AD4YlginOBz4C5pvjbQmPt0n4cYamBaooZ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFfIWyK6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA01C4CECE;
	Thu, 19 Dec 2024 08:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734597526;
	bh=z973hMVDazsCaCVq8CENGRtlOUvc9ByRfPeM4Ms7dU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFfIWyK61aTMR54PQitKrC2N0LdJnnRc9g/5O97Q2QYgZuPDulZXoqcwcO0IlnNLh
	 TYDzDy2UD3Y68bObfHSnA3lC9/76U8eKKTgALWeU/Kbws9yxPKEy69eRz+JTbGclw+
	 FbTY+dDeSyqllmVgCWuS+GD/U/8j37bRPvROwG4ay/3R2uDoRpb2n+d5BAEpuP/TJj
	 Ie3pwJbpc0O7+DQsW2bmEpiu1cXDIMOq/ayX6Bhjqvz5NPFVO525izpn0AV+7EvELL
	 UcnH5t3nuA/LTsr207BNNHzb7NwK90S58hjjFHRUbETCt3qr2YoWdpGN1j3ghmJ92B
	 K6ztB/94y6/Og==
Date: Thu, 19 Dec 2024 09:38:42 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Message-ID: <7sgvdwyu2o7kli4eslg6o4mmzystoszrd6srw5pp6ikrmgq5ox@bvjz7j4d7v3l>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-1-54cc88b6c229@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-1-54cc88b6c229@raspberrypi.com>

On Wed, Dec 18, 2024 at 02:48:32PM +0000, Dave Stevenson wrote:
> Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> added the compatible strings for BCM2712, but missed out that the
> number of interrupts changed.
> 
> Update the schema to include the interrupt requirements.
> 
> Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        | 81 ++++++++++++++++++----
>  1 file changed, 67 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 6d11f5955b51..83c058728ef1 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -56,22 +56,12 @@ properties:
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
> +    minItems: 5
> +    maxItems: 6
>  
>    interrupt-names:
> -    items:
> -      - const: cec-tx
> -      - const: cec-rx
> -      - const: cec-low
> -      - const: wakeup
> -      - const: hpd-connected
> -      - const: hpd-removed
> +    minItems: 5
> +    maxItems: 6
>  
>    ddc:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -112,6 +102,66 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - brcm,bcm2711-hdmi0
> +              - brcm,bcm2711-hdmi1
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: CEC TX interrupt
> +            - description: CEC RX interrupt
> +            - description: CEC stuck at low interrupt
> +            - description: Wake-up interrupt
> +            - description: Hotplug connected interrupt
> +            - description: Hotplug removed interrupt
> +        interrupt-names:
> +          items:
> +            - const: cec-tx
> +            - const: cec-rx
> +            - const: cec-low
> +            - const: wakeup
> +            - const: hpd-connected
> +            - const: hpd-removed
> +
> +

Only one blank line

> +      required:
> +        - interrupts
> +        - interrupt-names

But anyway this is unusual. Why this was added? Nothing in commit msg
explains this.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - brcm,bcm2712-hdmi0
> +              - brcm,bcm2712-hdmi1
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: CEC TX interrupt
> +            - description: CEC RX interrupt
> +            - description: CEC stuck at low interrupt
> +            - description: Hotplug connected interrupt
> +            - description: Hotplug removed interrupt
> +        interrupts-names:
> +          items:
> +            - const: cec-tx
> +            - const: cec-rx
> +            - const: cec-low
> +            - const: hpd-connected
> +            - const: hpd-removed
> +
> +      required:
> +        - interrupts
> +        - interrupt-names

Same question.

> +
>  examples:
>    - |
>      hdmi0: hdmi@7ef00700 {
> @@ -136,6 +186,9 @@ examples:
>                      "hd";
>          clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
>          clock-names = "hdmi", "bvb", "audio", "cec";
> +        interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
> +        interrupt-names = "cec-tx", "cec-rx", "cec-low", "wakeup",
> +                "hpd-connected", "hpd-removed";

Fix alignment with opening " from earlier line (see DTS coding style).

Best regards,
Krzysztof


