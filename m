Return-Path: <linux-gpio+bounces-26846-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE93ABBFA33
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 00:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 535053C1D99
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 22:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B979D1DFDB8;
	Mon,  6 Oct 2025 22:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OadGq4OT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B283C17;
	Mon,  6 Oct 2025 22:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759788549; cv=none; b=Bzk+ueul2dTIUrjRwMJZBiHjNlb/rVZCtBLgYm7rd1pJAJJDzvzzjox0nOPTT7VYNo3ki5u/lRl2/qFOuqoOu8PDRtbEOLekAvPJBLsq76UNGG0jR8gZOMslkiYTRm1WxZeYi+VsvzysyLbJ81nB9gw/c+mQKgUKxmQsFRvQlLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759788549; c=relaxed/simple;
	bh=HwUN7J8ArjHOInDdcpqRzu7gnAEX4XfnbmUq6Y2Ey+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGuRgc2li3AVlFRLU+juZdl2FOOwQ4WpjGYEMwQCdh3kiAZLxbXYBgIyPZTy+Be2rvmjxqd1i0PLam2iU6HcOjlpLk3Q/qTdjhXRxRSq8gE9EOXZGoTlwAbk7iPrJ4IHKYY1RMETcViSUhZ1URcBWx3Tdkr3D4y/CNZh37bdqgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OadGq4OT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A569FC4CEF5;
	Mon,  6 Oct 2025 22:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759788548;
	bh=HwUN7J8ArjHOInDdcpqRzu7gnAEX4XfnbmUq6Y2Ey+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OadGq4OTA3RaVEV5z0R+a2vo8JhA0rY/4gwcSliNnqiGvKEaC6en4KpK3lQIE5r5C
	 9BDESevRDb5QPgUdzajGh9H4oclojsoUntXwDy2qVmjzJ7S+Ci5zAiXseQ3s8byF1u
	 Vizrr++wLQsWdhF3Ymz3zmpWxrcsovG8aoWHo25KGyM9Mbz39aNzwn2VIfaNaHA9pE
	 b3Ygaa1ca+/BULJ33M62ORf0IFYxn1x+xSgVvbCANPBxP1PA09IfbI3xHSZ43qnoZq
	 RzOhyVjVXhiN1+rANDljbbRtwkLlBD+4jFZmv8QPG58xaSp8+PWYrifUn3D9iJBn7o
	 +dQMGmfQmR9ng==
Date: Mon, 6 Oct 2025 15:09:06 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>

On Mon, Oct 06, 2025 at 06:10:59PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 6, 2025 at 5:43 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Wed, Sep 24, 2025 at 11:25:12AM -0700, Dmitry Torokhov wrote:
> > > Hi Bartosz,
> > >
> > > >
> > > > The practical use-case for this are the powerdown GPIOs shared by
> > > > speakers on Qualcomm db845c platform, however I have also extensively
> > > > tested it using gpio-virtuser on arm64 qemu with various DT
> > > > configurations.
> > >
> > > How is this different from the existing gpio-backed regulator/supply?
> > > IMO GPIOs are naturally exclusive-use resources (in cases when you need
> > > to control them, not simply read their state), and when there is a need
> > > to share them there are more appropriate abstractions that are built on
> > > top of GPIOs...
> > >
> >
> > Not always... For something like shared reset line, consumers request the line
> > as GPIO and expect gpiolib to do resource manangement.
> >
> 
> They could use the reset API and it would implicitly create a virtual
> device that requests the reset GPIO and controls its enable count.
> Except that some devices also do a specific reset sequence with delays
> etc. That would require some additional logic in reset-gpio.
> 

I was referring to the PCIe PERST# line, for which the 'reset-gpios' property
already exist in the schema. Now, you want me to model this simple GPIO as a
fake reset controller and use it the PCIe Bridge nodes through 'resets'
property?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

