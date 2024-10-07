Return-Path: <linux-gpio+bounces-10985-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F419934F7
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 19:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6942C1C232CF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 17:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF0C1DC758;
	Mon,  7 Oct 2024 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBEiJ0OC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF81DD554
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728322006; cv=none; b=iqtEdSLOwZeMChi6Txt4oo76d4wEpJeCYqnGqrU/Zhg/TyvV/2qnCfdDe7hOMIE/pcJ6ODrlAFexW5c6Ir98ZMjHb1Zp566RCbpJvjmELJs3tZxft7xRtAsiWcpbOmHKMepYe2JPzkotqtOvgWpPtxf4eKccFTAgM6+GZ0JmWro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728322006; c=relaxed/simple;
	bh=f8J/xaTUSlbns5xMC+QDIDb/0E6cU5zNaymgX/wflrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqzeQeZZe8KBxJehihcNjlhkORByfJpnX+ajVWyxorKX37sYjJYi3sZIkH0hpoAKjxpxu842VDqtJU4cs+fjcgjoVidR2YwrwjBdZi95D0+V4wF9Ws8bw0YWYj+n3ZtFDfOGP/u8Duqwv7MUHd8JxhYBqSRX5dXbGign6Iazyio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EBEiJ0OC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398939d29eso5782466e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 10:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728322003; x=1728926803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iaLyid4v6v3RyKRHRBjHKUsBfRZPQ6szoceuABDIEJE=;
        b=EBEiJ0OCgKyMHuBk8fLBm8PZxOVD0QKMM77zc3Hwo4bLZvDJ4qDctkUnZgtTvIHeyw
         aNZqU2vycAD9EAdQ/hc1o45VIaJItMOCLW8fkhLgy9EyiOGmY0NmyHpUCPomoeCc+f7E
         TedDa443U+jasCf63gLU9bZ4d6gLsx1qS340apZXmmeown6WdKnJzri+8tpSYJz8MXgP
         pQ0K0Po5dfStt9NiQV6pOKma6siN3QT6BUL23olnqngmJcpTcWu+JAYWpkOF/lPKinw5
         OiPEfHEUVizclSMWgm8QnQUW33tH6NGjNUSoJ0Kzrk2QbmoEQnl0VldaQILrweAyuHUB
         uPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728322003; x=1728926803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaLyid4v6v3RyKRHRBjHKUsBfRZPQ6szoceuABDIEJE=;
        b=DxoD6uSNOhSEXm3JNztUB54TP/BQn5FrHVht6z94ai+Krq0zwknKAHq8RNjG2GM7ep
         apnokFFTHIlI1FPNsiQx5zoSpXGuUpf8k5dr5X+mx6/K1wsTcKkHBzuw1qz2R2me0qkd
         VVBMVr/dfRA5ox/UTRkpHMbxrZsqNMgiYday4+U8dxTNDClnUs2y1kLU6sqGjx81Phh+
         mZUGnsw3NNDOneHsQ4C9wR2eOcgQl+3MEleasP9zY9TikMZ6+PBvLddxgCXwWhWh7Pb6
         ZXi3bAJWnMDMXgOh19VjT4cmKgYYr9Ysp8ZHVbHY/pu5x9D2tvERQRNuUdQwAyNWJjuy
         9BdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOOnoJlxOzDuQ6ZFZ5clcmJ+/rQG2hX5wWt3Q/hgcTYUKx2HX35w6X/dMmvO5T9HzYT6FArG9fiVdk@vger.kernel.org
X-Gm-Message-State: AOJu0YxF242k0f14mkAJiLBqZZ0sVn7K12W44FWSjABEEcWhBVVFsxHp
	kVf6dyTqWonLpq3Y0rxjsv5NB7qyOEMVFgYiJ7akUSP0bElPgu3CdaaceSL/F4E=
X-Google-Smtp-Source: AGHT+IGjPpE8nKiCzJOR5Dnc2BUe3ootx/puEHX0zXwHC7dqHj9NiHU4iWABJ8pLEYm3+gLDnTIG1w==
X-Received: by 2002:a05:6512:3050:b0:52c:cc2e:1c45 with SMTP id 2adb3069b0e04-539ab858895mr5903268e87.15.1728322002731;
        Mon, 07 Oct 2024 10:26:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff283b1sm892951e87.280.2024.10.07.10.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 10:26:41 -0700 (PDT)
Date: Mon, 7 Oct 2024 20:26:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Karl Chan <exxxxkc@getgoogleoff.me>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 5/5] arm: dts: qcom-ipq5018-linksys-jamaica: Include
 dts from arm64
Message-ID: <wpyw77zolcojvqonwhwsgkyw5xshipdmuk7sr4rn5accx5urzg@6tno6i6iuztw>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
 <20241007163414.32458-6-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007163414.32458-6-exxxxkc@getgoogleoff.me>

On Tue, Oct 08, 2024 at 12:34:14AM GMT, Karl Chan wrote:
> The original firmware of EA9350V3 from Linksys can only boot ARM32 kernels
> and there are seems to be no way to boot ARM64 kernels on EA9350.
> It is possible to use this device tree by compiling an ARM32 kernel
> for getting the kernel to boot on EA9350 V3 firmware however.
> 
> Building the Linksys EA9350 V3 device trees from the arm64 tree together
> with the ARM32 include to allow booting this device on ARM32.
> 
> The approach to include device tree files from other architectures is
> inspired from e.g. the Raspberry Pi (bcm2711-rpi-4-b.dts) where this is
> used to build the device tree for both ARM32 and ARM64.
> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
> ---
>  arch/arm/boot/dts/qcom/Makefile                         | 1 +
>  arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts | 2 ++
>  2 files changed, 3 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

