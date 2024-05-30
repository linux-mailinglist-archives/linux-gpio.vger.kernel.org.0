Return-Path: <linux-gpio+bounces-6904-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3AE8D46D2
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 10:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D2CF1F22A73
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 08:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FF3148856;
	Thu, 30 May 2024 08:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEdmSyO6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE814D8CC;
	Thu, 30 May 2024 08:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717056877; cv=none; b=jfPF/kq2JOOvNCskp87PFMctwRzjKo2SFozT9iPSJQ294iA64CyJX6ksL0/BpvzrAUgMo7uvsTTZqSQ1d/vnjOTMZVIN3fx8VFvRowt/dum+yf4S2bwUzk3EqMCw9DfmSIgNuAZaSCAnmIkY2yw/f54F/qyzVSXtjNfq4QgrBAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717056877; c=relaxed/simple;
	bh=IuCxL1dIUocrZee96DyADSyIZgW2fonyjZS+wAJ7ZwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5uvo/MtQ/Bg4YyYIytq+MZIV8pJL6W66Mog0ebPxxFL4EHo3HQ+6VxEi+35aIPn+3FeoHQMpl7atsTvvCMNwSts0xSbA1ptFOA+jCZpg4AQDYI5olo64GAb1m9GU0IYAHoNpb2Jb4mJsjw3386GJR/hktEtajIgEb2mfZhT3x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEdmSyO6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBC6C2BBFC;
	Thu, 30 May 2024 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717056876;
	bh=IuCxL1dIUocrZee96DyADSyIZgW2fonyjZS+wAJ7ZwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEdmSyO61BFA3SHGW3/av0rYeWj3HwGB152s0JqxVbY6809pwohZGW4yYy/IS+L5O
	 H+cnk/adtKPevdBW55xHeW42fOt8B49YXz3QvvBHT8PHUck2CuC2Bo45PWT6p+byv1
	 57FfeNBK7e3dnz2/kEgjS+JzKjEdBKcUevKSz+ljT8XHQxbJCs5IvhsNFgFxBuP4ik
	 x/L7cY60Hljfds60Lib+YCWMNcZiOvWp3D71tpIxZXs1P7Psmvf3rSIlvPZNqXfkKe
	 d5w1ZQAh/KQUT+ILZmDl4Nu4rVcTvjygMzCMzVI5A/D5BdIETAyuCfSRAyDIq5806J
	 qxCMzzGyTmipg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sCavk-0000000046d-1uUd;
	Thu, 30 May 2024 10:14:36 +0200
Date: Thu, 30 May 2024 10:14:36 +0200
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
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 13/14] regulator: add pm8008 pmic regulator driver
Message-ID: <Zlg1bGOs3V3TkHck@hovoldconsulting.com>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-14-johan+linaro@kernel.org>
 <CAHp75VcC5t1FynFeHGd+57=AeXKE8u0uduzOfozsG3MEzCPpDQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcC5t1FynFeHGd+57=AeXKE8u0uduzOfozsG3MEzCPpDQ@mail.gmail.com>

On Wed, May 29, 2024 at 11:02:57PM +0300, Andy Shevchenko wrote:
> On Wed, May 29, 2024 at 7:30 PM Johan Hovold <johan+linaro@kernel.org> wrote:

> > +#include <linux/array_size.h>
> > +#include <linux/bits.h>
> > +#include <linux/device.h>
> > +#include <linux/math.h>
> > +#include <linux/module.h>
> 
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/driver.h>
> 
> + types.h

This one is already pulled in indirectly and I'm not going to respin for
this.

> + asm/byteorder.h

Already explicitly included in the code you left out.

> > +static int pm8008_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
> > +{
> > +       struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
> > +       unsigned int mV;
> > +       __le16 val;
> > +       int ret;
> > +
> > +       ret = regulator_list_voltage_linear_range(rdev, sel);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       mV = DIV_ROUND_UP(ret, 1000);
> 
> MILLI from units.h ?

Nah. 
 
> > +       val = cpu_to_le16(mV);
> 
> > +       ret = regmap_bulk_write(preg->regmap, preg->base + LDO_VSET_LB_REG,
> > +                       &val, sizeof(val));
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       return 0;
> 
> May be written as
> 
>   return regmap_bulk_write(...);

I obviously prefer it the way I wrote it.

> > +               rdev = devm_regulator_register(dev, desc, &config);
> > +               if (IS_ERR(rdev)) {
> > +                       ret = PTR_ERR(rdev);
> > +                       dev_err(dev, "failed to register regulator %s: %d\n",
> > +                                       desc->name, ret);
> > +                       return ret;
> 
> It's possible to use
> 
>   return dev_err_probe(...);
> 
> even for non-probe functions.

This is a probe function(), but as I've told you repeatedly I'm not
going to use dev_err_probe() here.

Johan

