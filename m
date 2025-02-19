Return-Path: <linux-gpio+bounces-16220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BCBA3B8A6
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 10:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 051731666EB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 09:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC1C1E284C;
	Wed, 19 Feb 2025 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="li+8NoWl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DAD1E2607
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739956444; cv=none; b=Pa58y7d/oMwzBynVuQ4GS1Cn0VGMO2DItHA0yVriuFgQmUhcWujqFADkQbYC+qo3GVvKDQn/h85hzh6DMR2+/+kO2NCmDRFJy8uZorY+M9wGGONJClwJfhsCPIhUPrf9OX3zXsw+ziWDEtu7FG2kqliJaMZ+/wre3txaE+79o8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739956444; c=relaxed/simple;
	bh=hfPGZ3Dap2mjHnHYqaIYjn4x4mHV0gTgyjvUgpZ5tCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=IPU4VGbcLb58bUuELfMO+hCyLpK2xJkpdQAGGLMqkf5eK+KcByuBd4OEJRGZvwKXeI4pJjw292cS1htG7j6AERtPfELSat74x4363YIHZ340NfT6JEBH49ZhoLjQRXAsSl4TuqV2VtuditMYhhLp7szHXcGb0W3mViTwBTTcJTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=li+8NoWl; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250219091400euoutp02cb8c8e87b2b3c59d308aa29cd63f91ec~lkSoEYquA2897028970euoutp02j
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 09:14:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250219091400euoutp02cb8c8e87b2b3c59d308aa29cd63f91ec~lkSoEYquA2897028970euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739956440;
	bh=U1O2CzMZsngaaF6NWYKS5yHzociycXu2ZdQzH8NxVOQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=li+8NoWli97LuAHh5SRn8fEjFnQKyquw4Vb7H/hIVr1mXAePOg4/+vlbtvbmTwPNi
	 djP171ny9R1XH2XASrtRNvmc6x8IJ1C+r7Zkntu1yD9UIXidAOXRflG6k49/3T9Jmw
	 Ke6uCP57xsGBH9vcnKZ9nat/PN7VVEt50zLGm4Lk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250219091400eucas1p2f4afda91b9ebdb209ef8307c2128d080~lkSn4Q0dG0350703507eucas1p2_;
	Wed, 19 Feb 2025 09:14:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id AF.94.20397.8D0A5B76; Wed, 19
	Feb 2025 09:14:00 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250219091400eucas1p27e7f9afa5d0ed1823151173c4c8c0d27~lkSniW9r50572105721eucas1p2f;
	Wed, 19 Feb 2025 09:14:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250219091400eusmtrp1bc7aff07edc243959bf762e40b9671c1~lkSnhwL7_0523705237eusmtrp1O;
	Wed, 19 Feb 2025 09:14:00 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-e5-67b5a0d8e8e4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 08.84.19920.8D0A5B76; Wed, 19
	Feb 2025 09:14:00 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250219091359eusmtip293bd338859a8098ea1d7d4d6f8bf1093~lkSmnVweG2537225372eusmtip2H;
	Wed, 19 Feb 2025 09:13:59 +0000 (GMT)
Message-ID: <7c045d13-146f-448c-ad73-60069059b242@samsung.com>
Date: Wed, 19 Feb 2025 10:13:58 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] gpiolib: check the return value of
 gpio_chip::get_direction()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMRc=MduJK0_gat2aVQbR9udYNj9oDcoN=me0wa4K6L8dX_52Q@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnleLIzCtJLcpLzFFi42LZduznOd0bC7amG9zpkLRY8W0Nk8WuB9vY
	LKb8Wc5ksXn+H0aLy7vmsFks2PiI0YHNY/G126wed67tYfP4vEkugDmKyyYlNSezLLVI3y6B
	K+Pb62PsBfP5Kvpe9LA2MF7k7mLk5JAQMJFYdGQvYxcjF4eQwApGiVVvFzOCJIQEvjBKbNif
	BpH4zCix7Pw1RpiOeZunM0EkljNKXDj4G6r9I6PE0hdtYFW8AnYSVx5vBrNZBFQlGn/NYoOI
	C0qcnPmEBcQWFZCXuH9rBnsXIweHsECExP3WepCwiIC6xIJ198AWMAvsYJS4+beDHSTBLCAu
	cevJfCYQm03AUKLrbRfYTE6BQImtF7axQtTISzRvnc0M0iwhcIJDov/HDKizXST6p1+CsoUl
	Xh3fwg5hy0icntzDAtHQziix4Pd9JghnAqNEw/NbUB3WEnfO/WIDOZVZQFNi/S59iLCjxM0V
	H5lBwhICfBI33gpCHMEnMWnbdKgwr0RHmxBEtZrErOPr4NYevHCJeQKj0iykYJmF5M1ZSN6Z
	hbB3ASPLKkbx1NLi3PTUYuO81HK94sTc4tK8dL3k/NxNjMA0c/rf8a87GFe8+qh3iJGJg/EQ
	owQHs5IIb1v9lnQh3pTEyqrUovz4otKc1OJDjNIcLErivIv2t6YLCaQnlqRmp6YWpBbBZJk4
	OKUamKIW2kpxvWZzNo6RTDCV3hrGx5Vk0+Wx+HLFuu6sDVKeLnzaLuUvTB69PpAdLj5XW5ol
	6LxD8IaJD+IcCqexndWb/ai4xfb8EofPTH1890Mqtb/whJgGZLzLzbK8bLFC5NPyq8XW+46k
	6H1lnuz86MtqRZM9c17q7gkpSvy+oPuT+KzYP7GxBYE71UvTN+pxLjlu7jP7iUzBIfsTmSts
	ItkLpq1WCT61SVjEZMexR5fvv2NlOi/eNU8pa/2Ff12L9zr/m31msY31m+9Hf8iLT4voCEra
	Y191bulid7sHvTmGC34t3lZQo3j8XdyUKq2bh2Xdud3NnvVWq/w/Iv0yiGvLlwRe5/A1xlfn
	GH2co8RSnJFoqMVcVJwIAImf3NCiAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsVy+t/xe7o3FmxNN1h6j9lixbc1TBa7Hmxj
	s5jyZzmTxeb5fxgtLu+aw2axYOMjRgc2j8XXbrN63Lm2h83j8ya5AOYoPZui/NKSVIWM/OIS
	W6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYxvr4+xF8znq+h70cPawHiR
	u4uRk0NCwERi3ubpTF2MXBxCAksZJVovrmOHSMhInJzWwAphC0v8udbFBlH0nlHizecpYEW8
	AnYSVx5vZgSxWQRUJRp/zWKDiAtKnJz5hAXEFhWQl7h/awZQPQeHsECExP3WepCwiIC6xIJ1
	95hAbGaBHYwSC9qlIebfZJJYMnszC0RCXOLWk/lgRWwChhJdb7vA5nMKBEpsvbCNFaLGTKJr
	axcjhC0v0bx1NvMERqFZSM6YhWTULCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7
	iREYV9uO/dy8g3Heq496hxiZOBgPMUpwMCuJ8LbVb0kX4k1JrKxKLcqPLyrNSS0+xGgKDIuJ
	zFKiyfnAyM4riTc0MzA1NDGzNDC1NDNWEud1u3w+TUggPbEkNTs1tSC1CKaPiYNTqoGpePex
	Hu9Ag9SV+td1OTiuN3edb0/sjdLk+vaauzz33reJbm6btl18HD1NpFlrY+6jyTysLFM+/y9x
	Crax5dO4t2rmco/dgs/uSKx8YeoctY2rc8G0X3sl90xjktuoHPZ6+8FD08v65C+eetWUK994
	m+N97NaN7btubu44U8HtwSC0WHNbVKXhb6uPTfmu88JDzX48+nv3e+K7Yv1LV1+71gTHinV0
	eL1+/aJ7QrWeR6C1xt6pV+I0vmz4WsuTVPTVofCC7Zs3Nw70zZuiXSKxegoXr8B1z8YDYpn3
	gn7MW1u2ecVpj07jbK8baekLVpsWaBzY22B463rkZw294nO/5x/y8t7It3O2d6fBqtYoJZbi
	jERDLeai4kQALlauiDQDAAA=
X-CMS-MailID: 20250219091400eucas1p27e7f9afa5d0ed1823151173c4c8c0d27
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
	<CGME20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254@eucas1p1.samsung.com>
	<20250210-gpio-sanitize-retvals-v1-1-12ea88506cb2@linaro.org>
	<dfe03f88-407e-4ef1-ad30-42db53bbd4e4@samsung.com>
	<CAMRc=MduJK0_gat2aVQbR9udYNj9oDcoN=me0wa4K6L8dX_52Q@mail.gmail.com>

On 19.02.2025 09:50, Bartosz Golaszewski wrote:
> On Wed, Feb 19, 2025 at 9:38 AM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 10.02.2025 11:51, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> As per the API contract - gpio_chip::get_direction() may fail and return
>>> a negative error number. However, we treat it as if it always returned 0
>>> or 1. Check the return value of the callback and propagate the error
>>> number up the stack.
>>>
>> This change breaks bcm2835 pincontrol/gpio driver (and probably others)
>> in next-20250218. The problem is that some gpio lines are initially
>> configured as alternate function (i.e. uart) and .get_direction returns
>> -EINVAL for them, what in turn causes the whole gpio chip fail to
>> register. Here is the log with WARN_ON() added to line
>> drivers/pinctrl/bcm/pinctrl-bcm2835.c:350 from Raspberry Pi 4B:
>>
>> Any suggestions how to fix this issue? Should we add
>> GPIO_LINE_DIRECTION_UNKNOWN?
>>
> That would be quite an intrusive change and not something for the
> middle of the release cycle. I think we need to revert to the previous
> behavior for this particular use-case: check ret for EINVAL and assume
> it means input as it's the "safe" setting. Now the question is - can
> this only happen during the chip registration or should we filter out
> EINVAL at each gpiod_get_direction() call?

IMHO it will be enough to use that workaround only in the 
gpiochip_add_data_with_key() function. The other functions modified by 
the $subject patch are strictly related to input or output gpio mode of 
operation, so having the line set to proper input/output state seems to 
be justified.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


