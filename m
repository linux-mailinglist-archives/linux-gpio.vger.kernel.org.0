Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAEA447829
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 02:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbhKHBH3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Nov 2021 20:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbhKHBH2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Nov 2021 20:07:28 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21D10C061570
        for <linux-gpio@vger.kernel.org>; Sun,  7 Nov 2021 17:04:45 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id n85so9933263pfd.10
        for <linux-gpio@vger.kernel.org>; Sun, 07 Nov 2021 17:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=daNbzVF+WIcypCmC06QxaNuZ6v3ASVrv98aaYylD5wQ=;
        b=FIweM/wak7DxbYngtyLouLgPlJtMWka2j46SwNDDDokxo7MieljIE7/bmD0Zv0K5ob
         EElG7Vlz+7DE3R04ZjGs7rHBcnG6WvcqSNr/FtrKaF46mHUsZQ8kdBiE+rEBcmIipLBE
         82NGQLwDAEEUxZKgNa7OeSUiV85b1xRRMVAmFyokV3rzC+hcf5y9QWIyTHza8sm5XaA1
         gVbvWsx+TsAfGvvROeMVVTA+n6kuocBtQch4aGrEBHV9G0jXXMAfzMRICAu8tO9jKJiV
         68Ky6hmKn4oXTJeKQxUI67F6lvTBxzjEL2/mblp7NpK7teyg1AMxsR1wuiEu8DCBHxX6
         IkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=daNbzVF+WIcypCmC06QxaNuZ6v3ASVrv98aaYylD5wQ=;
        b=AS/WbN1GGSB+IRPq+Ixeu7En8muhJDvyVit7as3CeKrL9GndQopmQ0MgnWY2c9T3uo
         LjHRB0S6h4xoK7838vXpGvIiM6+CiYbNIRRPfxQNECIbfNKw7RWmpQeCbpy3jJ2z5qg1
         5kidBA3o3bv9Eytf7G6UTQPI7Rm5x0Zfn76BUfu802FxVN27O3oVQseogt7C5VfbGnT4
         WdFANOpOFdplju+Vc2vcymN2xx2KVszkw7xPQC9PDu4nFIcMmrfHR+ydIyGHAzoGRuS/
         oes0g2udoNj6rRR2VCDJ0LQePfxwRJ6L4xrrhHOSW90DYZy/pQQnZN2xB47shniWLe4E
         XXjA==
X-Gm-Message-State: AOAM531MVf0e9tCdZL/E9Z24pGM5YPXTfVLwy9YxiPdCjhxRyWsUp28N
        tbqxhgXOb/++ekkynvq5NHikImShsC33QQ==
X-Google-Smtp-Source: ABdhPJzW5KPM7jbxXKYnV9V9JRbLo/gz2iAgxzoG/YjgkRY0AD2wVpkfQZ1Q/pE9Rt9f4m5U1zv8SA==
X-Received: by 2002:a63:8143:: with SMTP id t64mr31042778pgd.43.1636333484020;
        Sun, 07 Nov 2021 17:04:44 -0800 (PST)
Received: from sol (14-201-12-235.tpgi.com.au. [14.201.12.235])
        by smtp.gmail.com with ESMTPSA id o4sm14324088pjq.23.2021.11.07.17.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 17:04:43 -0800 (PST)
Date:   Mon, 8 Nov 2021 09:04:38 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v4 2/2] bindings: cxx: implement C++
 bindings for libgpiod v2.0
Message-ID: <20211108010438.GA6478@sol>
References: <20211104192252.21883-1-brgl@bgdev.pl>
 <20211104192252.21883-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104192252.21883-3-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 04, 2021 at 08:22:52PM +0100, Bartosz Golaszewski wrote:
> This is the bulk of work implementing C++ bindings for the new libgpiod
> API. The tests are not converted yet but the examples are fully
> functional. More details in the cover letter as this patch will be
> squashed with the one for the core C library anyway.
> 

I dislike the squashing approach.  I would rather accept that this branch
is unstable and keep the patches separate.
If you want stability at each commit then disable the building of any
unstable sections until they are fit to be included in the build again,
rather than squashing everything into one humungous patch.

I'd rather see working tests than working examples :-(, unless you
think your API is still in flux?  Separate patches for API,
implementation, tests, and examples would work for me.

A lot of the comments below are nitpicking documentation wording, and
may well apply to the C API as well.

<snip>

> -GPIOD_CXX_API bool chip::operator!=(const chip& rhs) const noexcept
> +GPIOD_CXX_API int chip::find_line(const ::std::string& name) const
>  {
> -	return this->_m_chip.get() != rhs._m_chip.get();
> +	this->_m_priv->throw_if_closed();
> +
> +	int ret = ::gpiod_chip_find_line(this->_m_priv->chip.get(), name.c_str());
> +	if (ret < 0) {
> +		if (errno == ENOENT)
> +			return -1;
> +
> +		throw_from_errno("error looking up line by name");
> +	}
> +
> +	return ret;
>  }
>  

	if (ret < 0 && errno != ENOENT)
		throw_from_errno("error looking up line by name");

unless you are guarding against ret < -1??

<snip>

> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	chip& operator=(chip&& other) noexcept;
> +

s/Reference to self/Updated object/g

> +	/**
> +	 * @brief Check if this object is valid.
> +	 * @return True if this object's methods can be used, false otherwise.
> +	 *         False usually means the chip was closed. If the user calls
> +	 *         any of the methods of this class on an object for which this
> +	 *         operator returned false, a logic_error will be thrown.
> +	 */
> +	explicit operator bool(void) const noexcept;
> +
> +	/**
> +	 * @brief Close the GPIO chip device file and free associated resources.
> +	 * @note The chip object can live after calling this method but any of
> +	 *       the chip's mutators will throw a logic_error exception.
> +	 */
> +	void close(void);
> +

It actually throws chip_closed.

> +	/**
> +	 * @brief Get the name of this GPIO chip.
> +	 * @return C string pointer to the chip name.
> +	 */
> +	const char* name(void) const;
> +
> +	/**
> +	 * @brief Get the label of this GPIO chip.
> +	 * @return C string pointer to the chip name.
> +	 */
> +	const char* label(void) const;
> +
> +	/**
> +	 * @brief Get the filesystem path that was used to open this GPIO chip.
> +	 * @return C string pointer to the chip's path.
> +	 */
> +	const char* path(void) const;
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
> +	 * @return New ::gpiod::line_info object.
> +	 */
> +	line_info get_line_info(unsigned int offset) const;
> +
> +	/**
> +	 * @brief Wrapper around ::gpiod::chip::get_line_info that retrieves
> +	 *        the line info and starts watching the line for changes.
> +	 * @param offset Offset of the line to get the info for.
> +	 * @return New ::gpiod::line_info object.
> +	 */
> +	line_info watch_line_info(unsigned int offset) const;
> +

Does a user care that this is a wrapper?
Just describe what the method does, from the user's PoV, not how.
If the user really cares about how they can look at the implementation.

@brief Start watching a line for info events and return the current line
info.
@param offset Offset of the line.
@note Info events are returned via info_event_read().

> +	/**
> +	 * @brief Stop watching the line at given offset for info events.
> +	 * @param offset Offset of the line to get the info for.
> +	 */
> +	void unwatch_line_info(unsigned int offset) const;
> +

@param offset Offset of the line.
(The method doesn't get info, and even if it did this would be redundant
as that should be described in @brief.)

s/line at given offset/line/g
(The @param makes it clear that the offset identifies the line.)

> +	/**
> +	 * @brief Get the file descriptor associated with this chip.
> +	 * @return File descriptor number.
> +	 */
> +	int fd(void) const;
> +
> +	/**
> +	 * @brief Wait for line status events on any of the watched lines
> +	 *        exposed by this chip.

"watched lines of this chip."

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

@note This method can block unless info_event_wait() returns true.

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
> +				   const line_config& line_cfg = default_line_config());
> +
> +	/**
> +	 * @brief Get the default line config object.
> +	 * @return Reference to the default line config object.
> +	 *

@return Default line config object.

Returning a const& is a standard pattern.
Omit that it is reference, just as you omitted it is const.
i.e. describe the object being passed, not how it is being passed - that
is clear from the type.

Similarly elsewhere...

> +	 * The default line configuration is: input, active-high, bias as-is,
> +	 * no edge detection, push-pull drive (unused in input mode), no
> +	 * debounce, monotonic event clock (unused with no edge detection).
> +	 */
> +	static const line_config& default_line_config(void);
> +
> +private:
> +
> +	struct impl;
> +
> +	::std::unique_ptr<impl> _m_priv;
> +};
> +
> +/**
> + * @brief Stream insertion operator for GPIO chip objects.
> + * @param out Output stream to write to.
> + * @param chip GPIO chip to print.
> + * @return Reference to out.
> + */

... like here.

s/Reference to out/Output stream/g

> +::std::ostream& operator<<(::std::ostream& out, const chip& chip);
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
> index 0000000..87da8ac
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
> @@ -0,0 +1,122 @@
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
> +#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
> +#error "Only gpiod.hpp can be included directly."
> +#endif
> +
> +#include <iostream>
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
> + * The edge_event_buffer allows reading edge_event objects into an existing
> + * buffer which improves the performance by avoiding needless memory
> + * allocations.
> + */

"buffer to improve performance"

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
> +	edge_event_buffer& operator=(const edge_event_buffer& other) = delete;
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	edge_event_buffer& operator=(edge_event_buffer&& other) noexcept;
> +
> +	/**
> +	 * @brief Get the constant reference to the edge event at given index.
> +	 * @param index Index of the event in the buffer.
> +	 * @return Constant reference to the edge event.
> +	 */
> +	const edge_event& get_event(unsigned int index) const;
> +

@brief Get an edge event.

@return Edge event.

<snip>

> +	/**
> +	 * @brief Get the new line information.
> +	 * @return Constant reference to the line info object containing the
> +	 *         line data as read at the time of the info event.
> +	 */
> +	const line_info& get_line_info(void) const noexcept;
> +

@return Line info object ...

<snip>

> +class line_config
> +{
> +public:
> +
> +	/**
> +	 * @brief Constructor.
> +	 * @param direction Global direction setting.
> +	 * @param edge Global edge detection.
> +	 * @param active_low Global active_low setting.
> +	 * @param output_values Default output values.
> +	 * @param bias Global bias setting.
> +	 * @param drive Global drive setting.
> +	 * @param debounce_period Global debounce period in microseconds.
> +	 * @param clock Default event clock mode.
> +	 */
> +	line_config(line::direction direction = line::direction::INPUT,
> +		    line::edge edge = line::edge::NONE,
> +		    bool active_low = false,
> +		    const line::value_mappings& output_values = no_output_values(),
> +		    line::bias bias = line::bias::AS_IS,
> +		    line::drive drive = line::drive::PUSH_PULL,
> +		    unsigned long debounce_period = 0,
> +		    line::clock clock = line::clock::MONOTONIC);
> +

output_values should be "int output_value = 0".
It is the default for all lines, not the setting for each line.

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
> +	line_config& operator=(const line_config& other) = delete;
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	line_config& operator=(line_config&& other) noexcept;
> +
> +	/**
> +	 * @brief Reset the line config object.
> +	 */
> +	void reset(void) noexcept;
> +
> +	/**
> +	 * @brief Set the default direction setting.
> +	 * @param direction New direction.
> +	 */
> +	void set_direction(line::direction direction);
> +

As per my comments in patch 01, this should set the direction for all
lines - clearing any overrides.

Similarly other "default" setters.

> +	/**
> +	 * @brief Set the direction for a single line at given offset.
> +	 * @param direction New direction.
> +	 * @param offset Offset of the line for which to set the direction.
> +	 */
> +	void set_direction(line::direction direction, unsigned int offset);
> +
> +	/**
> +	 * @brief Set the direction for a subset of offsets.
> +	 * @param direction New direction.
> +	 * @param offsets Vector of line offsets for which to set the direction.
> +	 */
> +	void set_direction(line::direction direction, const line::offsets& offsets);
> +

s/subset of offsets/subset of lines/g

@param Offsets of the lines to set.

Similarly elsewhere, i.e.
s/Vector of line offsets for which to set the <attr>/Offsets of the lines to
set/g

> +	/**
> +	 * @brief Get the default direction setting.
> +	 * @return Direction setting that would have been used for any offset
> +	 * 	   not assigned its own direction value.
> +	 */
> +	line::direction direction(void) const;
> +

s/used for any offset/used for any line/g

> +	/**
> +	 * @brief Get the direction setting for a given offset.
> +	 * @param offset Line offset for which to read the direction setting.
> +	 * @return Direction setting that would have been used for given offset
> +	 *         if the config object was used in a request at the time of
> +	 *         the call.
> +	 */
> +	line::direction direction(unsigned int offset) const;
> +

s/setting for a given offset/setting for a line/g

@param offset Offset of the line to read.
Similarly elsewhere.

s/used for given offset/used for the line/g

> +	/**
> +	 * @brief Set the default edge event detection.
> +	 * @param edge Type of edge events to detect.
> +	 */
> +	void set_edge_detection(line::edge edge);
> +

s/edge event detection/edge detection/g

<snip>

> +
> +	/**
> +	 * @brief Get the offsets for which this config object contains at
> +	 *        least one setting that is different from the defaults.
> +	 * @return Vector of line offsets with at least one overridden setting.
> +	 */
> +	line::offsets overridden_offsets(void) const;
> +

As per patch 01, shouldn't filter overrides that match the defaults.

> +	/**
> +	 * @brief Convenience helper value for passing an empty list of
> +	 *        offset-to-value mappings to methods of this class.
> +	 * @return Empty line->value mapping vector.
> +	 */
> +	static const line::value_mappings& no_output_values(void);
> +

Does this still have a purpose?

<snip>

> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 */
> +	line_request& operator=(line_request&& other) noexcept;
> +

@return ?

> +	/**
> +	 * @brief Check if this object is valid.
> +	 * @return True if this object's methods can be used, false otherwise.
> +	 *         False usually means the request was released. If the user
> +	 *         calls any of the methods of this class on an object for
> +	 *         which this operator returned false, a logic_error will be
> +	 *         thrown.
> +	 */
> +	explicit operator bool(void) const noexcept;
> +

It should throw request_released. That exception is defined but not used.

> +	/**
> +	 * @brief Release the GPIO chip and free all associated resources.
> +	 * @note The object can still be used after this method is called but
> +	 *       using any of the mutators will result in throwing
> +	 *       a logic_error exception.
> +	 */
> +	void release(void);
> +
> +	/**
> +	 * @brief Get the number of requested lines.
> +	 * @return Number of lines in this request.
> +	 */
> +	unsigned int num_lines(void) const;
> +
> +	/**
> +	 * @brief Get the list of offsets of requested lines.
> +	 * @return List of hardware offsets of the lines in this request.
> +	 */
> +	line::offsets offsets(void) const;
> +
> +	/**
> +	 * @brief Get the value of a single requested line.
> +	 * @param offset Offset of the line to read within the chip.
> +	 * @return Current line value.
> +	 */
> +	int get_value(unsigned int offset);
> +
> +	/**
> +	 * @brief Get the values of a subset of requested lines.
> +	 * @param offsets Vector of line offsets
> +	 * @return Vector of lines values with indexes of values corresponding
> +	 *         to those of the offsets.
> +	 */
> +	line::values get_values(const line::offsets& offsets);
> +

@return Line values in the same order as offsets.

> +	/**
> +	 * @brief Get the values of all requested lines.
> +	 * @return List of read values.
> +	 */
> +	line::values get_values(void);
> +
> +	/**
> +	 * @brief Get the values of a subset of requested lines into a vector
> +	 *        supplied by the caller.
> +	 * @param offsets Vector of line offsets.
> +	 * @param values Vector for storing the values. Its size must be at
> +	 *               least that of the offsets vector. The indexes of read
> +	 *               values will correspond with those in the offsets
> +	 *               vector.
> +	 */
> +	void get_values(const line::offsets& offsets, line::values& values);
> +

s/vector/container/

Similarly elsewhere - don't specify the nature of the container unless
you really need to.

> +	/**
> +	 * @brief Get the values of all requested lines.
> +	 * @param values Array in which the values will be stored. Must hold
> +	 *               at least the number of elements returned by
> +	 *               line_request::num_lines.
> +	 */
> +	void get_values(line::values& values);
> +

Container in which

> +	/**
> +	 * @brief Set the value of a single requested line.
> +	 * @param offset Offset of the line to set within the chip.
> +	 * @param value New line value.
> +	 */
> +	void set_value(unsigned int offset, int value);
> +

s/within the chip//

> +	/**
> +	 * @brief Set the values of a subset of requested lines.
> +	 * @param values Vector containing a set of offset->value mappings.
> +	 */
> +	void set_values(const line::value_mappings& values);
> +
> +	/**
> +	 * @brief Set the values of a subset of requested lines.
> +	 * @param offsets Vector containing the offsets of lines to set.
> +	 * @param values Vector containing new values with indexes
> +	 *               corresponding with those in the offsets vector.
> +	 */
> +	void set_values(const line::offsets& offsets, const line::values& values);
> +

@param values New values in same order as offsets.

> +	/**
> +	 * @brief Set the values of all requested lines.
> +	 * @param values Array of new line values. The size must be equal to
> +	 *               the value returned by line_request::num_lines.
> +	 */
> +	void set_values(const line::values& values);
> +
> +	/**
> +	 * @brief Apply new config options to requested lines.
> +	 * @param config New configuration.
> +	 */
> +	void reconfigure_lines(const line_config& config);
> +
> +	/**
> +	 * @brief Get the file descriptor number associated with this line
> +	 *        request.
> +	 * @return File descriptor number.
> +	 */
> +	int fd(void) const;
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
> +	unsigned int edge_event_read(edge_event_buffer& buffer);
> +

@note This method can block unless edge_event_wait() returns true.

> +	/**
> +	 * @brief Read a number of edge events from this request.
> +	 * @param buffer Edge event buffer to read events into.
> +	 * @param max_events Maximum number of events to read. Limited by the
> +	 *                   capacity of the buffer.
> +	 * @return Number of events read.
> +	 */
> +	unsigned int edge_event_read(edge_event_buffer& buffer, unsigned int max_events);
> +

and again here.

<snip>

> +	/**
> +	 * @brief Set line offsets for this request.
> +	 * @param offsets Vector of line offsets to request.
> +	 */
> +	void set_offsets(const line::offsets& offsets) noexcept;
> +

@brief Set the offsets of the lines for this request config.

Leaning towards renaming this set_lines(), and similarly elsewhere
including the C API, but I can live with it as all it is setting is the
offsets of the lines.

> +	/**
> +	 * @brief Get the number of offsets configured in this request config.
> +	 * @return Number of line offsets in this request config.
> +	 */
> +	unsigned int num_offsets(void) const noexcept;
> +
> +	/**
> +	 * @brief Get the hardware offsets of lines in this request config.
> +	 * @return List of line offsets.
> +	 */
> +	line::offsets offsets(void) const;
> +

Drop "hardware" as it implies there is more than one type of offset.

<snip>

> +GPIOD_CXX_API ::std::ostream& operator<<(::std::ostream& out, const line_config& config)
> +{
> +	out << "line_config(defaults=(direction=" << direction_names.at(config.direction()) <<
> +	       "edge_detection=" << edge_names.at(config.edge_detection()) <<
> +	       "bias=" << bias_names.at(config.bias()) <<
> +	       "drive=" << drive_names.at(config.drive()) <<
> +	       (config.active_low() ? "active-low" : "active-high") <<
> +	       "debounce_period=" << config.debounce_period_us() << "us" <<
> +	       "event_clock=" << clock_names.at(config.event_clock()) <<
> +	       "default_output_value=" << config.output_value() <<
> +	       ")";
> +
> +	if (config.num_overridden_offsets()) {
> +		out << "overrides=[";
> +
> +		for (const auto& offset: config.overridden_offsets()) {
> +			out << "(offset=" << offset <<
> +			       "direction=" << direction_names.at(config.direction(offset)) <<
> +			       "edge_detection=" << edge_names.at(config.edge_detection(offset)) <<
> +			       "bias=" << bias_names.at(config.bias(offset)) <<
> +			       "drive=" << drive_names.at(config.drive(offset)) <<
> +			       (config.active_low(offset) ? "active-low" : "active-high") <<
> +			       "debounce_period=" << config.debounce_period_us(offset) <<
> +			       "event_clock=" << clock_names.at(config.event_clock(offset)) <<
> +			       "output_value=" << config.output_value(offset) <<
> +			       ")";
> +		}
> +
> +		out << "]";
> +	}
> +
> +	out << ")";
> +
> +	return out;
> +}
> +

This stringification is both too verbose (reporting fields that may not
be overridden) and too terse (not reporting lines that are overridden
with the default value).

What are you wanting to display here - the full state (what the user has
set) or the effective state (what the kernel will see)?
If the former then include the defaults and all overrides -
even when overridden to the default - but not attributes that are not
overridden.
If the latter then as per the full state but filter out overrides that
correspond to the default or that are ineffective (e.g. the default
edge_detection when all lines are outputs).  And maybe filter out the
defaults that match the kernel defaults?

<snip>

> +void line_request::impl::throw_if_released(void) const
> +{
> +	if (!this->request)
> +		throw ::std::logic_error("GPIO lines have been released");
> +}
> +

Should throw request_released.

<snip>

> +GPIOD_CXX_API int line_request::get_value(unsigned int offset)
> +{
> +	return this->get_values({ offset }).front();
> +}

The one-liner is nice and brief, but is it really better than just calling
::gpiod_line_request_get_value() directly?  That would avoid the temp
vectors and exercise a bit more of the C API.

Similarly set_value().

Cheers,
Kent.
