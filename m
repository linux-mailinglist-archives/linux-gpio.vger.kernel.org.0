Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF514F0454
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Apr 2022 17:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357161AbiDBPPn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Apr 2022 11:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240827AbiDBPPm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Apr 2022 11:15:42 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D31A436B4A
        for <linux-gpio@vger.kernel.org>; Sat,  2 Apr 2022 08:13:46 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id c10so11435293ejs.13
        for <linux-gpio@vger.kernel.org>; Sat, 02 Apr 2022 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uUyJxZ/oyYrro0RhPeyz272MP1etRHmXpUoKVuCLn3g=;
        b=uHFRVL+F6Xxie/Gnfx/OkmIzEyx+J+bvnW/DJCkLHVrsvRqdt01YiT+DNQNi/zJf2/
         6UQX64+oFzxnthlfMfncLKV51u04mMsoOjIselr0uQ8uh/xPOI1BzW1VwEGu0U45SJ9u
         YiIEMF+z5bhq9DHGQ2MG00ZGUTRmKnvrBc4ZAjpetX5/cC9URQQALxK2IXjHanZYc4Y8
         NVHuAtYCw1CQvi8wKNqxBnqi3SoFaAht8QDjdjbiuJP9IzABoAO0eZzy3XeDC/nKEeHO
         Aw1j+2SZ60YAZlzLtdYc24YMggPm7pGELtt1rLJqBk6eFMlTbtQwNDxQOCG9zrbxoUP+
         EkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uUyJxZ/oyYrro0RhPeyz272MP1etRHmXpUoKVuCLn3g=;
        b=3NbV5do5Di3CzQc8/vB3dioWDgLoWzKU2QAjQzbGbWIS+q556rM7GFMouvHBnxs1ey
         MrgBNx3/MmM/M9xoXKxhsxeQ+cp07oIhChbufxTAdNJJkDR1CCj/uVMmOx/EaECJtZMQ
         2QlMA1WZvMbGJgdqwB1wAjI5FboQ6f5slFkhk6mfXeyP6CCTcmxtk7Ps+tNEc/we0dOt
         ulbmLqQOdYilzudd6LlBfzaPhc5PtCN7KFmMnjXOHKcnbgN98IXBFGMng0o5Tegmfw0Z
         DT7jEEI6p0zbVdT5+JPvAnzFteEHsXRIXd7aM2xrRnjdcEd2KBKTm/BphUjpeVY1F0aD
         GvsA==
X-Gm-Message-State: AOAM533COYtEZhmioCMBePZQfO9hGcxQRzmiy356cSrrg+XU8SyolzbE
        OuLiJzwO6508G6oD0lKe9GfXHU9O0UHwo24PUcDz5pQX8WoaDg==
X-Google-Smtp-Source: ABdhPJxbzpf6hO7GrFWHwpOfczDYl6ZVoAmLR2aIIWiPixsD/TNg7pXbRL9/HsPTrYUwE7Y26HPpb3H//lr9TYP3lEY=
X-Received: by 2002:a17:907:968e:b0:6db:aed5:43c8 with SMTP id
 hd14-20020a170907968e00b006dbaed543c8mr4131968ejc.636.1648912425189; Sat, 02
 Apr 2022 08:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220323142236.670890-1-brgl@bgdev.pl> <20220327122153.GA24870@sol>
In-Reply-To: <20220327122153.GA24870@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 2 Apr 2022 17:13:34 +0200
Message-ID: <CAMRc=Mcpqk2mrin3XfemY-DXDUpYN91oLr6d9jZJr9rTjwurRQ@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v5] bindings: cxx: implement C++ bindings for
 libgpiod v2.0
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 27, 2022 at 2:22 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Wed, Mar 23, 2022 at 03:22:36PM +0100, Bartosz Golaszewski wrote:
> > This rewrites the C++ bindings for libgpiod in order to work with v2.0
> > version of the C API. The C++ standard use is C++17 which is well
> > supported in GCC. The documentation covers the entire API so for details
> > please refer to it, the tests and example programs.
> >
>
> So C++17 for cxx bindings, but still C89 for core?
> Maybe time to switch that to C99?
>

I'm not saying no, but what would we gain from that in C that isn't
already provided by the gnu89 standard we're using? Declaring
variables in for loops if all I can think of and that's not really
useful for us as we're not providing lots of for_each type macros.

> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> Would've been nice to split this into several patches to make it more
> manageable.  As it is I'm reluctant to suggest any changes as I really
> don't want to see this go to a v6 :-(.
>
> Maybe a patch each for headers, impl, tests and examples?
> If nothing else that would be a better order than what we find below.
> My comments below may be misordered for the same reason.
>

Will do in the next iteration.

> Alternatively, I don't have any major issues with this patch, so I would
> also be ok with applying it as is and refining it from there.
>
> Btw, I no longer actively use C++, so I'm not a good judge of what is
> idomatic, I'm just pointing out what looks odd to me.
>

Yeah I need to make a list of C++ people who contributed code to
libgpiod before and Cc them next time.

[snip]

>
> No tests for line.cpp?
> Should still be some tests for the streaming operators, even if it is
> just to provide an example of what to expect.
>

I ran the code with gcov and all those stream operators are already
tested in other places, no need to be that redundant. I even skipped
the tests for stream operators on purpose for objects logically
"embedded" in other objects (like chip_info).

> >  create mode 100644 bindings/cxx/tests/tests-misc.cpp
> >  create mode 100644 bindings/cxx/tests/tests-request-config.cpp
> >
>
> [snip]
>
> > diff --git a/bindings/cxx/examples/gpiomoncxx.cpp b/bindings/cxx/examples/gpiomoncxx.cpp
> > index 4d6ac6e..db053dd 100644
> > --- a/bindings/cxx/examples/gpiomoncxx.cpp
> > +++ b/bindings/cxx/examples/gpiomoncxx.cpp
> > @@ -3,29 +3,27 @@
> >
> >  /* Simplified C++ reimplementation of the gpiomon tool. */
> >
> > -#include <gpiod.hpp>
> > -
> > +#include <chrono>
> >  #include <cstdlib>
> > +#include <gpiod.hpp>
> >  #include <iostream>
> >
> >  namespace {
> >
> > -void print_event(const ::gpiod::line_event& event)
> > +void print_event(const ::gpiod::edge_event& event)
> >  {
> > -     if (event.event_type == ::gpiod::line_event::RISING_EDGE)
> > +     if (event.type() == ::gpiod::edge_event::event_type::RISING_EDGE)
> >               ::std::cout << " RISING EDGE";
> > -     else if (event.event_type == ::gpiod::line_event::FALLING_EDGE)
> > -             ::std::cout << "FALLING EDGE";
> >       else
> > -             throw ::std::logic_error("invalid event type");
> > +             ::std::cout << "FALLING EDGE";
> >
> >       ::std::cout << " ";
> >
> > -     ::std::cout << ::std::chrono::duration_cast<::std::chrono::seconds>(event.timestamp).count();
> > +     ::std::cout << event.timestamp_ns() / 1000000000;
> >       ::std::cout << ".";
> > -     ::std::cout << event.timestamp.count() % 1000000000;
> > +     ::std::cout << event.timestamp_ns() % 1000000000;
> >
> > -     ::std::cout << " line: " << event.source.offset();
> > +     ::std::cout << " line: " << event.line_offset();
> >
> >       ::std::cout << ::std::endl;
> >  }
> > @@ -39,25 +37,36 @@ int main(int argc, char **argv)
> >               return EXIT_FAILURE;
> >       }
> >
> > -     ::std::vector<unsigned int> offsets;
> > +     ::gpiod::line::offsets offsets;
> >       offsets.reserve(argc);
> >       for (int i = 2; i < argc; i++)
> >               offsets.push_back(::std::stoul(argv[i]));
> >
> >       ::gpiod::chip chip(argv[1]);
> > -     auto lines = chip.get_lines(offsets);
> > -
> > -     lines.request({
> > -             argv[0],
> > -             ::gpiod::line_request::EVENT_BOTH_EDGES,
> > -             0,
> > -     });
> > +     auto request = chip.request_lines(
> > +                     ::gpiod::request_config({
> > +                             { ::gpiod::request_config::property::OFFSETS, offsets},
> > +                             { ::gpiod::request_config::property::CONSUMER, "gpiomoncxx"},
> > +                     }),
> > +                     ::gpiod::line_config({
> > +                             {
> > +                                     ::gpiod::line_config::property::DIRECTION,
> > +                                     ::gpiod::line::direction::INPUT
> > +                             },
> > +                             {
> > +                                     ::gpiod::line_config::property::EDGE,
> > +                                     ::gpiod::line::edge::BOTH
> > +                             }
> > +                     }));
> > +
>
> Would be good to close the chip to highlight the fact that the chip is not
> required once the lines are requested.
>

There's a special test case for that already elsewhere.

> Or use ::gpiod::request_lines(path,request_config,line_config) to
> request the lines.
>
> > +     ::gpiod::edge_event_buffer buffer;
> >
> >       for (;;) {
> > -             auto events = lines.event_wait(::std::chrono::seconds(1));
> > -             if (events) {
> > -                     for (auto& it: events)
> > -                             print_event(it.event_read());
> > +             if (request.wait_edge_event(::std::chrono::seconds(5))) {
> > +                     request.read_edge_event(buffer);
> > +
> > +                     for (const auto& event: buffer)
> > +                             print_event(event);
> >               }
> >       }
> >
>
> What is the purpose of the wait_edge_event() here?
> Wouldn't read_edge_event() block until the next event?
>

Indeed and it would block forever if the event doesn't arrive. The
call is to make sure there's an even available.

> This example should be minimal and demonstrate how the code should
> normally be used. e.g.
>
>         for (const auto& event: request.events_iter())
>                   print_event(event);
>
> (assuming the addition of an iterator wrapping request and event buffer)
>
> If you want to showcase more complex examples then provide them separately.
>
> [snip]
>

I'm not how that would work - would it create a new buffer every time
we read events? Doesn't that defeat the entire purpose of the event
buffer of preallocating memory for the events?

> > +     /**
> > +      * @brief Request a set of lines for exclusive usage.
> > +      * @param req_cfg Request config object.
> > +      * @param line_cfg Line config object.
> > +      * @return New line_request object.
> > +      */
> > +     line_request request_lines(const request_config& req_cfg,
> > +                                const line_config& line_cfg);
> > +
>
> A common use case is to just want to request a line, so a top-level
> version of this that hides the chip object from the user might be nice.
> i.e.
>
>     line_request request_lines(const ::std::filesystem::path& path,
>                                const request_config& req_cfg,
>                                const line_config& line_cfg);
>
> Also applies to C API.

I replied about this under the C patch series.

>
> > +private:
> > +
> > +     struct impl;
> > +
> > +     ::std::unique_ptr<impl> _m_priv;
> > +};
> > +
> > +/**
> > + * @brief Stream insertion operator for GPIO chip objects.
> > + * @param out Output stream to write to.
> > + * @param chip GPIO chip to insert into the output stream.
> > + * @return Reference to out.
> > + */
> > +::std::ostream& operator<<(::std::ostream& out, const chip& chip);
> > +
> > +/**
> > + * @}
> > + */
> > +
> > +} /* namespace gpiod */
> > +
> > +#endif /* __LIBGPIOD_CXX_CHIP_HPP__ */
>
> [snip]
>
> > +++ b/bindings/cxx/gpiodcxx/line-request.hpp
> > @@ -0,0 +1,221 @@
> > +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> > +/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
> > +
> > +/**
> > + * @file line-request.hpp
> > + */
> > +
> > +#ifndef __LIBGPIOD_CXX_LINE_REQUEST_HPP__
> > +#define __LIBGPIOD_CXX_LINE_REQUEST_HPP__
> > +
> > +#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
> > +#error "Only gpiod.hpp can be included directly."
> > +#endif
> > +
> > +#include <chrono>
> > +#include <cstddef>
> > +#include <iostream>
> > +#include <memory>
> > +
> > +#include "misc.hpp"
> > +
> > +namespace gpiod {
> > +
> > +class chip;
> > +class edge_event;
> > +class edge_event_buffer;
> > +class line_config;
> > +
> > +/**
> > + * @ingroup gpiod_cxx
> > + * @{
> > + */
> > +
> > +/**
> > + * @brief Stores the context of a set of requested GPIO lines.
> > + */
> > +class line_request
> > +{
> > +public:
> > +
> > +     line_request(const line_request& other) = delete;
> > +
> > +     /**
> > +      * @brief Move constructor.
> > +      * @param other Object to move.
> > +      */
> > +     line_request(line_request&& other) noexcept;
> > +
> > +     ~line_request(void);
> > +
> > +     line_request& operator=(const line_request& other) = delete;
> > +
> > +     /**
> > +      * @brief Move assignment operator.
> > +      * @param other Object to move.
> > +      */
> > +     line_request& operator=(line_request&& other) noexcept;
> > +
> > +     /**
> > +      * @brief Check if this object is valid.
> > +      * @return True if this object's methods can be used, false otherwise.
> > +      *         False usually means the request was released. If the user
> > +      *         calls any of the methods of this class on an object for
> > +      *         which this operator returned false, a logic_error will be
> > +      *         thrown.
> > +      */
> > +     explicit operator bool(void) const noexcept;
> > +
> > +     /**
> > +      * @brief Release the GPIO chip and free all associated resources.
> > +      * @note The object can still be used after this method is called but
> > +      *       using any of the mutators will result in throwing
> > +      *       a logic_error exception.
> > +      */
> > +     void release(void);
> > +
> > +     /**
> > +      * @brief Get the number of requested lines.
> > +      * @return Number of lines in this request.
> > +      */
> > +     ::std::size_t num_lines(void) const;
> > +
> > +     /**
> > +      * @brief Get the list of offsets of requested lines.
> > +      * @return List of hardware offsets of the lines in this request.
> > +      */
> > +     line::offsets offsets(void) const;
> > +
> > +     /**
> > +      * @brief Get the value of a single requested line.
> > +      * @param offset Offset of the line to read within the chip.
> > +      * @return Current line value.
> > +      */
> > +     line::value get_value(line::offset offset);
> > +
> > +     /**
> > +      * @brief Get the values of a subset of requested lines.
> > +      * @param offsets Vector of line offsets
> > +      * @return Vector of lines values with indexes of values corresponding
> > +      *         to those of the offsets.
> > +      */
> > +     line::values get_values(const line::offsets& offsets);
> > +
> > +     /**
> > +      * @brief Get the values of all requested lines.
> > +      * @return List of read values.
> > +      */
> > +     line::values get_values(void);
> > +
> > +     /**
> > +      * @brief Get the values of a subset of requested lines into a vector
> > +      *        supplied by the caller.
> > +      * @param offsets Vector of line offsets.
> > +      * @param values Vector for storing the values. Its size must be at
> > +      *               least that of the offsets vector. The indexes of read
> > +      *               values will correspond with those in the offsets
> > +      *               vector.
> > +      */
> > +     void get_values(const line::offsets& offsets, line::values& values);
> > +
> > +     /**
> > +      * @brief Get the values of all requested lines.
> > +      * @param values Array in which the values will be stored. Must hold
> > +      *               at least the number of elements returned by
> > +      *               line_request::num_lines.
> > +      */
> > +     void get_values(line::values& values);
> > +
> > +     /**
> > +      * @brief Set the value of a single requested line.
> > +      * @param offset Offset of the line to set within the chip.
> > +      * @param value New line value.
> > +      */
> > +     void set_value(line::offset offset, line::value value);
> > +
> > +     /**
> > +      * @brief Set the values of a subset of requested lines.
> > +      * @param values Vector containing a set of offset->value mappings.
> > +      */
> > +     void set_values(const line::value_mappings& values);
> > +
> > +     /**
> > +      * @brief Set the values of a subset of requested lines.
> > +      * @param offsets Vector containing the offsets of lines to set.
> > +      * @param values Vector containing new values with indexes
> > +      *               corresponding with those in the offsets vector.
> > +      */
> > +     void set_values(const line::offsets& offsets, const line::values& values);
> > +
> > +     /**
> > +      * @brief Set the values of all requested lines.
> > +      * @param values Array of new line values. The size must be equal to
> > +      *               the value returned by line_request::num_lines.
> > +      */
> > +     void set_values(const line::values& values);
> > +
> > +     /**
> > +      * @brief Apply new config options to requested lines.
> > +      * @param config New configuration.
> > +      */
> > +     void reconfigure_lines(const line_config& config);
> > +
> > +     /**
> > +      * @brief Get the file descriptor number associated with this line
> > +      *        request.
> > +      * @return File descriptor number.
> > +      */
> > +     int fd(void) const;
> > +
> > +     /**
> > +      * @brief Wait for edge events on any of the lines requested with edge
> > +      *        detection enabled.
> > +      * @param timeout Wait time limit in nanoseconds.
> > +      * @return True if at least one event is ready to be read. False if the
> > +      *         wait timed out.
> > +      */
> > +     bool wait_edge_event(const ::std::chrono::nanoseconds& timeout) const;
> > +
> > +     /**
> > +      * @brief Read a number of edge events from this request up to the
> > +      *        maximum capacity of the buffer.
> > +      * @param buffer Edge event buffer to read events into.
> > +      * @return Number of events read.
> > +      */
> > +     ::std::size_t read_edge_event(edge_event_buffer& buffer);
> > +
> > +     /**
> > +      * @brief Read a number of edge events from this request.
> > +      * @param buffer Edge event buffer to read events into.
> > +      * @param max_events Maximum number of events to read. Limited by the
> > +      *                   capacity of the buffer.
> > +      * @return Number of events read.
> > +      */
> > +     ::std::size_t read_edge_event(edge_event_buffer& buffer, ::std::size_t max_events);
> > +
> > +private:
> > +
> > +     line_request(void);
> > +
> > +     struct impl;
> > +
> > +     ::std::unique_ptr<impl> _m_priv;
> > +
> > +     friend chip;
> > +};
>
> Just wanting to get events from a request is a common use case, and
> having to use an edge_event_buffer is tedious (refer to the gpiomoncxx
> example)
> How about an iterator that wraps the request and an edge_event_buffer
> and provides events?
> I refer to this elsewhere as request.events_iter().
>
> > +
> > +/**
> > + * @brief Stream insertion operator for line requests.
> > + * @param out Output stream to write to.
> > + * @param request Line request object to insert into the output stream.
> > + * @return Reference to out.
> > + */
> > +::std::ostream& operator<<(::std::ostream& out, const line_request& request);
> > +
> > +/**
> > + * @}
> > + */
> > +
> > +} /* namespace gpiod */
> > +
> > +#endif /* __LIBGPIOD_CXX_LINE_REQUEST_HPP__ */
> > diff --git a/bindings/cxx/gpiodcxx/line.hpp b/bindings/cxx/gpiodcxx/line.hpp
> > new file mode 100644
> > index 0000000..8e8a984
> > --- /dev/null
> > +++ b/bindings/cxx/gpiodcxx/line.hpp
> > @@ -0,0 +1,274 @@
> > +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> > +/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
> > +
> > +/**
> > + * @file line.hpp
> > + */
> > +
> > +#ifndef __LIBGPIOD_CXX_LINE_HPP__
> > +#define __LIBGPIOD_CXX_LINE_HPP__
> > +
> > +#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
> > +#error "Only gpiod.hpp can be included directly."
> > +#endif
> > +
> > +#include <ostream>
> > +#include <utility>
> > +#include <vector>
> > +
> > +namespace gpiod {
> > +
> > +/**
> > + * @brief Namespace containing various type definitions for GPIO lines.
> > + */
> > +namespace line {
> > +
> > +/**
> > + * @ingroup gpiod_cxx
> > + * @{
> > + */
> > +
> > +/**
> > + * @brief Wrapper around unsigned int for representing line offsets.
> > + */
> > +class offset
> > +{
> > +public:
> > +     /**
> > +      * @brief Constructor with implicit conversion from unsigned int.
> > +      * @param off Line offset.
> > +      */
> > +     offset(unsigned int off = 0) : _m_offset(off) { }
> > +
> > +     /**
> > +      * @brief Copy constructor.
> > +      * @param other Object to copy.
> > +      */
> > +     offset(const offset& other) = default;
> > +
> > +     /**
> > +      * @brief Move constructor.
> > +      * @param other Object to move.
> > +      */
> > +     offset(offset&& other) = default;
> > +
> > +     ~offset(void) = default;
> > +
> > +     /**
> > +      * @brief Assignment operator.
> > +      * @param other Object to copy.
> > +      * @return Reference to self.
> > +      */
> > +     offset& operator=(const offset& other) = default;
> > +
> > +     /**
> > +      * @brief Move assignment operator.
> > +      * @param other Object to move.
> > +      * @return Reference to self.
> > +      */
> > +     offset& operator=(offset&& other) noexcept = default;
> > +
> > +     /**
> > +      * @brief Conversion operator to `unsigned int`.
> > +      */
> > +     operator unsigned int(void) const noexcept
> > +     {
> > +             return this->_m_offset;
> > +     }
> > +
> > +private:
> > +     unsigned int _m_offset;
> > +};
> > +
>
> Wrapping unsigned int in a class seems like overkill.
> Is this just to get the streaming operators for offsets to work?
>

Yes. Otherwise we'd be providing a generic stream operator for all
vector specializations. And this wrapping doesn't really do much other
than providing a new type within the gpiod namespace. The constructor
with implicit conversion and the operator unsigned int() make sure of
this.

> [snip]
>
> > +GPIOD_CXX_API line::offsets line_request::offsets(void) const
> > +{
> > +     this->_m_priv->throw_if_released();
>
> redundant as this->num_lines() also does it.
>
> > +
> > +     ::std::vector<unsigned int> buf(this->num_lines());
> > +     line::offsets offsets(this->num_lines());
> > +
> > +     ::gpiod_line_request_get_offsets(this->_m_priv->request.get(), buf.data());
> > +
> > +     for (unsigned int i = 0; i < this->num_lines(); i++)
> > +             offsets[i] = buf[i];
> > +
>
> Cache num_lines locally rather than calling num_lines() several times.
>
>
> [snip]
>
> > +template<typename T>
> > +::std::ostream& insert_vector(::std::ostream& out,
> > +                           const ::std::string& name, const ::std::vector<T>& vec)
> >  {
> > -     this->_m_line = nullptr;
> > -     this->_m_owner.reset();
> > -}
> > +     out << name << "([";
> > +     ::std::copy(vec.begin(), ::std::prev(vec.end()),
> > +                 ::std::ostream_iterator<T>(out, ", "));
> > +     out << vec.back();
> > +     out << "])";
> >
>
> What formatting are you after for vectors?
> Is the double bracketing necessary?
>
> [snip]
>
> > +TEST_CASE("line_request stream insertion operator works", "[line-request]")
> > +{
> > +     ::gpiosim::chip sim({{ simprop::NUM_LINES, 4 }});
> > +     ::gpiod::chip chip(sim.dev_path());
> > +
> > +     auto request = chip.request_lines(
> > +             ::gpiod::request_config({
> > +                     { reqprop::OFFSETS, offsets({ 3, 1, 0, 2 }) }
> > +             }),
> > +             ::gpiod::line_config()
> > +     );
> > +
> > +     ::std::stringstream buf, expected;
> > +
> > +     expected << "line_request(num_lines=4, line_offsets=[offsets([3, 1, 0, 2])], fd=" <<
> > +                 request.fd() << ")";
> > +
>
> Still not sure what formatting you are going for with the vectors.
> And the line_offsets=[] is not consistent with the offsets=() used in
> request_config.
>

Yep need to make that consistent, thanks.

> [snip]
>
> > +TEST_CASE("request_config stream insertion operator works", "[request-config]")
> > +{
> > +     ::gpiod::request_config cfg({
> > +             { property::CONSUMER, "foobar" },
> > +             { property::OFFSETS, offsets({ 0, 1, 2, 3 })},
> > +             { property::EVENT_BUFFER_SIZE, 32 }
> > +     });
> > +
> > +     ::std::stringstream buf;
> > +
> > +     buf << cfg;
> > +
> > +     ::std::string expected("request_config(consumer='foobar', num_offsets=4, "
> > +                            "offsets=(offsets([0, 1, 2, 3])), event_buffer_size=32)");
> > +
>
> The streaming output stutters.
> "offsets=(offsets([0, 1, 2, 3]))" should be "offsets=([0, 1, 2, 3])"?
> And even then one of the sets of brackets is redundant.
>

Actually maybe it should be offsets=gpiod::offsets(0, 1, 2 ,3)? I
would like to indicate the type and not make it a generic streaming
operator for vectors like what Qt provides.

> > +     REQUIRE_THAT(buf.str(), Catch::Equals(expected));
> > +}
> > +
> > +} /* namespace */
> > diff --git a/configure.ac b/configure.ac
> > index f8d34ed..ab03673 100644
> > --- a/configure.ac
> > +++ b/configure.ac
> > @@ -239,6 +239,7 @@ AC_CONFIG_FILES([Makefile
> >                bindings/cxx/libgpiodcxx.pc
> >                bindings/Makefile
> >                bindings/cxx/Makefile
> > +              bindings/cxx/gpiodcxx/Makefile
> >                bindings/cxx/examples/Makefile
> >                bindings/cxx/tests/Makefile
> >                bindings/python/Makefile
> > --
> > 2.30.1
> >
>
> Phew.  So nothing major.
>
> Cheers,
> Kent.

Thanks Kent! Wherever there's no comment, I will address the issue.

Bart
