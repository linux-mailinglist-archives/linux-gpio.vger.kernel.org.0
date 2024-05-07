Return-Path: <linux-gpio+bounces-6196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF28BE6CB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 17:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D03481C23A89
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 15:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF092160862;
	Tue,  7 May 2024 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8AmCP22"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6068A1607B3;
	Tue,  7 May 2024 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715094061; cv=none; b=WeNxcBrGGvZf8wRfmI6kdwLWkqULRson0FYIIpwSyv0XmynFEjJ2zsAJvFY3DtCnANRAQNNE/qRRilXh3rsfUDrLL0RAyYtz6JIDvVI3cTfY3ik3pm+6bu0VVvGrf7lCg/wr8WHZHyBs0mQZpcrogupRtIESIWii/dnMjiIpo0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715094061; c=relaxed/simple;
	bh=8a2pyO1gn1Kbk1AilEdpctkENSJMzwz0LXzeDq6SO6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ddW6kXK1c9elZMTPrsZjC9z691iCwbyOHP+/cAbwjCFFr7N5EWDRn+E0nXiS0vxPtTIwHTIxlIkdauOuIl/tXdSkN0CK9y10OHeoYqGajgYaHxiiEnKNvcgVKGeUq/VH5dEyU6TndG5UfkKhOmHJOAA7AarsjqPlaq3VZqaIZR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8AmCP22; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF65C2BBFC;
	Tue,  7 May 2024 15:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715094060;
	bh=8a2pyO1gn1Kbk1AilEdpctkENSJMzwz0LXzeDq6SO6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y8AmCP226PFSr1YG4tK7kuHNHtRyXGzMaSR8rzq7qFVoJUWZvo4d4WAwq1Tog2Sft
	 xP/tdeNq2x0Hv7QGRCdhyMdoBRJrYhBj2/vXX7OqL+NG7tIgSsct9ZaLK5RG+aLN0u
	 S1ZO9xXZDot7EEgkLuuCj+6nJ8mCaIo97JcEHha9UFZa5E51w2UfQkBpR2P8i2JGg8
	 6u/3g/Ohu2oy5D6j/HCNlgyZU2b8CJ7/lzuPt4nRwR39EsYibtD+Yw7yOYy2pGR3cY
	 D+jhKdJbx7UP3Wv2qUcS7YMoLw/pJMEQcG5Oiqf5F4C+B86ih/mB3bMXg6duXGUHyA
	 Pk7p2WYVijbJw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4MJT-000000003QQ-0G9L;
	Tue, 07 May 2024 17:01:03 +0200
Date: Tue, 7 May 2024 17:01:03 +0200
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
Subject: Re: [PATCH 02/13] mfd: pm8008: fix regmap irq chip initialisation
Message-ID: <ZjpCL_NQD7X3hasO@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-3-johan+linaro@kernel.org>
 <ZjknxSsyo20b5_Tm@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjknxSsyo20b5_Tm@surfacebook.localdomain>

On Mon, May 06, 2024 at 09:56:05PM +0300, Andy Shevchenko wrote:
> Mon, May 06, 2024 at 05:08:19PM +0200, Johan Hovold kirjoitti:
> > The regmap irq array is potentially shared between multiple PMICs and
> 
> IRQ

I'm referring to an array of struct regmap_irq. Perhaps I can add an
underscore.
 
> > should only contain static data.
> > 
> > Use a custom macro to initialise also the type fields and drop the
> > unnecessary updates on each probe.
> 
> ...
> 
> > +#define _IRQ_TYPE_ALL (IRQ_TYPE_EDGE_BOTH | IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)
> 
> This is repetition of IRQ_TYPE_DEFAULT.

Thanks, I guess I should use IRQ_TYPE_SENSE_MASK here even.

> ...
> 
> > -			dev_err(dev, "Failed to probe irq periphs: %d\n", rc);
> > +			dev_err(dev, "failed to add IRQ chip: %d\n", rc);
> 
> dev_err_probe(...); ?

This function won't return -EPROBE_DEFER, and that would be a separate
change in any case.

Johan

