Return-Path: <linux-gpio+bounces-26845-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C44BBF9EA
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 23:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E09254F2681
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 21:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8D02638AF;
	Mon,  6 Oct 2025 21:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDCMggo7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C201F4615;
	Mon,  6 Oct 2025 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787711; cv=none; b=KwGiY9twTRydEneKhZBl906J1/ogwQr/YZFt9I5j1FnwmNy9Z5DTPZDRq1N5lu9AxUqnIxxOrMnd2ei49iVMfG1Bjx9DD25n0gKIdFaOfrYae4QQeeG8EfwaDTuMuuTm8NmVdZUf05rB4vN5FkVfW20G/jZjfN+aHna4DZMpb28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787711; c=relaxed/simple;
	bh=2aJnYVaGf8XUqQHTpB1VtEpe3tVyvm1Pn5nKvnx2EKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGZgMto220LJWJc9EOnWtJ/EHakkbI+atzZJnxc448WMVIoBW6sKDbSrI4/s83mhIhcwgDKHY3CGYvCa8fWAZOjlLziE1f2pBwYf3OhG/LGKVnee8unqJC2Yc0f81KD6uFedp2TjB1amVd3rObjiEVOgKZrf36T5V+i73LjTktg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDCMggo7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C649C4CEF9;
	Mon,  6 Oct 2025 21:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787710;
	bh=2aJnYVaGf8XUqQHTpB1VtEpe3tVyvm1Pn5nKvnx2EKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sDCMggo7LWAQ4bGGtpFw4mVsQnmJ8vYPGTBLFLD08OlFnkZ5rQvP8L7bOBcsCjeu1
	 15MuEbCjbb/Ga3sQWrglz38c/riM+jyd6Iz/dNYD2DWgqF6f9mHNpuuNZE0LtcWbEi
	 pgQ+20XL+LbqmKMBE5nLoUcnMFoYPsZ23MuOghofJ0wSyQDRs5jvm0mi73Z5jItlWG
	 7u7abns/YhJzb9tB8844XHa6iXFxM2hbsPxuYjJzJfVduuOuDZQ/+g3Yy2VzCYvPc1
	 iWldpKvf8ET82qOTJddDsXKtquQZ7yJ/dHAtGgWvvtthetXt1XADT4Xy+2CaEHA3dB
	 nPzn4bwaSM6yw==
Message-ID: <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org>
Date: Mon, 6 Oct 2025 22:55:04 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
 <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/6/25 12:55 PM, Bartosz Golaszewski wrote:
> On Sat, Oct 4, 2025 at 3:32 PM Srinivas Kandagatla <srini@kernel.org> wrote:
>> On 9/24/25 3:51 PM, Bartosz Golaszewski wrote:
>>> Here's a functional RFC for improving the handling of shared GPIOs in
>>> linux.
>>>
>>> Problem statement: GPIOs are implemented as a strictly exclusive
>>> resource in the kernel but there are lots of platforms on which single
>>> pin is shared by multiple devices which don't communicate so need some
>>> way of properly sharing access to a GPIO. What we have now is the
>>> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
>>> doesn't do any locking or arbitration of access - it literally just hand
>>> the same GPIO descriptor to all interested users.
>>
>> Isn't the main issue here is about not using a correct framework around
>> to the gpios that driver uses. ex: the codec usecase that you are
>> refering in this is using gpio to reset the line, instead of using a
>> proper gpio-reset control. same with some of the gpio-muxes. the problem
>> is fixed once such direct users of gpio are move their correct frameworks.
>>
> 
> If they were called "reset-gpios" then we could (and should) use
> Krzysztof's reset-gpio driver here, but we have many cases where
> that's not the case and the names (and implied functions) are
Yes, these codec drivers are due to be moved to use reset-gpios.

--srini
> arbitrary. In the case addressed in this series, the GPIOs are called
> "powerdown". The second big user of nonexclusive GPIOs are fixed
> regulators where the line isn't called "reset" either. There are also
> various other uses sprinkled all over the kernel for which no good
> abstraction exists or can even be designed in a generic way.
> 
>> Am not sure adding a abstraction with-in gpio framework is right
>> solution, But I do agree that NONEXCLUSIVE flags should disappear and
>> users that are using this should be moved to correct frameworks where
>> they belong.
>>
> 
> I'm open to suggestions but DT maintainers have not been particularly
> fond of creating "virtual" devices to accommodate driver
> implementations.
> 
> Bartosz


