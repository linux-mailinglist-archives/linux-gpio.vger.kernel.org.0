Return-Path: <linux-gpio+bounces-27929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6112C293FA
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 18:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C750C4E7DEF
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 17:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874A62DF122;
	Sun,  2 Nov 2025 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDkY6Tm1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EA32DCBF4;
	Sun,  2 Nov 2025 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762104812; cv=none; b=Xn46mRLhnFXSO7OxvLSQ+rAzqPpcNjzx/KLQv6PBtj7wYYuGGiItFGAXiExxfP0ExZIqulgJgjjNJv22Ztj3bgZJ1OfRjx1MOn7f/RyNCwuhfKlA7Jzqoj/9useis24sYnwEae1jZ2i+hZ1DQWZs7uiO8RNIE/IMIdTWOBEi6/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762104812; c=relaxed/simple;
	bh=rNZEtonEvsnwG9knkIy44hyOEBhCUx41mMf+yHH/MxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qwi162Y0oMYbevbHrapsik2xGRamjj05ZOw9aWm8Kb7Cs15Y55Ns3eLtY3kP3usiwgNYPBdHXST2YQaSmYhYZjqaZhOnpRI71eagmehQ6n8stVCg9OBoddGINH7bnkYhcs5O9HdnKldiM+ND383qVr6QmGSf4PmkjpaiDDtIpcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDkY6Tm1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91496C4CEF7;
	Sun,  2 Nov 2025 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762104811;
	bh=rNZEtonEvsnwG9knkIy44hyOEBhCUx41mMf+yHH/MxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDkY6Tm1Q6aSFi2vy/wLX6Q7v1bsKgjjxwe8mnBOdm6ItooU5NdPjDJIix2hcMBMI
	 ZtqjmWicOZiZTb/iYS7NUBv0povn3FLfn29dDpiq2aPknvQoHRhzfGFgpJ2d7U3E6X
	 kWQd7w4zW8zVNzblgxDmFubZwoUEsimyyU79oNBrY+494+CO7jx0VQNlEo9iTEvdh3
	 CcsgmDGjeQz8oiCJq021Mjuitg4q/zM+SuO80vA/PgHsstiluTc8aIYll0XJvghmwc
	 gRs8ZCmsf5OR3a9SWQfJuCfuRY04GXyNhaZq6vBgugwnbisnfY+RGUM5/+5KQBNyBe
	 6Ap0sg6cyT0gA==
Date: Sun, 2 Nov 2025 11:36:56 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: mfd: qcom-spmi-pmic: Document PM7550
 PMIC
Message-ID: <mvqkwezj7nbcvmlhamgukbr5ofddyoyvsbfy2kywylojaqgijz@7uqxm7ajicdd>
References: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
 <20251023-sm7635-pmxr2230-v3-2-f70466c030fe@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-sm7635-pmxr2230-v3-2-f70466c030fe@fairphone.com>

On Thu, Oct 23, 2025 at 01:32:26PM +0200, Luca Weiss wrote:
> Document the compatible string for the PM7550 PMIC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index 078a6886f8b1..d0c54ed6df38 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -43,6 +43,7 @@ properties:
>            - qcom,pm7250b
>            - qcom,pm7550ba
>            - qcom,pm7325
> +          - qcom,pm7550
>            - qcom,pm8004
>            - qcom,pm8005
>            - qcom,pm8009
> 
> -- 
> 2.51.1
> 

