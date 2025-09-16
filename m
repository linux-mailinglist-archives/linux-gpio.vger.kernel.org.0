Return-Path: <linux-gpio+bounces-26214-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 493BEB59BD5
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 17:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 088A51BC3B01
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 15:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF9A3469FF;
	Tue, 16 Sep 2025 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkI/qLdn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF693451D7;
	Tue, 16 Sep 2025 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758035515; cv=none; b=Rr8Db5VNWmGrBcZtayUA8gc0aoEsbPolZ9IkN6idEmtj8E7Hr767arijz6Do4nxaXBlRzz47ZCUKoELVQtDIzwB1fAP3dCfaJVxC+AVsP3J4fSdOhvcwrtDRJl70pIvIbgjP3QhqtiYLsHBF7e7gKkW0mLej+boRZAEAZuZSFBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758035515; c=relaxed/simple;
	bh=P9LnhdXVkjKLFBgWnWZR4YUF5grzcxohOzgop5eqxvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrU8oyssICa3WpQpDiyR0WAqkRbocEi2dFaWUG9qtcAV8/ETkHwrPUdDcZkXNjH/aYyz08s49t4z1m/aj2fIUpWsrx4WFgDHJOcg9MvG7vpbnd/Yc12VvgJ7R8NJXXUjMd0Q6vWg+fbKgAYJd0fhiTGOvQ7Gwmn0XUBcZKaIqtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkI/qLdn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303D8C4CEEB;
	Tue, 16 Sep 2025 15:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758035515;
	bh=P9LnhdXVkjKLFBgWnWZR4YUF5grzcxohOzgop5eqxvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkI/qLdn3lnRFhp4ifuc+xerZYR35gccHlPtRyXGMRHv9ygiFyVt7Le+g1DelSLhO
	 oxq0+WbxBRYsz3TGdMyyjy+kcfm5oeIv1Sbx2HhOA5WcVlDntTr7YFog6edXlDySwg
	 aijCKMoGcgEI1A7AuQFsIkKDfUvpw67mJ17i4uHZ7DSWl2pouFqmWH3dHi1/kM7kcR
	 mMdfeBq70ms6j3QWuByNXbfF88s/wgFtaoJKHBMJ5kgiBCgv9v0pTl/B7iuAVYdyf+
	 3Uba893TrntOgvolMmspM2WqQaCjB/AP7YqPDNORyVK8KJ3jpCjxT+RcvFT5tEyB48
	 I3qntFlC8c9Kw==
Date: Tue, 16 Sep 2025 10:11:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>, 
	Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: qcom: msm8960: rename msmgpio
 node to tlmm
Message-ID: <o23idwppfthjoivpyzjojmoakdorr43gpmo5opmeet6oeud742@qhk2j5bjg5aa>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
 <20250915-msm8960-reorder-v1-5-84cadcd7c6e3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-msm8960-reorder-v1-5-84cadcd7c6e3@smankusors.com>

On Sun, Sep 14, 2025 at 06:34:59PM +0000, Antony Kurniawan Soemardi wrote:
> Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
> convention used by other Qualcomm SoCs.
> 
> Suggested-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>


Note that this patch is in a different subsystem and is picked up by a
different maintainer and there are no dependencies with the other
patches. It would therefor have been preferable if you sent this patch
alone.

No need to do anything this time though, I expect Linus to fish out this
patch from the series.

Thank you,
Bjorn

> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,msm8960-pinctrl.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
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
> -- 
> 2.34.1
> 

