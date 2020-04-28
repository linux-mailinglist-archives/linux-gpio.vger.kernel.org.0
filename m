Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0601BC3B8
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 17:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbgD1Pab (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 11:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727981AbgD1Pab (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 11:30:31 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7C2C03C1AB;
        Tue, 28 Apr 2020 08:30:31 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r4so10475280pgg.4;
        Tue, 28 Apr 2020 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6PjGg3UbaqxfVPgULOkWJWIszbc0cWBSzi6BaU2Kh6M=;
        b=nKLcbFM/dz/5pfMj+s2SkAwYS78K/cZLtnkGzt3F3FB7NdZn4FsWdVpI/wJR5FOYTO
         qaT9nTWlFDPzgnRLR+yQj+YzKCkFC2ba7BlyQERQW3n/b6aN24Ug9FpE9gG2r2s/yqnQ
         0P3rg8CPNj+xmrRXySCCGFOCyO+093tkJ+/cXnyNkKDHVhkil6CMJar9Wn8Wua2kxi/P
         4sz8AD1U536RvHmXqTZe8/Aj+aYv45i7mZ2eVOOtOKP8nBJ6LhIkG4hQ8PGNWi+LE1z8
         QNbM+3JRNXMja3UADJpgAuU37MITMO1FYpVsxqIg0osNd6ZDZhi6RzJlnHUPOqBshVQm
         yjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6PjGg3UbaqxfVPgULOkWJWIszbc0cWBSzi6BaU2Kh6M=;
        b=d3Lnsp/mePUBfUjc5z8px4DDeiqMaSGqMXKb0JHBkdQRzJaX5639/G4MwRzUVFla5a
         F7Nfv9QqxrC+U53+6D/DfyfZderBD4rivREPUdqV9E1D4CT1TsJTo0tHHz05MPlldLHU
         q4QHU8xi4tuKqP7IhvvlEAiO0y4uQZSj7Kw6IwW+2bY2atVLmNAskwLnAn2Zc1vy1eIL
         yRdKSmVyMG/fFGPo0CkWbpmyty5ioihWd94kFj/5misYlbLiDSRkseVDKoPBhJV+LEw7
         a+BTV5jSZOH1ou3Y/92Bib2JgNcvXQTNiLsf0PpF6TNqSAtT+6/41VKZy+JgOv9umaLE
         cRPA==
X-Gm-Message-State: AGi0PuYbXERnEortaCB8j7WQxMW+hYRvgXxfWwgvr44KvkrJVhiULs+I
        mkvLyHD0KlsoY3xRW6WapKakku+irWnf422wNfg=
X-Google-Smtp-Source: APiQypJtNDV9iExHzJU8YiVUP9l/NCa9z28YI5f6UtRB/lVB0A6v8hOtpV8C7MQ3/486tioY+E+OOeJN5JSFKz5HI4Y=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr29960076pgb.203.1588087830620;
 Tue, 28 Apr 2020 08:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200424154103.10311-1-zhengdejin5@gmail.com> <20200424154103.10311-3-zhengdejin5@gmail.com>
 <CACRpkdY5_+_n8qfUxAGtG16QW_VoVcpSFZuoBR8A6iuCbmsrFw@mail.gmail.com>
In-Reply-To: <CACRpkdY5_+_n8qfUxAGtG16QW_VoVcpSFZuoBR8A6iuCbmsrFw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 28 Apr 2020 18:30:24 +0300
Message-ID: <CAHp75VfmMJEFo8gcoESg9Zh6dBuzn7tB8iquaNBVU_nyTx-LMQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: mm-lantiq: Fix small typo
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dejin Zheng <zhengdejin5@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 4:53 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Apr 24, 2020 at 5:41 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:
>
> > Fix a spelling typo in gpio-mm-lantiq.c by codespell
> > s/dont/don't/
> >
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> > ---
> > v1 -> v2:
> >         - split patch v1 (only one patch) into patches for each driver
> >           by Bartosz's suggestion. thanks Bartosz.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Andy: since this is an Intel product are you picking it up?
> I think this Intel-MIPS platform is a bit of a special case so
> I can also handle it if you prefer.

I only collecting stuff for x86 base Intel, this one is MIPS, so,
please take it directly if you are okay with it.

-- 
With Best Regards,
Andy Shevchenko
