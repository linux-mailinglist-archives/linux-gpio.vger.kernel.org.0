Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD3C109006
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Nov 2019 15:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbfKYOcq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 09:32:46 -0500
Received: from mail-pg1-f173.google.com ([209.85.215.173]:44243 "EHLO
        mail-pg1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728026AbfKYOcq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 09:32:46 -0500
Received: by mail-pg1-f173.google.com with SMTP id e6so7270677pgi.11
        for <linux-gpio@vger.kernel.org>; Mon, 25 Nov 2019 06:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uXrx5y2WL4cxWSJZuzUd3RqNYH2UrGCBMAG2mC95Yp4=;
        b=hcDNoHYv81K1rikuins/2OCkKstPav1ChJGOkH7RkCO99pUeXyQOTDjmpee7k11Iin
         OvgsXWMu65Z418lqgR78/Y4henDIdvPgOAFgM9DrZfir7MFolbF81mYzHuG+91jriyxa
         fjPqwAEE+g6fO1nqC3U0KuXuNdmdPmi+GQzZxy5tTiketJct6dWHjik7yvKH/QJSNV9n
         ryqNGKfKkc28GLu+IjzAZrHiDjUqQp/xmkWNoB1c88zXidfeTC7/MvPyJydCNRa51xUY
         zO0Xkz12FHs1TlErN1FGCJP4BdshMwo+3lxDSUr8He9qBUDmiw5Pf88GDG3qrK/EJy2f
         e2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uXrx5y2WL4cxWSJZuzUd3RqNYH2UrGCBMAG2mC95Yp4=;
        b=iG1JIeYw4gatP5SkvSAfem2vQ7LEIQH5+FeyQG7lq4q9aWE91/tiO2bCi+GyAkVpc9
         qNpRUl3Z5K8uF4q5yDDZi4k06F52fAZne6veE0avesZexUvAxAl71yyvvojjqPkoiZEh
         rOkUM3sJ+S0+jf6VJSVfFk/3S4g8CmjWz9czRWwrGmD1xZv3V3oADEXSAcpGWuQkuSTg
         wQRwt6briQtYSp0rcWlgHhAKbMk1IgvI14hu+h+vnTAC8nDe89PcEqz6OMPbW/JIcpy+
         Onspu7kc4oyrMzZgznEFqk4OeYr22C8D1cjWczo1SadltMixAla+ikIWu48dA/rRXRx1
         QLUQ==
X-Gm-Message-State: APjAAAWtKOb75xHhJH6XL/TZnfR0kDTkcLCESQqr8wcGxv/pcDMDlpVC
        DIfxjGKZu3SP6U45GY18mH3HYxJfl9FwEA==
X-Google-Smtp-Source: APXvYqwERtnuTDozWsBq5jFt2V3kXHqbgjB/lrn5opb78tpYhgmSZ/F710u4W7UM6iTawWxfNINXfg==
X-Received: by 2002:aa7:9804:: with SMTP id e4mr34697946pfl.21.1574692365216;
        Mon, 25 Nov 2019 06:32:45 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i5sm8642100pfo.52.2019.11.25.06.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 06:32:44 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v3 03/14] bindings: cxx: add support for bias flags
Date:   Mon, 25 Nov 2019 22:31:46 +0800
Message-Id: <20191125143157.26154-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125143157.26154-1-warthog618@gmail.com>
References: <20191125143157.26154-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for bias flags in line requests and returning the line bias
setting via a bias accessor.

Based on initial work by Drew Fustini <drew@pdp7.com>.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 bindings/cxx/gpiod.hpp     | 26 ++++++++++++++++++++++++++
 bindings/cxx/line.cpp      | 19 +++++++++++++++++++
 bindings/cxx/line_bulk.cpp |  6 ++++++
 3 files changed, 51 insertions(+)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index b5a9401..2b1a6ab 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -233,6 +233,12 @@ struct line_request
 	/**< The line is an open-source port. */
 	GPIOD_API static const ::std::bitset<32> FLAG_OPEN_DRAIN;
 	/**< The line is an open-drain port. */
+	GPIOD_API static const ::std::bitset<32> FLAG_BIAS_DISABLE;
+	/**< The line has neither pull-up nor pull-down resistor enabled */
+	GPIOD_API static const ::std::bitset<32> FLAG_BIAS_PULL_DOWN;
+	/**< The line has a configurable pull-down resistor enabled */
+	GPIOD_API static const ::std::bitset<32> FLAG_BIAS_PULL_UP;
+	/**< The line has a configurable pull-up resistor enabled */
 
 	::std::string consumer;
 	/**< Consumer name to pass to the request. */
@@ -320,6 +326,12 @@ public:
 	 */
 	GPIOD_API int active_state(void) const;
 
+	/**
+	 * @brief Get current bias of this line.
+	 * @return Current bias setting.
+	 */
+	GPIOD_API int bias(void) const;
+
 	/**
 	 * @brief Check if this line is used by the kernel or other user space
 	 *        process.
@@ -456,6 +468,20 @@ public:
 		/**< Line's active state is high. */
 	};
 
+	/**
+	 * @brief Possible bias settings.
+	 */
+	enum : int {
+		BIAS_AS_IS = 1,
+		/**< Line's bias state is unknown. */
+		BIAS_DISABLE,
+		/**< Line's internal bias is disabled. */
+		BIAS_PULL_UP,
+		/**< Line's internal pull-up bias is enabled. */
+		BIAS_PULL_DOWN,
+		/**< Line's internal pull-down bias is enabled. */
+	};
+
 private:
 
 	line(::gpiod_line* line, const chip& owner);
diff --git a/bindings/cxx/line.cpp b/bindings/cxx/line.cpp
index df6eada..dd6bb6a 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -67,6 +67,25 @@ int line::active_state(void) const
 	return active == GPIOD_LINE_ACTIVE_STATE_HIGH ? ACTIVE_HIGH : ACTIVE_LOW;
 }
 
+int line::bias(void) const
+{
+	this->throw_if_null();
+
+	int bias = ::gpiod_line_bias(this->_m_line);
+
+	switch (bias) {
+	case GPIOD_LINE_BIAS_PULL_UP:
+		return BIAS_PULL_UP;
+	case GPIOD_LINE_BIAS_PULL_DOWN:
+		return BIAS_PULL_DOWN;
+	case GPIOD_LINE_BIAS_DISABLE:
+		return BIAS_DISABLE;
+	case GPIOD_LINE_BIAS_AS_IS:
+	default:
+		return BIAS_AS_IS;
+	}
+}
+
 bool line::is_used(void) const
 {
 	this->throw_if_null();
diff --git a/bindings/cxx/line_bulk.cpp b/bindings/cxx/line_bulk.cpp
index c708c8b..5f1cac4 100644
--- a/bindings/cxx/line_bulk.cpp
+++ b/bindings/cxx/line_bulk.cpp
@@ -14,6 +14,9 @@ namespace gpiod {
 const ::std::bitset<32> line_request::FLAG_ACTIVE_LOW(GPIOD_BIT(0));
 const ::std::bitset<32> line_request::FLAG_OPEN_SOURCE(GPIOD_BIT(1));
 const ::std::bitset<32> line_request::FLAG_OPEN_DRAIN(GPIOD_BIT(2));
+const ::std::bitset<32> line_request::FLAG_BIAS_DISABLE(GPIOD_BIT(3));
+const ::std::bitset<32> line_request::FLAG_BIAS_PULL_DOWN(GPIOD_BIT(4));
+const ::std::bitset<32> line_request::FLAG_BIAS_PULL_UP(GPIOD_BIT(5));
 
 namespace {
 
@@ -38,6 +41,9 @@ const ::std::map<::std::bitset<32>, int, bitset_cmp> reqflag_mapping = {
 	{ line_request::FLAG_ACTIVE_LOW,	GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW, },
 	{ line_request::FLAG_OPEN_DRAIN,	GPIOD_LINE_REQUEST_FLAG_OPEN_DRAIN, },
 	{ line_request::FLAG_OPEN_SOURCE,	GPIOD_LINE_REQUEST_FLAG_OPEN_SOURCE, },
+	{ line_request::FLAG_BIAS_DISABLE,	GPIOD_LINE_REQUEST_FLAG_BIAS_DISABLE, },
+	{ line_request::FLAG_BIAS_PULL_DOWN,	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_DOWN, },
+	{ line_request::FLAG_BIAS_PULL_UP,	GPIOD_LINE_REQUEST_FLAG_BIAS_PULL_UP, },
 };
 
 } /* namespace */
-- 
2.24.0

