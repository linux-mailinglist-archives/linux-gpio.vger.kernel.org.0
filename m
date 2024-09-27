Return-Path: <linux-gpio+bounces-10491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1EF988106
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 11:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABA831C20F88
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Sep 2024 09:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833CE18A92F;
	Fri, 27 Sep 2024 09:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hg+L5Rs1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9AB188A11
	for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 09:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727427732; cv=none; b=t0p+Zn37rxlsfrry6FQ8Vw66BXnKg/7gU35WSbDTb+EESMb7Q/lz0S7ORrI81PbEqDLrtF4k02n/pfm2Euj1Ru4ljreWFKlwGRukA8n5nbxLOB+1U9oQXxWclskct2jIQ+RpSRetdBzpxHqVf2Gjlax0+T0s/b5rFFO+2jrBs7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727427732; c=relaxed/simple;
	bh=OzTlkDrZ5UNBFj2egyQHy9ztwtmLwwcWSRs7QSGkC50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suNqBVOmmbXsN7i3/8R0p4+gDcdrDSMoYbZn4Rhf1NmD5PWU3WRmK5bY6kyTyBOSsAqQOj34z/fUfZCXABaRxoFeyIx6pMGNDo8iPk3GKLoULtPrQ0Fn15A4fLw+VNeWZuv0xQaYMkYLQse+WfNusTkDg7R47XSuTLZ6UAzTZek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hg+L5Rs1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53659867cbdso3075548e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Sep 2024 02:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727427729; x=1728032529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JWb73ryEVZ2J3BVL15FqHfUHxoOk+Qe9ibuCLa7loPI=;
        b=hg+L5Rs1pReWVvspjzeOE+foIQAtENSDFZU/5kgir7LJKflnOTlFKzbJoOnFgvNCbD
         cSamnnba7WGZfdYRguBTPftPWvnqP7Q7CXt1MnTW/LOxYDCTtAeUEa+IDDzyt9+BxCwE
         z2MVIuvjSmpSoMqWIM4YJXZf2qUX3hD9SxBtoXQvOYQP3qDoUT5OCYt3wXlga0oK2Nld
         c7GtRxXDydCFSR0alay70Co9JJYNOKTy1/smdh1fsyiX5z12QHcl/Yp3jXnbmOBfB8o4
         1sfITV7OT4KJmLq9yaahgi+RQaZRrCVbhtuAo4ne79kQQsrNxQ6NtlZcAjb/wrdzYpqw
         Kndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727427729; x=1728032529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWb73ryEVZ2J3BVL15FqHfUHxoOk+Qe9ibuCLa7loPI=;
        b=BNfrHDlFe+AUhEidEqYYXb5me1vE+oqgzy21P+LU7uaaSts0P30UVFtd6epxgyPoso
         7Lp/vBPk1j7iFhGLuqCCHNqSiIwUN6BYnJtZr7bdJjhwC0ZDK5fZABvMLwFf++EkEK3M
         zX/DxwPsujWg4oydBUKSqnDWxUcpYNYOU1j2pe01wzPq7ni+OewKcDd//MpGrS7NcPSj
         wAYrDJNjnlGbwQOZiKs9gdPT/Cpl8daQrxp+Q7QMnfi+HvkJLploysRmNVGSHd/+xqc5
         Usei7g8LU5z3VVXOZLqxY4vQItbazvivydQ73NBSDwjSGmlxKvuWuedY7nrk+LJof+Hc
         oXvg==
X-Forwarded-Encrypted: i=1; AJvYcCUbe7XJESu0pepHMs9qpKy600diSsGU6HVfz7M3LXunbftytJ31VpcK/t/ZNmA+hrU3g4d6037Hqiop@vger.kernel.org
X-Gm-Message-State: AOJu0YxgxouylvBefPnt3VOr6qVIm09+PI4HKXMZVJ1mGRVmuv2prawr
	F7JHXNsrm1fkhbuhuyMHxug2j9e1pgHc+VLVEt0f+3NJr2UAFpTOn8zJQrJ2Qxk=
X-Google-Smtp-Source: AGHT+IFdzeCd6YYS6wM/QqC+S3hSNA2f3XY8BHe1b5ScvCd2SfMlzBQM0TBaxSb+NfI+Cw6mQEmOgA==
X-Received: by 2002:a05:6512:eaa:b0:535:6a34:b8c3 with SMTP id 2adb3069b0e04-5389fc34366mr2411280e87.5.1727427728569;
        Fri, 27 Sep 2024 02:02:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5389fd5e3c5sm233552e87.106.2024.09.27.02.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 02:02:07 -0700 (PDT)
Date: Fri, 27 Sep 2024 12:02:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, neil.armstrong@linaro.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH V2 6/9] clk: qcom: add Global Clock controller (GCC)
 driver for IPQ5424 SoC
Message-ID: <hitzcz3gjp4mywesnoicjnv4sfy4sckgepbl43bjjndp74etpl@adnjplfj3pfg>
References: <20240927065244.3024604-1-quic_srichara@quicinc.com>
 <20240927065244.3024604-7-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927065244.3024604-7-quic_srichara@quicinc.com>

On Fri, Sep 27, 2024 at 12:22:41PM GMT, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add support for the global clock controller found on IPQ5424 SoC.
> 
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>   [v2] Remove CLK_IS_CRITICAL for all clks
>        Added CLK_IGNORE_UNUSED only for gpll0 temporarily till

This should be gpll4, not gpll0 (no need to resend just to fix the
changelog though).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>        dependent consumers are enabled
>        Fixed probe to use qcom_cc_probe
> 
>  drivers/clk/qcom/Kconfig       |    8 +
>  drivers/clk/qcom/Makefile      |    1 +
>  drivers/clk/qcom/gcc-ipq5424.c | 3309 ++++++++++++++++++++++++++++++++
>  3 files changed, 3318 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-ipq5424.c
> 

-- 
With best wishes
Dmitry

