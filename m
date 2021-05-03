Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39AB1371661
	for <lists+linux-gpio@lfdr.de>; Mon,  3 May 2021 16:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233923AbhECOEm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 May 2021 10:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233989AbhECOE3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 May 2021 10:04:29 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BC1C06138D
        for <linux-gpio@vger.kernel.org>; Mon,  3 May 2021 07:03:34 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 124so8227334lff.5
        for <linux-gpio@vger.kernel.org>; Mon, 03 May 2021 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xiwm3JcV02oNR9lHvZnffdlsD5wFpSBR++IXOiysPv8=;
        b=uT63KtOa/kgZ4tnhQt5Hr9qkRmPrD32jF1zSlgDXmodo9anJAK7UzlcotJV4Uzx0ew
         tgqqxbWhlxC5zi1AQr+pJPX9t9T0J/hEnXF6S8OjiE2mGZ4QqrtP5Xv+fdXysqbXidwY
         0VEkk5xm461MmsEaPvukZiPH87hhTleMnPajXQLVTBp3id65AyvrhwZyheTQE0CFK9kP
         bpnaPUyZcRhQqAdlfEHpuqmzvBV1Ng0CPwj8wcZBw+jhkpHtkY1ajzmHGb7s8lNllzOa
         t9wBnkZtyDunqPSiYBD0k/YNeks7+uLay+EUrei+5Q8ZH10d65SKlTywqg1n3GP0pBhG
         zkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xiwm3JcV02oNR9lHvZnffdlsD5wFpSBR++IXOiysPv8=;
        b=NGv4l0zRFNiFYiVdKhQ+clcYcTwgDQkeFdBf1W7u+rzVso6cd0xbFF5oKFSd9aa30t
         ziegNXbwdOS0QRxriEQ393sHXPFKisDynSSNTAWpt4YF+bqBu7tdZfhTwFTgb00Hr7pV
         JnlMacxUxkTI8AWFNAfA9OO/S7B300Gsc97AHKA8OodrG7dmBAGvPZPBkZNy/1ngejPW
         naOr2Za5LPBa2qzGRQNucKGuJFiJgZ5SDC1MVXIIQncnO0d7poWQr3a/l68m/6C9D1O6
         2F9IZFr8x/YkBUvvgGkUr0NIfGC1DWHaNoeNoZp/tU47vOUGWoJiEohk64VA+Cxqpx91
         BF1w==
X-Gm-Message-State: AOAM533sW7Z2MFX3hOanSMu8U81Rp4Um3wBh+6zHGF2dQgViHDsJjtRe
        8OqTBzrZKhQ9VitIihkqiiiiW9EGYiBKuvxWBrXF0w==
X-Google-Smtp-Source: ABdhPJxSQW7I3x8iH4I3+QuAAa5ApVILorvaymuJj7SEuC65bzWJ2o7hpukPDkbD5IrsX00cCJAGZJdDFQi2RW5HDcc=
X-Received: by 2002:a19:b0b:: with SMTP id 11mr13068039lfl.291.1620050613478;
 Mon, 03 May 2021 07:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VcV+a1hLyZZH95is187OOZg1oDO9pk=+1xcUJ3Tj9gmrQ@mail.gmail.com>
In-Reply-To: <CAHp75VcV+a1hLyZZH95is187OOZg1oDO9pk=+1xcUJ3Tj9gmrQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 May 2021 16:03:22 +0200
Message-ID: <CACRpkdaZ1-y8bvcTBmHcKqYcx3N+ULrW6t-+7SCnwgswWpYoYg@mail.gmail.com>
Subject: Re: gpio_chip::ngpio vs. gpio_dev::ngpio
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 3, 2021 at 3:20 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> Any shed of light what the difference is (between gpio_chip::ngpio and
> gpio_dev::ngpio)?

The one in gpio_dev::ngpio is used when referring to that struct
so it could be renamed ndesc to clarify the usecase.

The gpiochip ngpio i.e. gdev->chip->ngpio cannot be used, because
sometimes the gpio_chip goes away but not the gpio_dev.

A typical case when this happens is when a gpio_chip and
corresponding gpio_dev is created by plugging in a USB-based
gpio device such as FTDI. Then the user start some gpio-event-mon
or gpio-hammer on that gpio_dev, flickering a LED or something.

If the user unplugs the USB device, the gpio_chip will disappear
and get "numbed" so that no operations reach the hardware, but
the userspace program will not end or crash.

When the user finals terminates the program with e.g. ctrl+C
the character device is closed and gpio_dev goes away and
for that the ngpio field is needed.

Yours,
Linus Walleij
