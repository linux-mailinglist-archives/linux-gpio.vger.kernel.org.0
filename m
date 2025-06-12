Return-Path: <linux-gpio+bounces-21431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251CAD7006
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0A803B0DE0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD761917ED;
	Thu, 12 Jun 2025 12:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D1Yji7qa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425BD2F4329
	for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 12:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730802; cv=none; b=OnUJeHArWDfCcQi7qyTvgjy1zRUe4mKcfjH09nw5ZQ2S23Jpb7b9fRki+giZy6dsPZ5EYyGTzZDQpDyQRCQnq9bwG4kaOdocXH5fyuxr0qhM1YVAemu6/IUuNl0d82OdZf10uyR5SkBWffN3mq0PvgSz1xJFS6VhVQrr0RlxnFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730802; c=relaxed/simple;
	bh=kJrff3jbL8por8Tpyh7XxSyhDvy3zxp3BXTzZOi6P44=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z2OKRaCXVokJ5rj3jyyloFMYLdwtYf86h800RUIRJ95h+PgMLYT0AUqYmB1zDkMd50GLFlXzBUi618RMBXnWoZbIJAGqIco5HHKIZCbPytYGakD/AoTvE3UG2g1Z8+IezLUUCxsspMPeeTaFsEkUtKor7/UpaYoHZEE3Gh48Z6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D1Yji7qa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45024721cbdso7364625e9.2
        for <linux-gpio@vger.kernel.org>; Thu, 12 Jun 2025 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749730798; x=1750335598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqDku5tmeH7VBmpeni41KVYBYrcGjn2Uv65bR/FXI+8=;
        b=D1Yji7qaWRdRwBq4I8Nk2fGXGc2NL8e2uZu2WZSVzoMHyKkoD+Vc4cHoxLFnl53y7f
         BFwpX3lZXKtSGouVNLxeDoy5nHc9eWPhHKykCjqUJky/pjnppQeFWFRpk7DZFxKN4s4S
         B2LfegavI5WrVThGM//gCRZjUkBcV4fqxlYp5O34wT1zgVPOKB4lsOG1Dd2AY8BeVxOR
         rJyDyWjhhm4fhYugPM6tB/ujIhMte7R/wzOzlJAkeqCY422Ei4Ps3h84dBb7ZCLt11fC
         /VaU8knDXjgSqLViI6KiuU4Zd9EnaHNjLgdItOy2/zYAlZE7enEOKqedKKY0Arx6WW3n
         +SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730798; x=1750335598;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqDku5tmeH7VBmpeni41KVYBYrcGjn2Uv65bR/FXI+8=;
        b=hJ8bNhmqejG+GRRE2RydyFj0vNBtXpQM+TK4Sc+fxOg/KJ7hqWdHQd7FiWAvO7BkUq
         9ZkBSAZg7GnV9RouptxsRudRf9MzvPCElDd5uMnu+KYY+O3szcj2CWF+FQ/M8uPxp6rU
         AGfHhlHiBpAJ++M1YmoTanXRP9o7r5EGyyp7tk0uzRexG6R8gRESfPS0lOdG5R9HcCkS
         /tMPO7WvD25A3zk/N+rGEgTjtS+5CG0quN2xkl0Qs16GSYap4vVyULluO+hbJZsIVxZH
         sNJohkUWytewyJGBvNVJ3Y9RS6qClKNx3/D5mIIAdr+FRFWTUWvIp6UrbW10hVrZd6aF
         gULA==
X-Forwarded-Encrypted: i=1; AJvYcCVK8whOnEVpmlRoqUALJ+O+neOgJPjvY6/Y89/JxAtswq5FoVpP5ce2bwuvHovhdm+YKrrk+gMhZHlh@vger.kernel.org
X-Gm-Message-State: AOJu0Yzviiny792x0ze4M+/Qyc+pBimhF/0eplSYOBz8n3rZIx9oLiKT
	hvLUbiRzE06vr3HirwEiEQX0+aESbMZSoTxJVjekbjUYztoKgmZHlWEDvAxUerCJrYE=
X-Gm-Gg: ASbGncuSTBlUcP9q5+wSn/dCbIWJXc4wtgJFHBeUfijkk+KW3kn9XdxBZRY6xIWQvZi
	PwnkyM0OxEx3aINnp+iQ0G4Bv8GEpZuN+UlTn85HOkgs3uF7TbzsVSCDBWMkoesxe4JzYZvGAQt
	uL/+rETBxxeTiVlYsQ9DDA0gRmv3LJ3sJYXOt/IYwrrCRj7LQLEGdKuCzRHxmyACFRgeaiLwdTN
	4Ueq9pOzvuQO3mUnzouAsq6XtE4B3KI7mnP5tnyGTGCoUNA5J7DcfXdhL4MqqfnlMvL05uXh8K4
	L0gyZcpN5t8Vbq6i5wXrTT0Fq4sSXxoPfPKRdTsRrsBKhgv2NLYoaant
X-Google-Smtp-Source: AGHT+IEcc4368CEgerXypRH/60FtXqn6RdvTllN0y6+FlWWV7W7CliDcgoBQka1h/OsUnGpe+1tckw==
X-Received: by 2002:a05:600c:83c6:b0:453:2433:1c5b with SMTP id 5b1f17b1804b1-4532486c53emr66764545e9.5.1749730798475;
        Thu, 12 Jun 2025 05:19:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c229sm19636035e9.6.2025.06.12.05.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:19:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] pinctrl: cirrus: use new GPIO line value setter
 callbacks
Date: Thu, 12 Jun 2025 14:19:52 +0200
Message-Id: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOjFSmgC/x3NQQqDMBBG4avIrDsQIzHQq5QuyjjVH0oMM1YK4
 t0bXH6b9w5yNajTvTvIdIdjLQ39rSNZXmVWxtRMMcQUxj7yXLHKgsquG9vOFUU2+7DA7OschyG
 NOeWQRalFqukbv2vweJ7nH2Kr0FxwAAAA
X-Change-ID: 20250612-gpiochip-set-rv-pinctrl-cirrus-2335675707ce
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Rhodes <david.rhodes@cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kJrff3jbL8por8Tpyh7XxSyhDvy3zxp3BXTzZOi6P44=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSsXpOXy+LPZCy25UzB46uu9Jfgc6bYrd209b6
 2WEdmPciuaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErF6QAKCRARpy6gFHHX
 cnr+D/0W5phOfwIzIXQ5w4rBcur8QmFg3lr7rYE15YDOs5OxGlUgbtQzwRcSQKXoWgOy68+M0jG
 G/qDNaxNNYpPWLjM6YYqpiRZCPW4JaIMwr0wbBClVjW0jucCHl4TMkCKKL52s7w1iVhtWm7MLkB
 pwsMZpzsmUJgwzkfq5I8yi8Halwwiftm2XUxU2KzLqMmqQqmcCaqcH6dB/I+7OXXD7KR6fLfb55
 PxnfC82VSUAFh2o8s2ZauD/a0HrB2E5LqXMK6X3qGpOyQGh8CR5ijTkGcHQXRxnyPJus+C5SRDD
 g1nfhDK6rCcqUTkO1fJkd/z7TTYbmm5xuSvjXBkgTo/OT9JQhjJhj6MWBrOYwaAKPHzhV2+T7jr
 6TxsRs1bmUY1LvUBkLz1eNUrlUjedlvCLlq02+p3Km8qTcbi5knGNLP2V/fs18DRsSwdmsBRnFQ
 zopndNXJw1EyhaNJIOKD869u+DgPDtOJGNdm4j1/3uP3Xyuqe2qXL7HC64g0VO9extFRskOLBoE
 bZiXsY+Y9rHReClvPtc9QFyvcuxf0DV5Uj26CrCFPKfQY835rpTPXk/sg0ajjjEdrQOT0qfDBWi
 Xz5Tl5TplI1ft6CxLpWodvBx1RESt0QPD66LZbhb466kn53uf5oFziu1VJzIkGo3O9tJnM+yaYD
 gDWT5ioayc4evKQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips in cirrus pin control drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      pinctrl: cirrus: lochnagar: use new GPIO line value setter callbacks
      pinctrl: cirrus: cs42l43: use new GPIO line value setter callbacks

 drivers/pinctrl/cirrus/pinctrl-cs42l43.c   | 21 +++++++++++++--------
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 25 +++++++++++++------------
 2 files changed, 26 insertions(+), 20 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250612-gpiochip-set-rv-pinctrl-cirrus-2335675707ce

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


