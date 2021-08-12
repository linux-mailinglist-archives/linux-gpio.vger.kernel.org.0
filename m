Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58933EA4E8
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Aug 2021 14:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237209AbhHLMvn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Aug 2021 08:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234110AbhHLMvk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Aug 2021 08:51:40 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25EDFC061765
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 05:51:15 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id u3so11383664ejz.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Aug 2021 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=irSjOH1rsWyC7ymAj3+hKEv+lViAuiFrSbhZpdh05i4=;
        b=IF/Pfjogbyy+h+E7DrS+CirUtmwRWnrIMV3n1K0KtNKWhGo9OZg7xIU3iMp2NSRFxp
         a9gAIH/OQHwcucxAepJdGhl3RmEC5Ezmkn79Hl9NH+XOp1fU1nkrJfW+tT5dDfXm9Nvc
         6DNcEQhWapteq0P+w5YmZVpYRF7isUTkkcjj8T0tz7x6Zk0bxnI5sNV2okBiNpBWSsy2
         5z6llE0Y5ZXE3EUmQw17Bk5gltDHMG+ADjujj+diIzt5Dx/w+AwWtksdHSqg8n4V2kKT
         3a9EL7Ym8tjxpFfPpDUu1qtYff2ZfO6Hc2PBOGG1DIRP2W/bXZH87/lSJBpUDCEe3Erw
         olGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=irSjOH1rsWyC7ymAj3+hKEv+lViAuiFrSbhZpdh05i4=;
        b=e7vwTxMRFUeeOp3++g3NsxIw/rUmX9FUg0vtSLuu+fdzpkTiYoCoJDR1AazJsUJXSf
         qPjwUDlyixeNB56krhPGItcIGo/GhiZNwNvPhuM+0Mk8CV9mx3+gFw+17wT6oQOjOrtn
         I6JzCxG4skwmr7M9yPj46fioZwhRdzJexVPpg+rk6Tr276qX0X1xsr8h2a8yp55ruxbn
         D13hiN9ei7mfgYUK4dOZOl8KcBEpwGfIz0MSehAe6zbeM7Wk8v29AqkH3Fn1HvpPRXVx
         SYVqa+desIpCWVkxgMoJIbeTRCgz5bcuQcRjIhsJLM76aNxKVCAXIeg2TInLcMX6BDQG
         q50Q==
X-Gm-Message-State: AOAM531xLXbKpy7oXclX5yjRb1WaSIvCWCn2fRjxTiqfN9u3DCtct7yZ
        Ysxkkl3FmoKRzzBXzlOJNxDiKmxd39bjVfAzf9vVVw==
X-Google-Smtp-Source: ABdhPJwFPNStB/JZSzXebW+Zw7G+bR71tooXpZuL+yVYrBRgxjREZtk/h+2jrGSTItJ7zkYJv0wcaHxnMi1UdSfJEMw=
X-Received: by 2002:a17:906:e241:: with SMTP id gq1mr3700173ejb.87.1628772673644;
 Thu, 12 Aug 2021 05:51:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210806132810.23556-1-brgl@bgdev.pl> <20210807084809.GA17852@sol>
 <CAMRc=McQOcWDexBeWKcA9CosxfG_59quusnVLYN7qu-p86BPag@mail.gmail.com>
 <20210808231012.GA6224@sol> <CAMRc=Me5N=gthd4ESrh5ChStEkHQmG1AuzKf6nZNbq2ZXtTrGQ@mail.gmail.com>
 <20210810103113.GA6637@sol> <CAMRc=MeKB4wmZw2FS79H0W75394MpzS6sq+2iehD4tXkdDGGzQ@mail.gmail.com>
 <20210812102913.GA21938@sol>
In-Reply-To: <20210812102913.GA21938@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Aug 2021 14:51:02 +0200
Message-ID: <CAMRc=MfzGh7ER4VankzR5qStbrW=hCxK-d_1rF+SzD3zik=z2w@mail.gmail.com>
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

On Thu, Aug 12, 2021 at 12:29 PM Kent Gibson <warthog618@gmail.com> wrote:
>

[snip]

> > >
> > > My preference would be for gpiod_line_config_set_output_value() and
> > > variants to also set the direction for those lines to output.
> > > And maybe rename it to gpiod_line_config_set_output().
> > > And maybe add a set_input for symmetry.
> > >
> >
> > Any naming idea for setting the direction to "AS_IS"?
> >
>
> Since as-is is vague you need to include the field name.
> So I would remove set_direction and replace it with set_input, set_output
> and set_direction_as_is (which I would expect to see used very rarely in
> the wild, as the only use case I can think of for it is undoing a
> set_input or set_output call).
>
> > > But my concern above was actually the secondary array - that confused me.
> > > And it's big - always. (OTOH it's on the heap so who cares?)
> > > The array is of size GPIO_V2_LINE_NUM_ATTRS_MAX, yet each entry could
> > > have multiple attributes set - so long as the offsets subsets match?
> > > What happens if both debounce and flags are set for the same subset?
> > > Looks like debounce wins and the flags get discarded in
> > > gpiod_line_config_to_kernel().
> > >
> >
> > Yeah, I aimed at ironing it out when writing tests. You're probably right here.
> >
>
> Same reason I hadn't paid much attention to the implementation.
>
> > > What I had in mind for the config was an array of config for each line,
> > > only performing the mapping to uAPI when the actual request or
> > > reconfigure is performed, though that requires knowledge of the number
> > > of lines in the request to be sized efficiently in the
> > > gpiod_line_config_new().  Sizing it as GPIO_V2_LINES_MAX would be even
> > > worse than your secondary array, so don't want that.
> >
> > Or would it? Currently the full config structure is 3784 bytes on a 64
> > bit arch. The base config is 32 bytes. If we added the default value
> > to base_config that would make it 36 bytes x GPIO_V2_LINES_MAX = 2304
> > bytes. We'd need another base_config for default settings.
> >
> > Unless I'm missing something this does seem like the better option.
> >
>
> Yikes, I overlooked the size of the offsets array in the secondary
> config - that is a significant contributor to the config size as well.
> For some reason I was thinking that was a bitmap, but that couldn't work.
>
> In that case a GPIO_V2_LINES_MAX sized array is clearly a better way to
> go, and that is a surprise.
> Though those array elements will require the line offset as well as the
> base_config, unless you have some other way to map offset to config?
>

No, but that's fine - see below.

> > > My Go library uses a map, but that isn't an option here.
> > > Resizing it dynamically is the option I was last pondering,
> > > but my preference would be to add a num_lines parameter to the new.
> > > Anyway, that was what I was wondering about...
> > >
> >
> > We could resize the array dynamically but we'd need to return error
> > codes from getters.
>
> Why? If there is no config for the requested line then you return the
> global default value, right?
> Why does that change if the array is resizable?
> Btw, I'm assuming that the gpiod_line_config would contain a pointer to
> the dynamic array, so the handle the user has would remain unchanged.
> And the getters all return ints, not pointers to internal fields.
> What am I missing?

Memory allocation failures when resizing.

>
> Also, "global default value" is different from the primary, right?
> Perhaps getters should return the primary value, which itself defaults
> to the global defaults, if the line doesn't have specific config?
>
> > We could also define the size when allocating the
> > config but it's a sub-par approach too.
> >
>
> Sure, it's a trade-off, but the alternative is requiring a 2-3k block
> even for a one line request, which seems a wee bit excessive.
>

As you said - it's on the heap, so who cares. But this is also an
internal structure and so we can use bit fields. That should reduce
the memory footprint significantly as we now don't require more than 3
bits for any given enum. That would leave us with the debounce period
and offset as full size variables.

Bart

> With the proposed API, the only other alternative I can see to give a
> small footprint is dynamic resizing, which I'm not thrilled by either.
> So just wanted to double check that you are content to lock in the
> gpiod_line_config_new API, as that will constrain any optimisation later
> on.
>
