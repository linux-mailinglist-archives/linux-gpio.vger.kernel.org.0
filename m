Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA3D296E2B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 14:05:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S463026AbgJWMFS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 08:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S463023AbgJWMFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 08:05:18 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02BE7C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 05:05:18 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t14so1091006pgg.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BYJ90LneayRB5BD5030qIgjtTuNNnTrKCTre6RJ9xb8=;
        b=kJovMvtoj29t84B1jwSf47NbbvwkD3N/mU63Mkn3Pmh8JwwjbDnXz15Tcw+XRbEOYh
         SDiOxfQfTHHJpjs2gQti01AOvS4psSa5jQQ1PPZbJSFJNlQSmlDD7yz0iUGeEmMkzp4G
         db7Hfmq4k1tbWzUg3scuzhhvaNHLemAWRVxAZBdrNtTAn5YIHIfRYuF6GNW8GoR0vcBj
         9NBR6HyQ5TRWjz+aM0CamoBczPiL9QF1vRN4FNnyigqFLYVs3AQB1a909SEJcRtn/z0b
         VPiZyUjxL3sQv+5Qf/lI3K/dOsNQeGyFMi/66Or7YSv2cIIgN9hZLsGkhpdb8ja8qZV5
         XIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BYJ90LneayRB5BD5030qIgjtTuNNnTrKCTre6RJ9xb8=;
        b=YTSBFrAl81JMgkH3TmNDC6YmNCMaPMIbAQ6wf+I6f1xaGwvH8nD7y+Yof2GqPs7jEK
         s1RoEGVixlyKg0LQvNVLtuykzoy3gAqOZf5cQVJU8ZWFZKmZk8CeD5VGG6IrZxYYjYha
         miTN2bkZp3Xy39IzvCysWnMy2p13BLONNfWelkHqF1Ji8MaglBZ+wgo9PSIuv4z5XHVA
         L6l1Jussa6gTAybd6PU2jDkVhDLpfZ1eJPNP9vno2c95FVOt0KQkUp68ROFMjc/g2j7U
         wViUvzqNo8Dhda4XWOm9nykw0Q0q3hEFOom7zyn0P0HWZBcN/uDY2meo2oEnwuuDEgGu
         eJkw==
X-Gm-Message-State: AOAM533R0C7HBV4NPJ6J+WQgiSg3H5nNUonbLI8EI65qpwZsx8vreH/t
        kq03cC5JZBtZzXrEod7vL7u/uOfbvDxc9rrI3+w=
X-Google-Smtp-Source: ABdhPJyVDcZtmuPo3qBrKYv/uAvW/JkY8ce0hvPrte5YJ0iDLTtGIgMIDc9s/8rqKaN+COMu9N9zDt6vEG5HM/8h7Bg=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr1693283pfd.7.1603454717525; Fri, 23 Oct
 2020 05:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201023092831.5842-1-brgl@bgdev.pl> <CAHp75VeiGSJO5XnpQLMs=0nT=otVjC1tOsR7xp1gJ3tLHwUTaA@mail.gmail.com>
 <CAMRc=McD7jtBQ_CPV26Pzr63T6-o_aPpYt_CT-48H_mGuhxrGw@mail.gmail.com>
In-Reply-To: <CAMRc=McD7jtBQ_CPV26Pzr63T6-o_aPpYt_CT-48H_mGuhxrGw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Oct 2020 15:06:06 +0300
Message-ID: <CAHp75VcxaqmJocQ8jYouJ80P0anN5ENheH2yK2Sm-sHXjA5NoA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 2:39 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> On Fri, Oct 23, 2020 at 12:24 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 23, 2020 at 12:31 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

...

> > > +struct gpiod_line_bulk {
> > > +       struct gpiod_chip *owner;
> > > +       unsigned int num_lines;
> > > +       unsigned int max_lines;
> > > +       struct gpiod_line *lines[1];
> >
> > Why not '[]' as we do in the kernel?
> >
>
> Because I want to be able to store a single line in this structure if I do:
>
>     struct gpiod_line_bulk bulk;
>
> Using [] makes the size of this structure not take into account the
> last array member.
>
> > > +};
> >
> > > +#define BULK_SINGLE_LINE_INIT(line) \
> > > +               { gpiod_line_get_chip(line), 1, 1, { (line) } }
> >
> > Hmm... Perhaps union can help here?
> >
> > union {
> >   struct *lines[];
> >   struct *line;
> > }
> >
> > num_lines == 1 exactly defines this.
> >
>
> Nope because gcc will scream:
>
> error: flexible array member in union

Ah, of course. Should be
  struct ... **lines;

-- 
With Best Regards,
Andy Shevchenko
