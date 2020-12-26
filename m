Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361F22E2EC3
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Dec 2020 18:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgLZRfY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Dec 2020 12:35:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgLZRfY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 26 Dec 2020 12:35:24 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57265C061757;
        Sat, 26 Dec 2020 09:34:44 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id b8so3669806plx.0;
        Sat, 26 Dec 2020 09:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6aizC0iDcuMW46Ucwse0MawlzqeB7TA3Rcrr8/yFWz4=;
        b=l4iImMoVMN1xfKs0+5+fMdE9r6N4pQnPjMLOGvrL9Lhj5adK2/FRSopTKEir7mhsOi
         XhKSBrMzcQBzilRbyfUWmq5Mx/o91CQB6wcIcYIiVW4B5QseqmFW6cXhe0l64yRAmwLq
         fyKrRU4M0icwN8X36iSVwelyLqjcmjQRhdgyU2C6Gp5k0hXr/k672RNGjDUgpZosFpWU
         gSU2xPA/P45FZ96ks3EEzVz5i/jVowbUeRxe2sh9hC/giL4t+4f8lyFHtTsy5TWtn+3L
         dXuuCZ0v+Fo8Ny3ElFCQ/9ozkD5yqT3nPeDu2f9v4KVHdyyVQEa/sSq2byPPWsq4WwBy
         bIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6aizC0iDcuMW46Ucwse0MawlzqeB7TA3Rcrr8/yFWz4=;
        b=jxmCDINlMCJS8rmr+jXSAgj70E+wx37JiL0wwrcV+6s4go3hF2RLDuaXPowpRaJ3al
         goR6MRzr5R9VJagOH+Mn1/SYgidxbsVb9Qx8CwGP1KkD54YyaVedXOaJf1HznP7YZIoR
         GP9iY9Q3DB27Ys2IxL9shylEQWtVTO6sLbQow413X/5wdP4XZALeJzZtGUeoUlmdwbMF
         KvBVw4tNG5KFZ9ilzkffyfZo09YBgHDPbrpHfKCa6EwboZg5nKM9LQuVGZ4zY8gb6q9Q
         2HxhmJKmeouHsruI5LVA+5vlZZ3k4m6SsBxzWmnCuGsVPpIvs2L08QjQhcNV1BB5Lj3W
         qq7g==
X-Gm-Message-State: AOAM530FHf2C2ZnXY0nQX4l9eEh0PnL0zuNHLC+Ii3TAppiidEMQktn0
        YRzDltPXausScqRpiVz9+DUmH3ptSuBVH9ot3Zs=
X-Google-Smtp-Source: ABdhPJx96HJCeC4GLwz3NBwhJaJ25PH40R2BCSNu7BTINQMgziRk74uxeO2hj9Pg15QvQIP+R/O4MQ8oN7D2NboE+GI=
X-Received: by 2002:a17:90a:1050:: with SMTP id y16mr13619390pjd.181.1609004082693;
 Sat, 26 Dec 2020 09:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20201224112203.7174-1-nikita.shubin@maquefel.me>
In-Reply-To: <20201224112203.7174-1-nikita.shubin@maquefel.me>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 26 Dec 2020 19:34:26 +0200
Message-ID: <CAHp75VfJ_3XKhFeQv9h0QDeeS4TrNH0aKUXUD3BBff0xUCAf0Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpio: ep93xx: convert to multi irqchips
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 24, 2020 at 1:24 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> I was lucky enough to became an owner of some splendid piece's of
> antiques called ts7250 based on the top of Cirrus Logic EP9302.
>
> I don't know what fate expects this hardware (it's not EOL it's just Not
> recommended for new designs) but i wanted to share fixes in ep93xx gpio area.
>
> It seems ep93xx is deadly broken at current state usage of AB gpiochips
> interrupts leads to deadlocks coused by irq_unmask/irq_mask recursions.

I personally consider it quite nice to have support even for outdated
hardware (reminds me about a recent LWN article about 32-bit
architectures and a comment there how it could affect the environment
if we drop them from being supported).

So I fully support this series.

-- 
With Best Regards,
Andy Shevchenko
