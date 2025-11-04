Return-Path: <linux-gpio+bounces-28019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4818C314B1
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 14:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766283AF898
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 13:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223C5325714;
	Tue,  4 Nov 2025 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtKUpd2f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1EA248868;
	Tue,  4 Nov 2025 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762264135; cv=none; b=TX78QHQPjMAwp2tX+P7TvAFgAZmnRzaBtM+87UmwmYgXVELI6X+0IDuypdkFXRN7sQXqmICj7t/Y68tjMu+A/z3XPt5kQpC+cO5wsjb6uH8355utohEw8xx65QPasLn+omb9bFU1AFjNB+ExqK3mVv4CXcI1frVdoc01rM3AbxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762264135; c=relaxed/simple;
	bh=XTcyrwzPPbVxt4yuu5PoJh4o4WAUu8sxpeKAaaI1rDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naC4tNaVKgmBgYvax1UEOGrBj6GIpBtRV54Pe6MiRFAIA/W4vXk4AiFp0TluFMwQG6WhRcT1h5/mp4s6lYSQBS5ibVUEtsYJNXXv6vhux+VnxOG1/cb8lkakoATHYmFbObfyY4ogTAJaiLHFlDHCecVMhLEBdIBOczWQx+kH6Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtKUpd2f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF5EC16AAE;
	Tue,  4 Nov 2025 13:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762264135;
	bh=XTcyrwzPPbVxt4yuu5PoJh4o4WAUu8sxpeKAaaI1rDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtKUpd2fIKsw34pBrwJf/Us5+LnHw/xOgSmgF4qrWbXdaGcAYvp4zofJlRz2zf15P
	 sFyWewjCvdqgVw8xJXDa+0Qp0SMQqmuQW/ZKe1+GibtuNJTdR8oF8jY28tshkEtGHV
	 NZ77E/rLfSsm0ji9CwHQMxQBq0pYQuhLK9rDnwHoUqFV6NGRIqfNOsNhx536/KX/g7
	 8mzyqsl2l1g5j9KF3GRLrfjJZClj+s5wmxoeKbge3+l2hsLLSZ3uAKl4yE2nqE0Sle
	 a6Ox9Ha08hKFdeVDqmrYkBIHW7e4AE+CMJRKBw/SnVercsa90kpMeSKWeGRAdKez1f
	 Gu0h1nsYFhetw==
Date: Tue, 4 Nov 2025 08:48:53 -0500
From: Sasha Levin <sashal@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 6.17-5.4] ASoC: pxa: add GPIOLIB_LEGACY dependency
Message-ID: <aQoERYOC4JY57P66@laps>
References: <20251025160905.3857885-1-sashal@kernel.org>
 <20251025160905.3857885-71-sashal@kernel.org>
 <eeb6d1ab-e8ec-48dd-b8f0-0de3eaf545a6@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eeb6d1ab-e8ec-48dd-b8f0-0de3eaf545a6@app.fastmail.com>

On Mon, Oct 27, 2025 at 10:23:35AM +0100, Arnd Bergmann wrote:
>On Sat, Oct 25, 2025, at 17:55, Sasha Levin wrote:
>>
>> LLM Generated explanations, may be completely bogus:
>>
>> YES
>
>It is indeed bogus.
>
>> Rationale
>> - Fixes a real build failure during COMPILE_TEST when legacy GPIO APIs
>>   are disabled. The failure stems from `gpio_request_one()` in the PXA
>>   AC97 support code: `sound/arm/pxa2xx-ac97-lib.c:374` uses legacy GPIO
>>   (gpio_request_one/`GPIOF_OUT_INIT_HIGH`). When `GPIOLIB_LEGACY` is not
>>   enabled, these legacy interfaces are not available, leading to the
>>   implicit declaration error cited in the commit message.
>
>The build error would only happen after we make GPIOLIB_LEGACY optional,
>but in 6.17 it is still always-enabled.
>
>>
>> Notes on applicability
>> - This backport is most relevant to stable series that already have the
>>   `GPIOLIB_LEGACY` split. Older stable trees that predate
>>   `GPIOLIB_LEGACY` either won’t need this change (no build break) or may
>>   require adjusting the dependency accordingly.
>
>On older kernels, this would actively break configurations that need
>the symbols.

Dropped, thanks!

-- 
Thanks,
Sasha

