Return-Path: <linux-gpio+bounces-25937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BED1AB52DB7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 11:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B2F3BD422
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8722EA49E;
	Thu, 11 Sep 2025 09:53:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD9C2EAB70;
	Thu, 11 Sep 2025 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757584438; cv=none; b=YR2W0pH6IPxDlvxBMQacZI8O/g7gFkEeuIEb2CWaW25WB6sFdb6CnEXgvcAnMHmvF9bsq1fm6Y/9Im8pXMk1DNVQX78Ee+3P4L8OkR7cYznDwesnEqMBhSJU85rjjNhUi4DHcEcnzqMKQ0BDNMp5EgOhW+BHQx0hoMRC64gQWQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757584438; c=relaxed/simple;
	bh=vexckqvgr+n/Q8DUs0GImyk3xaI0GrnJgcQWdAXHJB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s14MPnmBPpjOcQziahltxuWpEFuO/U+gdGhd/AjisVfO5Z0xKTZsCaxQrqlxea8MofuhRBN/sa1zn+kwFxWh+8gya5MuzyeRbh/y4cXwxcyGR/jJ+3PTb51Mn5TQfLwQFv/uemuqwFDI2K5NkikuE2ow/shrYgib3Ver6z0Nx4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-52dd67b03c8so422731137.2;
        Thu, 11 Sep 2025 02:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757584435; x=1758189235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSF0/8/8k+hhEh/LF66/wbc0YiFnHMUi/eNs3GBn8lg=;
        b=OUB0/vwfuS0Mfww5XNROc/UKDRH66shp2sEmyG9oe66GGmxbHD/ahKD3U59Rp063ZQ
         7oV0NSafub2VNrF1pzWBlsat831MO1hi04cdQxW5UMpHgbhNiiubx0WTX3BP20BZEqW6
         CmfDg5WApepbPXS+PwhjVGisbpeBvOa+9WoN0FWhWyAdExnRCyO24rReRFSbB4Z6KZ42
         kQeI7iwtiNmwJIH6UU9acgLOpbysDGKB7bjqRgRMMM1aXR/aOQvkCVWw0bAqD5TLf8RF
         lD2zUm11+ymsCbT4SLjh1/ZbvR79ug1+8jhVeEPFPSYHrOEAy7OZpfe3h1f9+xXU+0Hx
         eFMg==
X-Forwarded-Encrypted: i=1; AJvYcCU+P2fGPtU0zXtHC9zSYgGh1540w5uovvJp5sDDCjN6dIY8mmCSG0dafTlMH/PTg3B64vtlJhUE8aHmnhkf@vger.kernel.org, AJvYcCVldXU7XDKbKQeECaoEw8vJQd1w21tTfCfeHAqg+NiXQGZU4woiDCHV6FkyI+DH1l0UrMjNGoHXITt044gaHflI2ZM=@vger.kernel.org, AJvYcCX0t2FzaOykqvjGHGLAkWYQsYNuxkydUb/XVEsloJe8JlxBAG/2zRPX1vbMXcBQ77DipO7vG9Tq@vger.kernel.org, AJvYcCXjUCBptZJUJBiVGocQ3mjWgmH9c1xKcH4P5vqHBobtwI9sN32IdaYQcEMLtHYvnUBRVYfhmGEUgM+6@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSSGrNwluDqY2jh2D2sSD/Xo8UOPQy4NnCjsq0ztmOt5F9WvW
	hOU0iixGov47jxnAuQladWgyO/ysFelq1YrCQFf1eeqjwEnNZYfVm6x7qjj+/bhj
X-Gm-Gg: ASbGncsv3CaWULFV3S9/0jTk9VqvywRe1Xl4pXTYaJHXT0n3jGIPKSEuOvmL2cBiv+X
	ZRCLz5HyzxYRmEz91s+cNtIEJtqMXc+hWxXwqEUoEcmICYcGc6DpQCaj6/ZxpDdSzSHGo0Ytds9
	3pEb90vxurhHyZa/G42nk4YwYMLBTPpJuWIoe9IxHbGhiMYIrETjBRyqqFOiee8L3hNcyriL4X2
	N99GH+eKbEDzmlW1ebUmVBvCD/eNbC7MJEJ2bPuKtYEP8q9q6c+bSAluw0eG/ReQ4w/+66udjQq
	jM1TnAD+HXHQtE2prIdtSQ0UOJuO01V527ddcTPVCqB/utpUF4AuvzKRFnPeYwTXb1o7NT9c0OT
	N1iQvVbFF9Z6zW4kdoclwaCzO8+teFoMuag+3pSXLDhrfUjhtPDaGEPcPJsUL
X-Google-Smtp-Source: AGHT+IE07bJfPKVJq8iVTeDCmqd9Kv5qaMxYTFeEfbiKPF3gYclsvkyycpNti780EXac6NnZpuSYlA==
X-Received: by 2002:a05:6102:4414:b0:534:1aae:2d7b with SMTP id ada2fe7eead31-53d231f8b57mr5206273137.24.1757584434617;
        Thu, 11 Sep 2025 02:53:54 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8ccd38f8d83sm172075241.11.2025.09.11.02.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:53:54 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-52dd67b03c8so422728137.2;
        Thu, 11 Sep 2025 02:53:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMjM/2O/M7pGPrpcTU4QaWEvNsNl7THvi64Ge75Lbd3NBxkF9ifZUy2YsZ1z55bvOIXz8eixHH@vger.kernel.org, AJvYcCW95cOFBq00FSb9laK92QhOqbKh3Q1jAGHNq007f8A/V/OFfo69uEYMJ98OgCN/rT8BfkTdraKiMejvYU/8@vger.kernel.org, AJvYcCX9AHb+KIt9wolBuyWcJx5pKzC4I5PSQCZFScPVRG83fEQ/7LQEwgTqzYe96Dk1xTZeeIwMiMJWbpms7mBqxuhv9a8=@vger.kernel.org, AJvYcCXqVyQbSLVxdOWvc3PrPql3OkF2ScvIdogGQfcQpgdMRgdWOTSi0QJoIm9hJ0hWNDcAqQ07BrzNtibV@vger.kernel.org
X-Received: by 2002:a05:6102:41a6:b0:529:b446:1749 with SMTP id
 ada2fe7eead31-53d1d61d3d8mr391658137.15.1757584434133; Thu, 11 Sep 2025
 02:53:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908144250.1269294-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250908144250.1269294-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 11:53:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVWTAvEMgv2NVg0-2f4Cs4oXp4yBM1tQYUUbMKH6EiGQ@mail.gmail.com>
X-Gm-Features: AS18NWBculkJs5so6XRweGBNYpGT0R-tE5oiBNK2yMaNi3azGBKUpJib1f4NyPU
Message-ID: <CAMuHMdVVWTAvEMgv2NVg0-2f4Cs4oXp4yBM1tQYUUbMKH6EiGQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: linus.walleij@linaro.org, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Mon, 8 Sept 2025 at 16:42, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL in
> gpio_irq_{en,dis}able*()") dropped the configuration of ISEL from
> rzg2l_gpio_irq_enable()/rzg2l_gpio_irq_disable() and moved it to
> rzg2l_gpio_child_to_parent_hwirq()/rzg2l_gpio_irq_domain_free() to fix
> spurious IRQs.
>
> The resume code used rzg2l_gpio_irq_enable() (called from
> rzg2l_gpio_irq_restore()) to reconfigure the wakeup interrupts. Some
> drivers (e.g. Ethernet) may also reconfigure interrupts in their own code,
> eventually calling rzg2l_gpio_irq_enable(), when these are not wakeup
> interrupts.
>
> After commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL
> in gpio_irq_{en,dis}able*()"), ISEL was no longer configured properly after
> resume.
>
> Fix this by adding rzg2l_gpio_irq_endisable() back into
> rzg2l_gpio_irq_enable(), and by using its unlocked variant in
> rzg2l_gpio_irq_restore(). Having IRQs enable in rzg2l_gpio_irq_enable()

enabled

> should be safe with respect to spurious IRQs, as in the probe case IRQs are
> enabled anyway in rzg2l_gpio_child_to_parent_hwirq(). No spurious IRQs
> were detected on suspend/resume tests (executed on RZ/G3S).
>
> Fixes: 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL in gpio_irq_{en,dis}able*(")
> Cc: stable@vger.kernel.org
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

I have to admit I don't fully understand what is going on...

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -2428,7 +2428,7 @@ static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl
>  }
>
>  static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
> -                                    unsigned int hwirq, bool enable)
> +                                    unsigned int hwirq, bool enable, bool lock)
>  {
>         const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[hwirq];
>         u64 *pin_data = pin_desc->drv_data;
> @@ -2443,12 +2443,16 @@ static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
>                 addr += 4;
>         }
>
> -       spin_lock_irqsave(&pctrl->lock, flags);
> +       if (lock)
> +               spin_lock_irqsave(&pctrl->lock, flags);
> +
>         if (enable)
>                 writel(readl(addr) | BIT(bit * 8), addr);
>         else
>                 writel(readl(addr) & ~BIT(bit * 8), addr);
> -       spin_unlock_irqrestore(&pctrl->lock, flags);
> +
> +       if (lock)
> +               spin_unlock_irqrestore(&pctrl->lock, flags);
>  }

I am not so fond of these "if (lock) ..."-constructs, especially as
the function now takes two bool parameters, which is error-prone.

What about renaming rzg2l_gpio_irq_endisable() to
__rzg2l_gpio_irq_endisable(), and moving the locking to a wrapper
rzg2l_gpio_irq_endisable()?

    static void __rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
                                         unsigned int hwirq, bool enable)
    {
            /* old functionality without locking */
            ...
    }

    static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
                                        unsigned int hwirq, bool enable)
    {
            unsigned long flags;

            spin_lock_irqsave(&pctrl->lock, flags);
            __rzg2l_gpio_irq_endisable(pctrl, hwirq, enable);
            spin_unlock_irqrestore(&pctrl->lock, flags);
    }

Then no existing callers of rzg2l_gpio_irq_endisable() need to be
changed.

> @@ -2460,15 +2464,22 @@ static void rzg2l_gpio_irq_disable(struct irq_data *d)
>         gpiochip_disable_irq(gc, hwirq);
>  }
>
> -static void rzg2l_gpio_irq_enable(struct irq_data *d)
> +static void rzg2l_gpio_irq_enable_helper(struct irq_data *d, bool lock)

Here we can't do without the "lock" parameter, unless duplicating the
full body, so this is fine.  I'd rename it to __rzg2l_gpio_irq_enable(),
though.

>  {
>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
>         unsigned int hwirq = irqd_to_hwirq(d);
>
>         gpiochip_enable_irq(gc, hwirq);
> +       rzg2l_gpio_irq_endisable(pctrl, hwirq, true, lock);

if (lock)
    rzg2l_gpio_irq_endisable(pctrl, hwirq, true);
else
    __rzg2l_gpio_irq_endisable(pctrl, hwirq, true);

>         irq_chip_enable_parent(d);
>  }
>
> +static void rzg2l_gpio_irq_enable(struct irq_data *d)
> +{
> +       rzg2l_gpio_irq_enable_helper(d, true);

__rzg2l_gpio_irq_enable(d, true);

> +}
> +
>  static int rzg2l_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  {
>         return irq_chip_set_type_parent(d, type);
> @@ -2617,7 +2628,7 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
>                 spin_lock_irqsave(&pctrl->lock, flags);
>                 ret = rzg2l_gpio_irq_set_type(data, irqd_get_trigger_type(data));
>                 if (!ret && !irqd_irq_disabled(data))
> -                       rzg2l_gpio_irq_enable(data);
> +                       rzg2l_gpio_irq_enable_helper(data, false);

__rzg2l_gpio_irq_enable(data, false);

Before, the lock was taken again, while it was already held.
Didn't this cause a deadlock?

>                 spin_unlock_irqrestore(&pctrl->lock, flags);
>
>                 if (ret)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

