Return-Path: <linux-gpio+bounces-14089-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C88F9F96CD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 17:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1ABC718870DD
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2024 16:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3AB21A425;
	Fri, 20 Dec 2024 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a57QkQw+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1A21C3040
	for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713195; cv=none; b=YoYBUamLrY98kNxHFCFPma8uhRuhXuRoFMF7VfRrGO4dp1jnUsiC0vVSpac1ChIWKgrWvRiGHVCGI23dBSAUP73UZ4ofV69eDpK8EdvIWlZ18ydsKxEUZARaw5OKw6ty/mhCeiM6ZoU2DmqaFKbpTaebMVpEYc30K6Kb9fuYcLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713195; c=relaxed/simple;
	bh=0kbUWR2z9wlXm8RVPEQnbnh1RvUEhAz6KQpoEXpU1o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+/r4wdpgXo7+N7b9XO/G8SjcqTxRkSdyY41dL40xIBs4IzDZk4+6stpQOgdCBIyDxiS27Jy6Amc3sUtwE56gAILgLlabmOzayz8qDgrQANwwNujST/Vce7dK/0n3ib5BqYiOKzJmPcCBvHmi3r8TLOkcPPraix2yFoMiFpdZAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a57QkQw+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436345cc17bso15955765e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 08:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1734713191; x=1735317991; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knd5f/sdD9mpQfJK+Hl87zARM4lUQB8IaXLK2CKxR2Y=;
        b=a57QkQw+FJkTUrfQ33CtPx1L0DfqF6MEP6rqSJAWGnSTNvDA+f8ILy2megPUfu0a1v
         /6z+t2g1VyErtNAWLAO/S9ahGQ2++eVUM8/06is0PJ4vmhA0l3Ltc9a9/AQXAexPk4rE
         /uhwE9bxZcUOgAYui13MH68YMPAJ4iCL+MCQI9YneXXnWMt/QnCEcfLrovphbinbgt5X
         QyowJrbWfI6jHk0rY/E2QP1gI/wFDJfHn4ofhnjylCkb7wG0H73EhjIlC9yEYuAdmH+J
         m4BKghrt1f6mgbiJxFhqxU7e0XvJ/EOHGWyT/KfHALTjxHw6l3fQE3pzavpr/L7MVr9i
         awCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713191; x=1735317991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knd5f/sdD9mpQfJK+Hl87zARM4lUQB8IaXLK2CKxR2Y=;
        b=belmGr6VMX81Bl120UWpKb9lep3o8L5V+2laHTfv4tM0PLDaNKSFi+K8tnoP+5EsKd
         pAbhWTxSgeNIBZ/vZjngKPG4mGz2UtLZASCUYGvFFYhdPpkfKaJoRI5wJYcJHjq6y0nu
         OrrG7BJDTY9ej1x5a9EoJ1qPAPuws4cKN8YfUy9iVel5OXBkINsFurc6oN5/cIJLNxK+
         V3ZkwUm/T5l8BfssM4Tssk4RtnF0tB0oI59rh4c+wVmaEM7bWGtXXq2ZmFgGofgCBF5b
         6/mvrObJQXLQva2JQi/kvXKBr9QdttYQ9vsv6HLhsOwfrWwkt+ySgW1cNVE+jG5IgWn6
         J58g==
X-Forwarded-Encrypted: i=1; AJvYcCWz4bbb9gNrNowZ27s2VOU/lgeItQdYKYr0QEn+XexAk/qsF8an9xVAYDKS8GcKor8c8X++IkyRwGtm@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGLq7c/xq0a+JLIetYRHW4tpLHz7AmE/oWEDDb28XDfMdh6tY
	fkEjHh4s1BnJdMN2rUgFhEDTPUh4jrTmd6k1rU0lNMN/fY51lY4+BC3aBXiGi3U=
X-Gm-Gg: ASbGncuvq7ctOIF0Y/LyYtKmgNuteQIMbaPzG+Ky2T/9YYkM4PmotaxbiDjCcWRRYZx
	HhRUQECpbAyzvi5xbHpxFZaEafiZz7BbvfBHc7ze8epRZaTk5hPAc2rytXNe86LZs1J2/o0w3iZ
	vYrmEAjXRMivK/egaGKe4TdURVZ9RPXjmaCekqvQpDBvNlrA+VUFsVdakYWO5+qs5236ASO0uSB
	k1mbdukksgJrE3SIKWWJK+hcsjeRSDxG57PrOoCC4oPXbitRw==
X-Google-Smtp-Source: AGHT+IG3xHO74B3nZ8rGVQ2YDyZU+rCQOrkLx6zhnN5kTGWNOiZO9R99Th13s/Zl6KrzvO894FFN7g==
X-Received: by 2002:a5d:5f4f:0:b0:382:6f3:a20f with SMTP id ffacd0b85a97d-38a221f11ecmr3884548f8f.11.1734713191367;
        Fri, 20 Dec 2024 08:46:31 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:72db:1014:577a:9e6b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200abesm50165225e9.18.2024.12.20.08.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:46:30 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 20 Dec 2024 17:46:22 +0100
Subject: [PATCH libgpiod 1/5] bindings: cxx: doc: remove the gpiod_cxx
 doxygen group
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-improve-docs-v1-1-799b86991dec@linaro.org>
References: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
In-Reply-To: <20241220-improve-docs-v1-0-799b86991dec@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnZZ9kegblRAULDkTkIv7b4/ujkkbid78aM0Xer
 SCXQWOiMDGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ2WfZAAKCRARpy6gFHHX
 cieqD/4tEBwQUOzjblUe7hox+dMregM5K57zKZP+bFSkA8Tea4Gvji4i+JotSsxPLHZ0KnkG2NF
 hlAVYouX0Wd1hTyRF1h4YC3hoZsUr3IQZQLD4rfMcFenxs0P3E4bB2+a1APkx5VIQVuZSPcHopj
 xSLSrII+hiwBlOLSSlMuMyDmfuE1L/ulws+ze+K63wAeAWDsXkp28/kerRkuzvqyQuLDjRMXfH3
 KWWySrJjIOqgjQqhJQcI2L1nfmin7IGBc4aXhJJ/c53j5qe0o/H+jdvJGd2i5RGYnb/A/LPFDaz
 CBtJ/wYO+e5VSjbhm626r0M6g82OD/yl2/Ev+F51u0D7xGgcwUXpIO4w8y4HW/uRa6DTMMZBlvn
 aaxQtqFzg6M/vo6wdCfm+fjk5wCou3qHxNunNHmnzYPd1AK6wz6iDJ9RVcThUX2iS5G+zjeBCUy
 gTyHtlKux1AX8Y988kUBu1iUBly4fJGBPP7X6kLGhXSQB6YJ4t4WRlmGCtxMiOFnhA4TtBjU3pp
 k51V7BFBCk/Bnls6CFJlPC8JYTpLR0fuEEKQDLRs+T0QtWuYRo17cjmfHFQkehfMbOvgterTCXd
 uNWZS6StJFdyhoX+BPAYd7KLiFXGvwPT7Uo/5GoS0n+RMgkjc28suopdqzTz+1rAEX/+Q0ezbTW
 eAuC1oBxJL6hVPQ==
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


