Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 377D39A845
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 09:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388050AbfHWHKd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 03:10:33 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35154 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728332AbfHWHKc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 03:10:32 -0400
Received: by mail-ot1-f66.google.com with SMTP id g17so7902990otl.2;
        Fri, 23 Aug 2019 00:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hi8bbXcICEO2TpR7O70QBFyTd6RMwjMbhWJM+LT8Vvs=;
        b=MwJhr+G8piWUGwi7no80/ZysGrpFYx+nvcXcBK0y4tSSW9p+7aBy8gy8ycs+fK6WdQ
         SSvfTQNZk64FwEGNzyKXEOCBe+K+pwVeiJK1r2tA4I4PG0mzMBwPDjGYHWcvU/y77x1F
         ndhgx4xpy9FFndz7zUYpwHoethTw5nH6qMSlgLTe72hLi++Iziwkv8FLtLFyfh9G0lsb
         0LCuddcL3+HJvlphTbd2LqHmoZJtNgKRFGbj1ZIEKlDvgjz3pO3067dfEWqaL3EzbjRA
         5G5LshgcGHEIjykrmn18zgb7zCFqrhKWYrN+i21iLn3oOokC5X7EANLP9p0WsPwJuzyt
         E4Bg==
X-Gm-Message-State: APjAAAWshRLIJ9dkZErImipJtR2F+WCX90Qh7bN/1YnVUSJgjHATXOQs
        g75hfSfuqaxIbGU7M0zIMxFL7dV3lgTB0AuC5FIe8Q8I
X-Google-Smtp-Source: APXvYqy7c1bLUI9/qrRuVFIkGb9UpfzKw28D7K0z5R4pUgYbJwDHtZwlX1QCZ6WaVVAG93+1KoTDErCN1vuiZc0ouX4=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr2881542otk.145.1566544231794;
 Fri, 23 Aug 2019 00:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1565245143-15018-4-git-send-email-yoshihiro.shimoda.uh@renesas.com> <CAMuHMdW32TRw3Awf-5C2eJiZ1iys-vK7YihFwqPxOP66Eh9+Lg@mail.gmail.com>
In-Reply-To: <CAMuHMdW32TRw3Awf-5C2eJiZ1iys-vK7YihFwqPxOP66Eh9+Lg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Aug 2019 09:10:20 +0200
Message-ID: <CAMuHMdVhK9UPEH9VHC7kSeYPORdW3DFeLi2druoEzAjm5zA4+g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: sh-pfc: Rollback to mux if requires when
 the gpio is freed
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 8, 2019 at 10:29 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Aug 8, 2019 at 8:20 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > R-Car PWM controller requires the gpio to output zero duty,
> > this patch allows to roll it back from gpio to mux when the gpio
> > is freed.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

FTR: as the PWM work is put on hold, I have changed the commit
description to:

    pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed

    Some drivers require switching between function and gpio at run-time.
    Allow to roll back from gpio to mux when the gpio is freed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
