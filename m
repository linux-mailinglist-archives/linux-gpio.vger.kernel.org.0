Return-Path: <linux-gpio+bounces-21434-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C29AD7046
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C0881BC6515
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC95823ABAD;
	Thu, 12 Jun 2025 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TDQsJbi0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D3A23957D
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731075; cv=none; b=RKwvK1azNxxt4U5KQ3yJhR5ew7gteQZxizfavylA6uwcsqylDimNhOzgOlIMGVfCI4MZcQislwbnZ5JT2URiqScNEZ6t39aVPo4eUyDcax0gGnPO4PRd2V6QT3fC/LCim3jdzwgvxtz5FHLVaVfoNfRMeC8wmtQRAhXqR3064b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731075; c=relaxed/simple;
	bh=wal1GcwEnsKSNkmW7gA7AtmVZccbEg+TmgTnEhe3bkE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D37p/Xob/traQYVva71y7lftNaTvBApjN3KGkA6nFZDt+o0tJ6eEA7F0kT+QhD8kGqmFC5G97QBubEQWMdZvpwvrBcS5VndTNCEFFtFvQ3ACO2GpQKYC/GT/M5zw4C0gRadn6oJvDtqieokIDxtI+XsMcb0VZsbaBP6acAHSDG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TDQsJbi0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so10489405e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749731072; x=1750335872; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+5itlT+SbTK1xNvj5RPSvpriLy98vUKmbSJpXwwj0Rk=;
        b=TDQsJbi0VI/l9IcO4zTFLg8V30iGm8hLZTT9SIzqv7sIqnylgzUr6mCSsit6fG9bEr
         ZuvwUDsvjSMoPU6UKDT+kgaMx/u/SFY1v/7uLVKiyRzVe5EYfTXdELMJGecFrDqPX1V1
         vv2XEDFIKZbPB8lP/sgSFa1wiWKmWRjVncVhhCqiICVzniQTngiwr/mSaaRw8aCWD0S6
         38PHOlILS9TqYKE5D1OtmiCLNZIO3Ha54WRBJwYmVNdH87NKFjR72kE3XgcwVrbiacl7
         Xp4oI4zDpV0kfkB1zqb7MtO4Z6B928be+848loBTKf8BXM3znlZShJ5ulHy558cSl7up
         kvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731072; x=1750335872;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5itlT+SbTK1xNvj5RPSvpriLy98vUKmbSJpXwwj0Rk=;
        b=Sl6E5zJD2sKqkXKQBJFErMGb2qQFtHSd6EJnwgul3YLiS/pliLTN7+3K6I9gfH8KIi
         cZvKGv6DEQMW0obPx2Byw0W4w7K1JjnK5xikb4PPnwns8icffs9tL6h7Lpp77NKlJLt7
         uD7HTzpeOnmBT0ZS1nBil/Ve9/AcKrKdvU6eenZADrae1m0IqtyFudPA13iozd9iJzaz
         f432rUjVLVvRRIJSrR3qa0DiMjxsAVsgIoHxklsQNaZeSRNcB8lWcBmc5PkBH3V+Q+Js
         V9MhRjFSkax6XFzkSp18HZJyaCVPT7uT7rdmhC2GgehFWnHgDJxAXvN5sdI8kfA6o9a0
         DyFw==
X-Gm-Message-State: AOJu0Yym/IXAP/Sgq2fNkV+8zqHXiCJIRs+ZJBB1MNiyBf+SpzMgbOws
	vYSWJJVwO30p5jp3rsQKCQPoEcKruasGAe8YzyWmlO5uqil8PFgx/T2ZyaPtaJ2uY7U=
X-Gm-Gg: ASbGncs+RhigSaCyK6iEC3ZHK3v0w0YmapLzDW3wIGIdf6dMawNEK3DpCskwZnIEeZW
	zW8CuzAWqz/E+0XnVWJQ/KAlyXhm116GaccfwCxuPxYK1qPbpnf+OlhPiPVJFPigp8NlWqchhLR
	q1LfG72eAyV1whdbGaOBvObaeUGyryUiomdRWYfQ32WMfbBs7MIqTRTMBSuXwoEaC6QNhj8g/vO
	ccoc9Ew2DyAl7X5yKDNxeekgzqOg6MXAtiOIGkwbLwYONZyHD8WpClv8b6fH/3J7HQYS32C6L6b
	7AYq11N+YnQOhyGu5j5wgOL7aYQoM8AL8zS+QZov7fnnOPVqrAQ+XOYi
X-Google-Smtp-Source: AGHT+IFEyFmw262ABE2F6SZs6QFltrBKmO2tVdleNx0Jrp2+sivWOpeMXTI918tAqlaDsKRlLeUVQQ==
X-Received: by 2002:a05:600c:1988:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4532d2d6bc2mr35985375e9.10.1749731072202;
        Thu, 12 Jun 2025 05:24:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e176d30sm19140765e9.37.2025.06.12.05.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:24:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] pinctrl: starfive: use new GPIO line value setter
 callbacks
Date: Thu, 12 Jun 2025 14:24:29 +0200
Message-Id: <20250612-gpiochip-set-rv-pinctrl-starfive-v1-0-8507b46516f5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP3GSmgC/x2NwQqDMBAFf0X23IUkRUn7K6UHias+KDHshlAQ/
 72hx4Fh5iQThRg9h5NUGgxH7uBvA6V9zpswls4UXBjd5ANvBUfaUdiksjYuyKnqh63OuqIJx4f
 vsrtPMSbqmaKy4vtfvN7X9QNzVc0AcgAAAA==
X-Change-ID: 20250612-gpiochip-set-rv-pinctrl-starfive-89120203688c
To: Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=991;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wal1GcwEnsKSNkmW7gA7AtmVZccbEg+TmgTnEhe3bkE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSsb+XmOrOokC4PU4+cMiNCzRfN+OlfaDRVAxL
 dQrVAffNZKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErG/gAKCRARpy6gFHHX
 cvP1D/4solhAtEM7aA28qKkjKbUTExcKNoO559lTiDWMlzS4sRrcqIYcE088EpLAuPwjN/YYDnD
 IV9isREHrIDkerVeIO5YjFif7QSPBqCjsgPLC12yP00rAqzwmSagahz4/Qy0g0m2HonIKoJ8wrD
 RAhcPZDONLxmNe+YEhhl2vJmolHzumpmfX9Jbsl071LP2asEep2ZYVmbXBO2ENd8ZRWTjN2sUhf
 hagMoPZ1g3HyxJzcfT5HVxxqGOTPB5ZVdV1xdCyneP4ccid32ZbgxnFTlBfImcwZB6VyYHg8k59
 185y03amaN1K4nHvgmt3KWKz+qaeLRbRWU64R1PBE2epn6pZyM17Qpnyefg46m7L+jEwRCYSQ18
 yVVkE7L3x3C5yqrPvgz4GnNdxal22sT9j59Da5gZ2gvObUWHxtMDYdfm4gmU1voVdA4IhRyaYrD
 PHGFzo7uqRG4mZZx+IPUpyJH77vdhB8cdUcH1PUPMLYj7JPiJE4KTSGvb0qgAdxwuzS93Brqkr7
 mctNDDgyrf6am8rxGxSOzAZSTDdGduVk2H18RImf2QZN5G+bfznoGmHSS65eXHkYGFiLYqnJVzj
 EvQyldeVrqquWgJ/fXtDTYQKD1KCmYQd9n5hFTVbFzJzeaMnjs+BtfSM5tBql8HXwW06yKwXqSi
 Mz8KJd50JzCpRmg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips in starfive pin control drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      pinctrl: starfive: jh7100: use new GPIO line value setter callbacks
      pinctrl: starfive: jh7110: use new GPIO line value setter callbacks

 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 8 +++++---
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 7 ++++---
 2 files changed, 9 insertions(+), 6 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250612-gpiochip-set-rv-pinctrl-starfive-89120203688c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


