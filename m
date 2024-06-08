Return-Path: <linux-gpio+bounces-7283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BDE901267
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 17:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AF071C217BD
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 15:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9C1179675;
	Sat,  8 Jun 2024 15:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCxojzbv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04791E888;
	Sat,  8 Jun 2024 15:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717861722; cv=none; b=Xp3acWZV8HP1vFxtjRYLkNawOpcnOZxu4NFxSaM5F7UzkeTqGf5Ehaci6EcG6DgxeEiL8YAwfjySSGAI6Y2nVrTis/NZ9GXbEbRa5rD0aEgL5BMAossolwwm2aoPNrsjoHg7qOOUOeFtq4uYZ4e94o0jW6pftgjZc84JVfHmEeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717861722; c=relaxed/simple;
	bh=F6G10TvIr1xk/bTQReGFkBEnFiIvv8ayWvgKRiPGwd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PB+fQbPl4cbjjQgMs1WcyWi1q5SF7rUKGz+bvgxNHVBgQAflG/hsbTNBrmzqb7RM7dnuaQttngt+URSRAib4b1EqCpg/deXJjWEmVMFp2bc6GXv20hqwzR23l7bb6xAp/ceYSWqcPo0x0dzxIkOPYdo4sXuSeJv7TYn7WEct0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCxojzbv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250B5C2BD11;
	Sat,  8 Jun 2024 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717861721;
	bh=F6G10TvIr1xk/bTQReGFkBEnFiIvv8ayWvgKRiPGwd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCxojzbvL9nMzgK7dtOPD2e5Em0HDmEJU/hSWbVBrXqQnG0EPP9qQcE485nXFbuzo
	 H8tCfZQOecPU+RWidiZmWXQBAVLNrJqedn/30YrViuqG0UCJfv+vh1k4Z4dcGFgR8G
	 KpZBw4qSzvlb1IKTupLAHS52aBOVy9S+JQoQyAWGrO82bpO/kamPR668sHoeGrS9YX
	 oPhLhs5tDioJr42P3SZv5tzgvJA39ATd6E4KDJSsKoIoJLSqRdi/v9wsEypxtGrrTk
	 KE2BBWj6DqA6x4nI2RefVV56L90jQ+1x6i0pBEMulgjyQqWwxHmNO69HEGBaNZLwoF
	 pmWNxxGc3yreg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sFyJ5-000000003GJ-1CTP;
	Sat, 08 Jun 2024 17:48:40 +0200
Date: Sat, 8 Jun 2024 17:48:39 +0200
From: Johan Hovold <johan@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/14] mfd: pm8008: fix regmap irq chip initialisation
Message-ID: <ZmR9VwiVjKaaQJLl@hovoldconsulting.com>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-3-johan+linaro@kernel.org>
 <20240531170353.GB1204315@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531170353.GB1204315@google.com>

On Fri, May 31, 2024 at 06:03:53PM +0100, Lee Jones wrote:
> On Wed, 29 May 2024, Johan Hovold wrote:
> 
> > The regmap irq array is potentially shared between multiple PMICs and
> > should only contain static data.
> > 
> > Use a custom macro to initialise also the type fields and drop the
> > unnecessary updates on each probe.
> > 
> > Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
 
> > -static struct regmap_irq pm8008_irqs[] = {
> > -	REGMAP_IRQ_REG(PM8008_IRQ_MISC_UVLO,	PM8008_MISC,	BIT(0)),
> > -	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OVLO,	PM8008_MISC,	BIT(1)),
> > -	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OTST2,	PM8008_MISC,	BIT(2)),
> > -	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OTST3,	PM8008_MISC,	BIT(3)),
> > -	REGMAP_IRQ_REG(PM8008_IRQ_MISC_LDO_OCP,	PM8008_MISC,	BIT(4)),
> > -	REGMAP_IRQ_REG(PM8008_IRQ_TEMP_ALARM,	PM8008_TEMP_ALARM, BIT(0)),
> > -	REGMAP_IRQ_REG(PM8008_IRQ_GPIO1,	PM8008_GPIO1,	BIT(0)),
> > -	REGMAP_IRQ_REG(PM8008_IRQ_GPIO2,	PM8008_GPIO2,	BIT(0)),
> > +#define _IRQ(_irq, _off, _mask, _types)			\
> > +	[_irq] = {					\
> > +		.reg_offset = (_off),			\
> > +		.mask = (_mask),			\
> > +		.type = {				\
> > +			.type_reg_offset = (_off),	\
> > +			.types_supported = (_types),	\
> > +		},					\
> > +	}
> 
> Any reason why this can't be generic and be tucked away somewhere in a
> header file?

These macros tend to be quite driver specific so not sure it makes sense
to try to generalise beyond the basic ones already provided by regmap.

Either way, I don't think that should be a prerequisite for fixing this
driver.

I'm also considering replacing the current irq chip implementation as
part of unifying with the SPMI implementation.
 
> > +static const struct regmap_irq pm8008_irqs[] = {
> > +	_IRQ(PM8008_IRQ_MISC_UVLO,    PM8008_MISC,	BIT(0), IRQ_TYPE_EDGE_RISING),
> > +	_IRQ(PM8008_IRQ_MISC_OVLO,    PM8008_MISC,	BIT(1), IRQ_TYPE_EDGE_RISING),
> > +	_IRQ(PM8008_IRQ_MISC_OTST2,   PM8008_MISC,	BIT(2), IRQ_TYPE_EDGE_RISING),
> > +	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
> > +	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
> > +	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
> > +	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
> > +	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
> >  };

Johan

