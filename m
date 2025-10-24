Return-Path: <linux-gpio+bounces-27575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0040CC04ADF
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 09:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DF8194FF1E9
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Oct 2025 07:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA0A2C3266;
	Fri, 24 Oct 2025 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrEMO138"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CD32C0285;
	Fri, 24 Oct 2025 07:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761290252; cv=none; b=Mf98F0QrIFfm7G6Ll+kBvN8e8BUvaKgHQUlISXjo0ybsLKMC1sOuy4CT/nuupPKTATETvgZL/3ib2Gv5k5LAGbDpJzALkDEoi7EFnH8TujMAYrnb5XXSMXkXqaKVQbvc6/njWx7ODUSejlRJm7x2daFr9HocSyV7DFvyLQRTYjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761290252; c=relaxed/simple;
	bh=rMGxKZ0Ruy3iCUh4rd6b4PVfetuW2zT8H06yJpAOPnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfJwG8Y4G6eJwjIDn2GEIX/fViXOFdIrCg6o1HgVxEhQwx4D+L7jul349HooCM1jfGR1Tr15p0AkWglxTAJfWkMYAeTR4CDNuDzg9AVdQwFkem2tLrUssffCG8iIDR0GtZ0sTcAYyTimpQYZdJy4WmxotQDaw8kTbyCa9Fxp92M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrEMO138; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761290251; x=1792826251;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rMGxKZ0Ruy3iCUh4rd6b4PVfetuW2zT8H06yJpAOPnw=;
  b=JrEMO138lMJ00P6AZRdNEhIWTHqtWe2O4Of1/J/A1oUaUrQBwItdCNjK
   x7OO0KAi9jQViQBYtBKEaqj/Ekfb/B0nzdlMhXQYldlu2A6ObOiioguDJ
   tj32ZiEwt4uyCIlEF1RCGegqeKrvPQJEHOQC5iSZIJ7rhw/R4z8p9jf2k
   hHnY9H9Mx/L31yx+1AES1fk/6ilj0/OXF6iMncszOzZgn1P1XND5WRPsF
   azPgyzSboP7S9FosM7Bp60b5fx8IvXe59i2HxgDrT+dgwmTPapFqibVW1
   O8SrcSkK0bOe3BSz3qqbiIRfPf6rYVbm1r3bpI61OrEQO2b2P4ExE1FPe
   g==;
X-CSE-ConnectionGUID: B78pzK3rTZ2K9h6E15lBTw==
X-CSE-MsgGUID: w7bxsZh/QlKV5FYTiVZ5cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62499268"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="62499268"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:17:30 -0700
X-CSE-ConnectionGUID: 6dbO8RbwThiKWhQmjgGvLg==
X-CSE-MsgGUID: Ro2zwlh4RQa3GJViwyA9Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; 
   d="scan'208";a="189488248"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.211]) ([10.245.246.211])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 00:17:21 -0700
Message-ID: <db05003c-8ac5-49da-b0ce-e0b668f49caf@linux.intel.com>
Date: Fri, 24 Oct 2025 10:17:28 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] gpio: improve support for shared GPIOs
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
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/10/2025 16:10, Bartosz Golaszewski wrote:
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.

I had few stabs on this in the past, all got somehow derailed, one
example was:
https://lkml.org/lkml/2019/10/30/311

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
> Merging strategy: patches 1-6 should go through the GPIO tree and then
> ARM-SoC, ASoC and regulator trees can pull these changes from an
> immutable branch and apply the remaining patches.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Changes in v2:
> - Fix a memory leak in error path in gpiolib-shared
> - Drop the gpio-wcd934x fix that already went upstream
> - Free resources used during scanning by GPIOs that turned out to be
>   unique
> - Rework the OF property scanning
> - Add patches making the regulator subsystem aware of shared GPIOs
>   managed by GPIOLIB
> - Link to v1: https://lore.kernel.org/r/20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org
> 
> ---
> Bartosz Golaszewski (10):
>       string: provide strends()
>       gpiolib: define GPIOD_FLAG_SHARED
>       gpiolib: implement low-level, shared GPIO support
>       gpio: shared-proxy: implement the shared GPIO proxy driver
>       gpiolib: support shared GPIOs in core subsystem code
>       gpio: provide gpiod_is_shared()
>       arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
>       ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>       ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE flag from GPIO lookup
>       regulator: make the subsystem aware of shared GPIOs
> 
>  arch/arm64/Kconfig.platforms     |   1 +
>  drivers/gpio/Kconfig             |  17 ++
>  drivers/gpio/Makefile            |   2 +
>  drivers/gpio/gpio-shared-proxy.c | 329 ++++++++++++++++++++++++
>  drivers/gpio/gpiolib-shared.c    | 530 +++++++++++++++++++++++++++++++++++++++
>  drivers/gpio/gpiolib-shared.h    |  71 ++++++
>  drivers/gpio/gpiolib.c           |  70 +++++-
>  drivers/gpio/gpiolib.h           |   2 +
>  drivers/regulator/core.c         |   8 +
>  include/linux/gpio/consumer.h    |   9 +
>  include/linux/string.h           |   2 +
>  lib/string.c                     |  19 ++
>  lib/tests/string_kunit.c         |  13 +
>  sound/soc/codecs/wsa881x.c       |   3 +-
>  sound/soc/codecs/wsa883x.c       |   7 +-
>  15 files changed, 1067 insertions(+), 16 deletions(-)
> ---
> base-commit: 304d18863e6e62a8f2d0350ce0a59596e2e42768
> change-id: 20250908-gpio-shared-67ec352884b6
> 
> Best regards,

-- 
Péter


