Return-Path: <linux-gpio+bounces-7825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B5F91C641
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF78E2868D1
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69906612EB;
	Fri, 28 Jun 2024 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="x8Nukvk9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB6B55E58
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601162; cv=none; b=FJ5U/XapRrGp04VAHcVlCmcx5StUE/pwRWEDLQ6bre0gFKp5buvA/nSZeTKaxPkSTrukKBCChw9XnEU0OM9TvfEv7StujC2MruTsI2wbEqDrJzd5000cagf5NHc08SW2oRNLQJgOYDSNDGUZyEyb+NrQ6/AB5AYYwlbo3t4DmU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601162; c=relaxed/simple;
	bh=bEUpGtG/D3JtTbZxH2yn5bgvaJEJ0+1zLL/WlJK9OEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z1y2bcsLVe4MAzg93Ns4PHqiU+AWTuXYgcc7oHUShtFoDVTZ1o9SGJQgDTLXB9U5uzkoz9tqi1uQQu1uuWnG9Wegk/hbdttu5X7O2xKR2Kqtr6xIyVi4A8CCClk5qKk7ILg9G45cyK9gUHtIwbV4ugzveegX3dmMakeSj2czFAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=x8Nukvk9; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so10439051fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601159; x=1720205959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnZPZpNDn79/gR6rQ0o6Supjv2gHlA3trk142CFNysg=;
        b=x8Nukvk9iw98YlEXbHvTk8+fdEKjSNTYtQEPby4VJEPrFX3AmA8rrhfIkaxSEWakN3
         rXLKxsbQneMt/oCgySu6Ly14hp6rSsgedhHo/z9+1a7+LrWaLlV7w2GCtCxAY1Whudyg
         w+hbzi2gFbJ22IXwe4efRIgUk6MQE/QeLc0br2TZDpAYC1QZwz16q7vS1dU9k25J5yQT
         DkvA0Z1izneZFqqD1XTscXKXFhAX2zqouzUPIXiggp9D6E4WTQJFFXDuRU86FwKgDTCO
         sJ5zHQv9SmdpXnJlSxwKhWIL/n4OlOjKPSFA3ezyaxYTJBSEaur3aT7RduX2ubJAThzF
         k0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601159; x=1720205959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnZPZpNDn79/gR6rQ0o6Supjv2gHlA3trk142CFNysg=;
        b=bPmeQbMZuCRBNv6wlGns0Jlsxh/tVe+dqMikoLQYooD1A5EaHyHk1bOO2CvyBZeoWr
         ER9pjkRi9tpPJ8qvhYIb2eC9zBpLL8YZjXzlzk6D7B6HZ/8Qp4tOFYBwqgCfjfws1Ew9
         0OajUParcKtcofft626dcWtaYb9dwkCc2yrZ7/2nmS7haMt6Hy8CamV3nTfwUt+W3FDl
         FFu1bwBkNXTHNZl9sSO9MbuOfATZoY9Du3kPQYz6NwBgUB9h74FqHn6dzGaMNWuwT/2i
         mtyA2J2LdJv/jB0qPq0f1X2L5fTyPOQQ/DeUVTN63tEGwzyEGleIw2UCH8ZjCtb1UCmt
         bveQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQQrzt/JmvoL4Hxav8BKSN4tEvwBBudhiQYsO2LG6NaBXrT46+qzRkh5sUGqnYqve7txSxreVcCALqmBG3Shvnayro22GIP/je5A==
X-Gm-Message-State: AOJu0Yx3nv7PXl9ExZJGmdRIkezVnTe9AczdJCyyoW8kRORqA4wqN5+e
	zED6T9RV6TKsffn6FGxewkqnIaBihKhqDsThjOmW8LbiMTrmbAyM1drtbzxff9MJId7RE+REHnl
	K
X-Google-Smtp-Source: AGHT+IEZOm3ljdJKvDsswteWOS5QxxW5X8LVPcbPlOasol7kdpdYVfx/FzbhcnqY1f3L2zakO5JMmQ==
X-Received: by 2002:a05:651c:893:b0:2ee:4c35:be82 with SMTP id 38308e7fff4ca-2ee4c35c0b1mr37409961fa.42.1719601158681;
        Fri, 28 Jun 2024 11:59:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:36 +0200
Subject: [PATCH RESEND libgpiod v2 17/18] README: document the DBus API
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-17-c1331ac17cb8@linaro.org>
References: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Kent Gibson <warthog618@gmail.com>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: "As advised by Dan Carpenter - I'm CC'ing dbus"@lists.freedesktop.orgto, 
 linux-gpio@vger.kernel.org, dbus@lists.freedesktop.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3289;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iMxXKRtITtm6UpwD5WUpezMbjn6y6yIZyvwF9qVoy/I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwfvJkKBPe5elsYtJeFCPXHs3QY4MPwcMcWGh
 hhc/etiAwmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H7wAKCRARpy6gFHHX
 ctWyEADRKGkkMIpC+NKWJAecx00KiFKkTWacA3xHA0uCwqcloRRsa9UF3BLq+pR39zxHYmxgUJv
 Cs5N5q990r1KF/RcgD/JUR5xY5LPMo44KYB7+ancYHMjmqWQN4hfHmMNI8B+owY1qg79pOmsfYJ
 6YGTJW0g5lSyf+q4QTJVYuAtcxSRZq6eNpuURy5nmL+R0IdTr+XPvRkG0B2njw56qgl0CnkVqln
 0YAhTDqrJsJpYCncwZOuAjG6k+N4e50KkipSoZzl+7bBKoEy3rtIonG1V3QoPmgRYjurGVvVfMT
 pgMeBzB+slfyXmQWnNlC1i1VbSnzsCkA69gxVFqUYYHG6Uq3fcJMapPdvuzn/Ldon9FvaAm56EO
 5uA7iRF7DcV51nL54MsIYgVs1zqTgUl/6mo/KuIdhj8BwDD9E1fMD+vLA/FrOEHwXZ3Nf44rs5M
 FXNeXaDOjtGzGS6utLysXKGn9f6WDpGF+EgSaK9qiEE+mnbVXoKCbg6xVgu89nmvHKfHhVe1iV6
 Uoi5Z1hnGCdcCfBnKDrz+y/KYmACr5ghjh5TpCsBsBN7Sx6lZp9yJ8vc8WMBRElB5ySE1ACE4sk
 taf2s4SNkdv50buE/arDzhGgUAbYN0J7o3OOKI7Fa9iXog1hLeWUbbezRKSifoiHksRCXY6ixga
 uwWR0QEKzzJ7Kmw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add information on the DBus API as well as gpio-manager and gpiocli to
the README file.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 README | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/README b/README
index ef5d328..192943c 100644
--- a/README
+++ b/README
@@ -224,6 +224,70 @@ C library using make, they will be automatically configured to build against the
 build results of the C library. Please refer to bindings/rust/libgpiod/README.md
 for more information.
 
+DBUS
+----
+
+A commonly requested feature for the GPIO character device was state persistence
+after releasing the lines (as a kernel feature) or providing a central authority
+(in user-space) that would be in charge of keeping the lines requested and in a
+certain state (similarily to how the sysfs ABI works). DBus API has been
+provided to address this requirement. We define an interface covering the
+majority of the GPIO chardev's functionality and implement it from both the
+server and client sides in the form of the gpio-manager daemon and the gpiocli
+command-line utility for talking to the manager.
+
+DBus support can be built by passing --enable-dbus to configure. The daemon
+is bundled with a systemd unit file and an example configuration file for the
+io.gpiod1 interface that allows all users to access basic information about the
+GPIOs in the system but only root to request lines or change their values.
+
+With the manager running the user can run gpiocli to control GPIOs by asking
+gpio-manager to act on their behalf:
+
+    # Detect chips in the system.
+    $ gpiocli detect
+    gpiochip0 [INT34C6:00] (463 lines)
+
+    # Request a set of lines. Note that gpiocli exits immediately but the
+    # state of the lines is retained because it's the gpio-manager that
+    # requested them.
+    $ gpiocli request --output foo=active
+    request0
+
+    # Previous invocation printed out the name of the request by which the
+    # caller can refer to it later. All active requests can also be inspected
+    # at any time.
+    $ gpiocli requests
+    request0 (gpiochip1) Offsets: [5]
+
+    # We can print the information about the requested line using the
+    # information above.
+    $ gpiocli info --chip=gpiochip1 5
+    gpiochip1   5:	"foo"		[used,consumer="gpiocli request",managed="request0",output,push-pull]
+
+    # We can now change the value of the line.
+    $ gpiocli set foo=inactive
+
+    # And read it.
+    $ gpiocli get foo
+    "foo"=inactive
+
+    # We can even reconfigure it to input and enable edge-detection.
+    $ gpiocli reconfigure --input --both-edges request0
+
+    # And wait for edge events.
+    $ gpiocli monitor cos
+    21763952894920 rising  "foo"
+
+    # And finally release the request.
+    $ gpiocli release request0
+
+For more information please refer to the output of gpiocli --help as well as
+gpiocli <command> --help which prints detailed info on every available command.
+
+Of course - this being DBus - users can talk to gpio-manager using any DBus
+library available and are not limited to the provided client.
+
 TESTING
 -------
 

-- 
2.43.0


