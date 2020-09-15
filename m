Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BB826A029
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 09:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgIOHqz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 03:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIOHqg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 03:46:36 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553B0C06174A
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 00:46:25 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id y9so2121498ilq.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yJa8a110qBSZGFFTvT2OcJE7Q6IhvXcCYSDf8Gu+M9E=;
        b=mjFhwD6Hq/XhDbc/9k6C8RBVfjAokK5LaH5pgMF06keMuS2Zg7a7gbhtIwjxOfhFz+
         g4T9jJmOviIb8D9i5r2HUq90R8Qg5nEIMspL2VQGJbIGmcrC1k8mw4UdyDpV8C1aAcIe
         IyDKE8hXHoVwv4OJ+0jAdZ7WXrr+Ef3+ZFyu1H3cR4XBmk92vIFPDZo5DRmMakErlBRT
         L1AgNDqniERI+uTl+nA0V5J3SeygFcliBIxgWgN/OAwMxxFUEM5lIxexg2dNgdiq1t87
         mNPrskAdRU8MuEsqKXViY1mfIqv76oFEI2LjLMF86ZrIN3JEJuJUjo302iHe8vbKtAL3
         FDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yJa8a110qBSZGFFTvT2OcJE7Q6IhvXcCYSDf8Gu+M9E=;
        b=Gd+rk6TPp8jT0eQ2g7uQlMvPhLwzh0qoX22VyUBU8P+QTOjSe6Out+yhKTV7984Z19
         HR5WNpDEL/K5h/LjKLF6Suj+5h9rkl/xumyuUpzU79mCfB7uK5Xs2L0Iiq4EhgEEXkPq
         7UJpQohoisytohG8VqlAGb6BH2vhHV/YblMa2QOMCwc6C/O68Rji7ne6Ud5jADETwCU0
         JEeKpqh2OkdxMIWPHXTtaPiEDhuQru64cb740AbfzbsRqnKop86SZCg3j2pskUvJkoZL
         xGoIVsyL38NxyDv2puV6lrjYkE/NrXUQ1d1w8pIEHhmJuJ3APhM6MqejCnCrUXRkrJWu
         W/4Q==
X-Gm-Message-State: AOAM531MdwyZ6YjqB3YzFftNAmllBM9fYQGEhlqOsT7PLO3VFaDg+jR9
        A2QgUFPXar9Pf7b4CQJWqhddtWcCudLzA0tmrXEhrw==
X-Google-Smtp-Source: ABdhPJxMpGkzwXUWJdM+iJGT+DZyx47pwUBlhBjMlvQgOxQRRt3AlH0rgfjQmqxJItG8Uy3riZ8/8wfigkJmj83r5rI=
X-Received: by 2002:a92:cb4d:: with SMTP id f13mr14713052ilq.189.1600155983902;
 Tue, 15 Sep 2020 00:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4ZDbA_F+8O28YFwWgtT8Yoej0EeXCCboW6yfHT5T7ryg87WA@mail.gmail.com>
 <CAHp75Vft6zJDNr8FUQq7o9Cri78NQwYS13Y23+UUvhnt-sTjiQ@mail.gmail.com>
 <CAHp75VfexcxhAi1QHoWkFF-DMUbMF1zMmNFWnTyb-NniF22t=g@mail.gmail.com>
 <CAHp75VcbZ8zaseAD1FRQhY_pj_3_t43ssvqsw6NL6+4d3YfwXw@mail.gmail.com>
 <20200915004541.GC4138@sol> <20200915033428.GA14286@sol> <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
In-Reply-To: <CAM4ZDbAeLcZt3TaWQ7AH-VapR6fx9WrcHFT+v_MnXiL17Hu-9Q@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 15 Sep 2020 09:46:13 +0200
Message-ID: <CAMRc=MeXeMDPh6j-9heZMR5JcniYEcFH8zQyChEuep6wny1jSw@mail.gmail.com>
Subject: Re: [libgpiod] gpiomon loses events
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 15, 2020 at 9:34 AM Maxim Devaev <mdevaev@gmail.com> wrote:
>
> > The bug was introduced in libgpiod v1.5 so, depending on your
> > circumstances, I would revert to an earlier libgpiod or apply my patch.
> > ...
> > For the python binding that would be event_read_multiple() - as you have
> > discovered.
>
> Hello and thanks for the info. In my case, using workaround is an
> acceptable solution, although I think I will also patch libgpiod. I
> would appreciate it if you send it to me.
>

Hi Maxim!

I already applied the patch to the master branch and backported it to
v1.5.x[1]. Please give it a try. I will make a bugfix release soon
too.

Bartosz

[snip]

[1] https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=v1.5.x&id=23df3feb6a1b05f2bafa0b4bde58423daa0cb03b
