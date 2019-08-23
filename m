Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 735E39ADFF
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 13:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbfHWLTS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 07:19:18 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35809 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730588AbfHWLTS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 07:19:18 -0400
Received: by mail-lf1-f66.google.com with SMTP id h27so971360lfp.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sCsA7CuAVXz6nZgOzbbinO/SLy+XqMcWbTP92beiC9M=;
        b=ZQ946oG1kLdYZnM3hAWhg0BaKYtc+yHhEXfYVsWr5hHOk7qo/g7uBXnIiZqCZl0TUH
         l074fwtkIlcQGYzTuRTn2sbB9FMAAwADR5fe8q9OcPbFEiSYBccsezWKcvbQs72NahFY
         Rmcr8X6r1aSdStnKfgeIrTy7tdpeimXPxVDNb9ZfxSCoumFEYf7/irIlItmygnWPEoTb
         JNYoHuKGjK69B2g5kyxdPjGds30IrusXfwd81ahOxy7Y5ckwO5xQc09lOvz9MYqCn61e
         Npbbvmq6JIKWzXSKKJ35m75vkG6uKKyvmeskDi9Z7P/lsKDjsBxe2RMFipn4mrkEcLjN
         u9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sCsA7CuAVXz6nZgOzbbinO/SLy+XqMcWbTP92beiC9M=;
        b=t2xIzHIqV3UlrUvLl8Kz5+3pKiMqTO//q5psxBcH9IW52ZP/8WbcIOXMSJxjnhM76s
         8jGon0p8laF5kCHl85Tj6KFSweJo6IcjnL2d3k4elwOtcQur47VOGF7vW7YVdUgzVOUh
         2CTuhL15Tfq2JnUGfGUMWzSBSLG4xBglMsmB9Hqisa0eMCHquj/A5076fgvr0VkKRI52
         Fir5G31802pybCo+QmCor4ACcdHvCsIXNnYwYcKqQWUUBQk4KntOqhY1iuGEA6dbi9+9
         sGYGohaMfM9Cme0KcqAOHilmoxI6311T75L6GdgPn0BxY4dJX3UL9cs51sm6aU7P2Qqb
         QssQ==
X-Gm-Message-State: APjAAAVzg8/qufnm1Zxt5QB/0HpgjJ6k/YDySVqB8VLrGv2aKdtDV0vw
        N5o9IjF4VOdflZYWCQS/fAUPKFXo4DDonwV7g0OJYQ==
X-Google-Smtp-Source: APXvYqxdk1LLxCHwpHlwsQWZtUR8F3I79RHMLyhnt2YNIIMgak3X/febxDTLj1P3KLzoRI0/qV740u7tSqpP6QVe2jA=
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr2625430lfn.60.1566559156361;
 Fri, 23 Aug 2019 04:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190823094728.15012-1-linus.walleij@linaro.org> <896d895c-0504-36c3-e1ba-5b4cf9cc9cac@monstr.eu>
In-Reply-To: <896d895c-0504-36c3-e1ba-5b4cf9cc9cac@monstr.eu>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 13:19:04 +0200
Message-ID: <CACRpkdaa_vQ0Pko0Log5uwomFb+gbSPTjpZ6S-3VJgFGMYYpWw@mail.gmail.com>
Subject: Re: [PATCH v2] microblaze: Switch to standard restart handler
To:     Michal Simek <monstr@monstr.eu>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 23, 2019 at 12:56 PM Michal Simek <monstr@monstr.eu> wrote:

> > +void machine_restart(char *cmd)
> > +{
> > +     do_kernel_restart(cmd);
> > +     /* Give the restart hook 1 s to take us down */
> > +     mdelay(1000);
> > +     pr_emerg("Reboot failed -- System halted\n");
> > +     while (1);
> > +}
> > +
> >  /*
> >   * MMU_init sets up the basic memory mappings for the kernel,
> >   * including both RAM and possibly some I/O regions,
> >
>
> I will test this for sure. What's the reason to add machine_restart to
> mm/ folder? You can simply keep it in a location where it was.

It is because the three calls to machine_restart() were in this
file and therefore I just put it in proximity.

I can move it.

> Do you know why of_find_gpio can failed in connection to gpio-xilinx driver?

The only reason it'd fail would be if the module is not compiled
in, or deferred probe happens, but then -EPROBE_DEFER
would be returned I think.

Yours,
Linus Walleij
