Return-Path: <linux-gpio+bounces-26790-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B71BEBB72F3
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Oct 2025 16:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D76C19E8118
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Oct 2025 14:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C97347DD;
	Fri,  3 Oct 2025 14:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ZnM1AJix"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CFC15E8B;
	Fri,  3 Oct 2025 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759501817; cv=none; b=sNLM00gWTUv1x36z8LrMPWdpx2qQP9zCV3A4S+/gbSacf14aOoaHZ89cEiYNHrUY8qgfzp2RcftB8945dvpr+mXgcGA74IAUY1orJ3Vy++N0POXuV8HkGJtQ73yOkAlz8TTeouz5+xtDLICUoyHq+PX9rvVqPMRuwRHbgFhqaZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759501817; c=relaxed/simple;
	bh=foriqvl7/OXsIKY4S5vg+iTVCcDQh/eaMLI1yVqfInY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EHarC3WEAlFiAGhBU5L52Bo/ybJDRO4fRrSe4fY4E7ia/jEppBi7apHSfOCu6Mh7LH42H6PVSjU3PhsDr6aFWvBY+Ym+ZQj9ea7Wm+pkl9XAucg9sLsXonP/OYfN9V9LbTLJSyGiamf8faDx/KNFVd37ZFiar1aw8KeAWeY2vjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ZnM1AJix; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BAB70C00DA0;
	Fri,  3 Oct 2025 14:29:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD61F60683;
	Fri,  3 Oct 2025 14:30:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9CC7102F1B8A;
	Fri,  3 Oct 2025 16:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759501811; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=foriqvl7/OXsIKY4S5vg+iTVCcDQh/eaMLI1yVqfInY=;
	b=ZnM1AJixsnYjsmbdaAmlgpkh4qKON1Ff+fidC8fomfGRRGe4i9g+o7siM/T1xx3Njd+jrx
	WhXN/WW7YVzrR+uJOHPAM8u882x2NYqYaONZUNIaiMbb+lWQhC/tGqWbPguo6F4TTRQOU7
	ed5/Yl2N9AllJAK3WF7fXOog7TqM17HWJJ6jXQgDjjsIQMMVIFrTvGE2UaBPtl9b3Xc8Qq
	6jhUEhLeN3il8kt+zDtSWCQpJ4XlRAu+N4qiGgBw5hMw0f4pCY7FjPZKmduA+353UEDlNk
	MR2XwvQxPYSLcQ+Ap8QC7TSrof5zNX20nZDsICVADm95I27sN02cfznZGFDRhQ==
Message-ID: <7a35f0b5-5cb3-4ab1-81b5-394d2b794f77@bootlin.com>
Date: Fri, 3 Oct 2025 16:30:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: aggregator: restore the set_config operation
From: Thomas Richard <thomas.richard@bootlin.com>
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
Content-Language: en-US
In-Reply-To: <4db46e2b-47c4-4c81-a36f-8b195b090d2f@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/3/25 3:59 PM, Thomas Richard wrote:
>>
>> Is there any specific reason why you are doing this unconditionally,
>> instead of only when any of its parents support .set_config(), like
>> was done before?
>>
> My idea was: it will be handled by the core, so the if statement is not
> needed. But if we conditionally add the operation we can save some time
> in case there is no chip supporting set_config().

I just remembered the true reason why I'm doing this unconditionally.

The user of the forwarder can override GPIO operations like I do in the
pinctrl-upboard driver [1].
And now we can add/remove GPIO desc at runtime, if set_config() is set
conditionally in gpiochip_fwd_desc_add() it will override the custom
set_config() operation.
So the only solution is to set the set_config() operation
unconditionally in devm_gpiochip_fwd_alloc().

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/pinctrl-upboard.c#n1044

Thomas

