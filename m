Return-Path: <linux-gpio+bounces-28116-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9EDC35D00
	for <lists+linux-gpio@lfdr.de>; Wed, 05 Nov 2025 14:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FC035684DE
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Nov 2025 13:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC02317707;
	Wed,  5 Nov 2025 13:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHKTH+JN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D1E318139
	for <linux-gpio@vger.kernel.org>; Wed,  5 Nov 2025 13:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762348999; cv=none; b=cxwG4hfZOfGq6UC87HbP1t/F7JlBpb/qyYxLR+b3rWzB8ncebe4cdhHLSZ53F42w7iBZGhXDNkduCeegoanrnycSpOGy4/LijInFH4E5f/Mz39LNp25n+fDY4M9ifrQxo+PGrkDc2OKkH8oA5fLjFl+HMfblKILTXP31JVMl4oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762348999; c=relaxed/simple;
	bh=fAvl3ytfYFGL55LfCO3eon+Ke/qFtA0etUp6VDx2lQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IWZahqH4BbBJhHIUfaxkSpESFIYAlnmhJHA1rg62eUvp4iaTmP+WKqkW+s4VQofiOkGTVO2M7ITH/ofCLkFF1g0OnkeD/uXQDz/+g0SzLnUsZioiaRi0A+xklYKIHl+mYCcGTXwIkOp1YaVTvVyH9FsS8H3j5YmJxsWSSWCAN3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHKTH+JN; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640c48b3b90so4800843a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 05 Nov 2025 05:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762348996; x=1762953796; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fAvl3ytfYFGL55LfCO3eon+Ke/qFtA0etUp6VDx2lQU=;
        b=bHKTH+JNnDOstGdDudHNjmemomVxVOefuhj57RUJz95nDxHUdziYeGZMG+zKSx7juG
         UQEF674brAH2kQqbduzPTk3wKEEbl23ZhxQ9d2d6IETmX22ZMxCBDtiMP0jA92q8FM39
         2PZP1c/sSC7kOYmnva8ZcO7mwGoHnxnhXq9TFVuRO+8eyDRDzc+cp/kKSOvjW0JtJ1e2
         7BZ/ECIUZU7qY9w0plTo3uj52xpZyf4VF5wZTGmV4u2bUi9Cnn+VwZRGzpFPuFeFb/JJ
         jUEKL5dzqoyQlpz74U/RyLZalTRFx06zrgrNSIpbEgNiQR8QMjeP66iUD4gTUh+ci7sb
         WYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762348996; x=1762953796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fAvl3ytfYFGL55LfCO3eon+Ke/qFtA0etUp6VDx2lQU=;
        b=nV5dcY97YzlpZGqCyNOR3MpwbV7DVxzS39skk4XBMfb2pYnehuSD6V+FMj2MVsU3bm
         9v0UYevoKwU1AairVPv6iTxDLq6zI0We+rYB5S/VOmvGKXpOqrLsX6aSxFYUTG5+ZVOX
         KmB6ITRX0Dg8h47sukxN6+GvcZ7qjkBkcKbmiBOt5X8kvbcODmzJ2xFejpLjNwXV8/Ya
         ahH/A/AqE8y6ps+JRSR/Yfl7bwlLF5Un627+qE3FEEomYYcSCPC5A5z1bNV8ty2mgT9z
         SvUbQyWOgbfHWizFkRoOUp1acv23oWZY3f0jPJ0hs6v+kJuyPw2Fz+VsXHMtDHaVtEHA
         Zehw==
X-Forwarded-Encrypted: i=1; AJvYcCXM/QPX7tOf+gU4Hm2T7dJkepGRJmr0Pti5CvcHbkYvNbKLJehxK3Cgs8eWxikJIBbBW6gyLaIHZD4g@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8S59jkA1ct8HLhJFudCWdRrz49S2YUE9USheXGf4qaK9ahrPH
	MNKBrWVAl4DqkKtuf9wlpeNVjNomvw1gh3QSlXu5sf1uvjjoOMWvIjew
X-Gm-Gg: ASbGncteMdad42FeXzMTEKxG6BVv/djXgwGRFoS5MiWSJXNqnGb5JDcHKjmX6F7ekt6
	+xXp0EltL3pazFQORdqalFJEDeCVQOGVa1Bg8O1oZKV7udiXoQrC8pgM0gTZO/NPwi5WZ4uxctm
	75A2fRWqvsV0TXsQ8qEy5XvK8z6057Q3P9PibUf7tTEXoplA55N2RhpdxYIeYdOIa3Ltpc5QyeW
	HiDDBXQIfHMPVDHwAHiezPgmOGTWO6QpHWGi1aeE7j98GY2s9MiCKLf3sc3kmqs7cpElKxjUp1L
	b0jzgf1PNgSSNgemddLPZtBnkIeurPnFVLr+7tRtVOAWsC2NhuIeyJrWctMhzDlAGekYufbXdwP
	mj8zHm93ABgE7OD0QfxKky426wAVBO3X7ozzVbniB4Ti2jh1AcIraqPFK9rjSJ3j6tTYzDHQu48
	DmUspBaYm1J7YEfYXPKcKiuMAGmWWIoDE4qBPmiFLKcPbwuEjE175oJnH94Ut8FTicf/UOovJYq
	I4=
X-Google-Smtp-Source: AGHT+IF3bC8u2qquuEPddyAbViPZF5DICi1uxLeZt2pzWAFrVW0wOOf/jf7DTJrN9ZFNkGuisnk3hg==
X-Received: by 2002:a05:6402:2109:b0:640:f481:984 with SMTP id 4fb4d7f45d1cf-6410588de7bmr2892354a12.2.1762348995935;
        Wed, 05 Nov 2025 05:23:15 -0800 (PST)
Received: from ?IPV6:2001:9e8:f106:5b01:5cbf:5078:e623:8643? ([2001:9e8:f106:5b01:5cbf:5078:e623:8643])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6806d82sm4628779a12.16.2025.11.05.05.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 05:23:15 -0800 (PST)
Message-ID: <12efb5b2-058e-4a9c-a45d-4b1b0ee350e7@gmail.com>
Date: Wed, 5 Nov 2025 14:23:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] gpio: add gpio-line-mux driver
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Richard <thomas.richard@bootlin.com>
References: <20251105103607.393353-1-jelonek.jonas@gmail.com>
 <20251105103607.393353-3-jelonek.jonas@gmail.com>
 <CAMRc=MdQLN5s+MpkLUF2Ggc4vYo30zOXrA=8qkGmXvu7N3JjeA@mail.gmail.com>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <CAMRc=MdQLN5s+MpkLUF2Ggc4vYo30zOXrA=8qkGmXvu7N3JjeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 05.11.25 14:15, Bartosz Golaszewski wrote:
> Hi Jonas!
>
> This looks good, I'm ready to queue it but I'm afraid the consumer
> label "shared" will logically conflict with the work I'm doing on the
> shared GPIO support[1] as the shared GPIOs will appear as proxy
> devices containing the name "shared". Do you see any problem with
> changing the label to "gpio-mux"? I can even change it myself when
> applying.

Another name is fine for me if it conflicts with your work, as long as the name is obvious
enough. Not sure about "gpio-mux" though. Maybe "muxed-gpio"?. Just let me know
what you think and if I should adjust it or you do.

> Bartosz
>
> [1] https://lore.kernel.org/all/20251029-gpio-shared-v3-0-71c568acf47c@linaro.org/

Best,
Jonas

