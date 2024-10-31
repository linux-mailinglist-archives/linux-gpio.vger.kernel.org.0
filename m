Return-Path: <linux-gpio+bounces-12385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 095A79B80E1
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 18:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C193528217E
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Oct 2024 17:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37261C6F59;
	Thu, 31 Oct 2024 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mt44Bp8S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3E1BD4E5;
	Thu, 31 Oct 2024 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730394477; cv=none; b=TsYLw7bm88KfchRDC8x/jUwmRe8IZUFRBAmNVHVCO41mc1VJqmkOynDVE3vEQwjnLxE4mv8Nr4K861OFTI6+1ZwhK7nAF81y+C4bsEWoo4wFBouBEyBgEOf8Tfs1h3Qej8UZnoCMw67LtVvS4eqrtevEdqad4VWkl7Ztx9fP8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730394477; c=relaxed/simple;
	bh=b58Q8LPqCMknW6TVeH8ostYyFsH+RiBUsC302ewOwxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Af5jwveRy5L6LrE6btf1ovz2xhYgSa2knkpWeFhI4uLBrqF+vvwbHdvkX3BYyEOeftcZuCywYTBmCdmKfzCM6gNlx3av57jnSQONP9oPMUNY0HtlisMjgJ9dkGPiuoTW9DiY4bhGME2x6Cr1d0anCxiA3Cd8FByHeQ77yXAz+X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mt44Bp8S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCDDC4CEC3;
	Thu, 31 Oct 2024 17:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730394477;
	bh=b58Q8LPqCMknW6TVeH8ostYyFsH+RiBUsC302ewOwxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mt44Bp8SUtkUMRBYDbk4vB5xY1wmx2LJrOpsNF9PUPmXfFtxW6KYpDVBIWw8pUer5
	 sZihVUTXgiKn+aXPRIsPF7g7zDedlTkcWU5E0isv3yVI4tSHUQ/8N7rtrZlTMB1ayu
	 ufmSWXvAlj599o9NEWO8iiK5brAqO80cvfuUDjRHuL9vSOH1Nzuuj79/2qltyH+1Q7
	 opf3r4xemqxPF9aCoeu7gdEK1H0WR4xPt6SriKqTn9qpLQRNrFJ1xV3DAYONmaH+GS
	 tsEmMcvc/yU3yOPMlHqVvpW097jC/IlgT5MiInd0At4YjFWpHYCvFlJMu0IltTcXlj
	 Pp5lrR/FD8eyw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t6YeJ-000000007ya-249B;
	Thu, 31 Oct 2024 18:07:55 +0100
Date: Thu, 31 Oct 2024 18:07:55 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/3] gpiolib: fix debugfs dangling chip separator
Message-ID: <ZyO5a85wq1fKD-ln@hovoldconsulting.com>
References: <20241028125000.24051-1-johan+linaro@kernel.org>
 <20241028125000.24051-3-johan+linaro@kernel.org>
 <CAMRc=Mf6yaZMsF5x=vPet=y9fa5ZTuWSAA=oi+Qw07TF8GEFbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf6yaZMsF5x=vPet=y9fa5ZTuWSAA=oi+Qw07TF8GEFbA@mail.gmail.com>

On Thu, Oct 31, 2024 at 06:02:43PM +0100, Bartosz Golaszewski wrote:

> But with this change we go from an incorrect:
> 
> # cat /sys/kernel/debug/gpio
> gpiochip0: (dangling chip)
> gpiochip1: (dangling chip)
> gpiochip2: (dangling chip)root@qemux86-64:~#
> 
> to still incorrect:
> 
> # cat /sys/kernel/debug/gpio
> gpiochip0: (dangling chip)
> 
> gpiochip1: (dangling chip)
> 
> gpiochip2: (dangling chip)

Why do you think this is incorrect? Every chip section is separated by
an empty line, just as it should be:

gpiochip0: GPIOs 512-517, parent: platform/c42d000.spmi:pmic@0:gpio@8800, c42d000.spmi:pmic@0:gpio@8800:
 gpio1 : in   low  normal  vin-0 no pull                     push-pull  low     atest-1 dtest-0
 gpio2 : in   low  normal  vin-0 no pull                     push-pull  low     atest-1 dtest-0
 gpio3 : out  low  func1   vin-0 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio4 : in   low  normal  vin-0 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio5 : ---
 gpio6 : in   high normal  vin-0 pull-up 30uA                push-pull  low     atest-1 dtest-0

gpiochip1: GPIOs 518-529, parent: platform/c42d000.spmi:pmic@1:gpio@8800, c42d000.spmi:pmic@1:gpio@8800:
 gpio1 : in   low  normal  vin-0 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio2 : in   low  normal  vin-0 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio3 : ---
 gpio4 : ---
 gpio5 : in   high normal  vin-0 pull-up 30uA                push-pull  low     atest-1 dtest-0
 gpio6 : in   high normal  vin-1 pull-up 30uA                push-pull  low     atest-1 dtest-0
 gpio7 : out  high func1   vin-1 no pull                     push-pull  low     atest-1 dtest-0
 gpio8 : in   low  normal  vin-0 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio9 : in   low  normal  vin-0 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio10: out  high normal  vin-1 no pull                     push-pull  low     atest-1 dtest-0
 gpio11: out  high normal  vin-1 no pull                     push-pull  low     atest-1 dtest-0
 gpio12: in   low  normal  vin-1 pull-down 10uA              push-pull  low     atest-1 dtest-0

gpiochip2: GPIOs 530-537, parent: platform/c42d000.spmi:pmic@2:gpio@8800, c42d000.spmi:pmic@2:gpio@8800:
 gpio1 : in   low  normal  vin-0 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio2 : in   low  normal  vin-0 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio3 : in   low  normal  vin-0 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio4 : out  high normal  vin-1 pull-down 10uA              push-pull  medium  atest-1 dtest-0
 gpio5 : in   low  normal  vin-1 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio6 : out  high normal  vin-1 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio7 : in   low  normal  vin-0 pull-down 10uA              push-pull  low     atest-1 dtest-0
 gpio8 : out  low  normal  vin-1 pull-down 10uA              push-pull  low     atest-1 dtest-0

Johan

