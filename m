Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4706C447B63
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 08:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236646AbhKHHyo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Nov 2021 02:54:44 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:36555 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234532AbhKHHyo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Nov 2021 02:54:44 -0500
Received: by mail-ua1-f43.google.com with SMTP id e10so29773371uab.3;
        Sun, 07 Nov 2021 23:52:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xKY+F1Oxez66TS15siDD/nDvyuOA050VB5MhJkhC4js=;
        b=dS4E3Q/o2uDX2Y20IG2eiVT+nM4T5emZXzNaFAbZXVmxJp6olBgUXjpknAAUnqCswc
         s5um4aIGj4wvaCZ22PmKhsVayZl/Fuma2e7HgnbXku/mSbFN2lj7NrUe649GDwL7eG48
         9EA06Iu+AFIaR7l916gKtSkDZHAShmB8T+wfOqxoyfwOLq/CzFLJzJqjJ4iGzHb+WSZw
         EP4ItqAzlJ6cs5IXGgRJCWpYxY6Kwnn/ErCHv+DM7xn+ety+xr1Q6El4xmLIwEVqdUHK
         ROqH7l0D48x4Hyhcc5je1b0KznTRH8OR9quQs0OAxqcgRp2drjCQLI308pwlcfhpUoms
         gmSQ==
X-Gm-Message-State: AOAM533Yz2UNjF7LM9fNMUv79PHalRFGLc6se0FeEsBAqRJKMdX1RBLO
        Gicm066+9SsYc8/T7eUmbYw+wY+WBinHFg==
X-Google-Smtp-Source: ABdhPJy8Sgy5mQ0bQ8+gCYfiHg+QxjFLV/yedV5iZInDh2rqcNrK93e2xaaev7lEvbk5Hs3unKnchA==
X-Received: by 2002:a67:ca92:: with SMTP id a18mr10177211vsl.11.1636357919693;
        Sun, 07 Nov 2021 23:51:59 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id t12sm2452517vkk.52.2021.11.07.23.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Nov 2021 23:51:58 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id q13so29786374uaq.2;
        Sun, 07 Nov 2021 23:51:57 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr38079054vsj.50.1636357917661;
 Sun, 07 Nov 2021 23:51:57 -0800 (PST)
MIME-Version: 1.0
References: <20211105130338.241100-1-arnd@kernel.org>
In-Reply-To: <20211105130338.241100-1-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 08:51:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+jb+aZHPcJ1XeEawjEwwT+VJ=YVtQnVcr=kJtnG_shw@mail.gmail.com>
Message-ID: <CAMuHMdX+jb+aZHPcJ1XeEawjEwwT+VJ=YVtQnVcr=kJtnG_shw@mail.gmail.com>
Subject: Re: [RFC 1/3] gpiolib: remove irq_to_gpio() definition
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
        Fu Wei <tekkamanninja@gmail.com>, Alex Shi <alexs@kernel.org>,
        Hu Haowen <src.res@email.cn>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Jonathan Corbet <corbet@lwn.net>,
        Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 5, 2021 at 2:03 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All implementations other than coldfire have returned an error since
> the avr32 and blackfin architectures got removed, and the last user in
> driver code was removed in 2016, so just remove this old interface.
>
> The only reference is now in the Chinese documentation, which should be
> changed to remove this reference as well.
>
> Cc: Fu Wei <tekkamanninja@gmail.com>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Hu Haowen <src.res@email.cn>
> Cc: linux-doc-tw-discuss@lists.sourceforge.net
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
