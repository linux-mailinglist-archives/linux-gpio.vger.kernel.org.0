Return-Path: <linux-gpio+bounces-29957-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 320E8CE4AE9
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 11:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5D713026860
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Dec 2025 10:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB622C21F4;
	Sun, 28 Dec 2025 10:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9iUW4t5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D4F2C15A2;
	Sun, 28 Dec 2025 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766918263; cv=none; b=memUhlYkVo0fQ6wwlBdL8G/w3O8U5lUb8PuAeOfwLmE9TwA4jJJQAc5BKKIF9Yr4eBJ7/lsUywbOtEZu+ABynja2l+t3yznaTAj25KFbsAl4eeVPpFwb/h6TWIgtYw61/fnUZTbJkfeEx8koLLQKNqz3iGCjgv1DwFAFJpj84yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766918263; c=relaxed/simple;
	bh=IZT39N4Nv/NcZl793zfqFVhRqayBAaHRRDrNfXkU8Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bc7+EwGvEUxNdBvOVa5jGJqcVNnaEmMZBbMeAmezjYu2GzoXvdyWYolVYKI0K1s2Fpa+4iGfcBgud6CQLMyOduRK/pW+ZYLbG5Z7vEnQqRwOUXAVv/7Y0G++1r4aqlIacNRdUZ/PvydgLfu4LaQp7G/yhxUHdxWIa/OQqelFOp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9iUW4t5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB159C4CEFB;
	Sun, 28 Dec 2025 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766918262;
	bh=IZT39N4Nv/NcZl793zfqFVhRqayBAaHRRDrNfXkU8Xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9iUW4t5Y9TMeGA02WBnFIlx3vNDP1da+gnKOnaQ9hdQzqrmmA0pAfpWC+ImDfPPq
	 Yg4Jtc5XjOVSTntp0+oZXBitOsOyLNsGxInImg3wvqrH8r7g08B6GQ37kP1B1hdDwo
	 E7/U+j6CKsUQnWTwBCkdkH3FgUaaYuPa5SCg3S67gACEVlE8DB8k/2dUr5D0Xrgiqq
	 iks++SF2JFOkyle9urQXg93ir1yshfblZrMtTbOMkIddqiohxvKbBLDdIZL3km+5r/
	 Y4CPj1I3xJzm5rYQY/NtJ4CB5ZVbp2tx9009nwlFqXdaIrWIt1FQRsbJGpD5VqvoF3
	 sX0qm4Lrap/1A==
Date: Sun, 28 Dec 2025 11:37:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tao.huang@rock-chips.com
Subject: Re: [PATCH v4 5/7] dt-bindings: pinctrl: rockchip: Add rk3506 rmio
 support
Message-ID: <20251228-olive-termite-of-painting-1bee5b@quoll>
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-6-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251227114957.3287944-6-ye.zhang@rock-chips.com>

On Sat, Dec 27, 2025 at 07:49:55PM +0800, Ye Zhang wrote:
> The RK3506 SoC introduces a secondary block-level pinmux controller called
> RMIO (Rockchip Matrix I/O). When the primary IOMUX is selected to a
> specific function, the pin signal is routed to the RMIO block, where a
> secondary selection determines the final function.
> 
> This patch adds the necessary properties to support RMIO:
> - rockchip,rmio: phandle to the RMIO syscon node.
> - rockchip,rmio-pins: a matrix to configure the RMIO block.
> 
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  .../bindings/pinctrl/rockchip,pinctrl.yaml    | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 97960245676d..887bec22b172 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -66,6 +66,13 @@ properties:
>        Required for at least rk3188 and rk3288. On the rk3368 this should
>        point to the PMUGRF syscon.
>  
> +  rockchip,rmio:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle of the syscon node for the RMIO registers, used by
> +      some SoCs (e.g. rk3506) to configure the secondary block-level
> +      pinmux functions.
> +

You need to disallow it for other variants in if:then: block.

>    "#address-cells":
>      enum: [1, 2]
>  
> @@ -144,6 +151,23 @@ additionalProperties:
>                  The phandle of a node contains the generic pinconfig options
>                  to use as described in pinctrl-bindings.txt.
>  
> +      rockchip,rmio-pins:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        minItems: 1
> +        items:
> +          items:
> +            - minimum: 0

That's redundant. 0 is already minimum.

> +              description: RMIO ID (Controller index)

Why do you need this? Is this pin controller having multiple RMIO IDs?
Nothing like that was expressed in previous DTS. No other IDs are
present in this DTS, either...

> +            - minimum: 0
> +              description: Pin index within the RMIO controller
> +            - minimum: 0
> +              description: Function Mux ID
> +        description:
> +          Configuration for the Rockchip Matrix I/O (RMIO) block. The format
> +          is <rmio_id pin_id function_id>. This acts as a secondary muxing
> +          layer when the primary 'rockchip,pins' mux is set to the RMIO
> +          function.
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
> -- 
> 2.34.1
> 

