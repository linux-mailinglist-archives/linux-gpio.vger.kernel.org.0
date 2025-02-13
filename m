Return-Path: <linux-gpio+bounces-15931-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC60A34BF0
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 18:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E19F3A9ED9
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 17:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490EC207E01;
	Thu, 13 Feb 2025 17:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Qpw5VAZi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8401FFC54
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 17:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739467527; cv=none; b=d8QEeiVioPvB/+ycvZlR9pooc2aGxUAIi6+QQoiVoHftlQ2IOCkB5c3q6Vqvpg9ReBpihtJYI9pRLJ1qQoD/12Crw95VCHKCD+E+vaZHkv17M5FVw34MPRN54p1vaH/LiQrh9BMCHyuim5q4QSN82pCP8wUdusRCGqTquMdL4lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739467527; c=relaxed/simple;
	bh=h60vbM9Jm6zaTd85iyob/nz/7LZiBLiFuNTQdv/csWE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iG50EZ6xa+xXmDRP+ulQFvsmzgkjx6o0DZozvlwI2dcvOKEYZBwJaK1AVruSwjngXQTROOwn2AFMCgxPr1gQfFkYYM0uVEpvsxia0EG4quZq4ikloY598OuSydYRirD9gp0ptMZ/aZW08KuGB9jx+cAwnO+89NZ4sQ1cAluXX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Qpw5VAZi; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7270003d9c8so607274a34.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 09:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739467524; x=1740072324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mp8WnurnIDwQ4N7+32kRAbs4w5dFYFrQQIq32Y3ZWhU=;
        b=Qpw5VAZiW0z1sw+g0eMb4K0BC7svOU1K4X5Tb33HGYlkaxm+tE6pgGP/ma6CQePrL5
         SoKGuP5cBKtw40VCu0D7PR/TpvSGBjJXZYwnUvqTfllqoEcxTn5gG7DysyOMo9Xgz4q7
         oyNI2Zc+07H/aUU9HLZaTdRINRovyxZdycQ2TE+ld82H2RC6tfAfXZYTHqdgIY6pIL5J
         2yZ+UNlSPsYgWsbSRqJ4qzG+GnNnylbKyMQDgDtEgyeEYzX4FiTWp9xyIsodKTGXWiZv
         FxKRtV2uYYF1PLVdW0/UedqZJ2uM7g+qNGOns8PI15O5SHczUo7Rgve6nXuTvmbZfz5x
         Flsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739467524; x=1740072324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mp8WnurnIDwQ4N7+32kRAbs4w5dFYFrQQIq32Y3ZWhU=;
        b=KkXZ9BECxvMygRY7DlR6tZR/BoKq6u8Yf1JpsiGKH4kuns2RYrgHPTZi5FVB2tiDjB
         17tmq/2mDrjkj1m7xmWC1QKRCHa6vjAItIOsmBt35CyylL0ao7/hhxARhkDy4/ku3UFj
         mL7YGrplW012hG7qVLIMaFxIjwgVolzyqfCpNdkrjoBY7MB1SZQzzLBf3JPG/rxzrJZ4
         khNzphVZwlrg3w2l9T5hxXGo0pxYgV8RSg2PKdReQaftHA5fImgT0rkpVTFRRbvsXrlI
         Af19++ZSGCoPfMoHPwn1v1Gsc1hlaJOi5vMivGK/IRC37X31Q7OSllroXydXGt85JZMf
         X3QA==
X-Forwarded-Encrypted: i=1; AJvYcCW7J4afzCeBUWE4f9hkpozOH5o7L+k7rTj4jXnq5Q6nN3sycwlOlJQvmOIRhzgdPoxx8jvBqxGsm2ya@vger.kernel.org
X-Gm-Message-State: AOJu0YzhRtY6JRqXmPVOLuTYA/UImDJkiRY2ux4n2jDU9lclNZrecE0Q
	mDejStvPO4s0uqei/RNFtOvgKbTTsZMr9Zh1AfX3k3q9AsfoT+gX5oCKEFb8CtGzeaF19hn9cbB
	c
X-Gm-Gg: ASbGncvOEewv0RbQ9+uiizl2yo1w+WsAbRjuQhU3HBtCOfxBh5xGwCPDJauNIY1Gn9h
	MougIEa4G1J+AsxnU28ES86EaCDrldvPlZd3n3XUQ/uff05Q4YQhXmFBHzjHL7vQd00c7MkWY9d
	QLUHDRjoBQy7ewtWp5ByLWa/jw6Ef2tB6z83U/E6nHosyMHo3W7fZiP+F2AlBQ1JoM8zoFoM852
	ums3iGtWI2kyk9JlzBCo5+/i8ky4YpcUkudRBWmYmtMiWbLHQNr9Q61bQAddyHsymaZFLfkR1EP
	+rHKHHJFA4RIZnHLX8Jgjru95xl7Vd8D5E8SidZtiNLPkiMtnxAo
X-Google-Smtp-Source: AGHT+IFRLkc52JKi83ncUWwAgxo2TvaFCE/dbkTZNE6D15ISJ0Y8Jn4hp2Y0d5PwcxAk7Qj4zAr0dQ==
X-Received: by 2002:a05:6830:6b03:b0:718:41b8:5d6d with SMTP id 46e09a7af769-726f1d8aaa8mr6076689a34.24.1739467523802;
        Thu, 13 Feb 2025 09:25:23 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7270025806bsm743771a34.53.2025.02.13.09.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:25:22 -0800 (PST)
Message-ID: <801b5364-129f-42e9-bf9a-a90d9eeb4629@baylibre.com>
Date: Thu, 13 Feb 2025 11:25:21 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v3 00/15] gpiolib: add
 gpiod_multi_set_value_cansleep
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
 <173935301204.11039.10193374588878813157.b4-ty@linaro.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <173935301204.11039.10193374588878813157.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/12/25 3:36 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> 
> On Mon, 10 Feb 2025 16:33:26 -0600, David Lechner wrote:
>> This series was inspired by some minor annoyance I have experienced a
>> few times in recent reviews.
>>
>> Calling gpiod_set_array_value_cansleep() can be quite verbose due to
>> having so many parameters. In most cases, we already have a struct
>> gpio_descs that contains the first 3 parameters so we end up with 3 (or
>> often even 6) pointer indirections at each call site. Also, people have
>> a tendency to want to hard-code the first argument instead of using
>> struct gpio_descs.ndescs, often without checking that ndescs >= the
>> hard-coded value.
>>
>> [...]
> 
> Applied, thanks!
> 
> [06/15] gpio: max3191x: use gpiod_multi_set_value_cansleep
>         commit: eb2e9c308d2882d9d364af048eb3d8336d41c4bb
> 
> Best regards,

Hi Bartosz,

Do you plan to pick up the other patches that have been acked
as well? It seems like most folks were OK with everything going
though the gpio tree since the changes are small.


