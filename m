Return-Path: <linux-gpio+bounces-15446-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4AAA2A85C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 13:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89B6318890E0
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 12:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEC021CFF4;
	Thu,  6 Feb 2025 12:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BddWtKZp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F422B8C4
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 12:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844540; cv=none; b=EanlquLbdZJBziYdGkxZFbNvSr0W1gkie8WklyNiEBGEw6ltLha85vjLPzoyrAAkJNfaGclYCA74j0efnexoC9daYYImxAlCz+TSW4qXQm59kU2UzNi5iz/Tlc70GYUVVVzQxf3ddHb0yp/9YQsDo5RWcweMTgpSNCO77BY9dY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844540; c=relaxed/simple;
	bh=0kbUWR2z9wlXm8RVPEQnbnh1RvUEhAz6KQpoEXpU1o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RjmonVmiFqbxSMbN5JekWpvK3SGO8lnk9WHZzQZ4RShvmp3ybHkU2vRbBpvhvkPN6JB2aA9QF+0Qq5LaHnSnYGenw82KR1/yuEqBE39m9cGuK8irJEKu8ks2f4k5kHSDdfSomiRLn/VrX8KfAc8aV9+JjXUNUe1QMHEE+w4IMTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BddWtKZp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43622267b2eso8451045e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 04:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738844536; x=1739449336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knd5f/sdD9mpQfJK+Hl87zARM4lUQB8IaXLK2CKxR2Y=;
        b=BddWtKZpmCNd17BtaYia55SfeDb0zZvi7CRyyXbMaWXgvQi2UVPFYZXRrLLE+RtkI+
         aCVoPR8qKpwMm1ywsJ7HnGIDVp1OCodUwF07zfcpkhyFDS5xSj7l9PI2q7QzAfFxHTc6
         3MNjF09wjLB8dM+unrNkrQeimQJB9hweSPDdIim7R9adjZv58PivPRMk0TpitdXKzROL
         6TXhp35ghLsM9QYIv5GokscAf6iw4fxinhZiFJX4BaH7I73ogqwoEoYI3R1qAlEDKNnE
         PmdpXHDQBnCt0+xNCbXZ6BsqZ69rq+W8CblYh+/eF8i6aUJE8572yQ9xbpPGkDjBUpnn
         P5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844536; x=1739449336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knd5f/sdD9mpQfJK+Hl87zARM4lUQB8IaXLK2CKxR2Y=;
        b=ccmy8gnLcYIOz6hr5I3KjhbBIX0GqaCEVdT+Vj8B7EdEfNVkldg13vVHpefcb5jHGN
         ls+ldx6Hjtg324yaD+RGnwfv/Wi+EVHCaGG/VpO+5idqTjD+9NhpOBUl9ShqZxD2ZMX2
         RZLJBW3ltc4hdEZiNuAgiiErfaDuhV3/6tKqPDRf3HYXmev+gJCFCbY16a6mrOp+VbhL
         bN1b2546rxW3+xXFYrvLJP5Nsmb8Po5B47vArdJActlrGRZVC8JIFZVR5G+dheAfp8r3
         q4PEsEyqB1D6+FBm7NjWzlKH7PNL1nX1X8qeN0o3ARLSCRrGvs4xy3PplLw6oE9/3tUc
         5aDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0petwPY1xIYqUfseli2KryWVekkI1R959HN1ebUR50AiSZIevZFk+ZU6iQS7f/MDE2dkV5wFp1dUd@vger.kernel.org
X-Gm-Message-State: AOJu0YzMg6SYuBABSJbNOXx2dmNcWlVOcRmkR5TE71hDKMmsoQ3j0w/E
	L641ZfIS1U9dn/7aqXKaggLjbPwfzjuHAnud2tUml0wCSz4mgg7qT7BXlU60kbY=
X-Gm-Gg: ASbGnctuNO8nap62QNkORjtE2QlgDYnwkNLYoxljon8ZgXlZ97dZ7WvAOXlIsBF31Z8
	rLbJzeXLunIbUgLEofWIxPGYsExHdvh9Ri9LMc1iQiBV4v+Ve3NjPGI9sQS2+6pWzrsetzypJx4
	GvS4CZlVnt5ELmomxt9X6Sm1Bg60Z3DdHSkxnYcTsZBuGnHz2CA1o2Dkrjq407KFxIpCva0s9vI
	E++mtCPXxeHSiq4s/nwuhNpnfVucjTBMa9zXzgwQ123qgHydqDCWUSSHOJnGx2qcXmKHFR/l42s
	SNzjkA==
X-Google-Smtp-Source: AGHT+IFFW7XlgXEe42kFyzSAKFYqUc4XDJfg88CbNSoG+dhklMg9g/32VuZzXglOufmkYIZbLKHlrw==
X-Received: by 2002:a05:600c:5129:b0:436:f960:3428 with SMTP id 5b1f17b1804b1-4390d56c1d8mr54064255e9.29.1738844535882;
        Thu, 06 Feb 2025 04:22:15 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd7d7asm17366775e9.36.2025.02.06.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:22:15 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 06 Feb 2025 13:21:59 +0100
Subject: [PATCH libgpiod v3 02/16] bindings: cxx: doc: remove the gpiod_cxx
 doxygen group
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-improve-docs-v3-2-2065191fff6f@linaro.org>
References: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
In-Reply-To: <20250206-improve-docs-v3-0-2065191fff6f@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnpKlxyptGPsA2Uyvfc5LaeCPD8SULtJTbzXk7f
 r1oKaWA//uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6SpcQAKCRARpy6gFHHX
 crJlEACTLYRt1Syn1tQFnrqUrT3VcWdFAhC0C0cRUuXIl53qJ0g2xdCSd6bfyZSo20/kuD0nVqn
 HAlEpsctJpVx/hjUQcq838HDLETMw/sRdRrUs6p2iYHB87c7j3AQ2H6cZ18gLWm5E4aHdnpgu8Q
 7/mJ+LxdZDHBH87kYajMN1swG+gb+6A7Zcc7RcPdzePCeG8VprURRTq/UhbDMvf8YdIccIMkQDn
 SRdTEFzB3FgCR7jbZFDneh8R4CtfvCsq0I4dekrPqpTYIPSCYsN6cqzeGUrrcUCn8sBkCqnP/ek
 ggY9QG+txE8RSL+gNenSeSWqcNWqdkCxPK38QkzCOKHqOrLgexu8dMmSi3u6xFr0wzflDnoBdGO
 /yFUv5X843ff5OdZiPnfDSHa4Ruio0XI4Qpjx0308NuSCAVhwx4uv5rmbuOb1wXCs1r81Q9+5wM
 h9hzhrBpz+mjUz1tgsAq/kIBQO/hZTRStji0/E+j3rJgf4W2mz4I61pqHEsOKkuiT0PL0ULtvEF
 73MfSrh0KtJgZaf24kXySZ9NWwdvNq3xaceSjJc08kfL8sefHpBVMhwebxZeI1VrCupv5eusFTF
 Qgq7dUCuBXzJ9jefdWZtzrGHyCR88gOgzcY/wzdEd9FAkB2Gh8XESxMKkziVg2XDQdCx+EiHAKB
 j13xitom3RRAKJA==
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


