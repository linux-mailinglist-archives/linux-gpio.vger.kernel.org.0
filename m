Return-Path: <linux-gpio+bounces-15970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0727A35203
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 00:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93379162A60
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Feb 2025 23:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4540322D781;
	Thu, 13 Feb 2025 23:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JzVC3xyn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468242753F3
	for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 23:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739488141; cv=none; b=MgiT0rLSLUkLQ+lQYNWyuoeEULkdvt2wsJ3hc/JVj6gPZ+/hFIoZNonD3YxYMMPOWMWbejAWuZsrEWXkuMtNevxEtE1/MTFcmWj6nInLhEjdioPNAJthASo4Uwc4lJvWl+KkdG+a/pmcLmH+K/CKAHuIzWtAp/16A/DOCWVipEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739488141; c=relaxed/simple;
	bh=BFyumWfcyahYmYjy4LKWbFCLsGmAGfggdhQnzVUMiBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TtKWDvlPHqAtpcVhrDHPP0BxLo0P+qaw0qHqzE5LcjkbZQhbnMR8RkhWydOYXYz5XR/82272z28YD+ntLN7+iC8wdnL505FTzfqKbRdLXpqlr3/wmbhwzmJnx5uze3nehIce2ZFxbhTdepk7Azo4/IEMonZMuDK1SI1JQhH1xC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JzVC3xyn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54527a7270eso106787e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Feb 2025 15:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739488137; x=1740092937; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H4tCsscKn7SUn3tT9L69AoekKK+pK8h/lCNN9v8z9sY=;
        b=JzVC3xyntyvykrjU56Bif8Ax3rF7PDwVMxcLiLOzwafDirpWoBUj0Urh+MLBFMeWoj
         dsGue0f1ROZqcQFbTIcosyEdvqiDq+mVSAYPBtGL4MPimza1FhEcTRVhzE9I5Guvu50R
         Yrv+48EPIdmUNRMuHDPjIm50F0Ca4Fy8xA1BwzU6QGnk33nq/vhw6ZwAHVygdkca/T+n
         I32s5V36xX6fqMFFYSKxI9O05p80/vrogAu0lHpvHnx6GsJaD3aQbhWBa0jiw9CLqv+v
         kMu2qkLx+XafwXoV19Z6gI40C8GaPkMLZmHEijWMgJxpXighQ8nD0aCPzYaURUpUZ8Tk
         pMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739488137; x=1740092937;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4tCsscKn7SUn3tT9L69AoekKK+pK8h/lCNN9v8z9sY=;
        b=krjEgA/oFf5QyRWLwZcTJ48dz18ky3QoOVIYEUvxDryNVgDs0wmGGV6fLOPVrL0Iv2
         QK8w9qFKw87n11xKs8BuQjIDsIJ472ia/rV7nHmwkYKtkTHSwm/mRbuVq5CuQ73jRKyX
         Q5AckP/YDsvZ60Wv/9bXhuyhw3tb2wfKGOeEPeTcoLV+EctWIyZgt3/xQwUnbsIVFWMr
         WAgDaMl4obf7n1zD/oAIQ9Zf4/tvyH7+MGZjybAENjVpbU5rpPnC18MGUfvkYfsZq1GL
         Y/oHQiVEwxurPDuvq94k7iQSm5coRxvyJEoHgD0TCUSAoYVqZEJshQm9ztnidkn7dAQo
         OjWg==
X-Gm-Message-State: AOJu0YwC2NFVi5tGBYrskWTe/tJcZ+zSlnrWFnmLFyGBwevAQkrk+1K5
	Fig5l4repXwSe0ewXi6Qve+cWNwTu1yj3Stcn3WwzJ4ejYAdmsN7lWjsd6dB1PEP09ScP2W8/0N
	1
X-Gm-Gg: ASbGnctOMbizgr0nYZJV2JLk/1TtBjdsKEA4xBJxgWQX+POTaj1CDM32m0Pa39EFUHz
	wFWajGUQkIoBMZDcrhiXnk4Yat5Z42Bvl9QLJlw4qOAA8vXTLntJvCNgum5OOHApxt048fcHQNv
	NviZxeAG5zAH/fEp5/hdWIlEvQIj0harOmBg2HaKAKdrQN/i/Wc6YB+lCx1IE5laPWkuPkHGX8Q
	STt0RF4QGHdBsxWP8cQIXFrCWcRrIkLgrV+ACxz+rYd8U9LuQanIjW0PHbcWI8RhWQWAFrRZckZ
	uEPRP3mirYCehSjXuzhgj/vXOw==
X-Google-Smtp-Source: AGHT+IFfIbKOt2SUJ3q0d2mMZMBu3uTGhj6wjgGqGBKIa5DYoR5LuWU4T+UdB/GrD04t0cQEapgcjQ==
X-Received: by 2002:a05:6512:3d23:b0:545:981:1bc4 with SMTP id 2adb3069b0e04-54518189498mr2672941e87.38.1739488136819;
        Thu, 13 Feb 2025 15:08:56 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54523070a9csm155943e87.5.2025.02.13.15.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 15:08:56 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/2] gpio-mmio: Extend to handle pinctrl back-ends
Date: Fri, 14 Feb 2025 00:08:41 +0100
Message-Id: <20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHl7rmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDI0Nj3bI0M0MD3dzczHzd1JSUtMTUJLMkQ0tzJaCGgqLUtMwKsGHRsbW
 1APhIkVlcAAAA
X-Change-ID: 20250213-vf610-mmio-eddfaeb6b197
To: Johan Korsnes <johan.korsnes@remarkable.no>, 
 Haibo Chen <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

If we're using gpio-mmio with a pinctrl backend the
direction callbacks need to finalize their work by
calling into the pin control back-end.

As I was made aware that the vf610 driver was missing
only that to use gpio-mmio instead of custom code,
I took a stab at it.

This patch is made on top of Johan Korsnes bug fix,
so it needs to be applied after that is in, if this
works.

Plese try it out on vf610!

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (2):
      gpio: mmio: Add flag for calling pinctrl back-end
      gpio: vg610: Switch to gpio-mmio

 drivers/gpio/Kconfig        |   1 +
 drivers/gpio/gpio-mmio.c    |  36 ++++++++++++----
 drivers/gpio/gpio-vf610.c   | 100 ++++----------------------------------------
 include/linux/gpio/driver.h |   3 ++
 4 files changed, 41 insertions(+), 99 deletions(-)
---
base-commit: 8e2ad024bbbbd1add00e9ddc4aa943d3a27fa146
change-id: 20250213-vf610-mmio-eddfaeb6b197

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


