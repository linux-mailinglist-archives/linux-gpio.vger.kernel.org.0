Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB163DB525
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 10:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhG3ImI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 04:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238107AbhG3ImH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 04:42:07 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107E3C0613C1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 01:42:02 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id yk17so7760529ejb.11
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 01:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZFTWYv7+g9dubrObjFBcEVhd6PNhFHQ2eRgI36MYn34=;
        b=qmjSjtaE4CtI6JPPBnQNKGWAS8+CUQtAL41rFNpSOEz/iVKiHBBjjeCz+ZnEVEHAIL
         ng3gNCiPOIEeIcxxIgRbEuf3qX+9qHxSKs5T25csCzIR7+YxoLvR17FU7rQYZ20ALoJL
         XA2t+7PtK4J50LNa1ZajTlWdkPDTjvmvisEWfwUGUman1V0LI/1J96B2HfIZSEH8c3pn
         wKH/LFDt6LSCXx8ROXnm5tqHLBa5BGhS+3AGvdtNZdRImkj9g5b0o9aGs9tp6K7Faf5o
         lcyyJDFk8WW1C9brh4F3PKA5kYh8x3MkInawsoS/LXkIZLvsVSJEjGdSYWC/H96B8rZg
         9k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZFTWYv7+g9dubrObjFBcEVhd6PNhFHQ2eRgI36MYn34=;
        b=R2sZByYzsVS1f5sdD9tKhN3s3M59eGj6JudDeXwToWYxISxlaP9EErMtZSQDr52Ega
         YZqe9AMj4RILx+LaZnvLM61gsVPhhidt0C85LjGvdfO4RrmDCiJIBgU5CXygXlxCiypZ
         PTyzjJ4j6NhNHWXvHWiTySrjg1hKkRJMbDJvQ2lbVBA8dlRbSKrC+Aq2KIVsBVmwi5ID
         0Oo0czd03V4+dNiR4lLOrqDSneFrAjKdU76NSeMSCfpWdjdgb6tqsnaiSCMk2NOKAKxf
         LVtx97seiefE4xA37gzEvGD005oyBU1kWcMaT7hclWnIcDUW/IsX8jLEv2wOhi38TXpd
         XBiQ==
X-Gm-Message-State: AOAM532ob2D0tuniqkudnK8I5o/ztimHa8crhbem1YWf7Mpg2M396/zb
        rIs/5lfit9qtDEpV49sqQqinNCO5Rylo06GafOntcw==
X-Google-Smtp-Source: ABdhPJxWQlHk5MRP/y17Sgc0R98uqBadTws1MBb4bu22E/ZgVI08ZJrPtkK+L8fs4FA0Jylwbn+V88c3wvXhi0NdwUU=
X-Received: by 2002:a17:906:384c:: with SMTP id w12mr1498695ejc.445.1627634520448;
 Fri, 30 Jul 2021 01:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210727143400.32543-1-brgl@bgdev.pl> <20210727143400.32543-4-brgl@bgdev.pl>
 <20210730064216.GA9544@sol>
In-Reply-To: <20210730064216.GA9544@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 30 Jul 2021 10:41:49 +0200
Message-ID: <CAMRc=MeZN-QLqumBm+3csjkpcr2_fMs_zOTzo8Yk1sW8wkyEww@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3 3/3] bindings: cxx: implement C++ bindings
 for libgpiod v2.0
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

On Fri, Jul 30, 2021 at 8:42 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Jul 27, 2021 at 04:34:00PM +0200, Bartosz Golaszewski wrote:
> > This is the bulk of work implementing C++ bindings for the new libgpiod
> > API. The tests are not converted yet but the examples are fully
> > functional. More details in the cover letter as this patch will be
> > squashed with the one for the core C library anyway.
> >
>
> My apologies for not getting around to reviewing v2, so here is a
> quick(??) review of v3...
>
> I don't have any problems with the C API changes in patches 1 and 2.
> I would prefer that we didn't need the num_lines, offsets and capacity
> getters, but their addition is a reasonable compromise.
>
> <snip>
>
> > -GPIOD_CXX_API bool is_gpiochip_device(const ::std::string& path)
> > +struct chip::impl
> >  {
> > -     return ::gpiod_is_gpiochip_device(path.c_str());
> > -}
> > +     impl(const ::std::string& path)
> > +             : chip(open_chip(path)),
> > +               name(::gpiod_chip_get_name(this->chip.get())),
> > +               label(::gpiod_chip_get_label(this->chip.get()))
> > +     {
> > +
> > +     }
> > +
> > +     impl(const impl& other) = delete;
> > +     impl(impl&& other) = delete;
> > +     impl& operator=(const impl& other) = delete;
> > +     impl& operator=(impl&& other) = delete;
> > +
> > +     void throw_if_closed(void) const
> > +     {
> > +             if (!this->chip)
> > +                     throw ::std::logic_error("GPIO chip has been closed");
> > +     }
> > +
>
> Perhaps throw something more specific than a logic_error?
>

There's no standard exception that would inherit from std::logic_error
that would fit here. I can define new exceptions (gpiod::chip_closed
and gpiod::request_released) inheriting from logic_error if that works
for you.

> <snip>
>
> > diff --git a/bindings/cxx/edge-event.cpp b/bindings/cxx/edge-event.cpp
> > new file mode 100644
> > index 0000000..d6dce22
> > --- /dev/null
> > +++ b/bindings/cxx/edge-event.cpp
> > @@ -0,0 +1,123 @@
> > +// SPDX-License-Identifier: LGPL-3.0-or-later
> > +// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
> > +
> > +#include <map>
> > +#include <stdexcept>
> > +#include <system_error>
> > +#include <utility>
> > +
> > +#include "internal.hpp"
> > +
> > +namespace gpiod {
> > +
> > +namespace {
> > +
> > +const ::std::map<int, edge_event::type> event_type_mapping = {
> > +     { GPIOD_LINE_EVENT_RISING_EDGE,         edge_event::type::RISING_EDGE },
> > +     { GPIOD_LINE_EVENT_FALLING_EDGE,        edge_event::type::FALLING_EDGE }
> > +};
> > +
>
> Use of a map for just two event types seems like overkill.
> Wouldn't an if-else in edge_event::get_type(void) be simpler and cleaner?
> Also, as written, edge_event::get_type(void) can throw std::out_of_range
> which doesn't seem right. Wouldn't std::range_error be more appropriate?
> Or adding an unknown event type for failed mappings, so get_type() can
> never throw??
>

While it's true that we can throw the range_error, it's very unlikely
and would occur only if a serious programming error was present in the
C library or the kernel. I'm fine with this possibility - adding an
unknown type, would suggest this is a normal situation and not an
exception.

For the mapping: to me this looks more consistent and also allows to
detect the rare and unlikely error mentioned above. In any case - this
is an implementation detail and can be changed later.

> Same applies for mappings throughout.  If the C++ values match the C
> values then you could just perform a range check and cast for the cases
> where there are more than two values.
>

Casting in general is to be avoided in C++ - as defined in the
document Jack linked recently. Mapping isn't expensive and looks more
robust IMO. I would prefer to leave it like this.

> <snip>
>
> > +     /**
> > +      * @brief Retrieve the current snapshot of line information for a
> > +      *        single line.
> > +      * @param offset Offset of the line to get the info for.
> > +      * @param watch Indicates whether the caller wants to watch for line
> > +      *              info changes.
> > +      * @return New ::gpiod::line_info object.
> > +      */
> > +     line_info get_line_info(unsigned int offset, bool watch = false) const;
> > +
> > +     /**
> > +      * @brief Wrapper around ::gpiod::chip::get_line_info that retrieves
> > +      *        the line info and starts watching the line for changes.
> > +      * @param offset Offset of the line to get the info for.
> > +      * @return New ::gpiod::line_info object.
> > +      */
> > +     line_info watch_line_info(unsigned int offset) const;
> > +
>
> I repeat my objection to get_line_info() accepting a watch parameter and
> watch_line_info() wrapping it.  While they both happen to return
> line_info, the purpose of the two methods are quite different and so
> should be kept separate.
>

OK, I will change it.

> Also, should be watch_line_info() really be allowed on a const chip?
> While it does not alter the C++ object, and so technically can be allowed
> on a const, it does alter the state of the underlying C object and so I
> would argue it should not be allowed.
>

Makes sense.

> <snip>
>
> > +     /**
> > +      * @brief Get the constant reference to the edge event at given index.
> > +      * @param index Index of the event in the buffer.
> > +      * @return Constant reference to the edge event.
> > +      */
> > +     const edge_event& get_event(unsigned int index) const;
> > +
> > +     /**
> > +      * @brief Get the number of edge events currently stored in the buffer.
> > +      * @return Number of edge events in the buffer.
> > +      */
> > +     unsigned int num_events(void) const;
> > +
>
> A getter not prefixed with "get_" ;-).
> (note that I'm kidding - I prefer it this way - more on that later in
> class line_info)
>
> > +     /**
> > +      * @brief Maximum capacity of the buffer.
> > +      * @return Buffer capacity.
> > +      */
> > +     unsigned int capacity(void) const noexcept;
> > +
>
> And again.
>
> <snip>
>
> > +/**
> > + * @brief Contains a set of line config options used in line requests and
> > + *        reconfiguration.
> > + */
> > +class line_config
> > +{
> > +public:
> > +
>
> This class has setters but no getters.
> There is no use case for getters?
> Also applies to C API - just wondering given the addition of the getters
> in patch 1 and 2 - there may be cases where the user would like to read
> back the config?
>

IMO if a use-case like this appears, we can extend the interface. The
reason for adding the new functions was because we added the all-lines
getters and now the user would need to store the offsets outside the
request if we didn't provide them. Adding getters for config
structures now would unnecessarily bloat the interface. Let me know if
you disagree though. I usually eventually get convinced by you. :)

> > +     /**
> > +      * @brief Direction settings.
> > +      */
> > +     enum class direction : unsigned int
> > +     {
> > +             AS_IS = 1,
> > +             /**< Request the line(s), but don't change current direction. */
> > +             INPUT,
> > +             /**< Request the line(s) for reading the GPIO line state. */
> > +             OUTPUT
> > +             /**< Request the line(s) for setting the GPIO line state. */
> > +     };
> > +
>
> line_info and line_config should use common direction types (also
> applies to C API)? Perhaps in a ::gpiod::line namespace?
>

So that would seem obvious to do this but the values stored in line
info and passed to line config are not always the same. BIAS_UNKNOWN
and BIAS_AS_IS are not the same and the former is only suitable for
line_info while the latter only works for the config. I agree though
that it may be a bit confusing for users. If we'd change it - where
should these go wrt doxygen sections of the core API?

> Same applies to other fields that map to GPIO_V2_LINE_FLAGs, so edge,
> drive, bias and event clock.
> Oh, and the C API lacks a gpiod_line_info_get_event_clock(), and not
> surprisingly class line_info lacks a getter for event clock.
>

Yeah I noticed that and already have a patch for that in my dev branch
for python bindings. I'll post it shortly.

> <snip>
>
> > +     /**
> > +      * @brief Move assignment operator.
> > +      * @param other Object to move.
> > +      * @return Reference to self.
> > +      */
> > +     line_config& operator=(line_config&& other) noexcept;
> > +
> > +     /**
> > +      * @brief Set the direction, either globally or for a set of offsets.
> > +      * @param dir_val New direction setting.
> > +      * @param offsets Vector of line offsets to set the direction for. If
> > +      *                empty, the setting will be global.
> > +      */
> > +     void set_direction(direction dir_val, const line_offsets& offsets = line_offsets()) const;
> > +
>
> Setters should not be const.
> While your implementation may allow it now, conceptually it is wrong.
> And what happens if your implementation changes later?
> Removing the const later would break ABI compatibility.
>
> This applies throughout.
>

Indeed.

> <snip>
>
> > +/**
> > + * @brief Contains an immutable snapshot of the line's state at the
> > + *        time when the object of this class was instantiated.
> > + */
> > +class line_info
> > +{
> > +public:
> > +
> > +     /**
> > +      * @brief Direction settings.
> > +      */
> > +     enum class direction : unsigned int
> > +     {
> > +             INPUT = 1,
> > +             /**< Direction is input - we're reading the state of a GPIO line. */
> > +             OUTPUT
> > +             /**< Direction is output - we're driving the GPIO line. */
> > +     };
> > +
>
> And as previously noted, I'd like to see the line_info and line_config
> use common types.
>
> And I agree with Jack Winch on not prefixing getters with "get_".
> The only thing I would change from Jack's suggestion is to put the types
> in the line namespace so rather than his
>
>     using direction_type = ::gpiod::direction;
>
> I would have
>
>     using direction_type = ::gpiod::line::direction;
>
> - if you want to use an alias at all.

I think we'll be able to skip the aliases with the additional line namespace.

>
> The types are used relatively rarely, so I'm no fussed if their names
> are a bit clunky.  OTOH getters are frequently used and I much prefer
> the shorter form.
>

Fair enough.

> Where you have an "enum class type" that would conflict with a type()
> getter, such as in info_event and edge_event, I would rename the enum to
> event_type, or similar.
>
> That applies throughout.
>
> Wrt setters, I'm happy with them being prefixed with "set_" so they are
> clearly distinguished from getters.
>
> <snip>
>
> > +/**
> > + * @brief Stores the context of a set of requested GPIO lines.
> > + */
> > +class line_request
> > +{
> > +public:
> > +
> <snip>
> > +
> > +     /**
> > +      * @brief Get the number of requested lines.
> > +      * @return Number of lines in this request.
> > +      */
> > +     unsigned int num_lines(void) const;
> > +
>
> More getters not prefixed with "get_" ;-).
>
> > +     /**
> > +      * @brief Get the list of offsets of requested lines.
> > +      * @return List of hardware offsets of the lines in this request.
> > +      */
> > +     line_offsets offsets(void) const;
> > +
>
> And again.
>
> <snip>
>
> > +template<class enum_type, void global_func(::gpiod_line_config*, int),
> > +      void subset_func(::gpiod_line_config*, int, unsigned int, const unsigned int*)>
> > +void set_mapped_value(::gpiod_line_config* config, enum_type value,
> > +                   const line_offsets& offsets, const ::std::map<enum_type, int>& mapping)
> > +{
> > +     int mapped_val = mapping.at(value);
> > +
>
> This can throw ::std::out_of_range, which set_mapped_value() should catch
> and re-throw as ::std::invalid_argument.
>

Makes sense.

> The use of templating means mapping using ::std::map in this direction
> makes more sense than the reverse in the other modules, but I'm still not
> a fan.
>
> <snip>
>
> > +void line_request::impl::throw_if_released(void) const
> > +{
> > +     if (!this->request)
> > +             throw ::std::logic_error("GPIO lines have been released");
> > +}
> > +
>
> Throw a more specific exception, rather than a generic logic_error.
>
> <snip>
>
> Hopefully I haven't snipped out too much...
>
> Cheers,
> Kent.

Thanks Kent for the thorough - as always - review!

Bart
