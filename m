Return-Path: <linux-gpio+bounces-8710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4E194E510
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 04:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38639B20B32
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2024 02:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F337B132139;
	Mon, 12 Aug 2024 02:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LzZo9O9Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9300974BE1;
	Mon, 12 Aug 2024 02:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723430375; cv=none; b=CyYFmHBF9hyQIxKERsImSoMkCE2OdK1EVJz+z9NHYL6Zm31C+yb8IU318J6jicMB693xXIRFY2KbMG6aTjExBY+/axnJWihaAzh6Xt1QxUVoNp4rR8FAwLheTkGhwg/JGWEMTuzMEh3/qTaM56YeW+BP/Q+oZy+8R+A6M6gJJWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723430375; c=relaxed/simple;
	bh=+zki06TYSwatAUWCTM1ifLYpfliylD34bDGUwW+0YDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oc+S7pOGoEYfrJEQRSAehe42bq7f/Icl7Uv37bN80Jz532QhWK8D+sG/jdEvQnlj3WZxx+BlZUz5IHyVU19JWtHvRmfWzw1a/dwah4fnoZPp3u5WjOg5RvGA7KBxkR1Vxe4q0AtkROAejGcEl/ZSCnE33ysDOFlmnvwsv0iviFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LzZo9O9Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B324C32786;
	Mon, 12 Aug 2024 02:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723430375;
	bh=+zki06TYSwatAUWCTM1ifLYpfliylD34bDGUwW+0YDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzZo9O9YBYptvIIqZZTbemMTPqiLX0CXNgH2XSmjnRGPnaVVJlxEQFMtWBf8DAcmA
	 4weNhzBxyXECM9fHQZXZ4kDD3LwP82517DqB27mCF5Kv5VL3JE6fayUPx8bltnMBu9
	 yZ2sZ/pCxtxhbbmeNztjqfja5EzSoagRnKJvC5KG6ffJeYGhFmZPCN8W/pmrZ17Stz
	 sfMAI1Xd5e/pNmWzBOfSQmIODEmM1JNTRoOHHLCovqdOOQsaCPmXH9g3kZD1Rb1U1b
	 75iZ4C1CQRsOSCsEtz33hNtof8CMD9B6rrHUzEzEpKw13X33+2LDJCbiypgW1qOLjS
	 Xwi5yJl8Pdbnw==
Date: Sun, 11 Aug 2024 19:43:55 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sibi Sankar <quic_sibis@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Fix special pin offsets
Message-ID: <mrrfdclhnwks2qxyed63mk3tqul52ev4u2lbaai4h4bap5scob@qhaduxsjz7m2>
References: <20240809-topic-h_sdc-v1-1-bb421532c531@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809-topic-h_sdc-v1-1-bb421532c531@quicinc.com>

On Fri, Aug 09, 2024 at 02:22:04AM GMT, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> Remove the erroneus 0x100000 offset to prevent the boards from crashing
> on pin state setting, as well as for the intended state changes to take
> effect.
> 
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-x1e80100.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
> index 6cd4d10e6fd6..65ed933f05ce 100644
> --- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
> +++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
> @@ -1805,10 +1805,10 @@ static const struct msm_pingroup x1e80100_groups[] = {
>  	[235] = PINGROUP(235, aon_cci, qdss_gpio, _, _, _, _, _, _, _),
>  	[236] = PINGROUP(236, aon_cci, qdss_gpio, _, _, _, _, _, _, _),
>  	[237] = PINGROUP(237, _, _, _, _, _, _, _, _, _),
> -	[238] = UFS_RESET(ufs_reset, 0x1f9000),
> -	[239] = SDC_QDSD_PINGROUP(sdc2_clk, 0x1f2000, 14, 6),
> -	[240] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x1f2000, 11, 3),
> -	[241] = SDC_QDSD_PINGROUP(sdc2_data, 0x1f2000, 9, 0),
> +	[238] = UFS_RESET(ufs_reset, 0xf9000),
> +	[239] = SDC_QDSD_PINGROUP(sdc2_clk, 0xf2000, 14, 6),
> +	[240] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xf2000, 11, 3),
> +	[241] = SDC_QDSD_PINGROUP(sdc2_data, 0xf2000, 9, 0),
>  };
>  
>  static const struct msm_gpio_wakeirq_map x1e80100_pdc_map[] = {
> 
> ---
> base-commit: 1e391b34f6aa043c7afa40a2103163a0ef06d179
> change-id: 20240809-topic-h_sdc-eb6edad718cd
> 
> Best regards,
> -- 
> Konrad Dybcio <quic_kdybcio@quicinc.com>
> 

