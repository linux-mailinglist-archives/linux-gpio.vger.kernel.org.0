Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 794F6167DC9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2020 13:55:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbgBUMzw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Feb 2020 07:55:52 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46541 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbgBUMzw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 07:55:52 -0500
Received: by mail-ot1-f65.google.com with SMTP id g64so1841527otb.13;
        Fri, 21 Feb 2020 04:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S7vilRtrihuisNtRsQ4a7ODw6MfRdZM9isYLCW4ahkg=;
        b=jpk5WexhzGzeB3i0BctKtWOIQhmewSUVIzLFReylaHVGFqS4OtB28g++guKDVUommZ
         znYFwK+9XGkQQzAP8hposXjIhfI07yk2Ck/IdC7ggfIfalmKvvF3Bp0wXpGMepNq2K94
         BCrYo49YVGizqcMsPWREBqJTsmmk6gPX1TjLFtHdEVvHTCuotjpPACwl1u52qQHULBOK
         vSLxUYFB+BF3AlsgVmCxHBaz3bJf9PWgGSqQefzBpfiuuf2jT7X//0Q10gyC/7anCsK3
         5jpdeb6rcAMmWPUSot7OLKb3p4/uPJ8pBnPcidFkwUOuDL8yHY5B5Ann55txauDaYME/
         E9tg==
X-Gm-Message-State: APjAAAU9SlA2kNL2pG06wJmaQqhk6XFFXOqfSP+IBddmINHYhlIvhB7J
        XvUaeXORkUP5ASAkSj+0Ph0m21gpBLduaX9q9fQ=
X-Google-Smtp-Source: APXvYqyBWu2IC51PdW59uH5U9xNUBA+MHpgOB+X9+qDgCC9W1WgikJz2q7nr1iMSEIPzJr6nqwLeBQ5tIUmVicm37kY=
X-Received: by 2002:a9d:7602:: with SMTP id k2mr28329366otl.39.1582289750788;
 Fri, 21 Feb 2020 04:55:50 -0800 (PST)
MIME-Version: 1.0
References: <20200218112557.5924-1-geert+renesas@glider.be> <CAMuHMdUDZ8ErGRYwCOiarKfvTKV4=p72j3FYAQ05Ab_Pt0CQiA@mail.gmail.com>
In-Reply-To: <CAMuHMdUDZ8ErGRYwCOiarKfvTKV4=p72j3FYAQ05Ab_Pt0CQiA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 13:55:39 +0100
Message-ID: <CAMuHMdV=j3V=tNdiiFb1VJ0xCgZ032R1iQsJ+SzaZg+3xpqO7A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Remove use of ARCH_R8A7796
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 1:55 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Feb 18, 2020 at 12:26 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > CONFIG_ARCH_R8A7795 was split in CONFIG_ARCH_R8A77950 and
> > CONFIG_ARCH_R8A77951 in commit b925adfceb529389 ("soc: renesas: Add
> > ARCH_R8A7795[01] for existing R-Car H3"), so its users can be removed.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ARCH_R8A7795 in the one-line summary, of course (thank you patchwork-bot ;-)

My silly mistake also confuses get-lore-mbox (v0.2.7) :-(

"get-lore-mbox.py 20200218112557.5924-1-geert+renesas@glider.be"
downloads this thread, plus the email with the old patch with the same
one-line summary.

"get-lore-mbox.py -a 20200218112557.5924-1-geert+renesas@glider.be"
selects the old patch instead of the new one, despite the exact Message-ID
match.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
