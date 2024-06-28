Return-Path: <linux-gpio+bounces-7820-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF79991C63A
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 20:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CB2A286819
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 18:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0CA58210;
	Fri, 28 Jun 2024 18:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sU57V9dV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8BA558B7
	for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 18:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719601155; cv=none; b=RTqUGFwK5/V42a5ApsgEOVSeaOH+pRV3feCKyDYhRyJFwmgteZgsafbROrKpiqMO1C+nTrgFwAWQeI9/KZmEm9voPvewQ11whXRPjknBfeMKdh5OiCaKJhhY9XNgq8YeseNZ5ERnOalArp/NoqsSc9De2ydStRbbucJQH8/wH8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719601155; c=relaxed/simple;
	bh=NlO0aZfhz/s6o0n59m2zOkLbSwgJ5oykFJRbT8FwPQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ExfJX2UGj3rM0KDVgFksk1jX7fWlrDp18Appdpqnogx4VaAZsy/Np0fnBQkTlfEkFdTYohfrLKJQRhRRqwIQYzlxKB23K/ReV49zMbbZAJarG7t1MractpMpcslmqYT+5oadtZyAChB5ywrJ0uzktUttIORriz2i3H5VcF9HfKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sU57V9dV; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-364a39824baso557625f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jun 2024 11:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719601152; x=1720205952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39E0yrdWdDHUQfncbDygAV8xbrSDzDO4WmDOOUxTBXI=;
        b=sU57V9dV7MjCewcATZQfNEwmEgGrNt+adTa1Sa4MseptSekVw5gADKzdtSf9pZ0CGF
         98zMk2684TeaEMkbCzeYaKTyajYG75SELCZgaH/bZxGcQGgxMbPU7w7nEnUtxbjkDkgh
         BHDcal2XvdAFrjvkrhBD3H+XFPWEv6WnN8KRrqRjGpKjdXktbMX17XR5ZUpmAx31vCQm
         DJmDXDmg0pPxE5+YNcP2K6fztTqFhyY8gNoTF4byOkvLmHrKqbtot1tSAvOVGs5q7mdm
         YmBTZJJr1lstwEdAdIomjL4EEIsaMVInd/z75Q8YPVKsv981Z8enrjTBfkXToqaC/7Yo
         tr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719601152; x=1720205952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=39E0yrdWdDHUQfncbDygAV8xbrSDzDO4WmDOOUxTBXI=;
        b=NQBFQRnZPxJ3vpM9mTRHkS5Wa7bIeN/XOh+oHWlDOKD2z203YqAab04C9LD+ZSqvU8
         Hm6gsyw02Y2I4H20HgAB7aZWiVqfwQRsLcgnr92VUgRHJvhQCWE0Z0hOSj4mX6ugWUcm
         NfWllE5p3yWlV+GlbsGyT/ThLjd+ftMKuA4kKs38hD0yiJzmF9c6AOdf427UV9BbRgGE
         P/8SpvjJTYeik3vDLlt2f4FIjOR1klOvS5M6iKtzByou68sVrjNwnGWNWchmwWRtPQ7d
         3MZQ2ufjQT3nAadcu2M+9BmNcfrsZNJ3wi71/HBrE6rwqtisRdja3H/oiNG+od3orYCw
         RCKg==
X-Forwarded-Encrypted: i=1; AJvYcCV4qF0YvVbJVUSV+YLJ/14cKJyMk9GrVdMapAGTyLKrWwRBreE0T1lGbDbBnlukOjg6d6JD74yvgbZzvkwXR9Fg8BWwt5xy+xyziA==
X-Gm-Message-State: AOJu0YxvOJRKa+2ZY3TFRGOyus3qc9ylYENvNjxW7fp6n45TV2bss4xl
	AiawWNfhkHVWA/m+LO2d3fXI0UDhiJoQikJSDqxYkVoUJIvWhfC6ED5r0bxjcEIKNH7A6IEOoqV
	+
X-Google-Smtp-Source: AGHT+IFEY69BQtqxaJChTb7gXvOep5IHRcMY90Go+BelbRKb3vwjUxml1YzjqZFpOPNBs4AAQf1K1g==
X-Received: by 2002:adf:f7cf:0:b0:360:9d23:67f8 with SMTP id ffacd0b85a97d-366e7a520b9mr11705691f8f.69.1719601151871;
        Fri, 28 Jun 2024 11:59:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103d00sm3097336f8f.99.2024.06.28.11.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 11:59:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 28 Jun 2024 20:58:30 +0200
Subject: [PATCH RESEND libgpiod v2 11/18] dbus: add a wrapper around the
 gdbus-codegen generated header
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-dbus-v2-11-c1331ac17cb8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=709;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uenmBNlg72EuxwSfuAZIjIaF0DfWjeAIoTp/JAJRqKI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmfwftqTsw6nsacQTIkYIZHEwhKxrVuaJzqn8N7
 xbWEAQBn52JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZn8H7QAKCRARpy6gFHHX
 cjtCD/46g627HF1GuZoKKdLsUI8iStCxAcugzCHse7Y5ynmfGK1ILkyrXPS5Y5eGHEQB3z51glt
 uhBoOMEu4u+aZgluJHBeWYS00a1WU3I+mmeONEdsjZ/za0TSiufHnf9TdAE2n/xUkLYtCmBwOka
 O/jVDjruZQQKAngkIYhnRM59ZbV0QMHXY3kDg6V06Ijq/E8h31hmWBf5kDu2MFE/7ikVD9HH1Ra
 4YZEo2VGBbrIf7kM4Gan3PkCWs1MNxI0lMYm93NQ0Y16q6QJ7B8HiZ2LNAA9uX9QDmGUqEMdwiE
 xTaCU9jZgfqc+OKlOWYA4vhbYng71wyExtAKD1uWpdAjqEIELeWNv19eLdXSDth70dFfeagrOVC
 FSuNeL6Yl584HTJ38WIXuuH86/MH/uQgHETYWizG2ojzsfCdfHuBnzqvJm5bAm/NBdkTU/3LzkL
 /CBk3AQgtckk0o3QWXGIUYWlBqYh5AoUMFj6D1nXmxMNPrtWGD754vjrAUoCWK1Pd3bIxSJWmQi
 3eJu53sBWYzOJpsTCYLsWWKzmfwZOz9pzZh2qNCovHOs5Ea89sQH+3+pA8Le9Hu84oN6WfIiFJ5
 sKOlEap3wjV+Smf2mUqOdDVK7/4rrwyDA+HOOaU/RPBpLRCdqmjn4Q8Dz+d8bInDM3DWI++Qeht
 r8MpKaL3+6bMHUQ==
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


