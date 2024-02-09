Return-Path: <linux-gpio+bounces-3138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A867B84F530
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Feb 2024 13:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DADC51C212C0
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Feb 2024 12:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB9737171;
	Fri,  9 Feb 2024 12:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WUlhPCZP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DDB2E632
	for <linux-gpio@vger.kernel.org>; Fri,  9 Feb 2024 12:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707481886; cv=none; b=t9YzmDNNNjCg3GjYJtL+1yDzlBQK8XC0t1degX4HSYnOiNISXVevwY2G4ePiviT85DiERS1sdJ5MIDzRNE5+GWJgMAv88R35O7BdrSvVUhYxL+U/5TE4n2mjojt4RtLCUf0zbEG+eX4duMkTSbX+oyWLHB0lzrfCM/y5Blw1DRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707481886; c=relaxed/simple;
	bh=i9R5U+QEd86Q8t8ldi/sbtRzpwpsB7YUQx0ukEKMT8I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CsIt3R4CjO+vQcGJ2vCoSUlPlnqr/f8Gsa0CI4kFSERlHvUz0XZ5RiA3gIxKzDL/hK6nOguW8nZ6ZEhqX/RGlwgPoSqYGZQtubpLRqMq3G+EglFKFkGSiILEj2+B+xz+Y7xFDWsciSgetmzMXF26biCBEn4ZOzN6JwwS6SET68s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WUlhPCZP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40efcb37373so7399465e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 09 Feb 2024 04:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707481881; x=1708086681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9BmCENUWx7yOsEkMygifMybWMyjtZrPTu0u5zF+HPzg=;
        b=WUlhPCZPZazI2BjPixVh4gFpd/WxlcMz6QASFOeQubewZ9nri8EVRITpMtfb5ICpmT
         +F9VYuFQ4aaduTSxQQWW2PuQUTmkhxsye7KWjEFq2CgDGMYDjpQDZono0Q0UY3qIsKQB
         PMQdWrRqzri9RyyuV3D4fwi7hyRTdjHbdI1/pd0r4GrENaMFx+PRrBFyR10g7oNFYfo7
         0YBYFQIJXCrvTZn1xAob/r8haAkxJScgoKiSF8IepycRLN4Ssosv1dgANgCzsly4CVDo
         VQqzJIWAnuehL8JHJgUzxEmnac9o5HLIohxSPhVQ3hTooczK6qxwW/YV11ipk0WF5YY5
         kgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707481881; x=1708086681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9BmCENUWx7yOsEkMygifMybWMyjtZrPTu0u5zF+HPzg=;
        b=Fwrx+R+BFxh504zg9YhV3cuLd2iuBQhTQEJrsZd5dxNGIzmn8SHKF8YWDht0yfiWDj
         4hox1vZ4yvRZZhChe03MVKGpSlmnmGDyQDkkAp3mWExbh1Isuksm0gIaLY9YPjQyuyqj
         /j8KiUEtITowEDQeAz6lk54ErVucJW7vjRfqOmDRYLafXjtblfHQXGxcJjYXXhrCDjHX
         e1uIS2uGu/5n259d2QzysURkZe26vNHvige/dl//df82Bj6h5rivlpPWFuyGOLOEJ6HQ
         E1JQ7Q4fJy33Ibm1cwpXpffP073AO/h80MKQ7LedhNV0mCVo6xowDz80Dr0jyS8aTJbj
         ox0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIsuvh14V5jsQSiVoyWSR3X65luMLpZ3LtsfGILfDvlzaH6vaHWNPXPsV2jkD6oXxbVfKWk1/0JH5cyhsOZK+sztLw9/P7eetbeQ==
X-Gm-Message-State: AOJu0YwiJTkbTLLiChE1S34ab7UPIZjTaaZdo6ftUACLo7lGnwsRgnd2
	S93Yrwx01oyv4KF33Be/b4l4q5bFuTQpkKSNwo3UN/PSkOuW6wUORcKVkIE9sNc=
X-Google-Smtp-Source: AGHT+IHu32b5hUv3RI9vqKkzHDbhQzwyD4H3kzwGvDVG+jsine2WBb94hwJ62MLVLVhMfmxQwzDJdg==
X-Received: by 2002:a05:600c:4f44:b0:410:6cba:81bd with SMTP id m4-20020a05600c4f4400b004106cba81bdmr1131239wmq.30.1707481881046;
        Fri, 09 Feb 2024 04:31:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYezds/p89H+0Xz1b2mE7O0P+0gRly3AYnGZ/Zn5iaeQ+eBS2aR/gr/AC/NJRbCW8Ci2yAaNHB8g317vuZeGBaKCXUFUNBBfCbtzE+xGZSF4C0OKQWS6JYyud3UoRw3fAn7hqyNcIwNrVpdtnkl0P/9SaoIOYXi1sVGWBG3gHi9iA+xa0+ZkPe
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ebbd:e0a1:ebf2:acd1])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b00410794ddfc6sm518188wms.35.2024.02.09.04.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 04:31:20 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.8-rc4
Date: Fri,  9 Feb 2024 13:31:17 +0100
Message-Id: <20240209123117.25215-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following fix for the next RC from the GPIO tree.

Thanks,
Bartosz

The following changes since commit 54be6c6c5ae8e0d93a6c4641cb7528eb0b6ba478:

  Linux 6.8-rc3 (2024-02-04 12:20:36 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.8-rc4

for you to fetch changes up to 2526dffc6d65cffa32b88556bd68e4e72e889a55:

  gpio: remove GPIO device from the list unconditionally in error path (2024-02-08 10:33:03 +0100)

----------------------------------------------------------------
gpio fixes for v6.8-rc4

- remove the new GPIO device from the global list unconditionally in
  error path in core GPIOLIB

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: remove GPIO device from the list unconditionally in error path

 drivers/gpio/gpiolib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

