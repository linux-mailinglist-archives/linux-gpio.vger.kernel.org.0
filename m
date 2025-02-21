Return-Path: <linux-gpio+bounces-16405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9DCA3FFE6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 20:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 821663A7E0C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 19:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5697D2528E5;
	Fri, 21 Feb 2025 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Mg28JmPm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F651FBC93
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 19:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740166897; cv=none; b=TnSJXWBhIUcswWYrqsnULWUweX2ZRnwsJZ8mcGOjzCL5SCzq/YAZQ+cfdQc2IqEBnngCrkBUjCEr6PPNGIHs9D9F0V9QNIt2aOx2oyUGdyBqx5L/nw+yASZEKh/CTNDBFSPEi0RzE/dIeJIUCS5hh36xYMXl9SmdqCSBFT7wSGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740166897; c=relaxed/simple;
	bh=m7cs4zzvtULX46fKW0sUQXLrwwDkAKqyNIJh8VzHzJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZGL6BqOy/ilt8dIXIRtD38c+SSalfj918nPN9Q3S8+KcWBLIzLtmhxCD1UQ0xODys3hY7xdCSobxWdWh2kvAx8yNG5S0X3pG7igujiM9BK8ID0aMQ5wdLLjYYVoiJYeVRbBnLMy8WDQZH4QsU7yFtHdmuo8+yL3v6L9DZo1pvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Mg28JmPm; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7E0310382D3C;
	Fri, 21 Feb 2025 20:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740166892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9A0QAegeRtgTsmf6i8nDwpToAmAw4phMNlcNIQAefgQ=;
	b=Mg28JmPmG205qRzH5B/shpvAXJp7+V33zGZtgd3pQoXMnutFiJkoLwE8y1fv5ImrMachOT
	d4WXKEGWf/xq5DBS7N08JELPU8jtYOaZsL8/xsDdPGld5MmM8k7cV7dAaFy4kit8ktSpC/
	++cgq0CAF7w3hK2IimbOcbYotUf7aqjZbpE8Yu5bZqGe3EZsKQI/LAG9k/t27zZKwzQnpE
	6af8Fn61lPx+I7k1STTkQvcRZVrPS93Q8xyfZKh67OdS7iUKaUo2Dq4BFa+1pd+tJF+7Fp
	84oBSFnddUGe6HwTF1b5o7bCCZ4Acrm88GYBF9pHCdnrXseWjgV/D2ZcloTHPw==
Message-ID: <e5bdcca6-4d1b-451c-8fde-990db9db23d8@denx.de>
Date: Fri, 21 Feb 2025 19:01:35 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Replacing global GPIO numbers in sysfs with hardware offsets
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>, Kent Gibson
 <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
 <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CACRpkdZXm9eFJ2nzb5Gsm_ddirt6XZTQyu2G+vX2FB+=L6Lttw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 2/14/25 10:14 AM, Linus Walleij wrote:
> On Sun, Feb 2, 2025 at 1:46 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

Hi,

I'm sorry for the late reply.

>> I think it was Ahmad or Marek who suggested that users aren't really
>> attached to the global numbering but to the ease of use of sysfs.
>>
>> I floated an idea of introducing a backward compatible change to sysfs
>> that would allow users to identify GPIOs by the label of their parent
>> chip and the hardware offset of the line within that chip (...)
>>
>> We could then encourage users to switch to using the chip-local
>> exports and eventually at least remove the global export/unexport pair
>> if we cannot make the entire sysfs class go away.
>>
>> Please let me know what you think about it?
> 
> Yes, I think it is mostly equivalent to what I say in drivers/gpio/TODO,
> my only point being that when we add something like this, we
> put it in debugfs where it belongs, and as illustrated by your
> example, it is indeed used for debugging/exploring the
> system:

I would very much like to avoid having to enable debugfs on production 
systems to access GPIOs in early userspace (e.g. initramfs). This was so 
far possible via the sysfs API without tools, currently it is becoming 
not easily possible. A sysfs API "v2" which makes that possible would be 
very much appreciated.

Also note that I do not care about static GPIO number assignment in the 
sysfs API, so that part can go.

> ----------------8<----------------------------8<------------------------
> Debugfs in place of sysfs
> 
> The old sysfs code that enables simple uses of GPIOs from the
> command line is still popular despite the existance of the proper
> character device. The reason is that it is simple to use on
> root filesystems where you only have a minimal set of tools such
> as "cat", "echo" etc.

Yes

> The old sysfs still need to be strongly deprecated and removed
> as it relies on the global GPIO numberspace that assume a strict
> order of global GPIO numbers that do not change between boots
> and is independent of probe order.

Yes

> To solve this and provide an ABI that people can use for hacks
> and development, implement a debugfs

sysfs please.

[...]

