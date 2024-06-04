Return-Path: <linux-gpio+bounces-7130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9567F8FB61F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 16:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48335287940
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 14:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EF912B14F;
	Tue,  4 Jun 2024 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxDGDm31"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E4312B145;
	Tue,  4 Jun 2024 14:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717512220; cv=none; b=oZls6mv83/Pubxu4OybyLEyFTg+T+LRzmYlO9CcNgqxfHyHXs1NKIJrZ5JKPzWNZ/f2Em/ORZ7IuskNP7CSQjqJvdf5+yFQILAslCQSaAjOK9oLYPtzHzwq4c9dZZypvTsfq0+ZJsWTAqxjYTbNZTledh0JEs6H7YJDGXHqtBjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717512220; c=relaxed/simple;
	bh=wxvYehVK1oT7AfmqexFkmw2Uc3jmS7XsjM6dPzGFF8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDaJil+GWGnHdol13dGX8tnarUP5oAdJCCdVxDoVPpK03/Kq4z4PPjzv9DrpLrPeNFWenNOqgj1MHQP5G329EvUw4vJChBxPMp7H7b7EIpw5wKV5/5fCDD4WI8XThTOIhWkebAfwclL1VMXTqWRyhDO3Wj7okjjAGNHvZPPoLSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxDGDm31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64003C2BBFC;
	Tue,  4 Jun 2024 14:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717512219;
	bh=wxvYehVK1oT7AfmqexFkmw2Uc3jmS7XsjM6dPzGFF8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxDGDm31ykUnzbf7oy5R3C1JqovoBfDS6oe2BacBqWdiItMI5yxToO2riloeBxuHF
	 B1ssyyPvDkomQ0gQC7jjR2FY9kAxn2Dh71jCitYijdG01Uqa4AMxrSj2FtEsuIybq4
	 3R8tjV3k6TmOQbXr24+D4kixWhY/R96M5OkwC5GyFlM7Yf8GyVFfszho0ilPzYOGjt
	 gupfhdFTZAfBmuQFJG4yLsjOcjHqc6j8WBwYiwj+tW2QnC1apdhiwSkh8eXIIlgD6m
	 wv/RjivP1ARrRrykvWLUlnJtixTAnUGw68XG9BUxd82ndOz9smo1170dOuzFeCdRx8
	 v9tSlC2aqyjsw==
Date: Tue, 4 Jun 2024 09:43:37 -0500
From: Rob Herring <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 11/14] dt-bindings: mfd: pm8008: rework binding
Message-ID: <20240604144337.GA572574-robh@kernel.org>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-12-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529162958.18081-12-johan+linaro@kernel.org>

On Wed, May 29, 2024 at 06:29:55PM +0200, Johan Hovold wrote:
> Rework the pm8008 binding by dropping internal details like register
> offsets and interrupts and by adding the missing regulator and
> temperature alarm properties.
> 
> Note that child nodes are still used for pinctrl and regulator
> configuration.
> 
> Also note that the pinctrl state definition will be extended later and
> could eventually also be shared with other PMICs (e.g. by breaking out
> bits of qcom,pmic-gpio.yaml).

This commit message should also state there are no users.

> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  .../devicetree/bindings/mfd/qcom,pm8008.yaml  | 149 +++++++++++-------
>  1 file changed, 90 insertions(+), 59 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> index d71657f488db..ccf472e7f552 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
> @@ -27,103 +27,134 @@ properties:
>    reset-gpios:
>      maxItems: 1
>  
> -  "#interrupt-cells":
> +  vdd-l1-l2-supply: true
> +  vdd-l3-l4-supply: true
> +  vdd-l5-supply: true
> +  vdd-l6-supply: true
> +  vdd-l7-supply: true
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
>      const: 2
>  
> -    description: |
> -      The first cell is the IRQ number, the second cell is the IRQ trigger
> -      flag. All interrupts are listed in include/dt-bindings/mfd/qcom-pm8008.h.
> +  gpio-ranges:
> +    maxItems: 1
>  
>    interrupt-controller: true
>  
> -  "#address-cells":
> -    const: 1
> +  "#interrupt-cells":
> +    const: 2
>  
> -  "#size-cells":
> +  "#thermal-sensor-cells":
>      const: 0
>  
> -patternProperties:
> -  "^gpio@[0-9a-f]+$":
> +  pinctrl:
>      type: object
> +    additionalProperties: false
> +    patternProperties:
> +      "-state$":
> +        type: object
> +        $ref: "#/$defs/qcom-pm8008-pinctrl-state"

There's only 1 reference to this, so just move the $def contents here.

Rob

