Return-Path: <linux-gpio+bounces-6868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 804038D3C11
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B10A285195
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371AF1836D1;
	Wed, 29 May 2024 16:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="urwF66fA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF390E576;
	Wed, 29 May 2024 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716999421; cv=none; b=LaAYWe+Eu1zPv3pY1oCv94JmOzPfmhljs3mZjaLT0WmINNQkBi2vBMRr2pFJHLscbQzTLpyUEMfxTezJYAfSeZVk4y0o2SaXBRPSCuPWnOzNZ+3zEF1jsCWkBM1Ts6RX6rrup/SjsvJchNMc5jvjn3usMFP6hTRX0/t83jZSYJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716999421; c=relaxed/simple;
	bh=4dpB5T2dqL+I9yVD9wiiBGyseVVp1ELP7uPP7/kIEDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvG08hRHU0ITcXFRpA/sOE4BAr9CrJ0t27GX61Zs3TlPACwReqVHPn/mkzj0OcYFmtRjimMxJsibws8hox5YJ450gIbk9Dn/TQ14qu6FCn963GuCMGBkeIfrFzBEMCSs56v8U1h9vdbX6iCEIluYXho3MwvAEqA51N2fNCenYoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=urwF66fA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA5DC113CC;
	Wed, 29 May 2024 16:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716999420;
	bh=4dpB5T2dqL+I9yVD9wiiBGyseVVp1ELP7uPP7/kIEDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urwF66fAsw7TVYLSIJZcXYWlWU3BiZRBcZ78Ifo/KW7Imd4CXhGLpdng16r/rXw1V
	 g2+A6fn0SGNviwZ6cKgT04v7qyhjUpaRvQp5yyy+Yc2wda6R5hro1PNbX6QXRiWVBV
	 hUwXr2LzHZ+WkNKkYIhDXpY+uo+/aEBDPPV3CSlFSE+cB9DCp/uzBqtCwtlXGJx4Fx
	 mUabmfb/c+VlgZAMyZw61VJZ+Bq6/uTO+rxW3Z5Jho/hbAm1v0u59875nQKyq5myz8
	 tIUj3F8nP22QW3u1vWgvhMeSGr9aFQKpfTbBHGBAkytaUIE2I23fi4Hnbt6ec782gJ
	 9qjddStaUJn+Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCLz2-000000004VC-0Sv0;
	Wed, 29 May 2024 18:17:00 +0200
Date: Wed, 29 May 2024 18:17:00 +0200
From: Johan Hovold <johan@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
Subject: Re: [PATCH 03/13] mfd: pm8008: deassert reset on probe
Message-ID: <ZldU_LqjkU-4uphO@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-4-johan+linaro@kernel.org>
 <4468becb-dc03-4832-aa03-5f597023fcb2@linaro.org>
 <ZjyX6iBqc50ic_oI@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjyX6iBqc50ic_oI@hovoldconsulting.com>

On Thu, May 09, 2024 at 11:31:22AM +0200, Johan Hovold wrote:
> On Wed, May 08, 2024 at 05:12:51PM +0100, Bryan O'Donoghue wrote:
> > On 06/05/2024 16:08, Johan Hovold wrote:
> > > Request and deassert any (optional) reset gpio during probe in case it
> > > has been left asserted by the boot firmware.
> > > 
> > > Note the reset line is not asserted to avoid reverting to the default
> > > I2C address in case the firmware has configured an alternate address.
> 
> > > @@ -169,6 +171,10 @@ static int pm8008_probe(struct i2c_client *client)
> > >   
> > >   	i2c_set_clientdata(client, regmap);
> > >   
> > > +	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> > > +	if (IS_ERR(reset))
> > > +		return PTR_ERR(reset);
> > > +
> > >   	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
> > >   		rc = devm_regmap_add_irq_chip(dev, regmap, client->irq,
> > >   				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> > 
> > So not resetting is fine and I understand you want to retain the address 
> > given by the firmware, I think that's the right thing to do.
> 
> > In addition to adding a small delay suggested by Andy - a few 
> > microseconds pick a number, I think you should verify the chip is out of 
> > reset as we would do with many other i2c devices.
> 
> > In this case, suggest reading REVID_PERPH_TYPE @ 0x104 and 
> > REVID_PERPH_SUBTYPE @ 0x105
> > 
> > REVID_PERPH_TYPE @ 0x104 == 0x51 (PMIC)
> > REVID_PERPH_SUBYTE @ 0x105 == 0x2C (PM8008)
> 
> I'll consider it for v2.

I decided to not add any revid checks for v2 as it's not strictly
needed. This is something can be added later when/if needed.

The irqchip registration will also fail if there's no from reply from
this address.

Johan

