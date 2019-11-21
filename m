Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D21E1047A1
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Nov 2019 01:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726714AbfKUAgl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Nov 2019 19:36:41 -0500
Received: from mail-pf1-f181.google.com ([209.85.210.181]:35197 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726705AbfKUAgl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Nov 2019 19:36:41 -0500
Received: by mail-pf1-f181.google.com with SMTP id q13so693466pff.2
        for <linux-gpio@vger.kernel.org>; Wed, 20 Nov 2019 16:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7W94xtx0uI56sv+Ld6LRQS5pGxu5wsVfKel0MWTCao=;
        b=YMUUfvQUJ4wrLW18NL5NMpRQTYJgV/hej0Rme7bNzOMPoBf1kKBnlw2GP7IDpDOajT
         IhkSlXOBkcot+Ai3xjts5Gh5z9nOzmBiVlfy/8JIqhFnox7C4/avZ0jrqARYAtVtTx+3
         8M68hD5WPI74VqLJyxzpEZ7a7XyfE2Rc+eVY3zXmC20wDOZwP9uYI1zuAmHeemDXWlRA
         Z4Fb7i+8Nu+k7wBM0GSkbh/tWGuxNvEEuxm9QUaJSe5Oxr2dpUn7Dvuoomym1ShaEDbk
         pmO0Xq7I0KFbpIIRkaRndn8Gh54X06qE4cbV3pkW8KItP0VN3ZDvmJ4KyKGa9uA+HL9y
         CRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7W94xtx0uI56sv+Ld6LRQS5pGxu5wsVfKel0MWTCao=;
        b=XQqC83ndIu6bA1UvuRR2c/B2sWxvpo4rQjRgZPffX+2FE946C/mdpUNw4SvZM/d8cx
         Q0UbRvhBLet+lsmNBRmgjUIyRgZ7OEqJm6Q5SCwdrA3UWexB5qrdRUrNspDBoaCXQEUD
         GsltDvC/I83JjWYc8wZZFiRphK3nj3xUpPQFUzPT4JywA779FVQBGZJ5ndSj6RyN77/z
         lJgoa8EHXa91fsiYeLjGMRliLNESKkl/1C0KtUoPQr2CvXn917YpTYZnhwReM29oSdXN
         UaQkxzcwPi3pF3dxFVyS7xRxGOTO5YrPCIhpqkeSl4IHnbXZZNePVlHP3gfCw0j+yam8
         FU8g==
X-Gm-Message-State: APjAAAW7y6Mw0jjypUrs8rTEQ2b53E1T6F89dkTu6QZLDkStzi1mYlt/
        7TInG5/Meh5F5CPxtwyCoyYgL0snaJA=
X-Google-Smtp-Source: APXvYqz5mz5YRBKLWVQC0dZauVXcNo77Ys0GZAjtrmGPuFuzoNlcd0O1uIMarh6YN18xdcnjiV2S3g==
X-Received: by 2002:a63:755c:: with SMTP id f28mr621040pgn.341.1574296600309;
        Wed, 20 Nov 2019 16:36:40 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id s1sm420756pgk.9.2019.11.20.16.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 16:36:39 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod] [PATCH v2 09/14] bindings: cxx: add support for SET_CONFIG
Date:   Thu, 21 Nov 2019 08:35:51 +0800
Message-Id: <20191121003556.9020-10-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121003556.9020-1-warthog618@gmail.com>
References: <20191121003556.9020-1-warthog618@gmail.com>
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

