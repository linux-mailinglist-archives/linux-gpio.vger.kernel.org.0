Return-Path: <linux-gpio+bounces-14332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9432C9FD9CA
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 11:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47A74162BE0
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Dec 2024 10:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01DE13C81B;
	Sat, 28 Dec 2024 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayZG5ZjU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB5035952;
	Sat, 28 Dec 2024 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735380637; cv=none; b=pQXyRL89BEe/HLh7HOn7RVULqe7vWCQ922C7ddjoRlm1VVDNYIL6uLVYUQKiRbPO+BMM/kYGGmUqeyqQqgRiCvt9tB3OOKacNg1Vm4epaPj8xhN5TrFFRUVsQD8GDNh3d/G4OKUmXR93g37EQO5M3aujwT0LI4AJL/SzGEiluMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735380637; c=relaxed/simple;
	bh=r6gRgb+HzWyUI1pVVSyjM3Qgva8ccc6sKs1xaAlm+wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAt/EPTvI66uZ53EdT75+TjrBvv378Hy4JW+F0UyjTrTnkCw+McQbEtIRVDF0Rii6HqUtfgMrlRU7uVGU6UFeK73kStijmzMFHE7dRe74j2Ck1di+dAnDXLqf0BLUEDOw8G8O+22x3DWbD+xsV0oD/BcqgZO0iYamHlROR7xjhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayZG5ZjU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2031EC4CECD;
	Sat, 28 Dec 2024 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735380636;
	bh=r6gRgb+HzWyUI1pVVSyjM3Qgva8ccc6sKs1xaAlm+wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ayZG5ZjUTXCZZGSJlNbFTIB8JDV6uShrNgsiZ8q0bwL+4juyGWBkdHxbxbRxJa11f
	 DlNHLjczcC38UROuVoXz8WffC00F0mJQukoQIf930w9oHoOITIcyLuXVftpgqDXywc
	 MfeSqUKtApVn0/MkeZ3VDpPnwN8latZMLLpI9SDLPHRTTBcPJgl2bgnDVMKNE4Od9Y
	 /XLg23NnkA7982EvrHndEkHCl1NHk8sada9b5l/I1taNulYM4+mFWf0gmBbqTiLgfi
	 CgRM/SwCCXPxcuFD/4ZSIpwLt7k20gT24EiZT2q8NFhADxVjmLWX54hHCUr54VZwq3
	 FMKoXtZ9DKtGg==
Date: Sat, 28 Dec 2024 11:10:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, quic_varada@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH v3 4/6] clk: qcom: ipq5424: rename spi0 clocks
Message-ID: <lfau6kvsoeq4cpwbct2cxk4on4umw44gahoitmk2kdaxmcin4f@fudkimyrmjln>
References: <20241227072446.2545148-1-quic_mmanikan@quicinc.com>
 <20241227072446.2545148-5-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241227072446.2545148-5-quic_mmanikan@quicinc.com>

On Fri, Dec 27, 2024 at 12:54:44PM +0530, Manikanta Mylavarapu wrote:
>  			.num_parents = 1,
>  			.flags = CLK_SET_RATE_PARENT,
> @@ -2862,8 +2862,8 @@ static struct clk_regmap *gcc_ipq5424_clocks[] = {
>  	[GCC_QUPV3_I2C1_CLK] = &gcc_qupv3_i2c1_clk.clkr,
>  	[GCC_QUPV3_I2C1_CLK_SRC] = &gcc_qupv3_i2c1_clk_src.clkr,
>  	[GCC_QUPV3_I2C1_DIV_CLK_SRC] = &gcc_qupv3_i2c1_div_clk_src.clkr,
> -	[GCC_QUPV3_SPI0_CLK] = &gcc_qupv3_spi0_clk.clkr,
> -	[GCC_QUPV3_SPI0_CLK_SRC] = &gcc_qupv3_spi0_clk_src.clkr,
> +	[GCC_QUPV3_SPI4_CLK] = &gcc_qupv3_spi4_clk.clkr,
> +	[GCC_QUPV3_SPI4_CLK_SRC] = &gcc_qupv3_spi4_clk_src.clkr,

ABI break without any explanation, real justification.

Best regards,
Krzysztof


