Return-Path: <linux-gpio+bounces-15831-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7376DA322B0
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 10:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB6D8166967
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 09:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EF6207E12;
	Wed, 12 Feb 2025 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f8XvIlzS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62791E282D
	for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739353564; cv=none; b=RKWmWH8DNIgPWzJy21lyiMji1KrGpV+fXep3Aty2kFFZKTQfnubVucub6txfHmt24TUuShSCx1Sk/WCi+aNzlQMOt+a+gqPLa96yR19P8VXrTawBu1ZNEZlluWE1A5vEt60OFLl09JyzZHlDBQETjKPuH+QDebljlMXG/KI4Qrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739353564; c=relaxed/simple;
	bh=1plww5LSeApsiHW+Lk50lqZF27WN3poyYwcPpo1ejyY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QN3BTZJzzXTs5aee2hA7c8sxV0Vptc3A1MZORHk5ETIJK8mzgroOt9zdK+SD6kFJgls0H+T6tQWRXnj2aHx+svSJXcpAp99Z1wkjqFIE3UTRR5lSL8Ql8mIEbmWnaH5G5B2yjlWPsDWUvYT2Gcl/1zYnUtRhm6xc+b46/ygPwNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f8XvIlzS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso3346583f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2025 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739353561; x=1739958361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zuOOH+cqbW5sfzyGH9UF9miBvxPH8Nl8TrZbDwlVwE=;
        b=f8XvIlzSqlNwV37zfu9VVoyFvwkNSd30CNr796GaOfiSzvXgRoHTy0Vuz/PfJ6oYR0
         QyYknjoFGQiqkwECId/aVTjIVDakLdrTHSKbeMUkUr4jpG4TqyIZ83cQ0MBg8MV73tqH
         hIU+eX+s4vueddkrU6+t6QnMFPMIDMIOgAZCqx1qd4kRs/wBaLoEXZYEPVRI3hZHOLIS
         M8UWS5QysJ+yAWqqxY0wZ9bPRJUZBp4/Ju7l/XuRzelIF9miKiKjx6mDR8gjd892cdHm
         WBq3XPd4uln11qSwaveFpWGWLDnYbAPC3VlKqZUhVcSN9gKV5dMUIpf92tJMaS/VMX/n
         WK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739353561; x=1739958361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zuOOH+cqbW5sfzyGH9UF9miBvxPH8Nl8TrZbDwlVwE=;
        b=uIn8hQrtg87iUwrLdNiFNDPS0SEuRw53y81BdCeivXgtnVoWHHUWcspNx3SK2+LwLb
         h+EV5jeaBxhDZ7xAtE/MEkEumzZ967p8viyDiA/eKAAwdJk3JfLurNKD13qTSJ8gCorA
         6HU4WDet3yGH/tKr96plPCaFoPS/B/bsQl8Ndl+2bfXqnkfCXXT5/oRtB8bMqw5Tc6s1
         SbJHwE0J+nuVQ/dE43vaVOO6GUTsklqbzAV4Ui3E1ROgt4XLgZRprGS0rQe3RErt/xuP
         kKRJEN1lcI4tsEukH+K7vlKsHhJmvjIrZjO7xMRdzR7SHzCTtlgI7tFv+hrOa7jhl9Zv
         /U1g==
X-Forwarded-Encrypted: i=1; AJvYcCUbfVPgTBshYIyCtdrtCisHuv+YPTQPMhebe473+LDa6ZYPwnzvrAM6WBQE5mBOsJUkpci9VP35JTUU@vger.kernel.org
X-Gm-Message-State: AOJu0YyhVh4sxpiUbGZMemTDMIkjQUey8bHQCoeGxpp7rdN/vo6rFtrI
	VCVBwJF5wcwc5NHs1gpCy9vswywrjJFpAlxfmqbz/mWD1i9pLmQKnj9QkoU3swc=
X-Gm-Gg: ASbGncvbD0Bh8DyOGMOaNGyO2Yh+a4tYVwLzlPff9jXmmGhQjQx5RtqH8jxocWYjGed
	nIvymt3Cu3NEpHSxmTnxbTxk+/tQ9yS6amqrnkxpjRyZf0LkZF0ieolsS4L7k/KS6Sju6E5gq/U
	lPe+ONPTNp7OCjdU37FJwvFRm47BKYO9Xh3g2R8Wr99Y5MTIQF61M1OAXtmiqRadFlfaY2/g2yH
	DfYgkLZUDgUdNIc42SimpHvKSW9ipqpTU5glwMCESPOYwLA9iveNAoiAn01s4iHY0mspSTbPfXc
	j7yDIoeI5T1zTbQ=
X-Google-Smtp-Source: AGHT+IFpt/tGI0C0Llxj6yqwoW6+UDGvasbspWqNSw5lXAH/EOQlfLcMUFUUZtUM6+ncdDrcGoubYA==
X-Received: by 2002:a5d:47a4:0:b0:38f:2065:3f20 with SMTP id ffacd0b85a97d-38f20653f83mr612508f8f.17.1739353560896;
        Wed, 12 Feb 2025 01:46:00 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a076496sm14262795e9.32.2025.02.12.01.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:46:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Lechner <dlechner@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-sound@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [GIT PULL] gpio: immutable tag containing gpiod_multi_set_value_cansleep()
Date: Wed, 12 Feb 2025 10:45:46 +0100
Message-ID: <20250212094546.11895-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi!

This concerns the patch series from David Lechner[1].

I applied the patch adding gpiod_multi_set_value_cansleep() to the GPIO
tree. Here's an immutable tag that maintainers of all other trees affected
by this series can pull in so that the entire series can land for v6.15.

Please pull.
Bartosz

[1] https://lore.kernel.org/linux-gpio/20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com/

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-set-array-helper-v6.15-rc1

for you to fetch changes up to 91931af18bd22437e08e2471f5484d6fbdd8ab93:

  gpiolib: add gpiod_multi_set_value_cansleep() (2025-02-12 10:29:27 +0100)

----------------------------------------------------------------
add gpiod_multi_set_value_cansleep() to GPIO core

----------------------------------------------------------------
David Lechner (1):
      gpiolib: add gpiod_multi_set_value_cansleep()

 include/linux/gpio/consumer.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

