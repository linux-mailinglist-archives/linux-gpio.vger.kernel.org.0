Return-Path: <linux-gpio+bounces-6270-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5CA8C0D7F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 11:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07C5328433D
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 09:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91D714A627;
	Thu,  9 May 2024 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYGQqfJk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D3914A096;
	Thu,  9 May 2024 09:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715247078; cv=none; b=gMKEhQ1cxS15lsNERRe0EuFgx7Tw2s5Jj6WyucgBdGWb2G+CzyZlipeICG92bj7uoJCCJmILAoNke52ZR/Dz8a5i85gNjQm0vEEkKAjBYkd70k+TT1OfvM33JlBtUQ5ee8tXbGTCvnc4VYeI9gtpyRVWwlNULxfux69jonpBnOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715247078; c=relaxed/simple;
	bh=yMguGKEurxhBhT2kNnn/ZtameJsGQKoLePBLTU/eYv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKwnqZCfF7e/lmv+ObS+4IUQf4zpb7I99Ru9MQTqFvwz0mdQiw0dBn7tzXr6IsqbmrMjlVolnEEydyGGSdN0hZYegjBjGn496GdFugkDXX1WpGjwoEH8IF1ZPO+4wnn0r1mNMnYab7Kofzml0SpYdghTjUHPKNq4s/Vil0ItfdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYGQqfJk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1660DC116B1;
	Thu,  9 May 2024 09:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715247078;
	bh=yMguGKEurxhBhT2kNnn/ZtameJsGQKoLePBLTU/eYv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYGQqfJkN1d/277imD/xsq+021aWyQqzAHzvKYlJp/XBwcAmVhermLRITV4idbxlm
	 CKZXc+52L3i+8CV+MkhcdM4HXP5msn0L9Y+QJA8uU2EFDRjw3OyF69+vNePo2x/L+a
	 +ekUKns829/c1CY4gcDhRYGYxkNMZW48RY03sYpNtbj/uo0/hPIv4gckyyYXJhcYtR
	 0pN4mdioeV4Fy+Y9XO/8fdm/UvhO0GutUU+IfSIgaddAZssxdb83x/LTWKQAaYvXz2
	 tS2qnyvWguA/e1mwiS0jdH96ZXfVZNn+pO5xLVwOhzkzaUtsUTlOemVobBVVem/UMK
	 aAky732Vxw4mw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s507W-000000001L5-2a2j;
	Thu, 09 May 2024 11:31:22 +0200
Date: Thu, 9 May 2024 11:31:22 +0200
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
Message-ID: <ZjyX6iBqc50ic_oI@hovoldconsulting.com>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-4-johan+linaro@kernel.org>
 <4468becb-dc03-4832-aa03-5f597023fcb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4468becb-dc03-4832-aa03-5f597023fcb2@linaro.org>

On Wed, May 08, 2024 at 05:12:51PM +0100, Bryan O'Donoghue wrote:
> On 06/05/2024 16:08, Johan Hovold wrote:
> > Request and deassert any (optional) reset gpio during probe in case it
> > has been left asserted by the boot firmware.
> > 
> > Note the reset line is not asserted to avoid reverting to the default
> > I2C address in case the firmware has configured an alternate address.

> > @@ -169,6 +171,10 @@ static int pm8008_probe(struct i2c_client *client)
> >   
> >   	i2c_set_clientdata(client, regmap);
> >   
> > +	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> > +	if (IS_ERR(reset))
> > +		return PTR_ERR(reset);
> > +
> >   	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
> >   		rc = devm_regmap_add_irq_chip(dev, regmap, client->irq,
> >   				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> 
> So not resetting is fine and I understand you want to retain the address 
> given by the firmware, I think that's the right thing to do.

> In addition to adding a small delay suggested by Andy - a few 
> microseconds pick a number, I think you should verify the chip is out of 
> reset as we would do with many other i2c devices.

> In this case, suggest reading REVID_PERPH_TYPE @ 0x104 and 
> REVID_PERPH_SUBTYPE @ 0x105
> 
> REVID_PERPH_TYPE @ 0x104 == 0x51 (PMIC)
> REVID_PERPH_SUBYTE @ 0x105 == 0x2C (PM8008)

I'll consider it for v2.

Johan

