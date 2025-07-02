Return-Path: <linux-gpio+bounces-22574-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5213CAF0F80
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 11:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5976F168A7B
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 09:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB71D248166;
	Wed,  2 Jul 2025 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RDsrazUM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A673A23F421
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447655; cv=none; b=h5XX9bNt/wpSceuf5lNWndn/YXY5MQ1VLsdAT+RnUFR0iY1rYp7A3+VOJ/ZwRNpoSXZMYHIe1sH9AHifdCmY63nJnMszqFuX4mNEPljAcHmEWUOcV16E2jTFu2MqSc5yRngtgPZWmlpe0J5gBD/xpR9CCUIkuOAQ+EgtWL6VqmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447655; c=relaxed/simple;
	bh=sOHXpCVPzm/YZ8eTA3k3opAT2PwIqz3LxOM7hlnGd2U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B1u9MkdfDd9U+zq0dBLTwV56KqCEnaEp9lV8RgVvUZCDNoxMYfT5nWpeQRMFr/IZToKDMHzFVLY/p1nKEFVInM48Q7M4CACBiNpk3UfePMaeD/n0QavajA4nlfNvmRh1j1TqfAMxtLg/bbEF3kxDWzv9xb1bzz/5kIyGrLqZFfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RDsrazUM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so4853466f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 02:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751447651; x=1752052451; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeL948pEBrM0oIl1f+aZCIR6Mgw1zy0Mr+qFmSzolc8=;
        b=RDsrazUMrPNkDeDIjBHi1xpoderahxDFiHs7Qy32Kvfa2mzONLnoEnCuL8nnGETY1+
         ukS3ClTgePoL6M0G+xHgEZIQxL89Au99E8nH+RAAFtb57DI3u6N14Kf54SC0ZrCZER3j
         Lf9b63mgDMOLtttNTCimRnBGBK2/GX7YYtkoieQF0PNY0pf7TUYUtu3tB7o9m46FTqvU
         PHfGqH2q/S4NXPiHEcfawhfi3WFDav5CC8L3t47ucSalMqRm1/PPMFa9ODEjqzSeYpco
         o/xUn9Jb/Vj4DkskCJNuYtn8K/o6kWUIgxvfw1OECBRtXl64vMD6SHU/W5Ltg2Rq7s1y
         wmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447651; x=1752052451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeL948pEBrM0oIl1f+aZCIR6Mgw1zy0Mr+qFmSzolc8=;
        b=A4nKngOJzQ8mTLqVf5JrSOsCsd6wOBjwQ8bwI2ZdS0/9br2XwNwuuqlmp2nnC2YXMM
         2a5qyCgOnVfo+MONXwYJfBV7f/QJoYQYcp9yrhvz2SPBmwZ7EK0yEMgfVeAqmRwggd9l
         C7g3A4YrZ67uNB8Ch3HBfkuFxcFT9ehXZX00C6nGx2/hZbLeyGpCrwMEwYed2wvGi7FV
         hkhs0Q5+p/hlByWtIEpxUk4Y9r/tRmNs1rPmhvlebv8epF7djQkVNIHO0biCvpKuvsd/
         CV53diM76zozFa/4qNljJwAs8l8LnNIzZIyvQmyduysOj6yseMdaLzXBPJAGUkL8r+Qt
         vAzg==
X-Gm-Message-State: AOJu0YyHQRtLGm0FWyCDQbTh/y1V2S5RRHwcm+fFk2PISpxt+85ssSv6
	XlEMP3GTPt6iMXQXOosDKs7ZfRpHWx98q8dufAw9qHFj2HBbr63ayQY8U3xos1gCDwY=
X-Gm-Gg: ASbGncvitRFP/m3FXFINadsLwz9K3zsECwUwYPDrdpV66WAF+Ub2Upzg3Kdula9WhQ1
	u8dRZG2ero05IUhwqqzvFxnOvHNcD+RH6Ng0+9tPiecbZVyWb+nyiTgTf7CDCti4toxfEU8W0vo
	spx79razZJgxklZTUJsiQHJaaM0B9CPtfhhLmswDEHRk1829UsGwTF6K3hLvy5dsmNjGAMMXfSU
	fOgdtScA9BjGz3DQ5iBWLjoyIXKNkjAOxMIUpMjYLmchnn4qHMfteOsNmq8fOGftCCgyCu4OAtz
	t7OL8OCdeCFvA4T+31ivwWm8sAjcsZFidCJteDsblvoqcAVmL16h3YKjpSK3jWXx
X-Google-Smtp-Source: AGHT+IF9qG6a/NsxMnQIVPPTepsmvFx1KpI71XHtS998Sg2pHfCt5jeNuVXluvHxs9EveU4oGvY4NQ==
X-Received: by 2002:a05:6000:2010:b0:3a3:6478:e08 with SMTP id ffacd0b85a97d-3b1f93550ddmr1557563f8f.23.1751447650851;
        Wed, 02 Jul 2025 02:14:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f8bsm16027213f8f.17.2025.07.02.02.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:14:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: use new GPIO line value setter callbacks
Date: Wed, 02 Jul 2025 11:14:01 +0200
Message-Id: <20250702-gpiochip-set-rv-gpio-round3-v1-0-0d23be74f71d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFn4ZGgC/x3MQQqAIBAAwK/Enlsww6i+Eh3M1tqLyloRRH9PO
 s5lHsgkTBnG6gGhizPHUNDUFbjdho2Q12LQShvV6Q63xNHtnDDTgXL9RolnWFs0/eIHMzhtlYc
 yJCHP979P8/t+syLfq20AAAA=
X-Change-ID: 20250626-gpiochip-set-rv-gpio-round3-58bf959c2a0f
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Robert Richter <rric@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sOHXpCVPzm/YZ8eTA3k3opAT2PwIqz3LxOM7hlnGd2U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPhfrB5jN1miCdxSaAbtD6Deiu66lCqZxBf/f
 1GxNm7l3hSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGT4XwAKCRARpy6gFHHX
 cl+MD/9PPdqRVBA6/Hn/VbSzDey+uQh7kYAOPnM8zK0b4dKV1xjIuJ7OX6GkMP/n5VHrNM/+g5h
 7aa/TlZyIZLoddPuXkEbiX4J3EZwFt8ERcEjr8GcyudkM2f5X0C6ELBRdTXdXCv0mTRebyysT4j
 uHocpFdhBfZhPWKKurizzAsu7IXiC+9XqvQAcgy3XyfQCH52x2cTLVbh4SoYRML8bNJsgsLfdfR
 h8cO3hRtimKAImdew5URtusgBjsMlUO1RtQYmQxshT80hLJzTrJnCgTtiSOjY24daJXJ8Zwb82+
 yXQgPWzbJT5FNVXOM4Hz1ZTV0aeeuM8DKmR7KJX2iQ9QEvqiN7hw3EYPH9QObeKHHhDkxT10VfC
 UC1Njtu7F2iHriDpuya14mroFTTIXzoGZmiP0e5YSAUPg9W9O3JDH0ZQ/rdHe5RoHYHgv97BvSn
 bQqFQkqRZ+K+5XcdANfrjKfTpCzNqmVt79kwt1eu2R9dN4T2mqhQcSNrSPhr1ks7gwWXRbwAgCh
 s1YjrQNwDDmi8RdBXxZeG6K69Tu/DjxneG9FZ54Q2qfPaOlwQCmDrzZNuDxobuBQ3siG4QEiDQ7
 FaektdzkG1y1jUGeLqBD3nsAMqy5ytUeisckSR60mbikkhNO6AQDoXhb9hPP4RTOt28ZixG1ZYi
 q9DO0A1TJp6u4Sw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts another round of GPIO drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: tegra186: don't call the set() callback directly
      gpio: tegra186: use new GPIO line value setter callbacks
      gpio: tegra: use new GPIO line value setter callbacks
      gpio: thunderx: use new GPIO line value setter callbacks
      gpio: timberdale: use new GPIO line value setter callbacks
      gpio: tpic2810: remove unneeded callbacks
      gpio: tpic2810: use new GPIO line value setter callbacks
      gpio: tps65086: use new GPIO line value setter callbacks
      gpio: tps65218: remove unneeded callbacks
      gpio: tps65218: use new GPIO line value setter callbacks
      gpio: tps65219: use new GPIO line value setter callbacks
      gpio: tps6586x: use new GPIO line value setter callbacks

 drivers/gpio/gpio-tegra.c      |  8 ++++---
 drivers/gpio/gpio-tegra186.c   | 49 +++++++++++++++++++++++-------------------
 drivers/gpio/gpio-thunderx.c   | 18 ++++++++++------
 drivers/gpio/gpio-timberdale.c |  7 +++---
 drivers/gpio/gpio-tpic2810.c   | 27 ++++++++++-------------
 drivers/gpio/gpio-tps65086.c   | 16 ++++++--------
 drivers/gpio/gpio-tps65218.c   | 31 +++++++++++---------------
 drivers/gpio/gpio-tps65219.c   |  9 ++++----
 drivers/gpio/gpio-tps6586x.c   | 15 +++++++------
 9 files changed, 89 insertions(+), 91 deletions(-)
---
base-commit: 3f804361f3b9af33e00b90ec9cb5afcc96831e60
change-id: 20250626-gpiochip-set-rv-gpio-round3-58bf959c2a0f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


