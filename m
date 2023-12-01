Return-Path: <linux-gpio+bounces-880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B70D4801572
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 22:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7191A281CDF
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Dec 2023 21:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5964759B54;
	Fri,  1 Dec 2023 21:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F31NF7i8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1944E584C6;
	Fri,  1 Dec 2023 21:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFC9C433C7;
	Fri,  1 Dec 2023 21:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701466400;
	bh=YtF+HG7uyHGCB80zMWlxTQc+O5fEWTNNEjS+VJTvaKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F31NF7i8Qcu+arEuEbKWIVU5oWYsZGlTsBZSWkUo98N8FkrCPbmUOg5rOclyakcJ0
	 3LnY8ogh/k+x5iIATms0MN/IFMsaD6p0WE6zCIkpyYS0Zu6iibcaVGXmXU7F5WOqOh
	 Bj5/DrPK2aUb7aWZiKvSfIHmzc4bAseovq8gQn2CPbaCrI0CTA/tT0nyQAjFEVfWg6
	 ZjAlQApmm1dN0GHUngQAFkbx69l0pGr1L4PAclJw6nIk++qAfKx8DhthObiN65kqrB
	 Xk/82YE2Ctd3qRfMWarz8krvjuYStXuxNE9pgcm9vnDQyGhACJgP2siU8Bs2KPAPj7
	 94WVkZcZfBoEg==
Date: Fri, 1 Dec 2023 13:36:47 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: agross@kernel.org, konrad.dybcio@linaro.org, linus.walleij@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com
Subject: Re: [PATCH v5 4/4] pinctrl: qcom: sm4450: correct incorrect address
 offset
Message-ID: <dx62durg3wmqviqdpecdqprd5wwkg4i7n5tgcab55axzssdeel@ftt35c6td2sh>
References: <20231130024046.25938-1-quic_tengfan@quicinc.com>
 <20231130024046.25938-5-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130024046.25938-5-quic_tengfan@quicinc.com>

On Thu, Nov 30, 2023 at 10:40:46AM +0800, Tengfei Fan wrote:
> The address offset of 0x100000 is already provided in SM4450 DTSI, so
> subtract 0x100000 from the offset which used by ufs and sdc.
> 

As Konrad points out, please fix the broken patch, don't add a separate
fix in the same series.

> Suggested-by: Can Guo <quic_cang@quicinc.com>

We unfortunately don't have a way to give credit to those providing
review feedback, so omit this when fixing patch #2.

Regards,
Bjorn

> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm4450.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm4450.c b/drivers/pinctrl/qcom/pinctrl-sm4450.c
> index 49e2e3a7a9cb..5496f955ed2a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sm4450.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sm4450.c
> @@ -936,14 +936,14 @@ static const struct msm_pingroup sm4450_groups[] = {
>  	[133] = PINGROUP(133, _, phase_flag, _, _, _, _, _, _, _),
>  	[134] = PINGROUP(134, tsense_pwm1_out, tsense_pwm2_out, _, _, _, _, _, _, _),
>  	[135] = PINGROUP(135, _, phase_flag, _, _, _, _, _, _, _),
> -	[136] = UFS_RESET(ufs_reset, 0x197000),
> -	[137] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x18c004, 0, 0),
> -	[138] = SDC_QDSD_PINGROUP(sdc1_clk, 0x18c000, 13, 6),
> -	[139] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x18c000, 11, 3),
> -	[140] = SDC_QDSD_PINGROUP(sdc1_data, 0x18c000, 9, 0),
> -	[141] = SDC_QDSD_PINGROUP(sdc2_clk, 0x18f000, 14, 6),
> -	[142] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x18f000, 11, 3),
> -	[143] = SDC_QDSD_PINGROUP(sdc2_data, 0x18f000, 9, 0),
> +	[136] = UFS_RESET(ufs_reset, 0x97000),
> +	[137] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x8c004, 0, 0),
> +	[138] = SDC_QDSD_PINGROUP(sdc1_clk, 0x8c000, 13, 6),
> +	[139] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x8c000, 11, 3),
> +	[140] = SDC_QDSD_PINGROUP(sdc1_data, 0x8c000, 9, 0),
> +	[141] = SDC_QDSD_PINGROUP(sdc2_clk, 0x8f000, 14, 6),
> +	[142] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x8f000, 11, 3),
> +	[143] = SDC_QDSD_PINGROUP(sdc2_data, 0x8f000, 9, 0),
>  };
>  
>  static const struct msm_gpio_wakeirq_map sm4450_pdc_map[] = {
> -- 
> 2.17.1
> 

