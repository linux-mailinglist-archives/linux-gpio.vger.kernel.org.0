Return-Path: <linux-gpio+bounces-11590-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 720319A3526
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 08:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED89FB2217E
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 06:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692E1186294;
	Fri, 18 Oct 2024 06:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgD3ztGf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09B2184539;
	Fri, 18 Oct 2024 06:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729231988; cv=none; b=myAAXMOd6Bfz8TKUPGgwZD5VZ/mRjb6xsNejKnOBDHD4ZlAjc7SZPn7vBPfLwzg6deqfM+pbTKqyfh4GpWOEe3Ns+HuKUZ4y4Nlmx13S52zXDO8g1lkE5t+tWGtT0BxRRM3LaaiJKRwobuUg9f5NI18vmvtTBEYh/rCJ5v08zyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729231988; c=relaxed/simple;
	bh=f/5yZzyoQwcXgVSm7jfxqmgjDko+M5Tsgn35ebfSdh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHZtOqG42I/GXfTpncNkqzQnhYH/XC+6xWBVK24yjjUQe56SSaHS67eOx+3aKaRfktNdmq3WcJ7HsBCouGHPtr9uNRA/hpaxdDfosIvibW288VuOs5DnPHF8LSWcXgpaX6pGvFmz/H54qjfvcjA/IDLFr4r36GDuofsyRLMkA7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgD3ztGf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1977C4CEC3;
	Fri, 18 Oct 2024 06:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729231987;
	bh=f/5yZzyoQwcXgVSm7jfxqmgjDko+M5Tsgn35ebfSdh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PgD3ztGfIGwfMqkBDBwYC3jy3OY5KeqWLnH2DU9dfF9d1yDCQA9SJ3ZSwK8aZ6s7X
	 +mIOl/53ycEQ8Kzy8hGOiO9rsfgOdg3kDmgi93f7wQ9jupAu5LyghEU+bor7cI6JPw
	 wo8PHmoa7boLcDA+kekKemlcyS5i2Da3gupL/CIkg5tN8cJlN3IAn1t0MNApxPlvUl
	 w6kT0fOk6Wh8DBWzC0d6/cvW+j5HCz69+GCgJUrMsszUSKGNLqqlXN2aRJPWUPXeUq
	 BD9pN7OtgqHJtX8qmsEauO+X9wk26DiWpC4xMWP2ENkUOLpyfIZ3FC32WKilYOl+7K
	 P23vMu2+iDHwQ==
Date: Fri, 18 Oct 2024 08:13:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH V4 2/6] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
 binding
Message-ID: <nznisr4aqpe65fovvk3q3r6capmqj4jm4xsqufjib2b7vax4xx@6r3tzaar2w3p>
References: <20241017123626.204421-1-quic_srichara@quicinc.com>
 <20241017123626.204421-3-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017123626.204421-3-quic_srichara@quicinc.com>

On Thu, Oct 17, 2024 at 06:06:22PM +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add binding for the Qualcomm IPQ5424 Global Clock Controller
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [V4] Added 2 new PCIE clks to end of the list, preserving default order
> 
>  .../bindings/clock/qcom,ipq5332-gcc.yaml      |  40 ++-
>  include/dt-bindings/clock/qcom,ipq5424-gcc.h  | 156 +++++++++
>  include/dt-bindings/reset/qcom,ipq5424-gcc.h  | 310 ++++++++++++++++++
>  3 files changed, 499 insertions(+), 7 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
>  create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> index 9193de681de2..ef1fd9d9f8da 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> @@ -4,31 +4,35 @@
>  $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm Global Clock & Reset Controller on IPQ5332
> +title: Qualcomm Global Clock & Reset Controller on IPQ5332 and IPQ5424
>  
>  maintainers:
>    - Bjorn Andersson <andersson@kernel.org>
>  
>  description: |
>    Qualcomm global clock control module provides the clocks, resets and power
> -  domains on IPQ5332.
> +  domains on IPQ5332 and IPQ5424.
>  
> -  See also:: include/dt-bindings/clock/qcom,gcc-ipq5332.h
> -
> -allOf:
> -  - $ref: qcom,gcc.yaml#
> +  See also:
> +    include/dt-bindings/clock/qcom,gcc-ipq5332.h
> +    include/dt-bindings/clock/qcom,gcc-ipq5424.h
>  
>  properties:
>    compatible:
> -    const: qcom,ipq5332-gcc
> +    enum:
> +      - qcom,ipq5332-gcc
> +      - qcom,ipq5424-gcc
>  
>    clocks:
> +    minItems: 5
>      items:
>        - description: Board XO clock source
>        - description: Sleep clock source
>        - description: PCIE 2lane PHY pipe clock source
>        - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
>        - description: USB PCIE wrapper pipe clock source
> +      - description: PCIE 2-lane PHY2 pipe clock source
> +      - description: PCIE 2-lane PHY3 pipe clock source
>  
>    '#power-domain-cells': false
>    '#interconnect-cells':
> @@ -38,6 +42,28 @@ required:
>    - compatible
>    - clocks
>  
> +allOf:
> +  - $ref: qcom,gcc.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,ipq5332-gcc
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,ipq5424-gcc
> +    then:
> +      properties:
> +        clocks:

This needs minItems: 7, unless clocks are really optional (but they
shouldn't be optional). I think I missed this part last time.

Best regards,
Krzysztof


