Return-Path: <linux-gpio+bounces-7128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 337DA8FB5BD
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 16:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 642BD1C20EC8
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jun 2024 14:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEE7145B3F;
	Tue,  4 Jun 2024 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ri3VbhIu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39A01411FA;
	Tue,  4 Jun 2024 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511904; cv=none; b=tUv7Ekv6XucdrjXHDwZ+5e4/bxcVSwz+M9aLDYm67jYvnXeikKETUrd449Jf+0xw5SIrc4kpcV1JgbYZ/NRaQCLNqhkPJsuFhv9dlzoT9+VkBQhoKxWFdzOXOrZ6a1gv9UarWr8uj3Dw5DR6dO9d4I25T0EsWsX8JlSzg6kBptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511904; c=relaxed/simple;
	bh=HZmqNGoKVXJoo6fKv9SQ0VkpZqIxY2Mm9g76flJoWtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azXIYYqrXgCq7qxJk31NvZqXR9OfZylVP6GW3oQAGHNM5PSPU4vZlh9P0HTw1/dhY/5UD9AikWLdOJ7nTdQbDEO6QlmQ95FrWOKDI13T4lysdhq3ZREoSR8GTZB4ufBJc2jSCJjQBQzywAL9PstI7F5sXB6O3LwujZwkEt3t0mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ri3VbhIu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277D6C2BBFC;
	Tue,  4 Jun 2024 14:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717511903;
	bh=HZmqNGoKVXJoo6fKv9SQ0VkpZqIxY2Mm9g76flJoWtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ri3VbhIu5ayMdsVd5PqIosUS5sdfGQ5lMDfvBuFMMWrdjqMmwi4wzRchT+ZietzBM
	 zr2tPbHDBfW28F4sZ2HnK3mxbqi/R7Jknt+J0iv22h0Q0TBaUS+qDunmYZsquTAFxW
	 8aoKs1L6L4lavTg3NETdxGTUsKNQxd04Fqh8ICzQ5Y1LilgQd88iLEB+lrECIjvbP/
	 ARfIiqE7ZhSF6ElwqFpf3Hm0aqf4gNjui8dG0/TkZnIK86otyXpnj5IOtxJhwP52mp
	 kH1Usan12cS1QXY8pZHI7AKiz754h48GJiF9TRba1gQNBIknzZhlV77AJ2il1RopBD
	 TIpHlAHctDEAw==
Date: Tue, 4 Jun 2024 09:38:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Das Srinagesh <quic_gurus@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 09/14] dt-bindings: pinctrl: qcom,pmic-gpio: drop
 pm8008
Message-ID: <171751189805.570385.12837768964635934798.robh@kernel.org>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-10-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529162958.18081-10-johan+linaro@kernel.org>


On Wed, 29 May 2024 18:29:53 +0200, Johan Hovold wrote:
> The binding for PM8008 is being reworked so that internal details like
> interrupts and register offsets are no longer described. This
> specifically also involves dropping the gpio child node and its
> compatible string which is no longer needed.
> 
> Note that there are currently no users of the upstream binding and
> driver.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


