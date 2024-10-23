Return-Path: <linux-gpio+bounces-11793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DE19ABC1A
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 05:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1D49284D9E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 03:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3A854670;
	Wed, 23 Oct 2024 03:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIJLY5dG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23E03F9C5;
	Wed, 23 Oct 2024 03:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729653733; cv=none; b=EIpGMwv3kXduglO9MYU23uMmSL6E/xXoas5IDw629ko8ojo5BIKbhczj5zR5lw398gxnNRmObUgMl+Ks5hbPQ50spWr8nhiX3quYubpbMFeQQyZILoBjHYwasUNedlDDfTFH4H58p1YiiaGwEf+OxN5Xzx0oea6QvYu50X/DbS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729653733; c=relaxed/simple;
	bh=GZDpR9wGeUvIuDklehHTqOv1Xk8hOBog4OBM1m7IDak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3gblHh6InEEVR5zJu71oows0Mi81H4OhBV5Iiqv6/nELVv0bXky7+m9V1mlFlonYzCe6f76PXbPS0VD6MDHbqQJumjwSfkHRZOWlFAFLzC1YFkna1EpKUc5j9lzKW3WCvN2gAGTYVWVKX9r7WROE08L9DHNVip0ZQznctvA1IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIJLY5dG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C32C4CEC3;
	Wed, 23 Oct 2024 03:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729653732;
	bh=GZDpR9wGeUvIuDklehHTqOv1Xk8hOBog4OBM1m7IDak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIJLY5dGFyPwOwvmdqB5U2WpRuTrY6pRceEYQN46DYbHiTZgpctGQU70mSetzq/Ph
	 cENkaPRdhfaDEe3MTyUL8/PNuYpptxVWsMDPuIZNmdsMndBlERBfOe2MUnBaBArOi9
	 u4ht8tHT/05LJ4/z6f3bkMduRPk1QiwAMiTI8UyPBgr1/i/P4DT2xi9tjGpZvJcXP4
	 P3m0wDhaa66MIYKBsjGrQfxpEdN3kVm90ggyPU97qYT809HHRd+vZobnpdFTrAH+Hy
	 gS43iA2ls4W/vYEd/bgdndTh8tD1FsnaHvNhZZPBNqC5PDOb+xC7YgqZjTiEouewdd
	 8PqCizRkCZY/A==
Date: Tue, 22 Oct 2024 22:22:09 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8750 pinctrl
Message-ID: <5k3kfyx43d6r2hchlbjpplhxkm4xfuu6xefbhydqrhnd3zievw@oftxc2ub5l6m>
References: <20241021230414.2632428-1-quic_molvera@quicinc.com>
 <20241021230414.2632428-2-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021230414.2632428-2-quic_molvera@quicinc.com>

On Mon, Oct 21, 2024 at 04:04:13PM GMT, Melody Olvera wrote:
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
[..]
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    tlmm: pinctrl@f100000 {
> +        compatible = "qcom,sm8750-tlmm";
> +        reg = <0x0f100000 0x300000>;
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&tlmm 0 0 211>;

I know it's just an example, but I think this number should be 216.
Please also correct it in the dtsi, where you made it 220.

Regards,
Bjorn

> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        gpio-wo-state {
> +            pins = "gpio1";
> +            function = "gpio";
> +        };
> +
> +        uart-w-state {
> +            rx-pins {
> +                pins = "gpio60";
> +                function = "qup1_se7";
> +                bias-pull-up;
> +            };
> +
> +            tx-pins {
> +                pins = "gpio61";
> +                function = "qup1_se7";
> +                bias-disable;
> +            };
> +        };
> +    };
> +...
> -- 
> 2.46.1
> 

