Return-Path: <linux-gpio+bounces-27332-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D29BF4532
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 03:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56A3E4F09B5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 01:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33152417C6;
	Tue, 21 Oct 2025 01:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhSer6FA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602677E105;
	Tue, 21 Oct 2025 01:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761011633; cv=none; b=Nan5ivN2ygUsnQmNh87iyEGnH+wBLX79LXo4KkDNOJ/xETWHTK90lRjlNPlgb++OOY9nZirMtSz6p1ApsnOTk5CeNgga9HDy7Nwl3+xfQ6ozi9vtDaTLdsaTG+QjWccOUikv1F7sR/Bx4cgOe0sTYucgDuNwhbfAIlsVPnnUaHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761011633; c=relaxed/simple;
	bh=gEFXq3ZbGcZ2wLt1kNCnmyzf7qCy7XGcSSRG5SuAU8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsRvVCV9Ppb7irG60tSaY2kqpg1jfIMnGFwUrkBJug0Memnyr9qzVNH8zV2R0qJb2ZR5/GoMjwEUbaoKkbfVBO3CLqlIWk4OBUkO+zFJWiG2rm5x1PA4ZTyIha0cibcUYD7gpyfFZ2pbzGGJDEOxgCF5xuDIiEGOWRwxplFY33o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhSer6FA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C0EC4CEFB;
	Tue, 21 Oct 2025 01:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761011633;
	bh=gEFXq3ZbGcZ2wLt1kNCnmyzf7qCy7XGcSSRG5SuAU8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhSer6FAbofHcgD61qoh5QzZYC4905I96PcCZWfI86ac1ynePuJi3fg0VrjU9ztAo
	 XkR6dgKlCQnBR0dsVJeZNZPgnQB/RUGODC9QoLTYhQjR6KMtKOAmjqopw3rdEynIfH
	 Vmbx1RjuwgnyFqnleQEZTrdFrVMapKDurCZ6J2JRxqY/dHT6Ar+xeS0eD68/DIOKvI
	 Ysb7LH67G5pD87/ezpN+lEAEQPCuYRmpogqeTZbdxOD/3O1PmZOJawv0JS8N3wEeMx
	 +kifMX87l6Y3ReoHxNohaM65naJhnkJwFJXQEKTfd9ZAYoODmDf/CaWQMRURoY0Bxa
	 xbw5EKuNfqZIA==
Date: Tue, 21 Oct 2025 07:23:38 +0530
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
Message-ID: <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>

On Tue, Oct 07, 2025 at 02:29:01PM +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 7, 2025 at 12:09 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > > >
> > > > Not always... For something like shared reset line, consumers request the line
> > > > as GPIO and expect gpiolib to do resource manangement.
> > > >
> > >
> > > They could use the reset API and it would implicitly create a virtual
> > > device that requests the reset GPIO and controls its enable count.
> > > Except that some devices also do a specific reset sequence with delays
> > > etc. That would require some additional logic in reset-gpio.
> > >
> >
> > I was referring to the PCIe PERST# line, for which the 'reset-gpios' property
> > already exist in the schema. Now, you want me to model this simple GPIO as a
> > fake reset controller and use it the PCIe Bridge nodes through 'resets'
> > property?
> >
> 
> No, not at all. It's just that a shared `reset-gpios` property is
> pretty common and Krzysztof implemented the reset-gpio driver[1] to
> address it. Drivers that request a reset control via the OF interface
> will notice that there's no `resets` property but if there's a
> `reset-gpios`, the reset core will create a virtual device binding to
> the reset-gpio driver which requests the GPIO in question (once!) and
> registers with the reset subsystem providing shared reset control to
> users. Basically the abstraction Srini mentioned minus any reset
> sequence.
> 
> That only happens if the driver uses the reset API. If you go with the
> GPIOLIB then none of this matters. I definitely don't want to change
> the existing DT sources either but I want to find out if the code in
> this series is suitable (with some modifications) for supporting the
> PERST# line or if the logic behind it is more complex and possibly
> requires separate, more fine-grained handling.
> 

All PCI controllers relied on '{reset/perst}-gpios' property for handling the
PERST# signal. Now if we change it to a reset line, then the drivers have to
first detect it as a reset line and use the reset APIs, if not fallback to gpiod
APIs (for DT backwards compatibility), which will add unncessary churn IMO.

But if there is no way the GPIO subsystem is going to support shared GPIOs, then
we have to live with it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

