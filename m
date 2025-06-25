Return-Path: <linux-gpio+bounces-22219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0EAE8DF7
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 21:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF38A1C25407
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 19:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D512DAFB0;
	Wed, 25 Jun 2025 19:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyBBKXOw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129C915278E;
	Wed, 25 Jun 2025 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878227; cv=none; b=sFLm42lYeQn8krcRQYE0+paoGc6efJRQWdcIlbPl+FZV56F10v+yT7lwttIKGLlepEkp4ZBAr8lxjHsW3J6UIHq2Lni4EcqUSwSyCtoR6sCPdUQCm26OV0KLDZfyvGd6U09BXJG9WWqrLzD95hKIMX58Z9sEOmZJeoclmGa51XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878227; c=relaxed/simple;
	bh=klFBqqktO+5hBILMy1Yyqcdg/qsxpTv08B4SUmcvGX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEHKy+ELb9tbI9dBHv9RRGOCCevZFpO3+fcAffYBHEA8f1KHMIA2EhIBUaTjNwKYkiKs7UsRmZ8d14ahK8gbOAWDFxiZV4YD6f/OCplYWHkzwYL7n2ezhdMDNpv9Xvh0XTNoEssAIQjWDgO0RCn4sHR+J9COpmnvCyyE630LbdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyBBKXOw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EA9C4CEEA;
	Wed, 25 Jun 2025 19:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750878225;
	bh=klFBqqktO+5hBILMy1Yyqcdg/qsxpTv08B4SUmcvGX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oyBBKXOwF3m96jrO7yH8LwgCWA5SYwBc31Yn+nPXckxzBV5pgCHczzrfvNf8a3f3X
	 qw+QbmC6iZhYRqw+NXn3obFj6jUAD0HHRBF5ECGWdq3nGrHz7DofMuNemLsOT5pSEO
	 ONA/lJe8G0ay+G95byCo06/DADOxeNMwDCR/Rt3FMyURI6oiwrkNExOKMA0LZA077P
	 lb2Uew9edSNpcTwEW43v4aYb4QqsU7MBZ+tS6mTekTd474m0MvRYGYvE34nVzxQkUJ
	 KwOlHWGPjPbvfgzuJStQvdykJqsz+5XZv/EcCfvAxC2cF67WPoAgk2DtdTyhq1Myxv
	 YvsNFZEBSAoKw==
Date: Wed, 25 Jun 2025 14:03:44 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 01/17] dt-bindings: firmware: google,gs101-acpm-ipc:
 convert regulators to lowercase
Message-ID: <20250625190344.GA2023865-robh@kernel.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
 <20250606-s2mpg1x-regulators-v2-1-b03feffd2621@linaro.org>
 <20250611-robust-vehement-dog-2bf6ac@kuoka>
 <013f55a0adf0b23e0836e33ee4ea0e1e7864a467.camel@linaro.org>
 <1ada43bbb20b806975d6b0503e36a3b464287612.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ada43bbb20b806975d6b0503e36a3b464287612.camel@linaro.org>

On Wed, Jun 25, 2025 at 04:05:34PM +0100, André Draszik wrote:
> Hi Krzysztof,
> 
> On Wed, 2025-06-11 at 10:08 +0100, André Draszik wrote:
> > Hi Krzysztof,
> > 
> > On Wed, 2025-06-11 at 11:04 +0200, Krzysztof Kozlowski wrote:
> > > On Fri, Jun 06, 2025 at 04:02:57PM GMT, André Draszik wrote:
> > > > Using lowercase for the buck and ldo nodenames is preferred, as
> > > > evidenced e.g. in [1].
> > > > 
> > > > Convert the example here to lowercase before we add any bindings
> > > > describing the s2mpg1x regulators that will enforce the spelling.
> > > > 
> > > > Link: https://lore.kernel.org/all/20250223-mysterious-infrared-civet-e5bcbf@krzk-bin/ [1]
> > > > Signed-off-by: André Draszik <andre.draszik@linaro.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > So this is also a dependency for the rest of the patches?
> > 
> > My thinking was that it makes sense to have it in context with
> > the other patches, but it indeed could go stand-alone if that's the
> > preference.
> 
> Can you take just that patch as-is from this series (then it's at
> least out of the way :-), or should I resend it separately?

No. If you take it out, then the rest of the series will have warnings.

Rob

