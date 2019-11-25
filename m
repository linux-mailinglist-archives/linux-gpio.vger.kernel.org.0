Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09EC10900D
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:33:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbfKYOdD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:33:03 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:45554 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOdC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:33:02 -0500
Received: by mail-pf1-f176.google.com with SMTP id z4so7455005pfn.12
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7W94xtx0uI56sv+Ld6LRQS5pGxu5wsVfKel0MWTCao=;
        b=crEXOkrWtBcrBshD/3sXzfy+oR3yJKjmtnUfKDvzYSxDi4SOqq25Ubv/NpNSf2aKdZ
         /T8efd2sU/4/3HDyrj1A/tBbFWJCOPT0htGH1ZldbGjHpVjFegzL+9KUn2FYd1++5fbf
         4CH/vIKITNEK0/wzhHzMFj9VtFf6wOKnT3f+WPIOyOZhmNwsRm1QeDAUVR+/BV4KdS57
         Xo689JRdMqKyKRnBRS+yX+tWksF0lbQ2FjPNjbBEBbYbOY5PPMfiLW2VL1n8yAwFDBk3
         OdTe5VeYcspaQO9yeOKaaa35pZC31hhyxPyJORnR6bvtkajlmMxffj0lWCiKh2KcOhzd
         puCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7W94xtx0uI56sv+Ld6LRQS5pGxu5wsVfKel0MWTCao=;
        b=UjOibJ1c8Ub7furKlhA9yt7R1UbE0eToGBf8wizwQEObr5+K4NGXvGt87dyFrmgfPG
         sesXu9YAp31s1G7YIR23Y4QjL44HaePpnoaSb62FKB1yXxZql8tVqAf5NdDvUwfYcTL9
         HYA7Iw8CwVtIBM+KP/WbggQsnEczxRAWAbTC9KEsugAZ4JmB/u/fE+/g4dvHItNDY3ed
         CoKX7bKkoNmo38X3m4B4RrjITB9gTTDEfZfaZs2LJJIeC/t20cZM2qk/wObc2ZxNXcxc
         D0G81mBdPfZdhuhePsktlaOsuJzrAoiiho96G9OwUG2Z2TYipXXu5dVmtGNIKvgyEYkC
         ha0g==
X-Gm-Message-State: APjAAAWt8f+9bcF0gnoryLmfFgQw8JytNSUNy82MbBUjmofcH8Tt+tdH
        ay/7O4Jis3izMLRWlL2m64jVSL+YmGHQgw==
X-Google-Smtp-Source: APXvYqzkQOCJ7wwinkCV7BruLZ2GgZXPCqNTUzCQzISbgWJ3pQKAFf4xE87DwDHzFfTf9c2nZdCTvA==
X-Received: by 2002:aa7:959d:: with SMTP id z29mr34196559pfj.208.1574692380447;
        Mon, 25 Nov 2019 06:33:00 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:32:59 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 09/14] bindings: cxx: add support for SET_CONFIG
Date:   Mon, 25 Nov 2019 22:31:52 +0800
Message-Id: <20191125143157.26154-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add methods to support setting line configuration.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/gpiod.hpp     | 55 +++++++++++++++++++++++++
 bindings/cxx/line.cpp      | 37 +++++++++++++++++
 bindings/cxx/line_bulk.cpp | 83 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 175 insertions(+)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 2b1a6ab..dcae431 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -381,6 +381,32 @@ public:
 	 */
 	GPIOD_API void set_value(int val) const;
 
+	/**
+	 * @brief Set configuration of this line.
+	 * @param direction New direction.
+	 * @param flags Replacement flags.
+	 * @param value New value (0 or 1) - only matters for OUTPUT direction.
+	 */
+	GPIOD_API void set_config(int direction, ::std::bitset<32> flags,
+			int value = 0) const;
+
+	/**
+	 * @brief Set configuration flags of this line.
+	 * @param flags Replacement flags.
+	 */
+	GPIOD_API void set_flags(::std::bitset<32> flags) const;
+
+	/**
+	 * @brief Change the direction this line to input.
+	 */
+	GPIOD_API void set_direction_input() const;
+
+	/**
+	 * @brief Change the direction this lines to output.
+	 * @param value New value (0 or 1).
+	 */
+	GPIOD_API void set_direction_output(int value = 0) const;
+
 	/**
 	 * @brief Wait for an event on this line.
 	 * @param timeout Time to wait before returning if no event occurred.
@@ -648,6 +674,35 @@ public:
 	 */
 	GPIOD_API void set_values(const ::std::vector<int>& values) const;
 
+	/**
+	 * @brief Set configuration of all lines held by this object.
+	 * @param direction New direction.
+	 * @param flags Replacement flags.
+	 * @param values Vector of values to set. Must be the same size as the
+	 *        number of lines held by this line_bulk.
+	 * 	  Only relevant for output direction requests.
+	 */
+	GPIOD_API void set_config(int direction, ::std::bitset<32> flags,
+			const ::std::vector<int> values = std::vector<int>()) const;
+
+	/**
+	 * @brief Set configuration flags of all lines held by this object.
+	 * @param flags Replacement flags.
+	 */
+	GPIOD_API void set_flags(::std::bitset<32> flags) const;
+
+	/**
+	 * @brief Change the direction all lines held by this object to input.
+	 */
+	GPIOD_API void set_direction_input() const;
+
+	/**
+	 * @brief Change the direction all lines held by this object to output.
+	 * @param values Vector of values to set. Must be the same size as the
+	 *        number of lines held by this line_bulk.
+	 */
+	GPIOD_API void set_direction_output(const ::std::vector<int>& values) const;
+
 	/**
 	 * @brief Poll the set of lines for line events.
 	 * @param timeout Number of nanoseconds to wait before returning an
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index dd6bb6a..a688b5d 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -158,6 +158,43 @@ void line::set_value(int val) const
 	bulk.set_values({ val });
 }
 
+void line::set_config(int direction, ::std::bitset<32> flags,
+			int value) const
+{
+	this->throw_if_null();
+
+	line_bulk bulk({ *this });
+
+	bulk.set_config(direction, flags, { value });
+}
+
+void line::set_flags(::std::bitset<32> flags) const
+{
+	this->throw_if_null();
+
+	line_bulk bulk({ *this });
+
+	bulk.set_flags(flags);
+}
+
+void line::set_direction_input() const
+{
+	this->throw_if_null();
+
+	line_bulk bulk({ *this });
+
+	bulk.set_direction_input();
+}
+
+void line::set_direction_output(int value) const
+{
+	this->throw_if_null();
+
+	line_bulk bulk({ *this });
+
+	bulk.set_direction_output({ value });
+}
+
 bool line::event_wait(const ::std::chrono::nanoseconds& timeout) const
 {
 	this->throw_if_null();
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index 5f1cac4..b8f5eb7 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -176,6 +176,89 @@ void line_bulk::set_values(const ::std::vector<int>& values) const
 					  "error setting GPIO line values");
 }
 
+void line_bulk::set_config(int direction, ::std::bitset<32> flags,
+			   const ::std::vector<int> values) const
+{
+	this->throw_if_empty();
+
+	if (!values.empty() && this->_m_bulk.size() != values.size())
+		throw ::std::invalid_argument("the number of default values must correspond with the number of lines");
+
+	::gpiod_line_bulk bulk;
+	int rv, gflags;
+
+	gflags = 0;
+
+	for (auto& it: reqflag_mapping) {
+		if ((it.first & flags).to_ulong())
+			gflags |= it.second;
+	}
+
+	this->to_line_bulk(::std::addressof(bulk));
+
+	rv = ::gpiod_line_set_config_bulk(::std::addressof(bulk), direction,
+					  gflags, values.data());
+	if (rv)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "error setting GPIO line config");
+}
+
+void line_bulk::set_flags(::std::bitset<32> flags) const
+{
+	this->throw_if_empty();
+
+	::gpiod_line_bulk bulk;
+	int rv, gflags;
+
+	this->to_line_bulk(::std::addressof(bulk));
+
+	gflags = 0;
+
+	for (auto& it: reqflag_mapping) {
+		if ((it.first & flags).to_ulong())
+			gflags |= it.second;
+	}
+
+	rv = ::gpiod_line_set_flags_bulk(::std::addressof(bulk), gflags);
+	if (rv)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "error setting GPIO line flags");
+}
+
+void line_bulk::set_direction_input() const
+{
+	this->throw_if_empty();
+
+	::gpiod_line_bulk bulk;
+	int rv;
+
+	this->to_line_bulk(::std::addressof(bulk));
+
+	rv = ::gpiod_line_set_direction_input_bulk(::std::addressof(bulk));
+	if (rv)
+		throw ::std::system_error(errno, ::std::system_category(),
+			"error setting GPIO line direction to input");
+}
+
+void line_bulk::set_direction_output(const ::std::vector<int>& values) const
+{
+	this->throw_if_empty();
+
+	if (values.size() != this->_m_bulk.size())
+		throw ::std::invalid_argument("the size of values array must correspond with the number of lines");
+
+	::gpiod_line_bulk bulk;
+	int rv;
+
+	this->to_line_bulk(::std::addressof(bulk));
+
+	rv = ::gpiod_line_set_direction_output_bulk(::std::addressof(bulk),
+						    values.data());
+	if (rv)
+		throw ::std::system_error(errno, ::std::system_category(),
+			"error setting GPIO line direction to output");
+}
+
 line_bulk line_bulk::event_wait(const ::std::chrono::nanoseconds& timeout) const
 {
 	this->throw_if_empty();
-- 
2.24.0

