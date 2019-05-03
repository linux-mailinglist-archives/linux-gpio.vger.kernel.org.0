Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99E2F128EA
	for <lists+linux-gpio@lfdr.de>; Fri,  3 May 2019 09:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfECHdn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 May 2019 03:33:43 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:44135 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbfECHdn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 May 2019 03:33:43 -0400
Received: by mail-vs1-f67.google.com with SMTP id j184so2977914vsd.11;
        Fri, 03 May 2019 00:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6b343zl0l8Gt82VnrQ/dCnB/czSLB6HNfFyHiu9lZBE=;
        b=Xe9LSScunkSrreESf30R7ZEMrN0UDPy86IvTbQpCDpluhokHbqWBiTT9ajaxX3cr33
         CeRaixFS3aZOoqGyW0GgmU/8KPgIyk/sRB5+GkclY90kV7gVStI84XCoS+pOuepSEO0C
         OgSM6k56NK2FJbWOBYmaC8fYBYNvufMIOgCRbiYwNOBCnMKS5etL8A9BhoQdsFVsPTE9
         14OBCNONfAB8tAgLunRXZjiqEKbBeBNybWbWrRpLOI6BmC402bJC2lOPctFkKTSAyqTe
         7AT1S5n0un9cQonhrPLWb4NxzzBtPzXLmlzx1UumKczYk7Dz+3+rCAZ8bjrVJwv3kBU3
         EAMA==
X-Gm-Message-State: APjAAAU+NqIosfira3AuMs8MKB6L/M2/BZEDoIvDKnk3CNiwqmI3kF/w
        N36KL3R7dCTdK8K9Yr5U2JTjsRARU3Xk3/P4Isllyg==
X-Google-Smtp-Source: APXvYqy8orVTN3jbHeCO5UXyzZKZR23vJuLwtZxt+eqUEkC+f+kw7pWcRU8nb2JrIYr3lnylp8prmriyHuT2qPiXRA0=
X-Received: by 2002:a67:83cf:: with SMTP id f198mr4634452vsd.63.1556868822213;
 Fri, 03 May 2019 00:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190425095542.726-1-geert+renesas@glider.be> <CACRpkdYkv=oMWvmcxFXkcjVEnZkL=n-KadMonX+6x=EQ2iUONA@mail.gmail.com>
In-Reply-To: <CACRpkdYkv=oMWvmcxFXkcjVEnZkL=n-KadMonX+6x=EQ2iUONA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 3 May 2019 09:33:30 +0200
Message-ID: <CAMuHMdVE0+D4JB-Fn3O7Ph07gKJ15nno=m5g8iW4NbKR0o1oYw@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: sh-pfc: Run-time debug code fixes and enhancements
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, May 3, 2019 at 9:26 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Apr 25, 2019 at 10:55 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > This patch series contains several fixes and enhancements for the
> > debug code to validate pinctrl tables at run-time.
> >
> > I intend to queue this in sh-pfc-for-v5.3.
>
> I don't mind to take this in for v5.2, but it's your pick.
> If you send me a pull request pronto I will pull it in.

Thanks, but none of this is critical or urgent, and v5.2 is imminent
(unless you know more ;-).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
