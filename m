Return-Path: <linux-gpio+bounces-30171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5081CF509D
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 18:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F7C8302F923
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 17:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE7B33BBD4;
	Mon,  5 Jan 2026 17:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FiPwtp6/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A1933AD87
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767634958; cv=none; b=Oo/xfZ/2e1oRrpQd3zHhtQV9udbnwDmxUlg0kM2/a5AjarKEjPUQn4RGOhxYKIdX3TUxQnUCV+bo9L69iIi23dOgY0bVSGUR9h4E58zny9Pp7o4Ym71iq2x/3ggmwTOqn7yArhj8he/Izbl0jf8JUDALNT8hbTZ9zIAIL4XLqa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767634958; c=relaxed/simple;
	bh=wbYLsgDD03dm4sNR05eSoXr+Dzzy9LENlk/8p0wONVQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLcFq8MYhOc3+nqHBphOSYyB8hQwvy0IoEZx9Frprli1OzlTahqJ8dZRLLx+FokttnHbcFygZeGsTtBAfTsbpKKClNM160pW/TQI1/a+lT7+pmgXSLonmM4pSHa9NCqCtWudyjXfyOU7oj0ZBXLmDB4DK6lHpaJn7wLAW2lDioo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FiPwtp6/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAADC4AF09
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767634957;
	bh=wbYLsgDD03dm4sNR05eSoXr+Dzzy9LENlk/8p0wONVQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=FiPwtp6/1IIwMp9OD7ki6dBrkG0xXz1S9kL/gTpr19NdAm4aCm0Ytbx3P4SfomaEf
	 fpRzZbKJ3YGWcpx0C2N5dxCOL/Ty5hqnH7Avz8b+sewQGe3O1IDRe87nVA+HfvRWoV
	 kblJ/DRVwnyrC1NT20XYitZJlny+CpC6Zw9LA1WMB7luwJY8hkrtJrgPqdHrZIDpKO
	 +PiTlxeGrpRFsAbHG8P/ynpcu5H7RhKL0uL//6AagVY4T1qn11OvmFYVHblWoJqVeV
	 v4f4TZnu1DI1yv0Xkly7tJo0Xj3AI4MUEbn7GuixrmwwTiyOXy7Mh4tNg2m0Gz8XKy
	 9CQfFaxCXHomA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37bac34346dso1360541fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 09:42:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzOPgW4MHRVwEyaYeK0H0BRGgZg91i9mTjYu3vpBot+2e9UtoPKBG+Pxyp+pSR2za1YdBjyEmZ1A50@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo+Zeo7smcntSjZhNs2sYIpdBx1QwM9s4ZrAlweLO3HeHegRbm
	ZpRqQP+2xcZC3CFLsg/jWfR297ia6qji/uxAoax8yToOKxDq47o370/xWOy8s5QGxSgCJv0o8JW
	VuQyarclCquRgkweS9W5KGydMXr2DGYekyb0+slvuDA==
X-Google-Smtp-Source: AGHT+IHpghTQQyrUN0Z9VxbS6fN3aM/lQadTRQJsW+KOcBcpywrLxs6XQlKq3dFyHnypOsYzRrooDGGEq3wK7tu3QrU=
X-Received: by 2002:a05:651c:41d6:b0:356:7e6f:c66b with SMTP id
 38308e7fff4ca-382eaae3ec8mr188771fa.38.1767634956232; Mon, 05 Jan 2026
 09:42:36 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 09:42:35 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 09:42:35 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <c53c4f14-cb0e-475d-baf9-c02f24e3df5c@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260105155232eucas1p1a0d0d603716267eacef8f57f7aa5e34f@eucas1p1.samsung.com>
 <20260105-gpio-shared-fixes-v1-0-76d6ff0afcd8@oss.qualcomm.com>
 <9ce71b14-b058-4192-9562-99856a89af1d@samsung.com> <CAMRc=McGaZBDQp2+4Q5G_qkKu_fPDxWwsoo3MujkZs70eBDqxQ@mail.gmail.com>
 <c53c4f14-cb0e-475d-baf9-c02f24e3df5c@samsung.com>
Date: Mon, 5 Jan 2026 09:42:35 -0800
X-Gmail-Original-Message-ID: <CAMRc=Mc0YUvoEYB7RCEBWmU1gM_zEzB0mhQ3D9+fO7jwkmAtGQ@mail.gmail.com>
X-Gm-Features: AQt7F2rL2-g-TifdH_KNl-4gKJp2Ts74VWT15e6l5HGnxOgLYArGxIMlYH_3vu8
Message-ID: <CAMRc=Mc0YUvoEYB7RCEBWmU1gM_zEzB0mhQ3D9+fO7jwkmAtGQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio: shared: another set of small fixes
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 5 Jan 2026 18:22:31 +0100, Marek Szyprowski
<m.szyprowski@samsung.com> said:
> On 05.01.2026 17:53, Bartosz Golaszewski wrote:
>> On Mon, 5 Jan 2026 17:48:05 +0100, Marek Szyprowski
>> <m.szyprowski@samsung.com> said:
>>> On 05.01.2026 16:52, Bartosz Golaszewski wrote:
>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.c=
om>
>>>> ---
>>>> Bartosz Golaszewski (2):
>>>>         gpio: shared: assign the correct firmware node for reset-gpio =
use-case
>>>>         gpio: shared: fix a race condition
>>>>
>>>>    drivers/gpio/gpiolib-shared.c | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>> ---
>>>> base-commit: 19fb766a1e5ed5943a62fc671c09d45352a81b1d
>>>> change-id: 20260105-gpio-shared-fixes-40a8ec3b6b25
>>> Those patches indeed fixes some timing issues with the commit
>>> 49416483a953 ("gpio: shared: allow sharing a reset-gpios pin between
>>> reset-gpio and gpiolib"), but they also reveals another one. I've
>>> initially thought that this is a false positive and needs only a proper
>>> lockdep annotation, but some boards=C2=A0hang just after similar lockde=
p splat:
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> WARNING: possible recursive locking detected
>>> 6.19.0-rc4-next-20260105+ #11974 Not tainted
>>> --------------------------------------------
>>> (udev-worker)/192 is trying to acquire lock:
>>> ffff000004c15098 (&ref->lock){+.+.}-{4:4}, at:
>>> gpio_shared_dev_is_reset_gpio+0xcc/0x234
>>>
>>> but task is already holding lock:
>>> ffff000004c15898 (&ref->lock){+.+.}-{4:4}, at:
>>> gpio_shared_add_proxy_lookup+0x98/0x228
>>>
>>> other info that might help us debug this:
>>>   =C2=A0Possible unsafe locking scenario:
>>>
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0
>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
>>>   =C2=A0 lock(&ref->lock);
>>>   =C2=A0 lock(&ref->lock);
>>>
>>>   =C2=A0*** DEADLOCK ***
>>>
>>>   =C2=A0May be due to missing lock nesting notation
>>>
>>> 3 locks held by (udev-worker)/192:
>>>   =C2=A0#0: ffff00000b3ad8e8 (&dev->mutex){....}-{4:4}, at:
>>> __driver_attach+0x90/0x1ac
>>>   =C2=A0#1: ffff8000830f2600 (gpio_devices_srcu){.+.+}-{0:0}, at:
>>> gpiod_find_and_request+0x0/0x574
>>>   =C2=A0#2: ffff000004c15898 (&ref->lock){+.+.}-{4:4}, at:
>>> gpio_shared_add_proxy_lookup+0x98/0x228
>>>
>> Ah this must be due to also trying to compare the ref to the base ref...
>>
>> Could you try to add the following on top:
>>
>> diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared=
.c
>> index 198951c4c80b..5f3b8bc4a4fc 100644
>> --- a/drivers/gpio/gpiolib-shared.c
>> +++ b/drivers/gpio/gpiolib-shared.c
>> @@ -378,6 +378,9 @@ static bool gpio_shared_dev_is_reset_gpio(struct
>> device *consumer,
>>   	 * arguments match the ones from this consumer's node.
>>   	 */
>>   	list_for_each_entry(real_ref, &entry->refs, list) {
>> +		if (real_ref =3D=3D ref)
>> +			continue;
>> +
>>   		guard(mutex)(&real_ref->lock);
>>
>>   		if (!real_ref->fwnode)
>>
>>
>> If that works, I'll send a v2.
>
> This fixed the hangs, but the lockdep whining is still there.
>

Then it's a false-positive. I will try to play with lockdep_set_class()
tomorrow.

Bart

