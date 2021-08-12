Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E899A3EA61D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 16:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235843AbhHLOBr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 10:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbhHLOBq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 10:01:46 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC655C061756
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 07:01:20 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id qk33so11733225ejc.12
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 07:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KFjMiq/A/y4iSLWqVwNI5PDDOVImz8rEzN7q0Uwy6GI=;
        b=nMyolGNUqhRHrrgeitU6m3yu0QxsGu0GgUnHjg0PYtJIpHaWOgai4nYs3YsH54y8qm
         xVcF3uEPi98Q5qNSPGAj+6yeeYHqmPYvXOxtFhPcS081f06MKAL1Tce3m/G0LcuPgmqO
         J18bNDB7YNSyCzc+jMMEtozOaTSZr9bDoq43KugK4HgmhyJGFnzZrNz+VRy4vN3kdVW3
         RWZy/gBt/oOKjv1gtW8CQu9pu2qlUu2oRx+j/fQRQNbKlKePGeyGtuRkU0jT9bmZz1gB
         xV0depykOGTukjTCPi1MlQeJxrbdGyajh1u3/ZaF/7oD3cMCvGFiy+CDHI/4c1mKsPwL
         7D4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KFjMiq/A/y4iSLWqVwNI5PDDOVImz8rEzN7q0Uwy6GI=;
        b=rU77naBL8R9DlEso3W9Jn+l46dKdMXHKAWklaVaZTZq31/8Ia9hNd1dUocLooO7h7R
         R512/Jp6dFwKLLH/JVpoDFERFlj+Xc/QfpTXIMZt7cT9LBSwskUSbKe0ywb59wzqEVpT
         b5UA5MsS7LJ3Cym0YGEoYplJYbwS0N0XL09o4/6I4El6XGzin4MFbP6ZmMvVfasedd29
         QzrdY+Zg031UFNbf9fSVY/UzApMmAIUcvlC9yyJN3kefN5Ke9kudZ6FMNg+gGSu/zd2k
         JnD7dDgZiI1L0H1q84H/OKokYgWGW9ZfcEpGLY4Rl456EMsJgzIGs0/0g2rlrNsZjJAw
         1IUw==
X-Gm-Message-State: AOAM533rcejRZh479xyrDu7rltnyDx2qecpEN6dARYsX6DE+5HFK9qGn
        mU2UtxkpCJfZaVKqo2LnxnQhEpJ56VabITzQ8GH2Aw==
X-Google-Smtp-Source: ABdhPJx7HUMrWsWUXB+f7cM6y8AiuRd9lMWTX58HdJzoxd0aFeeUr10CQXSnPazH0imuueRPY5E9tpta3rCC0u1yz/4=
X-Received: by 2002:a17:906:e241:: with SMTP id gq1mr4022979ejb.87.1628776878586;
 Thu, 12 Aug 2021 07:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210806132810.23556-1-brgl@bgdev.pl> <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol> <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol> <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
 <20210812102913.GA21938@sol> <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
 <20210812135255.GA28109@sol>
In-Reply-To: <20210812135255.GA28109@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Aug 2021 16:01:07 +0200
Message-ID: <CAMRc=McCDSh4UOyeYHRpZg4kdLYgvGAXwrsEfRh44uHFkSwMbA@mail.gmail.com>
Subject: Re: [libgpiod v2.0][PATCH] core: extend config objects
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 12, 2021 at 3:53 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Thu, Aug 12, 2021 at 02:51:02PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Aug 12, 2021 at 12:29 PM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> >
> > [snip]
> >
> > > > >
> > > > > My preference would be for gpiod_line_config_set_output_value() and
> > > > > variants to also set the direction for those lines to output.
> > > > > And maybe rename it to gpiod_line_config_set_output().
> > > > > And maybe add a set_input for symmetry.
> > > > >
> > > >
> > > > Any naming idea for setting the direction to "AS_IS"?
> > > >
> > >
> > > Since as-is is vague you need to include the field name.
> > > So I would remove set_direction and replace it with set_input, set_output
> > > and set_direction_as_is (which I would expect to see used very rarely in
> > > the wild, as the only use case I can think of for it is undoing a
> > > set_input or set_output call).
> > >
> > > > > But my concern above was actually the secondary array - that confused me.
> > > > > And it's big - always. (OTOH it's on the heap so who cares?)
> > > > > The array is of size GPIO_V2_LINE_NUM_ATTRS_MAX, yet each entry could
> > > > > have multiple attributes set - so long as the offsets subsets match?
> > > > > What happens if both debounce and flags are set for the same subset?
> > > > > Looks like debounce wins and the flags get discarded in
> > > > > gpiod_line_config_to_kernel().
> > > > >
> > > >
> > > > Yeah, I aimed at ironing it out when writing tests. You're probably right here.
> > > >
> > >
> > > Same reason I hadn't paid much attention to the implementation.
> > >
> > > > > What I had in mind for the config was an array of config for each line,
> > > > > only performing the mapping to uAPI when the actual request or
> > > > > reconfigure is performed, though that requires knowledge of the number
> > > > > of lines in the request to be sized efficiently in the
> > > > > gpiod_line_config_new().  Sizing it as GPIO_V2_LINES_MAX would be even
> > > > > worse than your secondary array, so don't want that.
> > > >
> > > > Or would it? Currently the full config structure is 3784 bytes on a 64
> > > > bit arch. The base config is 32 bytes. If we added the default value
> > > > to base_config that would make it 36 bytes x GPIO_V2_LINES_MAX = 2304
> > > > bytes. We'd need another base_config for default settings.
> > > >
> > > > Unless I'm missing something this does seem like the better option.
> > > >
> > >
> > > Yikes, I overlooked the size of the offsets array in the secondary
> > > config - that is a significant contributor to the config size as well.
> > > For some reason I was thinking that was a bitmap, but that couldn't work.
> > >
> > > In that case a GPIO_V2_LINES_MAX sized array is clearly a better way to
> > > go, and that is a surprise.
> > > Though those array elements will require the line offset as well as the
> > > base_config, unless you have some other way to map offset to config?
> > >
> >
> > No, but that's fine - see below.
> >
> > > > > My Go library uses a map, but that isn't an option here.
> > > > > Resizing it dynamically is the option I was last pondering,
> > > > > but my preference would be to add a num_lines parameter to the new.
> > > > > Anyway, that was what I was wondering about...
> > > > >
> > > >
> > > > We could resize the array dynamically but we'd need to return error
> > > > codes from getters.
> > >
> > > Why? If there is no config for the requested line then you return the
> > > global default value, right?
> > > Why does that change if the array is resizable?
> > > Btw, I'm assuming that the gpiod_line_config would contain a pointer to
> > > the dynamic array, so the handle the user has would remain unchanged.
> > > And the getters all return ints, not pointers to internal fields.
> > > What am I missing?
> >
> > Memory allocation failures when resizing.
> >
>
> Why are you resizing in a getter?
> If you mean setters then fair enough - though you could just sit on
> the error until the request or reconfigure and return it there instead.
>

I meant setters of course. My bad.

Bart
