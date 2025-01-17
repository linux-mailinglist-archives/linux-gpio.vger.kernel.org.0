Return-Path: <linux-gpio+bounces-14887-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6C3A14F29
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 13:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE7CA1889F21
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 12:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6321FF1A9;
	Fri, 17 Jan 2025 12:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="e3p4+L1V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932801FC0FD
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737117125; cv=none; b=foVc7tSjj50M1vIC0uq5bRyqjUOVVFvq4T0yn4g8Bw5xphm+Qkb923zHgd8b0LijC7MqHejQirzfdDB1JmY6DT/fgZE7/60duNhQ0DEOdvU1FpeG4bfX9q+5aIOuUtyTYv1w1erXn/ku+EWl8ZpvEnBH7f1/VrahMaqkT05qx0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737117125; c=relaxed/simple;
	bh=uJirGmB0QOJSNknDPt47QznF2XNlHY/g4f9DYHLWMLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s4A4s4JmUZ3QTgTZvcOYWoBxVC0TPLv55lFn1Zud6uL5de1KbHHK6NbKWO5EVQCOgDfJDIgIXkLbB5PwfLdcTLErtW2MFBynITyBnXpt47E5Trof7qKMv/3ZFDPI/TFni8uy2RuDTDqds6cy+x9XolhGsanYIFK8uWSYfx7L97A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=e3p4+L1V; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso13525575e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 04:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737117121; x=1737721921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sBZOHkGxEIIkCGyd59Ho/yAUy7rqsxs5mv7oFXfqW5I=;
        b=e3p4+L1VrVSthNPcJQ2PZ09WwsIJmjNAOcFKyo+l0FVpdfIxUnBbNWJYf+60bFF9gc
         LcF8MWIFBvYRXkQ09gkavakeuS5gUEXBS+v95dNuClOUAzptBCE4GJdgQcC990Q1svmm
         aTXiGKSbH5xMLAsno+kNTUIQuECsTTAoWfA+ehQOEnbrnaPe0I70fiuHGsBExxSN67uH
         VjqI3n29rZGKPKuhDAuSmdts2JMOUH0/KFM3T3b3zwN2AOQVvkm5ONSEtf1B2oGR0qyP
         rSV7BhR2eF7aNDOCi6lI7NDaC7Daf6ELfHq8HweLDUBiC5RWZqMBu4pV9VtgIorGaeUi
         EaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737117121; x=1737721921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBZOHkGxEIIkCGyd59Ho/yAUy7rqsxs5mv7oFXfqW5I=;
        b=NTqeVHvVFzqmd6ASQWaA8qCqUQiXPYFkHWSbF94/YmborR2fGob1g5jWuKBvEC6TmG
         6rKODFPkX1WVbN2d6zKeQIAVKeFUWT4aLMX88BcAPVMIJY4MX0UMISExD14SCyB9Lw1C
         iJCO2h62lzR/Ez1Hqblp17UOndjJ40tOKH9r/AuddXH1hGTrVYLE0ux4pSwKhjLurPkr
         tsDK1r+wDnAhwBRxW6MHzlz89sIebqZE+iHE8IvBXqjXlfQXPG4D0SNMlq9UhDTBVWwM
         mxk/2prO7OSie4Gunug6xdUXrXxYwF1aPY+W4zG2LselLDBXzYouLiGLqH/A/aikJ/HX
         OPnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpa6lmKmt6K1X/wpzJ7NBcCarQSaiqPXoWyZfgGAXAmgjFom3zSziHFDIgEp3yZAOsUpeQRPZ2Pz/+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7gbJU0v4AwP6gjBzwBq151HXwEgfbHLp/Z5sDbIgMOdlfuOpj
	LAF8CLPAVORhfqMP8BzC+cDZOd/ZNeOvnF3dPVaBTh4p3MZEjqu/1XiDuY92uiA=
X-Gm-Gg: ASbGncvO25ZHKc/Aw7t36mfqgPrUhSDRRElBZlmwGArJpEaR61ZJIJkQHsQ0+mOqIWP
	16W8jysb14kSusVSK5jW0aEBJyLpybAwzqvUPtsTpkXyyVuQltbrjlt5QzceRbkP+u8HC1Isb/G
	qCjGB6IvXeKO36WieblbDZThVVW2MYK40G+7IchdbQl6xgENUbeUoATHNDRjjFb+/VwR8Zd8LML
	47OksySXui/G3n02dhAWJU4wpSta4GGJtiDa9f78a9D1Y0Ucjm5OzNI
X-Google-Smtp-Source: AGHT+IHpmX/L6g3owd8YDWZTtdKOtlpzA7oOb0L8Lcc7zMEQGd9T+/LLPoaB8smqyDDBcTbwFQaNfg==
X-Received: by 2002:a05:600c:4f48:b0:42c:b16e:7a22 with SMTP id 5b1f17b1804b1-438913cb740mr27450355e9.12.1737117120862;
        Fri, 17 Jan 2025 04:32:00 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:351e:46f5:2a03:6deb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322ac88sm2464459f8f.54.2025.01.17.04.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 04:32:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.13
Date: Fri, 17 Jan 2025 13:31:59 +0100
Message-ID: <20250117123159.38472-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull one remaining driver fix for this cycle from the GPIO tree.

Thanks,
Bartosz

The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.13

for you to fetch changes up to 9860370c2172704b6b4f0075a0c2a29fd84af96a:

  gpio: xilinx: Convert gpio_lock to raw spinlock (2025-01-14 14:04:38 +0100)

----------------------------------------------------------------
gpio fixes for v6.13

- convert regular spinlock to raw spinlock in gpio-xilinx to avoid a
  lockdep splat

----------------------------------------------------------------
Sean Anderson (1):
      gpio: xilinx: Convert gpio_lock to raw spinlock

 drivers/gpio/gpio-xilinx.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

