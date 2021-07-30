Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09E03DB3C3
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 08:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237403AbhG3Gmb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 02:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237278AbhG3Gm2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 02:42:28 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97759C061765
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jul 2021 23:42:23 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id e5so9918925pld.6
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jul 2021 23:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FLcXNX7WNv4QGuSlic9d146fdiCmPbkWCsbWAW7kLgM=;
        b=fb/0HzPYvzkiQE4fMMXLmJZTIEFdME+lWt94pq5S1J5n3Hc5n2KP3V3KcRL7D3zno8
         rCl0+oc0XyAnpZqy7LpxFdTVfWbyR2V4nkoOhkSbNDTrFfy8vAzllQNw1CWEplBTW4+g
         LTi+5QuOEzG/wjHVxJrNLUj8aMu453ia4FqoECICpIPKQSlx1pFdgiKG5Jbn5scIHR0Y
         UmRK68JJ330M1Cv2PtfBYs55ibuL/Eu8H4oHtVdLbf+dFtAm75Hpop14re14lXhe7tZQ
         xu326TQIvpyT+DoomoNeiCiU0ZqROtAqAwoC6NF4Myct8U+SCIaERZN9V6l7+hvu0/iI
         7Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FLcXNX7WNv4QGuSlic9d146fdiCmPbkWCsbWAW7kLgM=;
        b=QfXS/xOqGjn4XZt/T7HBjthQ8ey3WGaVsQmsu2eUgm8em5zNxqjydMNzrLs2Hm6D0p
         Xx4vRYwc/qbzxW3d0l0AvaflCZv7sVYopjWDWtSQWJpiNa/9wRxsTRgn+Za0tTBBztA4
         BijgeWb9lXmYCv5TjM8QWp9oL+G4RP9IYYLcSmjySGRv+5qfAaFgit7zlM26jYOhonAP
         afrLk/U/YxMNI5R+DqVBhsUbiRqktaMxAMqiKlWwgIcCZwcG/tWAoKtHkZlHlNWXdBsy
         iC78m28WFGP0F6KaC9+M0D4F7Px3DlBR5JObMseQYiI2E++HFFPGi0A9G2z87uza5R7P
         94gQ==
X-Gm-Message-State: AOAM5319oKCUA8gRjlWP5KA9GpzqYDEJ6c/7Qh69bGMS4/1/Un9R/RAi
        05sEw3RLZWIn4vRTsoIwhD8=
X-Google-Smtp-Source: ABdhPJySGOyI6gc2uh0sASmgASmlyodHtcxX7WCe7o3AFUDlcagmswYkSqWGqgz4fXM9II7xV+KZ3w==
X-Received: by 2002:a05:6a00:1a09:b029:32c:7b3a:837 with SMTP id g9-20020a056a001a09b029032c7b3a0837mr1124433pfv.36.1627627342992;
        Thu, 29 Jul 2021 23:42:22 -0700 (PDT)
Received: from sol (106-69-176-40.dyn.iinet.net.au. [106.69.176.40])
        by smtp.gmail.com with ESMTPSA id n35sm1092731pgb.90.2021.07.29.23.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 23:42:22 -0700 (PDT)
Date:   Fri, 30 Jul 2021 14:42:16 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH v3 3/3] bindings: cxx: implement C++ bindings
 for libgpiod v2.0
Message-ID: <20210730064216.GA9544@sol>
References: <20210727143400.32543-1-brgl@bgdev.pl>
 <20210727143400.32543-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727143400.32543-4-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 27, 2021 at 04:34:00PM +0200, Bartosz Golaszewski wrote:
> This is the bulk of work implementing C++ bindings for the new libgpiod
> API. The tests are not converted yet but the examples are fully
> functional. More details in the cover letter as this patch will be
> squashed with the one for the core C library anyway.
> 

My apologies for not getting around to reviewing v2, so here is a
quick(??) review of v3...

I don't have any problems with the C API changes in patches 1 and 2.
I would prefer that we didn't need the num_lines, offsets and capacity
getters, but their addition is a reasonable compromise.

<snip>

> -GPIOD_CXX_API bool is_gpiochip_device(const ::std::string& path)
> +struct chip::impl
>  {
> -	return ::gpiod_is_gpiochip_device(path.c_str());
> -}
> +	impl(const ::std::string& path)
> +		: chip(open_chip(path)),
> +		  name(::gpiod_chip_get_name(this->chip.get())),
> +		  label(::gpiod_chip_get_label(this->chip.get()))
> +	{
> +
> +	}
> +
> +	impl(const impl& other) = delete;
> +	impl(impl&& other) = delete;
> +	impl& operator=(const impl& other) = delete;
> +	impl& operator=(impl&& other) = delete;
> +
> +	void throw_if_closed(void) const
> +	{
> +		if (!this->chip)
> +			throw ::std::logic_error("GPIO chip has been closed");
> +	}
> +

Perhaps throw something more specific than a logic_error?

<snip>

> diff --git a/bindings/cxx/edge-event.cpp b/bindings/cxx/edge-event.cpp
> new file mode 100644
> index 0000000..d6dce22
> --- /dev/null
> +++ b/bindings/cxx/edge-event.cpp
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: LGPL-3.0-or-later
> +// SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
> +
> +#include <map>
> +#include <stdexcept>
> +#include <system_error>
> +#include <utility>
> +
> +#include "internal.hpp"
> +
> +namespace gpiod {
> +
> +namespace {
> +
> +const ::std::map<int, edge_event::type> event_type_mapping = {
> +	{ GPIOD_LINE_EVENT_RISING_EDGE,		edge_event::type::RISING_EDGE },
> +	{ GPIOD_LINE_EVENT_FALLING_EDGE,	edge_event::type::FALLING_EDGE }
> +};
> +

Use of a map for just two event types seems like overkill.
Wouldn't an if-else in edge_event::get_type(void) be simpler and cleaner?
Also, as written, edge_event::get_type(void) can throw std::out_of_range
which doesn't seem right. Wouldn't std::range_error be more appropriate?
Or adding an unknown event type for failed mappings, so get_type() can
never throw??

Same applies for mappings throughout.  If the C++ values match the C
values then you could just perform a range check and cast for the cases
where there are more than two values.

<snip>

> +	/**
> +	 * @brief Retrieve the current snapshot of line information for a
> +	 *        single line.
> +	 * @param offset Offset of the line to get the info for.
> +	 * @param watch Indicates whether the caller wants to watch for line
> +	 *              info changes.
> +	 * @return New ::gpiod::line_info object.
> +	 */
> +	line_info get_line_info(unsigned int offset, bool watch = false) const;
> +
> +	/**
> +	 * @brief Wrapper around ::gpiod::chip::get_line_info that retrieves
> +	 *        the line info and starts watching the line for changes.
> +	 * @param offset Offset of the line to get the info for.
> +	 * @return New ::gpiod::line_info object.
> +	 */
> +	line_info watch_line_info(unsigned int offset) const;
> +

I repeat my objection to get_line_info() accepting a watch parameter and
watch_line_info() wrapping it.  While they both happen to return
line_info, the purpose of the two methods are quite different and so
should be kept separate.

Also, should be watch_line_info() really be allowed on a const chip?
While it does not alter the C++ object, and so technically can be allowed
on a const, it does alter the state of the underlying C object and so I
would argue it should not be allowed.

<snip>

> +	/**
> +	 * @brief Get the constant reference to the edge event at given index.
> +	 * @param index Index of the event in the buffer.
> +	 * @return Constant reference to the edge event.
> +	 */
> +	const edge_event& get_event(unsigned int index) const;
> +
> +	/**
> +	 * @brief Get the number of edge events currently stored in the buffer.
> +	 * @return Number of edge events in the buffer.
> +	 */
> +	unsigned int num_events(void) const;
> +

A getter not prefixed with "get_" ;-).
(note that I'm kidding - I prefer it this way - more on that later in
class line_info)

> +	/**
> +	 * @brief Maximum capacity of the buffer.
> +	 * @return Buffer capacity.
> +	 */
> +	unsigned int capacity(void) const noexcept;
> +

And again.

<snip>

> +/**
> + * @brief Contains a set of line config options used in line requests and
> + *        reconfiguration.
> + */
> +class line_config
> +{
> +public:
> +

This class has setters but no getters.
There is no use case for getters?
Also applies to C API - just wondering given the addition of the getters
in patch 1 and 2 - there may be cases where the user would like to read
back the config?

> +	/**
> +	 * @brief Direction settings.
> +	 */
> +	enum class direction : unsigned int
> +	{
> +		AS_IS = 1,
> +		/**< Request the line(s), but don't change current direction. */
> +		INPUT,
> +		/**< Request the line(s) for reading the GPIO line state. */
> +		OUTPUT
> +		/**< Request the line(s) for setting the GPIO line state. */
> +	};
> +

line_info and line_config should use common direction types (also
applies to C API)? Perhaps in a ::gpiod::line namespace?

Same applies to other fields that map to GPIO_V2_LINE_FLAGs, so edge,
drive, bias and event clock.
Oh, and the C API lacks a gpiod_line_info_get_event_clock(), and not
surprisingly class line_info lacks a getter for event clock.

<snip>

> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	line_config& operator=(line_config&& other) noexcept;
> +
> +	/**
> +	 * @brief Set the direction, either globally or for a set of offsets.
> +	 * @param dir_val New direction setting.
> +	 * @param offsets Vector of line offsets to set the direction for. If
> +	 *                empty, the setting will be global.
> +	 */
> +	void set_direction(direction dir_val, const line_offsets& offsets = line_offsets()) const;
> +

Setters should not be const.
While your implementation may allow it now, conceptually it is wrong.
And what happens if your implementation changes later?
Removing the const later would break ABI compatibility.

This applies throughout.

<snip>

> +/**
> + * @brief Contains an immutable snapshot of the line's state at the
> + *        time when the object of this class was instantiated.
> + */
> +class line_info
> +{
> +public:
> +
> +	/**
> +	 * @brief Direction settings.
> +	 */
> +	enum class direction : unsigned int
> +	{
> +		INPUT = 1,
> +		/**< Direction is input - we're reading the state of a GPIO line. */
> +		OUTPUT
> +		/**< Direction is output - we're driving the GPIO line. */
> +	};
> +

And as previously noted, I'd like to see the line_info and line_config
use common types.

And I agree with Jack Winch on not prefixing getters with "get_".
The only thing I would change from Jack's suggestion is to put the types
in the line namespace so rather than his

    using direction_type = ::gpiod::direction;

I would have

    using direction_type = ::gpiod::line::direction;

- if you want to use an alias at all.

The types are used relatively rarely, so I'm no fussed if their names
are a bit clunky.  OTOH getters are frequently used and I much prefer
the shorter form.

Where you have an "enum class type" that would conflict with a type()
getter, such as in info_event and edge_event, I would rename the enum to
event_type, or similar.

That applies throughout.

Wrt setters, I'm happy with them being prefixed with "set_" so they are
clearly distinguished from getters.

<snip>

> +/**
> + * @brief Stores the context of a set of requested GPIO lines.
> + */
> +class line_request
> +{
> +public:
> +
<snip>
> +
> +	/**
> +	 * @brief Get the number of requested lines.
> +	 * @return Number of lines in this request.
> +	 */
> +	unsigned int num_lines(void) const;
> +

More getters not prefixed with "get_" ;-).

> +	/**
> +	 * @brief Get the list of offsets of requested lines.
> +	 * @return List of hardware offsets of the lines in this request.
> +	 */
> +	line_offsets offsets(void) const;
> +

And again.

<snip>

> +template<class enum_type, void global_func(::gpiod_line_config*, int),
> +	 void subset_func(::gpiod_line_config*, int, unsigned int, const unsigned int*)>
> +void set_mapped_value(::gpiod_line_config* config, enum_type value,
> +		      const line_offsets& offsets, const ::std::map<enum_type, int>& mapping)
> +{
> +	int mapped_val = mapping.at(value);
> +

This can throw ::std::out_of_range, which set_mapped_value() should catch
and re-throw as ::std::invalid_argument.

The use of templating means mapping using ::std::map in this direction
makes more sense than the reverse in the other modules, but I'm still not
a fan.

<snip>

> +void line_request::impl::throw_if_released(void) const
> +{
> +	if (!this->request)
> +		throw ::std::logic_error("GPIO lines have been released");
> +}
> +

Throw a more specific exception, rather than a generic logic_error.

<snip>

Hopefully I haven't snipped out too much...

Cheers,
Kent.
