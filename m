Return-Path: <linux-gpio+bounces-10490-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5469C98809F
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 10:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D14FCB21BC5
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 08:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8329189F2B;
	Fri, 27 Sep 2024 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7G8kvAG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ADE17A597;
	Fri, 27 Sep 2024 08:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426614; cv=none; b=h72hNy0zWfgB7Jc/m5McClIf+kkaAB20EwFnoOfzHg3YAo9mq/HbzClFfg6CaRfun1iGnJ+EmD5gsF7sEZ03zXnjtoI3U5mOdZCTBAgSSIbheafzlY8lijbf8EvFTEK7OkXCoQxsVoeUJxwB5SAFQoyjjqsznxLPXQi6BUXF9hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426614; c=relaxed/simple;
	bh=TMvlI7I3PIbjpBpJwafyBakpSOnmN2jM7rsHs1t9i3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTKOFwWbX2PZBwlHS/fCLv+dsOUCupJ8ntr/3efeMFsWxatRjMK4Ltl2uVUqI2aBa1eYvZbXu/EGfg/dUf0+jlVfq47CaWDuwngwD330dBueVtLcoQKUM2zheJeizFI5TO+crCBNzYpQjvi5IC71LbxUx8aFvJO3HnPyMTebqRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7G8kvAG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E845C4CEC4;
	Fri, 27 Sep 2024 08:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727426614;
	bh=TMvlI7I3PIbjpBpJwafyBakpSOnmN2jM7rsHs1t9i3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e7G8kvAGcPCdp2L3sa8O1zvwuDTDuYVBUKHYhUWX8/G4jkf1SSweruaw7zKAOp+KH
	 2/CeEoacEj5Rx7HRFhMzxCwO3UNAAv0U9TcWwrUwabLhETJiDqzljKH5Hb3VsRSlOG
	 d5UKMW9TaLEDO8OaRLFFq2FJyQQW1I3akeuyECHuhwOj6xcq1MAHVXjSKVVWujmqbX
	 0VdjDqybXrBdWTw3G+vwiKJQ83X1f96XDbXEbpBRMH4bIZkeb1YOx6e5OCsf78GWay
	 J+ICVwfHM2PKutpZ2QDI0+QBCIRu4c61ZsEgM3bN7ilTHVzHg5NY/CitOvDyeu+E/p
	 V/PaEvfQObcBw==
Date: Fri, 27 Sep 2024 10:43:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH V2 2/9] dt-bindings: clock: Add Qualcomm IPQ5424 GCC
 binding
Message-ID: <ruti7hmkxkayzmqfbme6rw6j2vbhlx4ul4ptcckwamcpd4cyfx@owufhxwpvlcj>
References: <20240927065244.3024604-1-quic_srichara@quicinc.com>
 <20240927065244.3024604-3-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240927065244.3024604-3-quic_srichara@quicinc.com>

On Fri, Sep 27, 2024 at 12:22:37PM +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add binding for the Qualcomm IPQ5424 Global Clock Controller
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
> [v2] Added the bindings as a part of ipq5332-gcc.yaml itself.
>      Difference between ipq5332 and ipq5424 being 2 additional phy's.
> 
>  .../bindings/clock/qcom,ipq5332-gcc.yaml      |  57 +++-
>  include/dt-bindings/clock/qcom,ipq5424-gcc.h  | 156 +++++++++
>  include/dt-bindings/reset/qcom,ipq5424-gcc.h  | 310 ++++++++++++++++++
>  3 files changed, 508 insertions(+), 15 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,ipq5424-gcc.h
>  create mode 100644 include/dt-bindings/reset/qcom,ipq5424-gcc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> index 9193de681de2..aaa8b399c3b4 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq5332-gcc.yaml
> @@ -4,31 +4,24 @@
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
> -
> -  clocks:
> -    items:
> -      - description: Board XO clock source
> -      - description: Sleep clock source
> -      - description: PCIE 2lane PHY pipe clock source
> -      - description: PCIE 2lane x1 PHY pipe clock source (For second lane)
> -      - description: USB PCIE wrapper pipe clock source

You cannot remove properties from top-level. Unify the list, so it uses
common part (ipq5332) and keep it here with minItems.  Then in allOf you
only control min/maxItems.


Best regards,
Krzysztof


