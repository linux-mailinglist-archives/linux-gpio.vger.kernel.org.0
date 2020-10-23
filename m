Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB02297212
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 17:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465641AbgJWPOm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 11:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465640AbgJWPOm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 11:14:42 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE03C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 08:14:41 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id y20so2218465iod.5
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 08:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VLSUkeoLyMjFi1+Sy5QcGDXC3wlm83KHWun+LMH4cZw=;
        b=fdInz6q4CAP7JgC8JaiKGvEH+PjNc/QxvxqDyhKBCzmMBt2ZZNtwblMJuzgfeeeb94
         bQS4PEkvX8ooQereRhoBLvkUd3lXNbG4TXTuXdMCivWxbLmpN17J/LOl2rppJ4D52hdT
         YsJ2N672enVDFTl3LQhawzQSs1MD9ar9twRooQIE0hZc/14p9+GMHa61Gb3/6+uaKLcP
         ljcfd/wbMEnfu/KUVjcbyUgVj3mlyeUU6Wd3/FzRgoLy5J9q3COIJNGkODdGGtceAEpJ
         rBXAmL5Arw/HD/JVI+HP6E1fkvE65/Ea63h+wf/iSjj09m3JujkQfrSUnu9eRGHuL5sD
         VriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VLSUkeoLyMjFi1+Sy5QcGDXC3wlm83KHWun+LMH4cZw=;
        b=pOKSj6JxsYnB8Z8JgmgVcmQwD0MhtkFAfwVUuLvaoQQtDjxmuxPwl4wACOx3vk0Plv
         jkpwK8HtqvdBMTy7dQegLjBBCSQOTCgG/mwL4kmMF8lUkTzSA2fOFty2Sj+drpYMlJeU
         Rlu/rxstbc0ZQCCKwVqheOTx9KQs51Y2TVHcWu7PdvhEBd8FcorCMFT7PphCMKG7Pv5C
         +lhU9FQOmX7kQErmYQbC1V66mhL3mOjPaJ3ao4nIrmVOmWA9Wwo9jaoWwbAlWeR72A4p
         vP1PrCsxow5mJMKt/1WertDKUtg578SFpK6pCY2qMdHKO6FOGhgNGWEz/sy+Kdyp7bBE
         CAuA==
X-Gm-Message-State: AOAM53230Z/2dXbe5a7L6WMK0OSXSJv5Dt0RnW9t7QS9hlervpYrgFD1
        T3WWqWuJRM+M30YIzkobbQDEzbmy6tmYYH4NlK9efQ==
X-Google-Smtp-Source: ABdhPJy8JreRylKuC6uTvlkiNqFZUrsB0ICyQkeoDZf2dBRgtEYpuka7CFy/jtfDAWbRGeLo5yK6nrkJDhE8rWFQVgE=
X-Received: by 2002:a6b:f401:: with SMTP id i1mr2035299iog.130.1603466081298;
 Fri, 23 Oct 2020 08:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201023092831.5842-1-brgl@bgdev.pl> <CAHp75VeiGSJO5XnpQLMs=0nT=otVjC1tOsR7xp1gJ3tLHwUTaA@mail.gmail.com>
 <CAMRc=McD7jtBQ_CPV26Pzr63T6-o_aPpYt_CT-48H_mGuhxrGw@mail.gmail.com>
 <CAHp75VcxaqmJocQ8jYouJ80P0anN5ENheH2yK2Sm-sHXjA5NoA@mail.gmail.com>
 <CAHp75VeGFuF7NrGJ9sc+kXz3e-wzGi3kTDmW56oaNKJf65NZLg@mail.gmail.com>
 <CAMpxmJWWt5MhqObJabOxtdm9U4rQ6EPvJR3PHBRH_J1uLMat+Q@mail.gmail.com> <20201023141733.GV4077@smile.fi.intel.com>
In-Reply-To: <20201023141733.GV4077@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 23 Oct 2020 17:14:30 +0200
Message-ID: <CAMRc=McrkroEpxx5nw7N3EgbGp1B7SOqTFr7x=J5oxh3NpFoKg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 4:16 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Oct 23, 2020 at 02:44:06PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Oct 23, 2020 at 2:08 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Fri, Oct 23, 2020 at 3:06 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > > > On Fri, Oct 23, 2020 at 2:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > > On Fri, Oct 23, 2020 at 12:24 PM Andy Shevchenko
> > > > > <andy.shevchenko@gmail.com> wrote:
> > >
> > > ...
> > >
> > > > > Nope because gcc will scream:
> > > > >
> > > > > error: flexible array member in union
> > > >
> > > > Ah, of course. Should be
> > > >   struct ... **lines;
> > >
> > > But it is not gonna work... we need an array here. or just one member
> > >
> > > struct *lines;
> > >
> > > bulk:
> > >   lines = malloc(num_lines * sizeof(lines));
> > >   xxx->lines = lines;
> > >
> > > single:
> > >   xxx->lines = line;
> >
> > The definition I used is clearer - it's explicit about using an array
> > with a single member by default and can be extended as needed when
> > allocating.
>
> According to [1] it makes harder to avoid sizeof() type of calculation
> mistakes for such struct.
>
> From my point of view extending something that has been already predefined
> is not cool. But it's up to you to decide.
>
> [1]: https://www.kernel.org/doc/html/v5.9-rc1/process/deprecated.html#zero-length-and-one-element-arrays
>

Your point is valid but we're not talking about a structure commonly
used across a vact code base that is the linux kernel. We're talking
about a structure that is private to a single .c file and its size is
calculated exactly once right next to where it's defined. Risk of
misusing it is miniscule IMO.

I think it's fine for what we need here: a struct that can be extended
when allocated dynamically but also which can be used on the stack for
the very precise use-case - holding a single line.

Bartosz
