Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2CA4E87AC
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Mar 2022 14:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbiC0MXn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 27 Mar 2022 08:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbiC0MXn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2022 08:23:43 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9DB37A06
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2022 05:22:00 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id l129so1624573pga.3
        for <linux-gpio@vger.kernel.org>; Sun, 27 Mar 2022 05:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L7uD3dtamB1sFa3vQPGaZ5W1NKETb46bcW9jN+eJKWQ=;
        b=AvkzfyTjtEVAnNcY3QKwC6f5/uwcxkMnIbHQ/Hz/xysXGfJadbjA0Pwq4Qwm0esCB8
         TN/iO4s43v5IRXPG8CwPQ9Axv7OT1oLlnY8pAJ82sYCtMy+42wuOYY2sHICEBQ52Im+j
         vleqBA1VGnoI2VM4xgU0eRqDld1Sz8KPlMlRDmEawpP5ORiLV0VtXWLTd2X14OHmxxEC
         45qFfcDOWqgJpE2vMUtPZx0XcxUBC8eVDdfeJx+dXlBFnQnuzXRZShXwGzWTuxMNg7Ut
         PANRA0/iozFjvuSqmo4ttLkoHTY4A2RalpnvJLHszB0kY69Qgvi3xQ1mX5QmAt0p0/ME
         XTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L7uD3dtamB1sFa3vQPGaZ5W1NKETb46bcW9jN+eJKWQ=;
        b=7glPKY7gwb2eLKITdb6yXWTYyQY0uNYVq1FzFie1KQGP8KfUf/e9ya7CaXTpq5BcmT
         NQwf+YkJhxOFOxtEN5WsLoCYPcoT8ELaoj7f8Aa0/sXW3DB940zK9Sz6UQmkqHlIk4AG
         guNVf5aJqIYK/XTbkgI/TU1+qCtyqeOIJM1M+vmIdkKwQZFgNBe+XjOZc3IT3hZowwRS
         aiUrOzFdkEKUjv7+LZEw5mVLK4X8ylH8VD0FYHC67TZxT9zjfhAGam9p9FHC4ZVMroy+
         66wFj3nzawsGp+5YTmXvWud0r9RDfqCHpBuTG4RjPLZpabCzv3Z0nLL90DECTK25SfoE
         c94g==
X-Gm-Message-State: AOAM5332w3mhe+J2LfErj9RUl5nA8TTXfr9nmRG+Gyc4pWhrJEI5EQx/
        IAXkAt9624zY5J/F78J5Ilo=
X-Google-Smtp-Source: ABdhPJwc/Vr53Iae66QtrWjeP9cVBoQeROlPqjVSiAKY1+W4XMalfIl2nBy3nnqu5MU5is/ctXs7Vg==
X-Received: by 2002:a63:1613:0:b0:382:2a7f:5ca1 with SMTP id w19-20020a631613000000b003822a7f5ca1mr6641375pgl.151.1648383719719;
        Sun, 27 Mar 2022 05:21:59 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id r4-20020a638f44000000b0038105776895sm10096502pgn.76.2022.03.27.05.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 05:21:58 -0700 (PDT)
Date:   Sun, 27 Mar 2022 20:21:53 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v5] bindings: cxx: implement C++ bindings
 for libgpiod v2.0
Message-ID: <20220327122153.GA24870@sol>
References: <20220323142236.670890-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323142236.670890-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 23, 2022 at 03:22:36PM +0100, Bartosz Golaszewski wrote:
> This rewrites the C++ bindings for libgpiod in order to work with v2.0
> version of the C API. The C++ standard use is C++17 which is well
> supported in GCC. The documentation covers the entire API so for details
> please refer to it, the tests and example programs.
> 

So C++17 for cxx bindings, but still C89 for core?
Maybe time to switch that to C99?

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>

Would've been nice to split this into several patches to make it more
manageable.  As it is I'm reluctant to suggest any changes as I really
don't want to see this go to a v6 :-(.

Maybe a patch each for headers, impl, tests and examples?
If nothing else that would be a better order than what we find below.
My comments below may be misordered for the same reason.

Alternatively, I don't have any major issues with this patch, so I would
also be ok with applying it as is and refining it from there.

Btw, I no longer actively use C++, so I'm not a good judge of what is
idomatic, I'm just pointing out what looks odd to me.

Anyway, enough waffle, let's dive right in...

> ---
> v4 -> v5:
> 
> While this is technically the fifth iteration of C++ bindings I'm posting, the
> change are so many, it doesn't make sense to list them here - especially since
> the C API changed in the meantime too. This time the tests have been rewritten
> as well so the bindings can actually be tested using gpio-sim.
> 
>  Doxyfile.in                                 |   4 +-
>  bindings/cxx/Makefile.am                    |  23 +-
>  bindings/cxx/chip-info.cpp                  |  74 ++
>  bindings/cxx/chip.cpp                       | 213 +++--
>  bindings/cxx/edge-event-buffer.cpp          | 115 +++
>  bindings/cxx/edge-event.cpp                 | 135 +++
>  bindings/cxx/examples/Makefile.am           |  12 +-
>  bindings/cxx/examples/gpiodetectcxx.cpp     |  10 +-
>  bindings/cxx/examples/gpiofindcxx.cpp       |   2 +-
>  bindings/cxx/examples/gpiogetcxx.cpp        |  19 +-
>  bindings/cxx/examples/gpioinfocxx.cpp       |  64 +-
>  bindings/cxx/examples/gpiomoncxx.cpp        |  53 +-
>  bindings/cxx/examples/gpiosetcxx.cpp        |  33 +-
>  bindings/cxx/exception.cpp                  | 119 +++
>  bindings/cxx/gpiod.hpp                      | 944 +-------------------
>  bindings/cxx/gpiodcxx/Makefile.am           |  18 +
>  bindings/cxx/gpiodcxx/chip-info.hpp         | 105 +++
>  bindings/cxx/gpiodcxx/chip.hpp              | 179 ++++
>  bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 129 +++
>  bindings/cxx/gpiodcxx/edge-event.hpp        | 137 +++
>  bindings/cxx/gpiodcxx/exception.hpp         | 158 ++++
>  bindings/cxx/gpiodcxx/info-event.hpp        | 123 +++
>  bindings/cxx/gpiodcxx/line-config.hpp       | 564 ++++++++++++
>  bindings/cxx/gpiodcxx/line-info.hpp         | 176 ++++
>  bindings/cxx/gpiodcxx/line-request.hpp      | 221 +++++
>  bindings/cxx/gpiodcxx/line.hpp              | 274 ++++++
>  bindings/cxx/gpiodcxx/misc.hpp              |  44 +
>  bindings/cxx/gpiodcxx/request-config.hpp    | 163 ++++
>  bindings/cxx/gpiodcxx/timestamp.hpp         | 122 +++
>  bindings/cxx/info-event.cpp                 | 102 +++
>  bindings/cxx/internal.cpp                   |  28 +
>  bindings/cxx/internal.hpp                   | 208 ++++-
>  bindings/cxx/iter.cpp                       |  60 --
>  bindings/cxx/line-config.cpp                | 685 ++++++++++++++
>  bindings/cxx/line-info.cpp                  | 189 ++++
>  bindings/cxx/line-request.cpp               | 224 +++++
>  bindings/cxx/line.cpp                       | 331 ++-----
>  bindings/cxx/line_bulk.cpp                  | 366 --------
>  bindings/cxx/misc.cpp                       |  20 +
>  bindings/cxx/request-config.cpp             | 174 ++++
>  bindings/cxx/tests/Makefile.am              |  27 +-
>  bindings/cxx/tests/check-kernel.cpp         |  48 +
>  bindings/cxx/tests/gpio-mockup.cpp          | 153 ----
>  bindings/cxx/tests/gpio-mockup.hpp          |  94 --
>  bindings/cxx/tests/gpiod-cxx-test.cpp       |  55 --
>  bindings/cxx/tests/gpiosim.cpp              | 264 ++++++
>  bindings/cxx/tests/gpiosim.hpp              |  69 ++
>  bindings/cxx/tests/helpers.cpp              |  37 +
>  bindings/cxx/tests/helpers.hpp              |  36 +
>  bindings/cxx/tests/tests-chip-info.cpp      |  91 ++
>  bindings/cxx/tests/tests-chip.cpp           | 219 +++--
>  bindings/cxx/tests/tests-edge-event.cpp     | 417 +++++++++
>  bindings/cxx/tests/tests-event.cpp          | 280 ------
>  bindings/cxx/tests/tests-info-event.cpp     | 198 ++++
>  bindings/cxx/tests/tests-iter.cpp           |  21 -
>  bindings/cxx/tests/tests-line-config.cpp    | 270 ++++++
>  bindings/cxx/tests/tests-line-info.cpp      | 140 +++
>  bindings/cxx/tests/tests-line-request.cpp   | 494 ++++++++++
>  bindings/cxx/tests/tests-line.cpp           | 467 ----------
>  bindings/cxx/tests/tests-misc.cpp           |  78 ++
>  bindings/cxx/tests/tests-request-config.cpp | 155 ++++
>  configure.ac                                |   1 +
>  62 files changed, 7270 insertions(+), 2964 deletions(-)
>  create mode 100644 bindings/cxx/chip-info.cpp
>  create mode 100644 bindings/cxx/edge-event-buffer.cpp
>  create mode 100644 bindings/cxx/edge-event.cpp
>  create mode 100644 bindings/cxx/exception.cpp
>  create mode 100644 bindings/cxx/gpiodcxx/Makefile.am
>  create mode 100644 bindings/cxx/gpiodcxx/chip-info.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/chip.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/edge-event-buffer.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/edge-event.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/exception.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/info-event.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/line-config.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/line-info.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/line-request.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/line.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/misc.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/request-config.hpp
>  create mode 100644 bindings/cxx/gpiodcxx/timestamp.hpp
>  create mode 100644 bindings/cxx/info-event.cpp
>  create mode 100644 bindings/cxx/internal.cpp
>  delete mode 100644 bindings/cxx/iter.cpp
>  create mode 100644 bindings/cxx/line-config.cpp
>  create mode 100644 bindings/cxx/line-info.cpp
>  create mode 100644 bindings/cxx/line-request.cpp
>  delete mode 100644 bindings/cxx/line_bulk.cpp
>  create mode 100644 bindings/cxx/misc.cpp
>  create mode 100644 bindings/cxx/request-config.cpp
>  create mode 100644 bindings/cxx/tests/check-kernel.cpp
>  delete mode 100644 bindings/cxx/tests/gpio-mockup.cpp
>  delete mode 100644 bindings/cxx/tests/gpio-mockup.hpp
>  delete mode 100644 bindings/cxx/tests/gpiod-cxx-test.cpp
>  create mode 100644 bindings/cxx/tests/gpiosim.cpp
>  create mode 100644 bindings/cxx/tests/gpiosim.hpp
>  create mode 100644 bindings/cxx/tests/helpers.cpp
>  create mode 100644 bindings/cxx/tests/helpers.hpp
>  create mode 100644 bindings/cxx/tests/tests-chip-info.cpp
>  create mode 100644 bindings/cxx/tests/tests-edge-event.cpp
>  delete mode 100644 bindings/cxx/tests/tests-event.cpp
>  create mode 100644 bindings/cxx/tests/tests-info-event.cpp
>  delete mode 100644 bindings/cxx/tests/tests-iter.cpp
>  create mode 100644 bindings/cxx/tests/tests-line-config.cpp
>  create mode 100644 bindings/cxx/tests/tests-line-info.cpp
>  create mode 100644 bindings/cxx/tests/tests-line-request.cpp
>  delete mode 100644 bindings/cxx/tests/tests-line.cpp

No tests for line.cpp?
Should still be some tests for the streaming operators, even if it is
just to provide an example of what to expect.

>  create mode 100644 bindings/cxx/tests/tests-misc.cpp
>  create mode 100644 bindings/cxx/tests/tests-request-config.cpp
> 

[snip]

> diff --git a/bindings/cxx/examples/gpiomoncxx.cpp b/bindings/cxx/examples/gpiomoncxx.cpp
> index 4d6ac6e..db053dd 100644
> --- a/bindings/cxx/examples/gpiomoncxx.cpp
> +++ b/bindings/cxx/examples/gpiomoncxx.cpp
> @@ -3,29 +3,27 @@
>  
>  /* Simplified C++ reimplementation of the gpiomon tool. */
>  
> -#include <gpiod.hpp>
> -
> +#include <chrono>
>  #include <cstdlib>
> +#include <gpiod.hpp>
>  #include <iostream>
>  
>  namespace {
>  
> -void print_event(const ::gpiod::line_event& event)
> +void print_event(const ::gpiod::edge_event& event)
>  {
> -	if (event.event_type == ::gpiod::line_event::RISING_EDGE)
> +	if (event.type() == ::gpiod::edge_event::event_type::RISING_EDGE)
>  		::std::cout << " RISING EDGE";
> -	else if (event.event_type == ::gpiod::line_event::FALLING_EDGE)
> -		::std::cout << "FALLING EDGE";
>  	else
> -		throw ::std::logic_error("invalid event type");
> +		::std::cout << "FALLING EDGE";
>  
>  	::std::cout << " ";
>  
> -	::std::cout << ::std::chrono::duration_cast<::std::chrono::seconds>(event.timestamp).count();
> +	::std::cout << event.timestamp_ns() / 1000000000;
>  	::std::cout << ".";
> -	::std::cout << event.timestamp.count() % 1000000000;
> +	::std::cout << event.timestamp_ns() % 1000000000;
>  
> -	::std::cout << " line: " << event.source.offset();
> +	::std::cout << " line: " << event.line_offset();
>  
>  	::std::cout << ::std::endl;
>  }
> @@ -39,25 +37,36 @@ int main(int argc, char **argv)
>  		return EXIT_FAILURE;
>  	}
>  
> -	::std::vector<unsigned int> offsets;
> +	::gpiod::line::offsets offsets;
>  	offsets.reserve(argc);
>  	for (int i = 2; i < argc; i++)
>  		offsets.push_back(::std::stoul(argv[i]));
>  
>  	::gpiod::chip chip(argv[1]);
> -	auto lines = chip.get_lines(offsets);
> -
> -	lines.request({
> -		argv[0],
> -		::gpiod::line_request::EVENT_BOTH_EDGES,
> -		0,
> -	});
> +	auto request = chip.request_lines(
> +			::gpiod::request_config({
> +				{ ::gpiod::request_config::property::OFFSETS, offsets},
> +				{ ::gpiod::request_config::property::CONSUMER, "gpiomoncxx"},
> +			}),
> +			::gpiod::line_config({
> +				{
> +					::gpiod::line_config::property::DIRECTION,
> +					::gpiod::line::direction::INPUT
> +				},
> +				{
> +					::gpiod::line_config::property::EDGE,
> +					::gpiod::line::edge::BOTH
> +				}
> +			}));
> +

Would be good to close the chip to highlight the fact that the chip is not
required once the lines are requested.

Or use ::gpiod::request_lines(path,request_config,line_config) to
request the lines.

> +	::gpiod::edge_event_buffer buffer;
>  
>  	for (;;) {
> -		auto events = lines.event_wait(::std::chrono::seconds(1));
> -		if (events) {
> -			for (auto& it: events)
> -				print_event(it.event_read());
> +		if (request.wait_edge_event(::std::chrono::seconds(5))) {
> +			request.read_edge_event(buffer);
> +
> +			for (const auto& event: buffer)
> +				print_event(event);
>  		}
>  	}
>  

What is the purpose of the wait_edge_event() here?
Wouldn't read_edge_event() block until the next event?

This example should be minimal and demonstrate how the code should
normally be used. e.g.

        for (const auto& event: request.events_iter())
                  print_event(event);

(assuming the addition of an iterator wrapping request and event buffer)

If you want to showcase more complex examples then provide them separately.

[snip]

> diff --git a/bindings/cxx/gpiodcxx/chip-info.hpp b/bindings/cxx/gpiodcxx/chip-info.hpp
> new file mode 100644
> index 0000000..9313e88

[snip]

> +
> +/**
> + * @brief Stream insertion operator for GPIO chip objects.

chip info objects

> + * @param out Output stream to write to.
> + * @param chip GPIO chip to insert into the output stream.
> + * @return Reference to out.
> + */
> +::std::ostream& operator<<(::std::ostream& out, const chip_info& chip);
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_CHIP_INFO_HPP__ */
> diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
> new file mode 100644
> index 0000000..7cc2156
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/chip.hpp
> @@ -0,0 +1,179 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file chip.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_CHIP_HPP__
> +#define __LIBGPIOD_CXX_CHIP_HPP__
> +
> +#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
> +#error "Only gpiod.hpp can be included directly."
> +#endif
> +
> +#include <chrono>
> +#include <cstddef>
> +#include <iostream>
> +#include <filesystem>
> +#include <memory>
> +
> +#include "line.hpp"
> +
> +namespace gpiod {
> +
> +class chip_info;
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
> +	 * @brief Instantiates a new chip object by opening the device file
> +	 *        indicated by the path argument.
> +	 * @param path Path to the device file to open.
> +	 */
> +	explicit chip(const ::std::filesystem::path& path);
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
> +	chip& operator=(const chip& other) = delete;
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	chip& operator=(chip&& other) noexcept;
> +
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
> +	/**
> +	 * @brief Get the filesystem path that was used to open this GPIO chip.
> +	 * @return Path to the underlying character device file.
> +	 */
> +	::std::filesystem::path path(void) const;
> +
> +	/**
> +	 * @brief Get information about the chip.
> +	 * @return New chip_info object.
> +	 */
> +	chip_info get_info(void) const;
> +
> +	/**
> +	 * @brief Retrieve the current snapshot of line information for a
> +	 *        single line.
> +	 * @param offset Offset of the line to get the info for.
> +	 * @return New ::gpiod::line_info object.
> +	 */
> +	line_info get_line_info(line::offset offset) const;
> +
> +	/**
> +	 * @brief Wrapper around ::gpiod::chip::get_line_info that retrieves
> +	 *        the line info and starts watching the line for changes.
> +	 * @param offset Offset of the line to get the info for.
> +	 * @return New ::gpiod::line_info object.
> +	 */
> +	line_info watch_line_info(line::offset offset) const;
> +
> +	/**
> +	 * @brief Stop watching the line at given offset for info events.
> +	 * @param offset Offset of the line to get the info for.
> +	 */
> +	void unwatch_line_info(line::offset offset) const;
> +
> +	/**
> +	 * @brief Get the file descriptor associated with this chip.
> +	 * @return File descriptor number.
> +	 */
> +	int fd(void) const;
> +
> +	/**
> +	 * @brief Wait for line status events on any of the watched lines
> +	 *        exposed by this chip.
> +	 * @param timeout Wait time limit in nanoseconds.
> +	 * @return True if at least one event is ready to be read. False if the
> +	 *         wait timed out.
> +	 */
> +	bool wait_info_event(const ::std::chrono::nanoseconds& timeout) const;
> +
> +	/**
> +	 * @brief Read a single line status change event from this chip.
> +	 * @return New info_event object.
> +	 */
> +	info_event read_info_event(void) const;
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
> +				   const line_config& line_cfg);
> +

A common use case is to just want to request a line, so a top-level
version of this that hides the chip object from the user might be nice.
i.e. 

    line_request request_lines(const ::std::filesystem::path& path,
                               const request_config& req_cfg,
                               const line_config& line_cfg);

Also applies to C API.

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
> + * @param chip GPIO chip to insert into the output stream.
> + * @return Reference to out.
> + */
> +::std::ostream& operator<<(::std::ostream& out, const chip& chip);
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_CHIP_HPP__ */

[snip]

> +++ b/bindings/cxx/gpiodcxx/line-request.hpp
> @@ -0,0 +1,221 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file line-request.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_LINE_REQUEST_HPP__
> +#define __LIBGPIOD_CXX_LINE_REQUEST_HPP__
> +
> +#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
> +#error "Only gpiod.hpp can be included directly."
> +#endif
> +
> +#include <chrono>
> +#include <cstddef>
> +#include <iostream>
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
> +	line_request& operator=(const line_request& other) = delete;
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 */
> +	line_request& operator=(line_request&& other) noexcept;
> +
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
> +	::std::size_t num_lines(void) const;
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
> +	line::value get_value(line::offset offset);
> +
> +	/**
> +	 * @brief Get the values of a subset of requested lines.
> +	 * @param offsets Vector of line offsets
> +	 * @return Vector of lines values with indexes of values corresponding
> +	 *         to those of the offsets.
> +	 */
> +	line::values get_values(const line::offsets& offsets);
> +
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
> +	/**
> +	 * @brief Get the values of all requested lines.
> +	 * @param values Array in which the values will be stored. Must hold
> +	 *               at least the number of elements returned by
> +	 *               line_request::num_lines.
> +	 */
> +	void get_values(line::values& values);
> +
> +	/**
> +	 * @brief Set the value of a single requested line.
> +	 * @param offset Offset of the line to set within the chip.
> +	 * @param value New line value.
> +	 */
> +	void set_value(line::offset offset, line::value value);
> +
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
> +	bool wait_edge_event(const ::std::chrono::nanoseconds& timeout) const;
> +
> +	/**
> +	 * @brief Read a number of edge events from this request up to the
> +	 *        maximum capacity of the buffer.
> +	 * @param buffer Edge event buffer to read events into.
> +	 * @return Number of events read.
> +	 */
> +	::std::size_t read_edge_event(edge_event_buffer& buffer);
> +
> +	/**
> +	 * @brief Read a number of edge events from this request.
> +	 * @param buffer Edge event buffer to read events into.
> +	 * @param max_events Maximum number of events to read. Limited by the
> +	 *                   capacity of the buffer.
> +	 * @return Number of events read.
> +	 */
> +	::std::size_t read_edge_event(edge_event_buffer& buffer, ::std::size_t max_events);
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

Just wanting to get events from a request is a common use case, and
having to use an edge_event_buffer is tedious (refer to the gpiomoncxx
example)
How about an iterator that wraps the request and an edge_event_buffer
and provides events?
I refer to this elsewhere as request.events_iter().

> +
> +/**
> + * @brief Stream insertion operator for line requests.
> + * @param out Output stream to write to.
> + * @param request Line request object to insert into the output stream.
> + * @return Reference to out.
> + */
> +::std::ostream& operator<<(::std::ostream& out, const line_request& request);
> +
> +/**
> + * @}
> + */
> +
> +} /* namespace gpiod */
> +
> +#endif /* __LIBGPIOD_CXX_LINE_REQUEST_HPP__ */
> diff --git a/bindings/cxx/gpiodcxx/line.hpp b/bindings/cxx/gpiodcxx/line.hpp
> new file mode 100644
> index 0000000..8e8a984
> --- /dev/null
> +++ b/bindings/cxx/gpiodcxx/line.hpp
> @@ -0,0 +1,274 @@
> +/* SPDX-License-Identifier: LGPL-3.0-or-later */
> +/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
> +
> +/**
> + * @file line.hpp
> + */
> +
> +#ifndef __LIBGPIOD_CXX_LINE_HPP__
> +#define __LIBGPIOD_CXX_LINE_HPP__
> +
> +#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
> +#error "Only gpiod.hpp can be included directly."
> +#endif
> +
> +#include <ostream>
> +#include <utility>
> +#include <vector>
> +
> +namespace gpiod {
> +
> +/**
> + * @brief Namespace containing various type definitions for GPIO lines.
> + */
> +namespace line {
> +
> +/**
> + * @ingroup gpiod_cxx
> + * @{
> + */
> +
> +/**
> + * @brief Wrapper around unsigned int for representing line offsets.
> + */
> +class offset
> +{
> +public:
> +	/**
> +	 * @brief Constructor with implicit conversion from unsigned int.
> +	 * @param off Line offset.
> +	 */
> +	offset(unsigned int off = 0) : _m_offset(off) {	}
> +
> +	/**
> +	 * @brief Copy constructor.
> +	 * @param other Object to copy.
> +	 */
> +	offset(const offset& other) = default;
> +
> +	/**
> +	 * @brief Move constructor.
> +	 * @param other Object to move.
> +	 */
> +	offset(offset&& other) = default;
> +
> +	~offset(void) = default;
> +
> +	/**
> +	 * @brief Assignment operator.
> +	 * @param other Object to copy.
> +	 * @return Reference to self.
> +	 */
> +	offset& operator=(const offset& other) = default;
> +
> +	/**
> +	 * @brief Move assignment operator.
> +	 * @param other Object to move.
> +	 * @return Reference to self.
> +	 */
> +	offset& operator=(offset&& other) noexcept = default;
> +
> +	/**
> +	 * @brief Conversion operator to `unsigned int`.
> +	 */
> +	operator unsigned int(void) const noexcept
> +	{
> +		return this->_m_offset;
> +	}
> +
> +private:
> +	unsigned int _m_offset;
> +};
> +

Wrapping unsigned int in a class seems like overkill.
Is this just to get the streaming operators for offsets to work?

[snip]

> +GPIOD_CXX_API line::offsets line_request::offsets(void) const
> +{
> +	this->_m_priv->throw_if_released();

redundant as this->num_lines() also does it.

> +
> +	::std::vector<unsigned int> buf(this->num_lines());
> +	line::offsets offsets(this->num_lines());
> +
> +	::gpiod_line_request_get_offsets(this->_m_priv->request.get(), buf.data());
> +
> +	for (unsigned int i = 0; i < this->num_lines(); i++)
> +		offsets[i] = buf[i];
> +

Cache num_lines locally rather than calling num_lines() several times.


[snip]

> +template<typename T>
> +::std::ostream& insert_vector(::std::ostream& out,
> +			      const ::std::string& name, const ::std::vector<T>& vec)
>  {
> -	this->_m_line = nullptr;
> -	this->_m_owner.reset();
> -}
> +	out << name << "([";
> +	::std::copy(vec.begin(), ::std::prev(vec.end()),
> +		    ::std::ostream_iterator<T>(out, ", "));
> +	out << vec.back();
> +	out << "])";
>  

What formatting are you after for vectors?
Is the double bracketing necessary?

[snip]

> +TEST_CASE("line_request stream insertion operator works", "[line-request]")
> +{
> +	::gpiosim::chip sim({{ simprop::NUM_LINES, 4 }});
> +	::gpiod::chip chip(sim.dev_path());
> +
> +	auto request = chip.request_lines(
> +		::gpiod::request_config({
> +			{ reqprop::OFFSETS, offsets({ 3, 1, 0, 2 }) }
> +		}),
> +		::gpiod::line_config()
> +	);
> +
> +	::std::stringstream buf, expected;
> +
> +	expected << "line_request(num_lines=4, line_offsets=[offsets([3, 1, 0, 2])], fd=" <<
> +		    request.fd() << ")";
> +

Still not sure what formatting you are going for with the vectors.
And the line_offsets=[] is not consistent with the offsets=() used in
request_config.

[snip]

> +TEST_CASE("request_config stream insertion operator works", "[request-config]")
> +{
> +	::gpiod::request_config cfg({
> +		{ property::CONSUMER, "foobar" },
> +		{ property::OFFSETS, offsets({ 0, 1, 2, 3 })},
> +		{ property::EVENT_BUFFER_SIZE, 32 }
> +	});
> +
> +	::std::stringstream buf;
> +
> +	buf << cfg;
> +
> +	::std::string expected("request_config(consumer='foobar', num_offsets=4, "
> +			       "offsets=(offsets([0, 1, 2, 3])), event_buffer_size=32)");
> +

The streaming output stutters.
"offsets=(offsets([0, 1, 2, 3]))" should be "offsets=([0, 1, 2, 3])"?
And even then one of the sets of brackets is redundant.

> +	REQUIRE_THAT(buf.str(), Catch::Equals(expected));
> +}
> +
> +} /* namespace */
> diff --git a/configure.ac b/configure.ac
> index f8d34ed..ab03673 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -239,6 +239,7 @@ AC_CONFIG_FILES([Makefile
>  		 bindings/cxx/libgpiodcxx.pc
>  		 bindings/Makefile
>  		 bindings/cxx/Makefile
> +		 bindings/cxx/gpiodcxx/Makefile
>  		 bindings/cxx/examples/Makefile
>  		 bindings/cxx/tests/Makefile
>  		 bindings/python/Makefile
> -- 
> 2.30.1
> 

Phew.  So nothing major.

Cheers,
Kent.
