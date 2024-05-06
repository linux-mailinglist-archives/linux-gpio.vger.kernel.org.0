Return-Path: <linux-gpio+bounces-6161-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E758BD4FA
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 20:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 381E62836DC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 18:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D59D158D9D;
	Mon,  6 May 2024 18:56:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AED158D99
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 18:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715021776; cv=none; b=fJp1d56SuPC9ux9Nc5KJ3UkpN30wlWgpy+886hF1vk4r/fr0bWhhB1B+Za9Q+2JgKDiDjp2fmks8nSUzhAN2/6HtqF7RUGWGmSGWQC67HZqMOqjPBgR358U7TmfFia2WS9L61u38vnSuGr2B5UwpnEHALzN7jJrgd97wqRCbHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715021776; c=relaxed/simple;
	bh=dMhPV3IMcLOLNuDvwfw8BsOYqG4R3kM9nwX10XYlXyA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ieu1gniCwLQatBsYLGK9++LRSV6DvWK1aiT3tMHRNubtxfw10nh+71T+EWPgAydFAvx7g6hxYBcROUpXea1b4VHvkzhYmh+alqwFhMr98gxtRJ3U405yuOlQCyao7Mln02Uhp4cP9hd2V6W0VW0TuDGQCjB4Os05j7tP2D4rPJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 4a9edbaf-0bda-11ef-b3cf-005056bd6ce9;
	Mon, 06 May 2024 21:56:05 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 21:56:05 +0300
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 02/13] mfd: pm8008: fix regmap irq chip initialisation
Message-ID: <ZjknxSsyo20b5_Tm@surfacebook.localdomain>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-3-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506150830.23709-3-johan+linaro@kernel.org>

Mon, May 06, 2024 at 05:08:19PM +0200, Johan Hovold kirjoitti:
> The regmap irq array is potentially shared between multiple PMICs and

IRQ

> should only contain static data.
> 
> Use a custom macro to initialise also the type fields and drop the
> unnecessary updates on each probe.

...

> +#define _IRQ_TYPE_ALL (IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)

This is repetition of IRQ_TYPE_DEFAULT.

...

> -			dev_err(dev, "Failed to probe irq periphs: %d\n", rc);
> +			dev_err(dev, "failed to add IRQ chip: %d\n", rc);

dev_err_probe(...); ?

-- 
With Best Regards,
Andy Shevchenko



