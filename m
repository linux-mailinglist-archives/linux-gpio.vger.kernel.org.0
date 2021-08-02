Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB54B3DD599
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 14:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbhHBMZK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 08:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbhHBMZK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 08:25:10 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEF4C06175F
        for <linux-gpio@vger.kernel.org>; Mon,  2 Aug 2021 05:25:00 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id p145so13541978ybg.6
        for <linux-gpio@vger.kernel.org>; Mon, 02 Aug 2021 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pSQOvSojt3sSTQUfw9yD1dATj/dm5qCUjIkmi9JVr/U=;
        b=EHQz7jM8DBQiawB5Ef3CsUo8yqsSqaIL5ogAiNpIcbj4uAIXs8raxUuC7mwX4GjcA9
         twJXhzawZ9uRWYQzC9lBOsU86Xw394g2TTgNPm2j6KwH0ce5hs++diV8RXwg3l9yrKtH
         tBn7Xnt27IOQ6jXBsGI3hOJ8WP6pyX2RJurSmVTs21gRrtP0Py7LASQsGQ18LzVZDV/B
         C17/K5wWfA9dkUjH8DT0rVb+620YnoWMnCVvJc1ZP0ScsyzNEXYv2A3SmsO+UiiySf8j
         Ign9Ik34Z8p6Xnv8P16kr+kvCvy3579Jgbr6Us+PoJkKWznnZdyQfqvsSoKACOskqHxj
         d89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pSQOvSojt3sSTQUfw9yD1dATj/dm5qCUjIkmi9JVr/U=;
        b=lvfFRuxl0KfzJdq0J8939DJaKifWcHzZ0ZriITk4BJYqCXtf5MROrFxW6WMnZrCNES
         bTOaXNOJYsXVs39HIdgxKIKX7oeIvii9hNBxK1GK0E4/DN+A/NBRJ7CEiMMsKAw9nULu
         6mEycGscspAMtQcWRVJcHicuW/HPjV64nPgGtEo2DZmVKO3m63OKcqPBa/hBwTbTGasG
         mHdPZdqhxM0Zyrq+4W5AZOI/IvYk40PY23zjpl6aNKc4SUa7L8p7F53yq9Pfey1+i0cY
         8GEWpSa9QFksNG6iXFq+yaBNTldohGHgfV0yFJ+JjM1YIcgnxwEpURbYnGbKtpawMwTj
         lkFQ==
X-Gm-Message-State: AOAM5308kzjMlrP3oPtO+rmA71gbMSMGGMiIL78wZVyOufOBVdc25VLY
        akgsXk6GNJPs5DHHA2HYCkrkEODCs7kEMHMxki3dlRdzJoI=
X-Google-Smtp-Source: ABdhPJxlLShZyXI/nVCHCmk1N2v/4hHIE66E5Kxuam23mK6LetyBHGhznoffj7cLeKKP9K9BTdhKfarJIO1DpRQlbT8=
X-Received: by 2002:a25:2789:: with SMTP id n131mr21851802ybn.12.1627907099521;
 Mon, 02 Aug 2021 05:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210727143400.32543-1-brgl@bgdev.pl> <CAFhCfDZ1gHj2W0uDe1MZK71N87eH1pPBdEP32kcZys=pYEwSdA@mail.gmail.com>
 <CAMRc=MfVVTLeRmGMK0ScOEOo1RGvWmgxe+9Js0nYSxwBs3vmiA@mail.gmail.com>
In-Reply-To: <CAMRc=MfVVTLeRmGMK0ScOEOo1RGvWmgxe+9Js0nYSxwBs3vmiA@mail.gmail.com>
From:   Jack Winch <sunt.un.morcov@gmail.com>
Date:   Mon, 2 Aug 2021 13:24:48 +0100
Message-ID: <CAFhCfDYmn_y4FcDvK5eKAdcFN3OfsSqVo1yd7quiZdN0+STipA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 0/3] libgpiod v2: C++ bindings
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 2, 2021 at 11:34 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> It's actually my fault. Let me explain: the development of the v2 API
> for the entire project (C, C++ and Python parts) happens in the
> next/libgpiod-2.0 branch of
> git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git I squash the
> new changes into the big patch with the plan of resending it for a
> final review once we agree on the interface (more or less anyway).
> That will allow the repo to remain bisectable. Then we'll be able to
> fine-tune different elements.

Understood and sensible.  Thanks for clarifying.

> Maybe you could wait until I post v4? I'm addressing a lot of issues
> in this revision. Previous small patches have already been squashed
> and they concerned the core C library anyway.

Sounds like a plan.  I've noticed that, both in the mailing list and
your recent commits into next/libgpiod-2.0 (which is why I wondered
what the mode of operation is for these changes).  Once v4 is out, I
will look to review.

> There's no target, it'll be ready when it's done.

Again, understood and sensible.

> PS How did the move go?

Very well, thank you.  Setup with everything I've brought over to
Romania, with a little more to be shipped over very soon.  On a
somewhat related topic, I'll be reaching out to you directly over the
next few days (mainly regarding your relationship / work with
BayLibre, if that's okay).

Jack
