Return-Path: <linux-gpio+bounces-26515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1AB933E9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 22:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E19517F39B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 20:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E549262FFC;
	Mon, 22 Sep 2025 20:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2JqkeF6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F34B1A08A4;
	Mon, 22 Sep 2025 20:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758573364; cv=none; b=BsjTJsg1oOmdvwotXtPgJvurxi9h3creTjfrVKbMMUQ5fblqzYgR66UwBMA3NS5UcxMPS54qMquBG+N28PNOEMnS7cx8hhHBjL7Wn/lQgX/ydySegWryouVI2ZRFjm75OpM31S7OA1N1h+f4IZYf9orSdVmeUdXaHmGm6YuUERA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758573364; c=relaxed/simple;
	bh=v4k9iTHE8RqQDMv3lm+UVLVMxrQ7UzF8rFZtx1N6EDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRMz+WaZGXnABl+fmRv6I8J/JJjXgFXA0QNrWiJSnm7LNPqayA8njE22/zo4UjFy2pPqVDAc5nAjaZrumBLgH5IH2Dv+VKEjF05ZmLl6lLoVnpY84LA0EukUzgLydWoTo4z8NOZpcRj5Zy28YoxnlU6K0kckv+b1JwOHuPvvx2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2JqkeF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A0FC4CEF0;
	Mon, 22 Sep 2025 20:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758573363;
	bh=v4k9iTHE8RqQDMv3lm+UVLVMxrQ7UzF8rFZtx1N6EDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2JqkeF63BN07j8swHZWEGjTT9bkwn9UG2sFlUFI+Xv3HmFSgcG7PVGYhpUkRfkoh
	 lmrnRZydJfpt7GMgsmlSSuZPAZqyENUTqjQibV3NgK2BHmM4zfRaBOI9wUxnpngrM7
	 VVmC1hDD3DsDrMSVyFYQaB1BMw5+XJpsxOfWW8TMi1s2KuKxy+RUThtRMEXUVGAYKq
	 UmSBoxwhMqe5HLbKLuQd56wk2Ki/GQ/82J/iZemJJiFVBWYHGD+IWwyANp0CyS7FUP
	 pVE7v/NBJvnqmRMlw/IyyrnGK+f5S8oNaUcHCrhKjPUJAwEgVL8NAq5WmEQ6EHfFpc
	 tCZYZcVxONZoA==
Date: Mon, 22 Sep 2025 15:36:02 -0500
From: Rob Herring <robh@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: msm8960: rename msmgpio node
 to tlmm
Message-ID: <20250922203602.GA1283600-robh@kernel.org>
References: <20250921-msm8960-sdcard-dtbindings-v1-1-5a2455a30a06@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-msm8960-sdcard-dtbindings-v1-1-5a2455a30a06@smankusors.com>

On Sun, Sep 21, 2025 at 03:25:59AM +0000, Antony Kurniawan Soemardi wrote:
> Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
> convention used by other Qualcomm SoCs.

You aren't renaming the node, but the label.

> 
> Suggested-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
> This patch was originally part of msm8960 cleanup series [1], but as
> Bjorn pointed out, dt-bindings live in a different subsystem and should
> be submitted independently.
> 
> [1] https://lore.kernel.org/all/20250915-msm8960-reorder-v1-5-84cadcd7c6e3@smankusors.com/
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml
> index 46618740bd312b975321427e5ffa34811c68e652..03a3692770142048391577401869cea9a7735053 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml
> @@ -107,12 +107,12 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -    msmgpio: pinctrl@800000 {
> +    tlmm: pinctrl@800000 {
>          compatible = "qcom,msm8960-pinctrl";
>          reg = <0x800000 0x4000>;
>          #gpio-cells = <2>;
>          gpio-controller;
> -        gpio-ranges = <&msmgpio 0 0 152>;
> +        gpio-ranges = <&tlmm 0 0 152>;
>          interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>          interrupt-controller;
>          #interrupt-cells = <2>;
> 
> ---
> base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
> change-id: 20250921-msm8960-sdcard-dtbindings-ad8d3d511e6c
> 
> Best regards,
> --
> Antony Kurniawan Soemardi <linux@smankusors.com>
> 

