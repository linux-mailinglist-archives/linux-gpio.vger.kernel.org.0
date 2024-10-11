Return-Path: <linux-gpio+bounces-11210-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 548EB99ACAC
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCA9AB265EB
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8F81CFEC8;
	Fri, 11 Oct 2024 19:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="amZx6NnP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D4C198858
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675129; cv=none; b=ZoVkeWT6EcPqxgzIHuA4CnQDY+nCozWVz1y+vJK+sGC1SRhcvSU8i1hi7fH/GJvE0daLTZRKD2NZcrg/ROjlHyQ1e6Hb3Q/qxU9IIoohNES9aokKH726tMVCsac34C34jtCun16GT51U+d4FejxEsF1HLOki8okCU8Mn6wU0Ygs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675129; c=relaxed/simple;
	bh=zTuCJl699lT3we7PdIMfsdpnTRsTu6YNo5hfcLBrGO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkfNTniNn6JYDMUNUj6OgDqrIIhY+jspyIeucG/wAXC7HbEj8H7Em8RAqSp0D92O+c6eEEwWpg3QSIZQ7UJC/Rrm5UWYbnny7F1q/SNmbcwjw1LtCBqu1K54OMaQyWWLFIKdhLjt/lQXRPfnWUgrQ2F2W2avEAwzTtBQHF56js8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=amZx6NnP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so1317051f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728675125; x=1729279925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tnri/u4Y989/puuwe3DqLSNUk9tDtYL8TcyHhYg5FEk=;
        b=amZx6NnPh8Z2KUGrEnOyRAlZOEx518txo1wupcsli524YxtxGIXHFmPWXpk4EXggu1
         heBt/5igNBCGcGYAVDY8VLZvp6rw+n8d4KFn/llTGYkJbXENjRzLrzALgro0dHRJhrjR
         +0PuDBFp9O9dvTdhGHmaYwmxQzd6pDfb/Pa4gSOk0PbLI6tGHHpUjEjiuvj3R3FPCmLX
         ECWJGRd+BeC9fE2SDgo5brgT+VnDvHAjSGTgciwQ5GU2oA/kP/26JGO7iCv7m7xv+Z4H
         A3E4KrV5wDQKjTqIMWHsf8DVw4SA6l/r6zcT+DZGNGWZFvbZjrE4dchtjJ35C0RGfrIA
         nGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675125; x=1729279925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnri/u4Y989/puuwe3DqLSNUk9tDtYL8TcyHhYg5FEk=;
        b=T7qCDJuWuY9lKw6kCQq9A/f0LFeXTGjw68ypUhe+PGNn6Xpa4wpdfYmpiXWSMcyQ82
         tC+sk6Q/Xi3CQqec7Fis5IzaGfiw66OzFtdNPM1eqYpRZRFLJNLkeGxwB8z/bpnOj3f1
         UR1bMj3/hx58vCVcYmpEExp4PZcAIzaApaOC3KuSpBgi4Xp+ui1Y5IxokL+ZMkPc/Tt5
         dJBjOglnWYUnoV/5zF6QQiTveUbbDhui4UwrttE/zZiFBKDyHlXKQMQsexGbiMeevovo
         q6QDe9xoixntynduhPyzHBXPxiUbXcbxTeOwNtXq6r3vgj/UhXdszIuOMwN6SjXxryPA
         7+9g==
X-Forwarded-Encrypted: i=1; AJvYcCVkh273wuOCll/tcp8mpn9aI9qaClV829y7RL1iG5n+O78P0XFd2+qabaYMyuWah7mJMUl22oV+C2Y5@vger.kernel.org
X-Gm-Message-State: AOJu0YxreDuiTbAv1ZCaR+XTQOSqnq4W6lkZeEM43/IUJ04uNAoh1ByS
	eqZWBhhExha5EAjzwfvd8pVyHKO+AHEdwshKsw/miux5DxPP02RJjCppz1CYqj4=
X-Google-Smtp-Source: AGHT+IF1HfsW0zD9f8h8VlXJtzc8e8BK78AE4TM04q4U77K9BjbrDcWp0eHgaafYJQLEv5xy6NaXtA==
X-Received: by 2002:adf:e88b:0:b0:37d:452b:478f with SMTP id ffacd0b85a97d-37d551aab7amr2373070f8f.4.1728675125124;
        Fri, 11 Oct 2024 12:32:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:28e9:ae3d:8a30:75a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf1f78csm83224935e9.6.2024.10.11.12.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:32:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.12-rc3
Date: Fri, 11 Oct 2024 21:32:01 +0200
Message-ID: <20241011193201.4443-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following driver fixes for the GPIO subsystem for the next
RC. Details are in the signed tag.

Thanks
Bartosz

The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:

  Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.12-rc3

for you to fetch changes up to a6191a3d18119184237f4ee600039081ad992320:

  gpio: aspeed: Use devm_clk api to manage clock source (2024-10-08 16:01:58 +0200)

----------------------------------------------------------------
gpio fixes for v6.12-rc3

- fix clock handle leak in probe() error path in gpio-aspeed
- add a dummy register read to ensure the write actually completed

----------------------------------------------------------------
Billy Tsai (2):
      gpio: aspeed: Add the flush write to ensure the write complete.
      gpio: aspeed: Use devm_clk api to manage clock source

 drivers/gpio/gpio-aspeed.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

