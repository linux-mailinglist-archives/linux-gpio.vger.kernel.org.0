Return-Path: <linux-gpio+bounces-15742-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E68A30C47
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 13:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E91F03A7304
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 12:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D520211472;
	Tue, 11 Feb 2025 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XxAJR+WZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245D5216E1D
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 12:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278784; cv=none; b=L56ttcj8nP/X6l16CGMPALpgi/elW/QPIiw6Y1u8QxtgM8HB9AvcPVTO0TF5024t/vcx1QkUMpafh0AXuTfIslqzzpWKaLO1IKdfm/w+QfWRSoBIHIkcQgVuJ0KspeA4YzxVxIZCYYjks/CL3wAY/kwZ2+JTMGVb0VP8m4ZuNwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278784; c=relaxed/simple;
	bh=0kbUWR2z9wlXm8RVPEQnbnh1RvUEhAz6KQpoEXpU1o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HzDaBfdkkrULkfc1xgaQ2dOYhEUUm0Lj7S4UNhxsSGcQljVIFAHoLJytcU8Yc//BM/9/ZbFW1yT0zGtA8fUBkXifLHLD1BKqWtirvehDC4M3bMIwBcZ6hryCiX8ZQcVjHzSLAWY+vzcfLKmWPn+XigaBvJuVR44D2l2BgyYjY9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XxAJR+WZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso11633845e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 04:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739278779; x=1739883579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knd5f/sdD9mpQfJK+Hl87zARM4lUQB8IaXLK2CKxR2Y=;
        b=XxAJR+WZiVI2/W12FZUf/323Ddg8w3E6PGOeu/TZ76BEVJwWseTb09TGzqlYrjJygq
         vxpYnwxR5WZ4Z8xL1/iAFJjp5F/guVYvn0lScLa+3wP3L7SMMi1qC/r+lY04aFAtZegn
         R188w+Gkzd/eH1d95MULGfTjHclH+zLMR1WJ3BnKNb8Cp0u5o2YOkPVuuBLs1YTpr8gl
         vhFHmcAirASOuvJTaw9TwWlR1Pm+WQu47TeITVohjossrEmgSAx0CgFVy6VC2T3l0sJN
         kUHAd5l1ZN4Ey6I4hbQmgEuiD7SvdzrcQxkXjWaZktG/fdjEggO+mk/5ZPK3VTD5CNRW
         IOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739278779; x=1739883579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knd5f/sdD9mpQfJK+Hl87zARM4lUQB8IaXLK2CKxR2Y=;
        b=QGkUgc793dTmzOReubQmfYvXaf8SGAka0uNhVsrP5dESlXBsDFzSLJzGG7UfE5/Wnz
         SNNvDy7sG44PTZMR1DutVVKNojgwbVW1vdIK4AbDvdIvj2L9y9HU9uw5ysQpbc1AfUqP
         HrmVDif1bME88BnDc2BrL6dk3dZ+SY4p57RySpFrr1UnBMHYgSYKQOGVhiYpocLfV0YM
         T9O6JE3veuQ4LneX3d7wJyKcxFGnoaRSEDdQ6r4p76sQc9xTQHqo+UOQK4j4+qSUsgNW
         3m9t5voLnMpCI3chO+ygRv5H7R0yrlqN2Br883CIiqz1yBbD0YHQR+uZ6kYslw20kfn+
         bBdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtb8h2q02L0zp7ncbjx5/YPn0P11a9xzJHy16cVocwbezz9vdRXSKSW6VCZihl/5Npgh49sQBZBX+G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3BBXbIaLHOvH0anS3aOh/AxLQzurf7ggPggKnV7gxVd8lpy4l
	EWxH9E6EWe5MVp/CeWJb0VzYnQ5GRsHwNbIJ1zqBtWIxW2DVRi3vzeqrDU9PBao=
X-Gm-Gg: ASbGncubPqsK/4nEj90rB44CohKeksyvxjs6E7lBC00uBlW2PyTDC1v1MMGfqbEIqhM
	CG9zQo8uy/aLPiY8LQ3jMgJWwaNXJu65eVWOGBh9qKH7ibgL3rJVOVuyp7bR7PwyIjmWareRRfj
	wIF53PqOQsXl1T6sToyBNTJ/uFrkBzRXs4ha6PUbuqHomw7ashRK28CghtJDac9/7t5I/MOzERo
	xgOx9nS7BVzP2Qde7/fuYHmO+qalIZkg7NNPeiXq4KA5aaSiuSeckw5uYTr9+akQV+68wYtxrjC
	Dz7mU+0=
X-Google-Smtp-Source: AGHT+IEHzuXax/XMGd25n1zQbPSrzxvW8vsScedHCL0o1fDW6CQQYo4wBMC3L0GMLzbKWFak4YsGXQ==
X-Received: by 2002:a05:6000:1886:b0:38d:d8c0:1f77 with SMTP id ffacd0b85a97d-38dd8c022b3mr8917970f8f.43.1739278779278;
        Tue, 11 Feb 2025 04:59:39 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d40csm209844095e9.9.2025.02.11.04.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:59:38 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:59:23 +0100
Subject: [PATCH libgpiod v4 02/17] bindings: cxx: doc: remove the gpiod_cxx
 doxygen group
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-improve-docs-v4-2-dc56702c2ca8@linaro.org>
References: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
In-Reply-To: <20250211-improve-docs-v4-0-dc56702c2ca8@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=11272;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=0srOWbscmu/4FhrutKp8ov6udNTa0kboULA18SAHm8w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnq0m14GqS1cfaAs6ckzA5V8eSe/CNv+HenveLY
 f9oXzn163qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6tJtQAKCRARpy6gFHHX
 cltdD/9clR10Pz6vm0Qg05ooFONTCQ1egjeYG6N73yX1LY4Xo1vF/D8fwt/psW6f4KJLwjWBEh6
 dtNKLI2p429aWzC/QH0g0qar0kFGb7jXGT8o+Es5lX1z1lUK1e6nz8idZECozbOBCc6cNhiS7aj
 FD+e/8Z216jo5JqAtzr3P8hfidZUtsW50PtzVPjeEnK5wV1B5nm1EobKwxh2Hv9szJVvwVBmtQr
 rSV29dl8Qs6ORTrB8dgb9sadYBcRT7bEHbVkyEmeri+lFRDyzQjZyE6dIhY0w+WyJIqN4WoFT4B
 ZdLxKVm1uy3KmnHC1jZL4NCG+ayAIDijPa7Eo1FsOURRWE80j/6F++qzPnpXRusj9KtaQZuHHrc
 15k3HfAleXMNvRS2I+LipWBdlR9LvaamSMvavm196mhtI2VpvPwBec80OnDv4uipiTx1dUxbCVv
 Fjv2IzDf5/KtOB1jq/5f3lnM3r0aSEt/v5w4sG2yQL7+1VGKn1ylHL1MRK7+1BayW70oKHioXBw
 PZfngnzsMojlX9yvh0lBww/L81UTPfwGfT9o3sh0FlgQKXEaN4ceYbRGv9wdQrSBCTh6nFrh8Ib
 iw0TjuE9DHaLa29IkJ9iFMNnEns3wQZ9bD2EYHHrgN28OYxAB36hOoCdb+KZcqYJMNEImTCHsnN
 rlx3oYOkWHr6rVw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Groups make sense for the C API as they allow us to nicely order
interfaces manipulating a given structure thematically but for C++ they
make less sense as methods are already typically part of a class.
Additionally for global functions, they seem to make it difficult for
breathe to look up the correct symbols.

Remove the gpiod_cxx group from Doxygen comments.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/gpiod.hpp                      | 6 ------
 bindings/cxx/gpiodcxx/chip-info.hpp         | 9 ---------
 bindings/cxx/gpiodcxx/chip.hpp              | 9 ---------
 bindings/cxx/gpiodcxx/edge-event-buffer.hpp | 9 ---------
 bindings/cxx/gpiodcxx/edge-event.hpp        | 9 ---------
 bindings/cxx/gpiodcxx/exception.hpp         | 9 ---------
 bindings/cxx/gpiodcxx/info-event.hpp        | 9 ---------
 bindings/cxx/gpiodcxx/line-config.hpp       | 9 ---------
 bindings/cxx/gpiodcxx/line-info.hpp         | 9 ---------
 bindings/cxx/gpiodcxx/line-request.hpp      | 9 ---------
 bindings/cxx/gpiodcxx/line-settings.hpp     | 9 ---------
 bindings/cxx/gpiodcxx/line.hpp              | 9 ---------
 bindings/cxx/gpiodcxx/misc.hpp              | 9 ---------
 bindings/cxx/gpiodcxx/request-builder.hpp   | 9 ---------
 bindings/cxx/gpiodcxx/request-config.hpp    | 9 ---------
 bindings/cxx/gpiodcxx/timestamp.hpp         | 9 ---------
 16 files changed, 141 deletions(-)

diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
index 91e41a5..606994d 100644
--- a/bindings/cxx/gpiod.hpp
+++ b/bindings/cxx/gpiod.hpp
@@ -8,12 +8,6 @@
 #ifndef __LIBGPIOD_GPIOD_CXX_HPP__
 #define __LIBGPIOD_GPIOD_CXX_HPP__
 
-/**
- * @defgroup gpiod_cxx C++ bindings
- *
- * C++ bindings for libgpiod.
- */
-
 /**
  * @cond
  */
diff --git a/bindings/cxx/gpiodcxx/chip-info.hpp b/bindings/cxx/gpiodcxx/chip-info.hpp
index e740e94..61c0b78 100644
--- a/bindings/cxx/gpiodcxx/chip-info.hpp
+++ b/bindings/cxx/gpiodcxx/chip-info.hpp
@@ -19,11 +19,6 @@ namespace gpiod {
 
 class chip;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Represents an immutable snapshot of GPIO chip information.
  */
@@ -96,10 +91,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const chip_info& chip);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_CHIP_INFO_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/chip.hpp b/bindings/cxx/gpiodcxx/chip.hpp
index 4d67476..8a1389e 100644
--- a/bindings/cxx/gpiodcxx/chip.hpp
+++ b/bindings/cxx/gpiodcxx/chip.hpp
@@ -30,11 +30,6 @@ class line_request;
 class request_builder;
 class request_config;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Represents a GPIO chip.
  */
@@ -173,10 +168,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const chip& chip);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_CHIP_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/edge-event-buffer.hpp b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
index 2482e8a..083c2e1 100644
--- a/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
+++ b/bindings/cxx/gpiodcxx/edge-event-buffer.hpp
@@ -22,11 +22,6 @@ namespace gpiod {
 class edge_event;
 class line_request;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Object into which edge events are read for better performance.
  *
@@ -120,10 +115,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const edge_event_buffer& buf);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_EDGE_EVENT_BUFFER_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/edge-event.hpp b/bindings/cxx/gpiodcxx/edge-event.hpp
index 47c256a..acbe7af 100644
--- a/bindings/cxx/gpiodcxx/edge-event.hpp
+++ b/bindings/cxx/gpiodcxx/edge-event.hpp
@@ -22,11 +22,6 @@ namespace gpiod {
 
 class edge_event_buffer;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Immutable object containing data about a single edge event.
  */
@@ -128,10 +123,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const edge_event& event);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_EDGE_EVENT_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/exception.hpp b/bindings/cxx/gpiodcxx/exception.hpp
index 34737d2..b753af0 100644
--- a/bindings/cxx/gpiodcxx/exception.hpp
+++ b/bindings/cxx/gpiodcxx/exception.hpp
@@ -17,11 +17,6 @@
 
 namespace gpiod {
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Exception thrown when an already closed chip is used.
  */
@@ -149,10 +144,6 @@ public:
 	~bad_mapping();
 };
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_EXCEPTION_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/info-event.hpp b/bindings/cxx/gpiodcxx/info-event.hpp
index 69b88b6..ee01651 100644
--- a/bindings/cxx/gpiodcxx/info-event.hpp
+++ b/bindings/cxx/gpiodcxx/info-event.hpp
@@ -23,11 +23,6 @@ namespace gpiod {
 class chip;
 class line_info;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Immutable object containing data about a single line info event.
  */
@@ -114,10 +109,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const info_event& event);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_INFO_EVENT_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-config.hpp b/bindings/cxx/gpiodcxx/line-config.hpp
index 58c9d87..b3b9aba 100644
--- a/bindings/cxx/gpiodcxx/line-config.hpp
+++ b/bindings/cxx/gpiodcxx/line-config.hpp
@@ -21,11 +21,6 @@ class chip;
 class line_request;
 class line_settings;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Contains a set of line config options used in line requests and
  *        reconfiguration.
@@ -111,10 +106,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const line_config& config);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_LINE_CONFIG_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-info.hpp b/bindings/cxx/gpiodcxx/line-info.hpp
index 8b10dc4..bf02ba1 100644
--- a/bindings/cxx/gpiodcxx/line-info.hpp
+++ b/bindings/cxx/gpiodcxx/line-info.hpp
@@ -22,11 +22,6 @@ namespace gpiod {
 class chip;
 class info_event;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Contains an immutable snapshot of the line's state at the
  *        time when the object of this class was instantiated.
@@ -167,10 +162,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const line_info& info);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_LINE_INFO_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-request.hpp b/bindings/cxx/gpiodcxx/line-request.hpp
index fcc4e0e..9605019 100644
--- a/bindings/cxx/gpiodcxx/line-request.hpp
+++ b/bindings/cxx/gpiodcxx/line-request.hpp
@@ -26,11 +26,6 @@ class edge_event;
 class edge_event_buffer;
 class line_config;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Stores the context of a set of requested GPIO lines.
  */
@@ -227,10 +222,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const line_request& request);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_LINE_REQUEST_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line-settings.hpp b/bindings/cxx/gpiodcxx/line-settings.hpp
index 1004ccd..89d79f8 100644
--- a/bindings/cxx/gpiodcxx/line-settings.hpp
+++ b/bindings/cxx/gpiodcxx/line-settings.hpp
@@ -21,11 +21,6 @@ namespace gpiod {
 
 class line_config;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Stores GPIO line settings.
  */
@@ -193,10 +188,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const line_settings& settings);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_LINE_SETTINGS_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/line.hpp b/bindings/cxx/gpiodcxx/line.hpp
index 2810571..c58bf11 100644
--- a/bindings/cxx/gpiodcxx/line.hpp
+++ b/bindings/cxx/gpiodcxx/line.hpp
@@ -23,11 +23,6 @@ namespace gpiod {
  */
 namespace line {
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Wrapper around unsigned int for representing line offsets.
  */
@@ -265,10 +260,6 @@ using value_mappings = ::std::vector<value_mapping>;
  */
 ::std::ostream& operator<<(::std::ostream& out, const value_mappings& mappings);
 
-/**
- * @}
- */
-
 } /* namespace line */
 
 } /* namespace gpiod */
diff --git a/bindings/cxx/gpiodcxx/misc.hpp b/bindings/cxx/gpiodcxx/misc.hpp
index eab8eba..cb56b92 100644
--- a/bindings/cxx/gpiodcxx/misc.hpp
+++ b/bindings/cxx/gpiodcxx/misc.hpp
@@ -16,11 +16,6 @@
 
 namespace gpiod {
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Check if the file pointed to by path is a GPIO chip character device.
  * @param path Path to check.
@@ -35,10 +30,6 @@ bool is_gpiochip_device(const ::std::filesystem::path& path);
  */
 const ::std::string& api_version();
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_MISC_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/request-builder.hpp b/bindings/cxx/gpiodcxx/request-builder.hpp
index 192bd91..62597b4 100644
--- a/bindings/cxx/gpiodcxx/request-builder.hpp
+++ b/bindings/cxx/gpiodcxx/request-builder.hpp
@@ -22,11 +22,6 @@ class line_config;
 class line_request;
 class request_config;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Intermediate object storing the configuration for a line request.
  */
@@ -148,10 +143,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const request_builder& builder);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_REQUEST_BUILDER_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/request-config.hpp b/bindings/cxx/gpiodcxx/request-config.hpp
index 6ebbf99..96f0262 100644
--- a/bindings/cxx/gpiodcxx/request-config.hpp
+++ b/bindings/cxx/gpiodcxx/request-config.hpp
@@ -23,11 +23,6 @@ namespace gpiod {
 
 class chip;
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Stores a set of options passed to the kernel when making a line
  *        request.
@@ -105,10 +100,6 @@ private:
  */
 ::std::ostream& operator<<(::std::ostream& out, const request_config& config);
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_REQUEST_CONFIG_HPP__ */
diff --git a/bindings/cxx/gpiodcxx/timestamp.hpp b/bindings/cxx/gpiodcxx/timestamp.hpp
index fcb4d8d..dc44eb7 100644
--- a/bindings/cxx/gpiodcxx/timestamp.hpp
+++ b/bindings/cxx/gpiodcxx/timestamp.hpp
@@ -17,11 +17,6 @@
 
 namespace gpiod {
 
-/**
- * @ingroup gpiod_cxx
- * @{
- */
-
 /**
  * @brief Stores the edge and info event timestamps as returned by the kernel
  *        and allows to convert them to std::chrono::time_point.
@@ -114,10 +109,6 @@ private:
 	::std::uint64_t _m_ns;
 };
 
-/**
- * @}
- */
-
 } /* namespace gpiod */
 
 #endif /* __LIBGPIOD_CXX_TIMESTAMP_HPP__ */

-- 
2.45.2


