Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8241321C8
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 09:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgAGI7f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 03:59:35 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32895 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727642AbgAGI7f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 03:59:35 -0500
Received: by mail-lj1-f194.google.com with SMTP id y6so45853030lji.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 00:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qcYz+S37e6lohC/PrwT9exdPec8JcjwTa/J8RhkOk3Y=;
        b=Co0IXaiH/+kIDbiPhYQnpNffs6+jp1pyoZ09ElFeN6AOYIbJXEvar943+qbxVK8eVO
         Ac10A0XtFpcY4904o9UkXWZB/k+R86TnE4uP+o5HbMfmc50EmTA2/8tZqnPU1lY/VRSj
         +Nq15vL0MeA0WA49I12NeF0uyPfHUDNEhIrdQZ9lmHT+D7Sy1Vo0QQOSovHCVTLEE39m
         bdqTdDzIdSDP4slKvcGQOaxOZP4WKGC+TVyMuChd+blxaubwKrE/mX4s5+EF9SY8Oekd
         0KJ/KSnHv8WYVZWsRhuUr84Amq/wNlLqgaS2VGI13QneOizWgYF/PRXyI3z+9jo+/ZqH
         wQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qcYz+S37e6lohC/PrwT9exdPec8JcjwTa/J8RhkOk3Y=;
        b=kwu/dc4XDiO7euWfn23jLPkqsXDfg0pIcwvFJt5bj1/kWeNaMRwACv2bnUyq9/6o3V
         xHruiN2QvYU31MtyGvddTfso18foZSIuqLwMTSUPKSjlr3h/oftBa5VLD5E73axTZ2Jp
         2pmJhEOKCQyChi0oF3Tevagd03ITSK6V19FeNuKJ7QtWP3/q4JrKTlNPdWzKSS/b1fBb
         WNJFPefx1KcQB8ocODEni/pa0nMP4LQcDdAJOYObmA90WJIDZmCa5WBln4+s3zseC5zg
         JWTZgNEzYu0kms4O5bUUyn3M9Snd/U6BBN9jaqejer89M2WUfgXcwOxxla2HezDbb4qr
         7LWQ==
X-Gm-Message-State: APjAAAUGldDOVam5gfdGYOFxi02OgR0T3dClzk9I3YimsaZBZgA9KVeo
        0+25GhCn/aPfGM+Y0TWbUX5akpY6UfjQivgem2hkRA==
X-Google-Smtp-Source: APXvYqwzgm1tDEg4oG7KWcWr6Vc7Evz3UAMAEgRq5uMClmvIjLnB28dsi3QY+dtK8eFMarZQ24w9mM6MQt8rCUS7ErY=
X-Received: by 2002:a2e:844e:: with SMTP id u14mr63300233ljh.183.1578387573393;
 Tue, 07 Jan 2020 00:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20191219131459.18640-1-baijiaju1990@gmail.com>
In-Reply-To: <20191219131459.18640-1-baijiaju1990@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 09:59:22 +0100
Message-ID: <CACRpkdZEpMDbrHxkaNLiqqaeVKTW3y6k6EpZA8z6nf-9sRF3qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2 v2] gpio: gpio-grgpio: fix possible
 sleep-in-atomic-context bugs in grgpio_remove()
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 19, 2019 at 2:15 PM Jia-Ju Bai <baijiaju1990@gmail.com> wrote:

> drivers/gpio/gpiolib-sysfs.c, 796:
>         mutex_lock in gpiochip_sysfs_unregister
> drivers/gpio/gpiolib.c, 1455:
>         gpiochip_sysfs_unregister in gpiochip_remove
> drivers/gpio/gpio-grgpio.c, 460:
>         gpiochip_remove in grgpio_remove
> drivers/gpio/gpio-grgpio.c, 449:
>         _raw_spin_lock_irqsave in grgpio_remove
>
> kernel/irq/irqdomain.c, 243:
>         mutex_lock in irq_domain_remove
> drivers/gpio/gpio-grgpio.c, 463:
>         irq_domain_remove in grgpio_remove
> drivers/gpio/gpio-grgpio.c, 449:
>         _raw_spin_lock_irqsave in grgpio_remove
>
> mutex_lock() can sleep at runtime.
>
> To fix these bugs, the lock is dropped in grgpio_remove(), because there
> is no need for locking in remove() callbacks.
>
> These bugs are found by a static analysis tool STCheck written by
> myself.
>
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
> ---
> v2:
> * Drop the lock instead of moving the calls to lock functions.
>   Thank Bartosz for good advice.

Looks good to me, patch applied!

Yours,
Linus Walleij
