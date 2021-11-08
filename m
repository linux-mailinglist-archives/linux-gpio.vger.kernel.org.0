Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B849447BBE
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 09:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235467AbhKHI1V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 03:27:21 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:39585 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231292AbhKHI1V (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 03:27:21 -0500
Received: by mail-ua1-f51.google.com with SMTP id i6so29850951uae.6;
        Mon, 08 Nov 2021 00:24:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w9sUPN7cAUF5xiuU1BT+J3vFbVAyYdqsKrT0vTW8DYQ=;
        b=uZqLMOjQrLUJGbG3IMqPkSxems3Ik37chOGEpo1QwvJRYZIplxF4INVk83wrfibMPA
         AMkQuvyAyRGlrf8YdS8F59y+YhfSk9+iqpEgRN5SB6Sei/aNmsnIwZhmvT2grDpHeuF+
         1+bZ8Hjn+OSE8GFhT94QzY39ob1g2DhY/+G2a5Enm11U+5gBxspLYToDICuKo6Ydi/GS
         jJ3XxnDd+pM6AN6RQHbhH+gHR/besGXSNtxHK9g7dyLCo6PVcPPtpIEBt1xqxB/qocyV
         oT38+RwluhxGVWO47VoakFZof/Z9T88t57F2CSsVK+FLtA3d21ndQlk15teXCz6whE8J
         SalQ==
X-Gm-Message-State: AOAM5314NkmXRonQT02UYzV1G8A39NC/nzW/LTObYrKPCy6u+kZMN/M1
        8zj+4/69ASTd3NRYFcpUljAtT6vfQ5cXuw==
X-Google-Smtp-Source: ABdhPJwDks120mr2eiKe41A7Y1SWFITuBei9Pr+JkPC4GlOLr1ctMM3zZpRY2540A+Rp1Zbqywi3Ig==
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr35829503vsb.9.1636359876423;
        Mon, 08 Nov 2021 00:24:36 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id k185sm3010770vsc.21.2021.11.08.00.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:24:36 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id b3so29940201uam.1;
        Mon, 08 Nov 2021 00:24:35 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr38275693vsj.50.1636359875569;
 Mon, 08 Nov 2021 00:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org> <20211105130338.241100-3-arnd@kernel.org>
In-Reply-To: <20211105130338.241100-3-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 09:24:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX=e5HB8gh25DMbrbUHagS9eOQokbjneJTY6HrSSf4Njw@mail.gmail.com>
Message-ID: <CAMuHMdX=e5HB8gh25DMbrbUHagS9eOQokbjneJTY6HrSSf4Njw@mail.gmail.com>
Subject: Re: [RFC 3/3] gpiolib: coldfire: remove custom asm/gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Arnd,

On Fri, Nov 5, 2021 at 2:05 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that coldfire is the only user of a custom asm/gpio.h, it seems
> better to remove this as well, and have the same interface everywhere.
>
> For the gpio_get_value()/gpio_set_value()/gpio_to_irq(), gpio_cansleep()
> functions, the custom version is only a micro-optimization to inline the
> function for constant GPIO numbers. However, in the coldfire defconfigs,
> I was unable to find a single instance where this micro-optimization
> was even used, so to my best knowledge removing this has no downsides.

The only user seems to be QSPI chip select handling (not bit-banged
data transfer) in arch/m68k/coldfire/device.c, but that indeed depends
on CONFIG_SPI_COLDFIRE_QSPI, which is not set in any of the defconfigs.
That doesn't mean there were/are no real users, though ;-)

> The custom gpio_request_one() function is even less useful, as it is
> guarded by an #ifdef that is never true.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
