Return-Path: <linux-gpio+bounces-21322-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB13AD4C97
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 09:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1958C7A61BD
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Jun 2025 07:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D72E231823;
	Wed, 11 Jun 2025 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vIbWYc+P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A4A22CBD0
	for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626882; cv=none; b=rUV8WDeXdcVHDUUkbYw3yvts0LcjvlqIT18ND4mh37hGKqhAUnJBgOK/I6aFA8I6h/wpX2IaOrHeTkas9fUYMQtNguwbtTG37RRsT04puCioRWW0SCcUu53BhPGwfYx/3cpsp3XWWuObOSpc/eQobVtkGDbEKAm3twT6sIRZLNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626882; c=relaxed/simple;
	bh=+UkZcZhV9av7citUgt9NqSKdFGeoc2sgbcgBT2molbM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d6zU4er2huXu4A1rromb5vjYX0BqxEsVY2UTcwvxNmIMqu2qTyQK5+GmgWLhBct6Lfyv5AWT2bTqf/cFUzWYrqOePCDMit+LcQg2Dkr0yqeS1btPhBSmg0Zz8vhii/YEYsYCQTOfWED+p52wTsOWxn5HRWMUfuyVirk4DWTXkxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vIbWYc+P; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so2177277f8f.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jun 2025 00:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749626879; x=1750231679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ptGJSBQzqpHt9lR50i5Ue+3VvxjWOQyle69MfvMceYM=;
        b=vIbWYc+PhIvaWmET4AYICbo5s8Eb0LG4N6nr4E9KOQNbaOwVGYxE+45wuuhRpSUO6G
         aPsIYdX8v3A8tde0ytKbJ6K/DtmP2Ugc4M++3UXgiGvkSv5ZV7vQV091gej6NzWBBb7N
         Sm/QfB564HGvtOTYWgnSjj6Ap1G4+4PxnXK+2mIUS1TuyBwJmPMsEklYlbNKdZ8WHmJb
         7Dwrhh383fVWdE/TPV9Z0EFfoAzhEiMiG7eoaHquriYypNn0Qz5Vv4hPTnzkEapm45HM
         wlgoJV5d+FgNjADdwSCoBcf0Er/K0rJKOv67QhrD/sBHJn/lpMcn+avIvChSDSCL6sTS
         pGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626879; x=1750231679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptGJSBQzqpHt9lR50i5Ue+3VvxjWOQyle69MfvMceYM=;
        b=DvTQj9EtTExOoXB5gAEFApehIsBf1bcy3I9CyyANy5GvyyABtCRAanjlB/2dubYhbX
         iqGgjfmoH0At/EeAEgm+Q4gOsVS5E4CnM4VwZpO2nMsWVnnb69IGKdM0wg5SDGiQKHV1
         2vMLcU/RnAliIIOxKPoJKjvdiDa1+TOmKdHuxYz2VX3pFEAYeL8SE4hOEsyZ2yK3zdaC
         uNLNhX/UrG7uwpgWSZvLXtTuxn2ggTeP06YkVhqylS8hCUzJ5+IlcPhK1fHSzRV+WaJf
         Crnn1y2vLdEejHIrP/ZF0jCzLa8+qFo4PaRsgJrtx1P8tdO1Flj5vu2ZUAVok+lXMfUW
         KmiA==
X-Forwarded-Encrypted: i=1; AJvYcCVPsLB2xmraw5xfoTPUqPrFeqvIO8be8VyhT8qK8lyuiBg7zPBqJaVnkS6RcwMZhD1h/2B57xdiNlRq@vger.kernel.org
X-Gm-Message-State: AOJu0YyjhG7DGjr32lQC0WB6/6nHm7ZEVhKMH2ns6AMPsZsWsPz3BBE7
	LUGcYBFWeXDxntBD/QehxbgBVsjd7BGPmhzmMi3okLGLCbh1IazW0wtt7Ob0lldLHsg=
X-Gm-Gg: ASbGncv6LUYBRsho2POQx54xigdwlB37zO57ekSlSf+5nZpkaxQKMm5BvXJLAFFF9AA
	oFr+sn3s5XFZkQIq+v0P+zsa0bWNvDw7sm+4jA7Dh60h0qM6JuJiWav5pIhZQ9pCC2hbMUNeYpM
	DfM/3OEt1GHMQMMxghyrBXYXerX6WTJ83TmsIdROhxaxH6vvdj677QgpMbCbZt7Q0qERPf/ZhbT
	JT0RckqoMmPUpMm1u0WDYvVfTQfaXnTLr2xLQu26Q9P01xnZ6EpAMApVkGdJEN58iZVrvYuGb5d
	wzxqQCWSYyWUOhLUG+FFUxwe6cUw/Wp1gP7Mg0gn70PPe3u/f6v+tGVw
X-Google-Smtp-Source: AGHT+IGEFVrZIHBFz1SqE1EP/EGMs6loGv7reHq2wYK21ptKTC6U8N2Q6UlW57yhMvsjjqsxC6WtfA==
X-Received: by 2002:a05:6000:18a2:b0:3a4:ef0d:e614 with SMTP id ffacd0b85a97d-3a558af41demr1484750f8f.33.1749626878558;
        Wed, 11 Jun 2025 00:27:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3994:acce:fbc8:2f34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463e11sm14572552f8f.90.2025.06.11.00.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:27:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] pinctrl: renesas: use new GPIO line value setter
 callbacks
Date: Wed, 11 Jun 2025 09:27:51 +0200
Message-Id: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPcvSWgC/x3NMQrDMAxG4asEzRXIhnroVUoH4/x1BMUxUgiFk
 LvHZPyW9w5ymMLpNR1k2NV1bQPhMVFZcqtgnYcpSnxKCsK161oW7ezY2Hbu2spmPzY0eHZOgiL
 Ic0RINCrd8NX/fXh/zvMC8mJxunEAAAA=
X-Change-ID: 20250610-gpiochip-set-rv-pinctrl-renesas-60ec0ead2e16
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+UkZcZhV9av7citUgt9NqSKdFGeoc2sgbcgBT2molbM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSS/8IFIdCAbaI8xIHgBY1gbOBNw9R28sE/jtp
 7apTdGqe7+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEkv/AAKCRARpy6gFHHX
 crIFD/4msYeUKgE2xWhYmkVCjr4yqjwa4yLC47mAaEKL3tEc3c2Gnw8VZVESpTfWBbqYJ1x60hr
 3YSR1oBUlGbsv+WlfQkoJWEQHg+fqD1w91K6jtFUkhtPn8qiT4s85Emd4Cu3HlNRoQJ+retCowr
 7Thy0B6YazXpg6FH4kNsYD6M2Zf6LZaDabLz9crqlFqK8rMMZq3SCjPLIIScHzkBu3uOh6WkSJl
 0EMaJIJqNkZZnOoBD1XxyrruRoJEWPPyQoinBVvTfG32sVFlaX3oAnnw0s0BFWA+eLHI4foBc14
 TIKtOZsinU2QVOLp1pdAmkqJe3jzgzgJSSu7dSNYV2waYbwjG6h3aYols5oCd0H7Mhucw0QS01p
 U+DHhz2ucoIVJ+o+IANDuBTNAdUoIK++0//lbcDxXVu7XEx97R2p+IkU2fp2US5QVt8hHUf3LU7
 4z1c5dAQG2mMbshjyYATIG8RkDbqUpgmMttAeIWnkZx6S08OW5qYDwut7Z2iSZBfoLWX4aZQbmS
 SmO6FyL0NMdOArjtfvjiiN2lXCOakqK2g+Mbn2oObToAo82Uxs0FCMVOjc/GpQ3C5OL+vlD0ItM
 dArOOzuyQLRfz4AnF3iMr7qviFz8eNZNegveRnWT0dvGV1Yf76wmoLU3kzhGTFf1x9oSZCgflnW
 Ml+ZF40h/u2bGvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips in renesas pin control drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pinctrl: renesas: use new GPIO line value setter callbacks
      pinctrl: rzg2l: use new GPIO line value setter callbacks
      pinctrl: rza1: use new GPIO line value setter callbacks
      pinctrl: rzv2m: use new GPIO line value setter callbacks
      pinctrl: rza2: use new GPIO line value setter callbacks

 drivers/pinctrl/renesas/gpio.c          | 6 ++++--
 drivers/pinctrl/renesas/pinctrl-rza1.c  | 8 +++++---
 drivers/pinctrl/renesas/pinctrl-rza2.c  | 8 +++++---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 8 +++++---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 8 +++++---
 5 files changed, 24 insertions(+), 14 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250610-gpiochip-set-rv-pinctrl-renesas-60ec0ead2e16

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


