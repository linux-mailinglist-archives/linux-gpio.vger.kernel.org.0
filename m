Return-Path: <linux-gpio+bounces-11146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D21219986D3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 14:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1DAF1C2116F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 12:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4CB1CB328;
	Thu, 10 Oct 2024 12:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yH1xqL5r"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3FD1CB31D
	for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728564967; cv=none; b=WfxOEGze/1klSTALBw2ilZ03O5JthEvxQCUaNLosIDZVCGLuFutZfcpkcPa+SYNCmnmTcInvU40PGo1z+nUwF53jFgWdCAhGBBj2iB+bJ8N6Bdocu7A119NWvtHNG1KR0wz9I6bPrBEPvUJetqs1IY3PgH5/bzoSrQS/k2/AKAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728564967; c=relaxed/simple;
	bh=tOHp6AWjbTv4yI6UVldQljr7MbFCmo+VO/FEqnev4UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFMnzvmaZixzgV2b7eHxxhAfk1ezt3XbiwF7IAwovhoe32yDkRTq5sFehoa0IZD8/s0BLXkv0pXWPfQlRTRsTkVTf4HaDefy2wGRmAkgZ/CRmUZ1FYZO9rk7p5XyHeneiRXjiLzujTiQyluTjscs5uqiSnaU/HL0vjSH5Psgb3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yH1xqL5r; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fabfc06de3so9385441fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 10 Oct 2024 05:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728564964; x=1729169764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNnUCyPTi+G8LZCplzDQqmQsNRTnEL4ih2dYIBtqKZc=;
        b=yH1xqL5rxnPIgaJqM/g3sgRVZ0LaPfNjTcxgx/j0ECRgU0bjbLGRiXwDOD4iT8GOyb
         uSTwRs/JtW+V+aLN2p1YKSTIh0mWlfu9Hi3vbaA497frPC0518fi4LscmYRfKwSpFFiR
         X4cmrbrAFZKOrVZL5UfaWYVKdWUAwtXVFNsxmwW1hd3SbnuVpoXbkhCEud1UFSGpNxoz
         IDi3p13fC1BqSmASSyI4nf2BnMcq8ynxktPw1MnXz2z6+S5Lo/6SFTfPgXgyy+hOcN7g
         hPykDLuhu4koeHCeTFnCKKT+S6BS/V2klokan7SRrsYaH2j1SO9ghB0gT+Io0Omxr+8J
         53sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728564964; x=1729169764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNnUCyPTi+G8LZCplzDQqmQsNRTnEL4ih2dYIBtqKZc=;
        b=j9OZPpIEy0HXHatgPRjKrje73a9C51av/YStevpLEDA1BOyg01ZUa3C4CQuwdwLo+x
         T1f1GYfToPpIX3bWdkH1hnu5shbYCyJ2kSs8yEpF9VJ8zAPBNK7aT4zAk3dA0HNHuMU/
         c8+WqRXZzRrpLmDxSg8bK7suSyKOOfdqz3hGzneGbSuPbQK0AS6hmkWIWLI1P3XSouEq
         jxx6cHiCFrPVHUa1T053jnFLlVox3u/4bJINUE4U0eiZExa/heoyhHvgoZxELWNiKMfL
         1XWbLXHWx5mcn4I2wZYoDkrqjbdUW7BSilq1X1MmPnaPypNPJhB9W1WQcesB3v/HrDOK
         2Lug==
X-Forwarded-Encrypted: i=1; AJvYcCWJmxVtjzE+Lst6ylHkNEB/51NhKcELLUNaGI9feNtNXSjDHdkDjDiqh1FDKEvIgBUIjOSl+zXDjJ1F@vger.kernel.org
X-Gm-Message-State: AOJu0YytzHw/aSjUcoIum/sDjsq1HoU1/N3k+1Gnd9YqazOCpGzHi27s
	d0uOs/MgChnWeajN2JloGH50/LM40DxoJWo47Ssl/rnmkDQtLxozshmVX9KVhQQ=
X-Google-Smtp-Source: AGHT+IE3OVGS1otAXhVnWrTDRmy9pILODy/3R4ocjn+v7nJ3EHEAHwBirvcqYOXxLoGkanEri2+Jaw==
X-Received: by 2002:a05:651c:505:b0:2fa:c519:6e66 with SMTP id 38308e7fff4ca-2fb187d1e4dmr33465261fa.40.1728564963861;
        Thu, 10 Oct 2024 05:56:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb245b16cbsm1902981fa.62.2024.10.10.05.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 05:56:02 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:56:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, quic_tengfan@quicinc.com, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: add the tlmm driver for QCS8300
 platforms
Message-ID: <yh5qzohy42r226a4e7yupimfdl6xccpntuffot7dnhrftagtae@4ruw5vmcknfq>
References: <20241009-qcs8300_tlmm-v2-0-9e40dee5e4f1@quicinc.com>
 <20241009-qcs8300_tlmm-v2-2-9e40dee5e4f1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-qcs8300_tlmm-v2-2-9e40dee5e4f1@quicinc.com>

On Wed, Oct 09, 2024 at 03:13:34PM GMT, Jingyi Wang wrote:
> Add support for QCS8300 TLMM configuration and control via the
> pinctrl framework.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |    7 +
>  drivers/pinctrl/qcom/Makefile          |    1 +
>  drivers/pinctrl/qcom/pinctrl-qcs8300.c | 1246 ++++++++++++++++++++++++++++++++
>  3 files changed, 1254 insertions(+)
> 

[...]

> +	[125] = PINGROUP(125, phase_flag, _, _, _, _, _, _, _, _, _, egpio),
> +	[126] = PINGROUP(126, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[127] = PINGROUP(127, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[128] = PINGROUP(128, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[129] = PINGROUP(129, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[130] = PINGROUP(130, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[131] = PINGROUP(131, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[132] = PINGROUP(132, _, _, _, _, _, _, _, _, _, _, egpio),
> +	[133] = UFS_RESET(ufs_reset, 0x92000),
> +	[134] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x89000, 15, 0),
> +	[135] = SDC_QDSD_PINGROUP(sdc1_clk, 0x89000, 13, 6),
> +	[136] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x89000, 11, 3),
> +	[137] = SDC_QDSD_PINGROUP(sdc1_data, 0x89000, 9, 0),
> +};
> +

[...]

> +
> +static const struct msm_pinctrl_soc_data qcs8300_pinctrl = {
> +	.pins = qcs8300_pins,
> +	.npins = ARRAY_SIZE(qcs8300_pins),
> +	.functions = qcs8300_functions,
> +	.nfunctions = ARRAY_SIZE(qcs8300_functions),
> +	.groups = qcs8300_groups,
> +	.ngroups = ARRAY_SIZE(qcs8300_groups),
> +	.ngpios = 134,

I believe this should be 133.

> +	.wakeirq_map = qcs8300_pdc_map,
> +	.nwakeirq_map = ARRAY_SIZE(qcs8300_pdc_map),
> +	.egpio_func = 11,
> +};
> +

-- 
With best wishes
Dmitry

