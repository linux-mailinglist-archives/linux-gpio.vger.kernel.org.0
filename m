Return-Path: <linux-gpio+bounces-18287-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6998A7D567
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F46A3B0CD2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2C4226D18;
	Mon,  7 Apr 2025 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jRhftUiZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F994226CE4
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010182; cv=none; b=W0fFWjtUmeQtNAKJaOiAjmjnhsSt3xcKvaSuTgIzKkvvRU4Ukc0s7gBfJGz0CdmVUwSHvxsQVIXR2GjhLCiIjT68rU2RsN9fpgVXXlZJz3saXKfAtXpOiTLjDE1qqynxa2R9jlXeKkv2y1Y/wGAu0xLbickO5IFEmNG0UdWA/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010182; c=relaxed/simple;
	bh=YGC9f9nbV6koDiSgdz3kYk+cRMInVhToZrkshRdwdJE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oxR1ZcTIDZpIB3gljXcF0ZmeeSBaTBaV+a8Fs29f8G37ywdI/8TDRgns+XGKNGxOzk5HYpHyJwsjvQ+BkKgCGMWK3DdlGOlCftb1gPGIRrGevm5xxctoU1YCp7/yoSC0aqImblNU0V8jZQI5KKmmY9OPjj1FykgbNVmprxJhOlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jRhftUiZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf680d351so28858865e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010179; x=1744614979; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVrxRG/XgSdb8izzX6Tu9iNr+twbvVkWtL92va2LnrQ=;
        b=jRhftUiZv6Y0u6wS4ABYMpNjrW3f3Qsu4wv+prPKLGOPtEbBDcBlkEf4lhBqelKNAP
         McPhWWwbO4eD+faK7Dlwj0OKNwmIB0nNnzb2wdOZkBZAdreAG7Ra6sF2K/CsO3enzvUe
         2kHHWwpJWnNVh5OA6cQYXjqEAh7qRbul1vXHqCDEFaVGSsMZLGDEghqvzEUYI+pnaZXd
         ArTSp6D0G41HAos9kyqk8926+N+fmMNoyt7sfVh+01HxtHggxMuxSk7tfoejhPl5IVI9
         wO+MMK8a153Bv0YJYgUrcl4Gih5q3WMBcAQYUfCQdV6G1j6trgjgPr97DslzUw+8vVcm
         4BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010179; x=1744614979;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVrxRG/XgSdb8izzX6Tu9iNr+twbvVkWtL92va2LnrQ=;
        b=XuzjDPRYMQl7LDlleSS9KsDpZfn8CLKsd5IyBSaks9keS+jgwEsB57/hyeUxBtUsO5
         PKOkfF6PAcddWTAEN4AtKxJBoGp3ayn7PN3rjDn3JtSc3xTnGAlO0kZtnR79j5lPv+Fr
         rYyvoJVGB+g/ihFaJj5ineHt2YIWIf+3SyC87eTZSDwJG0aXqh1+Hg02J6Ju0qZbjT1O
         8mHUq3ypUg1/oqTpCe9QKHQ1SL4OY/985a6P3UaFaGMb0+KH23375HfS8c2Cy0zAGtDB
         WIGRuM8VWRAF8esTuq5uVvFi2OCZTQuAN6H/wiE4WG0dUlmntp4BGor6lbTdhwJHHtQn
         YOaA==
X-Forwarded-Encrypted: i=1; AJvYcCWsf9jY0VTIFNLJEQO954oxYIYaSt8XHZuBDfLc4Bc0Sl8km17HMBdLoavOs5d7r4xhCQpn4F81IgRS@vger.kernel.org
X-Gm-Message-State: AOJu0YxLDoyIZ9daMHBbGX8xzabTNto0qtsOH2Gv/8oNCq8JhV6B3kfV
	McGA1JBL1SpZysItc1DahV/B/NbeAenbOSx5xdUY0U7QIrTGvL86Z+p2DpIPWQM=
X-Gm-Gg: ASbGncv9ZkyNR4nIsh02vfLkvm44fU/xdZiIwRCy4gt8EuDVNAzWTwFjfrh5vRMM5kr
	0rQIOfL+m9yMY1TQD17btCUG/mE/leXxwZYr0jo0jaHd/l0NJ4pBThgrGNtRE9JcSQIrAcUk0XU
	EZMcbF9JdCaxSQU4hg7YT9JK8j58RG3ikhsjGVY/KOeO+wTK+TTtYJGdQYtL0LyOTn11Nk81/UI
	zTdB5eRs9ANKFr1T303ornM377fayeRYXzQtL7GRX6oVKBfBMc8eKsH6My71OKg5Zci87tkv/Uf
	s1bXr3yfcC8CP59fNXgsse39AeXZJ1gZEXyL1UvPijDOhm2P
X-Google-Smtp-Source: AGHT+IEjw6TmOc5vFRvt+VfNyIQOCZ3U69KJcnB3e3Z4aMdeaoYQpalS8GNrMN2C45UkybOX+CeskQ==
X-Received: by 2002:a5d:5f8e:0:b0:39b:32fc:c025 with SMTP id ffacd0b85a97d-39c2e5f50f4mr12316351f8f.2.1744010178995;
        Mon, 07 Apr 2025 00:16:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364ec90sm120728725e9.27.2025.04.07.00.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:16:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] hwmon: convert GPIO chips to using new value setters
Date: Mon, 07 Apr 2025 09:16:15 +0200
Message-Id: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9782cC/x3MTQqAIBBA4avErBuw7P8q0SJs1FmkolFBdPek5
 bd474FEkSnBVDwQ6eTE3mVUZQHKrs4Q8pYNtahbIWWFJrBXlgMmOjCeaK/dO+y07hs9jIOQDeQ
 2RNJ8/995ed8PHr43pmcAAAA=
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=841;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YGC9f9nbV6koDiSgdz3kYk+cRMInVhToZrkshRdwdJE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83vBKqCOobXgPgcjyOQLyVA1G97RjNag6gOon
 iVonURpx3eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7wQAKCRARpy6gFHHX
 csGED/9EL2jxJU8YhLTFqKQlBblXNUWjeP0xBH2FHhjjCM+M5Nm8MK9Z80JObXEbAr2+ZxGEblX
 Q8dMDjeYKEDroFYmuqeI+mnajOuqpDTEGji4x7x6amEqfd/x7TG5t0UZHHfmNjC6Rv6PQokPQFK
 rkB8Sa/lirC+QMVzZaxR5c8tiaob2JaYcT3CQ449oIp1CqWCvv27ppp5pZs4r4edNfNTP6iuqo+
 kCTuL7JMGbxravI4Ojf+OVG0YxWDZXZX2s03LpeHfBjmpP4xs16BZ2V/Mb03nWIuhWWgKZKCaJ7
 TeVlE6Q42nYwPLjkQsnBd6byjHrdTUqdTHEL95AWpUQKTgY8cBKqK3UMHDQFcHhM0hHB+zc+SnA
 id212CP05BlNunUXkAMnEfbydSsP0XAVbyCtrhmt5FAMobNZEcj+hZC4Zl0n3anqJpAm8u/+ir2
 QH52ens3RM3WFCaHkVvOSzgDuHrgXkA7SzRIhAgHzgJui0qFuPaGAZ+AGCOESkfafbWpmGBjx6K
 MMV4zJNydNHUNSIXCBLoaYqBSwJKqiQ9QHioJtk7d9KRn5NdaoWD8ReskT0KVf4c2fQ9MN0Uedd
 Burm36hvzhMjEOgTq1hU6058iGZKYmuEPYy7UjSvRKIIYpmEWD7e9Hg2OKfYgiK1+yUayTna9NC
 wLqmYv/6OdASuWw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all the hwmon drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      hwmon: (ltc2992) Use new GPIO line value setter callbacks
      hwmon: (pmbus/ucd9000) Use new GPIO line value setter callbacks

 drivers/hwmon/ltc2992.c       | 28 +++++++++++++++++++---------
 drivers/hwmon/pmbus/ucd9000.c | 16 +++++++++-------
 2 files changed, 28 insertions(+), 16 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250331-gpiochip-set-rv-hwmon-6ff74f898034

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


