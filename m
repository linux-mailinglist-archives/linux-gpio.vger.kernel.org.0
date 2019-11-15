Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9FD2FE06A
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 15:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbfKOOpb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 09:45:31 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:46855 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfKOOpb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 09:45:31 -0500
Received: by mail-pf1-f176.google.com with SMTP id 193so6756284pfc.13
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 06:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RWuitDkia9SsUvX7hGwdFBd0vFJESPfawb8pD7EX6D8=;
        b=UecdGX1J0WslOGFqIlDFF/QfZLIFWFDsY/iW13P1o4rTH3SLf4PPO9Tnf22vzgoBUQ
         d2p99jrfYD9u/1qv/9IElCf2+jHVxQTVXht7xHKaefzf69pqze7x8zIbVlpdIU+AvcLi
         guYia/fxoV54B1Bm38hb4CpTpX+FXGr8WOgWTgdjbjQ1m9lRAbMQ2Ky469iVRj54rr/Y
         trHhwPHpVkFBjLQemFu95OpMK2kaZnG3WvhFC2X6YLq+0wF/PCWPb8Hhly7ExU3w2++O
         N0/PHZl3skjupCvpp9MaCiiKXqkdyvZrUInmmzp+c/VoxS3V0okwLrIOuGb/0QCF1q2y
         pnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RWuitDkia9SsUvX7hGwdFBd0vFJESPfawb8pD7EX6D8=;
        b=XXZPrbEAkrdDyBcNWAN0SMij/PWeE9kFAIYdcgxHLtYg0IYNlV31yUOrQ5pgbIQvZH
         HVu7oAQyzJcIBfT8K35tsmLarCXEVsQMGNIOk2GTEHQtuBeLXQoQN+ln7o5HunZcqLqR
         fr7aeqfjG+GckvD8uGkZwVLFB9CJF3QRT74gsq0XBezkTBcEBCBT66OpF0/y5Y1jQAPK
         DHbhUi8CPAHBZSZ9p/+htqbBc0t0o6Jx6GM5lxq9abVFLTdbxudG75k90/s3Q2Le+rRt
         6ZI5dIUduh3/NRzBXqr1wqQNpnxQ6HLDtfuktLdzJHnckdtG56blQLPHP0rafk5eU7RQ
         e68g==
X-Gm-Message-State: APjAAAXPlQzfrlGJUuGvn3QWWgSJcPWLViFNHMYK9TPDzzHdulPh+sUD
        yXK0pajNTz8DJvWHK4g5x1kwmx6RHyo=
X-Google-Smtp-Source: APXvYqzMRxCxm1+Ce/7AOXZXXu/U7u4LkfOSszDVrQEQNpOmLTLX8sKrJs1VgUFXlV/9JhUG2/OWiQ==
X-Received: by 2002:a63:5d26:: with SMTP id r38mr17195247pgb.48.1573829129488;
        Fri, 15 Nov 2019 06:45:29 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id y123sm10517726pfg.64.2019.11.15.06.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 06:45:29 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH 14/19] bindings: cxx: add support for SET_CONFIG
Date:   Fri, 15 Nov 2019 22:43:50 +0800
Message-Id: <20191115144355.975-15-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115144355.975-1-warthog618@gmail.com>
References: <20191115144355.975-1-warthog618@gmail.com>
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
index 5f1cac4..6f7d161 100644
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
+	rv = ::gpiod_line_set_direction_bulk_input(::std::addressof(bulk));
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
+	rv = ::gpiod_line_set_direction_bulk_output(::std::addressof(bulk),
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

