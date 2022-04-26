Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5010C50FD98
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Apr 2022 14:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348939AbiDZMyI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Apr 2022 08:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350255AbiDZMyF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2022 08:54:05 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AFF3B2B3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:50:54 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id w4so25277059wrg.12
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NFvOQH4B5Cd/Zv8HS0lvlBfYoqpR4yOoBOxheFJr04E=;
        b=PqQQnnyALMoPQU+BqW6b5D/+BzUu+yppnbS0w1xZbXE4S4sq+4oXexTEj3/5NUZsWr
         x0S7LXVbnUSvo+AgHS93DrcJuegHSPcvEHQFGNNgGPoVUdiNEbrM9LrrgvEwDFdIiQ2t
         fq9xyyN/3CLP0RyCb06+WcOqTiYwRhUlB4BOrGmCcRhesyLcqr+sSEjk8J52/NAxdL3E
         efidx8sIoU54DDXMdkp5NpmGf2OLsPn4UY0/BBNwW2QkfSZIkyBr6cUyHC9SAB3XVwe9
         P5alQAvv/wttRKKVXmS8JhfLJosuNL5Wqz2IltyjZy/9uD73PH515CxPZeUQhER+PSat
         /0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NFvOQH4B5Cd/Zv8HS0lvlBfYoqpR4yOoBOxheFJr04E=;
        b=kut7tgva+6kRjiUpw6eH/TjMZEu9M/iW4H7Q1No75CtxYS1rgB2Mr++9r/Z28BSYpB
         dwnD6GijjAeVa/Oja5ADMKUxIVGENA0ncH77V5LhKBT84F7SKa5MNazAccVUhHqQ51ep
         Syo+MAqvIoolh6c6LAr311yaSI+mE1mNV0dBnImMpsPWE0MW1n1L+6T+Mdgbgc3RkSov
         p/qrkuyMi5veC6wwAbO6Dd4rkxiWTBNZShD0WeE3s1vpaOY+C9HR0j7QnjQNbWE9Pizn
         Gm6lM0FVdaJVeiPxu+4SjHX3oRN0nwSg5mzJGJ1rInfnXL2zt69+xIjnrvkarGmjHmyt
         0XHg==
X-Gm-Message-State: AOAM530aHHxQzAIJr0/OEBGD0SR6H20GWm3RfbiG2+JBifhWDBIX6c24
        qENGnACXNVDbSsaUlxYrNf5m9g==
X-Google-Smtp-Source: ABdhPJzaIkdih+S3YyVG2yK3+jTEOQtNNsc6L5lhLlKF6oLX7yBmxWD0wFHYE/zCmFHoPZnMRCO2JA==
X-Received: by 2002:a05:6000:188b:b0:20a:a7f4:2f8 with SMTP id a11-20020a056000188b00b0020aa7f402f8mr17728272wri.424.1650977451474;
        Tue, 26 Apr 2022 05:50:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:faf0:6ae0:9a53:ee37])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c3b9400b00393ea849663sm6128600wms.30.2022.04.26.05.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 05:50:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [libgpiod v2][PATCH v6 2/5] bindings: cxx: add v2 headers
Date:   Tue, 26 Apr 2022 14:50:20 +0200
Message-Id: <20220426125023.2664623-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220426125023.2664623-1-brgl@bgdev.pl>
References: <20220426125023.2664623-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds the headers for the v2 C++ bindings.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 Doxyfile.in                                 |   4 +-
 bindings/cxx/gpiodcxx/Makefile.am           |  18 +
 bindings/cxx/gpiodcxx/chip-info.hpp         | 105 ++++
 bindings/cxx/gpiodcxx/chip.hpp              | 179 +++++++
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 129 +++++
 bindings/cxx/gpiodcxx/edge-event.hpp        | 137 +++++
 bindings/cxx/gpiodcxx/exception.hpp         | 158 ++++++
 bindings/cxx/gpiodcxx/info-event.hpp        | 123 +++++
 bindings/cxx/gpiodcxx/line-config.hpp       | 564 ++++++++++++++++++++
 bindings/cxx/gpiodcxx/line-info.hpp         | 176 ++++++
 bindings/cxx/gpiodcxx/line-request.hpp      | 221 ++++++++
 bindings/cxx/gpiodcxx/line.hpp              | 274 ++++++++++
 bindings/cxx/gpiodcxx/misc.hpp              |  44 ++
 bindings/cxx/gpiodcxx/request-config.hpp    | 163 ++++++
 bindings/cxx/gpiodcxx/timestamp.hpp         | 122 +++++
 configure.ac                                |   1 +
 16 files changed, 2417 insertions(+), 1 deletion(-)
 create mode 100644 bindings/cxx/gpiodcxx/Makefile.am
 create mode 100644 bindings/cxx/gpiodcxx/chip-info.hpp
 create mode 100644 bindings/cxx/gpiodcxx/chip.hpp
 create mode 100644 bindings/cxx/gpiodcxx/edge-event-buffer.hpp
 create mode 100644 bindings/cxx/gpiodcxx/edge-event.hpp
 create mode 100644 bindings/cxx/gpiodcxx/exception.hpp
 create mode 100644 bindings/cxx/gpiodcxx/info-event.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-config.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-info.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line-request.hpp
 create mode 100644 bindings/cxx/gpiodcxx/line.hpp
 create mode 100644 bindings/cxx/gpiodcxx/misc.hpp
 create mode 100644 bindings/cxx/gpiodcxx/request-config.hpp
 create mode 100644 bindings/cxx/gpiodcxx/timestamp.hpp

diff --git a/Doxyfile.in b/Doxyfile.in
index 0ff735d..9c85e21 100644
--- a/Doxyfile.in
+++ b/Doxyfile.in
@@ -44,7 +44,9 @@ WARNINGS               = YES
 WARN_IF_UNDOCUMENTED   = YES
 WARN_FORMAT            =
 WARN_LOGFILE           =
-INPUT                  = @top_srcdir@/include/gpiod.h @top_srcdir@/bindings/cxx/gpiod.hpp
+INPUT                  = @top_srcdir@/include/gpiod.h \
+                         @top_srcdir@/bindings/cxx/gpiod.hpp \
+                         @top_srcdir@/bindings/cxx/gpiodcxx/
 SOURCE_BROWSER         = YES
 INLINE_SOURCES         = NO
 REFERENCED_BY_RELATION = YES
diff --git a/bindings/cxx/gpiodcxx/Makefile.am b/bindings/cxx/gpiodcxx/Makefile.am
new file mode 100644
index 0000000..71532e6
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/Makefile.am
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+
+otherincludedir = $(includedir)/gpiodcxx
+otherinclude_HEADERS = \
+	chip.hpp \
+	chip-info.hpp \
+	edge-event-buffer.hpp \
+	edge-event.hpp \
+	exception.hpp \
+	info-event.hpp \
+	line.hpp \
+	line-config.hpp \
+	line-info.hpp \
+	line-request.hpp \
+	misc.hpp \
+	request-config.hpp \
+	timestamp.hpp
diff --git a/bindings/cxx/gpiodcxx/chip-info.hpp b/bindings/cxx/gpiodcxx/chip-info.hpp
new file mode 100644
index 0000000..9313e88
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/chip-info.hpp
@@ -0,0 +1,105 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file chip-info.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_CHIP_INFO_HPP__
+#define __LIBGPIOD_CXX_CHIP_INFO_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <memory>
+#include <ostream>
+
+namespace gpiod {
+
+class chip;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Represents an immutable snapshot of GPIO chip information.
+ */
+class chip_info
+{
+public:
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	chip_info(const chip_info& other);
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	chip_info(chip_info&& other) noexcept;
+
+	~chip_info(void);
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	chip_info& operator=(const chip_info& other);
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	chip_info& operator=(chip_info&& other) noexcept;
+
+	/**
+	 * @brief Get the name of this GPIO chip.
+	 * @return String containing the chip name.
+	 */
+	::std::string name(void) const noexcept;
+
+	/**
+	 * @brief Get the label of this GPIO chip.
+	 * @return String containing the chip name.
+	 */
+	::std::string label(void) const noexcept;
+
+	/**
+	 * @brief Return the number of lines exposed by this chip.
+	 * @return Number of lines.
+	 */
+	::std::size_t num_lines(void) const noexcept;
+
+private:
+
+	chip_info(void);
+
+	struct impl;
+
+	::std::shared_ptr<impl> _m_priv;
+
+	friend chip;
+};
+
+/**
+ * @brief Stream insertion operator for GPIO chip objects.
+ * @param out Output stream to write to.
+ * @param chip GPIO chip to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const chip_info& chip);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_CHIP_INFO_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
new file mode 100644
index 0000000..eae7ed6
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/chip.hpp
@@ -0,0 +1,179 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file chip.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_CHIP_HPP__
+#define __LIBGPIOD_CXX_CHIP_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <chrono>
+#include <cstddef>
+#include <iostream>
+#include <filesystem>
+#include <memory>
+
+#include "line.hpp"
+
+namespace gpiod {
+
+class chip_info;
+class info_event;
+class line_config;
+class line_info;
+class line_request;
+class request_config;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Represents a GPIO chip.
+ */
+class chip
+{
+public:
+
+	/**
+	 * @brief Instantiates a new chip object by opening the device file
+	 *        indicated by the path argument.
+	 * @param path Path to the device file to open.
+	 */
+	explicit chip(const ::std::filesystem::path& path);
+
+	chip(const chip& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	chip(chip&& other) noexcept;
+
+	~chip(void);
+
+	chip& operator=(const chip& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	chip& operator=(chip&& other) noexcept;
+
+	/**
+	 * @brief Check if this object is valid.
+	 * @return True if this object's methods can be used, false otherwise.
+	 *         False usually means the chip was closed. If the user calls
+	 *         any of the methods of this class on an object for which this
+	 *         operator returned false, a logic_error will be thrown.
+	 */
+	explicit operator bool(void) const noexcept;
+
+	/**
+	 * @brief Close the GPIO chip device file and free associated resources.
+	 * @note The chip object can live after calling this method but any of
+	 *       the chip's mutators will throw a logic_error exception.
+	 */
+	void close(void);
+
+	/**
+	 * @brief Get the filesystem path that was used to open this GPIO chip.
+	 * @return Path to the underlying character device file.
+	 */
+	::std::filesystem::path path(void) const;
+
+	/**
+	 * @brief Get information about the chip.
+	 * @return New chip_info object.
+	 */
+	chip_info get_info(void) const;
+
+	/**
+	 * @brief Retrieve the current snapshot of line information for a
+	 *        single line.
+	 * @param offset Offset of the line to get the info for.
+	 * @return New ::gpiod::line_info object.
+	 */
+	line_info get_line_info(line::offset offset) const;
+
+	/**
+	 * @brief Wrapper around ::gpiod::chip::get_line_info that retrieves
+	 *        the line info and starts watching the line for changes.
+	 * @param offset Offset of the line to get the info for.
+	 * @return New ::gpiod::line_info object.
+	 */
+	line_info watch_line_info(line::offset offset) const;
+
+	/**
+	 * @brief Stop watching the line at given offset for info events.
+	 * @param offset Offset of the line to get the info for.
+	 */
+	void unwatch_line_info(line::offset offset) const;
+
+	/**
+	 * @brief Get the file descriptor associated with this chip.
+	 * @return File descriptor number.
+	 */
+	int fd(void) const;
+
+	/**
+	 * @brief Wait for line status events on any of the watched lines
+	 *        exposed by this chip.
+	 * @param timeout Wait time limit in nanoseconds.
+	 * @return True if at least one event is ready to be read. False if the
+	 *         wait timed out.
+	 */
+	bool wait_info_event(const ::std::chrono::nanoseconds& timeout) const;
+
+	/**
+	 * @brief Read a single line status change event from this chip.
+	 * @return New info_event object.
+	 */
+	info_event read_info_event(void) const;
+
+	/**
+	 * @brief Map a GPIO line's name to its offset within the chip.
+	 * @param name Name of the GPIO line to map.
+	 * @return Offset of the line within the chip or -1 if the line with
+	 *         given name is not exposed by this chip.
+	 */
+	int get_line_offset_from_name(const ::std::string& name) const;
+
+	/**
+	 * @brief Request a set of lines for exclusive usage.
+	 * @param req_cfg Request config object.
+	 * @param line_cfg Line config object.
+	 * @return New line_request object.
+	 */
+	line_request request_lines(const request_config& req_cfg,
+				   const line_config& line_cfg);
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+};
+
+/**
+ * @brief Stream insertion operator for GPIO chip objects.
+ * @param out Output stream to write to.
+ * @param chip GPIO chip to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const chip& chip);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_CHIP_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/edge-event-buffer.hpp b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
new file mode 100644
index 0000000..37ac4f5
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file edge-event-buffer.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__
+#define __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <cstddef>
+#include <iostream>
+#include <memory>
+#include <vector>
+
+namespace gpiod {
+
+class edge_event;
+class line_request;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Object into which edge events are read for better performance.
+ *
+ * The edge_event_buffer allows reading edge_event objects into an existing
+ * buffer which improves the performance by avoiding needless memory
+ * allocations.
+ */
+class edge_event_buffer
+{
+public:
+
+	/**
+	 * @brief Constant iterator for iterating over edge events stored in
+	 *        the buffer.
+	 */
+	using const_iterator = ::std::vector<edge_event>::const_iterator;
+
+	/**
+	 * @brief Constructor. Creates a new edge event buffer with given
+	 *        capacity.
+	 * @param capacity Capacity of the new buffer.
+	 */
+	explicit edge_event_buffer(::std::size_t capacity = 64);
+
+	edge_event_buffer(const edge_event_buffer& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	edge_event_buffer(edge_event_buffer&& other) noexcept;
+
+	~edge_event_buffer(void);
+
+	edge_event_buffer& operator=(const edge_event_buffer& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	edge_event_buffer& operator=(edge_event_buffer&& other) noexcept;
+
+	/**
+	 * @brief Get the constant reference to the edge event at given index.
+	 * @param index Index of the event in the buffer.
+	 * @return Constant reference to the edge event.
+	 */
+	const edge_event& get_event(unsigned int index) const;
+
+	/**
+	 * @brief Get the number of edge events currently stored in the buffer.
+	 * @return Number of edge events in the buffer.
+	 */
+	::std::size_t num_events(void) const;
+
+	/**
+	 * @brief Maximum capacity of the buffer.
+	 * @return Buffer capacity.
+	 */
+	::std::size_t capacity(void) const noexcept;
+
+	/**
+	 * @brief Get a constant iterator to the first edge event currently
+	 *        stored in the buffer.
+	 * @return Constant iterator to the first element.
+	 */
+	const_iterator begin(void) const noexcept;
+
+	/**
+	 * @brief Get a constant iterator to the element after the last edge
+	 *        event in the buffer.
+	 * @return Constant iterator to the element after the last edge event.
+	 */
+	const_iterator end(void) const noexcept;
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend line_request;
+};
+
+/**
+ * @brief Stream insertion operator for GPIO edge event buffer objects.
+ * @param out Output stream to write to.
+ * @param buf GPIO edge event buffer object to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const edge_event_buffer& buf);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/edge-event.hpp b/bindings/cxx/gpiodcxx/edge-event.hpp
new file mode 100644
index 0000000..0623880
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/edge-event.hpp
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file edge-event.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_EDGE_EVENT_HPP__
+#define __LIBGPIOD_CXX_EDGE_EVENT_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <cstdint>
+#include <iostream>
+#include <memory>
+
+#include "timestamp.hpp"
+
+namespace gpiod {
+
+class edge_event_buffer;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Immutable object containing data about a single edge event.
+ */
+class edge_event
+{
+public:
+
+	/**
+	 * @brief Edge event types.
+	 */
+	enum class event_type
+	{
+		RISING_EDGE = 1,
+		/**< This is a rising edge event. */
+		FALLING_EDGE
+		/**< This is falling edge event. */
+	};
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	edge_event(const edge_event& other);
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	edge_event(edge_event&& other) noexcept;
+
+	~edge_event(void);
+
+	/**
+	 * @brief Copy assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	edge_event& operator=(const edge_event& other);
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	edge_event& operator=(edge_event&& other) noexcept;
+
+	/**
+	 * @brief Retrieve the event type.
+	 * @return Event type (rising or falling edge).
+	 */
+	event_type type(void) const;
+
+	/**
+	 * @brief Retrieve the event time-stamp.
+	 * @return Time-stamp in nanoseconds as registered by the kernel using
+	 *         the configured edge event clock.
+	 */
+	timestamp timestamp_ns(void) const noexcept;
+
+	/**
+	 * @brief Read the offset of the line on which this event was
+	 *        registered.
+	 * @return Line offset.
+	 */
+	line::offset line_offset(void) const noexcept;
+
+	/**
+	 * @brief Get the global sequence number of this event.
+	 * @return Sequence number of the event relative to all lines in the
+	 *         associated line request.
+	 */
+	unsigned long global_seqno(void) const noexcept;
+
+	/**
+	 * @brief Get the event sequence number specific to the concerned line.
+	 * @return Sequence number of the event relative to this line within
+	 *         the lifetime of the associated line request.
+	 */
+	unsigned long line_seqno(void) const noexcept;
+
+private:
+
+	edge_event(void);
+
+	struct impl;
+	struct impl_managed;
+	struct impl_external;
+
+	::std::shared_ptr<impl> _m_priv;
+
+	friend edge_event_buffer;
+};
+
+/**
+ * @brief Stream insertion operator for edge events.
+ * @param out Output stream to write to.
+ * @param event Edge event to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const edge_event& event);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_EDGE_EVENT_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/exception.hpp b/bindings/cxx/gpiodcxx/exception.hpp
new file mode 100644
index 0000000..f4d525b
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/exception.hpp
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file exception.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_EXCEPTION_HPP__
+#define __LIBGPIOD_CXX_EXCEPTION_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <stdexcept>
+#include <string>
+
+namespace gpiod {
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Exception thrown when an already closed chip is used.
+ */
+class GPIOD_CXX_API chip_closed : public ::std::logic_error
+{
+public:
+
+	/**
+	 * @brief Constructor.
+	 * @param what Human readable reason for error.
+	 */
+	explicit chip_closed(const ::std::string& what);
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy from.
+	 */
+	chip_closed(const chip_closed& other) noexcept;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	chip_closed(chip_closed&& other) noexcept;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy from.
+	 * @return Reference to self.
+	 */
+	chip_closed& operator=(const chip_closed& other) noexcept;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	chip_closed& operator=(chip_closed&& other) noexcept;
+
+	virtual ~chip_closed(void);
+};
+
+/**
+ * @brief Exception thrown when an already released line request is used.
+ */
+class GPIOD_CXX_API request_released : public ::std::logic_error
+{
+public:
+
+	/**
+	 * @brief Constructor.
+	 * @param what Human readable reason for error.
+	 */
+	explicit request_released(const ::std::string& what);
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy from.
+	 */
+	request_released(const request_released& other) noexcept;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	request_released(request_released&& other) noexcept;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy from.
+	 * @return Reference to self.
+	 */
+	request_released& operator=(const request_released& other) noexcept;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	request_released& operator=(request_released&& other) noexcept;
+
+	virtual ~request_released(void);
+};
+
+/**
+ * @brief Exception thrown when the core C library returns an invalid value
+ *        for any of the line_info properties.
+ */
+class GPIOD_CXX_API bad_mapping : public ::std::runtime_error
+{
+public:
+
+	/**
+	 * @brief Constructor.
+	 * @param what Human readable reason for error.
+	 */
+	explicit bad_mapping(const ::std::string& what);
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy from.
+	 */
+	bad_mapping(const bad_mapping& other) noexcept;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	bad_mapping(bad_mapping&& other) noexcept;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy from.
+	 * @return Reference to self.
+	 */
+	bad_mapping& operator=(const bad_mapping& other) noexcept;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	bad_mapping& operator=(bad_mapping&& other) noexcept;
+
+	virtual ~bad_mapping(void);
+};
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_EXCEPTION_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/info-event.hpp b/bindings/cxx/gpiodcxx/info-event.hpp
new file mode 100644
index 0000000..107ca57
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/info-event.hpp
@@ -0,0 +1,123 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file gpiod.h
+ */
+
+#ifndef __LIBGPIOD_CXX_INFO_EVENT_HPP__
+#define __LIBGPIOD_CXX_INFO_EVENT_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <cstdint>
+#include <iostream>
+#include <memory>
+
+#include "timestamp.hpp"
+
+namespace gpiod {
+
+class chip;
+class line_info;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Immutable object containing data about a single line info event.
+ */
+class info_event
+{
+public:
+
+	/**
+	 * @brief Types of info events.
+	 */
+	enum class event_type
+	{
+		LINE_REQUESTED = 1,
+		/**< Line has been requested. */
+		LINE_RELEASED,
+		/**< Previously requested line has been released. */
+		LINE_CONFIG_CHANGED
+		/**< Line configuration has changed. */
+	};
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	info_event(const info_event& other);
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	info_event(info_event&& other) noexcept;
+
+	~info_event(void);
+
+	/**
+	 * @brief Copy assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	info_event& operator=(const info_event& other);
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	info_event& operator=(info_event&& other) noexcept;
+
+	/**
+	 * @brief Type of this event.
+	 * @return Event type.
+	 */
+	event_type type(void) const;
+
+	/**
+	 * @brief Timestamp of the event as returned by the kernel.
+	 * @return Timestamp as a 64-bit unsigned integer.
+	 */
+	::std::uint64_t timestamp_ns(void) const noexcept;
+
+	/**
+	 * @brief Get the new line information.
+	 * @return Constant reference to the line info object containing the
+	 *         line data as read at the time of the info event.
+	 */
+	const line_info& get_line_info(void) const noexcept;
+
+private:
+
+	info_event(void);
+
+	struct impl;
+
+	::std::shared_ptr<impl> _m_priv;
+
+	friend chip;
+};
+
+/**
+ * @brief Stream insertion operator for info events.
+ * @param out Output stream to write to.
+ * @param event GPIO line info event to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const info_event& event);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_INFO_EVENT_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-config.hpp b/bindings/cxx/gpiodcxx/line-config.hpp
new file mode 100644
index 0000000..6d808bd
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-config.hpp
@@ -0,0 +1,564 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file line-config.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_LINE_CONFIG_HPP__
+#define __LIBGPIOD_CXX_LINE_CONFIG_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <any>
+#include <chrono>
+#include <cstddef>
+#include <iostream>
+#include <map>
+#include <memory>
+#include <utility>
+
+namespace gpiod {
+
+class chip;
+class line_request;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Contains a set of line config options used in line requests and
+ *        reconfiguration.
+ */
+class line_config
+{
+public:
+
+	/**
+	 * @brief List of available configuration properties. Used in the
+	 *        constructor, :line_config::set_property_default and
+	 *        :line_config::set_property_override.
+	 */
+	enum class property {
+		DIRECTION = 1,
+		/**< Line direction. */
+		EDGE,
+		/**< Edge detection. */
+		BIAS,
+		/**< Bias. */
+		DRIVE,
+		/**< Drive. */
+		ACTIVE_LOW,
+		/**< Active-low setting. */
+		DEBOUNCE_PERIOD,
+		/**< Debounce period. */
+		EVENT_CLOCK,
+		/**< Event clock. */
+		OUTPUT_VALUE,
+		/**< Output value. */
+		OUTPUT_VALUES,
+		/**< Set of offset-to-value mappings. Only used in the constructor. */
+	};
+
+	/**
+	 * @brief List of configuration properties passed to the constructor.
+	 *        The first member is the property indicator, the second is
+	 *        the value stored as `std::any` that is interpreted by the
+	 *        relevant methods depending on the property value.
+	 */
+	using properties = ::std::map<property, ::std::any>;
+
+	/**
+	 * @brief Stored information about a single configuration override. The
+	 *        first member is the overridden line offset, the second is
+	 *        the property being overridden.
+	 */
+	using override = ::std::pair<line::offset, property>;
+
+	/**
+	 * @brief List of line configuration overrides.
+	 */
+	using override_list = ::std::vector<override>;
+
+	/**
+	 * @brief Constructor.
+	 * @param props List of configuration properties. See
+	 *              :set_property_default for details. Additionally the
+	 *              constructor takes another property type as argument:
+	 *              :property::OUTPUT_VALUES which takes
+	 *              :line::value_mappings as property value. This
+	 *              effectively sets the overrides for output values for
+	 *              the mapped offsets.
+	 */
+	explicit line_config(const properties& props = properties());
+
+	line_config(const line_config& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	line_config(line_config&& other) noexcept;
+
+	~line_config(void);
+
+	line_config& operator=(const line_config& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	line_config& operator=(line_config&& other) noexcept;
+
+	/**
+	 * @brief Reset the line config object.
+	 */
+	void reset(void) noexcept;
+
+	/**
+	 * @brief Set the default value of a single configuration property.
+	 * @param prop Property to set.
+	 * @param val Property value. The type must correspond with the
+	 *            property being set: :line::direction for
+	 *            :property::DIRECTION, :line::edge for :property::EDGE,
+	 *            :line::bias for :property::BIAS, :line::drive for
+	 *            :property::DRIVE, `bool` for :property::ACTIVE_LOW,
+	 *            `std::chrono:microseconds` for
+	 *            :property::DEBOUNCE_PERIOD, :line::clock for
+	 *            :property::EVENT_CLOCK and :line::value
+	 *            for :property::OUTPUT_VALUE.
+	 *
+	 */
+	void set_property_default(property prop, const ::std::any& val);
+
+	/**
+	 * @brief Set the override value of a single configuration property.
+	 * @param prop Property to set.
+	 * @param offset Line offset to override.
+	 * @param val Property value. See :set_property_default for details.
+	 */
+	void set_property_offset(property prop, line::offset offset, const ::std::any& val);
+
+	/**
+	 * @brief Set the default direction setting.
+	 * @param direction New direction.
+	 */
+	void set_direction_default(line::direction direction);
+
+	/**
+	 * @brief Set the direction for a single line at given offset.
+	 * @param direction New direction.
+	 * @param offset Offset of the line for which to set the direction.
+	 */
+	void set_direction_override(line::direction direction, line::offset offset);
+
+	/**
+	 * @brief Get the default direction setting.
+	 * @return Direction setting that would have been used for any offset
+	 * 	   not assigned its own direction value.
+	 */
+	line::direction direction_default(void) const;
+
+	/**
+	 * @brief Get the direction setting for a given offset.
+	 * @param offset Line offset for which to read the direction setting.
+	 * @return Direction setting that would have been used for given offset
+	 *         if the config object was used in a request at the time of
+	 *         the call.
+	 */
+	line::direction direction_offset(line::offset offset) const;
+
+	/**
+	 * @brief Clear the direction override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_direction_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the direction setting is overridden at given offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if direction is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool direction_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default edge event detection.
+	 * @param edge Type of edge events to detect.
+	 */
+	void set_edge_detection_default(line::edge edge);
+
+	/**
+	 * @brief Set the edge event detection for a single line at given
+	 *        offset.
+	 * @param edge Type of edge events to detect.
+	 * @param offset Offset of the line for which to set the direction.
+	 */
+	void set_edge_detection_override(line::edge edge, line::offset offset);
+
+	/**
+	 * @brief Get the default edge detection setting.
+	 * @return Edge detection setting that would have been used for any
+	 *         offset not assigned its own direction value.
+	 */
+	line::edge edge_detection_default(void) const;
+
+	/**
+	 * @brief Get the edge event detection setting for a given offset.
+	 * @param offset Line offset for which to read the edge detection
+	 *               setting.
+	 * @return Edge event detection setting that would have been used for
+	 * 	   given offset if the config object was used in a request at
+	 * 	   the time of the call.
+	 */
+	line::edge edge_detection_offset(line::offset offset) const;
+
+	/**
+	 * @brief Clear the edge detection override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_edge_detection_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the edge detection setting is overridden at given
+	 *        offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if edge detection is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool edge_detection_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default bias setting.
+	 * @param bias New bias.
+	 */
+	void set_bias_default(line::bias bias);
+
+	/**
+	 * @brief Set the bias for a single line at given offset.
+	 * @param bias New bias.
+	 * @param offset Offset of the line for which to set the bias.
+	 */
+	void set_bias_override(line::bias bias, line::offset offset);
+
+	/**
+	 * @brief Get the default bias setting.
+	 * @return Bias setting that would have been used for any offset not
+	 *         assigned its own direction value.
+	 */
+	line::bias bias_default(void) const;
+
+	/**
+	 * @brief Get the bias setting for a given offset.
+	 * @param offset Line offset for which to read the bias setting.
+	 * @return Bias setting that would have been used for given offset if
+	 *         the config object was used in a request at the time of the
+	 *         call.
+	 */
+	line::bias bias_offset(line::offset offset) const;
+
+	/**
+	 * @brief Clear the bias override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_bias_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the bias setting is overridden at given offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if bias is overridden at this offset, false otherwise.
+	 */
+	bool bias_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default drive setting.
+	 * @param drive New drive.
+	 */
+	void set_drive_default(line::drive drive);
+
+	/**
+	 * @brief Set the drive for a single line at given offset.
+	 * @param drive New drive.
+	 * @param offset Offset of the line for which to set the drive.
+	 */
+	void set_drive_override(line::drive drive, line::offset offset);
+
+	/**
+	 * @brief Set the drive for a subset of offsets.
+	 * @param drive New drive.
+	 * @param offsets Vector of line offsets for which to set the drive.
+	 */
+	void set_drive(line::drive drive, const line::offsets& offsets);
+
+	/**
+	 * @brief Get the default drive setting.
+	 * @return Drive setting that would have been used for any offset not
+	 *         assigned its own direction value.
+	 */
+	line::drive drive_default(void) const;
+
+	/**
+	 * @brief Get the drive setting for a given offset.
+	 * @param offset Line offset for which to read the drive setting.
+	 * @return Drive setting that would have been used for given offset if
+	 *         the config object was used in a request at the time of the
+	 *         call.
+	 */
+	line::drive drive_offset(line::offset offset) const;
+
+	/**
+	 * @brief Clear the drive override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_drive_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the drive setting is overridden at given offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if drive is overridden at this offset, false otherwise.
+	 */
+	bool drive_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set lines to active-low by default.
+	 * @param active_low New active-low setting.
+	 */
+	void set_active_low_default(bool active_low) noexcept;
+
+	/**
+	 * @brief Set a single line as active-low.
+	 * @param active_low New active-low setting.
+	 * @param offset Offset of the line for which to set the active setting.
+	 */
+	void set_active_low_override(bool active_low, line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if active-low is the default setting.
+	 * @return Active-low setting that would have been used for any offset
+         *         not assigned its own value.
+	 */
+	bool active_low_default(void) const noexcept;
+
+	/**
+	 * @brief Check if the line at given offset was configured as
+	 *        active-low.
+	 * @param offset Line offset for which to read the active-low setting.
+	 * @return Active-low setting that would have been used for given
+	 *         offset if the config object was used in a request at the
+	 *         time of the call.
+	 */
+	bool active_low_offset(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Clear the active-low override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_active_low_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the active-low setting is overridden at given offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if active-low is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool active_low_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default debounce period.
+	 * @param period New debounce period. Disables debouncing if 0.
+	 */
+	void set_debounce_period_default(const ::std::chrono::microseconds& period) noexcept;
+
+	/**
+	 * @brief Set the debounce period for a single line at given offset.
+	 * @param period New debounce period. Disables debouncing if 0.
+	 * @param offset Offset of the line for which to set the debounce
+	 *               period.
+	 */
+	void set_debounce_period_override(const ::std::chrono::microseconds& period,
+					     line::offset offset) noexcept;
+
+	/**
+	 * @brief Get the default debounce period.
+	 * @return Debounce period that would have been used for any offset not
+	 *         assigned its own debounce period. 0 if not debouncing is
+	 *         disabled.
+	 */
+	::std::chrono::microseconds debounce_period_default(void) const noexcept;
+
+	/**
+	 * @brief Get the debounce period for a given offset.
+	 * @param offset Line offset for which to read the debounce period.
+	 * @return Debounce period that would have been used for given offset
+	 *         if the config object was used in a request at the time of
+	 *         the call. 0 if debouncing is disabled.
+	 */
+	::std::chrono::microseconds debounce_period_offset(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Clear the debounce period override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_debounce_period_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the debounce period setting is overridden at given offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if debounce period is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool debounce_period_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default event timestamp clock.
+	 * @param clock New clock to use.
+	 */
+	void set_event_clock_default(line::clock clock);
+
+	/**
+	 * @brief Set the event clock for a single line at given offset.
+	 * @param clock New clock to use.
+	 * @param offset Offset of the line for which to set the event clock
+	 *               type.
+	 */
+	void set_event_clock_override(line::clock clock, line::offset offset);
+
+	/**
+	 * @brief Get the default event clock setting.
+	 * @return Event clock setting that would have been used for any offset
+	 *         not assigned its own direction value.
+	 */
+	line::clock event_clock_default(void) const;
+
+	/**
+	 * @brief Get the event clock setting for a given offset.
+	 * @param offset Line offset for which to read the event clock setting.
+	 * @return Event clock setting that would have been used for given
+	 *         offset if the config object was used in a request at the
+	 *         time of the call.
+	 */
+	line::clock event_clock_offset(line::offset offset) const;
+
+	/**
+	 * @brief Clear the event clock override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_event_clock_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the event clock setting is overridden at given
+	 *        offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if event clock is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool event_clock_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Set the default output value.
+	 * @param value New value.
+	 */
+	void set_output_value_default(line::value value) noexcept;
+
+	/**
+	 * @brief Set the output value for a single offset.
+	 * @param offset Line offset to associate the value with.
+	 * @param value New value.
+	 */
+	void set_output_value_override(line::value value, line::offset offset) noexcept;
+
+	/**
+	 * @brief Set the output values for a set of line offsets.
+	 * @param values Vector of offset->value mappings.
+	 */
+	void set_output_values(const line::value_mappings& values);
+
+	/**
+	 * @brief Set the output values for a set of line offsets.
+	 * @param offsets Vector of line offsets for which to set output values.
+	 * @param values Vector of new line values with indexes of values
+	 *               corresponding to the indexes of offsets.
+	 */
+	void set_output_values(const line::offsets& offsets, const line::values& values);
+
+	/**
+	 * @brief Get the default output value.
+	 * @return Output value that would have been used for any offset not
+	 *         assigned its own output value.
+	 */
+	line::value output_value_default(void) const noexcept;
+
+	/**
+	 * @brief Get the output value configured for a given line.
+	 * @param offset Line offset for which to read the value.
+	 * @return Output value that would have been used for given offset if
+	 *         the config object was used in a request at the time of the
+	 *         call.
+	 */
+	line::value output_value_offset(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Clear the output value override at given offset.
+	 * @param offset Offset of the line for which to clear the override.
+	 * @note Does nothing if no override is set for this line.
+	 */
+	void clear_output_value_override(line::offset offset) noexcept;
+
+	/**
+	 * @brief Check if the output value setting is overridden at given
+	 *        offset.
+	 * @param offset Offset of the line for which to check the override.
+	 * @return True if output value is overridden at this offset, false
+	 *         otherwise.
+	 */
+	bool output_value_is_overridden(line::offset offset) const noexcept;
+
+	/**
+	 * @brief Get the number of configuration overrides.
+	 * @return Number of overrides held by this object.
+	 */
+	::std::size_t num_overrides(void) const noexcept;
+
+	/**
+	 * @brief Get the list of property overrides.
+	 * @return List of configuration property overrides held by this object.
+	 */
+	override_list overrides(void) const;
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend chip;
+	friend line_request;
+};
+
+/**
+ * @brief Stream insertion operator for GPIO line config objects.
+ * @param out Output stream to write to.
+ * @param config Line config object to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const line_config& config);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_CONFIG_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-info.hpp b/bindings/cxx/gpiodcxx/line-info.hpp
new file mode 100644
index 0000000..e9883ab
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-info.hpp
@@ -0,0 +1,176 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file line-info.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_LINE_INFO_HPP__
+#define __LIBGPIOD_CXX_LINE_INFO_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <chrono>
+#include <iostream>
+#include <memory>
+#include <string>
+
+namespace gpiod {
+
+class chip;
+class info_event;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Contains an immutable snapshot of the line's state at the
+ *        time when the object of this class was instantiated.
+ */
+class line_info
+{
+public:
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	line_info(const line_info& other) noexcept;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	line_info(line_info&& other) noexcept;
+
+	~line_info(void);
+
+	/**
+	 * @brief Copy assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	line_info& operator=(const line_info& other) noexcept;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	line_info& operator=(line_info&& other) noexcept;
+
+	/**
+	 * @brief Get the hardware offset of the line.
+	 * @return Offset of the line within the parent chip.
+	 */
+	line::offset offset(void) const noexcept;
+
+	/**
+	 * @brief Get the GPIO line name.
+	 * @return Name of the GPIO line as it is represented in the kernel.
+	 *         This routine returns an empty string if the line is unnamed.
+	 */
+	::std::string name(void) const noexcept;
+
+	/**
+	 * @brief Check if the line is currently in use.
+	 * @return True if the line is in use, false otherwise.
+	 *
+	 * The user space can't know exactly why a line is busy. It may have
+	 * been requested by another process or hogged by the kernel. It only
+	 * matters that the line is used and we can't request it.
+	 */
+	bool used(void) const noexcept;
+
+	/**
+	 * @brief Read the GPIO line consumer name.
+	 * @return Name of the GPIO consumer name as it is represented in the
+	 *         kernel. This routine returns an empty string if the line is
+	 *         not used.
+	 */
+	::std::string consumer(void) const noexcept;
+
+	/**
+	 * @brief Read the GPIO line direction setting.
+	 * @return Returns DIRECTION_INPUT or DIRECTION_OUTPUT.
+	 */
+	line::direction direction(void) const;
+
+	/**
+	 * @brief Read the current edge detection setting of this line.
+	 * @return Returns EDGE_NONE, EDGE_RISING, EDGE_FALLING or EDGE_BOTH.
+	 */
+	line::edge edge_detection(void) const;
+
+	/**
+	 * @brief Read the GPIO line bias setting.
+	 * @return Returns BIAS_PULL_UP, BIAS_PULL_DOWN, BIAS_DISABLE or
+	 *         BIAS_UNKNOWN.
+	 */
+	line::bias bias(void) const;
+
+	/**
+	 * @brief Read the GPIO line drive setting.
+	 * @return Returns DRIVE_PUSH_PULL, DRIVE_OPEN_DRAIN or
+	 *         DRIVE_OPEN_SOURCE.
+	 */
+	line::drive drive(void) const;
+
+	/**
+	 * @brief Check if the signal of this line is inverted.
+	 * @return True if this line is "active-low", false otherwise.
+	 */
+	bool active_low(void) const noexcept;
+
+	/**
+	 * @brief Check if this line is debounced (either by hardware or by the
+	 *        kernel software debouncer).
+	 * @return True if the line is debounced, false otherwise.
+	 */
+	bool debounced(void) const noexcept;
+
+	/**
+	 * @brief Read the current debounce period in microseconds.
+	 * @return Current debounce period in microseconds, 0 if the line is
+	 *         not debounced.
+	 */
+	::std::chrono::microseconds debounce_period(void) const noexcept;
+
+	/**
+	 * @brief Read the current event clock setting used for edge event
+	 *        timestamps.
+	 * @return Returns MONOTONIC or REALTIME.
+	 */
+	line::clock event_clock(void) const;
+
+private:
+
+	line_info(void);
+
+	struct impl;
+
+	::std::shared_ptr<impl> _m_priv;
+
+	friend chip;
+	friend info_event;
+};
+
+/**
+ * @brief Stream insertion operator for GPIO line info objects.
+ * @param out Output stream to write to.
+ * @param info GPIO line info object to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const line_info& info);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_INFO_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
new file mode 100644
index 0000000..28ab6e1
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -0,0 +1,221 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file line-request.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_LINE_REQUEST_HPP__
+#define __LIBGPIOD_CXX_LINE_REQUEST_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <chrono>
+#include <cstddef>
+#include <iostream>
+#include <memory>
+
+#include "misc.hpp"
+
+namespace gpiod {
+
+class chip;
+class edge_event;
+class edge_event_buffer;
+class line_config;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Stores the context of a set of requested GPIO lines.
+ */
+class line_request
+{
+public:
+
+	line_request(const line_request& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	line_request(line_request&& other) noexcept;
+
+	~line_request(void);
+
+	line_request& operator=(const line_request& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 */
+	line_request& operator=(line_request&& other) noexcept;
+
+	/**
+	 * @brief Check if this object is valid.
+	 * @return True if this object's methods can be used, false otherwise.
+	 *         False usually means the request was released. If the user
+	 *         calls any of the methods of this class on an object for
+	 *         which this operator returned false, a logic_error will be
+	 *         thrown.
+	 */
+	explicit operator bool(void) const noexcept;
+
+	/**
+	 * @brief Release the GPIO chip and free all associated resources.
+	 * @note The object can still be used after this method is called but
+	 *       using any of the mutators will result in throwing
+	 *       a logic_error exception.
+	 */
+	void release(void);
+
+	/**
+	 * @brief Get the number of requested lines.
+	 * @return Number of lines in this request.
+	 */
+	::std::size_t num_lines(void) const;
+
+	/**
+	 * @brief Get the list of offsets of requested lines.
+	 * @return List of hardware offsets of the lines in this request.
+	 */
+	line::offsets offsets(void) const;
+
+	/**
+	 * @brief Get the value of a single requested line.
+	 * @param offset Offset of the line to read within the chip.
+	 * @return Current line value.
+	 */
+	line::value get_value(line::offset offset);
+
+	/**
+	 * @brief Get the values of a subset of requested lines.
+	 * @param offsets Vector of line offsets
+	 * @return Vector of lines values with indexes of values corresponding
+	 *         to those of the offsets.
+	 */
+	line::values get_values(const line::offsets& offsets);
+
+	/**
+	 * @brief Get the values of all requested lines.
+	 * @return List of read values.
+	 */
+	line::values get_values(void);
+
+	/**
+	 * @brief Get the values of a subset of requested lines into a vector
+	 *        supplied by the caller.
+	 * @param offsets Vector of line offsets.
+	 * @param values Vector for storing the values. Its size must be at
+	 *               least that of the offsets vector. The indexes of read
+	 *               values will correspond with those in the offsets
+	 *               vector.
+	 */
+	void get_values(const line::offsets& offsets, line::values& values);
+
+	/**
+	 * @brief Get the values of all requested lines.
+	 * @param values Array in which the values will be stored. Must hold
+	 *               at least the number of elements returned by
+	 *               line_request::num_lines.
+	 */
+	void get_values(line::values& values);
+
+	/**
+	 * @brief Set the value of a single requested line.
+	 * @param offset Offset of the line to set within the chip.
+	 * @param value New line value.
+	 */
+	void set_value(line::offset offset, line::value value);
+
+	/**
+	 * @brief Set the values of a subset of requested lines.
+	 * @param values Vector containing a set of offset->value mappings.
+	 */
+	void set_values(const line::value_mappings& values);
+
+	/**
+	 * @brief Set the values of a subset of requested lines.
+	 * @param offsets Vector containing the offsets of lines to set.
+	 * @param values Vector containing new values with indexes
+	 *               corresponding with those in the offsets vector.
+	 */
+	void set_values(const line::offsets& offsets, const line::values& values);
+
+	/**
+	 * @brief Set the values of all requested lines.
+	 * @param values Array of new line values. The size must be equal to
+	 *               the value returned by line_request::num_lines.
+	 */
+	void set_values(const line::values& values);
+
+	/**
+	 * @brief Apply new config options to requested lines.
+	 * @param config New configuration.
+	 */
+	void reconfigure_lines(const line_config& config);
+
+	/**
+	 * @brief Get the file descriptor number associated with this line
+	 *        request.
+	 * @return File descriptor number.
+	 */
+	int fd(void) const;
+
+	/**
+	 * @brief Wait for edge events on any of the lines requested with edge
+	 *        detection enabled.
+	 * @param timeout Wait time limit in nanoseconds.
+	 * @return True if at least one event is ready to be read. False if the
+	 *         wait timed out.
+	 */
+	bool wait_edge_event(const ::std::chrono::nanoseconds& timeout) const;
+
+	/**
+	 * @brief Read a number of edge events from this request up to the
+	 *        maximum capacity of the buffer.
+	 * @param buffer Edge event buffer to read events into.
+	 * @return Number of events read.
+	 */
+	::std::size_t read_edge_event(edge_event_buffer& buffer);
+
+	/**
+	 * @brief Read a number of edge events from this request.
+	 * @param buffer Edge event buffer to read events into.
+	 * @param max_events Maximum number of events to read. Limited by the
+	 *                   capacity of the buffer.
+	 * @return Number of events read.
+	 */
+	::std::size_t read_edge_event(edge_event_buffer& buffer, ::std::size_t max_events);
+
+private:
+
+	line_request(void);
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend chip;
+};
+
+/**
+ * @brief Stream insertion operator for line requests.
+ * @param out Output stream to write to.
+ * @param request Line request object to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const line_request& request);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_REQUEST_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line.hpp b/bindings/cxx/gpiodcxx/line.hpp
new file mode 100644
index 0000000..8e8a984
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/line.hpp
@@ -0,0 +1,274 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021-2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file line.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_LINE_HPP__
+#define __LIBGPIOD_CXX_LINE_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <ostream>
+#include <utility>
+#include <vector>
+
+namespace gpiod {
+
+/**
+ * @brief Namespace containing various type definitions for GPIO lines.
+ */
+namespace line {
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Wrapper around unsigned int for representing line offsets.
+ */
+class offset
+{
+public:
+	/**
+	 * @brief Constructor with implicit conversion from unsigned int.
+	 * @param off Line offset.
+	 */
+	offset(unsigned int off = 0) : _m_offset(off) {	}
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	offset(const offset& other) = default;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	offset(offset&& other) = default;
+
+	~offset(void) = default;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	offset& operator=(const offset& other) = default;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	offset& operator=(offset&& other) noexcept = default;
+
+	/**
+	 * @brief Conversion operator to `unsigned int`.
+	 */
+	operator unsigned int(void) const noexcept
+	{
+		return this->_m_offset;
+	}
+
+private:
+	unsigned int _m_offset;
+};
+
+/**
+ * @brief Logical line states.
+ */
+enum class value
+{
+	INACTIVE = 0,
+	/**< Line is inactive. */
+	ACTIVE = 1,
+	/**< Line is active. */
+};
+
+/**
+ * @brief Direction settings.
+ */
+enum class direction
+{
+	AS_IS = 1,
+	/**< Request the line(s), but don't change current direction. */
+	INPUT,
+	/**< Direction is input - we're reading the state of a GPIO line. */
+	OUTPUT
+	/**< Direction is output - we're driving the GPIO line. */
+};
+
+/**
+ * @brief Edge detection settings.
+ */
+enum class edge
+{
+	NONE = 1,
+	/**< Line edge detection is disabled. */
+	RISING,
+	/**< Line detects rising edge events. */
+	FALLING,
+	/**< Line detect falling edge events. */
+	BOTH
+	/**< Line detects both rising and falling edge events. */
+};
+
+/**
+ * @brief Internal bias settings.
+ */
+enum class bias
+{
+	AS_IS = 1,
+	/**< Don't change the bias setting when applying line config. */
+	UNKNOWN,
+	/**< The internal bias state is unknown. */
+	DISABLED,
+	/**< The internal bias is disabled. */
+	PULL_UP,
+	/**< The internal pull-up bias is enabled. */
+	PULL_DOWN
+	/**< The internal pull-down bias is enabled. */
+};
+
+/**
+ * @brief Drive settings.
+ */
+enum class drive
+{
+	PUSH_PULL = 1,
+	/**< Drive setting is push-pull. */
+	OPEN_DRAIN,
+	/**< Line output is open-drain. */
+	OPEN_SOURCE
+	/**< Line output is open-source. */
+};
+
+/**
+ * @brief Event clock settings.
+ */
+enum class clock
+{
+	MONOTONIC = 1,
+	/**< Line uses the monotonic clock for edge event timestamps. */
+	REALTIME
+	/**< Line uses the realtime clock for edge event timestamps. */
+};
+
+/**
+ * @brief Vector of line offsets.
+ */
+using offsets = ::std::vector<offset>;
+
+/**
+ * @brief Vector of line values.
+ */
+using values = ::std::vector<value>;
+
+/**
+ * @brief Represents a mapping of a line offset to line logical state.
+ */
+using value_mapping = ::std::pair<offset, value>;
+
+/**
+ * @brief Vector of offset->value mappings. Each mapping is defined as a pair
+ *        of an unsigned and signed integers.
+ */
+using value_mappings = ::std::vector<value_mapping>;
+
+/**
+ * @brief Stream insertion operator for logical line values.
+ * @param out Output stream.
+ * @param val Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, value val);
+
+/**
+ * @brief Stream insertion operator for direction values.
+ * @param out Output stream.
+ * @param dir Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, direction dir);
+
+/**
+ * @brief Stream insertion operator for edge detection values.
+ * @param out Output stream.
+ * @param edge Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, edge edge);
+
+/**
+ * @brief Stream insertion operator for bias values.
+ * @param out Output stream.
+ * @param bias Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, bias bias);
+
+/**
+ * @brief Stream insertion operator for drive values.
+ * @param out Output stream.
+ * @param drive Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, drive drive);
+
+/**
+ * @brief Stream insertion operator for event clock values.
+ * @param out Output stream.
+ * @param clock Value to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, clock clock);
+
+/**
+ * @brief Stream insertion operator for the list of output values.
+ * @param out Output stream.
+ * @param vals Object to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const values& vals);
+
+/**
+ * @brief Stream insertion operator for the list of line offsets.
+ * @param out Output stream.
+ * @param offs Object to insert into the output stream in a human-readable form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const offsets& offs);
+
+/**
+ * @brief Stream insertion operator for the offset-to-value mapping.
+ * @param out Output stream.
+ * @param mapping Value to insert into the output stream in a human-readable
+ *        form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const value_mapping& mapping);
+
+/**
+ * @brief Stream insertion operator for the list of offset-to-value mappings.
+ * @param out Output stream.
+ * @param mappings Object to insert into the output stream in a human-readable
+ *        form.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const value_mappings& mappings);
+
+/**
+ * @}
+ */
+
+} /* namespace line */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_LINE_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/misc.hpp b/bindings/cxx/gpiodcxx/misc.hpp
new file mode 100644
index 0000000..6e0084b
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/misc.hpp
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file misc.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_MISC_HPP__
+#define __LIBGPIOD_CXX_MISC_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <string>
+
+namespace gpiod {
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Check if the file pointed to by path is a GPIO chip character device.
+ * @param path Path to check.
+ * @return True if the file exists and is a GPIO chip character device or a
+ *         symbolic link to it.
+ */
+bool is_gpiochip_device(const ::std::filesystem::path& path);
+
+/**
+ * @brief Get the human readable version string for libgpiod API
+ * @return String containing the library version.
+ */
+const ::std::string& version_string(void);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_MISC_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/request-config.hpp b/bindings/cxx/gpiodcxx/request-config.hpp
new file mode 100644
index 0000000..52444c9
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/request-config.hpp
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2021 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file request-config.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__
+#define __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <any>
+#include <cstddef>
+#include <iostream>
+#include <map>
+#include <memory>
+#include <string>
+
+#include "line.hpp"
+
+namespace gpiod {
+
+class chip;
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Stores a set of options passed to the kernel when making a line
+ *        request.
+ */
+class request_config
+{
+public:
+
+	/**
+	 * @brief List of available configuration settings. Used in the
+	 *        constructor and :request_config::set_property.
+	 */
+	enum class property {
+		OFFSETS = 1,
+		/**< List of line offsets to request. */
+		CONSUMER,
+		/**< Consumer string. */
+		EVENT_BUFFER_SIZE,
+		/**< Suggested size of the edge event buffer. */
+	};
+
+	/**
+	 * @brief Map of mappings between property types and property values.
+	 */
+	using properties = ::std::map<property, ::std::any>;
+
+	/**
+	 * @brief Constructor.
+	 * @param props List of config properties. See
+	 *              :request_config::set_property.
+	 */
+	explicit request_config(const properties& props = properties());
+
+	request_config(const request_config& other) = delete;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	request_config(request_config&& other) noexcept;
+
+	~request_config(void);
+
+	request_config& operator=(const request_config& other) = delete;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	request_config& operator=(request_config&& other) noexcept;
+
+	/**
+	 * @brief Set the value of a single config property.
+	 * @param prop Property to set.
+	 * @param val Property value. The type must correspond to the property
+	 *            being set: `std::string` or `const char*` for
+	 *            :property::CONSUMER, `:line::offsets` for
+	 *            :property::OFFSETS and `unsigned long` for
+	 *            :property::EVENT_BUFFER_SIZE.
+	 */
+	void set_property(property prop, const ::std::any& val);
+
+	/**
+	 * @brief Set line offsets for this request.
+	 * @param offsets Vector of line offsets to request.
+	 */
+	void set_offsets(const line::offsets& offsets) noexcept;
+
+	/**
+	 * @brief Get the number of offsets configured in this request config.
+	 * @return Number of line offsets in this request config.
+	 */
+	::std::size_t num_offsets(void) const noexcept;
+
+	/**
+	 * @brief Set the consumer name.
+	 * @param consumer New consumer name.
+	 */
+	void set_consumer(const ::std::string& consumer) noexcept;
+
+	/**
+	 * @brief Get the consumer name.
+	 * @return Currently configured consumer name. May be an empty string.
+	 */
+	::std::string consumer(void) const noexcept;
+
+	/**
+	 * @brief Get the hardware offsets of lines in this request config.
+	 * @return List of line offsets.
+	 */
+	line::offsets offsets(void) const;
+
+	/**
+	 * @brief Set the size of the kernel event buffer.
+	 * @param event_buffer_size New event buffer size.
+	 * @note The kernel may adjust the value if it's too high. If set to 0,
+	 *       the default value will be used.
+	 */
+	void set_event_buffer_size(::std::size_t event_buffer_size) noexcept;
+
+	/**
+	 * @brief Get the edge event buffer size from this request config.
+	 * @return Current edge event buffer size setting.
+	 */
+	::std::size_t event_buffer_size(void) const noexcept;
+
+private:
+
+	struct impl;
+
+	::std::unique_ptr<impl> _m_priv;
+
+	friend chip;
+};
+
+/**
+ * @brief Stream insertion operator for request_config objects.
+ * @param out Output stream to write to.
+ * @param config request_config to insert into the output stream.
+ * @return Reference to out.
+ */
+::std::ostream& operator<<(::std::ostream& out, const request_config& config);
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/timestamp.hpp b/bindings/cxx/gpiodcxx/timestamp.hpp
new file mode 100644
index 0000000..d707fee
--- /dev/null
+++ b/bindings/cxx/gpiodcxx/timestamp.hpp
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: LGPL-3.0-or-later */
+/* SPDX-FileCopyrightText: 2022 Bartosz Golaszewski <brgl@bgdev.pl> */
+
+/**
+ * @file timestamp.hpp
+ */
+
+#ifndef __LIBGPIOD_CXX_TIMESTAMP_HPP__
+#define __LIBGPIOD_CXX_TIMESTAMP_HPP__
+
+#if !defined(__LIBGPIOD_GPIOD_CXX_INSIDE__)
+#error "Only gpiod.hpp can be included directly."
+#endif
+
+#include <chrono>
+#include <cstdint>
+
+namespace gpiod {
+
+/**
+ * @ingroup gpiod_cxx
+ * @{
+ */
+
+/**
+ * @brief Stores the edge and info event timestamps as returned by the kernel
+ *        and allows to convert them to std::chrono::time_point.
+ */
+class timestamp
+{
+public:
+
+	/**
+	 * @brief Monotonic time_point.
+	 */
+	using time_point_monotonic = ::std::chrono::time_point<::std::chrono::steady_clock>;
+
+	/**
+	 * @brief Real-time time_point.
+	 */
+	using time_point_realtime = ::std::chrono::time_point<::std::chrono::system_clock>;
+
+	/**
+	 * @brief Constructor with implicit  conversion from `uint64_t`.
+	 * @param ns Timestamp in nanoseconds.
+	 */
+	timestamp(::std::uint64_t ns) : _m_ns(ns) { }
+
+	/**
+	 * @brief Copy constructor.
+	 * @param other Object to copy.
+	 */
+	timestamp(const timestamp& other) noexcept = default;
+
+	/**
+	 * @brief Move constructor.
+	 * @param other Object to move.
+	 */
+	timestamp(timestamp&& other) noexcept = default;
+
+	/**
+	 * @brief Assignment operator.
+	 * @param other Object to copy.
+	 * @return Reference to self.
+	 */
+	timestamp& operator=(const timestamp& other) noexcept = default;
+
+	/**
+	 * @brief Move assignment operator.
+	 * @param other Object to move.
+	 * @return Reference to self.
+	 */
+	timestamp& operator=(timestamp&& other) noexcept = default;
+
+	~timestamp(void) = default;
+
+	/**
+	 * @brief Conversion operator to `std::uint64_t`.
+	 */
+	operator ::std::uint64_t(void) noexcept
+	{
+		return this->ns();
+	}
+
+	/**
+	 * @brief Get the timestamp in nanoseconds.
+	 * @return Timestamp in nanoseconds.
+	 */
+	::std::uint64_t ns(void) const noexcept
+	{
+		return this->_m_ns;
+	}
+
+	/**
+	 * @brief Convert the timestamp to a monotonic time_point.
+	 * @return time_point associated with the steady clock.
+	 */
+	time_point_monotonic to_time_point_monotonic(void) const
+	{
+		return time_point_monotonic(::std::chrono::nanoseconds(this->ns()));
+	}
+
+	/**
+	 * @brief Convert the timestamp to a real-time time_point.
+	 * @return time_point associated with the system clock.
+	 */
+	time_point_realtime to_time_point_realtime(void) const
+	{
+		return time_point_realtime(::std::chrono::nanoseconds(this->ns()));
+	}
+
+private:
+	::std::uint64_t _m_ns;
+};
+
+/**
+ * @}
+ */
+
+} /* namespace gpiod */
+
+#endif /* __LIBGPIOD_CXX_TIMESTAMP_HPP__ */
diff --git a/configure.ac b/configure.ac
index f8d34ed..ab03673 100644
--- a/configure.ac
+++ b/configure.ac
@@ -239,6 +239,7 @@ AC_CONFIG_FILES([Makefile
 		 bindings/cxx/libgpiodcxx.pc
 		 bindings/Makefile
 		 bindings/cxx/Makefile
+		 bindings/cxx/gpiodcxx/Makefile
 		 bindings/cxx/examples/Makefile
 		 bindings/cxx/tests/Makefile
 		 bindings/python/Makefile
-- 
2.32.0

