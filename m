Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E06280F84
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Oct 2020 11:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726288AbgJBJH7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Oct 2020 05:07:59 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39630 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgJBJH7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2020 05:07:59 -0400
Received: by mail-oi1-f195.google.com with SMTP id c13so590996oiy.6
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2020 02:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6dH8p8iIbXtbGnuxFe1Ar/b9S43Sz9cn0qej4P6l7sk=;
        b=TUvx/Yjhe5SRpAUze0PfsU7SNGLmsCVkd8AJA1jkORcTEdSWrkJCXHDFzMc3qat2wk
         BHb/ecVAnJI1K2DZFOcCEo0tuneolPY8KGwEM4DQsr7haDJyFymoC4tln5/eNq8eLQDL
         Xa/ajy48XGSz5SuTB9CqHh5zsODnx1V7mM8fGR9VBLZAzGuuahnt1UCHqpW9iUrZLMsD
         f6g53W4CwOpnLxRAR+jlkQV8f2YwCRyw/3Pa5Caf9u1v+dVdIkxKT4euZMllcRAQIPRd
         7GPElOLNvzhsLbrsdcfelZQenKypQpYy8u6kogmsRfONOjLeQDcYOzjZWmDlhYt4zFEc
         l1TQ==
X-Gm-Message-State: AOAM532EuMXCHsLoUvWDm9Qrzp6Yv2jxgkB+yIA0Wr3NN+5XyKY0mdfq
        kyftI+5Oc4nmxy5RVqaeQZpIPbBn2J9odu3CfRM=
X-Google-Smtp-Source: ABdhPJwMQJgJbp63CywSuuEb89ZSEquNkZM9eFbFrenFbNEPy4roBvUHUChuIrK0EKCEWrcXY2HG6bABUV+E/UM9V1c=
X-Received: by 2002:aca:4441:: with SMTP id r62mr600128oia.153.1601629678820;
 Fri, 02 Oct 2020 02:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
In-Reply-To: <CAMRc=MdCj8ZohsKiJjqynXPeg81q8_WZvb5VxoPGUDusFUY7Kw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Oct 2020 11:07:47 +0200
Message-ID: <CAMuHMdWysc7u7px6n6CJ9q1Pht5QRAL0UvDgoH=A4SGUNj9zgg@mail.gmail.com>
Subject: Re: [ANNOUNCE] libgpiod v1.6 released
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>,
        Drew Fustini <drew@pdp7.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Thu, Oct 1, 2020 at 2:17 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> I'm announcing the release of libgpiod v1.6. This is the last release
> in the v1.x series. New, improved version of the GPIO uAPI is now in
> linux-next queued for v5.10. It introduces many new features which we
> won't be able to support with the current library API (and we also
> have several reworks defined in TODO that'll also require breaking
> compatibility) so my plans going forward are as follows:

Nice!

> Grab source from:
>     git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

Note that the first Google hit for "libgpiod v1.6" is your github mirror, which
has the latest code, but not the latest tags?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
