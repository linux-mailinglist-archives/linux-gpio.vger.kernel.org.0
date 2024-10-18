Return-Path: <linux-gpio+bounces-11592-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C69A9A3613
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 08:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEF0AB23549
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 06:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07071188CC4;
	Fri, 18 Oct 2024 06:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSW7oAzq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA2417C21B;
	Fri, 18 Oct 2024 06:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729234153; cv=none; b=MomCFnRCEH+dG+EC1n728WmGzewe2WrGQBcykqQxGJKvYe5BOY2NAEQ93oEF6mCa9kEK9yR0Ffw3USGm4n9BgO7O4c/AO62wVDXDsUPal7EMtYPON70lLqE4UYGEx7mYHjJj512upiYkLbJWh5vOhD4nmGl401lsP+2uNiHGJcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729234153; c=relaxed/simple;
	bh=UwktfT7c9ieMankN4ksQCQMhaqNsVgCol6XeY0OIXTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctmVY4vAJ1g6d/dJcW9igSjRNU7tyOTkbxsZF7gb1njMN78TAUYdjpTQhn2QBLlalSXOs9TmQs3RkBRAEx11Sc6KKz6so5+UR2qzfUkrM3ZbQs2kvE1ckk/qy+USxP7/byg+GsbAa6rO1WRy/UrxxhLfGryA6Qzkud2PGUVesbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSW7oAzq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA94C4CECF;
	Fri, 18 Oct 2024 06:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729234153;
	bh=UwktfT7c9ieMankN4ksQCQMhaqNsVgCol6XeY0OIXTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSW7oAzqjKhLfKFNSrOkTyexft43czsMGJH5/4fJmszrA48nIcnhq+rzDjgwUHUOq
	 nWNY1SwHC/Jia5OBlM8nz6Kh2rNUKJz897LwWEsYMOLwgReVlvgomC5VBj1Qm/+mNu
	 Hgnuwpa9iXclCYe8QeZ6FOSwaWGWrz1aHIqti1H38coWbRlUP4eTAtflJz3Be+wUBO
	 GatbdBl7+7SH0SdxolBqtjqeayo5QO+mfH/0lyrUY2qxHaKA/BpsBFkVGUnMeufTRS
	 6Na3NZ+cU4Mi0uiOmWhYNm6cDd0j7POUzPywJBIvrm0dK782YLTYe/YyeFrwqg5Qk8
	 FAxgsl7+mgrcA==
Date: Fri, 18 Oct 2024 08:49:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl : qcom: document SAR2130P TLMM
Message-ID: <u2yel7ych7esqlr732x6x424rxcolb22k6fgw5t6yyuurgneyf@5hnqyc3iqdvv>
References: <20241017-sar2130p-tlmm-v1-0-8d8f0bd6f19a@linaro.org>
 <20241017-sar2130p-tlmm-v1-1-8d8f0bd6f19a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-tlmm-v1-1-8d8f0bd6f19a@linaro.org>

On Thu, Oct 17, 2024 at 07:15:45PM +0300, Dmitry Baryshkov wrote:
> Add bindings for the pin controller (TLMM) present on the
> Qualcomm SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/pinctrl/qcom,sar2130p-tlmm.yaml       | 138 +++++++++++++++++++++
>  1 file changed, 138 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a8daa96936599e459c801b6685a42659271604ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml
> @@ -0,0 +1,138 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,sar2130p-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. SAR2130P TLMM block
> +
> +maintainers:
> +  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +
> +description:
> +  Top Level Mode Multiplexer pin controller in Qualcomm SAR2130P SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sar2130p-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 105
> +
> +  gpio-line-names:
> +    maxItems: 156

Don't you have 210 GPIOs? At least reserved-ranges and pins pattern
suggest it.

Best regards,
Krzysztof


