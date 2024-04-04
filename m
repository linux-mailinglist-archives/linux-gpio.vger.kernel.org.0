Return-Path: <linux-gpio+bounces-5070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B0B898437
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 11:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83B651F2908E
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Apr 2024 09:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BF782D93;
	Thu,  4 Apr 2024 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lOXzeHgv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EEB76044
	for <linux-gpio@vger.kernel.org>; Thu,  4 Apr 2024 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712223220; cv=none; b=GlZpxdi3p8ww9gpfIXYTlJwj2c5PVGznfx+DrVP/yT50qChDEFjSyCEsbqMMw7Kdsbm8Us9FE01Iq49dI/yUp5eDyOLcqA8wq5AIxJK1fvF2i2BSeuLKnzc0MVqowzUpEBYLGgLn973WUytJgO1VkjKJcT2EidwgYF3mh4xCoxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712223220; c=relaxed/simple;
	bh=XT8qfTbBDxmpkv3wi9MqFr3mAml1cvbPorzvDz9txyY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XsR1aQVSk7URIk3ugqwhdNzFCrHYx4s3jqrRLb3YqAby3g9vARZOGrIFpIOSlAcUOZR9KVlI70JJv22h2tUbWcN6bEes0kBFZ4Z6OqIPHsmjjo6MLSEA8/XTYDfgxAvxKq4XzHVtL5shsKERFKvgIWtINBcrzGkS28iZfHFObyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lOXzeHgv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-343bf6222ffso155204f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Apr 2024 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712223214; x=1712828014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwi6HXvg3yM5JJ1Mku4nVoIzxX/h/Bvxo2KK8Xe1bO0=;
        b=lOXzeHgvSp0xNv9xJZ4UNaeDzDNxD8VrAHs4t5WGS8A75vIw33GCvM6nNKJyEgLv4D
         X9OrvdPh9rVmUoz8IclzPE3qi41EYXSGdCEC52rrrbIhVo7jD6J9FNe+bgD1yZhSdoe4
         66maM6YAqIhRpIi0bUfVOFoMmMdGV4PqOwkuh5GID8pr+GcRTT+fqMlTlmgUoL9dawWa
         YDs5tVfRIZWaKbtwheOD8Ip70srh5Mp+Mmh749nY5RcTBpbptYsa+Huei47lL568c3Ub
         gjmbTgf9bpOXBBsnE4o5rU/pVrcFd0lGpkfmAK5QKEG7qFZ77Hx9jypyqiRADi42d9bs
         eM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712223214; x=1712828014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iwi6HXvg3yM5JJ1Mku4nVoIzxX/h/Bvxo2KK8Xe1bO0=;
        b=hLcUvn4dQujsG25TvlEkm7onpFtD/NqsgjGF7qsdlWV2T+/6BTJJZFwgpj2ejB/67o
         5GIMYdSZ/39L1nwUXutzCD4yXojJFXPqg8FHu6iYNqGru/Kv3Ucufx0k1gkCnDjpE9Q9
         s07EX7ciVzmx6+DP7hrxf+/m/miWmQ4FLO56mUcN03FeicNlnidyMDTr9r4LoHKTDK/H
         aQHMcrC0ZVWQuQLXTPnRuUARW5vX2w2G/ZuJTm8GHX8pIK+ivJZKnK0XV1sBYjBaTY6Y
         eOUfyU98BUnMwdKqfjKlylYEE79hP967K/eFMrRGI+IWb3QKwNAco4U2eLALmzEnN9Si
         nrng==
X-Gm-Message-State: AOJu0Yw1OZmJPhEW7Miw6/3TsdvRaG1SFS88Sk/lTTn+sLfJISxjRZfy
	px75D1d3BIHOQUncfHLGmKs6cibm1P/5BlGycqLZted2vOfVsXS79eDGP+Cdj/s=
X-Google-Smtp-Source: AGHT+IGL0b96w+Q2HwiPsxRXzggO4UGgmu7GjYYzWIr5gtnrvMiTJc1Hq3g5cGUH81UdEC31zK1uDA==
X-Received: by 2002:adf:e48d:0:b0:343:a30e:bd9d with SMTP id i13-20020adfe48d000000b00343a30ebd9dmr1697909wrm.3.1712223214274;
        Thu, 04 Apr 2024 02:33:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:220a:565e:2927:8cf0])
        by smtp.gmail.com with ESMTPSA id dj13-20020a0560000b0d00b0033e9fca1e49sm19436385wrb.60.2024.04.04.02.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 02:33:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexey Dobriyan <adobriyan@gmail.com>,
	stable@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 0/2] gpio: cdev: label sanitization fixes
Date: Thu,  4 Apr 2024 11:33:26 +0200
Message-Id: <20240404093328.21604-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This series fixes a couple of bugs in the sanitization of labels
being passed to irq.

Patch 1 fixes the case where userspace provides empty labels.

Patch 2 fixes a missed path in the sanitization changes that can result
in memory corruption.

v1 -> v2:
- switched the order of the patches in order to avoid introducing buggy
  code in one just to fix it in the second

Bartosz Golaszewski (1):
  gpio: cdev: check for NULL labels when sanitizing them for irqs

Kent Gibson (1):
  gpio: cdev: fix missed label sanitizing in debounce_setup()

 drivers/gpio/gpiolib-cdev.c | 46 +++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 15 deletions(-)

-- 
2.40.1


