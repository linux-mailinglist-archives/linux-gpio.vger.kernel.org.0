Return-Path: <linux-gpio+bounces-22424-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E052AAEDD09
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 14:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDABA3B8B19
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 12:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0023D28A3E0;
	Mon, 30 Jun 2025 12:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zu/n/Jn4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CD7289824
	for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751287043; cv=none; b=YMUsSqDaMktNtnXs/ScdU8M9oH+1SzmdZegeSd/H1LIWmSp7FqpTHo2TaivvkceqsQLaubTY8itww7MIVgtDHfAJF6TLXH5C7ULWTevh4gB/AZ1jA+ifPajJFzV75lJ/6XjKjB8i27ELs5DJT0KHG43zSjSgqTKSyLO0K2zieRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751287043; c=relaxed/simple;
	bh=AKIJf37M2i9PR0paS5BzB3mdTQvZ0TMNTCGVPS2nux4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jKgI1ke9ZCa3GiyMJPfZLrHSKGqNbVkWVWBKO99i2dvtedQ8T2Ol3fx7m8VJGuGlYQoUG/7pVCMPOOpdYgleXDTjkCZYZuig1pnwrOzqUgeG/pGQu8T4aFduudO+R7uSYxLxXoZGh1R+9VGczYaBVIXxZPheTEywUHUdaNeeHTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zu/n/Jn4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453426170b6so28532875e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 30 Jun 2025 05:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751287040; x=1751891840; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NjAepWhIoshBZljiXoUq5zncmciYmRsIZFAnF+PBqbg=;
        b=Zu/n/Jn4EUPYppUQh43Ns+A5jSPuHgtEqDhKDreUqDHr+xv96tJD9uUdwVOqunO/JQ
         7lqQ4gOwXGBX4F6kd86pbzazhBIIaWoRH9lgl9MgPcwQOaEWTx2KrIzUv/UBNhGYA9To
         /9M208493+/8dGqXOcAH6Cqcvti/28A8PrrcSBLO67Xyt/JJLu7EgfoUT0ufwQOM5HQH
         eFtgwzKeHki+VCQ43XF1Hw3qTo/9dl6KOeIOt3iG3vI5mxdd0ImUuIIjmMSgf6u+IHs+
         9yW+oYPWsBdvg3tYVIzaMzE13jakMMaHjBiQ+vAR4obp0zt2cnSbkizRQARpzQUNB6JE
         NwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751287040; x=1751891840;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjAepWhIoshBZljiXoUq5zncmciYmRsIZFAnF+PBqbg=;
        b=NJHurxcoNQb6jEC7aHJuP5mgwE0IgxxV0T7QsAO/hOrTJhIaJwB4on4CMviIfUqGHj
         aBMfIccB8/fpZokqTqq+26zAvKHZ5P6Fp7YR5uCTHoKxUhA3pbDIO8N2OxQgKeG1CRJT
         Cd6Qu1SMtAAlFiic/9XuRHwLon+euOEo67MvoS+qwdJcl1WJtat2up1vC6dis2t3UFYw
         DEKfBmVvcseW1VVDwSgjYomL5hboOJ/N27UN/Oo/JFJODkMFqA7bOFoV24Y5czaJj7Wl
         coGDdJ3GXYDytNBVXJol1uRKq/vl31xUWmExt7TRjxxPQAbiWDbIQon1Ae2CWhddFh/O
         u7Pg==
X-Gm-Message-State: AOJu0YyATMoTiJXE1Z0zr7YRR8kbwDZR0pK8pSbKK1OXZWv5GZ8PdMfL
	5nsqGHJVxL3i/3ICdzWse2Ua8sBvbR7WHb6yv+hK6Ax8ECixVCPBQGoz1igXbqVv3CY=
X-Gm-Gg: ASbGnctwSYQeYyP+sG61ESWKRtHJ2rS7AxF/D0AiXMBKzTw0BmS3Z0ACZXlJH2/BydG
	WoSTjNullopZFXbA446fvDZTbk1RxWOUpfLWXZWGPEg4YgjEAW3h0LuY97RglUK2v8Rbl06BH2k
	UIGqYvmclpmD5P7bHBcsooyp/ZuWd+qfGlgdbzzWMgD+tebroGR3w1o6lVuHsJVJgaxEtmo+Agz
	SNegGF2BsAgllJWxY2DK5Uei1sAjgENlMGm4VEz5J04tHzNJBOisBT09AJ6IYIA1F3cVefWnAav
	w/VWpfxVr2YE95ARnlz5HpXQf5xy+c44H1kQzqkW+EkDl2lYm3SoB25xWeIxt8GogQ4=
X-Google-Smtp-Source: AGHT+IFTmqpWy2VPA+7nkUe73/aDRynUqT8zFHN+/JrK825X4C05MsCvAJqQh2gNnsO29Yi2GPUs3g==
X-Received: by 2002:a5d:64e5:0:b0:3a5:7991:fd3 with SMTP id ffacd0b85a97d-3a9802974e2mr10959916f8f.11.1751287040157;
        Mon, 30 Jun 2025 05:37:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa2a7sm10238192f8f.21.2025.06.30.05.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:37:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 00/10] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Date: Mon, 30 Jun 2025 14:37:07 +0200
Message-Id: <20250630-gpio-sysfs-chip-export-v3-0-b997be9b7137@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPOEYmgC/3XNTQ6DIBCG4as0rDsNjPjXVe/RdIGIOkkjBAzRG
 O9etJt24fL9knlmZcF4MoHdLyvzJlIgO6bIrhemBzX2BqhNzZBjziVH6B1ZCEvoAuiBHJjZWT9
 BJZWWKJtC6JylY+dNR/MBP1+pBwqT9cvxJ4p9/ZKF4GdkFMBBVbpUSsqyasTjTaPy9mZ9z3Yz4
 o+D2amDyWnzGss666q6kH/Otm0f25waqAUBAAA=
X-Change-ID: 20250402-gpio-sysfs-chip-export-84ac424b61c5
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3794;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=AKIJf37M2i9PR0paS5BzB3mdTQvZ0TMNTCGVPS2nux4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoYoT8q7662x2y39B/z44tAXpd9Vz0xt/wIP6B9
 a7SPpwTH/SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGKE/AAKCRARpy6gFHHX
 cgMMEADiJpAdxB+rt7rEmWmfVysmca/zsB8advTqt65+6xV3alF+fSYJ0e87l9VdtokswJOtj3j
 wUilUJ4spG55L1wLx2237peOH8hMMD1i2fHA35miDaWgVisM+DcbiQF5mfApmMaDayznF+ucflf
 tsr0+6l5l4Z2EBhF1j6WnzbaubkgzC4n8jcHurXmIxnzrg0PLGmW8VMpWBU41VqWS5xpvQWISsQ
 JyRo4NgUUBCLv74vfFPCItHcKn7xrI0qjLcmBnldk81SyfCSR5bGla9yRJUUm7ce84PR7vhcyj6
 bdfzBl7W6JXIf50IEd01N+PqPvAvWPZssSC5E/1R+u7x6GbB2dWmYxA9Mgf+MGDr0mPFAdu1fJA
 G5SnL6KZgpO/F1yC11A/bM5Bx3K2ZmM0/vMPqtahO+tiB5sUk8mccNftrLYlek/sOAOVwKP1tFo
 qoVHr3+/xgGB6USvESmPeZcDgPZtjBsdBTT4CQHELbV/LZEzdqOL7xs04ajo51bMr/kV35QjUCa
 VHec4VY2EpZxOG4L48pZBQsV4/wxz5xyGFQPZ3VUURf8D++XpjOdJFgx4+m67ffRKLBMbTdOlvk
 XusQjgjdj14xa8gIVECm9+s1H/cQpWJzCKxXhhMv4Gg0RTBxb7YK21dXeTTYueeQBKEqNi3CnbO
 bCMucD2WIJwLRDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Following our discussion[1], here's a proposal for extending the sysfs
interface with attributes not referring to GPIO lines by their global
numbers in a backward compatible way.

Long story short: there is now a new class device for each GPIO chip.
It's called chipX where X is the ID of the device as per the driver
model and it lives next to the old gpiochipABC where ABC is the GPIO
base. Each new chip class device has a pair of export/unexport
attributes which work similarly to the global ones under /sys/class/gpio
but take hardware offsets within the chip as input, instead of the
global numbers. Finally, each exported line appears at the same time as
the global /sys/class/gpio/gpioABC as well as per-chip
/sys/class/gpio/chipX/gpioY sysfs group.

The series contains the implementation of a parallel GPIO chip entry not
containing the base GPIO number in the name and the corresponding sysfs
attribute group for each exported line that lives under the new chip
class device as well as a way to allow to compile out the legacy parts
leaving only the new elements of the sysfs ABI.

This series passes the compatibility tests I wrote while working on the
user-space compatibility layer for sysfs[2].

[1] https://lore.kernel.org/all/CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com/
[2] https://github.com/brgl/gpio-sysfs-compat-tests

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v3:
- wrap a local variable in #ifdef's as it's only used if legacy sysfs
  ABI is enabled (Geert)
- fix an issue with jumping over a variable annotated with __free()
- use gpiod_is_equal() where applicable
- fix a use-after-free issue
- remove trailing commas from NULL array terminators
- improve commit messages
- change patch order for smaller diffstats and better readability
- put struct list_head at the beginning of structures for better
  performance
- reshuffle the contents of struct gpiodev_data: put all legacy fields
  at the end
- don't break lines too eagerly
- Link to v2: https://lore.kernel.org/r/20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org

Changes in v2:
- add missing call to sysfs_remove_groups() in gpiod_unexport()
- pick up review tags
- drop patches that were already applied
- add missing documentation for the chip-local line attributes
- correct the statement about chip's label uniqueness in docs
- Link to v1: https://lore.kernel.org/r/20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org

---
Bartosz Golaszewski (10):
      gpio: sysfs: use gpiod_is_equal() to compare GPIO descriptors
      gpio: sysfs: add a parallel class device for each GPIO chip using device IDs
      gpio: sysfs: only get the dirent reference for the value attr once
      gpio: sysfs: pass gpiod_data directly to internal GPIO sysfs functions
      gpio: sysfs: rename the data variable in gpiod_(un)export()
      gpio: sysfs: don't use driver data in sysfs callbacks for line attributes
      gpio: sysfs: don't look up exported lines as class devices
      gpio: sysfs: export the GPIO directory locally in the gpiochip<id> directory
      gpio: sysfs: allow disabling the legacy parts of the GPIO sysfs interface
      gpio: TODO: remove the task for the sysfs rework

 Documentation/ABI/obsolete/sysfs-gpio |  12 +-
 drivers/gpio/Kconfig                  |   8 +
 drivers/gpio/TODO                     |  13 -
 drivers/gpio/gpiolib-sysfs.c          | 504 +++++++++++++++++++++++++---------
 4 files changed, 389 insertions(+), 148 deletions(-)
---
base-commit: 26981e8906bb5c902e2d34874f64ecfa975d28c8
change-id: 20250402-gpio-sysfs-chip-export-84ac424b61c5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


