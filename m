Return-Path: <linux-gpio+bounces-26839-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF3BBE85E
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 17:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A4393BF09D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 15:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960732D877A;
	Mon,  6 Oct 2025 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9wVRa1m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FCA18FDBD;
	Mon,  6 Oct 2025 15:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759765430; cv=none; b=shrk6VbNSfRKXNSNbhvgVMf0hxN07NEUrpVjU7RWhPulvw3ssc0vtaVbXApigLeyrcSH4LrOZXo89BPx9y1BraMUP/6QwUtAZDE9sK8D1arKjaq3+Q8/QixpWYmKZL/T6/Okh3hZLVawWk4TZ0n8uD02aJc0vGcyf48rSMcUe8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759765430; c=relaxed/simple;
	bh=U9taQDdhEq0Hr+LrDG0gIGzCorDNrdISkQr4eQ/LzLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+k/lo7O8mercQeCdKrVhlg/tFvXZhRmh/Qazx05COD50KYI7ROMthWZKH4xUygms5cnARLMWiq+A6yiJO1UkuilutqGoj9nhea8wEDupgQgm+Ok0rYwA1ZSt99Q/nwdCdUGeTJzoHYBPB6hhl+a1eSozIcgACZXobPWn0YL9wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9wVRa1m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B325C4CEF5;
	Mon,  6 Oct 2025 15:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759765429;
	bh=U9taQDdhEq0Hr+LrDG0gIGzCorDNrdISkQr4eQ/LzLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M9wVRa1m/ER2+xT1SLzEI+eRcA3ZENPekBsLbBSuDM+SW5K5ZqvgN2Pl0lYu8qPLZ
	 iXr74DqgjReTkOFRsIoynkficpE2aHVAxYMCKLyFpC2dlpGTUFMZLBPnJ3+wdarTO0
	 0tsBt19WkNaP+VV/W+PKm6wTRxd20RXf2cXWppSrlvz3vNWHYM0tifMR6OOyuMG2aB
	 BJM/ENlMx0f2hoUmbwgFaZn54PHceuPvJa1Vc6uSGPi/fTW1TVfOtm+h+4VoM6fVrs
	 UvoovmWW+8cKyuRrAvj/v0dC37FRCu41fmn/X6sWPOgaxY+vSg+T+YORmBfB5jZH9h
	 8UqkyPahSVsoA==
Date: Mon, 6 Oct 2025 08:43:47 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>

On Wed, Sep 24, 2025 at 11:25:12AM -0700, Dmitry Torokhov wrote:
> Hi Bartosz,
> 
> On Wed, Sep 24, 2025 at 04:51:28PM +0200, Bartosz Golaszewski wrote:
> > Here's a functional RFC for improving the handling of shared GPIOs in
> > linux.
> > 
> > Problem statement: GPIOs are implemented as a strictly exclusive
> > resource in the kernel but there are lots of platforms on which single
> > pin is shared by multiple devices which don't communicate so need some
> > way of properly sharing access to a GPIO. What we have now is the
> > GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> > doesn't do any locking or arbitration of access - it literally just hand
> > the same GPIO descriptor to all interested users.
> > 
> > The proposed solution is composed of three major parts: the high-level,
> > shared GPIO proxy driver that arbitrates access to the shared pin and
> > exposes a regular GPIO chip interface to consumers, a low-level shared
> > GPIOLIB module that scans firmware nodes and creates auxiliary devices
> > that attach to the proxy driver and finally a set of core GPIOLIB
> > changes that plug the former into the GPIO lookup path.
> > 
> > The changes are implemented in a way that allows to seamlessly compile
> > out any code related to sharing GPIOs for systems that don't need it.
> > 
> > The practical use-case for this are the powerdown GPIOs shared by
> > speakers on Qualcomm db845c platform, however I have also extensively
> > tested it using gpio-virtuser on arm64 qemu with various DT
> > configurations.
> 
> How is this different from the existing gpio-backed regulator/supply?
> IMO GPIOs are naturally exclusive-use resources (in cases when you need
> to control them, not simply read their state), and when there is a need
> to share them there are more appropriate abstractions that are built on
> top of GPIOs...
> 

Not always... For something like shared reset line, consumers request the line
as GPIO and expect gpiolib to do resource manangement.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

