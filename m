Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5FF42EAC8
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Oct 2021 09:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232353AbhJOH7k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Oct 2021 03:59:40 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:35547 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234653AbhJOH7j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Oct 2021 03:59:39 -0400
Received: by mail-ua1-f44.google.com with SMTP id q13so16358299uaq.2;
        Fri, 15 Oct 2021 00:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i5vb3wGtSZYL9XNwuV89eijT6RI8LwaEwuKKZHudGy8=;
        b=rUEYa3kAInm5Fe/ugCAUHVDL4OkWnyzcTSVcLAJwCP/Kr0eNIf/OwItx4Qf6w9hhrF
         8+e70Sf2ssioQQBkEvAIbwgRdqzcT/qcV7BH07pQ4M4xJ497fwv8pkpMRn7Ir9hd62tI
         jcNwQA4nSih4Oa9aioKF8V8Re52FVDvETq0JzyGp3NP8H2lK0BTrOg/TqeK7fbBwcP6/
         IdPHZvTZSiYYoX1aZpH6CYh0km/A1gGo7WKVCuC6adOa/nFW4Nx8Mis4LQQ4lYa8fGO3
         LR22mxnylHonSKmAvxzV4XOehutiiaDtZBH/BBFkV+zrCvfTkUmk/vDumL+qYuOLGiMA
         bhug==
X-Gm-Message-State: AOAM53056IX4Q8D0fjim8DQN1ParTv1f1coUnpFi9xhxCbMg+tZpaQRG
        ub+ZQtHiSXJD5BCgnNX6M/TAz6k2BUIyhQ==
X-Google-Smtp-Source: ABdhPJwObPnMXTrqwUd4xyP7nMBPhZ7iLEzWjT2LCX0iV6nfw73cEAeDZr+bAOpgim3AQ8qRPVF26Q==
X-Received: by 2002:ab0:6c4b:: with SMTP id q11mr12340433uas.128.1634284652573;
        Fri, 15 Oct 2021 00:57:32 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id w20sm3226543vkw.28.2021.10.15.00.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 00:57:32 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id q13so16358198uaq.2;
        Fri, 15 Oct 2021 00:57:31 -0700 (PDT)
X-Received: by 2002:ab0:58c1:: with SMTP id r1mr11403589uac.89.1634284651673;
 Fri, 15 Oct 2021 00:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAMuHMdUvNM8Tu-+Ed0vjB2-_JUQe7ojUPbzJM=Vy1m_j31sNSg@mail.gmail.com>
 <20211007200250.20661-1-nikita.yoush@cogentembedded.com> <CAMuHMdU2Nr1V035Ntz-XNrc10t7femUFt_WV+Q3EHiWZD5HmkQ@mail.gmail.com>
 <c8234074-a22e-72f9-fbe7-e65d6af74eec@cogentembedded.com> <CAMuHMdU1OhyqnREnwpEUubUsR1DUF_3a1z2MpWxe5U6rWCLUUA@mail.gmail.com>
In-Reply-To: <CAMuHMdU1OhyqnREnwpEUubUsR1DUF_3a1z2MpWxe5U6rWCLUUA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Oct 2021 09:57:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbQPN+TsE0LZm-sp46cOoiwjCQw0wS5e2Z1ua66qdntQ@mail.gmail.com>
Message-ID: <CAMuHMdWbQPN+TsE0LZm-sp46cOoiwjCQw0wS5e2Z1ua66qdntQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: r8a779[56]x: add MediaLB pins
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Nikita,

On Thu, Oct 14, 2021 at 9:39 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Oct 14, 2021 at 9:27 PM Nikita Yushchenko
> <nikita.yoush@cogentembedded.com> wrote:
> > > Obviously not only the mlb_3pin groups, but also the functions have to
> > > be moved to the automotive[] arrays ;-)
> > >
> > > I'll fix these up while applying, so no need to resend.
> >
> > Looking at error mail from build robot (cited below).
> >
> > Looks like also must put definitions of mlb_3pin_groups[] / mlb_3pin_mux[] / mlb_3pin_pins[] under GEN3
> > ifdefs.
> >
> > What are the proper steps now - send a v3 of the original patch, or send a fix to what is in linux-next ?
>
> No worries, I'll fix it up tomorrow myself (unless you beat me to it,
> then I'll fold
> your fix into the original commit ;-)

Fixed in
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=renesas-pinctrl-for-v5.16&id=ce34fb3cb4a8165a51a90d0ea437d75f34a6d031

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
