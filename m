Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D88C719EA78
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2020 12:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgDEKoG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Apr 2020 06:44:06 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42288 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgDEKoF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Apr 2020 06:44:05 -0400
Received: by mail-pf1-f195.google.com with SMTP id 22so6063994pfa.9;
        Sun, 05 Apr 2020 03:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wqo5YREUxilhGZH5KNtR1EEFlKaeLBk2Jx3NMurpifE=;
        b=Ye9z1hO1q/z62yGaatDoxLKqIB8WqsUzxOEKT/Ba25Exfyd7HS1d06ZeN4dtiqoCUL
         nppVH9FJ4/LPm+TR1Bgj/ouXjdVNEB+Gt6g7ymJtIa0x592aw6AKzTT6Tmcpb/EfGVJu
         jiTT0XqE9QoRWru/6R25WHJYnT01S3ByqtlRfMvI/LpXQrTUy7A0SbNY8bZOgm01aTGe
         THHXb9Ii71zj556Mijna4R7G8SYDX3c8Q1D+LS38cZc5+XoF784yExlBock5/R6UeAoO
         TglL8WVGnSbd+uD99p1Sxo+bx11IGb3QUYUocsTzem9NW/4OQEDds48hkgFq8gctNyUl
         hM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wqo5YREUxilhGZH5KNtR1EEFlKaeLBk2Jx3NMurpifE=;
        b=FcEcwGAgV2MX7fvu/Y1ouJHbDsolKOLPJYWyBg5WQ8gGHS377iDv3evwQDzfk5asgX
         U86mskhVfuS6BzPPE3uTVWSnIPowEdf1DQGTrw7FJITfHGMKls+jyJLQyCAnYT8S3rvb
         brKENibJYZk3MIJfeQPZOxD8zaeaC8C4hfZ5SLd8HbitXap9m4AJulB4h+H5CzXX0pAY
         rntvENPfpmZun4Y+zaIFgN9nvitIVbAhSPGr29q8rfQ4HLn/c28Ocl5dOXjTGrdwEnwn
         e69GXNm9haUQxNZjiegTQoeZZ4WG+tiU6Y1ALWPkR54V1xObLY2tPA3hoFpMFtcE190W
         oOCQ==
X-Gm-Message-State: AGi0PuZLLHKZcQxaTjKIvpzRDeUPfxNi2E4Oo45S6Wz1vie6ealYCiEQ
        JpuF1+AG2nonPOfHtc0PVLDa6TVEivQiMk6Qows=
X-Google-Smtp-Source: APiQypI6eSEt/7OjXlQ7fneQEBVJlUoft1YyFL/U4/lAVdAbiWACIqZ9enxEfcw8nA6jlNHxqEU3WGluCTFo0hUHszk=
X-Received: by 2002:a63:1d4:: with SMTP id 203mr4662429pgb.74.1586083443002;
 Sun, 05 Apr 2020 03:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <bb60007c-585f-052d-2f86-5598ff7619cd@web.de>
In-Reply-To: <bb60007c-585f-052d-2f86-5598ff7619cd@web.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 5 Apr 2020 13:43:50 +0300
Message-ID: <CAHp75Ve8hf9TZ4YL43nVJnZ+jcs80VdOddL8wbAqh-Te=0r12Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: msic: Delete an error message in platform_msic_gpio_probe()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Apr 4, 2020 at 10:35 PM Markus Elfring <Markus.Elfring@web.de> wrot=
e:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 4 Apr 2020 21:30:12 +0200
>
> The function =E2=80=9Cplatform_get_irq=E2=80=9D can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
>
> This issue was detected by using the Coccinelle software.

No need to touch this ancient driver, since it's subject to remove in
one of the (nearest) future releases.

--=20
With Best Regards,
Andy Shevchenko
