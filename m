Return-Path: <linux-gpio+bounces-39148-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WreQCM2TQmo5+AkAu9opvQ
	(envelope-from <linux-gpio+bounces-39148-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 17:48:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 893E76DCEB9
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 17:48:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39148-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39148-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 264743082F87
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 15:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955B63EBF2F;
	Mon, 29 Jun 2026 15:35:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EAB3ED5A8
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 15:35:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747307; cv=none; b=Rvs3efqlH2qJg35h7sxsQr3I5tS9i7O9ny00liL/wdu9oZ8IMR+2kZqT8/hWal6hSt9JAseXY7llYUnZADDsgJcGEYL6qm3Fm+Hg8gIxjgo7PKfFE10p0St+FGu2taWiWE3cBu/Wn95q0AejysbWLsK04NwXSIpzS7myekZIBho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747307; c=relaxed/simple;
	bh=BODU8nH72xA0ScZ+HzwpHMr8UOUoOL0Z1xiarATGzqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcJxvtsg7xqM0XEZMpDV9fELnEdOkX+fnJAWrQ2ug12nqT20KtqATk8H3VJXPKNhjJWEXBS+5eiTXUkIM94MkaY24JRva0hlFK4NH41kqKleJ1v/PkGom8KjaldmWCIyRxwkHxqX5PtuquHaH2MCb48JZd+ywuQ5FOHLbpV9TnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-693c69b97e7so6682975a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 08:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747304; x=1783352104;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PSkrSvBcOj2Vfr1tOG9HdESUGrp+uU5X3MHl1xNqsM=;
        b=Je985iFscRxQdGRepeaPlGnZ5yZuW7Co27mIGHXpiOolWAEbIexGgL4Rj/o0jNiceZ
         m9JU9g+mSY9zy+7lauxSnm3J2Ur3sHyOnO/J+PmdXDHNp3hqB1dxnmjk/XrG/BB8zGoe
         Nj9npSdDHnVaRig58QyaeMqfkRIhMj7kV6xbNVyzJNUh/sPXqy6P1TPmNa88VT3KCapx
         gfuoGEK2wHNY9UPW3j8ILeshRhEjponM5fZlmwLXS/08n2isLuAal6ZQPAMs5IB6glUj
         Up5j/bmYK0eaSKAtbP1njHSgo5jP9IWYSLwACfNKW4avZ70NKK5xKDaZokcMdZkAoJKn
         rgxw==
X-Forwarded-Encrypted: i=1; AHgh+RogweMMQw92zWXF0ICPP++9F6eSUMReqLv8gmGa7D38J1VLh4W+ss+rDc/rTFdgBvwzl1Rj6tKAqTC+@vger.kernel.org
X-Gm-Message-State: AOJu0YxDiq+k+Eq/514LUQcQGoCsUJNRgQ4gCfyZANEqyGL5ta10ACGr
	P2tKHB7IYaT9CVopGlXV2lYU+qxbnVFFhqYzkQi4tUCU/zH/Rx8g5qU71tB50QquTMc=
X-Gm-Gg: AfdE7ckHDgbTmxdNFwylzJePYlJbIXVOYxCd/41kF6DrPpzrO1OEG0QYLnukJy32x/U
	r4IkLK7UqO3Ib4Kyeukv0Qkaxh2zZbl7UmIUOxW7YEZsHyJWqKTWr00q9KYEgx0mmvops3kD4cf
	kTqwGKFxUATkHhC6CwBG1C1o/QKzkafDNatuj0O7fJuthqhe9oxLvELW73R7jRysJ6iHj5xCs2M
	d1XdYqwzSXGgKoXtXBryh4Yg+Et18W7aQ6VzDM5/41IcpafsdtoI0nw1G6raMgT1Vz6wb9imoNj
	piOQn0s7bl1IH8arVyF8RB6btxrkTip7xgLkueYxJ05qR6epLK5QsflqFEkRXDufZ6D5ba+jKg7
	ksV6I45O25SVQRWmPzvqZCdX7Vos2acC9b8MDl+xV9XejYOweMFheawWpx1iFEF79wOLXIjntgZ
	gzgiA+j//QIzOtAt5UJcZW3uWK5CSwFrfGXzvWPQ9b7thO81hOlnO9ayN2I/e6
X-Received: by 2002:a17:907:3e1e:b0:c12:5625:2529 with SMTP id a640c23a62f3a-c1256252600mr254353166b.58.1782747303756;
        Mon, 29 Jun 2026 08:35:03 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1252b4e6e0sm292162666b.2.2026.06.29.08.35.03
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 08:35:03 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-463f1165e16so3526909f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 08:35:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrGLQ/Q8jkpe9obaeaGFxNxgLPNvFLIMdflftGiBby9I4FrBIm7pELN+Hukucz1t5f6FHFIc7gS2CYB@vger.kernel.org
X-Received: by 2002:a17:907:3c8b:b0:c12:f84:85d4 with SMTP id
 a640c23a62f3a-c120f8487bamr796791266b.24.1782746977928; Mon, 29 Jun 2026
 08:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629135917.1308621-1-arnd@kernel.org>
In-Reply-To: <20260629135917.1308621-1-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 17:29:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
X-Gm-Features: AVVi8CfSSg4DcoB7CGCYddSfqoWpUaOwYUjpkorP-3LR7U8E7vJ9ucbePhiZLD8
Message-ID: <CAMuHMdXhsM4JzArRuB=A46N-Ogbn2Fans+PVJVA-hEytFq=DeQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] gpiolib: introduce gpio_name() helper
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Marcel Holtmann <marcel@holtmann.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39148-lists,linux-gpio=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:marcel@holtmann.org,m:myungjoo.ham@samsung.com,m:cw00.choi@samsung.com,m:geert+renesas@glider.be,m:andy@kernel.org,m:dmitry.torokhov@gmail.com,m:ulfh@kernel.org,m:linux-bluetooth@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-pm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:geert@glider.be,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,holtmann.org,samsung.com,glider.be,gmail.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linux-m68k.org:from_mime,linux-m68k.org:email,arndb.de:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 893E76DCEB9

Hi Arnd,

On Mon, 29 Jun 2026 at 15:59, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most remaining users of desc_to_gpio() only call it for printing debug
> information.
>
> Replace this with a new gpiod_name() helper that returns the
> gpio_desc->name string after checking the gpio_desc pointer.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> Not sure if this the way we want to take this, or if the gpio name is
> an appropriate replacement in debug printk.
>
> Since most of the callers of desc_to_gpio() and gpio_to_desc() are
> otherwise in drivers that already depend on CONFIG_GPIOLIB_LEGACY and
> include linux/gpio/legacy.h, only a handful of instances remain that
> are otherwise in files that otherwise only use the descriptor interfaces:

> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -758,8 +758,8 @@ int gpiochip_fwd_desc_add(struct gpiochip_fwd *fwd, struct gpio_desc *desc,
>
>         fwd->descs[offset] = desc;
>
> -       dev_dbg(chip->parent, "%u => gpio %d irq %d\n", offset,
> -               desc_to_gpio(desc), gpiod_to_irq(desc));
> +       dev_dbg(chip->parent, "%u => gpio %s irq %d\n", offset,
> +               gpiod_name(desc), gpiod_to_irq(desc));
>
>         return 0;
>  }

Before, this printed:

    gpio-aggregator gpio-aggregator.1: 0 => gpio 589 irq 188
    gpio-aggregator gpio-aggregator.1: 1 => gpio 590 irq 189

After, this prints:

    gpio-aggregator gpio-aggregator.1: 0 => gpio (null) irq 188
    gpio-aggregator gpio-aggregator.1: 1 => gpio (null) irq 189

Same results for instantiation using sysfs or configfs[1], although
the latter does have optional support for specifying the name.

[1] Documentation/admin-guide/gpio/gpio-aggregator.rst

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

