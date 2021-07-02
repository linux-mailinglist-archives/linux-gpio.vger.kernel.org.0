Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99BB53B9FE6
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 13:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbhGBLla (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 07:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbhGBLla (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 07:41:30 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC900C061762
        for <linux-gpio@vger.kernel.org>; Fri,  2 Jul 2021 04:38:57 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id f11so5461175plg.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jul 2021 04:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ch2/h8oRtF0X4I2baF45Lch0PdYqpy7xQ3pSbXQ1gyA=;
        b=UeqJMwGJfYFySWa29FF3b85YdAPAPwQaumxe1wrO0zTpzrMofXILKJ8oyUC6YmKrxT
         mvEvpIEaLOV3Xg0iRFsd/bStHBPHaL5rhfWGeoCnSAOmyXYQhHeSQn+GF0WN8+g5TDFg
         aWiFU9sFgxvzg+WyJHaONTVQah3GJOSYiny2gsmeTZe3/REH2zS1v6TcfG4SKjMHM/ba
         +cNUpiEW+qb0mYqgt4Bon17mzLbO7gKG3RqH2McIVv0Wfkad1Ee9ljOpmy7fUHgt04ZF
         Ha6a4dxHMUK/KE1xgwZV8reVby04TvSJAu1AQBayIhivjzwcaE9/6xCd3vtyhUSl613g
         vMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ch2/h8oRtF0X4I2baF45Lch0PdYqpy7xQ3pSbXQ1gyA=;
        b=VSby/vJZTujY/Jn6W1fPpgfKFhwTm12GGXWe7kydAkv0tAb1R5sWPyq9Mdw39+yGiu
         1d1lYvDSy3InpPxMpbaVKY7CZE4xTZWOGqSpkaywNT7Bwl32AcIjVg9vxEn9SXsSig0t
         36wBi9R6I9PGs2xbLUIexa+Jo1vQByZd8bR1hW4biXYw2qFO2WikoHPRyeVctWY02kZP
         fbqOFc2xh5a6e9/UheqczNyHfpkmDsOXM2cmqwBxHyLp3Cxa2bGf69xEqbdcjxpzNctA
         /w3S7hhdKXGNjkMSqPEnMHzD9HhxO6ngnntcG2eGaM3m8auENzoArFlvtV4el/xnXICN
         YBjQ==
X-Gm-Message-State: AOAM533PVwxF8UZPLY3WltKAVD8aC1Q34FngQTPhlRV7RhwVyTG1/PnY
        oScMM8L2XjFOxvJ5HEH5Y0I=
X-Google-Smtp-Source: ABdhPJwnvQc9wW5BRlOsNZ6U/IyxChcbTJK56wo2iJ3pUGORPftTCqMr11a2k/XVobuozOgTcrjPIw==
X-Received: by 2002:a17:90a:de17:: with SMTP id m23mr2663621pjv.195.1625225937211;
        Fri, 02 Jul 2021 04:38:57 -0700 (PDT)
Received: from sol (106-69-174-4.dyn.iinet.net.au. [106.69.174.4])
        by smtp.gmail.com with ESMTPSA id j20sm3182776pfc.85.2021.07.02.04.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 04:38:56 -0700 (PDT)
Date:   Fri, 2 Jul 2021 19:38:51 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH 4/4] bindings: cxx: implement C++ bindings for
 libgpiod v2.0
Message-ID: <20210702113851.GA22381@sol>
References: <20210621191830.10628-1-brgl@bgdev.pl>
 <20210621191830.10628-5-brgl@bgdev.pl>
 <20210627084757.GA21720@sol>
 <CAMRc=Mc85NCQRWf7U4t=dtnH4fC=i8Z771aRuMtCdxcsXupaAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc85NCQRWf7U4t=dtnH4fC=i8Z771aRuMtCdxcsXupaAA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 02, 2021 at 10:50:57AM +0200, Bartosz Golaszewski wrote:
> On Sun, Jun 27, 2021 at 10:48 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip]
> 
> >
> > And dislike converting the chip to a bool - it isn't intuitive that
> > it should mean the underlying handle is open.  Provide a suitably named
> > method instead, say is_open() or is_closed()?
> >
> > Similar comment for line_request.
> >
> 
> It's actually a common pattern in STL. I find overloaded operators
> more intuitive for checking the state of the wrapping object as
> opposed to getters for reading the state and properties of the
> associated GPIO chip character device stored in said object.
> 

I understand it for simple wrappers like the smart pointers and streams,
but those are very single purpose - chips and line_requests aren't.

If you are using it as a "good to go" indicator then document it
as that, rather than specifically tying to some internal state like the
handle being open.  Does the user even need to know about the handle -
isn't that implementation detail in the pimpl?

> [snip]
> 
> > > +
> > > +     /**
> > > +      * @brief Retrieve the current snapshot of line information for a
> > > +      *        single line.
> > > +      * @param offset Offset of the line to get the info for.
> > > +      * @param watch Indicates whether the caller wants to watch for line
> > > +      *              info changes.
> > > +      * @return New ::gpiod::line_info object.
> > > +      */
> > > +     line_info get_line_info(unsigned int offset, bool watch = false) const;
> > > +
> >
> > What is the benefit of the watch option here?
> > It is clearer to keep the get_line_info() and watch_line_info() distinct,
> > as they are in the C API.
> >
> 
> Actually I would have used this pattern in the C API if I could
> overload functions or provide default values for arguments.
> watch_line_info(0) is just a helper for get_line_info(0, true). I
> would even be fine with just get_line_info() alone with a switch for
> watching the lines but since we already have gpiod_watch_line_info(),
> I decided to replicate it here.
> 

Fair enough if you have multiple parameter values, like for bias or drive,
but for a bool it is frequently clearer and simpler to split it into two
functions - IMHO.

Further, watch is a very uncommon use case, so I'd prefer to keep them
separate - the average user doesn't even need to know that the watch
capability exists.

> [snip]
> 
> > > +
> > > +     /**
> > > +      * @brief Constructor.
> > > +      * @param direction Global direction setting.
> > > +      * @param output_values Default output values.
> > > +      * @param edge Global edge detection.
> > > +      * @param bias Global bias setting.
> > > +      * @param drive Global drive setting.
> > > +      * @param active_low Global active_low setting.
> > > +      * @param debounce_period Global debounce period in microseconds.
> > > +      * @param event_clock Default event clock mode.
> > > +      */
> > > +     line_config(int direction = DIRECTION_INPUT,
> > > +                 const line_value_mappings& output_values = no_output_values,
> > > +                 int edge = EDGE_NONE, int bias = BIAS_AS_IS,
> > > +                 int drive = DRIVE_PUSH_PULL, bool active_low = false,
> > > +                 unsigned long debounce_period = 0,
> > > +                 int event_clock = EVENT_CLOCK_MONOTONIC);
> > > +
> >
> > The parameter ordering should follow the probability of use?
> > So I would make active_low earlier, before edge and output_values.
> > And maybe output_values after edge?
> >
> 
> Yeah this was my goal. active_low could come before bias and drive but
> after output_values IMO. edge could come earlier too (before
> output_values).
> 

So you suggest direction, edge, output_values, active_low, bias, drive?

Perhaps you use active low a lot less than I do :-).

I figured that, even if active low is used less frequently than output, 
forcing output users to provide active level was less demanding than
having active level users provide empty ouputs, so I bumped it before
output.  Similarly edge, though I was more on the fence on that one.

> [snip]
> 
> > > +
> > > +     /**
> > > +      * @brief Set the output values for a set of line offsets.
> > > +      * @param offsets Vector of line offsets for which to set output values.
> > > +      * @param values Vector of new line values with indexes of values
> > > +      *               corresponding to the indexes of offsets.
> > > +      */
> > > +     void set_output_values(const line_offsets& offsets, const line_values& values) const;
> > > +
> >
> > Painful that the user has to keep track of the offsets independent of
> > the request.  Any way to provide a method that applies values to the
> > requested lines without explicitly providing the offsets?
> > See related get_values() comments below...
> >
> 
> I think we already discussed this under the C API patches. The line
> config object can live independently from the request config. We could
> theoretically pass an array containing just values (with the value at
> given index later assigned to the offset at the same index in the
> request config) but that would make it less clear IMO. In most cases
> the user will already have an array containing the offsets ready in
> order to pass it to the request method. I think you mentioned
> previously some Go feature that allowed you to do it differently but
> in C it's not really possible.
> 
> > And in general, what happens if the offsets provided aren't a subset of
> > the requested offsets?  That applies to the C API as well.
> >
> 
> At request-time we'll return EINVAL from set_kernel_output_values()
> (or in the case of C++ - we'll throw a system_error exception).
> 
> [snip]
> 
> > > +
> > > +     /**
> > > +      * @brief Check if this line is debounced (either by hardware or by the
> > > +      *        kernel software debouncer).
> > > +      * @return True if the line is debounced, false otherwise.
> > > +      */
> > > +     bool debounced(void) const noexcept;
> > > +
> >
> > Not sure if I had the same comment for the C API, but what is the
> > benefit of this given it is equivalent to debounce_period() == 0?
> >
> 
> Clarity of the resulting code.
> 
> if (info.debounced())
> 
> is clearer than
> 
> if (info.debounce_period())
> 
> if you're only checking if debouncing is enabled and not what the period is.
> 
> [snip]
> 
> > > +
> > > +     /**
> > > +      * @brief Check if the object is associated with an open GPIO chip.
> > > +      * @return True if the chip is open, false if it has been closed.
> > > +      */
> > > +     explicit operator bool(void) const noexcept;
> >
> > This is even less intuitive than for chip.
> > It could mean chip is open, or line is requested, or ...
> > So make it a method with an appropriate name instead.
> >
> 
> Well it would be much less confusing if I didn't stupidly copy-paste
> the comment from the chip... It was supposed to say: Check if this
> request hasn't been released or something along those lines.
> 
> [snip]
> 
> > > +
> > > +     /**
> > > +      * @brief Read the values of a subset of requested lines.
> > > +      * @param offsets Vector of line offsets
> > > +      * @return Vector of lines values with indexes of values corresponding
> > > +      *         to those of the offsets.
> > > +      */
> > > +     line_values get_values(const line_offsets& offsets) const;
> > > +
> >
> > A common use case would be to get all lines in the request.
> > As written, to do that the user needs to maintain their own copy of the
> > offsets.
> >
> > Maybe if offsets is empty then returns all requested lines?  And provide
> > line_offsets() as a default parameter?
> >
> > Same argument applies for the C API.
> > In gpiod.h you could rename the existing _get_values() to
> >
> > int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
> >                                   unsigned num_lines,
> >                                   const unsigned int *offsets, int *values);
> >
> > and add
> >
> > int gpiod_line_request_get_values(struct gpiod_line_request *request, int *values);
> >
> > Or interpret a zero offsets param to mean use the requested offsets??
> >
> 
> Hmm, I can't find it now but I could swear we discussed this
> previously and you raised some issue with this. I'm definitely in
> favor of that so let me add it in the next iteration.
> 

Perhaps you are thinking of the discussion we had regarding
line_config all/offset/subset variants?
I think we just forgot to apply the same logic to the get/sets here.
I don't recall having any problem with it, but if anything comes to me
I'll let you know.

> [snip]
> 
> > > +
> > > +     /**
> > > +      * @brief Constructor.
> > > +      * @param offsets Vector of line offsets to request.
> > > +      * @param consumer Consumer name.
> > > +      * @param event_buffer_size Event buffer size.
> > > +      */
> > > +     request_config(const line_offsets& offsets = line_offsets(),
> > > +                    const ::std::string& consumer = ::std::string(),
> > > +                    unsigned int event_buffer_size = 0);
> > > +
> >
> > When would you call this without providing offsets?
> 
> This is to mirror the C API which allows to create an empty request
> config. If the user never sets the offsets, we'll catch that at
> request-time.
> 

Yeah, I get that, but when would a user ever need an empty
request_config?  If they never need it then why give them the option?
That also applies to the C API.

Is there ever a need to mutate the offsets in the request_config?
If not, just make the offsets manditory in the new/constructor?
Just putting the idea out there.


All minor points, so fine whichever way you go with them.

Cheers,
Kent.
