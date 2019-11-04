Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69C8BEDBAB
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 10:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbfKDJ3f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 04:29:35 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:36828 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfKDJ3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 04:29:35 -0500
Received: by mail-io1-f65.google.com with SMTP id s3so13793401ioe.3
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 01:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7LA3aPxO7flmHbs1Fp65T1MxGgeqEVjRl7gRB0nIklg=;
        b=pIs+r8BGTrZcFZ6o2F9aOev8qXPFSl5BzVzuK8uXfPkmFJ5u78WHAgn7yWhZRgcRF2
         TQ/fmRIthC7HH1oKRPL+rsIY0xayE+DEbHqMYT/+zihcmnMjln1lQzQBPFD2FkN0gO/R
         4HhWzrpt1w/0TzsiJgb7btUET/PM7PlsdezH2ASb9obFcGp5X0gZk6uMEwODYssD9ndO
         EYQFYyql2atk36OPSGopZnAzTs9D12s8ZFpQDSQVqqmYAE3KT9QtIxIc7PjjNvtUIn0I
         tmEld6xM7W3U54vrFxxBUKCK7vOk3TguwljwVy7KB1EDh9+/aKgSTzCeUR8CWUSEYWZd
         InJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7LA3aPxO7flmHbs1Fp65T1MxGgeqEVjRl7gRB0nIklg=;
        b=qb2XeWKs12Vi7OFYdKE2xHqxyzMN+zyzp/k1EUEhyN5/lv/GxwRx+BqfuEnWWVZiNQ
         PFxgkVwDc2YpTd6iAfOJ713WMJW1r/399L9tqdNCbAJmnKIzW+nqYlBxlqlj/H/RAaA/
         qPVIm2+IVjtRyMiQK+qS2LMJTbItBhDaJp747Qvg1mtq5+GmM5gwMxblkp36PeqfH3iY
         WONzONwMeMv5AGKyXZeQMymWXo6alPk0PaXs2GPqnz3vos4dhA1+Gdi83fPHrei0gUIL
         73/hj5LzAhGvO3cQS5qSoZcoZ5NEb+QauX6SUNkZ6SeaN1qcDj7ZY8uNE5kGnKPZNUBm
         QnEA==
X-Gm-Message-State: APjAAAU5a35ejQoG3P90KeBLfovOXi5Yv8HOnevFV/KOiHkY1N+EqEVy
        XjCcNM8fI/wPOBXBzdM86QFX7/KXkAkMqtqmbJchrw==
X-Google-Smtp-Source: APXvYqyGh8w7aoaD8Ly+KkL+MHjewrNRjU9gjfaUC4B+HarLQYhFCDkzx2C/y4W4+ApkqrVUgvpjDgWLY+BUbVoDQq4=
X-Received: by 2002:a6b:c705:: with SMTP id x5mr199971iof.189.1572859774524;
 Mon, 04 Nov 2019 01:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20191022084318.22256-1-brgl@bgdev.pl>
In-Reply-To: <20191022084318.22256-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 4 Nov 2019 10:29:23 +0100
Message-ID: <CAMRc=MdqDv7FYCEKoK52G5zacNfLTDErrOGZAG5KDOsKh2pfUw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3 0/8] drivers: add new variants of devm_platform_ioremap_resource()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 22 pa=C5=BA 2019 o 10:43 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Note: resending with Arnd's review tags and rebased on top of char-misc-n=
ext
>
> The new devm_platform_ioremap_resource() helper has now been widely
> adopted and used in many drivers. Users of the write-combined ioremap()
> variants could benefit from the same code shrinkage. This series provides
> a write-combined version of devm_platform_ioremap_resource() and uses it =
in a
> relevant driver with the assumption that - just like was the case
> previously - a coccinelle script will be developed to ease the transition
> for others.
>
> There are also users of platform_get_resource_byname() who call
> devm_ioremap_resource() next, so provide another variant that they can us=
e
> together with two examples.
>
> v1 -> v2:
> - dropped everything related to nocache ioremap as this is going away
>
> v2 -> v3:
> - don't call platform_get_resource() as an argument of devm_ioremap_resou=
rce(),
>   it actually decreases readability
> - add devm_platform_ioremap_resource_byname() as another variant
>
> Bartosz Golaszewski (8):
>   Documentation: devres: add missing entry for
>     devm_platform_ioremap_resource()
>   lib: devres: prepare devm_ioremap_resource() for more variants
>   lib: devres: provide devm_ioremap_resource_wc()
>   drivers: platform: provide devm_platform_ioremap_resource_wc()
>   misc: sram: use devm_platform_ioremap_resource_wc()
>   drivers: provide devm_platform_ioremap_resource_byname()
>   gpio: mvebu: use devm_platform_ioremap_resource_byname()
>   gpio: tegra186: use devm_platform_ioremap_resource_byname()
>
>  .../driver-api/driver-model/devres.rst        |  4 ++
>  drivers/base/platform.c                       | 39 +++++++++++-
>  drivers/gpio/gpio-mvebu.c                     | 19 +++---
>  drivers/gpio/gpio-tegra186.c                  |  4 +-
>  drivers/misc/sram.c                           | 28 +++------
>  include/linux/device.h                        |  2 +
>  include/linux/platform_device.h               |  6 ++
>  lib/devres.c                                  | 62 +++++++++++++------
>  8 files changed, 108 insertions(+), 56 deletions(-)
>
> --
> 2.23.0
>

Hi Greg,

can you pick it up for char-misc for v5.5? This was reviewed by Arnd.

Best regards,
Bartosz Golaszewski
