Return-Path: <linux-gpio+bounces-27368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4C0BF6679
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F30519A368A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 12:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5E0D3148DA;
	Tue, 21 Oct 2025 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fS9G2mem"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6366517BED0;
	Tue, 21 Oct 2025 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761049208; cv=none; b=kAXoh/QnMwRC7yEvGjVyLMVKPp55OZKPFwXG4NiYbXHiZcwSn2qXbaT6Dnk22gChrGpQS3Dx1I1Ecu1SSUh9X7h89rOgv/OO0scHpqozEMUOlUYdfJOaVu1y985kOIdtv/KVOLcBSbd4d4JpUYh6d5JyEBgczrQRAQEd4ewHe4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761049208; c=relaxed/simple;
	bh=kM8hqpbBBEderQZ7K5It9tLsDk3Uhl2Kuy4s2NW4hIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLvLliRe7R4pAlqsxdJtF48YYcxd2abUmnm/N+w7vT92HCVqSWji7P+fnVN9uXV/qPmhP7wtZFAw/cMMcc8TRJgZkE9pw+2epRndAvuFajnO1Nm3UjthX0Fio0iqXoejLg64Sz8Rnp0sRAQkDArRAUmfZmA0v0cGp70h1N2RR4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fS9G2mem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B49CC4CEF1;
	Tue, 21 Oct 2025 12:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761049207;
	bh=kM8hqpbBBEderQZ7K5It9tLsDk3Uhl2Kuy4s2NW4hIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fS9G2memMMz4jX0r7IZpahu8AsHG5Okw0+UeZz6kCEUhKzfiB6ty4K4xwjMdFImnY
	 1SdGyX448pAvDsnUlrmofzTMbzypcmLFXmVwwbw38aEXoudAFh0Y4iINEKCF5Hdf4I
	 Mtfmabv/gJFrkt5zGEpZ0ORWKNuOf1OUEH1p0MGnA23wimAYfefTk97kWtJwpSy+bY
	 JFx8tQ70Hp25UmPx7qXeUjCzsUpqxNS0spGWlUOQbnXhUbvXB9NXIuMGVoO3/vNbDs
	 frC3zo3LtikcIJdtgYyaYvSyUZB9D3b8PUUbTOnFhR7rTLpRylXfZWHZZAJowHvj2L
	 5V2ngxNGq7yFQ==
Date: Tue, 21 Oct 2025 17:49:44 +0530
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
Message-ID: <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com>

On Tue, Oct 21, 2025 at 02:06:30PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 3:53 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > >
> > > That only happens if the driver uses the reset API. If you go with the
> > > GPIOLIB then none of this matters. I definitely don't want to change
> > > the existing DT sources either but I want to find out if the code in
> > > this series is suitable (with some modifications) for supporting the
> > > PERST# line or if the logic behind it is more complex and possibly
> > > requires separate, more fine-grained handling.
> > >
> >
> > All PCI controllers relied on '{reset/perst}-gpios' property for handling the
> > PERST# signal. Now if we change it to a reset line, then the drivers have to
> > first detect it as a reset line and use the reset APIs, if not fallback to gpiod
> > APIs (for DT backwards compatibility), which will add unncessary churn IMO.
> >
> 
> Ok so some platforms define perst-gpios while others use reset-gpios,
> I see now. Yeah, it's better to go with explicit GPIOs then.
> 
> > But if there is no way the GPIO subsystem is going to support shared GPIOs, then
> > we have to live with it.
> >
> 
> Well, there is going to be. We already de-facto have it but it doesn't
> work very well and is fragile (I'm talking about the non-exclusive
> flag). I very much intend to bring this upstream.
> 
> My question wrt PCI PERST# was whether this is useful for it because
> IIRC all endpoints sharing the signal will assert it (or rather their
> pwrctl drivers will) and then only deassert it once all endpoints are
> powered up. This would translate to the pwrctl driver doing the
> following for each endpoint:
> 
> perst = gpiod_get(dev, "perst");
> gpiod_set_value_cansleep(perst, 1);
> 
> Do the power up.
> 
> gpiod_set_value_cansleep(perst, 0);
> 
> And with the implementation this series proposes it would mean that
> the perst signal will go high after the first endpoint pwrctl driver
> sets it to high and only go down once the last driver sets it to low.
> The only thing I'm not sure about is the synchronization between the
> endpoints - how do we wait for all of them to be powered-up before
> calling the last gpiod_set_value()?
> 

That will be handled by the pwrctrl core. Not today, but in the coming days.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

