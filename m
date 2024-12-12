Return-Path: <linux-gpio+bounces-13809-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2279EE31F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 10:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D06E162DDF
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 09:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A9B20E33F;
	Thu, 12 Dec 2024 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RQXHOvsN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C8187870
	for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733996086; cv=none; b=po7YFGStpK5/Ni7mS1MvfRD8NxnVbn7F32P1mts5zMPcamPFqAECma+BQ2vH4tKxFqDHfZ6Bh60XyDD+d8DV/D36xiLwzxeQJ2JUC3DTkr0E+GOrbw4/MyXjcLsRvXSXapzmqxwNGbUd2DJYpmO5tAFbelq1SwHlUTvnFF4dWCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733996086; c=relaxed/simple;
	bh=VppiEC71iSiVaMU4csmiMBmKCcacxPVxHFurn9yQxl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gpn0ceSEca/zAZYgFqG95QnnO7euRzS5GMnwm9oJvvELhb7Ty9HJHv/ICNb7/UYyaXhpBdaKIuwXtUsoWCvJXLM/njdwDrMwvS5frE2feIg2Enx2NvgmtSo+ORSif+9aa38gM5EmNwArnNqbCA9gfzsmkR0JpsjzYZIXOYIb7lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RQXHOvsN; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30229d5b229so2956281fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2024 01:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733996083; x=1734600883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xpy/CwxbVse7VurY2aJqzrYBxP3zeCul6ZdOEgv8Rdw=;
        b=RQXHOvsNslQl1jpCD/RJH+wazhJnF9vY1KB3VfhK1xRwXp01NTj27Qgd6EDiQa0lqJ
         7YXLjSu1LX3AGUzsIsAT59rxfYBe8dkEdBlhfpRlq3YRXSlui3HXJGFa3Vco+Edu6o2o
         j4ItZeTmlaSsNmVXicNcCG7RERPFe/QXakscyUbHbXT9QhhZzSCB63t+N0cKsaFBWPit
         k1PLspP+Shc6iMZRkMNRZ/iHhrbLd18joJ1YZQEbac81ORU3bMZfw7v36XFWjalFCvRT
         T8BaXC2AuhLJeRTXMUaIlWpMtXRfmzxdHf8DRw0Xt1T9/Z3lCFYetLnrKjCIYl1oL4eU
         vEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733996083; x=1734600883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpy/CwxbVse7VurY2aJqzrYBxP3zeCul6ZdOEgv8Rdw=;
        b=r+MXDb2z4ROX5VL2yPRr94zl0MkH9aBFvCJZx+DJpPiZPSDVL2bGaOY+ra/KC89mRw
         7GSSE4R3dlJkXs1EpprgH45O3aQvMDuN6j0lHI1wtcT9ne4CeK47o8fUoQ5FLTo9TgcT
         l9WN8XxUN3xX/ycRZJj7HQ23ISh9K4csh8kh01qW56tTYWVgTvo5TFb9uEA6jaxUy8oi
         cpsdhbwxKeZXH+oAUKpYZwK39jgEADnth++712MdwUwxCc59aHGQ/GOGVc0pJd/OxSt0
         RdHIoAb0WSjSNhFOJYCvUoWUu7oaFH4k5ff1d6rdupWK91KyzbRsYJdmz7CyiaEFeshW
         1DqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSzTs9c7IJR6B4XVTXd/Ks81o7J6mEM7PQ6NxemCSPGftTSLSCG3kDdEi5AFQb13GihawVtIdxWKpd@vger.kernel.org
X-Gm-Message-State: AOJu0YxIS8Ai5i23UlybFXtadUbC4ola7N4s5mrYlvaH6dUxuOtQMY1u
	kKZYhofTkP6uNteyVUfpK0IQL6A+Un50FaSmmdh5Z5H04zxCqTwFlrIw2h2C+r8=
X-Gm-Gg: ASbGnctXw/fJ0Eid5z2EQyjkahv30mzFDAm1FLfLuHNXp3CnnEO/UD+OwY6F6+64GXp
	J1X6tkwEZdjIcJG/XjRzdM9xvdvySkJqhUlsoQrN3EsuDL9rOCbyUBMesIkWqBRJ2vzCo6yOZHd
	pEZo8tUF6Y1yPbevrSUu3kTJeUhFGdoWGf+qulllm0z+g4p9b7kVKE0FYRt2V7OHRq3dYD401cX
	cJV+CmZJddn/b/khS9NcnfCDXhwrcFdqr1zSJXVJ641Sbi4mjLFog6ycDRZVLTK1WJIY6L/l7Ow
	sTmDpYHPhGiD5XiY/lVf6STtCouRv0GxE7Fs
X-Google-Smtp-Source: AGHT+IG5e9iODeyp5V5+1N/IJ6G9IYepmGYw4xB3atGT4gGgPPoEAvSwa4ZeH2rdPZSRW31u77cZEA==
X-Received: by 2002:a2e:bcc2:0:b0:302:17e7:e17e with SMTP id 38308e7fff4ca-30249d15d89mr8746231fa.0.1733996082664;
        Thu, 12 Dec 2024 01:34:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-302254022aasm11565491fa.109.2024.12.12.01.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 01:34:42 -0800 (PST)
Date: Thu, 12 Dec 2024 11:34:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jingyi Wang <quic_jingyw@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 0/6] Correct the number of GPIOs in gpio-ranges for
 QCS615 and QCS8300
Message-ID: <ccsuwijfrspm2a2irycsicqepjhwai5pfvgkd5dcaf3nhmqwui@hels74qjkiva>
References: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>

On Thu, Dec 12, 2024 at 05:23:59PM +0800, Lijuan Gao wrote:
> The UFS_RESET pin is expected to be wired to the reset pin of the
> primary UFS memory, it's a general purpose output pin. Reorder it and
> expose it as a gpio, so that the UFS driver can toggle it.

I don't see pins being reordered. Please correct your commit messages.

> 
> The QCS615 TLMM pin controller has GPIOs 0-122, so correct the
> gpio-rangs to 124.
> 
> The QCS8300 TLMM pin controller has GPIOs 0-132, so correct the
> gpio-rangs to 134.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
> Lijuan Gao (6):
>       dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs615
>       dt-bindings: pinctrl: qcom: correct gpio-ranges in examples for qcs8300
>       pinctrl: qcom: correct the number of ngpios for QCS615
>       pinctrl: qcom: correct the number of ngpios for QCS8300
>       arm64: dts: qcom: correct gpio-ranges for QCS615
>       arm64: dts: qcom: correct gpio-ranges for QCS8300
> 
>  Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml  | 2 +-
>  Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
>  arch/arm64/boot/dts/qcom/qcs615.dtsi                             | 2 +-
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi                            | 2 +-
>  drivers/pinctrl/qcom/pinctrl-qcs615.c                            | 2 +-
>  drivers/pinctrl/qcom/pinctrl-qcs8300.c                           | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> ---
> base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
> change-id: 20241211-correct_gpio_ranges-ed8a25ad22e7
> 
> Best regards,
> -- 
> Lijuan Gao <quic_lijuang@quicinc.com>
> 

-- 
With best wishes
Dmitry

