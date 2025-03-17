Return-Path: <linux-gpio+bounces-17668-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217BEA644F4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 09:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74169162D9C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E66F21CC47;
	Mon, 17 Mar 2025 08:18:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E221C17D;
	Mon, 17 Mar 2025 08:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742199517; cv=none; b=MmJOsPPVevLBJoEmDC/0WR/B1vFlYbt0akmNgKxg7tRyBa9Jg4SvbuUOWP0UScrwYVlulPZkUDNnWnecKlE3f9t/NDYht0R6GM5hkfHzVlxbrL2dzz+wEsm67MR0vt6HOgztYH9rXO8b9T1baRW3FdjvMw9WBE42kBdapaMHPK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742199517; c=relaxed/simple;
	bh=2dz0+FF7Roh1dPT6mqzZ/u4xIGB7Kh6rMesnh0OScFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxCQCJXj7TAvgQruSV8tDByIa4jW1bvqx+KadXNgVgp2VSRcRFCox0+d8HyQEKL/f1KTAGJNsR28aFvyFAkJztggj2aiWjshuB8ZLP+ivklQb8hdFTHdWZ+y+4YvxbZdYD6GQTtgFmOyq1Va+OkLb7oBmpVeii7E1pwrYBLklr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86112ab1ad4so1635661241.1;
        Mon, 17 Mar 2025 01:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742199512; x=1742804312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHo+opHkohWj4HkGFv6lxx1lupJr0F8BlUKSDFasPds=;
        b=U2FQ3EY9QY11/cLjdAucOb+CJ3lISO1s1FRo4xZG8u3GQN0oc6aCmzb9k5FvIrZjQR
         pOx2z/ID+6er8zTfvYOO1tNzty+qwnfTe/hE1WCUAcjM6YB43HpHEz8SM8/k72gWP8f2
         QBBusd5a+oRM8c08aLms/WqTlPOR3kzkPA3uWSjazcVdYueUF/s9DeCKjGRA2HaZ6HO3
         sxnWVs8cSnVZpxMuUBQJDeE/LknR8BduHHaagqaXjNIPOABKzaOsDnyPkWU+I2m1KaIR
         AEDSHLJnts6+0FjSqIx3cdT7qzJRIkSQkBrMMjFl8SwwhcJkhgPkj93wFftBWBDHCznw
         ACCg==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZYvDTk3kHOH7PFEG5biLrsV52vpzVMigQsVYuqlUZ8CNZ8x5mY3GJbNjAUKfWKHGbMl32+5+LOu9J9af@vger.kernel.org, AJvYcCWWiiqkt4L6/ludRvwAlQIVI/HiFFOVvBb0g517bnMfVxC8jnHc32flncCObZ3GnkYmH+0kYyx7xAmO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5SJ+DrOBAjMcb4qLn8Q3ls7iNBh+M4huwuGmOTm/ZQB4i6Pxe
	+vblTcyFczVAej00ma82udmrd4xiQxipDRV0b5HNI9sNPQuKvC6LWAahK7o9
X-Gm-Gg: ASbGnctNVLFETksT14k1xzd+3yfCewJ2Wq/dcELAwrBI/PCxhOkI60dO5nWsQjdpqDX
	fd5i53kleolkj/mTML5eDqP46rIcxQlecWElIYfqJHN1rkUmCW+n9ABjtLL+tMw6osbnjAiD9yu
	iTFYi3h/JjvFXF3ZXQAcPKpS9WruTVpJtXkIIEtJmD4de0XyzIngzflgwlgQHz1YEXWIkc9CEff
	oPgF67VFjHnpQyAknkpcFr9FUFrATilDPnzoU42Uwn+iBs55C+diV0tQQ27CELUJTUbK7EMVryi
	NLt0/O/LlbXk7w3yVhQXGVhN+uRajE9SGxZBZ+dNTHLxmWC5V+voIgKJepd1S3q+MRF1XMUn+ol
	ZulpvpdE=
X-Google-Smtp-Source: AGHT+IFTFzSn2BdiF+Z3dueNv2qiZzaSlHlJKMHbbolCVCugiedFTZNYfjoR9zv2ypb80O/eZ8p+0w==
X-Received: by 2002:a05:6102:54a4:b0:4bb:ecb9:b34d with SMTP id ada2fe7eead31-4c3831f697amr6808085137.18.1742199512025;
        Mon, 17 Mar 2025 01:18:32 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90dbc709sm1469160241.19.2025.03.17.01.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 01:18:31 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86d3805a551so1824128241.3;
        Mon, 17 Mar 2025 01:18:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQH8yg5zu8RT/k2tsdJCQaNCHcKfgi5llNekxjwDLeZPO4dD8eo8Wp3ZUFD3uU0nQp2znF5/sBZrCp9WDy@vger.kernel.org, AJvYcCV2m8o1NNorB2Xeewrv2fnIIAOV0S0oym4zyMTaYBwzE0FFTZAaXgoliGVTBwnY8XWyT8HkvuSE++s0@vger.kernel.org
X-Received: by 2002:a05:6102:148c:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4c3831f6b73mr7790718137.19.1742199511494; Mon, 17 Mar 2025
 01:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
In-Reply-To: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 09:18:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
X-Gm-Features: AQ5f1JrIBpkwjNryxJfQFaslTevdePU3lGPPs76Z4xJvDEvLswRAjXO6120Ar_8
Message-ID: <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, 
	Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"

Hi Yixun,

Thanks for your patch, which is now commit 7ff4faba63571c51
("pinctrl: spacemit: enable config option") in v6.14-rc7.

On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
> Pinctrl is an essential driver for SpacemiT's SoC,
> The uart driver requires it, same as sd card driver,
> so let's enable it by default for this SoC.
>
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.

Perhaps this is an issue with the uart driver?
I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
few Renesas platforms where the pin control driver is not enabled by
default, for saving memory), and the system booted fine into a Debian
nfsroot.  Probe order of some devices did change, and "Trying to
probe devices needed for running init" was printed.

> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

> --- a/drivers/pinctrl/spacemit/Kconfig
> +++ b/drivers/pinctrl/spacemit/Kconfig
> @@ -4,9 +4,10 @@
>  #
>
>  config PINCTRL_SPACEMIT_K1
> -       tristate "SpacemiT K1 SoC Pinctrl driver"
> +       bool "SpacemiT K1 SoC Pinctrl driver"
>         depends on ARCH_SPACEMIT || COMPILE_TEST
>         depends on OF
> +       default y

Ouch, fix sent...
"[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
y unconditionally"
https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be

>         select GENERIC_PINCTRL_GROUPS
>         select GENERIC_PINMUX_FUNCTIONS
>         select GENERIC_PINCONF

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

