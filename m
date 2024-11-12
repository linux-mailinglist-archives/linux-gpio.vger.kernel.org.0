Return-Path: <linux-gpio+bounces-12843-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D6F9C4D87
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 04:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE6ABB22B32
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 03:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C4CD207A2B;
	Tue, 12 Nov 2024 03:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8GOEA2n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA734C91;
	Tue, 12 Nov 2024 03:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731383841; cv=none; b=g7pXel8HwVLWARUkDVYi008gwYtPBnUWdMln/KfDIknohEc791YtkVpj2xc44OFI8cVfh2Ekxpi+E1ZVIE7kcUXFG1GWZMID2hHmhKB3jIh8SNXGNzg1Mzbbz8lbej8cuOdh/Fa9Lxa5TH5aNH4KM2Ep896uMpekkIy7VJOHjfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731383841; c=relaxed/simple;
	bh=9KO8cVztzjPZVNEUYaBIYLH2rz+B3tpahGgV0TOH+DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kREkcYBlHMzaXwgE59Bysnt6ogijteQ6O466fBwwufrf4pzxXzkL3Pa7FlQSdcxaCzr48h7i7m86yKpMZflaeslZ9u9p9nrtFWsufyUI22qH6dmhnb+YM8lt2NQFp3+Ud0C49ausTPUw0OSA8lcBjOAS6K5WgVj/B/6mq7pKSfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8GOEA2n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699D3C4CECD;
	Tue, 12 Nov 2024 03:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731383839;
	bh=9KO8cVztzjPZVNEUYaBIYLH2rz+B3tpahGgV0TOH+DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8GOEA2nvns3mdKImNGl7Qgry7ji3Hud9mcem55vZZ/DQwmVeq5mTB9EyZCSRhsRN
	 KXrasKECd+v3hf4GdZp2NSCyflIf8X+ucN5NnbgrK8ymq/IxW8dfnHw0YpMYIVFoZ2
	 5Buimf9X5DJTI2iYVMNrS/1+70omOG7PkvEG0jOpsZugw3KTX9StZw1PPuDvq+hvfL
	 WJneSCRyouAQ7veDVhsA5UltkLHh8zQT7lh6gnyBVwapGU7nY1mfaOUYfP9iLx8YL+
	 a6QFVahM8b/5gWZhrDvfpnsHIZqbwp2ue3012AP7iy46mxXfTzWeAUy9McbX+sOmph
	 9TrjgCPXjinuQ==
Date: Mon, 11 Nov 2024 21:57:16 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] pinctrl: qcom: Introduce pinctrl for SM8750
Message-ID: <kq6kk6gszl7c3nltxt3zihhepqlgm4ziajahnuvngyz4qg72vi@xtnwjnz4st3v>
References: <20241112002843.2804490-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112002843.2804490-1-quic_molvera@quicinc.com>

On Mon, Nov 11, 2024 at 04:28:41PM -0800, Melody Olvera wrote:
> Add pinctrl block for the SM8750 SoC.
> 
> The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
> consumer mobile device SoCs. See more at:
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> 
> Changes in V2:
> - corrected example dt node in the bindings
> - removed reserved gpios (moved to dt)
> - lowercased letters in hex numbers
> 
> Melody Olvera (2):
>   dt-bindings: pinctrl: qcom: Add sm8750 pinctrl
>   pinctrl: qcom: Add sm8750 pinctrl driver
> 
>  .../bindings/pinctrl/qcom,sm8750-tlmm.yaml    |  138 ++
>  drivers/pinctrl/qcom/Kconfig.msm              |    8 +
>  drivers/pinctrl/qcom/Makefile                 |    1 +
>  drivers/pinctrl/qcom/pinctrl-sm8750.c         | 1729 +++++++++++++++++
>  4 files changed, 1876 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
>  create mode 100644 drivers/pinctrl/qcom/pinctrl-sm8750.c
> 
> 
> base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
> -- 
> 2.46.1
> 

