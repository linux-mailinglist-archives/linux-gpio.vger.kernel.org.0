Return-Path: <linux-gpio+bounces-8680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB01F94CCC9
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 10:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 218FCB20F66
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 08:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B7818FC85;
	Fri,  9 Aug 2024 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h9MN/UHR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A43318F2E1
	for <linux-gpio@vger.kernel.org>; Fri,  9 Aug 2024 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723193945; cv=none; b=sSqTYdADzwN25p0vZ1HxA4Tz7b/42PNf2g/eTABpX7x5OtOqd4qdtYz68WWOZiY0k59pAQ2/pdYL6+guF9M3mqDy59aODofoEjuidjExR5Z4p4UVlTY9CfPnmwE5CiELAEcjCbCJb9UYpl+hTPDqPCycSFGLARxPBElBIcA+mwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723193945; c=relaxed/simple;
	bh=lK2xl6KyTi2s5yaupefvwXgJ9xcHGS6tWSN3gQuPuBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PA3VSEc1m/UC1o6rZPE3b3wpvzSKVr3dHtEx37Ma1c7OrMDY027kdhnF8W1Jp1lM/qFLlPSF1VxfEXNtXT0uqRIZ7nVYR+2n/aqBHlXJf6W4aQOibc0R6L2YO9g3cZcYpmZB/yNJ8AaYgFAw7gT9rQuBjpI2NNNrwKa04oPWm4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h9MN/UHR; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5bb85e90ad5so1660855a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 09 Aug 2024 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723193942; x=1723798742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y29XsGoEBrWtW+8pv1a0Cy2W/65r6eteamsegCWD7+8=;
        b=h9MN/UHRrl/jVLDrkOl+ITEZxg/jmx54qCMb75o0gC24FGpFJdapuOp2q7RbIpT1Wg
         ZsjjJZ8Eo8dJM/3ggaFhYN9VDXNI1WP4bSQqH3PZHpb5UxOZMgZmkfwjR7Ba7/RbLWuz
         b1GuSiksgZo/zYjuVc0HiCoJC1L+7G/PG4uiXxwiFnRjhopWji7HzxdAh+aGtar4CCnk
         asnReYrMvU0XJC/6idTwJVFjrei1QCDLvo1oZy1/rUNvXmyrB2utkS3FI1y0AzLti0he
         s9kvxkjUsn33KkRB39V231/hw7fdaiR+2kzhYNcTt+h3Otvfk2dfdmaUfmKf2GWXUQzu
         qU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723193942; x=1723798742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y29XsGoEBrWtW+8pv1a0Cy2W/65r6eteamsegCWD7+8=;
        b=JUhku7bJSJlcNCITXA0LVHnSMSInoF1a/uiuqeOkusM8xscPf3K4Qe0ixvFHaviR5w
         FsxpuakwfykP0vmZSZ97rokDFq70T4pXhD3BdZcIVn/9bPPaMlfiWsR4oNVB8mb1hbz2
         6fkADX3Gr4oIghradoQkjmyS3MI4aLjcOX/RbiqL6upfH3JYUjxiIitWiJKF9vPI4xG7
         rgajU8QZ0bcqZkp4RDcNuxurDuT77/KDqnR3BgBGGFA0EqOEidgBcufKSksVZFh10q2o
         nG1wLmg67xRKyEsgnJWEXB28yxxfuidITft6A5A5X4nZrVV7LEsymN0F5AY3aVrf+ZZw
         rtXA==
X-Forwarded-Encrypted: i=1; AJvYcCXIzBGdmid0ZBmamyw914WMT+XlUREDsK2cXzgpKZqGFhGB0cLMJ7TuQRvEwScDppONqb1cBfWfvQgB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9XB2ZE15atvBDoO9SQTyF0YTk61F/yoi0VbMh76PfuUpno9Ew
	snE0IiNw0WZDedhRPUkWdiRFNoIZsmuPZZuRNEOPbAbtf/pVWXXMEbXH4/LaZaarVPuZ9AdbW/N
	u6Ck=
X-Google-Smtp-Source: AGHT+IEm4B7KEbbYZpTWE+SXfvbTwUGi0cG0j9nLMDU4o5bCAdcyXvGo+95gVFv7Ki5MvLUURp67Fg==
X-Received: by 2002:a05:6402:4408:b0:5b8:34a9:7fd8 with SMTP id 4fb4d7f45d1cf-5bd0a643fe9mr674923a12.29.1723193942195;
        Fri, 09 Aug 2024 01:59:02 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2bf85fbsm1341522a12.16.2024.08.09.01.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:59:01 -0700 (PDT)
Date: Fri, 9 Aug 2024 11:59:00 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Fix special pin offsets
Message-ID: <ZrXaVLyorJEM60ID@linaro.org>
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

On 24-08-09 02:22:04, Konrad Dybcio wrote:
> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
> 
> Remove the erroneus 0x100000 offset to prevent the boards from crashing
> on pin state setting, as well as for the intended state changes to take
> effect.
> 
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

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

