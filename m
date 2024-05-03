Return-Path: <linux-gpio+bounces-6043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4EC8BA91A
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 10:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C643FB215BF
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2024 08:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D521C14A601;
	Fri,  3 May 2024 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/NOYwCr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B3514A4D8
	for <linux-gpio@vger.kernel.org>; Fri,  3 May 2024 08:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714725797; cv=none; b=ZX+23SPcZhdkUNnjVI8sqQphdGLrzBdNHKFJ20J8LUAvFf59j6lrlMBLJa12Ff3N38Q7sSnxaGTrxG5uHnMao2iSBFoc1/Xfc2kUXx47FtoG8WyFGPPIeClXQ/8IUZLEugo9qNcBEHc94Uc8lAQ4O/M+wIZO8NNUbxbGMeEMwiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714725797; c=relaxed/simple;
	bh=mOL5Jgsv8bIIOkznU+eimVgosfZXeFAhc5I+WFQZS5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2ICDgG5S5zonmMIn+3wKw76HlReHre2AaaiDMO6V+SSQ9ghTacfg4D00bdE0nZoMDwXvaLJjZUqDnMTd2vC5TQJooagaqHIb4ZjkkTq/LqM3nFtSCs7cWZHopeQXmLeqqrxJnpPkkyiSvBVJkJ0Y7BjznAzXS3t7cHrad8/BL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/NOYwCr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A759C116B1;
	Fri,  3 May 2024 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714725797;
	bh=mOL5Jgsv8bIIOkznU+eimVgosfZXeFAhc5I+WFQZS5Y=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=a/NOYwCraBHXNsPXaLjeJgEezTK2EOJIuTxym3IFI1pL/ZdmUfbGeksC33jq9bC+4
	 4UDbjIme8UUwxy72Yh0I2T4VyyGhnYN3eDRx3RgoRTUb4VUyj4Y1DwcM4OVFvJ7dpB
	 b4z1axPwEDpf1Ofe+JTts0HhPU5d+QTEAccUIVoNSDmevodoYtqcUSrPBbubiVUnWR
	 X9F3a1vCVYbWWzhrh99nUT47+hXQCv80IrlU06d0GjifWoDGkUMaYFuZlPd2yKoJyU
	 Us0xu5kNu6E/PfqT03rOsXPrT0WAczOXB+ikTnDTU2otu++ongGhQ/ZR5aVKtFYjVG
	 O9jaoPlhGW/YA==
Date: Fri, 3 May 2024 10:43:06 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v8 3/9] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <20240503084306.klwzn67drsidq6l6@kandell>
References: <20240430115111.3453-1-kabel@kernel.org>
 <20240430115111.3453-4-kabel@kernel.org>
 <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdV_JmbS1pM11Pf8S5vWU8X1FrKpw3aAtTHK0tsLua5fg@mail.gmail.com>

On Fri, May 03, 2024 at 07:05:34AM +0300, Andy Shevchenko wrote:
... 
> > +       err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);
> 
> Perhaps a helper for this (__fls(x) >> 3 + (y)) ? It seems it's used
> in a few places.

It is used 3 times:
  rlen = ((__fls(rising) >> 3) << 1) + 1;
  flen = ((__fls(falling) >> 3) << 1) + 2;
  err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);

The last one is not compatible with the first two (because of the "<< 1").

The first two instances are contained within a function that is dedicated
to "computing needed reply length".

I could probably do something like

  static inline unsigned int
  omnia_compute_reply_len(uin32_t mask, bool interleaved, unsigned int offset)
  {
          return ((__fls(mask) >> 3) << interleaved) + 1 + offset;
  }

Then the 3 instances would become

  rlen = omnia_compute_reply_len(rising, true, 0);
  flen = omnia_compute_reply_len(falling, true, 1);
  err = omnia_cmd_read(client, cmd, &reply,
                       omnia_compute_reply_len(bits, false, 0));

What do you think?

