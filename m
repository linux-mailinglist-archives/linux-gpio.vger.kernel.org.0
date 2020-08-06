Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E025323DEBA
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Aug 2020 19:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbgHFR3B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Aug 2020 13:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729345AbgHFRA4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Aug 2020 13:00:56 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826B4C00214E
        for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2020 08:54:05 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id h7so45342880qkk.7
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2020 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9UsHAX7esgjtVzNUCEqqvqu86wCp66quILvQY7iEL8g=;
        b=DyT6FG8ChV01l/RE876rDNuC6j5DZJjP1C4cM04Su+qQP/+5Fv7Ee/cT/IS1nBx360
         Pv5BJ+oxTlFo/nboo9WeCzc9ezk3F9gAj3slg5OXaDJWKtg8l5CEVDSnTnJ9QvdXVnN6
         CoPWeXdDnTCkJXuSjv/FC7NntuHtLLFNd9taIhYEFs+8Ice71Sv/a4WJ62TJNP+AEcD2
         CCuGrbnxz0ywxNZylEFrKVP5V/KajDbma/cMnWfiLLuInEgosYYRmNviv9apqXpN/QnZ
         7qsJyIt0ydS6C4ytPStPVKjRrHh7ed7LPCduQgkT0aUJKGY2nLeKYN6B703T1+qSmADU
         LRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9UsHAX7esgjtVzNUCEqqvqu86wCp66quILvQY7iEL8g=;
        b=U1N1XpaxWpLcFg1tc2qCnNpPUbqdoYAfnDIPn/BM7w4AfMHMqqeAEfJfcXv3HDlh3j
         lGz+EPxuw+hJWRk+wdX41okvOj1g7olaOB/kmoRcoUu6ZKRmXxTg26VjSqmFcjvNTGc0
         NMKfkMsibDk6CyVVkVTRkCssK+6nSSRiBKaK0Hj8KlMYRs+F3riTrkxhxg6Qjq8onowb
         ARJWlL0HQ81cQTL9pbOD9rwwXRJv3HptyuwI0go9w9QdfkeAxm04JFfq6JCCszGDCqRj
         NMfNl9E/1MvRFsKHEuxFA39GgQwf3XcqGLFuGRMIKs1RzPSg2m1WdU3lKraMInwJDhXG
         9Q1g==
X-Gm-Message-State: AOAM5300znuuYzc1cJgoPQmfVB0ZS8yrxZ9m2iJ+8qKKorHNvIa2hypZ
        x8lUV0bIpBqfVcHwBVY8cs+BMoKrU8QYGp6E7CdzxQ==
X-Google-Smtp-Source: ABdhPJzbBj8BOLmvjWfD0JzRDsoVdCv0FKrvWOOJLr1shEyMS3Imf50S97xGa6pPDYHYJAHuGq+9AddRZGrZu80kcLg=
X-Received: by 2002:a37:a495:: with SMTP id n143mr9203612qke.330.1596729244782;
 Thu, 06 Aug 2020 08:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200725041955.9985-1-warthog618@gmail.com> <20200725041955.9985-3-warthog618@gmail.com>
 <CAMpxmJXocdDTvC7_76UwZ9FONn86p0MjZtorRKTR5bxN7PJy6g@mail.gmail.com>
 <20200805051853.GA122005@sol> <20200806011513.GC11890@sol>
In-Reply-To: <20200806011513.GC11890@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 6 Aug 2020 17:53:54 +0200
Message-ID: <CAMpxmJXk42efa5PoK=BuwHeU-9T_886uEXK8AworQ__334aU5Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/18] gpio: uapi: define uAPI v2
To:     Kent Gibson <warthog618@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 6, 2020 at 3:15 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Aug 05, 2020 at 01:18:53PM +0800, Kent Gibson wrote:
> > On Tue, Aug 04, 2020 at 07:42:34PM +0200, Bartosz Golaszewski wrote:
> > > On Sat, Jul 25, 2020 at 6:20 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> [snip]
>
> > > > config, info, info_changed and event structs receive updated versions,
> > > > and the first three new ioctls.
> > > >
> > > > Signed-off-by: Kent Gibson <warthog618@gmail.com>
> > > > ---
> > >
> > > Hi Kent,
> > >
> > > Thanks a lot for your work on this. Please see comments below.
> > >
> > > One thing I'd change globally for better readability is to have all
> > > new symbols marked as v2 - even if they have no counterparts in v1. I
> > > know libgpiod will wrap it all anyway but I think it's still a good
> > > way to make our work in user-space easier.
> > >
> >
> > Fair enough.  Oh joy.
> >
>
> Given that the intent is to highlight that the symbols are related to the
> v2 of the GPIO uAPI, and not the second version of a particular type, it
> makes more sense to me that the v2 is placed adjacent to the GPIO in the
> name.  e.g. gpioline_flag_v2 would become gpiov2line_flag.
>
> Does that work for you?
>

Yes, except that gpiov2line is a terrible prefix. Perhaps we should
make that into gpiov2_line_flag and same for all others? Maybe even
gpio_v2_line_flag if that doesn't make the symbols too long/too hard
to read.

Bartosz
