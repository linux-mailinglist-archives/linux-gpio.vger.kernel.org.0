Return-Path: <linux-gpio+bounces-10986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555019934FF
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 19:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 866E31C235E1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 17:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796691DD871;
	Mon,  7 Oct 2024 17:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jkA+jjWf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B7E1DCB06
	for <linux-gpio@vger.kernel.org>; Mon,  7 Oct 2024 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728322104; cv=none; b=IIeZhufSGAeb0/tbOASNGvmgaAQ5SlkIG4qDoDZh5qrm7IoNJTVZgc3Y3ebG5DDTOr+k7vvqTHDKmpYm7PxC3KUuZWW2vKaQCCMX4nD/WiK34/tj603xsIqBokBVMxtH96/2bjKRMwAPDf4JFKXVHou/ZZLqOkJI/l7hsPMaFxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728322104; c=relaxed/simple;
	bh=eihS6TG9sOicZxVq7FC5zUYqLhMxZKk8b6Q/6MFIiyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSpFrezjL/TESJwDI5Kg9lJ15UiDEoEwu4kdkIj5M9isvgbk5P4blx253a/0UuzHK7CeKCkSwkGU9jQXayEwUIpACAYOSdph7Q8bmAvswMew8rOez59bIJPzZFJ4hJ0d4sztki9/tjznZTTM7cj1JRBoglxPUjGSwZQMcN1pL64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jkA+jjWf; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fad784e304so57059901fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Oct 2024 10:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728322100; x=1728926900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXNyRDdO40KsorjoROOJqGTRnV5NG+6TplQFkMTm+P0=;
        b=jkA+jjWfd1wXEL+Ya2ppWYkq1Bn74hkGyzQ4Bi/ykA72gUfBclSD0mfXcZsj15A/3q
         M4IjHORSjdcPL0dQtzLB3YAr2WgZZHHAUd6PEY7OKrj2fUWXTKO0O6Q9ntKg5D2hiF4V
         MbKTlmuiHruFdpUIlgZE0yW6YGoPr4LI9NYFvGasouqU2Sic6iF1oESPXF783uQRh9Du
         SDwDHebDFbyvKkDZZKOR7xK8xd4M9HycLRxWdcVqf632yGEgN00cLYWMvaMlYWmwFN39
         2zgOcQs2vXGid+mHcgyw0rNZjWmtdHkM7kSjicW7f1Z8VL4DlP/8DvYeIwZpYfirmNGY
         WFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728322100; x=1728926900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXNyRDdO40KsorjoROOJqGTRnV5NG+6TplQFkMTm+P0=;
        b=GuPonZPJ4QypIBwH5DGGVgg5G3gnzdgYvZejBn5tdGC9qmp9Yv9xDU0HKSqOxd/MTN
         ey8PDoJG9W2RqI93HqGYSh+DbPDcSWf5KLOGIHM6hwKzDxhpUpHy4RegcmT1s506B7p0
         e3toLU+1cPN+aXPUwAo530s2nbNGpI10erK8K/4Es6fUlNQvZjqva3675WDFguVgIJVT
         NyNjuRdqUQfJbOMIssx2N/n02D87auSGTBSPl5PUrfQuIpFtfSp6xIF23F4h+s0NmoJG
         HouTuTTj/puAMst9ps1FY9Ml3CeD1yie966c8MLurQuYGue+laconIRdLLsifSvfzVdh
         tsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFIaDOuZP7ViYciNmOh6opSKVtzhJ1BauW8O8iqKJjzUZfR6ZNMvIEx3Wd3wYBkiGhajaPWuXjsoN6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5+zL1TMmEaXJRceG0N+kaf5gb4bAyjflRw5IeBKwqAfze2zL9
	06UDXKK0Fmxj7QG1EBMaW9Hyl8Ix2gwwqOOt9QZC83p6ztxjCgWqruCFd5zbq9M=
X-Google-Smtp-Source: AGHT+IFa8X2yJwUs868d9QR9d4bZPFRttVj19i+vFYbPX91oAx08bCqYkiwSIpoSe3hCZ0CmoBUzaQ==
X-Received: by 2002:a2e:b8c3:0:b0:2ec:55b5:ed45 with SMTP id 38308e7fff4ca-2faf3c420b2mr56549151fa.24.1728322099500;
        Mon, 07 Oct 2024 10:28:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ab1690sm8765041fa.12.2024.10.07.10.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 10:28:17 -0700 (PDT)
Date: Mon, 7 Oct 2024 20:28:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Karl Chan <exxxxkc@getgoogleoff.me>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 2/5] arm64: dts: qcom: add Linksys EA9350 V3
Message-ID: <2lumlvmn6244rn7imm2zeluglknnpaufjb3oqz7n672bmsivst@rn7nlv3do65z>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
 <20241007163414.32458-3-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007163414.32458-3-exxxxkc@getgoogleoff.me>

On Tue, Oct 08, 2024 at 12:34:11AM GMT, Karl Chan wrote:
> Add device tree source for Linksys EA9350 V3
> which is a WiFi router based on the IPQ5018 SoC.
> As of now , only the UART,USB,USB LED,buttons is working.
> The front PWM LED require the IPQ PWM driver.
> Therefore the PWM LED isn't configed in the tree.
> 
> The original firmware of EA9350V3 from Linksys can only boot ARM32 kernels.
> However there seem to a identical device that come with 64bit firmware.
> Also There are seems to be no way to boot ARM64 kernels on EA9350.
> 
> Therefore,the only way to boot on EA9350 V3 is using this tree and a 32bit kernel.
> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/ipq5018-linksys-jamaica.dts | 109 ++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-linksys-jamaica.dts

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

