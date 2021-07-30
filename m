Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AF53DB6FA
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 12:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238274AbhG3KMY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 06:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238468AbhG3KMX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 06:12:23 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C78C061765
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:12:18 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ca5so14413981pjb.5
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 03:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QqO96PRHbv0/oWprX9RIVTwNsc8vFZDnzhc4a8+gkG4=;
        b=RqvCH2EdXsblP5wz/mmcLE0I4omnGtYg39k/7zYdw6D8fILVYiMsVny8EN8eOyLbCf
         W+qdosuTo/IUSOuesUE0Nq4GHCrfusL2TaNY00l9lAvwpL26nzCrqA+Ah29C4hblvHLF
         US3y++wTtZWGiuTfAmLuW2T1mYc1dqg5tKy/DKQ9oSRysD5bYtltXc/4gpd/HX2M+9BH
         Y4Oi0j8oVxxTGexxOWO8OPS4H6lF0N1d7FlVMlHjoyO+YuGWy7YESkPYqT5pT0As9R3H
         WsJkD5VLoGKgrgoeSCDItju/oBYreOkUwaW4eQDl+VH+NrhLUFgCrtfVANgW6U/iItqD
         FoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QqO96PRHbv0/oWprX9RIVTwNsc8vFZDnzhc4a8+gkG4=;
        b=aTXxIrGICU3WRz1COGigs6tDXHn26pObts8FzQ6KwwsixKhune4YD4F+F9YCDtggeg
         D9e5kgfHyYuif5TdHUmIuTxco3w6mCMZmVjaGXFppUjrnE8SMiaUpqIwSdQcs079uuBq
         sE250kr5NVGvdXQ9KYVY2GKAVg29uxOsK7o2onuZvOWqWjeRdZ43w62axtV5osnA8HpS
         RZ1IrmYTHzvTxDWa72Tn8yoGlQhKoxnqpupJNXRXTu8hI+QlPpwxv24ENXJpgEklCzNs
         E3ZP3Im28rZtXb+tSS+gUTjEZr50SyaX/Cx7T7A9JGnun/30/pNgaHhl9vRvfJOfQDLb
         LzRg==
X-Gm-Message-State: AOAM532mq8FzqeZ7tTjbBG/d8APdlXRF9MaSkSUbxh2OV57W2azsP53h
        sffYtTWfT8RrfsYZOU4DDmo=
X-Google-Smtp-Source: ABdhPJzLNHhojnwhzmVqBk49PIFHiDySpihqaqKoJFixXv8YEdNLsT5jTwzoeNgBqRNfrBrTnO1hww==
X-Received: by 2002:aa7:808b:0:b029:3a9:c8c1:3e3a with SMTP id v11-20020aa7808b0000b02903a9c8c13e3amr2149634pff.16.1627639938002;
        Fri, 30 Jul 2021 03:12:18 -0700 (PDT)
Received: from sol (106-69-176-40.dyn.iinet.net.au. [106.69.176.40])
        by smtp.gmail.com with ESMTPSA id d20sm1756748pfn.219.2021.07.30.03.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 03:12:17 -0700 (PDT)
Date:   Fri, 30 Jul 2021 18:12:11 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod][PATCH v3 3/3] bindings: cxx: implement C++ bindings
 for libgpiod v2.0
Message-ID: <20210730101211.GA28949@sol>
References: <20210727143400.32543-1-brgl@bgdev.pl>
 <20210727143400.32543-4-brgl@bgdev.pl>
 <20210730064216.GA9544@sol>
 <CAMRc=MeZN-QLqumBm+3csjkpcr2_fMs_zOTzo8Yk1sW8wkyEww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeZN-QLqumBm+3csjkpcr2_fMs_zOTzo8Yk1sW8wkyEww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 10:41:49AM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 30, 2021 at 8:42 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Jul 27, 2021 at 04:34:00PM +0200, Bartosz Golaszewski wrote:
> > > This is the bulk of work implementing C++ bindings for the new libgpiod
> > > API. The tests are not converted yet but the examples are fully
> > > functional. More details in the cover letter as this patch will be
> > > squashed with the one for the core C library anyway.
> > >
> >
> > My apologies for not getting around to reviewing v2, so here is a
> > quick(??) review of v3...
> >
> > I don't have any problems with the C API changes in patches 1 and 2.
> > I would prefer that we didn't need the num_lines, offsets and capacity
> > getters, but their addition is a reasonable compromise.
> >
> > <snip>
> >
> > > -GPIOD_CXX_API bool is_gpiochip_device(const ::std::string& path)
> > > +struct chip::impl
> > >  {
> > > -     return ::gpiod_is_gpiochip_device(path.c_str());
> > > -}
> > > +     impl(const ::std::string& path)
> > > +             : chip(open_chip(path)),
> > > +               name(::gpiod_chip_get_name(this->chip.get())),
> > > +               label(::gpiod_chip_get_label(this->chip.get()))
> > > +     {
> > > +
> > > +     }
> > > +
> > > +     impl(const impl& other) = delete;
> > > +     impl(impl&& other) = delete;
> > > +     impl& operator=(const impl& other) = delete;
> > > +     impl& operator=(impl&& other) = delete;
> > > +
> > > +     void throw_if_closed(void) const
> > > +     {
> > > +             if (!this->chip)
> > > +                     throw ::std::logic_error("GPIO chip has been closed");
> > > +     }
> > > +
> >
> > Perhaps throw something more specific than a logic_error?
> >
> 
> There's no standard exception that would inherit from std::logic_error
> that would fit here. I can define new exceptions (gpiod::chip_closed
> and gpiod::request_released) inheriting from logic_error if that works
> for you.
> 

Exactly what I had in mind.

> > <snip>
> >
> > > diff --git a/bindings/cxx/edge-event.cpp b/bindings/cxx/edge-event.cpp
> > > new file mode 100644
> > > index 0000000..d6dce22
> > > --- /dev/null
> > > +++ b/bindings/cxx/edge-event.cpp
> > > @@ -0,0 +1,123 @@
> > > +// SPDX-License-Identifier: LGPL-3.0-or-later
> > > +// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
> > > +
> > > +#include <map>
> > > +#include <stdexcept>
> > > +#include <system_error>
> > > +#include <utility>
> > > +
> > > +#include "internal.hpp"
> > > +
> > > +namespace gpiod {
> > > +
> > > +namespace {
> > > +
> > > +const ::std::map<int, edge_event::type> event_type_mapping = {
> > > +     { GPIOD_LINE_EVENT_RISING_EDGE,         edge_event::type::RISING_EDGE },
> > > +     { GPIOD_LINE_EVENT_FALLING_EDGE,        edge_event::type::FALLING_EDGE }
> > > +};
> > > +
> >
> > Use of a map for just two event types seems like overkill.
> > Wouldn't an if-else in edge_event::get_type(void) be simpler and cleaner?
> > Also, as written, edge_event::get_type(void) can throw std::out_of_range
> > which doesn't seem right. Wouldn't std::range_error be more appropriate?
> > Or adding an unknown event type for failed mappings, so get_type() can
> > never throw??
> >
> 
> While it's true that we can throw the range_error, it's very unlikely
> and would occur only if a serious programming error was present in the
> C library or the kernel.

No - you will currently throw ::std::out_of_range, which is weird.
I'd be ok with ::std::range_error, but that would involve a catch
and re-throw.

And it could also happen if the kernel adds new event types that this
version of the library is unaware of.
While that isn't terribly likely, don't box yourself in.

> I'm fine with this possibility - adding an
> unknown type, would suggest this is a normal situation and not an
> exception.
> 

Fair enough.
That suggestion was coming from "a simple getter shouldn't throw" PoV,
btw.

> For the mapping: to me this looks more consistent and also allows to
> detect the rare and unlikely error mentioned above. In any case - this
> is an implementation detail and can be changed later.
> 
> > Same applies for mappings throughout.  If the C++ values match the C
> > values then you could just perform a range check and cast for the cases
> > where there are more than two values.
> >
> 
> Casting in general is to be avoided in C++ - as defined in the
> document Jack linked recently. Mapping isn't expensive and looks more
> robust IMO. I would prefer to leave it like this.
> 

If casting is so frowned upon then why have they defined so many types
of casts?  I thought the trick was to pick the right one ;-).
And we are only talking about casting between int enums here, so
really...

> > <snip>
> >
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
> > > +     /**
> > > +      * @brief Wrapper around ::gpiod::chip::get_line_info that retrieves
> > > +      *        the line info and starts watching the line for changes.
> > > +      * @param offset Offset of the line to get the info for.
> > > +      * @return New ::gpiod::line_info object.
> > > +      */
> > > +     line_info watch_line_info(unsigned int offset) const;
> > > +
> >
> > I repeat my objection to get_line_info() accepting a watch parameter and
> > watch_line_info() wrapping it.  While they both happen to return
> > line_info, the purpose of the two methods are quite different and so
> > should be kept separate.
> >
> 
> OK, I will change it.
> 
> > Also, should be watch_line_info() really be allowed on a const chip?
> > While it does not alter the C++ object, and so technically can be allowed
> > on a const, it does alter the state of the underlying C object and so I
> > would argue it should not be allowed.
> >
> 
> Makes sense.
> 
> > <snip>
> >
> > > +     /**
> > > +      * @brief Get the constant reference to the edge event at given index.
> > > +      * @param index Index of the event in the buffer.
> > > +      * @return Constant reference to the edge event.
> > > +      */
> > > +     const edge_event& get_event(unsigned int index) const;
> > > +
> > > +     /**
> > > +      * @brief Get the number of edge events currently stored in the buffer.
> > > +      * @return Number of edge events in the buffer.
> > > +      */
> > > +     unsigned int num_events(void) const;
> > > +
> >
> > A getter not prefixed with "get_" ;-).
> > (note that I'm kidding - I prefer it this way - more on that later in
> > class line_info)
> >
> > > +     /**
> > > +      * @brief Maximum capacity of the buffer.
> > > +      * @return Buffer capacity.
> > > +      */
> > > +     unsigned int capacity(void) const noexcept;
> > > +
> >
> > And again.
> >
> > <snip>
> >
> > > +/**
> > > + * @brief Contains a set of line config options used in line requests and
> > > + *        reconfiguration.
> > > + */
> > > +class line_config
> > > +{
> > > +public:
> > > +
> >
> > This class has setters but no getters.
> > There is no use case for getters?
> > Also applies to C API - just wondering given the addition of the getters
> > in patch 1 and 2 - there may be cases where the user would like to read
> > back the config?
> >
> 
> IMO if a use-case like this appears, we can extend the interface. The
> reason for adding the new functions was because we added the all-lines
> getters and now the user would need to store the offsets outside the
> request if we didn't provide them. Adding getters for config
> structures now would unnecessarily bloat the interface. Let me know if
> you disagree though. I usually eventually get convinced by you. :)
> 

Agreed keep the interface minimal and easy enough to add later if the need
arises.  Just throwing it out there in case there are use cases I've
overlooked.

> > > +     /**
> > > +      * @brief Direction settings.
> > > +      */
> > > +     enum class direction : unsigned int
> > > +     {
> > > +             AS_IS = 1,
> > > +             /**< Request the line(s), but don't change current direction. */
> > > +             INPUT,
> > > +             /**< Request the line(s) for reading the GPIO line state. */
> > > +             OUTPUT
> > > +             /**< Request the line(s) for setting the GPIO line state. */
> > > +     };
> > > +
> >
> > line_info and line_config should use common direction types (also
> > applies to C API)? Perhaps in a ::gpiod::line namespace?
> >
> 
> So that would seem obvious to do this but the values stored in line
> info and passed to line config are not always the same. BIAS_UNKNOWN
> and BIAS_AS_IS are not the same and the former is only suitable for
> line_info while the latter only works for the config.

Sure they are distinct - so give them different values in the C API.
line_info will never return BIAS_AS_IS, and line_config will reject
setting BIAS_UNKNOWN.  So document that.

On a related note, the C API should have a GPIOD_LINE_CONFIG_BIAS_AS_IS,
and that should be the default - as it is in the kernel.
GPIOD_LINE_CONFIG_BIAS_DISABLED is actively disabling bias, which is a
different thing.
Or are you intending for libgpiod to always actively specify bias?

> I agree though
> that it may be a bit confusing for users. If we'd change it - where
> should these go wrt doxygen sections of the core API?
> 

You would think that doxygen should be subservient to the code, not the
other way around :-|.

Given I'm suggesting the GPIOD_LINE_CONFIG_xxx enums get folded into
the GPIOD_LINE_xxx enums, they would end up wherever those are?

Cheers,
Kent.

