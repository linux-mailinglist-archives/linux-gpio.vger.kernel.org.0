Return-Path: <linux-gpio+bounces-26844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69681BBF9B1
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Oct 2025 23:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 199373C1ED6
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Oct 2025 21:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256B41DC994;
	Mon,  6 Oct 2025 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRR/V6J8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFB58F49;
	Mon,  6 Oct 2025 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787533; cv=none; b=IXELtD+MAiydQYunp0GLG1b8hVAcC80mw/Idlu+EOUVgNX+YyNl6lc6O8XiLCmyi14f0ro3NnymrGvCeVrdQ0PipF92WRDaDPjzXj/OYuzFBC8bIHuDMU5BoerI1gutkAboDAdkEX7/BUI+LXN+BbDGPFAHDbbRJQPaXSaYpUAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787533; c=relaxed/simple;
	bh=/IUG+40uZFRvQzJPeoV/VrSw+bnfl+PWRnxqENQAWNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkvVYavttf8+HaYzbrKMAMeqJ73PsfOlHrzYBo9NFTDJ9mHn/++0ruoRiqBNd8lfboJuU9XpnYF2CMxZUdg61FD7Pj0dbK6A30Cuz+Hgb69iywYA2Z7BI4ZZZ1WG81JOZlmlU3gwN6cmCXLBG7N+7FlgBO8SQn96Wgot1W1RL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRR/V6J8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D15C4CEF5;
	Mon,  6 Oct 2025 21:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787533;
	bh=/IUG+40uZFRvQzJPeoV/VrSw+bnfl+PWRnxqENQAWNw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VRR/V6J8hplpp5KWwR3ee4ChrEL9pTCiqGSitqsv6BZbpvWxb5XtcKD6C99dF2/WW
	 +rLhe53Du32Z1XhS2hw9+SRtujl+YytnYf6GVdcgZEfBwO03eTZZxewnsyfkVQ2UhT
	 M+sIOrmzyHoJ1Fdaw+R05hAmD0bToLqT8gy1zlMzxEg9sVC5FWkrtpDan5D+AdT8op
	 UvNqXYTBIBWEic6Lnbm2/82m2owoNlfDGCzFgyAWYx/PHJ5ZfXcCW1L2WKmm6pxswk
	 QU6i8UY8n0VppiURDxhbyvmse3/Bbgi1S8rhdYN/fLBwGSdTgktdvtZqOlqTSi/z41
	 ZVvhHaZMPrUHA==
Message-ID: <6fe16d18-b2e3-4a33-b03a-a30561dabbbf@kernel.org>
Date: Mon, 6 Oct 2025 22:52:06 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>,
 Mika Westerberg <westeri@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/6/25 5:10 PM, Bartosz Golaszewski wrote:
> On Mon, Oct 6, 2025 at 5:43 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
>>
>> On Wed, Sep 24, 2025 at 11:25:12AM -0700, Dmitry Torokhov wrote:
>>> Hi Bartosz,
>>>
>>>>
>>>> The practical use-case for this are the powerdown GPIOs shared by
>>>> speakers on Qualcomm db845c platform, however I have also extensively
>>>> tested it using gpio-virtuser on arm64 qemu with various DT
>>>> configurations.
>>>
>>> How is this different from the existing gpio-backed regulator/supply?
>>> IMO GPIOs are naturally exclusive-use resources (in cases when you need
>>> to control them, not simply read their state), and when there is a need
>>> to share them there are more appropriate abstractions that are built on
>>> top of GPIOs...
>>>
>>
>> Not always... For something like shared reset line, consumers request the line
>> as GPIO and expect gpiolib to do resource manangement.
>>
> 
> They could use the reset API and it would implicitly create a virtual
> device that requests the reset GPIO and controls its enable count.
> Except that some devices also do a specific reset sequence with delays
> etc. That would require some additional logic in reset-gpio.
That should be a platform specific reset controller driver.

> 
> Bart


