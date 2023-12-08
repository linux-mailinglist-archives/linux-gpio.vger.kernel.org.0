Return-Path: <linux-gpio+bounces-1121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DE380A438
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 14:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12CD41F20FB4
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 13:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13461C6B2;
	Fri,  8 Dec 2023 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ctLRFmzM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBAF172A
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 05:12:57 -0800 (PST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5d7692542beso19500507b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 05:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702041176; x=1702645976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/h2VaDL8yK0KYT1e7MleKRl/bdsrQUTAKlxgH3CUmI=;
        b=ctLRFmzM54S2+KDgqovJLXUWxTgn4fxs2L2d725/R6kv++8+8Dl3JfebGobiaXn4iM
         SKeGqNg0LPcDNszsIRf3cmX0AxIXotgaFen2HxwuyIk8bdLtKJlYdgHwaR7Yy1pm0G1y
         Wcz6At36cjSbZsx6USXaX/uSmt//2Wt+PduqWRsEXsS/gYJnny6ANZomh3tjqKX6p/5f
         c5Ff7KEPtPT6ucDhnSzdkoFLzEJ1gqLgzlFsrp31nB/k8m44t3Cjbuw5PHBGVK2Nhlku
         weDzcTq5uDiFE5/0pt5x33Kyxa/tM5vRJydlDPEYp6BGINShHSiUfmH6cPUKY2VtM+nB
         80Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702041176; x=1702645976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/h2VaDL8yK0KYT1e7MleKRl/bdsrQUTAKlxgH3CUmI=;
        b=H+csd0+P+38oas5BAbJ9RGMrp63IEO4WaOsMcM3cNPaQqgYBHm6hz+I20H6GXvDvE3
         uEFsBfgjt0IICodjoOJNNSRkwDbDcCoWytVhCCuEMkMhdT2p5YSsOGqHOhsyFrryOcHt
         IxltNoLhzOM62toXvgRLVPhT9OlTf0ViC8d82WKWgH/yfZ2242GGOKIIJ5hEWzUzlTn/
         HZ6iOpHom/Ga8YnNNG+suvs2p3K1K8+tHL3ucFFKFHPUDzzNfVNMcwQJg6yLwIsgq5sY
         F1QCyoWDbYkRu4rNceQO7he7Y0p/VhKEwT+//s5Fuo8686UiMUvLRRDulDO++Y4Dw9Fo
         Lzmg==
X-Gm-Message-State: AOJu0YwTbHmM6jwCMcvXkb7jCF24t+PnhaKv64bp/PfDPahos5Iq49Ta
	0S1pv4mQK/dIhyVjfXkNeT9n5oYTXEZBv6eWlMfHGyJNM4HJIiT+blw=
X-Google-Smtp-Source: AGHT+IEZr7apHUvhMG8bpIocM4+M3f1BQpdGJUfTfz7QlLGi+7L/9zBUXC+SvQYwhPExUmiLkT6aDcWV9iKnevvDlcA=
X-Received: by 2002:a81:b650:0:b0:5d7:8bf2:de3d with SMTP id
 h16-20020a81b650000000b005d78bf2de3dmr4041678ywk.67.1702041176421; Fri, 08
 Dec 2023 05:12:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=McMxnYQosDDip3KGNBsQHDpHg_7bJgvS_Yr_7Y=2kqyUg@mail.gmail.com>
 <ZWFN8RVUy7Vx72CE@rigel> <CAMRc=MdcPNrbhXWm6NX_=kA8ut9pcfy5wJGP7EZFNkHDLrSZUQ@mail.gmail.com>
 <ZWKL4r9DREwYjnyo@rigel> <CAMRc=Md6y=91o_zB7ePLM1tEfG7sjgE2tujZXSRTQQ8y8oJnPg@mail.gmail.com>
 <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
In-Reply-To: <CAMRc=Me3JV6yjfRK6TaVtVYV0zhbn=274uCzbfYZ-uywaSuz0A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Dec 2023 14:12:45 +0100
Message-ID: <CACRpkdb06kOV82Ssyv4ERPbRorbwj9QdpZtHAEVDv6GMGMhFOA@mail.gmail.com>
Subject: Re: GPIOLIB locking is broken and how to fix it
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Kent Gibson <warthog618@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 7:38=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> The reason for that is that I'm stuck on some corner-cases related to
> the GPIO <-> pinctrl interaction. Specifically the fact that we have
> GPIOLIB API functions that may be called from atomic context which may
> end up calling into pinctrl where a mutex will be acquired.

OK I see the problem.

> An example of that is any of the GPIO chips that don't set the
> can_sleep field in struct gpio_chip but still use
> gpiochip_generic_config() (e.g. tegra186). We can then encounter the
> following situation:
>
> irq_handler() // in atomic context
>   gpiod_direction_output() // line is open-drain
>     gpio_set_config()
>       gpiochip_generic_config()
>         pinctrl_gpio_set_config()
>           mutex_lock()
>
> Currently we don't take any locks nor synchronize in any other way
> (which is wrong as concurrent gpiod_direction_output() and
> gpiod_direction_input() will get in each other's way).

The only thing that really make sense to protect from here is
concurrent access to the same register (such as if a single
register contains multiple bits to set a number of GPIOs at
output or input).

The real usecases for gpiod_direction_* I know of are limited to:

1. Once when the GPIO is obtained.

2. In strict sequence switching back and forth as in
    drivers/i2c/busses/i2c-cbus-gpio.c
    cbus_transfer()

But *two* execution contexts contesting over *the same* GPIO?
I've never heard of that one. But I'm not sure that is what you mean
to address? Sounds like a theoretical problem to me.

> One of the ideas I have is using the fact that we already use atomic
> bitops in most places. Let's not take locks but add a new flag:
> FLAG_SETTING_DIRECTION. Now when we go into
> gpiod_direction_output/input(), we test and set it. A subsequent call
> will fail with EBUSY or EAGAIN as long as it's set. It will have no
> effect on set/get() - any synchronization will be left to the driver.
> When we're done, we clear it after setting the relevant direction
> flag.

Given that I think the situation is entirely theoretical I'm certainly
happy with that solution.

Whoever want to do this crazy thing can very well teach their code
to recover from errors as well...

> Does this make any sense? There's still the label pointer and debounce
> period stored in the descriptor but these are not accessed in atomic
> context AFAICT.

Sounds fair to me, if it's even a problem. But I trust you, so if you
think this is needed, I'm game!

Yours,
Linus Walleij

