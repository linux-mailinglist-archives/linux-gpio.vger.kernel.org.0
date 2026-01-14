Return-Path: <linux-gpio+bounces-30570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED8D1FD0B
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 386D5300CF2E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E519139E19C;
	Wed, 14 Jan 2026 15:36:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7261E39E165
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404998; cv=none; b=jCOqvNioh1vYJpekvdtDo7paPu9/7tKv2r9FkkKmpk56v6v/tf7KSwKdEcJga96YtIkA/YsjjbUQ0CGHa5lVWjSiax7jSud9p7J5Y7iMUL6NOWrCxufhWei0mpvhzhErpXFPmKV2sstdkFjMw2LyBul0EM1j5m4JQl029jOodfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404998; c=relaxed/simple;
	bh=O8YhrdqWvzZyoq4CqxqmbkpSRKVqDxU7IFcj9d6kka8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdHlVJawExi/80XjyROS+tZZfXhPRT0U9GY6OD6aI+RUGtIIkxtDgczvOIIs7ca0bMgz15UWFLMLKdR4JnWRaV54qLDLM2RNwJ6zLqwKuk7RUjMB5x7bI4PeQ8YGs1oztSxHZPF5eAqPaheQqZ4cM/NGhsnf1WrRAvEKnqM85XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-944199736ebso2702714241.2
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404996; x=1769009796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8vpeO0iETHWaHO53ExF9TcMHcv+dXCbwCEeIoUj/6s=;
        b=g0UqI4Hl0HwBrk4JiaDUyBW7q9oFgD+woSUMN3RvuWqpl6wdp48Qp7KCLYWg+xCYKC
         HUJnOUtJ0xb2avMpSNHO9n8RIin/bB7cAwL4IWLR2h/AWVaapgZlyPCwnaT/H1pNTV7h
         Q214Hvz0mtblVrVAQ8USkSBTfg8dZvv3JwW4FNV/NDafbGfnOcwrnV33f1N7TO/B4loE
         NACpdIdBsODuUnAyETzVvHdCFxppXykVGDDUVHgmsTQfpavUMVdNSv1oId3FPA4iBHmD
         Zdibks/sJZPCF1XR8GyHi+tsG0ad4jnJvZpX2H19RCHTDBwkLEoYgIMKZhEDCYy9kn5c
         +oJA==
X-Forwarded-Encrypted: i=1; AJvYcCXmZIu6R2vtMDJXzOlBzGHIR+Uwh2l1P13+FPDfaPAcrHir+lyBNbSNvB9IbjfrF0GbMaOA2cnbZ2BP@vger.kernel.org
X-Gm-Message-State: AOJu0YwPB6QCPahE0esk5dwhr8SJmjhcZOSkqEdA3e1S5xTvtHPb9Jw+
	XzWaBScwfen+JVH73fRTJhHnz01vmB8UikAD+gCYA3tvPeDbMvbM/ThTbz0GAQgE
X-Gm-Gg: AY/fxX6rL2s1eqy9HkQYs6O/4nEy+1OvvjrZP+JgMxdEYsp7v/2vv3kOJ2LjSYmO0du
	XpEqL09ICZz0df1NBJ7MBV7R4HjTCJ3jGmrAloS0UqOxhKs6Ufcm2ZmqFR6VvKktUeMZZCNaAes
	pd+9rW3MnVQd7Pi7VL8Q2nZeJn6iUf7p5tfw+8BlveJebHooB5ktfsVVZxA+2sZHsETswZ4MPd9
	+8f9aF8yW8S1wc7gny2YgQLDNVAlS9SJjWxWIRQ0TXyw7bUagpK1WfyW8JIxxVTR/NKvuF6jZ7S
	Q/NhQQhbpiDs6oMSBjIE1VPBPemf8OOs7AIJcjtvyIdWS5Amvy1q1Dlphg+ARUbDYoigmPJDyrv
	RgqwXMwj19N7Vh5tkZbHQQ92rfwlQIRNZzWNmqa7JMbc3fpf5DJrTiE78dbwJzWock/qXV6FE1G
	CySweHRnvaxfPYjUUKQW4RsJW7QQGj6iK9ScgUKVqCHBNMMEv5
X-Received: by 2002:a05:6102:dcc:b0:5db:3d11:c8d6 with SMTP id ada2fe7eead31-5f183896e09mr921174137.5.1768404994940;
        Wed, 14 Jan 2026 07:36:34 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec770644d5sm23701334137.8.2026.01.14.07.36.34
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:36:34 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5eea31b5cb7so2197737137.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:36:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXguQ+ZO2UnQAKjCj++b8cgK31Z8SWuKkLo7ZbpLshzHkNm0NxxLKq/sGtWxsUwLuVj1pmkejCKJUvJ@vger.kernel.org
X-Received: by 2002:a05:6102:a49:b0:5db:f615:1819 with SMTP id
 ada2fe7eead31-5f183896f48mr869822137.3.1768404994347; Wed, 14 Jan 2026
 07:36:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114151328.3827992-1-shorne@gmail.com> <20260114151328.3827992-2-shorne@gmail.com>
In-Reply-To: <20260114151328.3827992-2-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 16:36:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVdeepsCSMBrzUvhAFXj4zjA7VwRpxn+xVuZ0d1+9mTEA@mail.gmail.com>
X-Gm-Features: AZwV_QgYklX1dY-yBai_t1Hmyb0_GhAlHmkB-BntyC-t8YeO5tJVXZ8WCzYpBkQ
Message-ID: <CAMuHMdVdeepsCSMBrzUvhAFXj4zjA7VwRpxn+xVuZ0d1+9mTEA@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: gpio-mmio: Correct opencores GPIO
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Stafford,

Thanks for your patch!

On Wed, 14 Jan 2026 at 16:14, Stafford Horne <shorne@gmail.com> wrote:
> In commit f48b5e8bc2e1 ("dt-bindings: gpio-mmio: Add compatible
> string for opencores,gpio") we marked opencores,gpio to be allowed with
> brcm,bcm6345-gpio. This was wrong, opencores,gpio is not hardware
> equivalent to brcm,bcm6345-gpio. It has a different register map and
> is 8-bit vs braodcom which is 32-bit.  Change opencores,gpio to be a

broadcom or Broadcom

> separate compatible string for MMIO GPIO.
>
> Fixes: f48b5e8bc2e1 ("dt-bindings: gpio-mmio: Add compatible string for opencores,gpio")
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v4:
>  - New patch.
>  - Rebased old patch and rewrote commit message.

The actual patch LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

