Return-Path: <linux-gpio+bounces-13156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E400E9D391F
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 12:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9BE2285B79
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Nov 2024 11:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE381A706A;
	Wed, 20 Nov 2024 11:04:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0BF17BB2E;
	Wed, 20 Nov 2024 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732100695; cv=none; b=SOU3xlHw74jjQObqMcOoekb2QYofT+HJAHRQa+TgDrj6ahESG0L2axHsDfS8DdursFmIKy+56P/OPrfrYf+Xr9hWP9FBv6+8t73982XZrnd5GQSWI9VsLWwRnqzNPMR3m/rrIrTI203hrIFJXI1aWeqQfKASN07Ivy6MuPJoDnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732100695; c=relaxed/simple;
	bh=OVgDtO9cy79NmdkAcw8w1WJzWj8zv5JR955m1f7MFXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQ8zClH1ZVoSv5yhmVuTPEl6JDNGLIdakRs+a4DoA1RoxGIZvJUnQCnKL0tTtFbIUYP/XJwKB6jpzbF8FVDhFj1Ey0D6/qUB9r0UvByklHOdhbO1/wNuRruE38mYNEdS/Rld7XJUjZeLHdsX/H2XSlAuMtpi5FuPN4CN0w9EwMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e382589e8fdso4921614276.0;
        Wed, 20 Nov 2024 03:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732100693; x=1732705493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zp6NHSwjq6RwaH2ECKqkZ0C2RUZPVMxuS7OZbSAMyD4=;
        b=bbD6LVwhlesTZ8K12IksHlH9gtUSx7BOKKxC81ufNRzqOvHDOvPu+d/9GgsI+ltl3m
         yvnNh7GaQPLyAXnBW6P5iowJj554XsQnWI3Qpc9YjtzA3SGv/ouPujHK8jbWhcqT38wi
         i9w0I+ONF875vM2UOVX3gDFF1eC4eupzdEJDh1Yl/AYCrTFSgRSwJlftcZHdrqnxg54z
         fKiptXo4djSzepn7WUikWisGFtMPy6ubI/y6KiB5yFLJ1SOx1/KXM213C230VG1dXaA2
         nr0ym1lDaGxdH3m8TFe381cHvXgcm1HmndILbzVLg8yDdv+kDtgq1M1jCLmgZj1L6dn5
         xZdg==
X-Forwarded-Encrypted: i=1; AJvYcCUhEqNjkyGcTpgfDrnuOsq73vVDglHzQ/jIkyK0JFa4dN4U5N90+L4Q7ZT5/ZYehinloTb2KOWGtLfm@vger.kernel.org, AJvYcCX08vfz8l6py2cT4YzBsc+Kh8lCaCcLd/3ZIUIa23YcgUBWZLHI5LDRj7NWQDOTlQohCvl/MTprOKVIa2dQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxP2DuntsHTzqbI2vpGRLJBzcvx/ECqelXTELEokN45UWoDoAGk
	0yUHKuBlHL4gV2vucI9YizhOq+0vLb1/fLKxZMunQzpsnHOpPikGZ0tjpvG6
X-Google-Smtp-Source: AGHT+IEvzfm1D7yGYLwAl3xFYA4+17B4OVsEp/4JGaNISiV6xjtmlLOv6r5PhA3pdjbeAfeDtSUEGg==
X-Received: by 2002:a05:6902:1b82:b0:e38:ba98:47e0 with SMTP id 3f1490d57ef6-e38cb717550mr1854413276.47.1732100692805;
        Wed, 20 Nov 2024 03:04:52 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e387e73baefsm3141626276.18.2024.11.20.03.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 03:04:51 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e3c3da5bcdso57096627b3.2;
        Wed, 20 Nov 2024 03:04:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2fuk4HISGl1m7CFat2JszeBZr/2dlQf7zGxokFbmjYfg8D98mQljcDdHPL9r1tHWAsYgChcovBqRI2Bbt@vger.kernel.org, AJvYcCW60YkyAphh8wYuzmsI1chOrlVd4WkJ4TJ+HDzsW+hJPLd30QuXmh0ZhCZAcQJxx8eCNG4dyovc5Vlr@vger.kernel.org
X-Received: by 2002:a05:690c:9c07:b0:6ee:6241:ac9d with SMTP id
 00721157ae682-6eebd2ae6efmr25400857b3.28.1732100691631; Wed, 20 Nov 2024
 03:04:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <505e5950dd2d76e6c3a8af57bc0cd1e0fbf2b637.1732093745.git.00107082@163.com>
In-Reply-To: <505e5950dd2d76e6c3a8af57bc0cd1e0fbf2b637.1732093745.git.00107082@163.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Nov 2024 12:04:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEuWrfj3p0pX7FX6AgOKryFUnCEBRhPkhvnSEkMwThpQ@mail.gmail.com>
Message-ID: <CAMuHMdWEuWrfj3p0pX7FX6AgOKryFUnCEBRhPkhvnSEkMwThpQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: Fix a potential abuse of seq_printf() format string
To: David Wang <00107082@163.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, kees@kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, Nov 20, 2024 at 10:15=E2=80=AFAM David Wang <00107082@163.com> wrot=
e:
> Using device name as format string of seq_printf() is prone to
> "Format string attack", opens possibility for exploitation.
> Seq_puts() is safer and more efficient.
>
> Signed-off-by: David Wang <00107082@163.com>

Thanks for your patch!

> --- a/drivers/gpio/gpio-aspeed-sgpio.c
> +++ b/drivers/gpio/gpio-aspeed-sgpio.c
> @@ -420,7 +420,7 @@ static void aspeed_sgpio_irq_print_chip(struct irq_da=
ta *d, struct seq_file *p)
>         int offset;
>
>         irqd_to_aspeed_sgpio_data(d, &gpio, &bank, &bit, &offset);
> -       seq_printf(p, dev_name(gpio->dev));
> +       seq_puts(p, dev_name(gpio->dev));

If we want to add the missing space here, the code has to be changed
to use seq_printf(..., " %s", ...) again.

However, it might be simpler to move this to the core. I.e. add an
unconditional seq_putc(p, ' ') to show_interrupts()[1], and drop the
spaces from all callbacks and from the fallbacks in show_interrupts().

[1] https://elixir.bootlin.com/linux/v6.12/source/kernel/irq/proc.c#L503

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

