Return-Path: <linux-gpio+bounces-26801-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C23FBB8E09
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Oct 2025 15:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 96EF14E2936
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Oct 2025 13:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24645157A6B;
	Sat,  4 Oct 2025 13:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuK8CBuo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C979938FA6;
	Sat,  4 Oct 2025 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759584721; cv=none; b=FtE8yRpaypiHQd5fWIjDn22iV6SxOJ24qKFPBHyzNXOPxZcTZEBGC1GmMcH8cmcbUROyl88MigJqjo2ghnmK8oDXyAZGtB+UgYUCgsueOu+4A6j8fWJq7Q589WkmPJXRsVxJmMo9Ig9AJzah5QbGAzd4re+STGtEzsn2RHUCPCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759584721; c=relaxed/simple;
	bh=dtmZx205TbjsYteBttndCYNtOK23Kq5LL1dH+feqtx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NHERDGNq1sMdqmH+2XIBaNl+t+1V9SBQpJIsqon3Wgq7cWkkYqwv3xV2lqL3oiWZ/N5xEJrBy9fn3ODxVSZ7sVYI4qB/899asm3BY/fAgD3TcvCCt6EoN4wW9cBVnf75bDR66LqH6ougGYIA9ViBrlIKP9dzMRwCv4D0iIQI3Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuK8CBuo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D834C4CEF1;
	Sat,  4 Oct 2025 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759584721;
	bh=dtmZx205TbjsYteBttndCYNtOK23Kq5LL1dH+feqtx4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tuK8CBuoTxTO4Xa5yiMNdJJpBschaPLAH1WzqJwCfhIDwg5uol+XtbGz96beo1vIq
	 btMwgsthkafHWvTyJwJt0JegsZLrVX7jXSWEfU4g0mu/IG/QVY9QzKynR9aIy2ld+3
	 z4b5IljflliTuGzxvzPJgYeTRRH6QhbWoqIanV1io4e8wdHEjGRrKxcKXNR4NMKudH
	 XO8i8Ua7OYjmfZgAa2XX5S1SJbebFap5Lqvw2rILtR4F6bALaFS4Sn7ghteYbfPayz
	 PzJqjQauzvh43v/u0M1Evxq2AgbaAMIbiSesM2SQTBFOvkQ9r0u1atoM4jSHNJZGvK
	 ppBUonXw54Qyg==
Message-ID: <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
Date: Sat, 4 Oct 2025 14:31:16 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/24/25 3:51 PM, Bartosz Golaszewski wrote:
> Here's a functional RFC for improving the handling of shared GPIOs in
> linux.
> 
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.

Isn't the main issue here is about not using a correct framework around
to the gpios that driver uses. ex: the codec usecase that you are
refering in this is using gpio to reset the line, instead of using a
proper gpio-reset control. same with some of the gpio-muxes. the problem
is fixed once such direct users of gpio are move their correct frameworks.

Am not sure adding a abstraction with-in gpio framework is right
solution, But I do agree that NONEXCLUSIVE flags should disappear and
users that are using this should be moved to correct frameworks where
they belong.

--srini

> 
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
> 
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
> 
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.
> 
> I'm Cc'ing some people that may help with reviewing/be interested in
> this: OF maintainers (because the main target are OF systems initially),
> Mark Brown because most users of GPIOD_FLAGS_BIT_NONEXCLUSIVE live
> in audio or regulator drivers and one of the goals of this series is
> dropping the hand-crafted GPIO enable counting via struct
> regulator_enable_gpio in regulator core), Andy and Mika because I'd like
> to also cover ACPI (even though I don't know about any ACPI platform that
> would need this at the moment, I think it makes sense to make the
> solution complete), Dmitry (same thing but for software nodes), Mani
> (because you have a somewhat related use-case for the PERST# signal and
> I'd like to hear your input on whether this is something you can use or
> maybe it needs a separate, implicit gpio-perst driver similar to what
> Krzysztof did for reset-gpios) and Greg (because I mentioned this to you
> last week in person and I also use the auxiliary bus for the proxy
> devices).
> 
> First patch in the series is a bugfix targetting stable, I'm surprised
> nobody noticed the lockdep splat yet. The second adds a library function
> I use in a later patch. All remaining patches implement or use the
> shared GPIO support.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (9):
>       gpio: wcd934x: mark the GPIO controller as sleeping
>       string: provide strends()
>       gpiolib: define GPIOD_FLAG_SHARED
>       gpiolib: implement low-level, shared GPIO support
>       gpio: shared-proxy: implement the shared GPIO proxy driver
>       gpiolib: support shared GPIOs in core subsystem code
>       arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
>       ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>       ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
> 
>  arch/arm64/Kconfig.platforms     |   1 +
>  drivers/gpio/Kconfig             |  17 ++
>  drivers/gpio/Makefile            |   2 +
>  drivers/gpio/gpio-shared-proxy.c | 328 ++++++++++++++++++++++++++
>  drivers/gpio/gpio-wcd934x.c      |   2 +-
>  drivers/gpio/gpiolib-shared.c    | 481 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib-shared.h    |  71 ++++++
>  drivers/gpio/gpiolib.c           |  50 +++-
>  drivers/gpio/gpiolib.h           |   1 +
>  include/linux/string.h           |   2 +
>  lib/string.c                     |  19 ++
>  lib/tests/string_kunit.c         |  13 ++
>  sound/soc/codecs/wsa881x.c       |   3 +-
>  sound/soc/codecs/wsa883x.c       |   7 +-
>  14 files changed, 980 insertions(+), 17 deletions(-)
> ---
> base-commit: b46f7370d4a0f0b55f05b854e73b2a90dff41e1b
> change-id: 20250908-gpio-shared-67ec352884b6
> 
> Best regards,


