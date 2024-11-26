Return-Path: <linux-gpio+bounces-13281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 075F49D9261
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 08:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3832838EC
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 07:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F690192B96;
	Tue, 26 Nov 2024 07:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qwQ90EYe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1660539A;
	Tue, 26 Nov 2024 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732605835; cv=none; b=BWLqBf8S2n6yicuzWs+5xGlzPU62tTLFZnHy5ToFDqv16BfVlwbUBSbHEI+0ID9iZw9DPKvrDNue+9trxHDIYt7ruzl+SDNRfPs1tYzXWYH/6tVmehl9ZpAG+0e4yF7xnaP813WyON0giNST2qEp6GWlomV0YpS3j86fMt8X+NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732605835; c=relaxed/simple;
	bh=Wb/+hKHIh7LY07ySKwUV/LcU3Fue0Ngg9WI2NnlHTOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXXT+dmgnioGdBDeTK+jyaG4xKTVoQhKLw3w1d03h/auWus8FVy2cZ7YvGw1zhYEsffxNh6zG/blbsZO4NQgT4YOsLWKoFTMd+cWFRGO73CuM82XwY7UL+yUF4QcJF8+84htdWSCP02FJ6DMbm3GFGoQfvvxkOJ6cMrEv2wUbU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qwQ90EYe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4173C4CECF;
	Tue, 26 Nov 2024 07:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732605834;
	bh=Wb/+hKHIh7LY07ySKwUV/LcU3Fue0Ngg9WI2NnlHTOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qwQ90EYeB6CsXbI+cW4qQ0u12KZgW6p6KGbyvxy2RE56Ep19vbDFwGN9SOzaF4GfT
	 4USObg7RjE4ZlCck9jsTqP+B/Ff/Q6SiSBwTUBSsypRHjRADQ6/mccRJDeE/WNCXDr
	 6QEuAq7gLJdk2AZKlW9DosH9Kq2CaMdaFP9RypJzqtLWx951UayVu9ofUvVNy6qiib
	 THagF957Qapx3276fXt6++RMCXsKkrfzntmNlSwtFaUCSAn1AtN30FTzEnXxZ14q+1
	 ubeyKipzPrdTeBPVZY2FT6UHNbsgI07/toBfASzGMRPveWKH3eOMivfqe516WTHHKI
	 Ufc5hqAWC/jUA==
Date: Tue, 26 Nov 2024 08:23:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: qcom: update spi0 function
Message-ID: <koi3cev67wnswztrax2f56gwbuvousltqegwdkhmojvpcy7xqu@w7g6xebpdzuk>
References: <20241122124505.1688436-1-quic_mmanikan@quicinc.com>
 <20241122124505.1688436-2-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122124505.1688436-2-quic_mmanikan@quicinc.com>

On Fri, Nov 22, 2024 at 06:15:02PM +0530, Manikanta Mylavarapu wrote:
> The GPIO configuration differs for the spi0 clk, cs, miso, mosi pins.
> Therefore, split the spi0 pin group and document each pin function.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> ---

Missing Fixes tag.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


