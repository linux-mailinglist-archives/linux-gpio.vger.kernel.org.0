Return-Path: <linux-gpio+bounces-19919-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2228BAB32E9
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 11:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4484A189C507
	for <lists+linux-gpio@lfdr.de>; Mon, 12 May 2025 09:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396FA25B1F5;
	Mon, 12 May 2025 09:18:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE57134AC;
	Mon, 12 May 2025 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041485; cv=none; b=OkSPsksQd0jtm93Qo2PzUeSP4807gSBoTMn9/63xELkb1z0ExuB+rmXwRUKTP2VsBHLKSypMrzHxTAzUy/3GHyY9S2dHByEjGaKBRQ7CJdToybS5HSL14bKC62tNrr/3Tqo2Y6I5X7rGHeHhVd3x4BqvAJcnAP0Mwjcd9wyaPkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041485; c=relaxed/simple;
	bh=20wCNPBChVfLOxnez/k+p6fyn8K7JV/aN+exYqU8/sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTRKAbyTVMX7yDThHhUe/t2jzV87ndZ1yUYen4xf4K/s/x99S4v5CQzFtweEIvuoyie9X1TB7g9TqBMlTCWGIoR3rxLcQaFT2hePCFJ5gY9pH2Bfx7niR/Qog6HnnnJL8PmUUFUQVJMUlDsnp3gzLoSFkC3SboKsidubkjLCoCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5290be1aedcso4124704e0c.1;
        Mon, 12 May 2025 02:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747041481; x=1747646281;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GCzaDLKiY3kq0HsFC8+1h8MN6YYKUQQuwUOm7Hvb2g=;
        b=REt9+IZIgWbESEvk3wjGK9bOTRgUKNbToQPQ9LmcXHSID5M6tiXpvmC1wCACwcrzJm
         EGaoESpcgu0kNFwCta+iNDxebCtp+Hw1lOYl+ugV6Kq6iw/18VYjK/WeoKQ6NFesBqdG
         HnM3KYg6WxynOLcpPe5lvuNJsV4AbHuNQ56G0gFvBv5UCfeIwI4Fuws+VKIRF2a7nRQ+
         A1vGsIYvPP1f8QbcnBf2u/gaxGG4KWC2mS17iVOKuZ1fAW9zmQp+avWMdJUZ7lmbqwjn
         uod0hQ76wAlQF3nhVW7MvIAlwljQykF8tSpVIa84UpOxeshUkVGIJ67DlFh5Z6YRncfc
         22Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVSH6xRCL2doUc7HpceHdWGXncmkQG0pf8Ue03ISWZS/Zjf1Iq5y//mw3xD6QTFaWxe/plJKOd0@vger.kernel.org, AJvYcCWFloWLFD4eyX6D+lOz9hIiBn/PH6xP+hJDcxKJcO7+xAVu7Mnc8vYfOIcBkkAGfnBskjqMWJ1N3FN0GWym@vger.kernel.org, AJvYcCWcAps/wns2BSU8jviZNIyZVef/CfI/XY320sSHZROLgN5GUH2n+841w0E6KUT3RkKU2+ADSHd8O7i4@vger.kernel.org
X-Gm-Message-State: AOJu0YzfAe0wxuKWA3310zjzOzsq0w1AwrwKdHr7R95Kfua9bPAbgYcm
	76oP/9Jw2YR4UKOzxVraQJcszwFTH1Y1W+pi/5eY7ZULdj2RT09WfemNwtFj
X-Gm-Gg: ASbGncu5EUwK4fAxU22M9cgbxf8vNNzVWN6HHZEcq20LR0xwZvWbmzajQl/wsMTIqD3
	2XMUZmdLGv+2lwk9NiyknVdyUKnEOyd0hlfRGhgoQLsgTxwEnQY4fNHpGnCcMy2+OTxUvH+RUsf
	7s61+hy/8U5a2V0xjDVJvwPHNPlF8D+5afyFgZIcJ2pslZCtkPXITl2mlav861IyJ5NbKmGZ9kz
	RDCz8FlFD3LVI/JZJJu8EHyYmGf6Bi7ZTavvxaHjAnu4v9c8K1d1L9YRkN27REkgMEnHExtqM+b
	+Yz9noYbEOyXmimPxsK4pxtH7phrgZctvY8v2YzTxSVpbgTjKbXMx28vzaq4NOcJ2pd2aV6CfFf
	CiZVQmE4xNxW45A==
X-Google-Smtp-Source: AGHT+IHJs0ZzCPyfm0JL94byRrkupHP8LDAu211cUAaO+EsOa1rRPYUfi9plZlazokd78/w9INEM8g==
X-Received: by 2002:ac5:cde1:0:b0:523:dbd5:4e7f with SMTP id 71dfb90a1353d-52c44223bfbmr10687585e0c.3.1747041481098;
        Mon, 12 May 2025 02:18:01 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c53574e28sm5407716e0c.0.2025.05.12.02.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 02:18:00 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so3101652241.1;
        Mon, 12 May 2025 02:18:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCsAQ/qq307ymILubpUwpi9ixVKGQLuMtFqJpcyaOj6Yi6XS/n63LdEQ36TH3Q3lB2J+nLtqHhK5CY@vger.kernel.org, AJvYcCVM4tQiUg1lu9LUEDFegBdBOyOrG8BgF3EEe8+YfA6PJK4dqcPOdqevGyXi2gjZROnViVPBRSZ8@vger.kernel.org, AJvYcCXIcCSNavZ/i9Sc7Ctrn+hVHKrQx1FyBKbl2SIzhZEP/GYXk9ZNsAOx5pGr+LJQp6wJx8Bpt+4OYpw1IksN@vger.kernel.org
X-Received: by 2002:a05:6102:1529:b0:4c3:243:331a with SMTP id
 ada2fe7eead31-4ddac869475mr14899178137.6.1747041480540; Mon, 12 May 2025
 02:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509141828.57851-1-francesco@dolcini.it>
In-Reply-To: <20250509141828.57851-1-francesco@dolcini.it>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 11:17:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqRpuy8gsz+0a0xTp6VWfMD0=WWdS84jWvF31O9i4MZw@mail.gmail.com>
X-Gm-Features: AX0GCFu9GLpjYZglknqssUJDtYOeHiT_fWmLArgWGMr7BFw0q2XZWcOcZfqXvp0
Message-ID: <CAMuHMdXqRpuy8gsz+0a0xTp6VWfMD0=WWdS84jWvF31O9i4MZw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: pca953x: fix IRQ storm on system wake up
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"

Hi Francesco,

On Fri, 9 May 2025 at 16:18, Francesco Dolcini <francesco@dolcini.it> wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
>
> If an input changes state during wake-up and is used as an interrupt
> source, the IRQ handler reads the volatile input register to clear the
> interrupt mask and deassert the IRQ line. However, the IRQ handler is
> triggered before access to the register is granted, causing the read
> operation to fail.
>
> As a result, the IRQ handler enters a loop, repeatedly printing the
> "failed reading register" message, until `pca953x_resume` is eventually
> called, which restores the driver context and enables access to
> registers.
>
> Fix by disabling the IRQ line before entering suspend mode, and
> re-enabling it after the driver context is restored in `pca953x_resume`.
>
> An irq can be disabled with disable_irq() and still wake the system as
> long as the irq has wake enabled, so the wake-up functionality is
> preserved.
>
> Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
> Cc: stable@vger.kernel.org
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v1 -> v2
>  - Instead of calling PM ops with disabled interrupts, just disable the
>    irq while going in suspend and re-enable it after restoring the
>    context in resume function.

Thanks for the update!

> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -1226,6 +1226,8 @@ static int pca953x_restore_context(struct pca953x_chip *chip)
>
>         guard(mutex)(&chip->i2c_lock);
>
> +       if (chip->client->irq > 0)
> +               enable_irq(chip->client->irq);
>         regcache_cache_only(chip->regmap, false);
>         regcache_mark_dirty(chip->regmap);
>         ret = pca953x_regcache_sync(chip);
> @@ -1238,6 +1240,10 @@ static int pca953x_restore_context(struct pca953x_chip *chip)
>  static void pca953x_save_context(struct pca953x_chip *chip)
>  {
>         guard(mutex)(&chip->i2c_lock);
> +
> +       /* Disable IRQ to prevent early triggering while regmap "cache only" is on */
> +       if (chip->client->irq > 0)
> +               disable_irq(chip->client->irq);
>         regcache_cache_only(chip->regmap, true);
>  }

While this does not cause the regression seen on Salvator-XS with
the earlier approach[1], I expect this will break using a GPIO as a
wake-up source?

[1] https://lore.kernel.org/linux-gpio/CAMuHMdVnKX23yi7ir1LVxfXAMeeWMFzM+cdgSSTNjpn1OnC2xw@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

