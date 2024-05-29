Return-Path: <linux-gpio+bounces-6865-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 660828D3B7F
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 17:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C4981F275A4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 15:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BF3181D07;
	Wed, 29 May 2024 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WmXp/s9v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6650181BB3;
	Wed, 29 May 2024 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716998116; cv=none; b=ij5u8Q4Wgtoze/z0M1p1LDZ7aeXVT9U7tTiEdpDPnT0fGfApBg1/0tfQZBilI8lt5j6H0Avx766RH90XPeDmF97v1Aar/pXElnnAw1pUc9jW8QhA+J0gyTg04jUoN8mJ2eKEbiEEo17GIIG1cXAFwChK5NQoSBBaPheIEuUgLWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716998116; c=relaxed/simple;
	bh=cvCI74XULFLsUOYSrpSQ5aAd1HGoaFATJaZrDy1RBK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UBOavMln/ZRfgK9DmWPjVcvS5YZeWcy52UoQZitKviT2i++HU3NflKidbK/na3yI5vVUrL+cWtRuxEYal6MZE3WYe7Q7tOxiTyZoo7u8L9/VZPXvcz1znHG48B8o5FhvkmAv/LR1pjCTSgiJ8a0/WmS1zQI8JBFmWkjXSTIJoW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WmXp/s9v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B30FC113CC;
	Wed, 29 May 2024 15:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716998116;
	bh=cvCI74XULFLsUOYSrpSQ5aAd1HGoaFATJaZrDy1RBK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WmXp/s9vHFC0BXI3VHUObfGwuQj1zxrYLOB2NH1CaxvAcKrnnmPbBpHqtmBaUIvmO
	 7OrKLE0HbBrxG9SObqzJVZTEUPG/49lSTHcWRAx6eQMz/CWbsqWhjE0DyfIqS9e1Z2
	 gKhlZzo3158eL4rQlpNGpBVvfOeL+DRbOCbaCcs3hiRNd8jpj8MIJdeAwj/T+dja+8
	 M0sHpT3wWbHEhzVpJzyvzpKPbWrzN5C3J+pA56Dew8ffLEk9zjHJLEqsVeBZWspcol
	 rpW0Q5iOxnzsbvj6xFLHkjQ4h0e3px1WIoyVOf6b1ntkimc+DWUImO5SMuZXkkFxKI
	 jnc9o0VQW92WA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCLdz-000000004DT-1fTP;
	Wed, 29 May 2024 17:55:15 +0200
Date: Wed, 29 May 2024 17:55:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Message-ID: <ZldP4zODYZzCoHW3@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-13-johan+linaro@kernel.org>
 <CAE-0n52KTZ8G2VuvrDgJ9kAE61YULXY4u6nPP3CYWpg1CBjbXA@mail.gmail.com>
 <ZjyTEVLp8VAhQfT5@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjyTEVLp8VAhQfT5@hovoldconsulting.com>

On Thu, May 09, 2024 at 11:10:41AM +0200, Johan Hovold wrote:
> On Wed, May 08, 2024 at 10:37:50PM +0000, Stephen Boyd wrote:
> > Quoting Johan Hovold (2024-05-06 08:08:29)

> > > +struct pm8008_regulator {
> > > +       struct regmap           *regmap;
> > > +       struct regulator_desc   rdesc;
> > > +       u16                     base;
> > > +       int                     step_rate;
> > 
> > Is struct regulator_desc::vsel_step usable for this? If not, can it be
> > unsigned?
> 
> Not sure, I'll take a look when respinning.

No, vsel_step is unrelated to this, which is really a slew rate.

I've reworked the driver and dropped this field in favour of
regulator_desc::ramp_delay.

> > > +};
 
> > > +static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
> > > +{
> > > +       struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
> > > +       __le16 mV;
> > > +       int uV;

> > > +
> > > +       regmap_bulk_read(pm8008_reg->regmap,
> > > +                       LDO_VSET_LB_REG(pm8008_reg->base), (void *)&mV, 2);
> > 
> > Is struct regulator_desc::vsel_reg usable for this?
> 
> Will look into that.

I don't think vsel_reg can be used here as the voltage is set using two
registers (LSB and MSB).
  
> > > +
> > > +       uV = le16_to_cpu(mV) * 1000;
> > > +       return (uV - pm8008_reg->rdesc.min_uV) / pm8008_reg->rdesc.uV_step;
> > > +}

Johan

