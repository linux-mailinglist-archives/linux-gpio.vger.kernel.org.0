Return-Path: <linux-gpio+bounces-11795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A6C9ABC24
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 05:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3782283EB5
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 03:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF4B132122;
	Wed, 23 Oct 2024 03:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Obe4JKN/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03371C2BD;
	Wed, 23 Oct 2024 03:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729654067; cv=none; b=LuD62tboT/OGtdQp8P5Rxap0N4vO8Z4pgKxf3tn2c8/cmuaBLlQauXbncwyEj3Cm4tWMHibJ/rLMBoGFPrfrunRqjPbsUhKmQCaab7lqvz9GLLrycmJPgKy8aohkYEWHtFxmkPdb26NaVCeQZPEFiB1wO+J7KQ4hXFDN5Y172OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729654067; c=relaxed/simple;
	bh=vREOTp2pNJdkhnYRG+P0U+85DeEdwOHsWcBdcX2lhds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfLiVgGTeANl67FXhX/thSpceC254J4ehMMwmI6V2QOFrX9IhyDz01hCeVax9DI3PwmetQ05Awu2StZLip0WugpNBH+FfKWfAQuzjMfAHKStsQcZ40eOQeTP0hpE2ZsAL4Qh3VaHpX1H+LSmUScopk1aF/5a6EHgIHEGyk4AHFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Obe4JKN/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D85C4CEC3;
	Wed, 23 Oct 2024 03:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729654066;
	bh=vREOTp2pNJdkhnYRG+P0U+85DeEdwOHsWcBdcX2lhds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Obe4JKN/B7ikiuqZEDgD735kiqPxv4I6fvQ/Hm3jIh6AUMPr19CEbC6gpiDrfA7IE
	 B5JG1+EsdemFZ17Qv/K/vZuA09A1X+RngMaW/86/RacHSahexY5VpNk25ULHnQgNNg
	 r6u3lWNE/qo16oLRjA5mNdB2QpG+HHf4UkEgyn/MOTjsojDN1VI80LgFRtqnXPfhbR
	 26wIbvdHTJ+zlXg3h+HmnSxPYXgPPMI8PgN0/HUxVBKp/rXIjevuz4OeL85DvoEm18
	 hKFHK4yXdmo5Qm2ZRxOK7BOJOn+DwFsb0+9Pf3DANmoO3Q4UAZdYlH9hbYz4lq3RLA
	 h8DPygfwsRRQQ==
Date: Tue, 22 Oct 2024 22:27:43 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add sm8750 pinctrl driver
Message-ID: <dnri3nqq2una3atjwl437ujzrl2txl2zdyb2ima5qeeudqotxn@5zdxizip6mhb>
References: <20241021230414.2632428-1-quic_molvera@quicinc.com>
 <20241021230414.2632428-3-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021230414.2632428-3-quic_molvera@quicinc.com>

On Mon, Oct 21, 2024 at 04:04:14PM GMT, Melody Olvera wrote:
> Add initial pinctrl driver to support pin configuration with pinctrl

I think you should drop the word "initial", and perhaps insert "TLMM" in
its place.

> framework for sm8750 SoC.
> 
[..]
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8750.c b/drivers/pinctrl/qcom/pinctrl-sm8750.c
[..]
> +static const struct msm_pingroup sm8750_groups[] = {
[..]
> +	[215] = UFS_RESET(ufs_reset, 0xE2004, 0xE3000),

It would be nice if these digits where lower case...

> +	[216] = SDC_QDSD_PINGROUP(sdc2_clk, 0xDB000, 14, 6),
> +	[217] = SDC_QDSD_PINGROUP(sdc2_cmd, 0xDB000, 11, 3),
> +	[218] = SDC_QDSD_PINGROUP(sdc2_data, 0xDB000, 9, 0),
> +};
> +
[..]
> +static const int sm8750_reserved_gpios[] = {
> +	36, 37, 38, 39, 74, -1

Any particular reason why these are not gpio-reserved-ranges in
DeviceTree?

Regards,
Bjorn

> +};
> +

