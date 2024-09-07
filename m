Return-Path: <linux-gpio+bounces-9901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B65C097015E
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Sep 2024 11:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5FA6B2206F
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Sep 2024 09:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353901537DF;
	Sat,  7 Sep 2024 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qzPWcQHl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35FC4C66;
	Sat,  7 Sep 2024 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725701369; cv=none; b=eP8OrquYF32Buu368GId32Yn+PE6o2Fk8z8dxYK2D0/gdlzuEh75wQOt5geEZj50ro8EicB9/+sSqm1GQMVTaBR76f8XGl/zIUVCUNOPmqADVMq98Fxg1Dg/sxPAvs4Uaa196M4yvUZT/XFpH0eEa3lNOLynmS7AGVnojqjQ7cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725701369; c=relaxed/simple;
	bh=jx9FnA7O+sp8UY4HR5kMSrOmawXxQrdpLYtYsXOJawY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZv5eQTRHSgbAAbEM68Mt00A+b/c+5FqqEia+rpNgbyPukbZRF9vZt/BkLM3an/360PhHL9vjf9ozITF3vR9+8Uux423o8n4xJXgI6j8Vq2X9HMizSJR7JZXSLM20QgRsT3VHqJoGIXjcydlBMkqpakiekkm14RXozJlk7PkOWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qzPWcQHl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4B9C4CEC2;
	Sat,  7 Sep 2024 09:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725701368;
	bh=jx9FnA7O+sp8UY4HR5kMSrOmawXxQrdpLYtYsXOJawY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qzPWcQHljjokDAaQpmmC98hgSB0yr6o3Y+0vUXnn5GH862vGfv+oPVWQ0NcB6Ny5Y
	 BWL87Xx9f8VN67C2maRZKJ6uL7XRNpnb4+lGMOy4Hp+VkRJkNUsRALfqjm02GkAF9/
	 DkadQPhZwO45hgOsJoyeCRSori86wrA3RPSpa6ofKwTHKoJGK04NPtrUIkfehAn7Ta
	 7Ahfk5U2FEPtHAVQfullmZ0PrSpLxV+qpx4WfYLfX6X8+08lzB0i5GwSkg//Vp3g+X
	 QUqGVyXzIQBiI63AgoEulerWX/80oAgIFYnfRV375xzeR4NkDltKNqHJfCY8k5xdIS
	 OxfeAKbJ2VMQw==
Date: Sat, 7 Sep 2024 11:29:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com, quic_psodagud@quicinc.com
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Add SA8255p TLMM
Message-ID: <q4d53nru2xy4drvyw27rsprsqgbneuj5zg35hmgyvvwoqmqbmg@pf5ojcmlmjwk>
References: <20240905200218.3810712-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240905200218.3810712-1-quic_nkela@quicinc.com>

On Thu, Sep 05, 2024 at 01:02:18PM -0700, Nikunj Kela wrote:
> Add compatible for TLMM block representing support on SA8255p.
> 
> SA8255p uses the same TLMM block as SA8775p however the ownership
> of pins are split between Firmware VM and Linux VM on SA8255p. For
> example, pins used by UART are owned and configured by Firmware VM
> while pins used by ethernet are owned and configured by Linux VM.
> Therefore, adding a sa8255p specific compatible to mark the difference.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
> 
> Changes in v3:
> 	- Removed the patch from original series[1]
> 	- Fixed mising spaces schema errors
> 
> Changes in v2:
> 	- Modified subject line
> 	- Fixed schema to include fallback
> 
> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> ---
>  .../devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml    | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
> index e9abbf2c0689..749dbc563ac5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
> @@ -17,7 +17,13 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: qcom,sa8775p-tlmm
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,sa8255p-tlmm
> +          - const: qcom,sa8775p-tlmm
> +      - items:

No need to add items here, there were not present before. Anyway,

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


