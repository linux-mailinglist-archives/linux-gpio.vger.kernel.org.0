Return-Path: <linux-gpio+bounces-22944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A4AFE022
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 08:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 691141BC74BC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 06:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DCA26CE38;
	Wed,  9 Jul 2025 06:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XVUGPDZ2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152D626B955
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 06:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752043338; cv=none; b=shDDtjRYBLw91DlE4ce4yaw1imn4b6TjoalCVZEgFi0rAJ5xl8Y5dKZ1gnt93n34DK5hWr8Fljtfa96rFWNaB8Hb4SxfiyMPglz2TZ5Mz7AFma9rQ8ciKzJu6OFdLsm3VlPXmPhPAPyQHb/gJI+HaaqNk+jD0fQNZxWU+3sM8Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752043338; c=relaxed/simple;
	bh=RgNP9cP0GXXURRnz4MA5U5UKkqJLSbhs9Cw8I4a0k4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uwzTRMuqYRZs8y+s0ZUHCYVvA3A7PfuYldzZYMCxSEcMTdcy1+AaBXKFo6KM7t3RrNiEpeHi18fBxTXScgwyXaQ1IRfGRQng+8CN20bU33ye1DaqR3VI0C5qDXP23OTdBrb7BY4sfgLVInlvHFeuzGyEGQ5b+2rQxbMLFMtlZ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XVUGPDZ2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so31066665e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Jul 2025 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752043334; x=1752648134; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRThQzopGYDbJfG1tnSg9IzEGu5vhLjPPN98tQDLnw4=;
        b=XVUGPDZ2qEZ8wjBqM13pcL9WA5LNARz5w4qN9h0rHvhtwcbCaOyWKJxROMjOiVUCrh
         7giWJ2yqHU0KsgMNefNpBKUwibvFuRv7+YQmNksZ4S9REESQegsZ3Q1W3xv3IiDpDN1r
         mQlZHmV2Z8tLmcDlnwdRb/R6SIQAAEOwnLxNb/H1I2YNyk8yGBxA2eEIkX+LCGgFLV2S
         S0bG8PhOsUk5XhP/JifP89DqsGx9JX4+q3RZxZO+lvmEelgmks2u2PTZgn3eslKPfE9K
         I8l+M7oQkGu5JLRnSE4DsH4REyo6JMgr3o2zA/21B5sMaJgBarWeXaYRpK3eHZWfMTLx
         2P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752043334; x=1752648134;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRThQzopGYDbJfG1tnSg9IzEGu5vhLjPPN98tQDLnw4=;
        b=qnpxqtrI01PVHZ57usvPk3I/0RHD0u6Wvl1SKHTsSdDPOK6H3sDFadoUk3FmOnuYaD
         axqyl0d3gWiuDikvsAZ1udQnj6mtS4tQ0lsmT8QReUjSiZpXcGBpcplrTX1NN45gTXVD
         MGd0f3vWG/69ztw2fvPrUBPer5aKQwNa4m8VqDydkFDiqWrQgOyZj+dKOGdE86BXAyKb
         tJPSmCAvXX3TsNQRRuRPupmecKX7YVMeVzeelU2nQ3pYP9H2Z5xTn5BH+wOH0m2kMFSz
         AMpb5ethO/AaKL/h7EaSjW0WsoCn9BqV5jF4f2rik0yGjaLC3YqWxFeP0CTeQJ5Dxt6Y
         EpWg==
X-Gm-Message-State: AOJu0YxPcJNDPUMNzDdezRVMb4s2kvOY6zdSyXDBmAMvQa5Q58/8qBB8
	RryiYk3cRLzSOG0LJj6sOGTEOMmVziLlUMZErLcibo0ccsJHMIstYoUEKQfecCKJol8=
X-Gm-Gg: ASbGncvK7PmVoSDSxybyAtMQ0dqu2e2hpFwhnjDvlv4rVPooncDBXCrNuEXFKnJ+tZx
	hCNPf+BZKbwxs9n4kPDUZCe2AMywjpU1oGAXNr3hEX8NDRfZ6xyp3GkR6ynXgR+zj8OD/VRyfTx
	uGOM53CJ8IqHvqa7yZzBRio0xxAQS793nLu7HWodkHOErYVgz/kMjadtnNaJp6Mw8Tw7adbkPFK
	eKoC2QqjMi0+h1n72gVn/z5fLWWHGi3zjwNSPzRHIuBPmyR77nSlW4aQWVx+KuO+O7QCU8DpbCs
	soKGl87Gzi4g/nvMrGxDp+csyN4kGY8uQGx0jkyFCIbnw2aHCi/1t5um
X-Google-Smtp-Source: AGHT+IH/0gx8Wcg+F9ixIJxQt/PgzFH8Il6oQ2HrnI+NhJ/fF9fDw5cwHNk9jMl6YFbMAhikddweJw==
X-Received: by 2002:a05:6000:2485:b0:3b5:e29c:190 with SMTP id ffacd0b85a97d-3b5e457a8a2mr717044f8f.29.1752043334105;
        Tue, 08 Jul 2025 23:42:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030c443sm15115341f8f.11.2025.07.08.23.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 23:42:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/19] gpio: use new GPIO line value setter callbacks in
 remaining drivers
Date: Wed, 09 Jul 2025 08:41:37 +0200
Message-Id: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACEPbmgC/x3NQQqDMBBG4avIrDuQRhOhV5EuJBnjvzCGiUhBv
 HuDy2/z3kVVFFLp012kcqJizw3vV0dhnXMSRmwma6wzo+k5FexhReEqB+v5mFW2GRk5sQ/ODTH
 24r2lFikqC37PYPre9x+DfO/xcAAAAA==
X-Change-ID: 20250703-gpiochip-set-rv-gpio-remaining-6c554dd3e662
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
 Srinivas Neeli <srinivas.neeli@amd.com>, 
 Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2721;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RgNP9cP0GXXURRnz4MA5U5UKkqJLSbhs9Cw8I4a0k4E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobg88JOlcm03BidTriPH8vePZYrhedUWzpG4fu
 QMFyLZb152JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG4PPAAKCRARpy6gFHHX
 cpJID/4mV9R2Coa2EywGN3kcv+51C/1VpUb7nFvYesRp/5wTQeCl86SHbo7QpzIrPaFhuSOUyXQ
 dyBxiDtABe6U4suMAUjSN0jDAX5hy9bmQ9PFbA/6GnkLxM1AG2ijgZ1FZlFSu5fQZNRKX9mfT3v
 /L9Pl4/64GFwezASNUFJnOwboTRvKvbabmYnn5kXFyQpTBrC2nTUicVrNZeAo2Hmyl4ay+tRynh
 3KGRgeaRIW575tVWttpBdyYJbuxqXcWs5fFo8W4hOFNsOa35Bq2aVulbx1Er1m/Y4RmmAMFwZWl
 h52QqhTqL62GgrkXuxS2r5NroPzmp21SjlN9b4I1bb/8/G3dskjXUGVpLel22QnhWMVdejiHrEv
 nyAByyjtYeXw3bq4Iqh8BvpHejNGDka0dlKiiChoftpsEx3LdQ5SlvqVyJ82/BLdujz/M6TcZuS
 LZPZXrZ1LRNmMlQISVbZQR7XFZ+Djuf2kDFRCpfbCxVygX5EpaBlP2C/8U8RmQ/5yd3I6Y2TUdw
 poogxN1HKPqeYu3G7nLiNXsXx98zw1NMI2yIHb8h4OPDQtVYUzfaySrd1AX6m5OYaU1x7mBZ4Bm
 kyZek0dp+1TmCPxzXmKT2myKHNiMbDmmfrA49XLKTr9F0Lvp0a3jdVtALC98OkoV8yZK2IezhL1
 PQK7qZ30q17MKUQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Alright, there are a few left so let's get this done.

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts the remaining GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (19):
      gpio: vx855: use new GPIO line value setter callbacks
      gpio: wcd934x: check the return value of regmap_update_bits()
      gpio: wcd934x: use new GPIO line value setter callbacks
      gpio: wcove: use new GPIO line value setter callbacks
      gpio: winbond: use new GPIO line value setter callbacks
      gpio: wm831x: use new GPIO line value setter callbacks
      gpio: wm8350: use new GPIO line value setter callbacks
      gpio: wm8994: use new GPIO line value setter callbacks
      gpio: xgene: use new GPIO line value setter callbacks
      gpio: xilinx: use new GPIO line value setter callbacks
      gpio: xlp: drop unneeded ngpio checks
      gpio: xlp: use new GPIO line value setter callbacks
      gpio: xra1403: use new GPIO line value setter callbacks
      gpio: xtensa: remove unneeded .set() callback
      gpio: xtensa: use new GPIO line value setter callbacks
      gpio: zevio: use new GPIO line value setter callbacks
      gpio: zynq: use new GPIO line value setter callbacks
      gpio: zynqmp-modepin: use new GPIO line value setter callbacks
      gpio: zynqmp-modepin: set line value in .direction_output()

 drivers/gpio/gpio-vx855.c          |  9 +++++----
 drivers/gpio/gpio-wcd934x.c        | 16 ++++++++++------
 drivers/gpio/gpio-wcove.c          | 12 ++++++------
 drivers/gpio/gpio-winbond.c        | 16 ++++++++++------
 drivers/gpio/gpio-wm831x.c         | 13 ++++++-------
 drivers/gpio/gpio-wm8350.c         | 15 +++++++--------
 drivers/gpio/gpio-wm8994.c         |  8 +++++---
 drivers/gpio/gpio-xgene.c          |  6 ++++--
 drivers/gpio/gpio-xilinx.c         |  6 ++++--
 drivers/gpio/gpio-xlp.c            | 10 ++++------
 drivers/gpio/gpio-xra1403.c        | 13 +++++--------
 drivers/gpio/gpio-xtensa.c         | 13 ++++---------
 drivers/gpio/gpio-zevio.c          |  6 ++++--
 drivers/gpio/gpio-zynq.c           |  8 +++++---
 drivers/gpio/gpio-zynqmp-modepin.c | 10 ++++++----
 15 files changed, 85 insertions(+), 76 deletions(-)
---
base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
change-id: 20250703-gpiochip-set-rv-gpio-remaining-6c554dd3e662

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


