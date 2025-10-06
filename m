Return-Path: <linux-gpio+bounces-26823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D5FBBE053
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 14:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAF563AA3F9
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 12:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CD527EC80;
	Mon,  6 Oct 2025 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sbW/vY1u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B7A7080D
	for <linux-gpio@vger.kernel.org>; Mon,  6 Oct 2025 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759753573; cv=none; b=mD+dSnDFVQCJyD3H8+GkzAwytkSk10/ukRh7W7tgTqLpREn9kHKzOVPTqlDb4QB3Km1UVnG3R6vsJEl11MCyaO5M/hmVVrWocO15mJS5Tt/eEX3r/flWkptr7kZIUxQZ+D1zj3QFv297uYf2LTvBfdH9tmaosJH4DmACPCCIAf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759753573; c=relaxed/simple;
	bh=aJAxV0DXmn2LgUCBrsOfoJYmaS+Re342ogdmnSt6f/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUCj80f8SkDMcZrCbPZr47Q3CTw4IwfssvSSXSbjXq63hrEVRPR2gbHIHM6FPq8+fs9NulKSxqbji8ImAeeaWyzmJKtNdCr7mdUer6n8cG+4AhfnkVyeV6GLdDN8LSGOL12NvLLoL3SbpI/9UFSn2maK8vSrfeCLRBxM24nooTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sbW/vY1u; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9B65E4E40F14;
	Mon,  6 Oct 2025 12:26:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 65D4A606B7;
	Mon,  6 Oct 2025 12:26:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4758102F1D4B;
	Mon,  6 Oct 2025 14:26:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759753565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=wCnZA8kvYSPcXtNsyFMJbNUyCCd3snTlmczPLmygMCg=;
	b=sbW/vY1u1RkWyACl0riy5zRZ5R0p5L3yNOfry3SyyEefdC1QPWamynIXRMYuykyv69Z/75
	ie1PhoZkJhk2KeWtTvK0Xd5L5N5RnIaFgORigyMsX5/1JvMxnNER9slH3ogpKbs5pIbf/R
	34+umwoPtvrrDAQmZl02x4bOT/YBZXfmCgGrzBYy1ODpZx/xoLMRd+CC6TOAcbEOc+bi+f
	pTvY+08EVH4+LGVwCGl4RatBdwyEbfnfMYI48IeMc8BjQU4nulm8Y0ISVuAn8CbzIq9TS3
	/rFIypb2vHtRhv2gby406Z9+f7wI5C93cZi8YneQUgFAZu9+ngtudh9JcmjbZg==
Message-ID: <1003b65c-7b4f-422c-a720-9f84e5642b1d@bootlin.com>
Date: Mon, 6 Oct 2025 14:26:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: aggregator: restore the set_config operation
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <oliver.sang@intel.com>
References: <20250929-gpio-aggregator-fix-set-config-callback-v1-1-39046e1da609@bootlin.com>
 <CAMuHMdX5HXx2HSAHP-H1EEKO-csBku_cMm-OaacE7GZLXwBxOg@mail.gmail.com>
 <4db46e2b-47c4-4c81-a36f-8b195b090d2f@bootlin.com>
 <7a35f0b5-5cb3-4ab1-81b5-394d2b794f77@bootlin.com>
 <CAMuHMdU_3Wfzq_qc9odGYtSAsMMOgww90qyH+GN4eQ7cxJMG+g@mail.gmail.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <CAMuHMdU_3Wfzq_qc9odGYtSAsMMOgww90qyH+GN4eQ7cxJMG+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/6/25 9:42 AM, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Fri, 3 Oct 2025 at 16:30, Thomas Richard <thomas.richard@bootlin.com> wrote:
>> On 10/3/25 3:59 PM, Thomas Richard wrote:
>>>> Is there any specific reason why you are doing this unconditionally,
>>>> instead of only when any of its parents support .set_config(), like
>>>> was done before?
>>>>
>>> My idea was: it will be handled by the core, so the if statement is not
>>> needed. But if we conditionally add the operation we can save some time
>>> in case there is no chip supporting set_config().
>>
>> I just remembered the true reason why I'm doing this unconditionally.
>>
>> The user of the forwarder can override GPIO operations like I do in the
>> pinctrl-upboard driver [1].
>> And now we can add/remove GPIO desc at runtime, if set_config() is set
>> conditionally in gpiochip_fwd_desc_add() it will override the custom
>> set_config() operation.
>> So the only solution is to set the set_config() operation
>> unconditionally in devm_gpiochip_fwd_alloc().
> 
> OK, that makes sense, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> I do find this overriding a bit fragile.
> And in theory, such a driver could override chip->can_sleep to false,
> which might be overwritten again by gpiochip_fwd_desc_add()...

Yes, I agree.
Maybe we should not export gpiochip_fwd_get_gpiochip() so it will not be
possible to get the gpio_chip and override some properties. And we add
some helpers to override the GPIO operations. I can make a try.

Regards,

Thomas

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

