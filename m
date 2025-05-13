Return-Path: <linux-gpio+bounces-20109-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F8AB5F3D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 00:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6632D19E6194
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 22:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6A71D7E41;
	Tue, 13 May 2025 22:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D5Fqm9SN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1AA1F0E20
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 22:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174737; cv=none; b=dMrtgX5PySMQkSmQDszDKHGetqLJGRqlqeG8B3bPecR4fZKnCp2LI5+1/8Lrfz8Dun5rURN9LuHPo5yfA9URGX0b9Yzy4eWutgQT9j9lIwH3jw/uVvw5XV+qOe7D5VGPmkMR8csl12+G6YZWesK4+0tMep8Ui5vfCOHppI05JPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174737; c=relaxed/simple;
	bh=bZhd6eIsWJGTn+eW+3Nma1zngRRAOJBVJssD7pBAgLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDTcs2v0AkF6Iq4VT7MiDXHf5eZY8B3HsfGYeG0e0tMTlkRl3rGQN4W2KwASLyuagq6BSwQWxgeaM0zltt8dEJHSR0wPvPFNh0CAtL9Dk5hRyq77tXKYAS6MByzCqbkwzgjXC+qeFDmX3s8sy1ZMwLXiVNwDaiS7seYLLbZ1bnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D5Fqm9SN; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54298ec925bso8972979e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 15:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747174733; x=1747779533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dN4P+ZmIbDZPQ8igWPA14/sZhWS4aBJywZdR2bP8Ghg=;
        b=D5Fqm9SNxpl2pm6CQCTmOQJlZUPglom+MYiwyjlsmq8osa626AVSXeK6VrTkt70elI
         JBhes60Tjdph4nEhsDPQ+CAnxhx4zEOG2tFbN2QlPBiHX+DItYg5S8oxwumsvyH5qSXE
         Z+Lt1KJgPAabWKa6M+FAg3McuKyyIcrgmg4viHrEQCj8lNj0XS10RCsxjyaYU5HPcduL
         QTnPSfuXjg77FDToPmiWVxFvIiSa1FhKDjIptoLxTy9aziKacvoJLykemVlNO/DavGkh
         dbu8/oiBCtu0KlQrEJ70V5ge3qRUW6cFZjB09cDL9WzuxXuQvMNg8zhhppGtucnpP20D
         e5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747174733; x=1747779533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN4P+ZmIbDZPQ8igWPA14/sZhWS4aBJywZdR2bP8Ghg=;
        b=NZuEU9D/7dqmCQW7JeGasDwApXZ4MLI8E5LPL41HhNTsIh40+XXmnR71QGHJTeCv6L
         gNqKFilZkLV+IZUfP7OokQy2hY1CD9WYdIArPNHVY/HKygEqXm0J2w6gxG540bBgGbzL
         afQCIWEs4gsmciSPp4PS0B2l+X8VHm5N2KeiVkMuaDNaqGAtJJak98QJ6vtOOT3bHRdu
         hJXYF6iF5T5vXFYo/TAig0KOxOhMBG0KOs3IsrDOzMd9VIVcNo8CbWkDhJOogyBJME6U
         5omyvL+xKfaBMkyJJVRY8KZabud2WFu4FxSrQS164N5EArZEhAgIOdhIJWpKAhgAZ5BA
         mO+w==
X-Forwarded-Encrypted: i=1; AJvYcCWip2Cld07cGJedhD+KYxCR2jz30LR/0CEg+wNe62jaOlzSIil2wJOieHBdRoDO4TAvk0yK6UmyMEU6@vger.kernel.org
X-Gm-Message-State: AOJu0YztJheMrf5yz45wqKyxogehmhDCVaY9aJqwhM+HnhFVfaTlWL/u
	P92AnHiUPZre1fFDyfiZyXt7HtTFVdeQPU2UMl10pZYF8I4iprnRCdhN4hfAjYDVTWPJ1lgZLzY
	W42U886eQ1lDcu4+9UqUhvP4tVgVqs6VpKtDPHA==
X-Gm-Gg: ASbGncudOSnTfRQFZzedJm4BYO7zV700mhgLF4hEcn0n7YTqd5TG0X30fIX1uYkg5Pd
	k/8fA9FJRUJIktdopnI1AN+e6XXxRi4bv9IraGWT6M4D5dgjrQdbXwcVBBXrAO03oC4wAhfui7e
	ej7O32BZ9MfUoLK4yLrvAlY9kuIz+q9lH2
X-Google-Smtp-Source: AGHT+IE3TaSTQ0y218sJ+MttBfYGqIbZTqfhTRRCbOoNaxFSRd2+WixJNWrBoYYMksflMGRwz0a2vprztgfYC8UG+D8=
X-Received: by 2002:a05:6512:4484:b0:550:d4f3:8491 with SMTP id
 2adb3069b0e04-550d5fdbcb6mr436263e87.41.1747174732660; Tue, 13 May 2025
 15:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-pinctrl-msm-fix-v2-0-249999af0fc1@oss.qualcomm.com> <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
In-Reply-To: <20250513-pinctrl-msm-fix-v2-1-249999af0fc1@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 May 2025 00:18:41 +0200
X-Gm-Features: AX0GCFuutKXjW8lF9hct4WnyYCwisgn9vG1wjD46G9ryQuu-y_Y00Zf7UCkilig
Message-ID: <CACRpkdaErq4uwjjqug3BbiHMKbP=4PkzpXPuQ57+2mgjJQ7ACQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpiolib: don't crash on enabling GPIO HOG pins
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Josh Cartwright <joshc@codeaurora.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Doug Anderson <dianders@chromium.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 8:39=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Qualcomm platforms if the board uses GPIO hogs msm_pinmux_request()
> calls gpiochip_line_is_valid(). After commit 8015443e24e7 ("gpio: Hide
> valid_mask from direct assignments") gpiochip_line_is_valid() uses
> gc->gpiodev, which is NULL when GPIO hog pins are being processed.
> Thus after this commit using GPIO hogs causes the following crash. In
> order to fix this, verify that gc->gpiodev is not NULL.
>
> Note: it is not possible to reorder calls (e.g. by calling
> msm_gpio_init() before pinctrl registration or by splitting
> pinctrl_register() into _and_init() and pinctrl_enable() and calling the
> latter function after msm_gpio_init()) because GPIO chip registration
> would fail with EPROBE_DEFER if pinctrl is not enabled at the time of
> registration.
>
> pc : gpiochip_line_is_valid+0x4/0x28
> lr : msm_pinmux_request+0x24/0x40
> sp : ffff8000808eb870
> x29: ffff8000808eb870 x28: 0000000000000000 x27: 0000000000000000
> x26: 0000000000000000 x25: ffff726240f9d040 x24: 0000000000000000
> x23: ffff7262438c0510 x22: 0000000000000080 x21: ffff726243ea7000
> x20: ffffab13f2c4e698 x19: 0000000000000080 x18: 00000000ffffffff
> x17: ffff726242ba6000 x16: 0000000000000100 x15: 0000000000000028
> x14: 0000000000000000 x13: 0000000000002948 x12: 0000000000000003
> x11: 0000000000000078 x10: 0000000000002948 x9 : ffffab13f50eb5e8
> x8 : 0000000003ecb21b x7 : 000000000000002d x6 : 0000000000000b68
> x5 : 0000007fffffffff x4 : ffffab13f52f84a8 x3 : ffff8000808eb804
> x2 : ffffab13f1de8190 x1 : 0000000000000080 x0 : 0000000000000000
> Call trace:
>  gpiochip_line_is_valid+0x4/0x28 (P)
>  pin_request+0x208/0x2c0
>  pinmux_enable_setting+0xa0/0x2e0
>  pinctrl_commit_state+0x150/0x26c
>  pinctrl_enable+0x6c/0x2a4
>  pinctrl_register+0x3c/0xb0
>  devm_pinctrl_register+0x58/0xa0
>  msm_pinctrl_probe+0x2a8/0x584
>  sdm845_pinctrl_probe+0x20/0x88
>  platform_probe+0x68/0xc0
>  really_probe+0xbc/0x298
>  __driver_probe_device+0x78/0x12c
>  driver_probe_device+0x3c/0x160
>  __device_attach_driver+0xb8/0x138
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0x9c/0x188
>  device_initial_probe+0x14/0x20
>  bus_probe_device+0xac/0xb0
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x208/0x5e8
>  worker_thread+0x1b4/0x35c
>  kthread+0x144/0x220
>  ret_from_fork+0x10/0x20
> Code: b5fffba0 17fffff2 9432ec27 f9400400 (f9428800)
>
> Fixes: 8015443e24e7 ("gpio: Hide valid_mask from direct assignments")
> Reported-by: Doug Anderson <dianders@chromium.org>
> Closes: https://lore.kernel.org/r/CAD=3DFV=3DVg8_ZOLgLoC4WhFPzhVsxXFC19Nr=
F38W6cW_W_3nFjbw@mail.gmail.com
> Tested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

(...)
> +       /*
> +        * hog pins are requested before registering GPIO chip
> +        */
> +       if (!gc->gpiodev)
> +               return true;

LGTM, Bartosz if it's fine with you as well can you ACK this and I'll
stick the patches in fixes and get it to Torvalds pronto.

Yours,
Linus Walleij

