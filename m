Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCC3155564
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2020 11:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgBGKNz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Feb 2020 05:13:55 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43648 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgBGKNz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Feb 2020 05:13:55 -0500
Received: by mail-qt1-f194.google.com with SMTP id d18so1451081qtj.10
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2020 02:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H9SKBYokfxZTP3g9obhTcbO9MA+FFoZS1UYYAqEQaww=;
        b=0ICpTW9G/NSV3NKUsKGyu7DXkMKslK+UudvpUnyfUsDoP6Qr60E+Ei4SFZ8Zwcaq+u
         HbZpMdYBweozpC7ZVEroiCJv1dn+G905IkHFpm6JTA3xq6t1z+7VFTpJLw8vro3zx0KN
         s9p9SCr2otrau0eGUfMc5NI1vKQ/7CAYeQlkqgAkQpTWYHFZSpSmOA/G/1KjZxOcerNA
         v2XF0FSKJW4tkhlbzcy/E6r7uVU386j50AzsMBxfATdbIMhVaDQXgbdREABqfDcucFTb
         GyfcMCPk6AvCJQebKmHuQu9Nf1HV5ej7L9nyT6Pauhm5N3a99PdSJG8fK8stBKU313GP
         e9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H9SKBYokfxZTP3g9obhTcbO9MA+FFoZS1UYYAqEQaww=;
        b=UHNHeyfY5hBtU5oqaAKNF3FnWc+jT4O8YNB6Gx1VFm5IIS/6q1v+AluVk/bnE+LU2Q
         HPbwBvJVoZPwx2hDUVPAiAH2FRUfGI8cNAKIZwJYuXnTlILQ0nvwury5nVoWJuLg+llC
         4GC8d1UwtUXamsRJnfQrnHCefH9kYItErjEV9LImJDuZGet9osRapidQyVXm9uLJD5x7
         yA1S6WOJhNE8VvX5LMwViiI8MsU2Oi/GH8Xfu5MnZhh3HMjeMoNZdK0rivTFFC5zTc/R
         zjlTZDHX97QzXKtfqvf1avhMn1N4T2H9cAqkspOMTykgur0E0MJ6QVlcX1LByR+pDJs7
         5G/w==
X-Gm-Message-State: APjAAAUaNttMLRGlpMs53sOtTYwTutOUd+WxqXE0Ahhd8itPauMSAEzl
        eIGwCgnP+4EdPheFXqF3CDQnJ/PQrb01GC2hJkmr8zdZ
X-Google-Smtp-Source: APXvYqxh94Xe6Qa0p2cxelXgnJZynJIned9rcOuF6AphZIpd3SGEgn/9DSArJoOAZ9/58UVazmkBD6TEJjQHTtHS2Hg=
X-Received: by 2002:ac8:3676:: with SMTP id n51mr6557832qtb.208.1581070434576;
 Fri, 07 Feb 2020 02:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20200206181358.12805-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200206181358.12805-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 7 Feb 2020 11:13:43 +0100
Message-ID: <CAMpxmJWWxuc6epswobHsHj9=FsP7D5gjtUAkEbEXHCsMjNfi8g@mail.gmail.com>
Subject: Re: [PATCH v1] core: Relax gpiod_chip_open() for symbolic links
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 6 lut 2020 o 19:14 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> User may ask device helper tool, for example, udev, to create a specific
> symbolic link to a device node. GPIO chip character device node is not
> exceptional. However, libgpiod in the commit d9b1c1f14c6b
> ("core: harden gpiod_chip_open()") went way too far in the hardening devi=
ce
> node check.
>
> Relax that hardening for symbolic link to fix the regression.
>
> Reproducer:
>
>   % gpioinfo /dev/gpiochip5
>   gpiochip5 - 16 lines:
>       line   0:  "MUX33_DIR" "uart1-rx-oe" output active-high [used]
>       ...
>
>   % ln -sf /dev/gpiochip5 /dev/MyGPIO_5
>
>   % gpioinfo /dev/MyGPIO_5
>   gpioinfo: looking up chip /dev/MyGPIO_5: Inappropriate ioctl for device
>
> Link: https://stackoverflow.com/questions/60057494/gpio-issue-with-sym-li=
nk
> Fixes: d9b1c1f14c6b ("core: harden gpiod_chip_open()")
> Cc: Bartosz Golaszewski <bartekgola@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Andy,

thanks for this - it makes perfect sense. One nit though: could you
keep the includes ordered alphabetically? Also: it would be great if
you could add a test case for this to tests/tests-chip.c.

Bartosz
