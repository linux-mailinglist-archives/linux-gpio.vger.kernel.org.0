Return-Path: <linux-gpio+bounces-21229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6283AAD3B47
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 16:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14A5918853AF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41FF1C862C;
	Tue, 10 Jun 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jkB6H1hg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8882C246BA4
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749566311; cv=none; b=b9wJ0N8QL4BvX2mHjNpqWaf335MTumYsaxElaukpkrxr0551ALUxE8SCmn6J86l/n1mFJhPfocLCudvrnfGPDuYxnfRwOE7tr7M9r+u897/6NMBKqxeLep5mMBP14L1j+m8rYKHrR97sdHntBQtghhqm3zLS6XEwqmcHJ0TSctk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749566311; c=relaxed/simple;
	bh=fSqP1U5xKEwZpSwfGOoZKCFUfs8tmc5lVOmTzyctq4c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mxrcBxoFVu9xlVt/lULNgRrnZ5iTKrTyLzzV/ApJWcS30V8wfVQWhYWCbyz5F+vN1UEq4xk+SrYbunjsqC7aRZXERpmtzl7jtIpRLEjfLTSpvve/gxh8oqkx5Kb+kYKvqJh1jzVzx/23pwAfTcuFxSWDx9N3wfUgmvNQod2XR+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jkB6H1hg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so49506815e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749566308; x=1750171108; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=atd0sW9JwEXgjuqO719QopCgkM8o3sqPdQABZ5DtIno=;
        b=jkB6H1hgTr2bwFirrq81KF2zCA+2NCeWi2oMZWXGoFdZFFIj5UIHARrTEyJTnR5KnL
         xnaCeWPfU9l8dQWWAgJ+kuF8BXQ63zR2R0hmE8oKD48KLtbWHE60hcYokK6EzxCnpqsC
         5QHpQkiigejXwRLRV60utMYzSJkSnm8jM9u2fq2wJn774togQapHSP6rQXKCXeX8J70o
         mK4m+luNkihOS2ioLc5DwfkUUmPaYcwWozxpYZIEtBMEI5kmNg2QUjzaqGWOzBHsOlyc
         3AwQ9KlLobr4BHICy9wogrFIrhiSvvptsfgE0tsbnLdXimKpUVDgEl6+9r9OYC6KL7Sk
         7HTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749566308; x=1750171108;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atd0sW9JwEXgjuqO719QopCgkM8o3sqPdQABZ5DtIno=;
        b=KhP/cJyYOHZxIuymLowatNs/3By5YBOgcaMTon6wZjuSWYlu5V6YsFItJpLGZPWx3+
         vlUspdDA5N9VSuqaie/hAzwkJuOwT9nIL7NRIjCz342OJ93VTO0h/L8ssaycv5qEltfa
         tGymcgGDHLlkcp6CdinQdnT2A5gx3zZ10azhEBOb90EKoKqHt+eCUoQ6y1zt9qN/Jfca
         X1eoLlcs4UJX+J7dqZomiyRk0Bb1iPY48ghXF91Es+hVUYCadn2do1POzecVEd4sHyPD
         EibVO//uiYhk+VhZf+mjKLficmh+ObTogDjUzWNeNxdwUA7qsE9SSSL7T/qcyAx1sLC+
         RwaQ==
X-Gm-Message-State: AOJu0YxRfDhUzpPWqMIuarOo+Q3mBa/+JEGs8UmSoJcHADjT9NwUa0hO
	AJ4zenakSwLvVuxQlEzcZfLjWrbJip3WjCcvf/aAEABxA2BUDWFECmOrjk+G+wNCIY8=
X-Gm-Gg: ASbGnct/0OmT68b84IVJRrNTQ1VgEoI8ht1aDTXGMW8mInAZtN2DmhHcXFwO/xw5PF1
	CEvayn63LYOa49if+5P+zMJ6zvvqRgAVC4BHz9QTOD5lDvmSaXtiGVL1AXMUXiWYvoi3yAEQfkZ
	YcwSUpID67FQj6Wbd3GuZiGTLBOD+VLk9pOSJ9y6KDEYhz0I+pyFPUOEKNj1r3Ns4cNQ0r9nf72
	xa/fak5yxOB8LNlDGi9TCYQm7SRV2imHGi9KvRc82vBL9ZQcmizEdi0+xLHiPJzaWgxMkvSgyZ6
	371ohDf2Pn+HqEaGQc25MA52t74d6IPLjOli0r7u29RZUVR6oei4
X-Google-Smtp-Source: AGHT+IFZwAjEnKqbJ7I8rSI4L7e9kn9myOrFcZc3I8nQcXlL0Jl3hD3NdGyDY2VQOOkgknOFvEGGLg==
X-Received: by 2002:a05:600c:c4b7:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4520137c932mr146548425e9.19.1749566307662;
        Tue, 10 Jun 2025 07:38:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e056138sm146001345e9.5.2025.06.10.07.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:38:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH RFC/RFT 00/15] gpio: sysfs: add a per-chip export/unexport
 attribute pair
Date: Tue, 10 Jun 2025 16:38:15 +0200
Message-Id: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdDSGgC/x3MMQqEMBBA0avI1A7GEEVsBQ8gdmKhcdRpTMgsi
 yLe3WD5iv9vEApMAnVyQ6A/C7sjIk8TsPt0bIS8RINWulBGadw8O5RLVkG7s0c6vQs/rMxkjTZ
 zmdsCYuwDrXx+4wG6tsm6tofxeV51DMc3cQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3170;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fSqP1U5xKEwZpSwfGOoZKCFUfs8tmc5lVOmTzyctq4c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSENcHRiP0vMDjOOVxs5KmsCt4BrHjx7GYCCle
 pH021MyUZmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEhDXAAKCRARpy6gFHHX
 cjshD/9pRCq2Ly5ob5tlZU19gE7UUfgUbYlCethx6bgeLpZKLSXBJ6/Xerr3GN8+1pMb/9a0lEw
 FL9a/NbOtIA6QDwojYOxoIkXNYADxVKTaS35cqKAF22gtozgQ3Ph0eJECuDnwcAvp3Gf/qdqVUO
 ePAjnsOdJpAv0hKUAaEUud7+YwfMuv0lKypxBApwy58loHyxvVgIsfXDrBzJHwHOhCTUg1pCHb4
 3BUq1/5kxuLsNY0kCpd10h16QU5/G1qrLL7xtRrht7LiACpUbCVKdSXhnTwv10APpvJ7gbndH3U
 Ny+gM7ciGhqDPAWT/qMqurFJFF1zvp5hAwKiLSP9bxhE6Rhiv5oKFEPb7fOWH5JLoKBjqnkcfor
 ezz2iga9ZetQ/ZhgUXQS02de6YNv0xV/WydNyFwrVqQNK1P//76H9cLA//AFX7DhRv1/naeBNBq
 t+mO/7UHqmJHAJR1zlFOwmlGJxfFqM9kCvU546lonamqJJRZADCVf1kQ4GtsSzVoSraOHxQ4/pm
 i1gCQZk/IVeGk7F0imT275OEbPQCCr5mgezqGzt+GHx4NjLZ/+Wmvcf9Cl0b3GX0NSdgOcCiN8a
 DreejKcTbSQDoehxHO5iX+u5Fa1u+vFUBVX+gxk5dgFoCadhqBRb0hqlqzCqrpHqNV7wi4ndMir
 mL1BnMYGzSJUUdQ==
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

First, there are some documentation updates, followed by a set of
updates to the sysfs code that's useful even without the new
functionality. Then the actual implementation of a parallel GPIO chip
entry not containing the base GPIO number in the name and the
corresponding sysfs attribute group for each exported line that lives
under the new chip class device. Finally: also allow to compile out the
legacy parts leaving only the new elements of the sysfs ABI.

This series passes the compatibility tests I wrote while working on the
user-space compatibility layer for sysfs[2].

[1] https://lore.kernel.org/all/CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com/
[2] https://github.com/brgl/gpio-sysfs-compat-tests

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (15):
      Documentation: gpio: undocument removed behavior
      Documentation: gpio: document the active_low field in the sysfs ABI
      gpio: sysfs: call mutex_destroy() in gpiod_unexport()
      gpio: sysfs: refactor the coding style
      gpio: sysfs: remove unneeded headers
      gpio: sysfs: remove the mockdev pointer from struct gpio_device
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
 drivers/gpio/gpiolib-sysfs.c          | 650 ++++++++++++++++++++++++----------
 drivers/gpio/gpiolib.h                |   3 -
 5 files changed, 474 insertions(+), 212 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250402-gpio-sysfs-chip-export-84ac424b61c5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


