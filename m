Return-Path: <linux-gpio+bounces-22001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB460AE392B
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 11:00:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CB0E3A86FD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 08:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5857A22F164;
	Mon, 23 Jun 2025 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X45eTobj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB46918BB8E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669216; cv=none; b=BRXyfc6TA+BMJ9hdDsJfU0ojUWgC3t7Tg4sNqaLmE2C9lMR7sgz/fHz0Nybroclx5vKm3uoy0AW2tGkxCknZ+wmE52s+RcGg32SdEu+DUmMkjCtBVCW1sJRvnZ+7V4ItPs+u9gomOcymrnv+LtlxTVwILadqDNkWUTlNv9KFksI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669216; c=relaxed/simple;
	bh=PEtrpJyk2tJugANxAUAno7Oj6IdzWNFshfWAu6X+rqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jzNS/VcBLzdI+DsqwuMEyUin18E5ekB0hLDqPkl27oZSYSUJVTKDeMBTeLQJkuA3ONQcBpLRt3em+HBS33lYnU7xwcUj/ycIk7XMgNs2lKpbS+OJZWYlOsKsIxtKUtwZVt0PNxaqBkNnbnG79h9I9/SwO383cYqwF3y8fNnoV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X45eTobj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so45405945e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750669212; x=1751274012; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2PaVeuIE6/nU1euuM8az2QRKrowsNX+FdQxCxX9pZuo=;
        b=X45eTobjJvc4Ow6BuvvFiaesoNSEN2M1TmirGXnD9iWxiC2BBDCgIjbJ5LR+rSwRCn
         pradw8K4lz7cdh8VNEvNfSPtCP6zUMkGTJNoEqOAIKerQHpoEiLN60no/Cq1ETJZEXim
         3KwRsJoIRc4Z20jFCIED9kuOD3LK76EXtMUKJy3vOMLc8pINkbnZefD6QKbdcdmjkx6U
         rl4brS1YQE2nuQ/ZS2ol6Dq9sZpwbWJNjlVtiil3o9iW2PXyJwZDgmFQkGgDOwRs49FY
         UmXjhOmrhkBe8KdmlgfpxigRbWsezG5CIq7IyDxyLehYNrFHLiH+sQSAkGfZxfCB4qB3
         BFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669212; x=1751274012;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PaVeuIE6/nU1euuM8az2QRKrowsNX+FdQxCxX9pZuo=;
        b=fHcWZQKpwHuvm0MAH43qm4vSmE9XWtfqCGKIKsxyqJVcVJVzTYxq6fN3MrmGy2qgAl
         WofNpLXzLCNXlukLIwiNJpm58l9gKFfATsYbVpwQ5UN8SFIsoydARPqt8s4bJ9kpr/8g
         SwuTSfY2qpaTw0SqJR1JoGPIQxCaWrGAQWq+lUNDei+Fw1MVd30Yh3vIQPKghcTmap+A
         sBPUupB9rCzUE4kEp+u8EuO9nj5ZXJW534YTa3So8nWnt6iMgqgTJfs3K3j2KHtz/p6t
         n5WIgN8nfGpEgPdrSUa6scB9XfB6bCZZT2oP+C9jc+MS0jKnVi+w6PXYs+nYz1s62yfL
         Ww+A==
X-Gm-Message-State: AOJu0YybW35mkZN5fGtNKD96DHQkFYiYWOKVLTzbTHnBtnDV8zF5bxgg
	w1nRoIAWqYbJhB4fqsnRpKMtG9ld/iayuBF6zDy7Z+XOklp/7aT+wFqvCcm7KS4HndY=
X-Gm-Gg: ASbGncsVA/rl8o9V1e4fu11qkOBjgtb4CBgQrZglqRetMCfif4edy/KcST7+mcqGGMS
	gj8Lxtlzgt6FTzX41KvhsfZHnVWr/rDiOsVQLVYY1Jl6Z/0ryoQshqI4tIKIloRY05S6PvCOEe6
	id+MBUuTtwMPyd82u+11qL/KZEyc8xYHNbxdSXUGevgq2RRfbvBwK1fcwdIinKiYnAUv5TwZqRF
	ewuACDkHnIJsICaxCGFUAzqBvomrVaYD1L1G4bpmIpl+m/mGSk8ThGGHIdZ+j6nEklDOKzjGPlW
	F2qY4d6id1qKaDAQNmopdf9MdXqHDtKILGKPqWX76pVyHCTKscNF9Mc=
X-Google-Smtp-Source: AGHT+IFyk8NXpVWAEKJ3i/rWK2iybXUinm6tRd7auSe+1l/7Qc5NIxUueAlwMxTqjOFysPjIDb1TZQ==
X-Received: by 2002:a05:600c:a08b:b0:453:8f6:6383 with SMTP id 5b1f17b1804b1-453698fea31mr95573685e9.15.1750669211988;
        Mon, 23 Jun 2025 02:00:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:5ce:238e:62a6:cbbc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm113401145e9.1.2025.06.23.02.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 02:00:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/9] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Date: Mon, 23 Jun 2025 10:59:48 +0200
Message-Id: <20250623-gpio-sysfs-chip-export-v2-0-d592793f8964@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIUXWWgC/3WNywqDMBBFf0Vm3SlJiA+66n+Ii5hGHSgmzIgo4
 r83tesuz4F77gESmILAoziAw0pCcc5gbgX4yc1jQHplBqNMqawyOCaKKLsMgn6ihGFLkRdsrPP
 W2L7SvoQ8ThwG2q5w22WeSJbI+/Wz6q/9JSut/iVXjQpd42vnrK2bXj/fNDuO98gjdOd5fgAc/
 DrDvQAAAA==
X-Change-ID: 20250402-gpio-sysfs-chip-export-84ac424b61c5
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Kent Gibson <warthog618@gmail.com>, 
 =?utf-8?q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
 Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3019;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PEtrpJyk2tJugANxAUAno7Oj6IdzWNFshfWAu6X+rqk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWReYKHcxNBYhkpX+F4I9LJ5ZjsTLXW5R9l4GD
 fCCJoqoiH2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFkXmAAKCRARpy6gFHHX
 ciQ1EACkHmxujKWI4paF10YrFeIS7HIizU8c/DT3BlHhGJjxPRvPGZhjwBf/EI5tyfQ3XUQs3cw
 Ul8NkAYIUf/U1CH0gPlnWyE/Z1qsS8tNbv/0kRoJtJmTNk+PhJ9pLJZR+jpLOCsD7YZe9gOLQ2w
 SlnPieh0RqVEEpeGkOvoGqMO++q29PL2H+RSfNHGFYMf9Oq5X2UF1FX/FNg2rYYYfsqFeJ+X5+J
 N48ZRVNSFwEhi5PLuSrS2zGvPMXY3piYLf7yeWrlKMt/XaEDYotjvnWFu9wYsfRbLJeFhU4sKAC
 8J9cNVkCpr5N+AoizMw9G9LzhCOLjd3L7T6tu2TnTC/l+uBPpJOmOFfp2M17gmEts7r46NKAKQ1
 akKkZGbR65qbWdpu6rh+AnAjJcMFCJ64LPF5fM97i7E6lU8ci24u9zDmZ9oHdkaMcLIr7A71D5i
 EbZjz3hHkp+sHNoLAh4zab/6eAUGXUilbE60aausbAfwq1dCjr6MZmPEKh6lxnHc45Tm3YGs8SP
 h3n1B4iFteVk1fvps5nYAfqfuJA/RhxiwJcfiOUE1WuaQ+yQEEemoPCfodc61Wt1mjLvR4djvWa
 HUNaVhUQuMDJm5aUBYV1sISbB3KQze/NfZppl+Sc9s2ReBcYadsdIYbgSO8FWugZvynGlVC7n/4
 xvw2Lj5C5zwV9cQ==
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
Changes in v2:
- add missing call to sysfs_remove_groups() in gpiod_unexport()
- pick up review tags
- drop patches that were already applied
- add missing documentation for the chip-local line attributes
- correct the statement about chip's label uniqueness in docs
- Link to v1: https://lore.kernel.org/r/20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org

---
Bartosz Golaszewski (9):
      gpio: sysfs: add a parallel class device for each GPIO chip using device IDs
      gpio: sysfs: only get the dirent reference for the value attr once
      gpio: sysfs: pass gpiod_data directly to internal GPIO sysfs functions
      gpio: sysfs: don't use driver data in sysfs callbacks for line attributes
      gpio: sysfs: rename the data variable in gpiod_(un)export()
      gpio: sysfs: don't look up exported lines as class devices
      gpio: sysfs: export the GPIO directory locally in the gpiochip<id> directory
      gpio: sysfs: allow disabling the legacy parts of the GPIO sysfs interface
      gpio: TODO: remove the task for the sysfs rework

 Documentation/ABI/obsolete/sysfs-gpio |  12 +-
 drivers/gpio/Kconfig                  |   8 +
 drivers/gpio/TODO                     |  13 -
 drivers/gpio/gpiolib-sysfs.c          | 502 +++++++++++++++++++++++++---------
 4 files changed, 388 insertions(+), 147 deletions(-)
---
base-commit: cb908f3699fb137e28017a8fdf506c35762b3eb6
change-id: 20250402-gpio-sysfs-chip-export-84ac424b61c5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


