Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73294124978
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 15:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfLROZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 09:25:05 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56067 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbfLROZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 09:25:04 -0500
Received: by mail-wm1-f66.google.com with SMTP id q9so2035092wmj.5
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 06:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3gmB0LivlcB1hZjYmVU/8gG99ZSoZHV81Ayx/lTIuts=;
        b=PUpas7MYLmKO61tdfnmCmqMXTj1BVh22ZH/dvyABheD6WuTE91F9jAne0vBkH7IYPW
         hancaI/AGky7nG37As06ZzEDZYQP5Wqz/JbLqHurALA8uGoepLLKT8g7Ps05Oaz3sPsy
         UxKf5DyoHpENbGoO3HnOkZlfDq/6Rg5ofMBXYX16cWFC0WxrY9q0B42ARuwCr9VzP0Ti
         UhEK5LW0Pzq0Y5/AncL9QNrsrt1xyHTjc3klpg8bTc0+7QRu1It6iq+I13pfF9r9AqsG
         +v/zQVRyWDrkXiRucl7iwIlAd0zUkMAv/x8qkLjzRIcEuKnnOEcfgkT68C+KaXIvoZw0
         YexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3gmB0LivlcB1hZjYmVU/8gG99ZSoZHV81Ayx/lTIuts=;
        b=cXrp22Z0Vjvg/nseD67Oj8/iSqgVf9+7Vu45k4+O0TD2YU/1XLigqqaZSE6TUY9w8t
         o8bqJR14Z6skQpqei+/fVF9v6NKyHJNDS0bp18yeku5oPAbs6dbEZHY+HpFL2aVwWBWe
         buOJv6+pTKi1byXjnhAqG3qnuegYZBqBw9htCFPlKslS5XC4LfjbN1LiTVWGOBwRaTud
         9TmbcKMUe2+IVOetZChQw1MiW655N9ma/o3HNXpih4zPlBqYk9x0W0RDrWYyB3nNGWl/
         Fc03rFY8+r2A84ZUdgACKNPQT0G/401MxslfOmKYT7AoDFYew960reqTq0kwvFVTgqCD
         oqvQ==
X-Gm-Message-State: APjAAAUbnGSkagm8R30PLU96CAYXzYQNO6i+zAM2m/UKjOamNtY9D/mh
        nMt36QqKkv/lIST+xCRAaqEd7g==
X-Google-Smtp-Source: APXvYqwgsoKTP4pBScsYTzJqcqVawoctzGSHGrvrDo6dCgvWT7fn1bpM8sPmGmgCrzFoWmaQrROIpA==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr3698418wmf.100.1576679102760;
        Wed, 18 Dec 2019 06:25:02 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id x11sm2889981wre.68.2019.12.18.06.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 06:25:02 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [libgpiod][PATCH 4/7] bindings: cxx: provide a method for reading multiple line events
Date:   Wed, 18 Dec 2019 15:24:46 +0100
Message-Id: <20191218142449.10957-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218142449.10957-1-brgl@bgdev.pl>
References: <20191218142449.10957-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a new method to gpiod::line class allowing to read up to 16 line
events at once.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 bindings/cxx/gpiod.hpp |  7 +++++++
 bindings/cxx/line.cpp  | 45 ++++++++++++++++++++++++++++++++++--------
 2 files changed, 44 insertions(+), 8 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 078201b..bd99d28 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -421,6 +421,12 @@ public:
 	 */
 	GPIOD_API line_event event_read(void) const;
 
+	/**
+	 * @brief Read up to 16 line events.
+	 * @return Vector of line event objects.
+	 */
+	GPIOD_API ::std::vector<line_event> event_read_multiple(void) const;
+
 	/**
 	 * @brief Get the event file descriptor associated with this line.
 	 * @return File descriptor number.
@@ -513,6 +519,7 @@ private:
 	line(::gpiod_line* line, const chip& owner);
 
 	void throw_if_null(void) const;
+	line_event make_line_event(const ::gpiod_line_event& event) const noexcept;
 
 	::gpiod_line* _m_line;
 	chip _m_chip;
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index ed6ef55..11deae6 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -206,6 +206,23 @@ bool line::event_wait(const ::std::chrono::nanoseconds& timeout) const
 	return !!event_bulk;
 }
 
+line_event line::make_line_event(const ::gpiod_line_event& event) const noexcept
+{
+	line_event ret;
+
+	if (event.event_type == GPIOD_LINE_EVENT_RISING_EDGE)
+		ret.event_type = line_event::RISING_EDGE;
+	else if (event.event_type == GPIOD_LINE_EVENT_FALLING_EDGE)
+		ret.event_type = line_event::FALLING_EDGE;
+
+	ret.timestamp = ::std::chrono::nanoseconds(
+				event.ts.tv_nsec + (event.ts.tv_sec * 1000000000));
+
+	ret.source = *this;
+
+	return ret;
+}
+
 line_event line::event_read(void) const
 {
 	this->throw_if_null();
@@ -219,17 +236,29 @@ line_event line::event_read(void) const
 		throw ::std::system_error(errno, ::std::system_category(),
 					  "error reading line event");
 
-	if (event_buf.event_type == GPIOD_LINE_EVENT_RISING_EDGE)
-		event.event_type = line_event::RISING_EDGE;
-	else if (event_buf.event_type == GPIOD_LINE_EVENT_FALLING_EDGE)
-		event.event_type = line_event::FALLING_EDGE;
+	return this->make_line_event(event_buf);
+}
+
+::std::vector<line_event> line::event_read_multiple(void) const
+{
+	this->throw_if_null();
 
-	event.timestamp = ::std::chrono::nanoseconds(
-				event_buf.ts.tv_nsec + (event_buf.ts.tv_sec * 1000000000));
+	/* 16 is the maximum number of events stored in the kernel FIFO. */
+	::std::array<::gpiod_line_event, 16> event_buf;
+	::std::vector<line_event> events;
+	int rv;
+
+	rv = ::gpiod_line_event_read_multiple(this->_m_line,
+					      event_buf.data(), event_buf.size());
+	if (rv < 0)
+		throw ::std::system_error(errno, ::std::system_category(),
+					  "error reading multiple line events");
 
-	event.source = *this;
+	events.reserve(rv);
+	for (int i = 0; i < rv; i++)
+		events.push_back(this->make_line_event(event_buf[i]));
 
-	return event;
+	return events;
 }
 
 int line::event_get_fd(void) const
-- 
2.23.0

