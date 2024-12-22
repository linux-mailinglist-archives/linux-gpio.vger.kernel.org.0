Return-Path: <linux-gpio+bounces-14138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA69FA7DF
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 21:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DA4B165A79
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 20:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106D218FDC6;
	Sun, 22 Dec 2024 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jj6TImCN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B686165F1E
	for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898102; cv=none; b=MNIFYcAT0puqkGGIvV5e9x2N0nbTYnEBcP00FXi8rEC/vvK4sgoOE9VoADzMS5ocJlFKfRw6LAlo9mt0JTEYH2zGmMQGEzzBXCnBtF0q3eN9vPXqjIie5K2o5H3PLv6SN0rCyrHNow+VvN4Srlo2Bt2G1SWnX5sDGkI9sf4hBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898102; c=relaxed/simple;
	bh=0kbUWR2z9wlXm8RVPEQnbnh1RvUEhAz6KQpoEXpU1o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBvbp9aQx3me9UedrmC69cidasupbUyva+17VWXA/aW6rZYPtOdqWQDTVWq0VtajnTrnWHy1SiIlCifhuh7GUJ4+UhRr9PCHqbxmL8299f3WEi9DXBD2AQaGkuPlc+WgSSadUqCTEpXhF8xD2cPKwj5SX/TWtsjgJ4F58SCVdiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jj6TImCN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-386329da1d9so1678286f8f.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Dec 2024 12:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734898099; x=1735502899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knd5f/sdD9mpQfJK+Hl87zARM4lUQB8IaXLK2CKxR2Y=;
        b=jj6TImCNmKzQWUC6msZ9NJpvwoGFTyugObFXePfQpsCu7uIEfIoemMNN35SxDL0ZOC
         55kCcB3P2UR/RDaxDDwiw1SF3h8Bs7vhgu/cpNMZHT7licoZFw6O4BhnPyOYYe2FQa4J
         MnUQ6Tw24dC7GQ4vhlysNtEsUUlAYR4K+rv7nd/328A9z9B8AxiYpmeHtBaEUHxT1Zmz
         TlwaNaBmJDgh+ZNwVQlW/boGTJD7ygSrzjgVHtkYfI19cUNP3EX11d7L9OOLmO/9C3tb
         jgptHwVbdrKBBgaQIXwzhWXIANzAa5c8k45+RAwJG5hBqV+L0AGgmg1K8otAjgwafLxV
         2W3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734898099; x=1735502899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knd5f/sdD9mpQfJK+Hl87zARM4lUQB8IaXLK2CKxR2Y=;
        b=ZmPmtLVCEApY0n64VG2MWZuBHva9u+YP03wylAUZA2411xL64f9BK/IWWDthXknVI3
         6/4a9sVDQD0Z9oyyRbbTTfrmMulR5wc11aWPCQUGCtjQxAo2lEe2X8Qi3ZvWw/Zczksw
         8Venl5WA6u4D9v7NrDzNR3qphhyroFWjkSbISb8sdW82UDiGLUw6BPZzzyVmlA/vlqjM
         tTehOzffD4QxYBixxjWOxaGpzuvFFKHSznqusQbPakJLckwUQh5IL4i/AO0Fr4pHxZi1
         oo64+kX7IJFMxqgdJ0SRNLitT0le5sR3PHmP7B5m7xqU0C+Wva/YxZi3Xuwh5l+OlPag
         eadw==
X-Forwarded-Encrypted: i=1; AJvYcCXw3EEmeIgRNhchvkoIIy1JRNtuMUhUqR8Gx+wPLUICrcPEnw32zkqA3tZDXj9FBGj7PQ8lu1M63XZN@vger.kernel.org
X-Gm-Message-State: AOJu0YzdEwjltMBu6wjFjMuLL0cEVK/vs6KAEhK4Q49zitO1RRzAhLrU
	6MqAwMXmvxYZGp1p342BpJNtVTwnC/jKKC19nGsXmzKjBiUuNhcJONApM9/RUsE=
X-Gm-Gg: ASbGnctacq+M0IRO/i5KgXno09et0iXAAwL0fbpu6fhxN/t6p8SRpUw1a3cDiLnhVS1
	c2p8C4LReFU/w7xSgxnduEPVihqZVAgW5pu3i4oPzE+pkIX+/Bym+sxoldnDtDG7OmadCkBLF+N
	IcJI0PTCXRR6uYZVnmxiPZhTrBeEG208Ca27PCYFp4IxGBQAKhrRRzSHLNlxIxS/X8gobTjxnSD
	t4h62w7Bxm9v2WMf/SYb3c+i8Zw16LR+ZobG16fI3cOBYKU
X-Google-Smtp-Source: AGHT+IECk2g9/9q65ResOhV2KTho/lVLlUTlaTBHejZM5AMPg9iO9IyPioOC90KNnwkP3NNj82MfpA==
X-Received: by 2002:a05:6000:4614:b0:386:2e8c:e277 with SMTP id ffacd0b85a97d-38a22408c81mr9877992f8f.55.1734898098560;
        Sun, 22 Dec 2024 12:08:18 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a153:75c:4edb:ec23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c833155sm9492900f8f.24.2024.12.22.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 12:08:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 22 Dec 2024 21:08:06 +0100
Subject: [PATCH libgpiod v2 1/5] bindings: cxx: doc: remove the gpiod_cxx
 doxygen group
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-improve-docs-v2-1-9067aa775099@linaro.org>
References: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
In-Reply-To: <20241222-improve-docs-v2-0-9067aa775099@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnaHGuAbreD9w58hodzN6UNVdf5ZLsu1LQ0CXs8
 kaS6whScXuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2hxrgAKCRARpy6gFHHX
 cvlsEAC3Xvh5EtxAQNia2ix3I+3FydbvtMnCdFR8T1Num041JEI3ia7QyaDlLTsA3sVqNkcRD62
 3uZ9HSe/GWxSZbe/r0AkOK/hyLp6Q+cy96Pk0xJZUc+ks9HGgoWCOKq8PrSwhwWvCJ3hbbJ7zCl
 NVZnwrbiBa7QHm+ZAJed5YY/xMqacegJMVRvEXGcSMRO8w2ik0cbozXRUKy2ZZxIjhBsyAPyEo+
 hNowp5Ouj19Ahb7L4cDBJvsjUplblrv7VbIte1zy+VF8fI4stIgINkJptiDAz6a6eah4fblePp+
 HT27z9vknH5/RVHRwIPUrfkQ+PJKoZVrw+0GZNPdCMUHpC7ZBbx6Tb3RU9jtQNaNgtyVKHB5wN2
 YB7I67gi5c/xKmjye1h6La8j/nKoWCI0FuihmLRaJXvOIwW9CYSgvHHVmes9FklJ+ECbDzvZOcA
 SPIzIseqtC7OniredId2pgClQMIGJGUm9yKCbH5j4Bj3fg704z0oNwnJQj4fw8FFncaNqChckqC
 M2iPMF3efXa67676j4rTvo5HQPnp+4y7wgdra2X/uouVc/cPywh9qZf1lEsU8VzSJWkZHtoXRhb
 we2Zodnh24oslIJ0vA/ko4+dQ/2M7l4izPNuwDFJofXd9sF9e7rACMrARb4YwA14Pn4xq4vzMDR
 rzUfwbzen0hz5Vg==
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


