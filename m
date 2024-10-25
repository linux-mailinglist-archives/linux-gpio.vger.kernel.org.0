Return-Path: <linux-gpio+bounces-12090-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571DF9B0203
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 14:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC010B20F39
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Oct 2024 12:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5A520263B;
	Fri, 25 Oct 2024 12:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A0SVGpjs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A291D54E1
	for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729858754; cv=none; b=lt8DKUpvfzMB2C4l9hgbZzGbb4adGvEoT6UONOq87jgqrFvFs08JCBnSw4tuuHyMnv4lol2Qmw0w1bKY5gk6HNaaTog2ce1goZkfqQAZa5+Vf6QAB8bKvTwZ9bGv3uaJOkVVLtsccgXLvFK2xoHvY5JlxR5yPMg64/QGiFXcjKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729858754; c=relaxed/simple;
	bh=nz91uMlwelmLvyUdZupcDzzd6jF89//rChM3aBFRgow=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=im6zCWWGlnQBvSLCN5Iu2oQUb9Sdg+6RNVcAw+jZik1A6aFhXUCEImrxVYXwfCoH8ubAblixD+HA7jyDXJVL9irB3hCcJGvjmEUSTn+nMOJiHXdwOW0PEqxhNdtvDZxf0aWSAWxS0Wx64uNWzU3HwpNrAgX42zNkAhMiQgHOAJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A0SVGpjs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d8901cb98so2033647f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Oct 2024 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729858750; x=1730463550; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kEwyU0NHDA4shuC4jNu18h4540tRiSlz3ll070TqJl0=;
        b=A0SVGpjs8A+LVsTHJglpoUDIqIYv5Y/n2hAyaFJNaymJV8G4e3VZ51nwFgqtRq00qJ
         ywepWRxtGtN9vIg0d+ZraisssoPhKt7y4Y6FQMKv08pTDJIea6ImbYsGujbF+mOrqvHo
         eQbJJGi6PrSJA2VZ/en32dXyHfU0WNKyQ7VDwbrSx6r96Ht14DwYgaNr4LA/EIcZcN7l
         C5Rk2ipPv88KmJkNBSMIWirtjN4o6AZDyl+BrM3PPitu41HarGgNHhTcYrOPdViE8FWr
         44W7f5gblGidCprG/zFT+qdgCH03x4cscJZc3h2nIoeh8UucUUoZiiR2Cac8aptLDaW2
         OTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729858750; x=1730463550;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEwyU0NHDA4shuC4jNu18h4540tRiSlz3ll070TqJl0=;
        b=lPRLs5RPkB30oNYQ0mD+Tzh6EFlKSBBDMhUMapnHTqcbGBtreaUhCRONuRvAGzXemB
         zEyBIB228YfOkhUjVcL73+nPOQImF3Ln43uEhuF7O9oenp29AY0w77PLiVDZFI8L2F+6
         qsUtNDRX0L/e8NuW8rqAb1gmfbgEBNsSjs8ZD6z/ZXaZhL/JHc+gFfhZLXS7+taQdanr
         u6FswzZp86GspxU9JuN/dOS0pFu2T9spbuoy2J8QvMZRq3ScUdNkKEwHm2YCp+irHvXZ
         TIfFFL9QZ2vdEAZl8yVpiaz92ftUeb1TtrEtgQ6fUhScJL0rvYFuGvt9E4UXNhqv1R3c
         w75A==
X-Gm-Message-State: AOJu0Yz5evPHjb4Lda/M2B8vKfELp8ax5j0eQLf1zNDypfg0JEYnoLQ0
	1TeTSczLOWe8dx2RFPGfosf9LxhW3/IE/AZfERnevmjIfJFoGGd3usRueP6im9Q=
X-Google-Smtp-Source: AGHT+IHOG/oU8aZ3v34PFRS517NBa+kJtgc3co/M86iLkwsFH4Jrk6Te3WFmFniFu+hXfiDhSEPnlw==
X-Received: by 2002:adf:ec8f:0:b0:374:cd3c:db6d with SMTP id ffacd0b85a97d-3803abc51c6mr4227549f8f.6.1729858749887;
        Fri, 25 Oct 2024 05:19:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a207:5d17:c81:613b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b132ecsm1388966f8f.5.2024.10.25.05.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 05:19:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/5] gpio: sysfs: send character device notifications
 for sysfs class events
Date: Fri, 25 Oct 2024 14:18:50 +0200
Message-Id: <20241025-gpio-notify-sysfs-v2-0-5bd1b1b0b3e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqMG2cC/22NQQqDMBBFryKz7hQTLWpX3qO4sDqJAyWRjIQG8
 e5Nhe66fA/++zsIBSaBe7FDoMjC3mXQlwKmZXSWkOfMoEtdq1JrtCt7dH5jk1CSGMHqOc+mo2k
 aOwN5twYy/D6bjyHzwrL5kM6LqL72V6v/1KLCErtWGd00FTXtrX+xG4O/+mBhOI7jAzvvvFCzA
 AAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nz91uMlwelmLvyUdZupcDzzd6jF89//rChM3aBFRgow=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnG4y7W3kYgCqp/zfRmqng7e8p5oM+7Al/paFie
 2lXP+QbGASJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZxuMuwAKCRARpy6gFHHX
 clqeEACW6y1e9jztIRiH7qsMh7CBfjJ5iBOshxNlv1tzowG24DbRmxA0i3j9VpggvTTMfN0L7uJ
 W1IizDs8OknKy9o9w5LjQ6CaEBTJrGbzywAvOtzQbcpSnXD2s4/Qew3bpmJz0G2+9XmmD0MA4T1
 c+msunKOzWo6xMWB4xZ+aIAHA40h9psGETze1BWKBgzbLO2XdHcC3MhZluOsL65e5n2n6xaPf1/
 Au4QU8neZBTdCSCj+FgXww1Oq/CJewYVOVH1ol9PcNAPaS06dDCJVqyxdimtBAYPXoqUiRA2zm/
 x5JGrZyx7EJbEABgXB+hxY8A/2D2fG9deQ4PRiIOkLx/xPSvuv06fjWAlDm3jyjjiVkxzR06wi+
 2iNTc5U8vUYx1nnSzNluBrOiad4FTlczG082g8n2C89NuMDwyuuuzMcYLMegcZNmlRB0Q8OECS/
 ObPhzyz4oqH+bdRfZjFpx8+wYtCCJjVhr/oAP2XPsvqPfYFZ3x1s43mBpjh9fRp5PJXaxVS0bcJ
 GSpHSJ1rTJvapi06s4JQIypJ0W1Tmtc2lzIImyqJPa1qJa8tU4nNTcifS3EsXOHLnKrxmY8yQmr
 lK7QtVykSEfjOjfoKQBXPdKy2ooZPlwH/GFDVQm0YacWZ0i8CNLob2Dsk80F0DXJCRlfQL266qM
 KzRVMLn+GsCq1Eg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This may be a total corner-case but for consistency and completeness I
think it makes sense to also send out line state change events on actions
triggered from the GPIO sysfs class.

The first two patches use cleanup helpers in sysfs code. The next three
change the code to emit notifications on line export (unexport is
already handled) and active_low & edge changes.

One last thing I considered was also notifying user-space whenever
gpiochip_un/lock_as_irq() is called but that doesn't make much sense as
it's largely independent from the GPIO core and can be called for both
requested and available lines whenever someone requests an interrupt
from a GPIO controller.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Streamline the code even more by dropping unnecessary return code
  assignments
- use normal guards where scoped ones are overkill
- Link to v1: https://lore.kernel.org/r/20241024-gpio-notify-sysfs-v1-0-981f2773e785@linaro.org

---
Bartosz Golaszewski (5):
      gpio: sysfs: use cleanup guards for gpiod_data::mutex
      gpio: sysfs: use cleanup guards for the sysfs_lock mutex
      gpio: sysfs: emit chardev line-state events on GPIO export
      gpio: sysfs: emit chardev line-state events on active-low changes
      gpio: sysfs: emit chardev line-state events on edge store

 drivers/gpio/gpiolib-sysfs.c | 169 +++++++++++++++++++------------------------
 1 file changed, 75 insertions(+), 94 deletions(-)
---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20241022-gpio-notify-sysfs-3bddf9ecca9f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


