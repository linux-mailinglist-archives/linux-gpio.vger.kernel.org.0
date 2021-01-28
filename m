Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D95307A85
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 17:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhA1QSq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 11:18:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbhA1QSo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 11:18:44 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2CFC061573;
        Thu, 28 Jan 2021 08:18:04 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id n10so4578351pgl.10;
        Thu, 28 Jan 2021 08:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6D+s1Wpr7yaiLzHkUhrsYSfAQmNRTVE7OsFOsBaTvrE=;
        b=uD/2LJ9CSOpDfJMmIylD5MQ+S7a2TVf8up80ch46TmM5p1he8lrDGViC/0KIcch27M
         dZirOCdBVL8JUjyTrBEu2Lwco2Cq9/3gdkYq6mtLBUbOWmFPqzdXNCFIpZW7nMtI3JaH
         z9Yv1F2KzoMGIrpBOLO4OSsUQTK39jhorLxL1hJdhktx6hNTs17L2elXE2GdwvZHY6e7
         TBdBid2gBgI7NhV+pc4IHy9R6/a2+NJzF4NUzhFrFrSPHrRjwk3XumIVwMup9TwtxeK3
         SgCozZrd3iCSQli5AvbHEmJpu02l2SQvl0Skzo/iLGkxJPJL0PfkvCxWglcCINqLQjOi
         OZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6D+s1Wpr7yaiLzHkUhrsYSfAQmNRTVE7OsFOsBaTvrE=;
        b=PfxCeiz71FeZ7cGC6wehi1ZB9DT8R8rthXYP4GUWacIS/Vw0Krg1kvxkXzfysKbQGY
         38E0TBWeUjbVBoG4T+gJRykdGeH0EkPSyKAaVaMGpSgDY+0dNorzi9pPNSApo9R0MNjL
         3Xav/siVL9MRih+R/w2JTtjiJvN3aEUeXhJ4M0gnF70kJUfqPC1FCHbb9nQlu9X4nywN
         7FHqPrMpMDxaf0JGnGaMmrAPKqwEs6sMSq+Gzxehr1ABpe2nLDD4djDgeAP4CDN5jyTb
         AvtGA5FkW9FdKF7XWN9cb8E7AiawWM27fr8nxSi8l3gdmyLG9tL3zpVgEV5Cgzku6Yw+
         6u7Q==
X-Gm-Message-State: AOAM531jn33WfCahqjEnXHKSOHvtuYJi0lJ3HePrQ0hZTbJ+hg5wuKpv
        Tv7GgPEpZNh/Gg254OHVFkbopzp8QpRPUzvQ0iw=
X-Google-Smtp-Source: ABdhPJyEyudScInc0S60opq+NvMGmlHm8D9K/F1nRpyYGiUvYDUeZhuXtfrmJwon8jAYMwgFPrdOaRFwyJxUlFc0ILI=
X-Received: by 2002:a63:e50:: with SMTP id 16mr322795pgo.74.1611850683919;
 Thu, 28 Jan 2021 08:18:03 -0800 (PST)
MIME-Version: 1.0
References: <20210128122123.25341-1-nikita.shubin@maquefel.me> <20210128122123.25341-7-nikita.shubin@maquefel.me>
In-Reply-To: <20210128122123.25341-7-nikita.shubin@maquefel.me>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 Jan 2021 18:17:47 +0200
Message-ID: <CAHp75Vcz0jYqVeCdE9xMYk6RECBASSsuk0ys9rRi7zs0L2JpqQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] gpio: ep93xx: refactor ep93xx_gpio_add_bank
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jan 28, 2021 at 2:21 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:

> - replace plain numbers with girq->num_parents in devm_kcalloc

devm_kcalloc()

> - replace plain numbers with girq->num_parents for port F
> - refactor i - 1 to i + 1 to make loop more readable
> - combine getting IRQ's loop and setting handler's into single loop

-- 
With Best Regards,
Andy Shevchenko
