Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF4C8174722
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Feb 2020 14:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgB2NnV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Feb 2020 08:43:21 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:34512 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726996AbgB2NnU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Feb 2020 08:43:20 -0500
Received: by mail-io1-f68.google.com with SMTP id z190so6762556iof.1
        for <linux-gpio@vger.kernel.org>; Sat, 29 Feb 2020 05:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZkYYz+iEBVIVDEqw2HSEsdWZFMQZB77tAjcrNj7cono=;
        b=yEBCNkd7TJPUolzMHraLOsqEKzyKk6k2VfvLZhLJ8KOtcCks9KKwcLIF7jtCJvEgNe
         SfIuchTv6Akv0aO7WL/MmIz3m2ktu7zv7FbTScrI9QeIb8++K1jD3o6bxHNTvtAUdEzk
         wA9ZAJVVeBbT6cL3h0IuO6rdHP/raUGBzFK23EUNSIOtfdbJIdTbkha/+ktdspR0Zprm
         M+n6x/LMk7vsHzsHS/h3F6MTMs78BN4rrq5q2la/aycPRkjBqi8DN7sJeHZn9O8H/2F7
         Ik3cMc2EQ03Q4EKE/FxXqENqMLvMF+64f/qz1ETyn6VpfIIg6AZW4mErLr9svMbeK6hk
         RjmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZkYYz+iEBVIVDEqw2HSEsdWZFMQZB77tAjcrNj7cono=;
        b=RgOtqoZn3nkNDy9eXDJuWqPWi3QyXIop3E0+0g8gN6izfI7zqzGNVeBsrwDd5G3xxj
         LBgJW7webTLt8nFjWe0bWW3xhRWsfPwiWPBgeiTVaqUzHFgqmLZoN0ujNx4Z/NQdOLia
         OFnrHrBYu+6MDnKBPmq0z2c55sfZ/V5Ocfi1+3mR7sadvw0T7lJ+UXhKVj+wOMH6ETxu
         5fPu2V6KKvLyn/s9u5PgzMFi/blqlQ9i3+E5TcEoWyQVzvWUZNByIcdigDmedSQknRqa
         KtvYgsrqbW7/yesvHfZiUdtk3YMbZq7NXlb2CkHxVi/Ity7XSTQ0sUoOdpdvOrexhF4h
         qv+Q==
X-Gm-Message-State: APjAAAVVQPq+y/15LlXy0U6MsU53SObtqzyK6o/i4M2e+rNF26fxqLVw
        FEN4caNioygm474bhZXjN5KeCCO48VOwL7Ydp0S0gA==
X-Google-Smtp-Source: APXvYqx8B+uG/d/zKTMD48jcMo2J92qHC86/tYSeXqTePGHZdl43A91WpjzUyjWqUJ4bMNeYSsp64ZF8rvX3Azc+XMg=
X-Received: by 2002:a5d:8952:: with SMTP id b18mr7228069iot.40.1582983798962;
 Sat, 29 Feb 2020 05:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20200226135323.1840-1-brgl@bgdev.pl> <CACRpkdY4=bU-gMywttvnRbgu=CG0TtKx5DFiV-Gio5DBDV08-g@mail.gmail.com>
In-Reply-To: <CACRpkdY4=bU-gMywttvnRbgu=CG0TtKx5DFiV-Gio5DBDV08-g@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 29 Feb 2020 14:43:08 +0100
Message-ID: <CAMRc=McxeRWVaG3_+V4fodBf=vK8mLDna8dFdg=PjK5Bk0zJiw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: fix bitmap operations related to line event watching
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sob., 29 lut 2020 o 00:20 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):
>
> On Wed, Feb 26, 2020 at 2:53 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > When operating on the bits of watched_lines bitmap, we're using
> > desc_to_gpio() which returns the GPIO number from the global numberspac=
e.
> > This leads to all sorts of memory corruptions and invalid behavior. We
> > should switch to using gpio_chip_hwgpio() instead.
> >
> > Fixes: 51c1064e82e7 ("gpiolib: add new ioctl() for monitoring changes i=
n line info")
> > Reported-by: Kent Gibson <warthog618@gmail.com>
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This looks good but where should it be applied?
> It fails to apply to my devel branch where this lives.
>
> Yours,
> Linus Walleij

This depends on Kent's other patch. I'll send you a PR.

Bart
