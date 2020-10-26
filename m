Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5BA2990EB
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 16:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783705AbgJZPV5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 11:21:57 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34272 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1783704AbgJZPV5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 11:21:57 -0400
Received: by mail-pl1-f194.google.com with SMTP id r3so4839066plo.1;
        Mon, 26 Oct 2020 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oOkWxKNS7OgYcgr9AtuikvRP6VQyPR3f6F1K+1Zo1kQ=;
        b=LmCoNC6Ua8HAVPvByC9bsoozCVkd2hq1VykdP1PgLd+mNUcO2yAbtatRvOrWF2lhdX
         +STcJKR4Be3HsKEN+Y+sxBpGggDqHhp0KbwVHXhGaRiDGyoOsphrkWpwhpIwxDpLpGOP
         8JWcS4tkSB7ZnrDLDPyo4Et7OWq/fNFOZ8XFca3sZiasR17l7eYDWZVGqF6dfxlHEEwj
         d6tRummJL0LIMsaYwgWzosqI/qkcfdFRwzRcLchXH+ZfuDDkhk2tHxUzem72Zn69XJwc
         cDm+3zLHNIKBW1d8CbwMTglwYlW/korgVg7SxrzXLw6kOBe2NQ+NDf0bH7LXlLNq5Hg2
         CGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oOkWxKNS7OgYcgr9AtuikvRP6VQyPR3f6F1K+1Zo1kQ=;
        b=eqWrP0nlHDe9c65iWQ43mThungp564nZCQHYMhkgJHa3KbvLos22DgWYnFFkmvM6YK
         aL+wqDvGvB0w8m5SHgOrEDaWV9J0GFBkv4xYz2l1QtD4Gx2EE14zi/+aqx3HVk82QWbv
         DJNIgW5gtfI2l1guyNo9/mhQKErVgfCHLvu7xACtXmQuqIkYJ4OThppA5gSz4jX8gIs8
         rqsgsgqaLI1mEuOhpqTLwBexqTxdooJEQIsMWQCxZ0pM7oLuTe84hfZGFmIMMTYLfyQa
         RTlfSt2elcvFQLvi4z+GAavFd0n2bPkMpodtBnG1mCmOL1iOyhX5AkePTtK098igWPpt
         CirQ==
X-Gm-Message-State: AOAM532hqvOJvbGQx2ZeY5xPg/dMU9YxVYASlaYHnnH4Z3ARg1zrIH2p
        mOHruI8wgekLoBGGeXOzKoY8n+cyP5ShSt29SwQ=
X-Google-Smtp-Source: ABdhPJznEhCG/CtbsgET7HjL9PYwS6J3NDldIiYWYXp1Z7NeTSBhiQDAvJixd931Q/i4cOkOFqG+tG/prof3qtOOwsA=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr8806039plr.0.1603725716344; Mon, 26 Oct
 2020 08:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201026151600.2703-1-coiby.xu@gmail.com>
In-Reply-To: <20201026151600.2703-1-coiby.xu@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 17:22:45 +0200
Message-ID: <CAHp75VfZ+-rJFWVpowXyViA99_9tA5VaFLfJGH1WF4W=kQHr8w@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: print debounce filter info in debugfs
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 5:16 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> Print the status of debounce filter as follows,
> $ cat /sys/kernel/debug/gpio
> pin129          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
>  disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter disabled|   0x50000
> pin130          interrupt is disabled| interrupt is masked| disable wakeup in S0i3 state| disable wakeup in S3 state|
>  disable wakeup in S4/S5 state| input is high|   pull-up is disabled| Pull-down is disabled|   output is disabled| debouncing filter (high) enabled| debouncing timeout is 124800 (us)| 0x503c8
>                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Thanks for an update!
In general looks good, one nit below (sorry, missed it in v1 round)

...

> +       char debounce_value[40];

(1)

...

> +                               if (tmr_large) {
> +                                       if (tmr_out_unit)
> +                                               unit = 62500;
> +                                       else

> +                                               unit = 15600;

Side note: Hmm... Shouldn't be 15625? As 1/4.

> +                               } else {
> +                                       if (tmr_out_unit)
> +                                               unit = 244;
> +                                       else
> +                                               unit = 61;

...


> +                               snprintf(debounce_value, 40,
> +                                        "debouncing timeout is %u (us)|", time * unit);

(2)

...

> +                               snprintf(debounce_value, 40, " ");

(3)

Because of definition (1) can you in (2) and (3) use sizeof() ?

-- 
With Best Regards,
Andy Shevchenko
