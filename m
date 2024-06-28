Return-Path: <linux-gpio+bounces-7795-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACD791C1C2
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 16:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2271FB24F7C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 14:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EB11C0DFB;
	Fri, 28 Jun 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W97Zm/XC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779211C006E
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586438; cv=none; b=p+WePLClG8rAGgXzXdzNN2iFxXoKXTfgEDlYFR+ZjuBqUc3ccJA9DXs18oVOXxpCKT5Uqnd2hfdemtWx6RNj8yiWzzhJnFWaqEBI6vpvyquMObx7o8mSzYdavI992HzsE7QZJ1hlVPIrKeRwjZeUvJuvEuFmIntnTTnaHhHSobk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586438; c=relaxed/simple;
	bh=NlO0aZfhz/s6o0n59m2zOkLbSwgJ5oykFJRbT8FwPQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GsIAO0hKsPVN3+CZ2BHNeJvwLSBoI7LhZFgWgh306dB8Dqy29/STF+icp9Sma4Q9NoYN55KG8vfYKWKBo60dW0WV6or6bMK5/rI7r6MHGZCDSQnROh1gsY1OFLJjCT3AFIOYgyjtX4WzaStldi1Ycw+dddK90J47FSuMakz6W4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W97Zm/XC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36279cf6414so436007f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719586436; x=1720191236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39E0yrdWdDHUQfncbDygAV8xbrSDzDO4WmDOOUxTBXI=;
        b=W97Zm/XCHcuOuFeunaOcjHDPBsxcRpN9ofqad/N003mIRP9DzYO4gguUc7MyHxnj0m
         dXDcoPmTgwYFiz2znk84Y90CPJ7JumU/t/5jcxPhOo3G+PW2FImQ4/jSJnedpDmMUyBF
         7zRo2HwWNoHNci4HjkRinck7wJP8AxBKLIKPxbKtY4XcfvnhKk9W6/e6UNYmNMXZXKJ3
         vXBwyn5lskD6fLH2KThh4KNFUGFdN8mmfH1EWXtc2YQSBW0htYZfycJVK7rSzzFt12S8
         aE3+oUyu3MFt3RnzQQsk8lQTCcXrBJtesqZhOs884cSmABvQLIl0xkXXP+jPWY12n7n+
         v9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586436; x=1720191236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39E0yrdWdDHUQfncbDygAV8xbrSDzDO4WmDOOUxTBXI=;
        b=fC3Ayq6xLVeivqsMf+FmyXX1AxwjE5nn2oJUondv8KzRb7+7fr08npHYqtomFm4vg0
         YhyquTOy0lFwqIJrZIGQkiW2gLRpMXDySjvCrqIGTWy/FdKXG4gW29ECGTtiQzjtHHw4
         iRLPI/OWp5BoUyUUgSefL7eJVq5xEZJKVpRPUdAFpsRvPghAKjBhdLrfweKrn2WLM4dI
         zacGXI0+IyQKS2lBoAPeoRbs2ExtzTabGoRpKgLCq/BzR19/JUepSnvY+WB713ogsved
         qyw6CYTBuxL70Q7tOvVD6amSWEk5prCujj5OOviDymoslt6hapKhHbsBHpUEfQG7IEVX
         fc3w==
X-Forwarded-Encrypted: i=1; AJvYcCXZk1Yh0wBkitpMhT3RypzhwJ85pB9zowhHeQ5me5siXrrV4r9XB0qImuunRr6JcZeW7aH7zDADHXps1RU0Gt6wXEngYZWR6FZKsg==
X-Gm-Message-State: AOJu0YwEoMjkKtCjv2094fG6RkKWMh2gYZLdYggS+T+4inbJRdhsic+w
	OQlZDHqIk+kaxs4zVflO+v7Kd2011jsiQPO/HbyNSi6w+4+PQujWmUoIwkeC52M=
X-Google-Smtp-Source: AGHT+IEhtAudUaX+9RLk5HzQWioOh8QL8vnezmY9Uwez5k2JnMw4c9WBYIWwxArijYee/7luqQPAPQ==
X-Received: by 2002:a5d:59af:0:b0:364:7f42:1b66 with SMTP id ffacd0b85a97d-366e948faacmr14591060f8f.16.1719586435924;
        Fri, 28 Jun 2024 07:53:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fba4fsm2518124f8f.85.2024.06.28.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 16:53:27 +0200
Subject: [PATCH libgpiod v2 11/18] dbus: add a wrapper around the
 gdbus-codegen generated header
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-11-e42336efe2d3@linaro.org>
References: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
In-Reply-To: <20240628-dbus-v2-0-e42336efe2d3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=709;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uenmBNlg72EuxwSfuAZIjIaF0DfWjeAIoTp/JAJRqKI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfs5yirhejTWdaPDerdRy/RnO1jrrAIIV1GOJx
 OxDath4B8OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn7OcgAKCRARpy6gFHHX
 cvdsEACG6c79YhsIdRh68RPDmtQsxo1u806cYqoRPbLYhhnjrVKz90qKDhCgdhbQGmlR03FC7h0
 3hMe3Hc0fMDsnOw7ub6r4DgSJ9ZFQY+K4+YogO8bv7oy0hkSh9zCVXmD3AVyG9a+qRcu9mtSfKN
 xUdlciPpqGmhzQ4PfSe9ixDGtxZq9+KW0MEsEdsvt6fKwVrkR4oiOYHDWYCHEHGpB81RAz5QPSb
 PK3S9h6SZri5CKmlGu7lrTx4nETGaYf/by5sWgmGPAslfgIHm3T52bklR7W/PeXT4RxT6+QJn/z
 8iIqiw17e9nzzKs2Jf1qctpnqqfGhhZbO2DYMUBmwcJtZ/n68iUIsxnFqYoF1fjOBRjplWLZAZ+
 DqH8mPU7F20xI7O/P6OZs4DEazROPqdAJ9uGVjneZr5rg5aHj5v4ENA4OPB5VKR8/lhzRkHMa4u
 xbAQUNrczTPPAkq5hAtM0YT6nARhS8kfHUbW+cQSoaIN/VPOdP/rhGsMVceoELRp7/lSISgkA/8
 j9kPtlrJml5epGvKwaRS7qNwzPdmHr8/4CxkfDeKGrw6dk1oO/CNcmYuu8LWkutOqnvnzOB9ntA
 aFcxBTE95MlIn7So+rFD0csgDxReAcgByqeWRiThYcJJE3RFvCG84jOUVrCks192uYmGDuH3zno
 7kCy0eEHozjPDtg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a header that will be included by all the code using the automatically
generated GLib layer for the DBus interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 dbus/lib/gpiodbus.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/dbus/lib/gpiodbus.h b/dbus/lib/gpiodbus.h
new file mode 100644
index 0000000..69362f0
--- /dev/null
+++ b/dbus/lib/gpiodbus.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2023 Bartosz Golaszewski <bartosz.golaszewski@linaro.org> */
+
+#ifndef __GPIODBUS_H__
+#define __GPIODBUS_H__
+
+#include "generated-gpiodbus.h"
+
+#endif /* __GPIODBUS_H__ */

-- 
2.43.0


