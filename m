Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DC1543775C
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 14:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbhJVMrH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 08:47:07 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:40909 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhJVMrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 08:47:06 -0400
Received: by mail-ua1-f43.google.com with SMTP id e2so7355525uax.7;
        Fri, 22 Oct 2021 05:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=76x3pLWRTCP/TRw1WTSC3Z8xBZgXnwV9dr1N3FI35XA=;
        b=ETAxcbdJEW2BMR3c4GlG5c2Ces+yleAIFYtWXd/UBgUpX1fuXu+y36ofN83I41PtzM
         VoHr+2TNBGU44ZW6zbNxXM44D97OHqyXQ3bXkOzmPCuWAWJAiMBeec8ihFSJnJGxfXWr
         mF8uE+NjXbpWSj0mOzvGXQOO3GeB+Oi6lwpRhN0fszuS36xMC9r/bKmKlASFEuH0nkmQ
         8wzLziGizc998f36i1jhyAD6B5zkMylxVPOySXL21OCVz73FqwxYy94TKQ7+Y8MEhNAt
         f2kaPO4QHPBrCuMWs4Avam5C17C1TSQpRDNxRSeNDbIZSt6qXe5q9PG1rNNo+Ws/KvXp
         EGiQ==
X-Gm-Message-State: AOAM530f1P+42Tc5wlITcJcDRsPdvnrjJyHjdgkudE5VQh4vbuePn198
        LwicV2Vnad9O/43ZfgetzmxRcDLPk45NZQ==
X-Google-Smtp-Source: ABdhPJzJ7nT9qULtKar+Jv+RzetLGP+UK6N10bk7KQKB6ggeYUkrz6KkV3x2Sgpxug8Z7HyVTRfoOQ==
X-Received: by 2002:a67:d810:: with SMTP id e16mr5126900vsj.42.1634906688814;
        Fri, 22 Oct 2021 05:44:48 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id p191sm5020484vkp.31.2021.10.22.05.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 05:44:48 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id e5so278341uam.11;
        Fri, 22 Oct 2021 05:44:48 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:: with SMTP id cz12mr14104011vsb.35.1634906688057;
 Fri, 22 Oct 2021 05:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-7-kernel@esmil.dk>
 <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
In-Reply-To: <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Oct 2021 14:44:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJES+Jufhs--5vnXq=RwDF+WmZc7_C6Lc4gAVaY5sRRQ@mail.gmail.com>
Message-ID: <CAMuHMdXJES+Jufhs--5vnXq=RwDF+WmZc7_C6Lc4gAVaY5sRRQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Emil Renner Berthing <kernel@esmil.dk>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 22, 2021 at 2:34 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > +       while (idx)
> > +               clk_hw_unregister(&priv->reg[--idx].hw);
>
> I still consider that usual pattern, i.e.
>
>        while (idx--)
>                clk_hw_unregister(&priv->reg[idx].hw);
>
> but since you are pushing hard for your variant I'll leave it to the
> maintainers and author.

I agree with Andy.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
