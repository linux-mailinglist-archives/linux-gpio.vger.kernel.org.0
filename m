Return-Path: <linux-gpio+bounces-16570-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 860B9A445BC
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 17:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B66519C64AA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Feb 2025 16:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712EB18DF81;
	Tue, 25 Feb 2025 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4EsVQ+K"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5A91624F7
	for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740500152; cv=none; b=imsZOwtc9VSSUR0NlZ74k6t4Kuuk6BtZ7ZFvpR1mvwF3/s14so+0mPbGv/FoTX6d7O2J2tUKr2GpAcgFBpvPh3Xuxn0TWrUfvzmrvi8Z1XOVR0XE0CiuZWRQ/3sfRriCg2mmRKhPojR9Mh3e0nI1vwC9+kslhtTYFdDGZVk/94M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740500152; c=relaxed/simple;
	bh=qiRG4jZ6oRGcl3fPvlgBnVduisLVRerw1nnxQkq92fk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FpmW/i87ggwecemD8in9OMVTwPuvs8g6GYsKW8/e2QlP3y5FuzRMxzKakolwO6A7APUwUJ/cTPIFYwrwuWUcywdcSbDUaDIpxZXdtp/LqZoJs/iPu6+8G9v5+09NA2eoFgGLpdiFkDuRXA2P87XSP/SujXqQwFu6kuN6U6Zo+7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4EsVQ+K; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-543e4bbcd86so6654326e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Feb 2025 08:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740500148; x=1741104948; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6QV46TQbbowuZaidKwQKybXS8KlFzTUfykk67zDNY8=;
        b=o4EsVQ+Kdx2rVS1vTH8ULPhnT73KzX0nbtevOuOL5pUrU6JZyH13vTINYrVaJ51jnv
         G7cU5gAcNYskSUJlHv6HJfGdhYn9urr9yJFqT0i47mxXy4zCylXbonpRcWuWHiczx7RJ
         lxUkLyfgopEKnCe980y4zlQuQSxuKHKlsrh5NyON2rYaeGxFBtObCeIrZp+NMa59VYPJ
         U2ml8EZeLKrnHA6nl0o6uRHhY3GHPz9S+3fVowNnDkVktgwVjiO04+aTzyrkyNMfpKvM
         nCCcvlylWiBMdgCzbIh1zjsWCyFDs4DfrZ8Ojr1Z6WCK5Cz33Tg5Ca1afTFhKjtrmis+
         70Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740500148; x=1741104948;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z6QV46TQbbowuZaidKwQKybXS8KlFzTUfykk67zDNY8=;
        b=oagNg+LdDnHjl3vyTVh+Xp5wFsWH0o7JD/BFT3Nom3co1Pj3OJoDW7k067ukfpiB6V
         QHS36Js7fSYp66k9VLRjF54UxYhhqxdLSS/AAFfJ+7lsvkc/2h7pWHJVM0THd+iNPUZY
         eJWCIWMUcB1e298bHgktNT37AjKjmUYXuvRIjZ/f2586a/9DEauq+/e7dlGj6VwR8qZ9
         1pGG5sVsdjNGIemRyG04qBrDDl4sMyMSJaLVYx0vB6M1F5g1tnaU8oWc+lynn6UbXzyq
         PPHMkpseGw7N8PGQiWkg4g7/MA8CAliTvvDcpbaEbH4NwCHa0sLfFnCg1iPhpaXXE5de
         f2WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK7W2yN2gFuVqdy1k2SZ9x1CHxal9xIvQyVcfYB+hA/0KLqf2B47/ly2mTCfYqW0ybmUmNagWjHyzM@vger.kernel.org
X-Gm-Message-State: AOJu0YyNGDhA6a3UbD2vhqT6PcTcstw7VUgSJoqlzciR2Eh6CaVsG6eQ
	opD+4HO7r2nRQrIwjlak/tSs99bfzPuR4RvtXsYml6tVbPIipt2lUMiChDY530k=
X-Gm-Gg: ASbGncvKoHJkOgbFzUR7hD9MYYAfQCsrpfNFi/i/ZBumCoC/hgi12kC5osfhCFkk1qf
	J2wXph/jJN1eQYcuWhLR518cs+PfQ8z6kvpzzOfrNzzniMkRzYsizsXDW7xExmXSiQ5m8jtTn8p
	FtSEr9NrdCN7ChknXfThpBFpmzvgAUt3NQWPpXXG7x+V29DdiGLPgQye1XGDr+Ru8SrZanz4VV7
	gBPEArVny8zvssOQuEVvIjIeRQ+GOmlEDoiwmnwZknLmPHLRqN4+m9LanUVVC8HVhTC5YwQVx8l
	brQvy1LoLQf+b0e0VEPiXJBdVE6xaV6mnC0V
X-Google-Smtp-Source: AGHT+IFn5GUKE31nP7tgT7niJ4SWR4mxLNvOZVrLeT7oIthbVOOg0Ui1M0Y4d9f4fXVVzIRrZZQBmw==
X-Received: by 2002:a05:6512:304c:b0:545:721:b7d1 with SMTP id 2adb3069b0e04-54838eefe80mr8602073e87.15.1740500148372;
        Tue, 25 Feb 2025 08:15:48 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f512dsm212587e87.178.2025.02.25.08.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:15:48 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] gpiolib: of: Handle threecell gpios
Date: Tue, 25 Feb 2025 17:15:45 +0100
Message-Id: <20250225-gpio-ranges-fourcell-v2-0-8da9998fa976@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALHsvWcC/22NwQqDMBBEf0X23C1JRJv21P8oHmISdUGMbNrQI
 vn3RqG3Ht8M82aD6Jl8hFu1AftEkcJSQJ0qsJNZRo/kCoMSqhFKXnBcKSDvTcQhvNj6eUbdaK2
 NU/LqDJTpyn6g96F9dIUnis/An+MlyT39CfV/YZIosJdD7frWalG395kWw+EceIQu5/wFyb0vx
 LkAAAA=
X-Change-ID: 20250217-gpio-ranges-fourcell-85888ad219da
To: Yixun Lan <dlan@gentoo.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2

This adds some code in the gpiolib OF core to deal with
several gpio chip instances per OF node.

The change was prompted by the need of the Spacemit GPIO
controller.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Fix a speling error in first patch.
- Fix coding errors and documentation errors in second patch.
- Collected review tags.
- Drop RFT tag, this is for applying.
- Link to v1: https://lore.kernel.org/r/20250218-gpio-ranges-fourcell-v1-0-b1f3db6c8036@linaro.org

---
Linus Walleij (2):
      gpiolib: of: Use local variables
      gpiolib: of: Handle threecell GPIO chips

 drivers/gpio/gpiolib-of.c   | 126 ++++++++++++++++++++++++++++++++++++--------
 include/linux/gpio/driver.h |  24 ++++++++-
 2 files changed, 126 insertions(+), 24 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250217-gpio-ranges-fourcell-85888ad219da

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


