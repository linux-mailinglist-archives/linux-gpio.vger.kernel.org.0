Return-Path: <linux-gpio+bounces-10876-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8537E991979
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 20:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC4C01C20E12
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 18:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48F215B570;
	Sat,  5 Oct 2024 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OruGk6nX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE1515A851;
	Sat,  5 Oct 2024 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728152626; cv=none; b=jkMNYw7KXnXX5Nuv5Q3RbiRv1OxE5RPnwkGIQtlQ8igqG1iUJ2NV2JOtC4XojeyBqPZmfPbifSS18CSDuFsgAjczdbHFFEfoFLdysLT5Okff89VtiNIa9DPEWGKXmocNA3AF1LlvJG7BfxIT4mWp8faJvJ7bVYxbEFKZtCXJJrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728152626; c=relaxed/simple;
	bh=kxzlIO1kgZa4eBIb9lr2I1n75J/YWBPfbw062Q50ilU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIgGzvhcgcTORF/F6GiHsHuB7/o8MCxgKotL4ZeZBOiSxWrNfsDfcRUiw6+Do8lszyE2H3zR2rrRLzyvWxcpNw/QVmLO0+qYPlGyoedRy4ghtAohDPO14HTSCIo49Dfe88WRA34wiaFOU8MsHdmxtBkn15zB35NcyxGWsRVOHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OruGk6nX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44C8C4CEC2;
	Sat,  5 Oct 2024 18:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728152625;
	bh=kxzlIO1kgZa4eBIb9lr2I1n75J/YWBPfbw062Q50ilU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OruGk6nXMjvr08V9VJT0HhwG3POlNYQCJIs/FElKG8lHmmovlkjs4IGFkTlQ1pTf9
	 qYSmBZlbrSsEsu0RGxYwV8iCaYYgryvHpE+oUR7pNCroNM1gbfVpnu7/KL+PoOlffw
	 yoU3sejW5ci25DceAtepuQA95mEcizuucSq+qjyHITnsBearvHD3DXS1atGNbl7cZM
	 2JjzTbmObo72j3ON+0WY+UhTNRhxuAU3GSA6ZMKlkdzrylOjpGhsr8vu/4kZINox8o
	 oSPud5kXSWI6OvZfK6A3usUSPZ8D25BtrqjOg/Sm5CQeQzdQwr3ZfqKapKiHkGULYo
	 AJp2BgQ3iP+zA==
Date: Sat, 5 Oct 2024 13:23:45 -0500
From: Rob Herring <robh@kernel.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	ulf.hansson@linaro.org, linus.walleij@linaro.org,
	catalin.marinas@arm.com, p.zabel@pengutronix.de,
	geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	quic_varada@quicinc.com
Subject: Re: [PATCH V3 2/7] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
 binding
Message-ID: <20241005182345.GA482031-robh@kernel.org>
References: <20241004102342.2414317-1-quic_srichara@quicinc.com>
 <20241004102342.2414317-3-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004102342.2414317-3-quic_srichara@quicinc.com>

On Fri, Oct 04, 2024 at 03:53:37PM +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add binding for the Qualcomm IPQ5424 Global Clock Controller
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  [V3] Added only new clocks for IPQ5424 and ordered for both
>       IPQ5332 and IPQ5424 based on min/max items
> 
>  .../bindings/clock/qcom,ipq5332-gcc.yaml      |  40 ++-
>  include/dt-bindings/clock/qcom,ipq5424-gcc.h  | 156 +++++++++
>  include/dt-bindings/reset/qcom,ipq5424-gcc.h  | 310 ++++++++++++++++++
>  3 files changed, 499 insertions(+), 7 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
>  create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> index 9193de681de2..1b6d64385116 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> @@ -4,30 +4,34 @@
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
> +  See also::
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
> +      - description: PCIE 2-lane PHY2 pipe clock source
> +      - description: PCIE 2-lane PHY3 pipe clock source
>        - description: USB PCIE wrapper pipe clock source

New clocks go on the end of the list. Otherwise, it is an ABI break (or 
the descriptions are wrong in one case).

Rob

