Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88267AB00
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 16:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbfG3OaH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 10:30:07 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:21278 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbfG3OaH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 10:30:07 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x6UETruF012851;
        Tue, 30 Jul 2019 23:29:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6UETruF012851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564496994;
        bh=0hc3Uu9nCIoE1SS53/NliN1JNvYIDZvrrXG5AJfRp38=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cca3XGZcjEDP+3Di0PFOf71mc1PVWZJd08455cvM5iMOy9FVVZg8h1aBgMcCJUc0C
         YAWB9KMa9qpT/gMlxTC5gkVz3C4Au07tHGwT1JLssZ6PmkyB5RZmYZR6KdBLI//1z3
         p3ev2kMLQVA36UIvUOmcXSRL0r7sZZANoB6fNMYXtRr++eqT418gKLlat6NX78cwVP
         8WHKnyhv/bCRp/HIpYrqIcS8yZGWosJNazJ2is+yrDakOKu5k7Bm78Jk31scgbai3X
         wXyds86TkwHNlc4/PjwRbygb/nLugaAGdFhnOhgLxEOBe6u875sM81koqaZ4VGnmRE
         /sdoLHBv3wmGQ==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id 34so25519209uar.8;
        Tue, 30 Jul 2019 07:29:53 -0700 (PDT)
X-Gm-Message-State: APjAAAUIvkTmxEwCKojXqQp7eIwpdXK4vp7f+aqnRIfdpG8iztJM8PbP
        /XjHMrvgqej/ak53PFAkPFGanFkSN65KLUJvxYY=
X-Google-Smtp-Source: APXvYqzTa+qzpINOT2XZDf/K7sGcDUA0vckyvpjF65oqd9ogwq5I7ovAg+Z4nhc+il2dE73E9Q8CIn8qVhargUmVkWY=
X-Received: by 2002:ab0:70d9:: with SMTP id r25mr44806891ual.109.1564496992810;
 Tue, 30 Jul 2019 07:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <1564465410-9165-1-git-send-email-hayashi.kunihiko@socionext.com> <1564465410-9165-2-git-send-email-hayashi.kunihiko@socionext.com>
In-Reply-To: <1564465410-9165-2-git-send-email-hayashi.kunihiko@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 30 Jul 2019 23:29:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNASbe8tyxfhuwmUpA+M7D9AdPa6v7UaAC7qLvY_eN2sxTg@mail.gmail.com>
Message-ID: <CAK7LNASbe8tyxfhuwmUpA+M7D9AdPa6v7UaAC7qLvY_eN2sxTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: uniphier: Separate modem group from UART
 ctsrts group
To:     Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 30, 2019 at 2:43 PM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> It depends on the board implementation whether to have each pins of
> CTS/RTS, and others for modem. So it is necessary to divide current
> uart_ctsrts group into uart_ctsrts and uart_modem groups.
>
> Since the number of implemented pins for modem differs depending
> on SoC, each uart_modem group also has a different number of pins.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

-- 
Best Regards
Masahiro Yamada
