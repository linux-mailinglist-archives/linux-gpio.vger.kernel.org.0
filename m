Return-Path: <linux-gpio+bounces-15848-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CA9A326C8
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 14:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9102E3A796E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 13:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92DC320E02A;
	Wed, 12 Feb 2025 13:14:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47811F4E2F;
	Wed, 12 Feb 2025 13:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739366080; cv=none; b=QMeR53HeTTa3odX7/HkX0QJmFm+ac1LJze/HIV+biHKiTvkkwHm4pqk+yC6zpLs8XPwAN7JFB/LMZXgopm+uxwzlA8tmHXwmYnUyTtfq8UAag70LzxqUTXJYgk5LyydFNsCLTbPFN1ZSl6Kg5zCOL5Mwvm62CNrZhSK1GCVN/yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739366080; c=relaxed/simple;
	bh=Fud4oDpafnZUi7DoELKM4+0sEuduSKDG/xijFq9znoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpT/UN/oxYobmK9lTTPIb94qmHZv+2iq/URH7EIAUpdzXwTosvzWVZ4+DEHFgjIqpyNLLl/hpYUGUh4C84sqApa4UxKKsPBm2/nkGT6kIvcoFK8G0yPj5lvTVbDGu6w2LRde2ei6jyZNBVEfRCakdzsTUXunFsYEWEMwPDmWMCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-866e8ca2e07so1772194241.2;
        Wed, 12 Feb 2025 05:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739366077; x=1739970877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tK/P643y8Kev1QsFfKgPm1YvkIkI9X/n3s2ST02uII=;
        b=gCCBdyEDBCoJMoaKrG1sB0rQlcjwh/tZbRUwM9l+0QAWQT84A/lEDuOMOLcoLldkH9
         GTNMEypBe6jk+7mbVZ+SDcXUDCyeS+Ae1ZPWP0FYFPeUHBkXHknj+J5SYQ6mv9CZe3Bn
         MLCSsSmyPGflybjt6ITdITIo9b5VlsWmX3lmNqUviheJLfUwJtIWYTs1X0qbU6PY17Sd
         Sub0tCX6OR4QC2MGxrdsAvY9cGntKjyTpQ9iw7rhABbccFuszGOyIfvgioz8MuuNNjhO
         Mx/YM+UIaA3HvVO2x/PfTWODYr3t6SIELAYBWnYS9ZUw5dGY7CjaA7IecWP+POKHuWt4
         mySA==
X-Forwarded-Encrypted: i=1; AJvYcCU9Gtu4/EhtEjIR2bIZgNJZzFSTiSBsYRFKCZaw5IL/sWE8ZrkspYYdsDvlNEm+rAvjDHHSDNR/cN9Px7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvhPgBrWgE8WBC6LFMtRnI6X649yN/hMlMyRuGU6s2l9CynGEq
	fQhAqCEuCTLsILvc94xcqmSaq5TokNQ3J/e91KXPx3nvsZnN7Ifalb06rgWF0d8=
X-Gm-Gg: ASbGnctN6FTDJsr1gHhY1LxsM9U3fVxO1V7NKLukvEt5xCFQIPKYigI2MZdpfQTUEaX
	wss/xzwloWoBv4lFZmZdoTjsaoHspX20fr6TgdzbdMUsAHXeXp0/Udl/fv0wZJ0rBR6Z3E+QTrr
	+FBrF8fa6l+QpVkbomxlRhcQzcn8wCexwAwZQ0fXX8SY6A0uAVm1Qefukt5ee7Kj88P7iJI12In
	f2T6GRR+Txk5iL1rgEm4xBYxhMzUUCwrKEi1+AsaUFCQsY0yOAZ79HdUiWDQPXiSqcw9GvUvhPy
	XqInDbl+gYWjZfjoUaK+cK9Jz+c6JQV1UYwps09NCav7EK1kf01zRw==
X-Google-Smtp-Source: AGHT+IHIZjNTaett+Urwtv+xiWcko5tmBN1Fqei1EluXA8iG24kFIbNSgXdTABlF66v+GpFkSShvHA==
X-Received: by 2002:a05:6122:a24:b0:520:5185:1c83 with SMTP id 71dfb90a1353d-52067cc5667mr2584710e0c.11.1739366077229;
        Wed, 12 Feb 2025 05:14:37 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f227348basm1911566e0c.14.2025.02.12.05.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 05:14:36 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4bbbaef28a5so1282190137.0;
        Wed, 12 Feb 2025 05:14:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsELAVDaTpdB+4kUMS5VKrvzbhUlyEGQMdz46soaGcokYhfbJpHhKiYnj42VThNxjl4F2VQbhInDpz/f8=@vger.kernel.org
X-Received: by 2002:a05:6102:41ac:b0:4bb:c24b:b64b with SMTP id
 ada2fe7eead31-4bbf229215amr2286958137.19.1739366076702; Wed, 12 Feb 2025
 05:14:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-1-koichiro.den@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2025 14:14:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVoCf2VmgZOtNOPxhpTdYBWEWgCozLM+opaL7wOtF10_A@mail.gmail.com>
X-Gm-Features: AWEUYZlDONZ3iytbnOWeS7MC4OBYT3hBa1GjqDEQBwzKztL835e4H-7nYGvMlJw
Message-ID: <CAMuHMdVoCf2VmgZOtNOPxhpTdYBWEWgCozLM+opaL7wOtF10_A@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

On Mon, 3 Feb 2025 at 04:12, Koichiro Den <koichiro.den@canonical.com> wrote:
> This patch series introduces a configfs-based interface to gpio-aggregator
> to address limitations in the existing 'new_device' interface.
>
> The existing 'new_device' interface has several limitations:
>
>   #1. No way to determine when GPIO aggregator creation is complete.
>   #2. No way to retrieve errors when creating a GPIO aggregator.
>   #3. No way to trace a GPIO line of an aggregator back to its
>       corresponding physical device.
>   #4. The 'new_device' echo does not indicate which virtual gpiochip<N>
>       was created.
>   #5. No way to assign names to GPIO lines exported through an aggregator.
>
> Although Issue#1 to #3 could technically be resolved easily without
> configfs, using configfs offers a streamlined, modern, and extensible
> approach, especially since gpio-sim and gpio-virtuser already utilize
> configfs.

Thanks for your series!

I gave it a try using all three ways of configuration (sysfs, configs,
DT), and it works fine!

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

