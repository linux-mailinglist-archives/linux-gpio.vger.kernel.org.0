Return-Path: <linux-gpio+bounces-6111-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2F8BBFB8
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 10:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 764D5B2117A
	for <lists+linux-gpio@lfdr.de>; Sun,  5 May 2024 08:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6310A63A5;
	Sun,  5 May 2024 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQNdj3S/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C695CAC
	for <linux-gpio@vger.kernel.org>; Sun,  5 May 2024 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714896786; cv=none; b=WryZdimAXTuXAPHVZHZIeg1udI6oG70WlX5n4Pdw34yb3vLlc+H4zRITdp7t5GTnFWcurqHFRJR8GfSDTm+SNR7slxnDnmvxSBj5WwBGFBUC38946GyH57Yw0qJnwMjmCR5V0sGtqboBMbb2jskdGc0TmJCrvLalWFaJ7rtRF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714896786; c=relaxed/simple;
	bh=SqXA7GLaFSG39bIvEPbEQE7VNlngYkh43+xlF3lBsGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc2p/2/ml69bcb5ZGzZTrD2eul+RSCXSeeu5JS//VOKEjNkeKYYsUxw/nD2Cg3PYP0vyk92R/yj1dUDO4v2sl0jl61gu34U5sMuUoxsD0TeqI/yZt52dMktoOH5WfNlQLDdMPDdG1YYwT1Cb01RXQ55ugBAdxDVKUNS/ORUjwSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQNdj3S/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 837CAC113CC;
	Sun,  5 May 2024 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714896785;
	bh=SqXA7GLaFSG39bIvEPbEQE7VNlngYkh43+xlF3lBsGY=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=kQNdj3S/C0bRLI2eNpyd1egA05e6ZydyQ0Ja/yzXzjn1kxHKnirOtZKmknneD55xS
	 zDU2xJ5RAeBNNWhr0/ZduPxKDcuBKOfyPUpKZ6hTRp7f+BRFB+6zfa6FaGT74qRiP/
	 egfSCqhZ+c7L+AyyVtdSXaQPz1UkUOqHp9sKBXHlhfrfhzGPnsSzivRgxRjN8M3Owx
	 54zBpnDMfZi0APDaIOX3jt1t8eXTW4NJm7zARpdNkOp083XCZQ0S23EIHViCVJBbwy
	 6h5e2EsV/oyFNo4OkUYm054geeAoCNHdpcuvPZUqc3diGxv8f21Pr0WppF4+Q7Hyhh
	 gJoeBO+vgXwJA==
Date: Sun, 5 May 2024 10:12:46 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20240505081217.kkzcf2lzp63u76kd@kandell>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-4-kabel@kernel.org>
 <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
 <20240503084306.klwzn67drsidq6l6@kandell>
 <ZjUf5TDbgRxbkYSv@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZjUf5TDbgRxbkYSv@smile.fi.intel.com>

On Fri, May 03, 2024 at 08:33:25PM +0300, Andy Shevchenko wrote:
> On Fri, May 03, 2024 at 10:43:06AM +0200, Marek Behún wrote:
> > On Fri, May 03, 2024 at 07:05:34AM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > > +       err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);
> > > 
> > > Perhaps a helper for this (__fls(x) >> 3 + (y)) ? It seems it's used
> > > in a few places.
> > 
> > It is used 3 times:
> >   rlen = ((__fls(rising) >> 3) << 1) + 1;
> >   flen = ((__fls(falling) >> 3) << 1) + 2;
> >   err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);
> > 
> > The last one is not compatible with the first two (because of the "<< 1").
> > 
> > The first two instances are contained within a function that is dedicated
> > to "computing needed reply length".
> > 
> > I could probably do something like
> > 
> >   static inline unsigned int
> >   omnia_compute_reply_len(uin32_t mask, bool interleaved, unsigned int offset)
> >   {
> >           return ((__fls(mask) >> 3) << interleaved) + 1 + offset;
> >   }
> > 
> > Then the 3 instances would become
> > 
> >   rlen = omnia_compute_reply_len(rising, true, 0);
> >   flen = omnia_compute_reply_len(falling, true, 1);
> >   err = omnia_cmd_read(client, cmd, &reply,
> >                        omnia_compute_reply_len(bits, false, 0));
> > 
> > What do you think?
> 
> Fine, but think about these bit operations, I believe it can be optimised.

I will try something, altough I fear it might need 64-bit operations,
which may be even more suboptimal since the driver is supposed to run on
armv7.

Also, isn't this premature optimization? Since the computed length is then
passed as a parameter to I2C reading, and the I2C bus is orders of
magnitudes slower and the handling of I2C requests in Marvell I2C driver
will kill any optimization I do here...

