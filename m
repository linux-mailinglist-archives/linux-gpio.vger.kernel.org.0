Return-Path: <linux-gpio+bounces-16221-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDD8A3B94D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 10:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF14E188C2AB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 09:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAB61C32FF;
	Wed, 19 Feb 2025 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kRv3J7cR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951091C6FE7
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739956960; cv=none; b=XC/r7c2OiCorvnZr36ISoB/d3QtV5DbLxn95lGgjCtG/0qkbDBP57EVOjvOJbQuHBtqMaVPsMYKYjptypY5ohTGaPD9bsw6ByLj/g7098FmBFJ1z773NYJbWIkel9j5y2uC8rN9hyDi3BsZdw4V2nyZmf3CPwn/exBc7ZSEG/RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739956960; c=relaxed/simple;
	bh=882+GeLvhOhZ90ZJo71O/xXswVk12JFwrOg2gd0h8EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KfcE4qsx5c0CLViyTscC8AQUIGfzud6F7s6We6ZmoxKsWAH7lZuM1vy31tYJh/OkSHA9NuqpC+2CgwdNnuXfVepeyzx/+vBUypBErZnN8F7hHLBQSXWstnduTEf0ppr4fwi0+09XnjWGhnXwWm3VC8Fcv/EjdaOpvT/+golC/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kRv3J7cR; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30a28bf1baaso30037571fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 01:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739956957; x=1740561757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=882+GeLvhOhZ90ZJo71O/xXswVk12JFwrOg2gd0h8EE=;
        b=kRv3J7cRUMV91yt5eJpe7WOu3+oEwlSoFvmbu9xD0Mb30r6YevqlS+xz0SXVAck0Jf
         Mi5A5axfVZOo32XvdnGb/eg3arg5B65+uOLPq1JDQIFl9FrxLBtYvP8KJ4ghU8rfNzOC
         bMcj5w4TAsFNZEiBv+EqyeC6JBGsCbag+Yq7QJIf6gXnL/EMzb4Ul8O2ZUSnwUN88MUq
         3KlHRklNGXAwkUdSGnp77jWqqxCAzqGWjOG8BjIndmSIkOxdkr25tMfIB/aQKeA03w2/
         n7xh5ddUNtsr/XZeS+Owfax+/faO3Q+A0HgZhUnvoiCO3bS0QErx+DXzliVGiD1vrDxd
         3lDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739956957; x=1740561757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=882+GeLvhOhZ90ZJo71O/xXswVk12JFwrOg2gd0h8EE=;
        b=mhukZS0OlzayoK0XgL7aeYvRDdpP3MIFVRJc0ganuzDyo7JiiBT4656UDJ38EH4Ycy
         OGNxVB5g/WmuszMNYu5247zg5F5WusQs0tByTjvCukpvopP/EPeS6d83UOqxtz/CThyG
         Kkt7JlgL0X3a4XrA7HbUhissP7S3ZuNmwFK9CxVDgYWNeLh0cHA3J/rqwxff5xSfwv7U
         shI82qCpmxCVSYdoM/HGR9nbKOI2dO623mi6WbZNUI8po4GWB/PdQGfncNh/c90vmFRa
         x4l+vUYdAW1pkOVjEYIZLZdCFmND7aF5cwWpcCaL2t+pQSvYrLzd87C1Df0DJ7jZ59kj
         TwQg==
X-Forwarded-Encrypted: i=1; AJvYcCWgBwhhMBqFZIYoVArFPrkGke5w9Q5aEWqxxXl6zfv3LBzdxBaeUr9XKfd6tj5coISgELAEEYkifv2u@vger.kernel.org
X-Gm-Message-State: AOJu0Yxueg+rC24x35CPGqscobNrO0M63lYE6Rf/gh2ZTL4IepadJ76c
	/Q+gzt9QAOHlhcd+UwXOuZTSM0rlYl7YuwdAjgefNmMPOK3AXyl3OpzCXOrMYNAAKai+5Du5Hhw
	crIdTD5AjVSYQXDZcP5BhZwA4SSEWq0W8lTvKLg==
X-Gm-Gg: ASbGncssbzIP6wjoyuXGCKWMQe4HqNjxy3fayVF2ZSVqg4KslJ8tFNjVPOrihNSZkqB
	j6P0Dwn7LS5YSYZpeh638YD7yFp2Z+YaJ8vUOFUWFL8NTIrRDukiTLfrk2wNNMHMTdrdPEXN4vz
	UlxyJJKVQwYGxvYkCs6X2WakyzjG4=
X-Google-Smtp-Source: AGHT+IFdq3DsLsQ07SUQyFjnXJ/TBOJSzpWcwna2L3NBWTn+vHCfPc0MhMyzYqgbujIH1hiHEH5Zd5fdTZyJSgFlEkc=
X-Received: by 2002:a05:651c:a:b0:2ff:8e69:77d7 with SMTP id
 38308e7fff4ca-30927a64cacmr48765581fa.20.1739956956700; Wed, 19 Feb 2025
 01:22:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
 <CGME20250219083836eucas1p1b7ecc6e5fdc34d66ef7565bfcf399254@eucas1p1.samsung.com>
 <20250210-gpio-sanitize-retvals-v1-1-12ea88506cb2@linaro.org>
 <dfe03f88-407e-4ef1-ad30-42db53bbd4e4@samsung.com> <CAMRc=MduJK0_gat2aVQbR9udYNj9oDcoN=me0wa4K6L8dX_52Q@mail.gmail.com>
 <7c045d13-146f-448c-ad73-60069059b242@samsung.com>
In-Reply-To: <7c045d13-146f-448c-ad73-60069059b242@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 19 Feb 2025 10:22:25 +0100
X-Gm-Features: AWEUYZm6Gj5cFgQ87Mb8LjORD5nmtpBio1fdKEzvV2SnbMSrnrl4QoWzxX_bD5k
Message-ID: <CAMRc=Me2vsqtsZwuy1d9h6hA4+XVVGCeh8Nd77-Pq1QCMniUfQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] gpiolib: check the return value of gpio_chip::get_direction()
To: Marek Szyprowski <m.szyprowski@samsung.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 10:14=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 19.02.2025 09:50, Bartosz Golaszewski wrote:
> > On Wed, Feb 19, 2025 at 9:38=E2=80=AFAM Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> On 10.02.2025 11:51, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> As per the API contract - gpio_chip::get_direction() may fail and ret=
urn
> >>> a negative error number. However, we treat it as if it always returne=
d 0
> >>> or 1. Check the return value of the callback and propagate the error
> >>> number up the stack.
> >>>
> >> This change breaks bcm2835 pincontrol/gpio driver (and probably others=
)
> >> in next-20250218. The problem is that some gpio lines are initially
> >> configured as alternate function (i.e. uart) and .get_direction return=
s
> >> -EINVAL for them, what in turn causes the whole gpio chip fail to
> >> register. Here is the log with WARN_ON() added to line
> >> drivers/pinctrl/bcm/pinctrl-bcm2835.c:350 from Raspberry Pi 4B:
> >>
> >> Any suggestions how to fix this issue? Should we add
> >> GPIO_LINE_DIRECTION_UNKNOWN?
> >>
> > That would be quite an intrusive change and not something for the
> > middle of the release cycle. I think we need to revert to the previous
> > behavior for this particular use-case: check ret for EINVAL and assume
> > it means input as it's the "safe" setting. Now the question is - can
> > this only happen during the chip registration or should we filter out
> > EINVAL at each gpiod_get_direction() call?
>
> IMHO it will be enough to use that workaround only in the
> gpiochip_add_data_with_key() function. The other functions modified by
> the $subject patch are strictly related to input or output gpio mode of
> operation, so having the line set to proper input/output state seems to
> be justified.
>

Cc'ing Florian

After a quick glance at existing get_direction() callbacks, it seems
this is the only driver that does it. I'm wondering if it wouldn't
make sense to change the driver behavior instead and make it assume
input for unknown functions.

Bart

