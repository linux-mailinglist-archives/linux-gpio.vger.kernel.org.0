Return-Path: <linux-gpio+bounces-6271-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E3E8C0DAD
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 11:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8CC0B227B8
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 09:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2791514B078;
	Thu,  9 May 2024 09:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6PwzGFC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE40614A635;
	Thu,  9 May 2024 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715247737; cv=none; b=oqUCwVvIkCrlQnbJX1UXLtLiZh3Ac+9mtryUm7+gJZWUI1E/SnyvikcbvWWhehKPJXaIXdWSiCJvHO85J+pJCsxDGmd8HNaCJuT0cucwQHsIqzhH8csCINBYF8Clmcb1RnMGmDaGX2j/yvDmLz0oW3XsXpuLyjtVwqVsKkEgEKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715247737; c=relaxed/simple;
	bh=tD9tOrxNFpXsZZQ8xg7bbuScb8DB8HBoElxo9MJcKcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3xrt13kac4ExOniKZ6f9O1ST2KwkqP1RDy/dS2+yTOVqMSa0VLmfKHvlzxD1AkkF+T6HL5UvgCmwxeeTJDpD1zGi291EohbjMOlm4kL5VE76QI+KzPgxsCEaIGHz02G2J4fULvoxoV3NI2hEJacruc8VhRsGS62OTvv4xb9qzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6PwzGFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C6EC116B1;
	Thu,  9 May 2024 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715247737;
	bh=tD9tOrxNFpXsZZQ8xg7bbuScb8DB8HBoElxo9MJcKcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6PwzGFC6N9hqs5FWprlYfL77L/nHkAa5ydiN7306iC2CV5mIXdsQyaBbmsYSFnxD
	 tzMoezKcWVbYlrGIwmLow7C2IdIBKb0iO8CyvZrWNLDBlvgm4X3VoZ0mAdwaR2w/Ao
	 5iOA7jHPH6BLGMN0IfCM+mNdP5W+D79mHHBwGFo3/Zl/3oh96Kc/xSDpBq/d/tR+S+
	 gBxQzvqxd7Aum8cwyfdsacipu60LByxlVgkWasNZJMseao3qGyluvVww/URYqIAJ6L
	 pNnwU8lP9cAWnxq/6pofOzj+vdW64smUwoUleufiSMqwB/l9RoT6RBPkc4gO2UFfvX
	 gs1uqaKwQLaGg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s50I8-000000001bK-3n8n;
	Thu, 09 May 2024 11:42:21 +0200
Date: Thu, 9 May 2024 11:42:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
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
Subject: Re: [PATCH 11/13] mfd: pm8008: rework driver
Message-ID: <ZjyafGz_1pY4J9C7@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-12-johan+linaro@kernel.org>
 <ZjktIrsZS-T7cm-A@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjktIrsZS-T7cm-A@surfacebook.localdomain>

On Mon, May 06, 2024 at 10:18:58PM +0300, Andy Shevchenko wrote:
> Mon, May 06, 2024 at 05:08:28PM +0200, Johan Hovold kirjoitti:

> > +static void devm_irq_domain_fwnode_release(void *res)
> > +{
> 
> > +	struct fwnode_handle *fwnode = res;
> 
> Unneeded line, can be
> 
> static void devm_irq_domain_fwnode_release(void *fwnode)
> 
> > +	irq_domain_free_fwnode(fwnode);
> > +}

I think I prefer it this way for clarity and for type safety in the
unlikely even that the argument to irq_domain_free_fwnode() would ever
change.

> > +	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
> 
> You are using fwnode for IRQ domain and IRQ domain core uses fwnode, why OF here?
> 
> 	name = devm_kasprintf(dev, GFP_KERNEL, "%pfw-internal", dev_fwnode(dev));

This driver only support OF so why bother.

Johan

