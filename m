Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B45BB10E038
	for <lists+linux-gpio@lfdr.de>; Sun,  1 Dec 2019 04:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbfLADYz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Nov 2019 22:24:55 -0500
Received: from mail-pl1-f181.google.com ([209.85.214.181]:44987 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADYz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Nov 2019 22:24:55 -0500
Received: by mail-pl1-f181.google.com with SMTP id az9so14613994plb.11
        for <linux-gpio@vger.kernel.org>; Sat, 30 Nov 2019 19:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Em+62Cgm21jZhWsjFX9tFkJl4csZL6SrmPWo+1Ga/jM=;
        b=sH5d6FfC06rlqeBs3yZZ+VhY8Lqp7OKcKz2RaL+b9F/MDyoxDo6FO+Wz00wUlH9GwU
         X8RLS/2PK02QuedHJvzFpVa9/cQ0n0mvn7TJYAfnrlcH4smGFTkq4vxfiTokqH3MSlWb
         Dt5Uc80YNOJmm4OJwD5arBk7Q6frvO/1gtPyR2W0eaJlTQlMViw/d9CrLPYvRhJ8yEtO
         /kcyr3RORMi8pkMrbaU1oCWzv0y2eOmBff/wWgHKBWkV+wkAH3+2Dtm6sMDzpcy3l2lF
         As2gN9Z9EqxMy5fKxxn62C4z8b7TrPhaeesnjrz75L1I04QnGkcWkdbc8uHNoBGQ88kT
         NzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Em+62Cgm21jZhWsjFX9tFkJl4csZL6SrmPWo+1Ga/jM=;
        b=Pm/CI2SkfNwJRFpGoUr6Li9/faPXclWRXKcrZo7am4DoZK9TS+1epgNJfMnfv/Wled
         3EEXyWCTRIcHZFfW1cpGQ371qgqJCk8zi7flNonjZ8X9oyTR8CkggVV7kusz1xeeA4LK
         bz1/mk5s0saE3ir5Fp8v1+KFi/bo+/S/rOpuRmWYxZraAcAjzgZYxz28cP4pu60RvYxs
         KJzaT/iBw+IgbtfSGvTfVXdQm24se0cJNA1sCXpWvPOo4ueR6o6p2+dY6069A9c8TAnV
         4lxx3LmsgGdF/E5Z9NBKvj38Cw1PMljxoH78IKBiYDliTexiMXHUsBHJsWzUikI+0wCL
         NslQ==
X-Gm-Message-State: APjAAAXuZvAwsqTZonWZ9ZZjfHVUZaGLBJTEjPzjevZ1Du1mh7BZmIZq
        XgiuLLTk8tznDGtZ+tpqHp2LgCaa
X-Google-Smtp-Source: APXvYqzmD5PhL2gCFlug1JWxthgjQ1utdbgKXzRiaRIZlqtTqnt/l8HznVgLnGstpN2C9WrCLPXHoQ==
X-Received: by 2002:a17:90a:5d95:: with SMTP id t21mr27055903pji.120.1575170693622;
        Sat, 30 Nov 2019 19:24:53 -0800 (PST)
Received: from sol.lan (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id z1sm30307655pfk.61.2019.11.30.19.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:24:53 -0800 (PST)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v4 03/20] bindings: cxx: add support for bias flags
Date:   Sun,  1 Dec 2019 11:23:50 +0800
Message-Id: <20191201032407.23589-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191201032407.23589-1-warthog618@gmail.com>
References: <20191201032407.23589-1-warthog618@gmail.com>
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
index df6eada..29ea5b2 100644
--- a/bindings/cxx/line.cpp
+++ b/bindings/cxx/line.cpp
@@ -6,10 +6,22 @@
  */
 
 #include <gpiod.hpp>
+#include <map>
 #include <system_error>
 
 namespace gpiod {
 
+namespace {
+
+const ::std::map<int, int> bias_mapping = {
+	{ GPIOD_LINE_BIAS_PULL_UP,	line::BIAS_PULL_UP, },
+	{ GPIOD_LINE_BIAS_PULL_DOWN,	line::BIAS_PULL_DOWN, },
+	{ GPIOD_LINE_BIAS_DISABLE,	line::BIAS_DISABLE, },
+	{ GPIOD_LINE_BIAS_AS_IS,	line::BIAS_AS_IS, },
+};
+
+} /* namespace */
+
 line::line(void)
 	: _m_line(nullptr),
 	  _m_chip()
@@ -67,6 +79,13 @@ int line::active_state(void) const
 	return active == GPIOD_LINE_ACTIVE_STATE_HIGH ? ACTIVE_HIGH : ACTIVE_LOW;
 }
 
+int line::bias(void) const
+{
+	this->throw_if_null();
+
+	return bias_mapping.at(::gpiod_line_bias(this->_m_line));
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

