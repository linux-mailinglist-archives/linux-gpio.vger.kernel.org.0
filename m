Return-Path: <linux-gpio+bounces-13912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2B9F2F2C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 12:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00D6B167490
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2024 11:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855E520458E;
	Mon, 16 Dec 2024 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFpz9QtH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B451204569
	for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 11:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734348504; cv=none; b=VqHyF2E6h1j68HYAASyx3TwS4U3CfBqN7EW+DzMIWXnnZe46WelGc2/M2YWMNH4MHg0brJJvR0YzUCZd9AIKXtyokX5+cPdyiJqedaks5UX/9R6lx0l4krD3roqEF9KHKBYZrfNueo5vNjrCrh+axm8XBI6hDC7WaEL7+YWEPHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734348504; c=relaxed/simple;
	bh=nXUDKm1xa9BISvUfDdmposybSRYZG//aVztUGmzTPWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nk5ZfONP3+aOpo9ctZ0swJAKRd1FhNChSDiXksf21wEhmytqpz/f1WySXr4FRIvPWfjS5yx9snEVAjW1MFi0L5CnEAq8wvosdHGiKMIAtSVynPSUULjbtIRcxNKpCOoC6eA1NU4NAJlDYFOrcyCmqaZBV6tYHQ4HqzVgiCiKzgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFpz9QtH; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401c52000dso4444207e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 03:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734348500; x=1734953300; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sSbdGX91gG90sHx6RuV31TaU8DxtCwQolrhH6++8Lks=;
        b=YFpz9QtH/rLFZ2gOMMutjAulB5NuMRNPPen9LDRJzwy6Z553B0BRrWw7PSoPfckb8f
         bL9DVkVRVdyMTwZ6DjGv4IDV2rYA6YJ0of+UUt53dE7LXjKARp9xogc/ko64wklBBdgk
         l4yhuLTd3D/hQG3x//ZfqT0PfeCbOcGB6XtNwoGvRgnaJEZS3iaem7a76TKDeqSxv05E
         I8iHXboqrHOjyJg1DeKPUNew33XbmFaGIxHpV/wAzbAVKMpt8clzPDbxSFHVxeRu8+7k
         Ov63lOT+rp9iG4iBFxq1FwvyUztmk9ZyctMf79jlwZ8Kw5N9xIuaJ7L81j+FfJoG+/si
         lRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734348500; x=1734953300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSbdGX91gG90sHx6RuV31TaU8DxtCwQolrhH6++8Lks=;
        b=UEW3NadGNtyGwwlHhx67UDSd53YXPC7zFlobvVZIi614CtwveTNgCUh0Wi9BKbUfgu
         nXzG0nALcpPaBZdBjmPgAnrmLyHFscUfCWVMvfzmly9/5/ucF0zPm789LwLTGWSjUCQU
         /9YTU+AZQilG/ohKzmpz+jce/EFTiV/DbQsFztHyCvsJFgyuegG4FetxYGKzl4az2kmu
         DO1PbMjzOgyTD10nqwjmuUC1ITMztrkMYFoG1SlKS8MgfYuM8OUU6fJCqlzR78obIKBz
         I3qFIiwodKrgf4SA2SWTnmSXUVZ6euLMeodX33/Qtk2pVgLuEVG1faO5DSW/BzwF+VM9
         2hkg==
X-Forwarded-Encrypted: i=1; AJvYcCUJVyWXk7FPt5fxeORLYz1sfi7qu7TYOcXKf4rlC1/Ik9qTI6Uu9gdYB+vGXoxGIMWQZUANcd9RI9Ga@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv8QbCFinPf1s1v7Ymj+Ss/Smzql0UZ+NsOayIna475yAauUXP
	iLRxXT3lubiRfwmkEfhraneQCG37Dz+ysuZ7D68hB1B+naC8OOJIB3brcw8wHec=
X-Gm-Gg: ASbGncvu5zX9D+5nQ8xWemuWuHHK4VbjhBzEojlc57evJPDD+pUrLPXNC7DzIsc+gcn
	OspX9innDQMIi5HXqwpEFbqgOeZmLNru12zFaORIsAl2ybd4fNdyoiP5u6qj4X9PXk+rcFq6G1V
	hIpEWnlGpHDmLvBJAJrxoirVSJ7HLg3PrzdCUEhSg6Wxs8pb7Wu4E6T6O+tzGYbkmzo1VJEwLdW
	8prVqLVjeVm0b+gJQ2Ill39NxcJ50XykJz8q0A/JM38TkceAYjBa5wXY/tTI20gUErTux+7Bt08
	cOkv4FO+P347C1ZV46JNL8H7bq7s/5dJ8Kri
X-Google-Smtp-Source: AGHT+IEbEsjwcnz1TK8W1eXH/0K0D9rb1zgZUMvmHY65rVYyO7hxDT25NbhReV0v+nMszyiwBrmq0Q==
X-Received: by 2002:a05:6512:e89:b0:540:5253:9666 with SMTP id 2adb3069b0e04-540905a7063mr3620892e87.46.1734348499739;
        Mon, 16 Dec 2024 03:28:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9e02sm812506e87.100.2024.12.16.03.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 03:28:18 -0800 (PST)
Date: Mon, 16 Dec 2024 13:28:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Dang Huynh <danct12@riseup.net>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v9 0/8] Add MSM8917/PM8937/Redmi 5A
Message-ID: <vfwisdkjg3czwesi6yqaznvxcz2z5ksqezhsh6ytrc2g2ypszy@wqkr5cgr26vq>
References: <20241215-msm8917-v9-0-bacaa26f3eef@mainlining.org>
 <CACRpkdZ-ZEiGMUPObHU=kw=OUADrRGtxgMc-QC3EaBevp-Shng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZ-ZEiGMUPObHU=kw=OUADrRGtxgMc-QC3EaBevp-Shng@mail.gmail.com>

On Mon, Dec 16, 2024 at 11:33:30AM +0100, Linus Walleij wrote:
> On Sun, Dec 15, 2024 at 12:15 PM Barnabás Czémán
> <barnabas.czeman@mainlining.org> wrote:
> 
> > This patch series add support for MSM8917 soc with PM8937 and
> > Xiaomi Redmi 5A (riva).
> >
> > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> (...)
> >       dt-bindings: pinctrl: qcom: Add MSM8917 pinctrl
> (...)
> >       pinctrl: qcom: Add MSM8917 tlmm pinctrl driver
> 
> Is it possible for me to apply these two patches in isolation?

I think so. They have no external dependencies.

> 
> I want to make sure the patches get moving.
> 
> Yours,
> Linus Walleij

-- 
With best wishes
Dmitry

