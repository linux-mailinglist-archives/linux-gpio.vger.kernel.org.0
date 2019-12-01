Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12E2D10E03E
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfLADZJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:25:09 -0500
Received: from mail-pj1-f43.google.com ([209.85.216.43]:36255 "EHLO
        mail-pj1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADZJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:25:09 -0500
Received: by mail-pj1-f43.google.com with SMTP id n96so3984368pjc.3
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HGXnvpoxzk5OaFntPyBsvJHbKAR2Hhr+Iqt0HtcJ7fY=;
        b=L+W/uYg11MxjU770Ju6/nSwf372Wqq6McUAXXIkWVQX0erD4HBupfPwt6YMBIPPPzS
         VkJ5NG7lRYuKx36KBIvyiTyj2XWWvGkhOPX3vla1Fy0UDyzsT5cuyehLVkygUm12y64+
         6oCZ4mQTGEjKcaVBGoPRfVT6PmkMy67u6zYJxJAdPjnSelIqHiMe4UHOhtl7dMOSPWsm
         sn3f9UMuP5U0qajrEkHouYeOn/A6wUqhKtNVmOfiAxPFwMD4mahQao0W4d6geIacYv8b
         RifpdbjVe6ZFrI2y3ctZnjWbRrvlWq5DSGMT4LjGASOgBu8xervQfg6EKveCauQEl6oR
         WnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HGXnvpoxzk5OaFntPyBsvJHbKAR2Hhr+Iqt0HtcJ7fY=;
        b=LNbsnG61lXeuhjtvbcdbEPPr0dt49cpV9Zpd9t6gsjtw3cqO52vO2Pz+q7zies8jX3
         80hh/towPod+LsmJPKFts7s0MljiPfVzf+zSsBRPMHj7hCd6BN6O1FbhYSvLN0JBkymQ
         Susqa47E3wFICyYsu32xCY0u1nhlrI3c2+oDgFhwiC0c3m1hgLv11k5DNu4HGkgl5kC+
         Fler5zK+xz53afCGVTW4fdRFAVeFz1ai+G3e5L19JGcJkIIsmIkONFja3oQZ6VVzVSWt
         uS26NAxPJSWhWV7YVdOTetgUDh7mfIyiLSIbwSFZwjyWh4n6+PNxObyJQK39Daq6pm4+
         Bl2Q==
X-Gm-Message-State: APjAAAUJSGbTsBd7hj2u5fNzakGfw6i/Z+/cwY5dWipMbGotU/67oUc0
        1VnlqTkA+/IsCBcsdfczensAlS7C
X-Google-Smtp-Source: APXvYqyru2P3v8W0YlsDRg83jJrfOgAe6rLNvwIgFykvADu46pTT705mq1IH1blvmAALzkutJfoKFA==
X-Received: by 2002:a17:90a:21a1:: with SMTP id q30mr27879763pjc.8.1575170708447;
        Sat, 30 Nov 2019 19:25:08 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:25:08 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 09/20] bindings: cxx: add support for SET_CONFIG
Date:   Sun,  1 Dec 2019 11:23:56 +0800
Message-Id: <20191201032407.23589-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
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
index 2b1a6ab..514354d 100644
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
+				  int value = 0) const;
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
+	 *               number of lines held by this line_bulk.
+	 *               Only relevant for output direction requests.
+	 */
+	GPIOD_API void set_config(int direction, ::std::bitset<32> flags,
+				  const ::std::vector<int> values = std::vector<int>()) const;
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
+	 *               number of lines held by this line_bulk.
+	 */
+	GPIOD_API void set_direction_output(const ::std::vector<int>& values) const;
+
 	/**
 	 * @brief Poll the set of lines for line events.
 	 * @param timeout Number of nanoseconds to wait before returning an
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index 29ea5b2..ed6ef55 100644
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

