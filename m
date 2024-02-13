Return-Path: <linux-gpio+bounces-3232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D65A7852D86
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 11:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 150DA1C22530
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Feb 2024 10:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0875224DE;
	Tue, 13 Feb 2024 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bDqkAJ/A"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A213224E6
	for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 10:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707819018; cv=none; b=nAUDr0QTrrCkhWj4ddBgpCkKO9eGzY9ti3Qo64tSHwGgncGDU4rUoBtiTPYrCuDunHk/H1MZiOXq/yeNHbIH4MUproaFTkrR9qbrRfO2qJQ7BXKgb6Hk92vTWRPF5VJq6VE6JYWacLKtJsLprhW6MDrLtzsEQfk8gB8sCjETdeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707819018; c=relaxed/simple;
	bh=V9cYulzfYb7FqDqY0/zGsr+wR7nxlESe3HrJDyaeXPM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LX9oObPTEXQ/UjAf2NrYgfBbofuIEBFfCyHo9cRlWJgCi8yrpcIXJRpXo6tlHyWCGMPRHQX0vGmIdoII3QYWMaVS3/sM3GMR4jYG0AKxvLNcvS6RYTmthV6YJzfgvZvEcx1DXVDwOIPgJ6uqAkAX7icgekgzzVIN+emZ9i5Jx/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bDqkAJ/A; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33b4e6972f6so2206531f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Feb 2024 02:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707819015; x=1708423815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=44veiaBqGMc5lNCdO5QoQ2ouGyAA43jz0m7IM734+yA=;
        b=bDqkAJ/AsLSjrUQYQ/6OacG8zS2NzmUaf9MZR+iwixyJipGF4pE9bqXDYiuZvvrlEe
         Nvh3/Dy29yPGUFbQlF1pa/xz6x/eJrgN3AinExf2GK05/21Ah9rrQ15VsmV1qqqaY5mH
         41VD90OVwA3OzAOfJriec228hOZqtabAyp8qOiqJDezCyoMacgU7xE2G9uwrCBmy630m
         TbfA/JVzrY2eQqVE+Gj1YXlUfD7QfMnCNQjh1GgOybiX/EIDPpcunOgVyZLTkZYT3Ky3
         rqHnSuVW6JpDCpz6kLhtY/eNfqdm5TChO6afqlenObRU3CAt/kpJujxViuSHOh4nnLKh
         E7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707819015; x=1708423815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44veiaBqGMc5lNCdO5QoQ2ouGyAA43jz0m7IM734+yA=;
        b=KZl8z03WdbAquqjisG4HUAhhYKn+OHOkVyjdGiBHh1PCTXMbaiWiKm1iNRPJA5atyv
         hwcGrlvMnPwKMO0qtNiIS8PYXbrDiosANdoFMKmXGPsNAH593EidaHk7qc0EFM91Pslg
         XCDcR2/5Lq22D0QD8T6rrkb9rvQeIpOTu/nyrU0yWMTp6ihaL3IzfvHG5TKViAHXClVZ
         Qma4o32rjiIbbqwvG5AEiaX71VQvatl3t5dWS0+qGHo3HnZRlset2t3F23zH+foKK6mB
         e5Rq5dD+8L1RWsInWZYKAnp4PfNkId2zKn3G4xgtSTGS48RFgxroN+IHF0I6q7c87KW1
         M3QA==
X-Forwarded-Encrypted: i=1; AJvYcCWnA8yijo+CMj8hD+6bhJHETv3YuORM9wc+V5nAtwdkqAW/YOONBjEewDpvMruxRLkMfBe8I/Kjz0/eDR4MokZP6kjsivW24NS6Ag==
X-Gm-Message-State: AOJu0YwYt3u5fN/LB7V/uaGd6vRGpCa3h/QRzJq+kTISsLjRwIDJmwAn
	vlupwvdvVMpDFKTc1QJT0FfYxODzHxWFUlRxevS/oFADE3OiZsOgclDnK26hRzc=
X-Google-Smtp-Source: AGHT+IF48kMd4o6kuMj09jog6IyBi+Fpq6HfXZ4TbeQ6YQ97bupfm6zbfhP0q4ah5kEaehBaGLLu3g==
X-Received: by 2002:adf:f848:0:b0:33c:def5:1802 with SMTP id d8-20020adff848000000b0033cdef51802mr480082wrq.6.1707819015226;
        Tue, 13 Feb 2024 02:10:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8nfdwr1JotIHXrpC1l20SNFZhNapHegZmkgo0W02sYWECeFAPSysM4xhrVCDGsVj36bD3gaPGz2PhaeeGyEZP6ns/cgTrrP/mKZK+TLjBREevGCmfy5hHYluDfV9VpFVGSpNATd5Be3/+es3EvZazOY/d1uupCG7kV9BvM5kCuPWbLb/3Uu2ucFRZl3sSzD2nDiWigZjpQMBq03NfO4W2JUk=
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f634:2e37:58a9:242a])
        by smtp.gmail.com with ESMTPSA id dd18-20020a0560001e9200b0033b3d28ef1fsm9075805wrb.65.2024.02.13.02.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 02:10:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: immutable branch with GPIO stubs for the reset subsystem
Date: Tue, 13 Feb 2024 11:10:00 +0100
Message-Id: <20240213101000.16700-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Philipp,

Please pull the following changes from the GPIO tree to accommodate
Krzysztof's reset-gpios patch series.

Thanks,
Bartosz

The following changes since commit 841c35169323cd833294798e58b9bf63fa4fa1de:

  Linux 6.8-rc4 (2024-02-11 12:18:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-driver-h-stubs-for-v6.8-rc5

for you to fetch changes up to 2df8aa3cad407044f2febdbbdf220c6dae839c79:

  gpiolib: add gpio_device_get_label() stub for !GPIOLIB (2024-02-13 11:02:53 +0100)

----------------------------------------------------------------
Add missing stubs for new GPIO functions

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      gpiolib: add gpiod_to_gpio_device() stub for !GPIOLIB
      gpiolib: add gpio_device_get_base() stub for !GPIOLIB
      gpiolib: add gpio_device_get_label() stub for !GPIOLIB

 include/linux/gpio/driver.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

