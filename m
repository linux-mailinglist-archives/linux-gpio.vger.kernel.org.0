Return-Path: <linux-gpio+bounces-28247-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D93C406A4
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 15:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB568424602
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Nov 2025 14:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39299236A70;
	Fri,  7 Nov 2025 14:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F8NnA5wS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6A11DE2D8
	for <linux-gpio@vger.kernel.org>; Fri,  7 Nov 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762526805; cv=none; b=LrFV5dVSSHsJAzjYbZVcM3EztCs/kzNCeySnP5vufwtDHjJMk7n+QvzDexybsepRRzyMyzZea1+kpdpB3o9mNvogT83xnFLY2O3JB2oqxpc2I+xdO+17h8UJJeznOefV46pQ0GMKzKAPWVLf236QIGdiit/VFIXQVAtRWof2Nj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762526805; c=relaxed/simple;
	bh=REZTBV6HDipaZAEhcm5+UPb8i+vYRtFvVs1VV5ZcND4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CPZJyeAqP1lLOP/9fyuiqaTGhWRmtNeqffzQW7yZ5Jpbtp0DLVq0V84Dk82Xf2selaIxX4ja6kgTjONmGCKIcvhNFyHq7crjZGIR5QBgsClPVyxI5Qr50qf/1ZSknsFMc+hlPpto2OzYw9FJZyP9wwweyhvKipLrHOPaxxhbnYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F8NnA5wS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710022571cso8376615e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Nov 2025 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762526801; x=1763131601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JmuiRcsMYChRNe9C0OOPQPZILJvZGyW98QjMfmQ7M94=;
        b=F8NnA5wS7/CCmUq+Lsxjg43PyTiXfRfONdq6BiUT4p1KjjKm7NigYoYxXdir7JmLBe
         onMtDVWTfJOaNl2dCK4DdJbhkfwcpqG18w3Vwu7ZGK0XgmqQhOGqu8b0oiWZnsw7sdGb
         rqBctdS4a+iOZKhffrIZMF0zzk3iACprIubUgIMMiUNk25nW2ommrGwEWed15YmL9LWC
         TwkNl1Ru/Kat5dBDu49WLnyyREmfA8evdA613YpaCUI5nbJJOd2hlFYsvD6VNMfQs9xY
         2M72rUOtT53TZBJwJrDV8OsFiws2vy1Ua8qQZ4dhNP9/8mPSJd5ghsXjxmr12yOlpFNf
         oQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762526801; x=1763131601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmuiRcsMYChRNe9C0OOPQPZILJvZGyW98QjMfmQ7M94=;
        b=JpnNafk7PxmpYQoUd9q6T1konr5xL6gcQP5RbX1Xr/pXHd56a/SK/DUT/Nv+UCJMmQ
         dNMbkMljZnl2DPnCNGga5JviCYzrL7x83zHTRZRF4PZx49l5vsaq9Pf38psmjBQo8PNe
         AbZO/FZQP5N/TcBNZ/rgOkS66nxZLZeWcUg787Z77obAYAWjtOOhuMFjZlbBBUYu25X8
         SB3xp0AlLCIJuIexZKXJTve0O86PnfLxxEANEXT5cmsrvrYU+46+WdJrq1b4EVsmVEPZ
         3kq4Y+bT6rOXOfVX91DWW68SWRp8oLRhMPQjt20GvP+Oef6VMXzTI1GFHncKr5hRcD6V
         b+KA==
X-Forwarded-Encrypted: i=1; AJvYcCWormgWcnVYHurhlkcHJNwJ2Jdrm0JI5PgsLZFtWdpqHfs8M7ilS5q84dqF8m2ILBH08LVOi9UN6W1q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7xuIDqTFRUkqCYdoEB/7rHnupbtwrumslS9GXETVRgQCkmUHb
	RBXabHT6SgcdrCEhwLQHAyDEHk/FDfwArlU+2YUqS53h1nlZ6e1LMCPK79aHszwuHDvgjfFFJQL
	ZMqmg6IfOdg==
X-Gm-Gg: ASbGncu0ZpZZ+kjrTv+mQwuY4vNx3ec/xk/6Dr/qoi+ibIUyZGEUa3vj/xqkbmTfgPx
	c7HOciDwJohr5cCX4bC+GfiJ3cOA7ANhr/P7k9EWvW2C0f8CrsOLormRKQLGW4dWCl2kLWZ9P+O
	RL4BLhwXTlKup10F30mjlOlFKNrOttbfwFVzvUOmHo180XH5W3p+Q/y73hNGXRxyS0cC2Ls2pDh
	TWY2Znn+Pj93W29eVN2Gm7xon4czHoF5g0iVy3A9I/VWjemdvcdM8tuka4MjBRx8GFoNc8u/tWz
	VdO624EVyQ4JJZnZKhtryDgz9OYzUukjP8zmcdz2LL6zRyYQ+BHdm/DdaPzt+LLFsG5NhLOL7En
	jS9RyR/y8qpPxsTcxdCs5d34xNrjzZOZ1xvcf5f0MTNO9vxGIfGDLV86AAIQWGeJ/3Z5d61Py4b
	D6RVwS8tKph7qS3SM=
X-Google-Smtp-Source: AGHT+IEB9FlukRQfn9DZ898TQpnF0Z6Iiu4Mpv6B4yxwwI68pnVP1RmaouOAHRVgc3cxu0aVnr5yOg==
X-Received: by 2002:a05:600c:c4a3:b0:46f:b42e:ed87 with SMTP id 5b1f17b1804b1-4776bccd440mr32327345e9.40.1762526801247;
        Fri, 07 Nov 2025 06:46:41 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679d544sm6156457f8f.46.2025.11.07.06.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 06:46:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.18-rc5
Date: Fri,  7 Nov 2025 15:46:37 +0100
Message-ID: <20251107144637.40951-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.18-rc5

for you to fetch changes up to 4436f484cb437ba28dc58b7f787a6f80a65aa5c3:

  gpio: tb10x: Drop unused tb10x_set_bits() function (2025-11-06 18:19:44 +0100)

----------------------------------------------------------------
gpio fixes for v6.18-rc5

- use the firmware node of the GPIO chip, not its label for software
  node lookup
- fix invalid pointer access in GPIO debugfs
- drop unused functions from gpio-tb10x
- fix a regression in gpio-aggregator: restore the set_config() callback
  in the driver
- correct schema $id path in ti,twl4030 DT bindings

----------------------------------------------------------------
Bartosz Golaszewski (2):
      gpio: swnode: don't use the swnode's name as the key for GPIO lookup
      gpiolib: fix invalid pointer access in debugfs

Jihed Chaibi (1):
      dt-bindings: gpio: ti,twl4030: Correct the schema $id path

Krzysztof Kozlowski (1):
      gpio: tb10x: Drop unused tb10x_set_bits() function

Thomas Richard (1):
      gpio: aggregator: restore the set_config operation

 .../devicetree/bindings/gpio/ti,twl4030-gpio.yaml     |  2 +-
 drivers/gpio/gpio-aggregator.c                        |  1 +
 drivers/gpio/gpio-tb10x.c                             | 19 -------------------
 drivers/gpio/gpiolib-swnode.c                         |  2 +-
 drivers/gpio/gpiolib.c                                |  8 +++++++-
 5 files changed, 10 insertions(+), 22 deletions(-)

