Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787D93B529A
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jun 2021 10:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhF0Iua (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Jun 2021 04:50:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhF0Iua (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Jun 2021 04:50:30 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12443C061574
        for <linux-gpio@vger.kernel.org>; Sun, 27 Jun 2021 01:48:06 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id a7so1881067pga.1
        for <linux-gpio@vger.kernel.org>; Sun, 27 Jun 2021 01:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ENNP/lR8Lef7aurZoVjhvAy0s5HbO6T67Bq9eG450Kg=;
        b=ZtdrJEI/cwGpeHQ+r9ClH86RjQKbddoBuRQsuPoukrc1f4rs70Z6S46tmgyjIvlevb
         D2Hm76KEOTjXrRExqHC0I2nNvghkWYi/6xUeK3s197K1vo6YHd/j/GcVgkpCJDBZKf8B
         4Ch7/FUrwMycG0P6TwgioX+lthA5BI2KjmxLdlSzExHJLAW1Xb1mjEHjCcPe/7w2XBhQ
         70lE2AV3T5ZZbJMRQ7IPOWLX4H5niaOfUJCRxRIz3rKP3pGCR9l73uA46OL1E3yoHEAi
         yYSuYl/yuHYeOU/G1uwXLbIX7JyTZC33bpWrOJI3s8tcU3vX7OmsJzfdhaYoHu32JNxF
         X6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ENNP/lR8Lef7aurZoVjhvAy0s5HbO6T67Bq9eG450Kg=;
        b=RHK/wfTp0Xug4+NhCCpoMviA35dm90C2A3MCQbvTrxp/0z/SNoycMbBN7Io1JDfiOA
         RiYjVY+EYQ53Kt3JY/erVf9jwu0qSBoBWidbS2Kwh3LVcs5sreuvzi6axZM7YshSkrb+
         zAlY6UTVwyJK4Whg4/OrDw7fAlD4pWesz90Tu3IDfLVa1Gl9GY86fv1dhyZwrJN7agwE
         5hOf2epcNnRustqrZl/GAeaKClHsEh5ELPommFm96rpv4xLhoOj+bkakc2q+psbXM9wQ
         xVr+YFwBgcrgAQ7+Z++Xu2bh+z72kugcsFGSPFB1vRQ+Oj2SunpvRiEHwjjWNV/Z+p2/
         XU9g==
X-Gm-Message-State: AOAM5314IWEzwZy0vizdeiYtYpWboA6XjI7v2IGJIviWgGs/8PrhZqNc
        4kp6koEZ+W+tspmXr9gXDrQ=
X-Google-Smtp-Source: ABdhPJzzKcLjxl5f/1Bzv0lyDuFMOrIeKV6FZR9OFEVkcYfcpVEq05a1iDXN88Zb39EuyybILHNO1g==
X-Received: by 2002:a63:ed12:: with SMTP id d18mr17598896pgi.12.1624783684230;
        Sun, 27 Jun 2021 01:48:04 -0700 (PDT)
Received: from sol (106-69-174-4.dyn.iinet.net.au. [106.69.174.4])
        by smtp.gmail.com with ESMTPSA id z15sm11239926pgu.71.2021.06.27.01.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 01:48:03 -0700 (PDT)
Date:   Sun, 27 Jun 2021 16:47:57 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 4/4] bindings: cxx: implement C++ bindings for
 libgpiod v2.0
Message-ID: <20210627084757.GA21720@sol>
References: <20210621191830.10628-1-brgl@bgdev.pl>
 <20210621191830.10628-5-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621191830.10628-5-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 21, 2021 at 09:18:30PM +0200, Bartosz Golaszewski wrote:
> This is the bulk of work implementing C++ bindings for the new libgpiod
> API. The tests are not converted yet but the examples are fully
> functional. More details in the cover letter as this patch will be
> squashed with the one for the core C library anyway.
> 

Firstly, I don't have any problems with patches 1-3.

Secondly, I'll be focussing on the API here, but I'm not up on current C++
best practice, so take my comments, or the absence of them, with a
suitable dose of salt.

A general comment - you use retrieve/read/get/return for essentially the
same thing in the accessor method documentation.
Perhaps you could settle on one?
Variety may be the spice of life, but sometimes boring is better.

<snip to the gpiodcxx headers...>

> +++ b/bindings/cxx/gpiodcxx/chip.hpp
> @@ -0,0 +1,172 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file chip.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_CHIP_HPP__
> +#define __LIBGPIOD_CXX_CHIP_HPP__
> +
> +#include <chrono>
> +#include <memory>
> +#include <string>
> +
> +namespace gpiod {
> +
> +class info_event;
> +class line_config;
> +class line_info;
> +class line_request;
> +class request_config;
> +
> +/**
> + * @ingroup gpiod_cxx
> + * @{
> + */
> +
> +/**
> + * @brief Represents a GPIO chip.
> + */
> +class chip
> +{
> +public:
> +
> +	/**
> +	 * @brief Default line config object.
> +	 */
> +	static const line_config default_line_config;
> +

Document what the defaults are?

> +	/**
> +	 * @brief Instantiates a new chip object by opening the device file
> +	 *        indicated by the path argument.
> +	 * @param path Path to the device file to open.
> +	 */
> +	chip(const ::std::string& path);
> +
> +	chip(const chip& other) = delete;
> +
> +	/**
> +	 * @brief Move constructor.
> +	 * @param other Object to move.
> +	 */
> +	chip(chip&& other) noexcept;
> +
> +	~chip(void);
> +
> +	chip& operator =(const chip& other) = delete;
> +

Not sure if the space between the "operator" and the operator is usual
for C++ now, but it looks odd to me.
I find it easier to read without the space.

> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	chip& operator =(chip&& other) noexcept;
> +
> +	/**
> +	 * @brief Check if this object's internal GPIO chip handle is open.
> +	 * @return
> +	 */
> +	explicit operator bool(void) const noexcept;
> +

Return doco?

And dislike converting the chip to a bool - it isn't intuitive that
it should mean the underlying handle is open.  Provide a suitably named
method instead, say is_open() or is_closed()?

Similar comment for line_request.

> +	/**
> +	 * @brief Close the GPIO chip device file and free associated resources.
> +	 * @note The chip object can live after calling this method but any of
> +	 *       the chip's mutators will throw a logic_error exception.
> +	 */
> +	void close(void);
> +
> +	/**
> +	 * @brief Get the name of this GPIO chip.
> +	 * @return Reference to the string containing the chip name.
> +	 */
> +	const ::std::string& name(void) const;
> +
> +	/**
> +	 * @brief Get the label of this GPIO chip.
> +	 * @return Reference to the string containing the label of this chip.
> +	 */
> +	const ::std::string& label(void) const;
> +
> +	/**
> +	 * @brief Return the number of lines exposed by this chip.
> +	 * @return Number of lines.
> +	 */
> +	unsigned int num_lines(void) const;
> +
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

What is the benefit of the watch option here?
It is clearer to keep the get_line_info() and watch_line_info() distinct, 
as they are in the C API.

> +	/**
> +	 * @brief Wrapper around ::gpiod::chip::get_line_info that retrieves
> +	 *        the line info and starts watching the line for changes.
> +	 * @param offset Offset of the line to get the info for.
> +	 * @return New ::gpiod::line_info object.
> +	 */
> +	line_info watch_line_info(unsigned int offset) const;
> +
> +	/**
> +	 * @brief Stop watching the line at given offset for info events.
> +	 * @param offset Offset of the line to get the info for.
> +	 */
> +	void unwatch_line_info(unsigned int offset) const;
> +
> +	/**
> +	 * @brief Get the file descriptor associated with this chip.
> +	 * @return File descriptor number.
> +	 */
> +	int get_fd(void) const;
> +
> +	/**
> +	 * @brief Wait for line status events on any of the watched lines
> +	 *        exposed by this chip.
> +	 * @param timeout Wait time limit in nanoseconds.
> +	 * @return True if at least one event is ready to be read. False if the
> +	 *         wait timed out.
> +	 */
> +	bool info_event_wait(const ::std::chrono::nanoseconds& timeout) const;
> +
> +	/**
> +	 * @brief Read a single line status change event from this chip.
> +	 * @return New info_event object.
> +	 */
> +	info_event info_event_read(void) const;
> +
> +	/**
> +	 * @brief Map a GPIO line's name to its offset within the chip.
> +	 * @param name Name of the GPIO line to map.
> +	 * @return Offset of the line within the chip or -1 if the line with
> +	 *         given name is not exposed by this chip.
> +	 */
> +	int find_line(const ::std::string& name) const;
> +
> +	/**
> +	 * @brief Request a set of lines for exclusive usage.
> +	 * @param req_cfg Request config object.
> +	 * @param line_cfg Line config object.
> +	 * @return New line_request object.
> +	 */
> +	line_request request_lines(const request_config& req_cfg,
> +				   const line_config& line_cfg = default_line_config);
> +
> +private:
> +
> +	struct impl;
> +
> +	::std::unique_ptr<impl> _m_priv;
> +};
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_CHIP_HPP__ */
> diff --git a/bindings/cxx/gpiodcxx/edge-event-buffer.hpp b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
> new file mode 100644
> index 0000000..6e23e56
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
> @@ -0,0 +1,115 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file edge-event-buffer.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__
> +#define __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__
> +
> +#include <memory>
> +#include <vector>
> +
> +namespace gpiod {
> +
> +class edge_event;
> +class line_request;
> +
> +/**
> + * @ingroup gpiod_cxx
> + * @{
> + */
> +
> +/**
> + * @brief Object into which edge events are read for better performance.
> + *
> + * The edge_event_buffer allows to read edge_event objects into an existing
> + * buffer which improves the performance by avoiding needless memory
> + * allocations.
> + */

"allows to read" -> "allows reading"

> +class edge_event_buffer
> +{
> +public:
> +
> +	/**
> +	 * @brief Constant iterator for iterating over edge events stored in
> +	 *        the buffer.
> +	 */
> +	using const_iterator = ::std::vector<edge_event>::const_iterator;
> +
> +	/**
> +	 * @brief Constructor. Creates a new edge event buffer with given
> +	 *        capacity.
> +	 * @param capacity Capacity of the new buffer.
> +	 */
> +	edge_event_buffer(unsigned int capacity = 64);
> +
> +	edge_event_buffer(const edge_event_buffer& other) = delete;
> +
> +	/**
> +	 * @brief Move constructor.
> +	 * @param other Object to move.
> +	 */
> +	edge_event_buffer(edge_event_buffer&& other) noexcept;
> +
> +	~edge_event_buffer(void);
> +
> +	edge_event_buffer& operator =(const edge_event_buffer& other) = delete;
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	edge_event_buffer& operator =(edge_event_buffer&& other) noexcept;
> +
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
> +	/**
> +	 * @brief Maximum capacity of the buffer.
> +	 * @return Buffer capacity.
> +	 */
> +	unsigned int capacity(void) const noexcept;
> +
> +	/**
> +	 * @brief Retrieve a constant iterator to the first edge event
> +	 *        currently stored in the buffer.
> +	 * @return Constant iterator to the first element.
> +	 */
> +	const_iterator begin(void) const noexcept;
> +
> +	/**
> +	 * @brief Retrieve a constant iterator to the element after the last
> +	 *        edge event in the buffer.
> +	 * @return Constant iterator to the element after the last edge event.
> +	 */
> +	const_iterator end(void) const noexcept;
> +
> +private:
> +
> +	struct impl;
> +
> +	::std::unique_ptr<impl> _m_priv;
> +
> +	friend line_request;
> +};
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__ */
> diff --git a/bindings/cxx/gpiodcxx/edge-event.hpp b/bindings/cxx/gpiodcxx/edge-event.hpp
> new file mode 100644
> index 0000000..8877ef4
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/edge-event.hpp
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file edge-event.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_EDGE_EVENT_HPP__
> +#define __LIBGPIOD_CXX_EDGE_EVENT_HPP__
> +
> +#include <cstdint>
> +#include <memory>
> +
> +namespace gpiod {
> +
> +class edge_event_buffer;
> +
> +/**
> + * @ingroup gpiod_cxx
> + * @{
> + */
> +
> +/**
> + * @brief Immutable object containing data about a single edge event.
> + */
> +class edge_event
> +{
> +public:
> +
> +	/**
> +	 * @brief Possible edge event types.
> +	 */

As opposed to the impossible ;)?
Elsewhere you use "Available", which is better.
Though both are probably redundant.

> +	enum : int {
> +		RISING_EDGE = 1,
> +		/**< This is a rising edge event. */
> +		FALLING_EDGE,
> +		/**< This is falling edge event. */
> +	};
> +
> +	/**
> +	 * @brief Copy constructor.
> +	 * @param other Object to copy.
> +	 */
> +	edge_event(const edge_event& other);
> +
> +	/**
> +	 * @brief Move constructor.
> +	 * @param other Object to move.
> +	 */
> +	edge_event(edge_event&& other) noexcept;
> +
> +	/**
> +	 * @brief Destructor.
> +	 */
> +	~edge_event(void);
> +
> +	/**
> +	 * @brief Copy assignment operator.
> +	 * @param other Object to copy.
> +	 * @return Reference to self.
> +	 */
> +	edge_event& operator =(const edge_event& other);
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	edge_event& operator =(edge_event&& other) noexcept;
> +
> +	/**
> +	 * @brief Retrieve the event type.
> +	 * @return Event type (rising or falling edge).
> +	 */
> +	int event_type(void) const;
> +
> +	/**
> +	 * @brief Retrieve the event time-stamp.
> +	 * @return Time-stamp in nanoseconds as registered by the kernel using
> +	 *         the configured edge event clock.
> +	 */
> +	uint64_t timestamp(void) const noexcept;
> +
> +	/**
> +	 * @brief Read the offset of the line on which this event was
> +	 *        registered.
> +	 * @return Line offset.
> +	 */
> +	unsigned int line_offset(void) const noexcept;
> +
> +	/**
> +	 * @brief Get the global sequence number of this event.
> +	 * @return Sequence number of the event relative to all lines in the
> +	 *         associated line request.
> +	 */
> +	unsigned long global_seqno(void) const noexcept;
> +
> +	/**
> +	 * @brief Get the event sequence number specific to the concerned line.
> +	 * @return Sequence number of the event relative to this line within
> +	 *         the lifetime of the associated line request.
> +	 */
> +	unsigned long line_seqno(void) const noexcept;
> +
> +private:
> +
> +	edge_event(void);
> +
> +	struct impl;
> +	struct impl_managed;
> +	struct impl_external;
> +
> +	::std::shared_ptr<impl> _m_priv;
> +
> +	friend edge_event_buffer;
> +};
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_EDGE_EVENT_HPP__ */
> diff --git a/bindings/cxx/gpiodcxx/info-event.hpp b/bindings/cxx/gpiodcxx/info-event.hpp
> new file mode 100644
> index 0000000..3da405d
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/info-event.hpp
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file gpiod.h
> + */
> +
> +#ifndef __LIBGPIOD_CXX_INFO_EVENT_HPP__
> +#define __LIBGPIOD_CXX_INFO_EVENT_HPP__
> +
> +#include <cstdint>
> +#include <memory>
> +
> +namespace gpiod {
> +
> +class chip;
> +class line_info;
> +
> +/**
> + * @ingroup gpiod_cxx
> + * @{
> + */
> +
> +/**
> + * @brief Immutable object containing data about a single line info event.
> + */
> +class info_event
> +{
> +public:
> +
> +	/**
> +	 * @brief Possible types of info events.
> +	 */
> +	enum : int {
> +		LINE_REQUESTED = 1,
> +		/**< Line has been requested. */
> +		LINE_RELEASED,
> +		/**< Previously requested line has been released. */
> +		LINE_CONFIG_CHANGED,
> +		/**< Line configuration has changed. */
> +	};
> +
> +	/**
> +	 * @brief Copy constructor.
> +	 * @param other Object to copy.
> +	 */
> +	info_event(const info_event& other);
> +
> +	/**
> +	 * @brief Move constructor.
> +	 * @param other Object to move.
> +	 */
> +	info_event(info_event&& other) noexcept;
> +
> +	~info_event(void);
> +
> +	/**
> +	 * @brief Copy assignment operator.
> +	 * @param other Object to copy.
> +	 * @return Reference to self.
> +	 */
> +	info_event& operator =(const info_event& other);
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	info_event& operator =(info_event&& other) noexcept;
> +
> +	/**
> +	 * @brief Type of this event.
> +	 * @return Event type.
> +	 */
> +	int event_type(void) const;
> +
> +	/**
> +	 * @brief Timestamp of the event as returned by the kernel.
> +	 * @return Timestamp as a 64-bit unsigned integer.
> +	 */
> +	uint64_t timestamp(void) const noexcept;
> +
> +	/**
> +	 * @brief Get the new line information.
> +	 * @return Constant reference to the line info object containing the
> +	 *         line data as read at the time of the info event.
> +	 */
> +	const line_info& get_line_info(void) const noexcept;
> +
> +private:
> +
> +	info_event(void);
> +
> +	struct impl;
> +
> +	::std::shared_ptr<impl> _m_priv;
> +
> +	friend chip;
> +};
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_INFO_EVENT_HPP__ */
> diff --git a/bindings/cxx/gpiodcxx/line-config.hpp b/bindings/cxx/gpiodcxx/line-config.hpp
> new file mode 100644
> index 0000000..42b97d6
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/line-config.hpp
> @@ -0,0 +1,242 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file line-config.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_LINE_CONFIG_HPP__
> +#define __LIBGPIOD_CXX_LINE_CONFIG_HPP__
> +
> +#include <memory>
> +#include <utility>
> +
> +#include "misc.hpp"
> +
> +namespace gpiod {
> +
> +class chip;
> +class line_request;
> +
> +/**
> + * @ingroup gpiod_cxx
> + * @{
> + */
> +
> +/**
> + * @brief Contains a set of line config options used in line requests and
> + *        reconfiguration.
> + */
> +class line_config
> +{
> +public:
> +
> +	/**
> +	 * @brief Available direction settings.
> +	 */
> +	enum : int {
> +		DIRECTION_AS_IS = 1,
> +		/**< Request the line(s), but don't change current direction. */
> +		DIRECTION_INPUT,
> +		/**< Request the line(s) for reading the GPIO line state. */
> +		DIRECTION_OUTPUT
> +		/**< Request the line(s) for setting the GPIO line state. */
> +	};
> +
> +	/**
> +	 * @brief Available edge event detection settings.
> +	 */
> +	enum : int {
> +		EDGE_NONE = 1,
> +		/**< Don't report edge events. */
> +		EDGE_FALLING,
> +		/**< Only watch falling edge events. */
> +		EDGE_RISING,
> +		/**< Only watch rising edge events. */
> +		EDGE_BOTH
> +		/**< Monitor both types of events. */
> +	};
> +
> +	/**
> +	 * @brief Available internal bias settings for line requests.
> +	 */
> +	enum : int {
> +		BIAS_AS_IS = 1,
> +		/**< Don't change the current bias setting. */
> +		BIAS_DISABLED,
> +		/**< The internal bias should be disabled (the default). */
> +		BIAS_PULL_UP,
> +		/**< The internal pull-up bias is enabled. */
> +		BIAS_PULL_DOWN
> +		/**< The internal pull-down bias is enabled. */
> +	};
> +
> +	/**
> +	 * @brief Available drive settings for line requests.
> +	 */
> +	enum : int {
> +		DRIVE_PUSH_PULL = 1,
> +		/**< Drive setting should be set to push-pull (the default). */
> +		DRIVE_OPEN_DRAIN,
> +		/**< Line output should be set to open-drain. */
> +		DRIVE_OPEN_SOURCE
> +		/**< Line output should be set to open-source. */
> +	};
> +
> +	/**
> +	 * @brief Available clock types used for event timestamps.
> +	 */
> +	enum : int {
> +		EVENT_CLOCK_MONOTONIC = 1,
> +		/**< Use the monotonic clock. */
> +		EVENT_CLOCK_REALTIME
> +		/**< Use the realtime clock. */
> +	};
> +
> +	/**
> +	 * @brief Convenience helper value for passing an empty list of
> +	 *        offset-to-value mappings to methods of this class.
> +	 */
> +	static const line_value_mappings no_output_values;
> +
> +	/**
> +	 * @brief Constructor.
> +	 * @param direction Global direction setting.
> +	 * @param output_values Default output values.
> +	 * @param edge Global edge detection.
> +	 * @param bias Global bias setting.
> +	 * @param drive Global drive setting.
> +	 * @param active_low Global active_low setting.
> +	 * @param debounce_period Global debounce period in microseconds.
> +	 * @param event_clock Default event clock mode.
> +	 */
> +	line_config(int direction = DIRECTION_INPUT,
> +		    const line_value_mappings& output_values = no_output_values,
> +		    int edge = EDGE_NONE, int bias = BIAS_AS_IS,
> +		    int drive = DRIVE_PUSH_PULL, bool active_low = false,
> +		    unsigned long debounce_period = 0,
> +		    int event_clock = EVENT_CLOCK_MONOTONIC);
> +

The parameter ordering should follow the probability of use?
So I would make active_low earlier, before edge and output_values.
And maybe output_values after edge?

> +	line_config(const line_config& other) = delete;
> +
> +	/**
> +	 * @brief Move constructor.
> +	 * @param other Object to move.
> +	 */
> +	line_config(line_config&& other) noexcept;
> +
> +	~line_config(void);
> +
> +	line_config& operator =(const line_config& other) = delete;
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	line_config& operator =(line_config&& other) noexcept;
> +
> +	/**
> +	 * @brief Set the direction (globally or for a set of offsets).

"Set the direction, either globally or for a set of offsets."?

> +	 * @param direction New direction setting.
> +	 * @param offsets Vector of line offsets to set the direction for. If
> +	 *                empty, the setting will be global.
> +	 */
> +	void set_direction(int direction, const line_offsets& offsets = line_offsets()) const;
> +
> +	/**
> +	 * @brief Set the edge detection (globally or for a set of offsets).
> +	 * @param edge New edge detection setting.
> +	 * @param offsets Vector of line offsets to set the edge detection for.
> +	 *                If empty, the setting will be global.
> +	 */
> +	void set_edge_detection(int edge, const line_offsets& offsets = line_offsets()) const;
> +
> +	/**
> +	 * @brief Set the bias (globally or for a set of offsets).
> +	 * @param bias New bias setting.
> +	 * @param offsets Vector of line offsets to set the bias for. If empty,
> +	 *                the setting will be global.
> +	 */
> +	void set_bias(int bias, const line_offsets& offsets = line_offsets()) const;
> +
> +	/**
> +	 * @brief Set the drive (globally or for a set of offsets).
> +	 * @param drive New drive setting.
> +	 * @param offsets Vector of line offsets to set the drive for. If empty,
> +	 *                the setting will be global.
> +	 */
> +	void set_drive(int drive, const line_offsets& offsets = line_offsets()) const;
> +
> +	/**
> +	 * @brief Set the active setting to low (globally or for a set of
> +	 *        offsets).
> +	 * @param offsets Vector of line offsets to set to active-low. If empty,
> +	 *                the setting will be global.
> +	 */
> +	void set_active_low(const line_offsets& offsets = line_offsets()) const noexcept;
> +
> +	/**
> +	 * @brief Set the active setting to high (globally or for a set of
> +	 *        offsets).
> +	 * @param offsets Vector of line offsets to set to active-high. If
> +	 *                empty, the setting will be global.
> +	 */
> +	void set_active_high(const line_offsets& offsets = line_offsets()) const noexcept;
> +
> +	/**
> +	 * @brief Set the debounce period (globally or for a set of offsets).
> +	 * @param period New debounce period setting.
> +	 * @param offsets Vector of line offsets to set the debounce period for.
> +	 *                If empty, the setting will be global.
> +	 */
> +	void set_debounce_period(unsigned long period,
> +				 const line_offsets& offsets = line_offsets()) const noexcept;
> +

period == 0 means not debounced? e.g. when overridding the global
setting for a particular line.

> +	/**
> +	 * @brief Set the type of clock used to timestamp edge events (globally
> +	 *        or for a set of offsets).
> +	 * @param clock New event clock setting.
> +	 * @param offsets Vector of line offsets to set the debounce period for.
> +	 *                If empty, the setting will be global.
> +	 */
> +	void set_event_clock(int clock, const line_offsets& offsets = line_offsets()) const;
> +
> +	/**
> +	 * @brief Set the output value for a single offset.
> +	 * @param offset Line offset to associate the value with.
> +	 * @param value New value.
> +	 */
> +	void set_output_value(unsigned int offset, int value) const;
> +
> +	/**
> +	 * @brief Set the output values for a set of line offsets.
> +	 * @param values Vector of offset->value mappings.
> +	 */
> +	void set_output_values(const line_value_mappings& values) const;
> +
> +	/**
> +	 * @brief Set the output values for a set of line offsets.
> +	 * @param offsets Vector of line offsets for which to set output values.
> +	 * @param values Vector of new line values with indexes of values
> +	 *               corresponding to the indexes of offsets.
> +	 */
> +	void set_output_values(const line_offsets& offsets, const line_values& values) const;
> +

Painful that the user has to keep track of the offsets independent of
the request.  Any way to provide a method that applies values to the
requested lines without explicitly providing the offsets?
See related get_values() comments below...

And in general, what happens if the offsets provided aren't a subset of
the requested offsets?  That applies to the C API as well.

> +private:
> +
> +	struct impl;
> +
> +	::std::unique_ptr<impl> _m_priv;
> +
> +	friend chip;
> +	friend line_request;
> +};
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_LINE_CONFIG_HPP__ */
> diff --git a/bindings/cxx/gpiodcxx/line-info.hpp b/bindings/cxx/gpiodcxx/line-info.hpp
> new file mode 100644
> index 0000000..8e9569c
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/line-info.hpp
> @@ -0,0 +1,205 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file line-info.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_LINE_INFO_HPP__
> +#define __LIBGPIOD_CXX_LINE_INFO_HPP__
> +
> +#include <memory>
> +#include <string>
> +
> +namespace gpiod {
> +
> +class chip;
> +class info_event;
> +
> +/**
> + * @ingroup gpiod_cxx
> + * @{
> + */
> +
> +/**
> + * @brief Contains an immutable snapshot of the line's state at the
> + *        time when the object of this class was instantiated.
> + */
> +class line_info
> +{
> +public:
> +
> +	/**
> +	 * @brief Possible direction settings.
> +	 */
> +	enum : int {
> +		DIRECTION_INPUT = 1,
> +		/**< Direction is input - we're reading the state of a GPIO line. */
> +		DIRECTION_OUTPUT
> +		/**< Direction is output - we're driving the GPIO line. */
> +	};
> +
> +	/**
> +	 * @brief Possible internal bias settings.
> +	 */
> +	enum : int {
> +		BIAS_UNKNOWN = 1,
> +		/**< The internal bias state is unknown. */
> +		BIAS_DISABLED,
> +		/**< The internal bias is disabled. */
> +		BIAS_PULL_UP,
> +		/**< The internal pull-up bias is enabled. */
> +		BIAS_PULL_DOWN
> +		/**< The internal pull-down bias is enabled. */
> +	};
> +
> +	/**
> +	 * @brief Possible drive settings.
> +	 */
> +	enum : int {
> +		DRIVE_PUSH_PULL = 1,
> +		/**< Drive setting is push-pull. */
> +		DRIVE_OPEN_DRAIN,
> +		/**< Line output is open-drain. */
> +		DRIVE_OPEN_SOURCE,
> +		/**< Line output is open-source. */
> +	};
> +
> +	/**
> +	 * @brief Possible edge detection settings.
> +	 */
> +	enum : int {
> +		EDGE_NONE = 1,
> +		/**< Line edge detection is disabled. */
> +		EDGE_RISING,
> +		/**< Line detects rising edge events. */
> +		EDGE_FALLING,
> +		/**< Line detect falling edge events. */
> +		EDGE_BOTH
> +		/**< Line detects both rising and falling edge events. */
> +	};
> +
> +	/**
> +	 * @brief Copy constructor.
> +	 * @param other Object to copy.
> +	 */
> +	line_info(const line_info& other) noexcept;
> +
> +	/**
> +	 * @brief Move constructor.
> +	 * @param other Object to move.
> +	 */
> +	line_info(line_info&& other) noexcept;
> +
> +	~line_info(void);
> +
> +	/**
> +	 * @brief Copy assignment operator.
> +	 * @param other Object to copy.
> +	 * @return Reference to self.
> +	 */
> +	line_info& operator =(const line_info& other) noexcept;
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	line_info& operator =(line_info&& other) noexcept;
> +
> +	/**
> +	 * @brief Get the hardware offset of the line.
> +	 * @return Offset of the line within the parent chip.
> +	 */
> +	unsigned int offset(void) const noexcept;
> +
> +	/**
> +	 * @brief Get the GPIO line name.
> +	 * @return Name of the GPIO line as it is represented in the kernel.
> +	 *         This routine returns an empty string if the line is unnamed.
> +	 */
> +	const ::std::string& name(void) const noexcept;
> +
> +	/**
> +	 * @brief Check if the line is currently in use.
> +	 * @return True if the line is in use, false otherwise.
> +	 *
> +	 * The user space can't know exactly why a line is busy. It may have
> +	 * been requested by another process or hogged by the kernel. It only
> +	 * matters that the line is used and we can't request it.
> +	 */
> +	bool used(void) const noexcept;
> +
> +	/**
> +	 * @brief Read the GPIO line consumer name.
> +	 * @return Name of the GPIO consumer name as it is represented in the
> +	 *         kernel. This routine returns an empty string if the line is
> +	 *         not used.
> +	 */
> +	const ::std::string& consumer(void) const noexcept;
> +
> +	/**
> +	 * @brief Read the GPIO line direction setting.
> +	 * @return Returns DIRECTION_INPUT or DIRECTION_OUTPUT.
> +	 */
> +	int direction(void) const;
> +
> +	/**
> +	 * @brief Check if the signal of this line is inverted.
> +	 * @return True if this line is "active-low", false otherwise.
> +	 */
> +	bool active_low(void) const noexcept;
> +
> +	/**
> +	 * @brief Read the GPIO line bias setting.
> +	 * @return Returns BIAS_PULL_UP, BIAS_PULL_DOWN, BIAS_DISABLE or
> +	 *         BIAS_UNKNOWN.
> +	 */
> +	int bias(void) const;
> +
> +	/**
> +	 * @brief Read the GPIO line drive setting.
> +	 * @return Returns DRIVE_PUSH_PULL, DRIVE_OPEN_DRAIN or
> +	 *         DRIVE_OPEN_SOURCE.
> +	 */
> +	int drive(void) const;
> +
> +	/**
> +	 * @brief Read the current edge detection setting of this line.
> +	 * @return Returns EDGE_NONE, EDGE_RISING, EDGE_FALLING or EDGE_BOTH.
> +	 */
> +	int edge_detection(void) const;
> +
> +	/**
> +	 * @brief Check if this line is debounced (either by hardware or by the
> +	 *        kernel software debouncer).
> +	 * @return True if the line is debounced, false otherwise.
> +	 */
> +	bool debounced(void) const noexcept;
> +

Not sure if I had the same comment for the C API, but what is the
benefit of this given it is equivalent to debounce_period() == 0?

> +	/**
> +	 * @brief Read the current debounce period in microseconds.
> +	 * @return Current debounce period in microseconds, 0 if the line is
> +	 *         not debounced.
> +	 */
> +	unsigned long debounce_period(void) const noexcept;
> +
> +private:
> +
> +	line_info(void);
> +
> +	struct impl;
> +
> +	::std::shared_ptr<impl> _m_priv;
> +
> +	friend chip;
> +	friend info_event;
> +};
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_LINE_INFO_HPP__ */
> diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
> new file mode 100644
> index 0000000..c3ca39c
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/line-request.hpp
> @@ -0,0 +1,170 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file line-request.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_LINE_REQUEST_HPP__
> +#define __LIBGPIOD_CXX_LINE_REQUEST_HPP__
> +
> +#include <chrono>
> +#include <memory>
> +
> +#include "misc.hpp"
> +
> +namespace gpiod {
> +
> +class chip;
> +class edge_event;
> +class edge_event_buffer;
> +class line_config;
> +
> +/**
> + * @ingroup gpiod_cxx
> + * @{
> + */
> +
> +/**
> + * @brief Stores the context of a set of requested GPIO lines.
> + */
> +class line_request
> +{
> +public:
> +
> +	line_request(const line_request& other) = delete;
> +
> +	/**
> +	 * @brief Move constructor.
> +	 * @param other Object to move.
> +	 */
> +	line_request(line_request&& other) noexcept;
> +
> +	~line_request(void);
> +
> +	line_request& operator =(const line_request& other) = delete;
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 */
> +	line_request& operator =(line_request&& other) noexcept;
> +
> +	/**
> +	 * @brief Check if the object is associated with an open GPIO chip.
> +	 * @return True if the chip is open, false if it has been closed.
> +	 */
> +	explicit operator bool(void) const noexcept;

This is even less intuitive than for chip.
It could mean chip is open, or line is requested, or ...
So make it a method with an appropriate name instead.

> +
> +	/**
> +	 * @brief Release the GPIO chip and free all associated resources.
> +	 * @note The object can still be used after this method is called but
> +	 *       using any of the mutators will result in throwing
> +	 *       a logic_error exception.
> +	 */
> +	void release(void);
> +
> +	/**
> +	 * @brief Read the value of a single requested line.
> +	 * @param offset Offset of the line to read within the chip.
> +	 * @return Current line value.
> +	 */
> +	int get_value(unsigned int offset) const;
> +
> +	/**
> +	 * @brief Read the values of a subset of requested lines.
> +	 * @param offsets Vector of line offsets
> +	 * @return Vector of lines values with indexes of values corresponding
> +	 *         to those of the offsets.
> +	 */
> +	line_values get_values(const line_offsets& offsets) const;
> +

A common use case would be to get all lines in the request.
As written, to do that the user needs to maintain their own copy of the
offsets.

Maybe if offsets is empty then returns all requested lines?  And provide
line_offsets() as a default parameter?

Same argument applies for the C API.
In gpiod.h you could rename the existing _get_values() to

int gpiod_line_request_get_values_subset(struct gpiod_line_request *request,
				  unsigned num_lines,
				  const unsigned int *offsets, int *values);

and add

int gpiod_line_request_get_values(struct gpiod_line_request *request, int *values);

Or interpret a zero offsets param to mean use the requested offsets??

> +	/**
> +	 * @brief Read the values of a subset of requested lines into a vector
> +	 *        supplied by the caller.
> +	 * @param offsets Vector of line offsets.
> +	 * @param values Vector for storing the values. Its size must be at
> +	 *               least that of the offsets vector. The indexes of read
> +	 *               values will correspond with those in the offsets
> +	 *               vector.
> +	 */
> +	void get_values(const line_offsets& offsets, line_values& values) const;
> +
> +	/**
> +	 * @brief Set the value of a single requested line.
> +	 * @param offset Offset of the line to set within the chip.
> +	 * @param value New line value.
> +	 */
> +	void set_value(unsigned int offset, int value) const;
> +
> +	/**
> +	 * @brief Set the values of a subset of requested lines.
> +	 * @param values Vector containing a set of offset->value mappings.
> +	 */
> +	void set_values(const line_value_mappings& values) const;
> +

Same comment as for get_values.

> +	/**
> +	 * @brief Set the values of a subset of requested lines.
> +	 * @param offsets Vector containing the offsets of lines to set.
> +	 * @param values Vector containing new values with indexes
> +	 *               corresponding with those in the offsets vector.
> +	 */
> +	void set_values(const line_offsets& offsets, const line_values& values) const;
> +
> +	/**
> +	 * @brief Apply new config options to requested lines.
> +	 * @param config New configuration.
> +	 */
> +	void reconfigure_lines(const line_config& config) const;
> +
> +	/**
> +	 * @brief Retrieve the file descriptor number associated with this
> +	 *        line request.
> +	 * @return File descriptor number.
> +	 */
> +	int get_fd(void) const;
> +
> +	/**
> +	 * @brief Wait for edge events on any of the lines requested with edge
> +	 *        detection enabled.
> +	 * @param timeout Wait time limit in nanoseconds.
> +	 * @return True if at least one event is ready to be read. False if the
> +	 *         wait timed out.
> +	 */
> +	bool edge_event_wait(const ::std::chrono::nanoseconds& timeout) const;
> +
> +	/**
> +	 * @brief Read a number of edge events from this request up to the
> +	 *        maximum capacity of the buffer.
> +	 * @param buffer Edge event buffer to read events into.
> +	 * @return Number of events read.
> +	 */
> +	unsigned int edge_event_read(edge_event_buffer& buffer) const;
> +
> +	/**
> +	 * @brief Read a number of edge events from this request.
> +	 * @param buffer Edge event buffer to read events into.
> +	 * @param max_events Maximum number of events to read. Limited by the
> +	 *                   capacity of the buffer.
> +	 * @return Number of events read.
> +	 */
> +	unsigned int edge_event_read(edge_event_buffer& buffer, unsigned int max_events) const;
> +
> +private:
> +
> +	line_request(void);
> +
> +	struct impl;
> +
> +	::std::unique_ptr<impl> _m_priv;
> +
> +	friend chip;
> +};
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_LINE_REQUEST_HPP__ */
> diff --git a/bindings/cxx/gpiodcxx/misc.hpp b/bindings/cxx/gpiodcxx/misc.hpp
> new file mode 100644
> index 0000000..16e0258
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/misc.hpp
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file misc.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_MISC_HPP__
> +#define __LIBGPIOD_CXX_MISC_HPP__
> +
> +#include <string>
> +#include <utility>
> +#include <vector>
> +
> +namespace gpiod {
> +
> +/**
> + * @brief Vector of line offsets.
> + */
> +using line_offsets = ::std::vector<unsigned int>;
> +
> +/**
> + * @brief Vector of line values.
> + */
> +using line_values = ::std::vector<int>;
> +
> +/**
> + * @brief Vector of offset->value mappings. Each mapping is defined as a pair
> + *        of an unsigned and signed integers.
> + */
> +using line_value_mappings = ::std::vector<::std::pair<unsigned int, int>>;
> +
> +/**
> + * @brief Check if the file pointed to by path is a GPIO chip character device.
> + * @param path Path to check.
> + * @return True if the file exists and is a GPIO chip character device or a
> + *         symbolic link to it.
> + */
> +bool is_gpiochip_device(const ::std::string& path);
> +
> +/**
> + * @brief Get the human readable version string for libgpiod API
> + * @return String containing the library version.
> + */
> +::std::string version_string(void);
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_MISC_HPP__ */
> diff --git a/bindings/cxx/gpiodcxx/request-config.hpp b/bindings/cxx/gpiodcxx/request-config.hpp
> new file mode 100644
> index 0000000..da1479c
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/request-config.hpp
> @@ -0,0 +1,95 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file request-config.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__
> +#define __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__
> +
> +#include <memory>
> +#include <string>
> +
> +#include "misc.hpp"
> +
> +namespace gpiod {
> +
> +class chip;
> +
> +/**
> + * @ingroup gpiod_cxx
> + * @{
> + */
> +
> +/**
> + * @brief Stores a set of options passed to the kernel when making a line
> + *        request.
> + */
> +class request_config
> +{
> +public:
> +
> +	/**
> +	 * @brief Constructor.
> +	 * @param offsets Vector of line offsets to request.
> +	 * @param consumer Consumer name.
> +	 * @param event_buffer_size Event buffer size.
> +	 */
> +	request_config(const line_offsets& offsets = line_offsets(),
> +		       const ::std::string& consumer = ::std::string(),
> +		       unsigned int event_buffer_size = 0);
> +

When would you call this without providing offsets?

> +	request_config(const request_config& other) = delete;
> +
> +	/**
> +	 * @brief Move constructor.
> +	 * @param other Object to move.
> +	 */
> +	request_config(request_config&& other) noexcept;
> +
> +	~request_config(void);
> +
> +	request_config& operator =(const request_config& other) = delete;
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	request_config& operator =(request_config&& other) noexcept;
> +
> +	/**
> +	 * @brief Set the consumer name.
> +	 * @param consumer New consumer name.
> +	 */
> +	void set_consumer(const ::std::string& consumer) const noexcept;
> +
> +	/**
> +	 * @brief Set line offsets for this request.
> +	 * @param offsets Vector of line offsets to request.
> +	 */
> +	void set_offsets(const line_offsets& offsets) const noexcept;
> +
> +	/**
> +	 * @brief Set the size of the event buffer.
> +	 * @param event_buffer_size New event buffer size.
> +	 */
> +	void set_event_buffer_size(unsigned int event_buffer_size) const noexcept;
> +

Highlight that this is the kernel buffer size, as per the C API doco, and
is totally unrelated to userspace edge-event-buffer capacity?

> +private:
> +
> +	struct impl;
> +
> +	::std::unique_ptr<impl> _m_priv;
> +
> +	friend chip;
> +};
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__ */
> diff --git a/bindings/cxx/info-event.cpp b/bindings/cxx/info-event.cpp
> new file mode 100644

<snip>

Cheers,
Kent.

