Return-Path: <linux-gpio+bounces-23847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F26B12E92
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 10:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA24817AF15
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 08:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35061E8338;
	Sun, 27 Jul 2025 08:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Q5rJ4rmT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC1B1E5B78
	for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753604842; cv=none; b=lzGWyBHz+0dMXdFBI1JJ7lU3kRntUk/rYVXxIsXVp7DQ4mGB6HDRsIEtO6ANVIakhReucsAIAZ5iKvcC6qgDwANKAgBxoTv3PDB/5WzklKqmhLRZ56dzRhYcQ/rjYhjYxLPQjA0oqs3A5Br1Wk3OpQI6Z8pi+zRVVMlDF4wjkcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753604842; c=relaxed/simple;
	bh=2yW6F0SuaePRX+XJnoLUrfzD8GqWoKdPySZUHNTjfzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WfzlbU+/LtmBCofowGiLHDBe7k0oir3XEcqvCpSWUV8BbihkZjvvi85lqhUQ35Rs3Zkoq+Mne/oGnnt+YYIQHlhtMoZ1+rPCRF71jHP+P3S4/vE0BtRwGysJ6nDmLK/icpzFfkrWWibOS8eWW9brMHjgfWb8Rn0dW3bbFrmH10M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Q5rJ4rmT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b7746135acso1357116f8f.2
        for <linux-gpio@vger.kernel.org>; Sun, 27 Jul 2025 01:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753604835; x=1754209635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW3xho10EIPnvZ4KYenh6Yy4Fz3bJ4mpd7+jKQ1KV1E=;
        b=Q5rJ4rmT2fLMQ8nZy2i1JKN6KvOJxR0emFtxpONzjkuUxbgC5o6+eYzLNyVnxhl9YR
         uKPBb4n6RAjqAxC5r0HLTHiWu7uGr9qSdRiCgXMFYj5sKmf641+W6hQfROGakC5lmq8f
         2feChzwZrd69OvxbzFsq/8wW1xuoGMim1Axj7y4H65BGI8Eg6RmFkrbbSN1e4CwO291V
         RPtekujJCwr0IVZAdcuo64Il75IsCbi0id6ASbhf2znEDNB859zVmGDItb8NVfFXMOcc
         5VNGU3jD/4g0qCAlCbKAGteT3CCu0ZzvpZ6ojIqV3G95pfNz6mDGwUo8MPUvjDysJ2GA
         ST+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753604835; x=1754209635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW3xho10EIPnvZ4KYenh6Yy4Fz3bJ4mpd7+jKQ1KV1E=;
        b=bQ1KvI+CJ/TWT0zai/WZjmmXWSp89anYan1hqUo14wdgTr1gwd4fvkOPmCX7f7/WdL
         dUQtRYgcJ82GQohEzMsXu5KhZfvZGfGZ3bAyURd2wThU9LgiFjse8l1jAcR3xXMVpa7W
         2V+qqBUs5cbpZoECdyJ6P1lRs0Hp0oa1iFS/UQYQQwQXcxNgjhIeMZwMZAv8n2KmlV/d
         DsR/RKCR8xM414SAbS9zpDe8N72p9LFXWYI7TSwiv7L8kVI7Xuz0Kz0ucLLc1KHUEH4a
         BNbfdiXSYXKAyWPCE/NQ5n++VI70WCf/TFy5/puUBij7KOwc5cJGa8d7lS5zvb0W8zK5
         pRrw==
X-Forwarded-Encrypted: i=1; AJvYcCXc0xwufFBy9ovsNz8woibAUMS7VSNFXuYIwUqGynXxU3+if0Zlwz+ajgfnFhuyQsBIP/rcz+zt18j0@vger.kernel.org
X-Gm-Message-State: AOJu0YxySemPaB0PFf2k1nyz8jVDoefc84vFLpDVRMe1qYTgnBEsAKqT
	P9GXEZrPA8zh20oMth4KgnvoeJAxr6kKF5pZ8Bo2l7yQv9iYBh7jNdip9x7DE19+YNQ=
X-Gm-Gg: ASbGncsmZW0Mw+3v4cnwQi8ioCxVkH9G53pMmerxDIJFij9kboSla+dhFv7SsNzFuKG
	+6i5OLAMthGQZ56yT149ZKbHimJd5F3XdllDWmaGnwNrHWTn+1htANTsvLueIZyvFO9V7W34f8n
	0mStjiWeHp11bpBOCASaUkAKf+TJ65w9FFBwphdzSldoFeBjVBYxV8aEDCPhOJEFi3NyD/aAOpw
	++CCTVPqMaQr5u/GGofL3e4oRb+FvoM/zbk+nMob4WkMg4j19hLWHc5Hr1mLpfz7/IvHr5eYpPN
	aLOfnUJP7gwmyE1GIk/vB7qlZDBJWiVcpqraPuSYZ2tUoJ+PGaDJDrT7ZkOn668jheydRBL3xqI
	iQuYX65H72GBHqsii5w5n
X-Google-Smtp-Source: AGHT+IGDSjDWcXxGHw4HEIXALzynIM5/MFW46g3P5oBEHhtKwI65MmFJo31QX3dQsgxN+1sbjU401g==
X-Received: by 2002:a05:6000:4410:b0:3b7:7870:125a with SMTP id ffacd0b85a97d-3b778701569mr2899660f8f.43.1753604834943;
        Sun, 27 Jul 2025 01:27:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7619:fb4:5db:aeb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587abc2ccesm54245945e9.3.2025.07.27.01.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:27:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Peng Fan <peng.fan@nxp.com>,
	Koichiro Den <koichiro.den@canonical.com>,
	Lee Jones <lee@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Yixun Lan <dlan@gentoo.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB
Date: Sun, 27 Jul 2025 10:27:11 +0200
Message-ID: <175360482875.14160.11906905197800681738.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726211053.2226857-1-arnd@kernel.org>
References: <20250726211053.2226857-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 26 Jul 2025 23:10:43 +0200, Arnd Bergmann wrote:
> A few drivers that use the legacy GPIOLIB interfaces can be enabled
> even when GPIOLIB is disabled entirely. With my previous patch this
> now causes build failures like:
> 
>    drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_parse_dt':
>         drivers/nfc/s3fwrn5/uart.c:100:14: error: implicit declaration of function 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=implicit-function-declaration]
> 
> [...]

Applied, thanks!

[1/1] gpiolib: enable CONFIG_GPIOLIB_LEGACY even for !GPIOLIB
      https://git.kernel.org/brgl/linux/c/a86240a37d43fc22b4e4953242fca8d90df2c555

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

