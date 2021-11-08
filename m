Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB89B447B8D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 09:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235895AbhKHIKZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 03:10:25 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:35367 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbhKHIKZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 03:10:25 -0500
Received: by mail-ua1-f51.google.com with SMTP id q13so29850468uaq.2;
        Mon, 08 Nov 2021 00:07:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=12zMeNHe/fGVoF0uYNVZnD8aQuXksUYIErzX9Jbj4So=;
        b=idXksRv566w+mwa1vehZ0+J3QqyCIAGj+EAwWYdT+z7338N+Jrd4/4BzNrLbMF8Bky
         KIEL1LyEkYTl8fI1BJr3sg5CxxPFh1lF5SQfD/a8c7EoH4XDJtCtN2MpaTN4lh1Z9seE
         8GkwyxskZ/wznuqtu89lyAK9Xfd27zwNmPBwwZULjRVMVVL76tyzrBmO3+aAPgtehWZg
         YP0r/tJsY3szz0AYk9dolqrF090PBDdUukr6Br6oMFnyLyiMJQ2blOhWS6mKYczY4qQ6
         tgY3GwDZ76IG4AX19YI/ZnnPwbeX3MXIMIHm1Uq8Kg+cjXHaX7AY7ilvG4Cdc16O/nqa
         N9oQ==
X-Gm-Message-State: AOAM5306PnO7hEKI3wKp83mbfvDSD0PG9MQv0ZOwr3KBkzwgFtL4Cgcs
        llaQr5Ll3kba8iwLu/iATmXpfHjKEhd+7w==
X-Google-Smtp-Source: ABdhPJxVO6QQp7WxzyNzyFCmRrDQOu4w/qOvdDysdgzHsP1xLArRvslPSj+YANt6U48FrVnaZ2X8Yw==
X-Received: by 2002:a67:fb05:: with SMTP id d5mr26638050vsr.41.1636358860720;
        Mon, 08 Nov 2021 00:07:40 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id i4sm548513vka.48.2021.11.08.00.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 00:07:40 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id s13so14270312uaj.11;
        Mon, 08 Nov 2021 00:07:40 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr35705130vsb.9.1636358859788;
 Mon, 08 Nov 2021 00:07:39 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org> <20211105130338.241100-2-arnd@kernel.org>
In-Reply-To: <20211105130338.241100-2-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 09:07:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdViJiXaRWQraS+A4Shs-WD8iUoCajO78DeO7+He2L251w@mail.gmail.com>
Message-ID: <CAMuHMdViJiXaRWQraS+A4Shs-WD8iUoCajO78DeO7+He2L251w@mail.gmail.com>
Subject: Re: [RFC 2/3] gpiolib: remove empty asm/gpio.h files
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Arnd,

On Fri, Nov 5, 2021 at 2:04 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The arm and sh versions of this file are identical to the generic
> versions and can just be removed.
>
> The drivers that actually use the sh3 specific version also include
> cpu/gpio.h directly. This leaves coldfire as the only gpio driver

All but arch/sh/boards/board-magicpanelr2.c do. So that one needs
a direct inclusion of <cpu/gpio.h>.

> that needs something custom for gpiolib.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
