Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0F0D2B1812
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 10:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgKMJUc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 04:20:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgKMJUb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 04:20:31 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A8EAC0613D1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 01:20:31 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id d28so8182714qka.11
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2020 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LXvYg6KNLp5gr8xxXMEAyZN7n6FqtW194Mb8UjTkQ5o=;
        b=dmhGEkLYm12kWsa+j3THIcb6nTO863pK4iFMmQSh29zlbblAvhiLKHytbhwQVwgHEe
         WM9Vwvd9uaC+PU1DuKThGpMCrGUFIhlGPCbLuInTKqK2YYM1MO1yAXeQgLKAkbMLvz00
         7KQLofCJbhM26PUPtDJOEKWY2J+WyEB4cqABYQB22y9wZ72aYAkyxhmzJvu0RuQF2HhP
         dJJ0+vezSC1OJq40r48vBLIc+uTclSO0CygbQwgUh7tEatL1+I324D5F26onubcXm3c8
         +qLa9V5tKNbe5AkNgeqdaWm/aQis2qjyhFWB/Qu9UUY0OlF9eU8FZm6hRsa7amlm2b7L
         hoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LXvYg6KNLp5gr8xxXMEAyZN7n6FqtW194Mb8UjTkQ5o=;
        b=FuU2gteZVhhRkkTE/Npr1Uy3KKRO1tdwaDUgz27TlmyKPJZo7/rp6o70MTUt7Tldq6
         Z589J792gbE46QV9GnDBBBIsi/+LYXmuUCEx10sQm5lI3lbiczck1rdFV4S2HJcaNXh+
         uomCs1/JKnnj0EdWNa3fJxQ3mbn55+k4/qQYN/9QGVI8LUgS7YBxycqB2v6Dt+gfik1R
         PMmxhq+B3dgYNQoDnDm45p4OcfpTnk9cValI997Nr/bXWL3bOFE+YeHe/SqL7KXUq2Wz
         o4RbjEDiHkS+Oz8J7WluIvvPtx0rTw/1lgZ8Zrmy8vn0CrtZuN2QE7QVRLcgdfpziFFQ
         h1pw==
X-Gm-Message-State: AOAM532vwvYiYSyIq+MppPkyZMWxCnU1/B5KUxs4twn8HBH91JC4lIyd
        vT9eLyOiVsdjl9pdd7YjezNqJKQMngfLDKKjwVbY1A==
X-Google-Smtp-Source: ABdhPJwZ4dsscYAKNQlVWp/zM33raHvqS9lPXE2+3m3/w6rueUuevapKLyCoYjUidC4vPUh9JE1qVgGIYzDS44mbpxY=
X-Received: by 2002:a37:6805:: with SMTP id d5mr1108660qkc.66.1605259230630;
 Fri, 13 Nov 2020 01:20:30 -0800 (PST)
MIME-Version: 1.0
References: <20201113023355.43406-1-greentime.hu@sifive.com> <CAMpxmJVZ8OHnGrkC_5TZdZUg004p1=90KqOxpOTgi4036BGWfQ@mail.gmail.com>
In-Reply-To: <CAMpxmJVZ8OHnGrkC_5TZdZUg004p1=90KqOxpOTgi4036BGWfQ@mail.gmail.com>
From:   Greentime Hu <greentime.hu@sifive.com>
Date:   Fri, 13 Nov 2020 17:20:18 +0800
Message-ID: <CAHCEeh+zU4_i9eQuZ0nsxd7H5wkCQbsOr28cp-i54Tpf_RbYNw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: To get gpio irq offset from device tree data
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bartosz Golaszewski <bgolaszewski@baylibre.com> =E6=96=BC 2020=E5=B9=B411=
=E6=9C=8813=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:00=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Nov 13, 2020 at 3:34 AM Greentime Hu <greentime.hu@sifive.com> wr=
ote:
> >
> > We can get hwirq number of the gpio by its irq_data->hwirq so that we d=
on't
> > need to add more macros for different platforms. This patch is tested i=
n
> > SiFive Unleashed board and SiFive Unmatched board.
> >
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > ---
>
> Please list the changes between versions of patches. What has changed sin=
ce v2?

changes in v3:
  Add 2 newlines
changes in v2:
  Use irqd_to_hwirq() instead of d->hwirq and platform_get_irq()
instead of  irq_of_parse_and_map()
