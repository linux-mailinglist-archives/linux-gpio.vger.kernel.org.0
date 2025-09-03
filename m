Return-Path: <linux-gpio+bounces-25445-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F284B4178C
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 10:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54D09178C43
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 08:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8B82E2F0E;
	Wed,  3 Sep 2025 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rLpziD0o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183F02DC344
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 08:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886423; cv=none; b=hY3wKMAkH73otmblrH13PDYdGnJnIoWys3lUdzJuk9c61GMsIWGdNHw1ttiKFw52leBXGJEeeYydqLHWKb+PJftRKKkVV87t0/S7Rk92f8/mnUQd1HCFZlj+MVO2hdbW4zJ5Xh4aGKTVC0GTlIXLWJ+xCZmpFRkYXvYpp68qrFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886423; c=relaxed/simple;
	bh=gKWwUvnAEvt2ScQRr56TGrFFGK11fkBKFuB/ae7rjDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=odxgnE92VLRGWtkRTXxN6ioVsRB2gb/ah9gUj9r8bbnWZ+6hUYR674mccu+jAXtGDV0DTmeXOWwc4ZxOU+6ZiFNF9o/bcM/kjsvV1fRE78ZY+UW94tt4MRLpcDMS1nVxBugg3rE0RuWUfqZjdRkjKl6VgpL3xw9ZnyeVvNf3I4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rLpziD0o; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b87bc67a4so24841265e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 01:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886420; x=1757491220; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DpPPqJ6vfvGH4vuO+e6EX5ng+865t3uw6R5fP2qsALM=;
        b=rLpziD0o/ZGofM9iyt8raiYE/NDnwKoKOgxjILmZGwE6jjTK6+u31BfqfiRMhSV7hQ
         TijKvIs6HpG4QyzHFu4edKWFJdgX0tJSDWIq7hQi4QPb+qQf1nxuzehMt7Xjx25MB61R
         8uNgWxJ3mSsfZ2CwRWRDHDq31LGfTO7yz1RkPx2U7r6i+IcAvxFA2E1mKtOajw7COx5N
         YhaynUl15b2lBTwvMV+r/jTiXJ9BSIHvtn6wktnIGdwSkYfOdqyAi9MgsK+kvgjnCCGO
         xNdH9fpaewrlcr+gww1p0jDaYWf8VN2ttKUPmVj4TPyUnUl7Ad7khl3Lh/Gjbd7Y7Nfw
         QjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886420; x=1757491220;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpPPqJ6vfvGH4vuO+e6EX5ng+865t3uw6R5fP2qsALM=;
        b=ffkSBurDAEJZ6knZss6iGqTaJURsrExdy+14IZd1v8R80tSaDdUk3lEOw4fhXJEA2w
         srrIpx4YYxtjpOt+MsuYYebkeYjijVOg95mgUI1r4wT75LgP3T1bEDqa5ONDklK53/vg
         Xb7M1QPxR3qP3jcDl0oibTmn3xmcpSmmoAy/HqVaRfa/qwMQj55yPY8MAKPH07ml8uom
         Mqghg0WJiRaQ2fsluG1Hsa1YUJTK3e6QrZhg8K1oL3WGMrvPYmhhJrf8IM/D/IlOdaW0
         SqDC26EnLOKSfPVE7kuJhPlrRINrFaAjW1iMUIh0Xo66tlvp9sIwpyCvoA5AkJftp8M5
         Iqqw==
X-Gm-Message-State: AOJu0Yw3xmYSWurUBaBMdTDnuZrOQrD/Xgf8QshfbjpwT9AvzxuziBA9
	EbFno9SJtRlcUb1NeB6JwN2Vgv7bmYxuAYMLcuAmSQ0Ad2bsxpBvI+fXwXKr0gjbW7LFyTzFHuz
	N5sH0
X-Gm-Gg: ASbGncs9mvg4ojFrUQieR8PPIrVUfDeHUSN2qLIHF4MMvzU0yRPs5CqgkZ/qoIFRO3J
	ijFKF94aPcbmdd1yfCwSva3gJD6NmQaFR464pCADOUh0dmFuxgqRF8gUazQNNyg29lkjI7t8SyR
	MukUVjcrMmiqAhdW1KqMRvIanJrCAEbKTmGcYGw2LZk9NmjguU8k3rx3P+9QDIBwOqSV6Q4WS4p
	fLYtcPEvLpY6skpaR/qOV1Wil5RYwKD4Ehe+sWUbI9aCruV/hA/iKJKc8+j8FZFVPLhbExDKgSh
	WyhM3kB96nT3mMHnq+aHbo5SlxacDyyMXb5nfP49fTlUSYPZkSrcOkicpGnlYQIB29HTBf3E9YO
	TTSanesrlfNBz/PLZ
X-Google-Smtp-Source: AGHT+IFwjP7yYn1uifzActrfXYI79jTCrc8TnAVAgAEQ4T0bxdVQdBTd41jSKK0TuTYpRpjrFDEjGw==
X-Received: by 2002:a05:600c:4e44:b0:459:dde3:1a27 with SMTP id 5b1f17b1804b1-45b855fc86amr107466725e9.26.1756886420178;
        Wed, 03 Sep 2025 01:00:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/12] gpio: replace legacy bgpio_init() with its
 modernized alternative - part 3
Date: Wed, 03 Sep 2025 10:00:04 +0200
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIT1t2gC/x2MOwqAMBAFryJbuxCjInoVsTBxE7fIh0REEO9uS
 DO8Kd68kCkxZViaFxLdnDn4Il3bgD53bwn5KA5SyFHMokMbOaBzBXXp4G+Me7p6HPtBzcaoiaS
 G8o+JDD+1vW7f9wMBCkNvawAAAA==
X-Change-ID: 20250901-gpio-mmio-gpio-conv-part3-534b9ffb7e2c
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gKWwUvnAEvt2ScQRr56TGrFFGK11fkBKFuB/ae7rjDs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WMzbJ/KeLZaXwwbG7zHqK/b9QJqWbxJVEkF
 NwdikCx+xqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1jAAKCRARpy6gFHHX
 ciaYEACZUQUFrz8EUOXz/wW+8FpV4nOg7WED+poFNv1ix3BYoSfeycNXw6ASf8bmTHYuRUfMeN1
 RfJfuwFT9hdegcIBuWDhcHRmW/MhmZN/lfl2jipA5Z0T+f9Bcs/jU64irF6NgBMONC36lWxz434
 tSq+qphMiMajKiFrcwoWa8GenarK0R3+JcoTAhDwfAr5F6+GTanDnjNwY6CVcz/ns6Jpkj6Qjm/
 DXZgC2xB1dlOgRk/KBm0uVd5ztLeToZOW93AyDUZdsF8aKnRvKKU85ypaJ/U3hxwQEpw0r5X9c/
 4vwFH4beR1yILC2lFhkhsU/M8fU0lhSmgc6ajG/XeV7EuUlPhz9+ozGz/OxCzeHr5Zuq3SQc3VT
 jPCVSYynJOUfAWmBKaKgKg4YGHufyqswORJ1Gu6S+PokAhRamn2cFOF+zfsJ+n83f02+J5YT4S6
 m38OkRc6GTE636Q9OnZOk0VoH2hhWWQMsn+VPysDq7YQQiJWli9piqELKJ4lT+wKVJSgDcIixNk
 A2UvApfvhhuPYuFH+Wdtp8ivAh2v57RpT1czjXW4nHXz9KtIj7r2G/93f6wED0SMWHaGkSn5Bgg
 aLBCXTs8AyWbCXyQEagHqPvuVrllsdtt8bKra3fhbclCiYgUYtC9e64Dby7AYCdtdAUK5l2bLQp
 htd9ZzHD04avA7g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Here's another round of patches converting GPIO drivers to the
modernized generic GPIO chip API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (12):
      gpio: ixp4xx: allow building the module with COMPILE_TEST enabled
      gpio: ixp4xx: use new generic GPIO chip API
      gpio: idt3243x: use new generic GPIO chip API
      gpio: blzp1600: use new generic GPIO chip API
      gpio: tb10x: order includes alphabetically
      gpio: tb10x: allow building the module with COMPILE_TEST=y
      gpio: tb10x: use new generic GPIO chip API
      gpio: mlxbf: use new generic GPIO chip API
      gpio: ep93xx: allow building the module with COMPILE_TEST enabled
      gpio: ep93xx: order includes alphabetically
      gpio: ep93xx: use new generic GPIO chip API
      gpio: mlxbf3: use new generic GPIO chip API

 drivers/gpio/Kconfig         |   8 ++--
 drivers/gpio/gpio-blzp1600.c |  39 ++++++++++-------
 drivers/gpio/gpio-ep93xx.c   |  33 +++++++++-----
 drivers/gpio/gpio-idt3243x.c |  45 +++++++++----------
 drivers/gpio/gpio-ixp4xx.c   |  70 +++++++++++++++---------------
 drivers/gpio/gpio-mlxbf.c    |  25 ++++++-----
 drivers/gpio/gpio-mlxbf3.c   | 101 ++++++++++++++++++++++---------------------
 drivers/gpio/gpio-tb10x.c    |  74 +++++++++++++++----------------
 8 files changed, 214 insertions(+), 181 deletions(-)
---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250901-gpio-mmio-gpio-conv-part3-534b9ffb7e2c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


