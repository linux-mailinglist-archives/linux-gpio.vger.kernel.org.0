Return-Path: <linux-gpio+bounces-16624-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A83A2A45F9A
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 13:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA0DC16A439
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 12:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E545F215769;
	Wed, 26 Feb 2025 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ZOca+AcB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972FD2153D1
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573840; cv=none; b=RU958hFFOYV+MBSTEp8V18WztU+vRpmDrKMw8EriBJW9O75Hq/vVQw0pSgBivZfZAfHIUdp5F+aLx5ItvbDr+ulveQQ/3cCsWlTFQGS+RpSCUEfo5JqG2QZen2C/hCKiW0S6Z9JaGtJSDg0sYv1XBOOWBR2s0OsgUITc+5t2PD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573840; c=relaxed/simple;
	bh=grg2ChQ79XyecY0CzWhPK5SAmwCC/4Sunav/rUhQNaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWiSm/FXMPaDyySqeox91M0tvvT9JeC1kLidu8aMsyspE6aiKRN2QhUOQqpWBBlrbFknDMbkOgEHHHqzX3RkWn/SuYR63pWcKHHzDUSSfBuy7sFxHWLgc7vB1tZbfdcPf/clbgMutGFxYxuDVwhvn0WBdRfqRihRDgkuKuzkzGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ZOca+AcB; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE8E810382F09;
	Wed, 26 Feb 2025 13:43:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740573836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7csNVPskAQxdNjUyIDD/mnxx7lmRTPv6uYgkh/1wXQI=;
	b=ZOca+AcBQ1rk3EIs0Blvpv4TGJExujSM4MHwC5rrn4+HhhZLZdr7n7AZa77Zwvt5CXEduq
	zIW3xNzxHsj9kLwewxcU/xusiRCwxttDZLEmvEEtK2S22a3xiqPB/bTwzMaFjqbGP3mcfI
	woUyW4H0oSgNB6GaVUEfP+NG+MBtaaduzVnXPyooBU8rFw4fHUeyrywCysAixYfRvMbZV1
	ra3xvp/pxRsrOCmFnOGI+uEsmwafJoU/0TiqglqQ3utWThRjp4JtXq8Xh/1Ghz9GwDy3gQ
	903bqtOP/NJCn8JM1sD5p8fLTIX2jX5qwkWurGy0x9G6hOY3zxyNpZJ5APciLA==
Message-ID: <d29f36d1-53e0-42d3-beed-cc228553f658@denx.de>
Date: Wed, 26 Feb 2025 13:36:44 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson <warthog618@gmail.com>,
 =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
 <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de>
 <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdaGeV3v80QuWwus5rg9GfKkT_gzhvRgfOobnDMUO2cPEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/25/25 8:54 PM, Linus Walleij wrote:
> On Fri, Feb 21, 2025 at 8:41 PM Marek Vasut <marex@denx.de> wrote:
> 
>> I would very much like to avoid having to enable debugfs on production
>> systems to access GPIOs in early userspace (e.g. initramfs).
> 
> I didn't understand that. It was because Bartosz used the word "play":

Uh oh ... in short, the entire discussion between me and Bartosz at 
FOSDEM could be summarized to (please correct me if I'm wrong and I'm 
stuffing words into someone's mouth):

- Bartosz does not like fixed static GPIO number assignment, we agree
- Bartosz wants to write more userspace tools to operate GPIO chardev
   API, we do not agree, Marek already has all the tools built into shell
   (printf, echo, cat)

=> Some sysfs API "v2" which does not suffer from the defects of the
    current one would be great. The benefit would be:
    - Can be operated without extra tools, simple printf/echo/cat into
      sysfs attributes would suffice
    - Would work even in the simplest of userspaces (initramfs, remote
      access VMs, etc.), which is practical for board bring up and well,
      other limited deployments

That's really all this is about, get rid of the defects of the old sysfs 
API, but keep the tooling requirements to minimum.

Also note that API "v2" attribute layout could differ from API "v1" , 
that is not a problem.

>>> The gist of it is: some people need to play with GPIOs very early, for
>>> example in an initramfs
> 
> So I took that word literal: explore, play around. Not develop
> products.
> 
>> This was so
>> far possible via the sysfs API without tools, currently it is becoming
>> not easily possible. A sysfs API "v2" which makes that possible would be
>> very much appreciated.
> 
> I understand, I'm fine with sysfs if it needs to be a "support forever"
> ABI, as long as it's:
> 
> - Using the per-chip HW numberspace

This is no issue for me.

> - Doesn't need any echo NN > export to see the lines in
>    sysfs.

Can we really make do without export/unexport ?

Consider this scenario:

- User open()s and write()s /sys/bus/gpio/gpiochip0/gpio0/value
- User keeps FD to /sys/bus/gpio/gpiochip0/gpio0/value open
- Kernel module gets loaded, binds to DT node which references the same GPIO
- User write()s /sys/bus/gpio/gpiochip0/gpio0/value open again

I wonder if this could pose a problem ?

I suspect the kernel module loading should fail , right ?

