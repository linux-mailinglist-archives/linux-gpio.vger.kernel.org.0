Return-Path: <linux-gpio+bounces-11591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D71759A352C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 08:13:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 112411C209B1
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 06:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDC917C7BE;
	Fri, 18 Oct 2024 06:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fM05fGoB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F6C17E472;
	Fri, 18 Oct 2024 06:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729232009; cv=none; b=IJFNvIOcStUxhPZlyG8R0+LQ8CiXK0iEc/Yu2Aw3mqcZoXPOtltQtLmUGUTu3HwX7b7LKLZIWuA0ejJmufnPM5N4NP4oheZcHkKcSkqWM0T0+NYlSgg0JpvMd17dZuVj/5VbZQ1PtOKS2XMvicLvtkVzGLjDkbi7OFEOm2tDvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729232009; c=relaxed/simple;
	bh=bZLOC/ZzMRQvVzfU62T9+VIaJXK16VBix/E/EyBQ5jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FB6Q2CQanre25PXb6LHM+aIrzPktWyG3re3EmFOzz9ftknNyocryktbEfOBsuj4PjA/mbvU+yMQmJ5iSEdRi04K/8HtWOVZvOxfXuCYbqf4Txq/bT0tmuWqnbNhLdWr7LILEN3TkEsxXs0ylAbtCtOm9KHRbnPXPdhptagZok8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fM05fGoB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4775C4CEC3;
	Fri, 18 Oct 2024 06:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729232009;
	bh=bZLOC/ZzMRQvVzfU62T9+VIaJXK16VBix/E/EyBQ5jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fM05fGoBOOVgyHKAZziaBjJ/B6WsiBbrn+nloXMZkMODGkyst+0ifL3IK92ZtD6mt
	 koEl9ijOEbyEU6j7ACHLj5UQYd6p90VjJp3OVHgsPVrSY1fTP/lW+lHe7LVwghA+6M
	 rw4tIF6Y12+qRrXKxEyiqLsKdV1rot0ZdrRqlvDp59hoLm2ZPUhgZ3XrbH4UF1Fvab
	 Ud1VPvIKnB61F+dlddDVwBxLN4cJ9xp3ppgfnRdY5YbY5EffaxOBRX8MWayI5NYeGw
	 aG5ljgq6U2J3p1m7t/7TLTAph4UihPbBGPRBlKu4pAAG7YTdvvZ0gTJYwxkg9Sd9u8
	 +U8bOh+21PK7w==
Date: Fri, 18 Oct 2024 08:13:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	ulf.hansson@linaro.org, linus.walleij@linaro.org, catalin.marinas@arm.com, 
	p.zabel@pengutronix.de, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, quic_varada@quicinc.com
Subject: Re: [PATCH V4 6/6] arm64: defconfig: Enable IPQ5424 RDP466 base
 configs
Message-ID: <bkhgwvtiy5j2vwkpjtg7zawkcv57at63kmr2lxdqo6l6koryae@amgh6ie6w4z6>
References: <20241017123626.204421-1-quic_srichara@quicinc.com>
 <20241017123626.204421-7-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017123626.204421-7-quic_srichara@quicinc.com>

On Thu, Oct 17, 2024 at 06:06:26PM +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Enable GCC, Pinctrl for Qualcomm's IPQ5424 SoC which is required
> to boot IPQ5424-RDP466 boards to a console shell.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


