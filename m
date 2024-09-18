Return-Path: <linux-gpio+bounces-10247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE4697BEEA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 18:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26F041F21F13
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Sep 2024 16:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B121C984C;
	Wed, 18 Sep 2024 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKFxjwIr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8E9135417;
	Wed, 18 Sep 2024 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726675195; cv=none; b=rKqOkslc4FNvsIFNf8OOJJiD4p+Jc8wWNMt9yJVHs7K6vASh7709YsJFyZXnVLrYy2roDU5JSmxdMIu6XfBoYoAm9PwUMFXagqETpkb6CxC2CP31aYHntEUv4b559hOvrPtgW1sYIjDM0HvvPDWjWfYTfHBfGJuvNyHHD+lYOyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726675195; c=relaxed/simple;
	bh=ssd4E4Wy2aozCylFzBRUOCL2VKurwdQ1PJbDrTEpjTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkZ2SQwcz/Bb4M76aF5gnrhLQv0dgkYYLMz4IhZDI8QssHsOTdL2yxjhRbjfFpmVByJEAi5o48PUQvN3VGxHm1yhKAeRiC1YD3Fp7HphQXsXJl56Ubdw/JlaPhHyt/0EOcAv2DtQNegwvYQUhKUyMLiUSge9y5vw6ZbiRsabwHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKFxjwIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B47C4CEC2;
	Wed, 18 Sep 2024 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726675194;
	bh=ssd4E4Wy2aozCylFzBRUOCL2VKurwdQ1PJbDrTEpjTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CKFxjwIrRk78SIysyYh0LjyrBjd3sXgIx2aSLXxNVQT1dtaivS6GrNlIDiAgZ/UJb
	 duIyBPDsm4/GwEjuPd4eaDCPcwYPpbKrdjWMKB8go8dApxsk4Z3vwNxDx+tb+239dl
	 jEsVl11vj9YcLSg4Q8DkRyE1ipkSPO/I6hzgaSM/LjXrcdjquPXaBzgQ7rW/7Nf0/w
	 eBEVkEj768XVN3WrQxe5/TSvQYfogGg7Wo0f0xe/W3I8EjTVBWcOu0YcgCRLPcYpv2
	 X+/7l3vwtp4ujGpc+v8LOg1MXF0c6p8AB4aMu3KgWrn/IyugTegejAK3RxhblaVNHf
	 U9VficBLfsfZw==
Date: Wed, 18 Sep 2024 10:59:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: linux-arm-kernel@lists.infradead.org, konradybcio@kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	sboyd@kernel.org, ulf.hansson@linaro.org, catalin.marinas@arm.com,
	neil.armstrong@linaro.org, p.zabel@pengutronix.de,
	quic_varada@quicinc.com, linux-clk@vger.kernel.org,
	geert+renesas@glider.be, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linus.walleij@linaro.org, devicetree@vger.kernel.org,
	mturquette@baylibre.com, andersson@kernel.org,
	dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 3/8] dt-bindings: mmc: sdhci-msm: add IPQ5424 compatible
Message-ID: <172667519255.1651891.3292301883331382762.robh@kernel.org>
References: <20240913121250.2995351-1-quic_srichara@quicinc.com>
 <20240913121250.2995351-4-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913121250.2995351-4-quic_srichara@quicinc.com>


On Fri, 13 Sep 2024 17:42:45 +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> The IPQ5424 supports eMMC with an SDHCI controller. Add the appropriate
> compatible to the documentation.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


