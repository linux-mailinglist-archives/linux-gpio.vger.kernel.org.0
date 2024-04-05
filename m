Return-Path: <linux-gpio+bounces-5132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5A89A3C5
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Apr 2024 19:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0341F236D4
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Apr 2024 17:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBF8171E58;
	Fri,  5 Apr 2024 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pedXjZ2M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634ED171E4E
	for <linux-gpio@vger.kernel.org>; Fri,  5 Apr 2024 17:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712339889; cv=none; b=WRzj9e76Dkfn6yXLNMoZB6sYCv82NtLaIRy7RdXhgU5FJhJgeB37PJbypegULQ62NMfsrPeQkuJkQ5hKhQrgsdYl77JKncfiwTyg3aioI5EDJm7dDvxDt3VQq7KgSNdDss17c+6mWx95/7NVlyUrCzEg5lTC+4GvQACBZfoWoQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712339889; c=relaxed/simple;
	bh=H5myzdzWlAUjMb0ryKASPnq9blH7D7/mKRGJPIfwGpk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u2ksVbYCE88BBwc/OoRRDWzAABC8iluqKh1jV37BrOrAw3VorQueRuZs99suzIouE6C7B+r5NqVPc8DzdmA7zrCapr4nO0LE0MKSv5I2fmSl0jCuMqitHRxR39Nlz0rpRH27FDvg4XrPCjFfL/YgdSuw6Rm34d3jPTaz3tUyNjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pedXjZ2M; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-344047ac7e4so55610f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Apr 2024 10:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712339886; x=1712944686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ztjXdzKTe7iNLjYo+NbZK1lY+kuiMYYFbOMFrJcZmo=;
        b=pedXjZ2MdLWhv7xbCIKiDIX8vsqkgiTSbg7GqCfdXh2ObZTwYxtr3e6iEBXt33jSoM
         UOrVSU9PN17FvAkFt0pL8ndDIcQ0d5lWqEMaIzjhoPVNWUzdwA81tidNzI0C2P3V1Fdb
         +m+SuIZvbNE5DlpVmGJh+viX42Xi4u4wemVAErJZnJqoopyU/wB3POYqgMHBbFBWnTEf
         Yc/j3CHzvkDIns3AQIRwwDHk7WOjEUqnTjxHKAf1KyvhkZpdQpbb5nPVzLKIXCVgrvHO
         dW/XI912r9fNGEDHblxb7waLNqyDe/dSfl206YombG+1W1y1nf6sP9VnThaDVLBC+8ey
         qc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712339886; x=1712944686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ztjXdzKTe7iNLjYo+NbZK1lY+kuiMYYFbOMFrJcZmo=;
        b=GmKdba46jwvBaf8bTpnnAR1Vbl1vFVkOfRKNn6HQZYKHfLYkXn5x2gc08zZ/T3DaFQ
         FWlE+/mbsG+vhfrfXZkCfA99b6TLbmyfV6oRLdhey4WS6UZ9aRdRUV7NB2zoit2kGlJU
         LBNWWNqUNmIzowSJOH6oGXack8K5rT5MbVwJVoyAPLJvyPJcv3h9qrMSgapdeW/7qeyL
         Gr3BmmmpLqjcaT39YzqBdl9RZxwe50URz6VJrIClk36TTSkfxiCbzpism8nSibI0Pq87
         1LQof20gzplw8trUlhEcRQ1F6171vBHi/z2DAJSiA7ZnAJQ1fPREWnC/AIICRplKrK9g
         Xl3w==
X-Forwarded-Encrypted: i=1; AJvYcCVDqWr/ObdYrC7dy0POo3S84aJdWO8JQA+V07mr7dAi9svsIWOH4Mivq3O4SmlcDLcrVAW2POtlJ5ugjsHl0NCZkT0qEUpu9x0rPg==
X-Gm-Message-State: AOJu0Yw1gex01YKSw7UDWvPHe0hAlywOg5cIpyEeJ++p/l/hBmiA7aEw
	hxBmPXBT5YAS321Z1+8cnwJyET2UCVxDbE6q8gzXzfvz3YgcVwgcuKuZkdKGH1Y/HATuPa9tnpQ
	V
X-Google-Smtp-Source: AGHT+IHaJgnTg1DBtlEDDj3TVd5kmqS8br+lAv+XxhzDWvToD9+k2Q+EpCTODpJ+VbsAPWrNjfmrZw==
X-Received: by 2002:adf:e9c4:0:b0:343:dde1:2ef6 with SMTP id l4-20020adfe9c4000000b00343dde12ef6mr2790199wrn.27.1712339885553;
        Fri, 05 Apr 2024 10:58:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:1a1:8979:15bd:93f0])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d4c8f000000b00343daeddcb2sm2534668wrs.45.2024.04.05.10.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 10:58:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio: fixes for v6.9-rc3
Date: Fri,  5 Apr 2024 19:58:03 +0200
Message-Id: <20240405175803.299328-1-brgl@bgdev.pl>
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

Please pull the following set of fixes for the next RC. Details are in
the signed tag as usual.

Thanks,
Bartosz

The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

  Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.9-rc3

for you to fetch changes up to 83092341e15d0dfee1caa8dc502f66c815ccd78a:

  gpio: cdev: fix missed label sanitizing in debounce_setup() (2024-04-04 18:57:08 +0200)

----------------------------------------------------------------
gpio fixes for v6.9-rc3

- make sure GPIO devices are registered with the subsystem before trying
  to return them to a caller of gpio_device_find()
- fix two issues with incorrect sanitization of the interrupt labels

----------------------------------------------------------------
Bartosz Golaszewski (1):
      gpio: cdev: check for NULL labels when sanitizing them for irqs

Hans de Goede (1):
      gpiolib: Fix triggering "kobject: 'gpiochipX' is not initialized, yet" kobject_get() errors

Kent Gibson (1):
      gpio: cdev: fix missed label sanitizing in debounce_setup()

 drivers/gpio/gpiolib-cdev.c | 48 ++++++++++++++++++++++++++++++---------------
 drivers/gpio/gpiolib.c      |  3 +++
 2 files changed, 35 insertions(+), 16 deletions(-)

