Return-Path: <linux-gpio+bounces-16243-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14418A3CB01
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 22:10:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5060B7A5FA9
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 21:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABA924E4BB;
	Wed, 19 Feb 2025 21:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZmOgwUHp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4993E253F36
	for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 21:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999079; cv=none; b=CcyV2jtjVdevIO+wnGxMep4KtG/EH5C6UBX1yNP9O5PmUQ5u3MQcDApqBffJqI2Vf8CV32yK22HSvyDO6W/0Sm2e3fu7gVyLg2AGdWLBDbWh8RWR78/5Ff879efsoumfU31vIdhjE70xJsW83Re/jVNrsVSkYfYJdEYOIdx6G9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999079; c=relaxed/simple;
	bh=6PbmenX2LEeW8jN3Nn/1RlvBvwHpIFUxkkLC5NdK6l0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CIaKgkFSyiP1+JCQQ6ij38Oxe/I1jS8kygtqILxW30JVAZ2tozJHp7x3CLoXMSSV7uWHJMeqS9P8KQM/aMwNMGbe/GzCeILC8rOsJq4l8jAreQs64HBqOgDMij+G2KuE8ZtTj17ZIDeTwKN0RVlV7bqM7E3WTmUynOXp9qodN9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZmOgwUHp; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3072f8dc069so1752691fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2025 13:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999075; x=1740603875; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Qd1m4u7A4ptICedezSzy+OtXgenTplb/TDvgBRHVg4=;
        b=ZmOgwUHp0OxgLWithHRFHr/Kctbj1ce9lkJys/Qs9nSspurf2+1DoQvXIGQCo6QEtO
         5QsVqPoWmwD2sPJnCPvxw581iRY8zdKUxnuCNUCU7qVQwPJt9GDJsC8tICtvbDbh36ia
         At3dvK5G83t2HT8fEQo8sHfeovlqtK2sxY0ISgRR/YiT5/ZDwgIPMS5kgfqu/gbFjCc8
         hI+BUsfEytplo+GTDmaheLqY5+H4wef6MuN4mbsATTaL4+Ue8LMXKJql6MOnpUoqd96g
         XCu4L2k/+vgXNqvLlUH7yHBzkyLxjNvYXo9EyXakYGyOqojAR6xTrbmQcHUaBGFZSP0U
         5bzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999075; x=1740603875;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Qd1m4u7A4ptICedezSzy+OtXgenTplb/TDvgBRHVg4=;
        b=sJajWwn2WyN8M46HXQXS9tWro0+fS3H/RfQZxwojKT2Ok3fL8lsEPH6il5NYmvW31u
         XqaJKF8RDo7O6EhgKYOZqDwY8ZoH7790b+CL63a7fNztmi0Q+j/eKWfaIwtmogB4h5LP
         NzWVG3KzFvFqriBMdAhwRctZOg3fJtXJ8NV3YDjczyeL5SnZk+/EO0X0Bo5seMN1xN8F
         nFj16FaOe8dhlDidK5fAUm1di5c/iEGLTSxjVIZwTlDKBxlcuj9Yc2ELAgNhCRKCAAhN
         VmhXPLeN6sT05oqFVD5Xj5z4m8RRPfUtRqqqY0MockHiw9BlmAVRGVZtiim492rczBT9
         5ejg==
X-Gm-Message-State: AOJu0Ywzf+2o2KxFSdHzNTkiCp7ghV1VHjwhnLDZp6cGWEbD7RhidXi4
	Plttmn8uY6+zEL2iK+1HGm7ilSq8G//7l06Ckt5qEBcq3GNLUs31MJ+2R/ZP/eI=
X-Gm-Gg: ASbGncszQyG9J6mqK/b7MZWsbJZKicWym3TEhQuDJR8jbkiLvt6vMfAPxuO8In1EBiD
	DLyVS+UYUo09/h4pxHblEUCkRlgQxTen5/+8TYvlCHWsm/H1k36QPTH/VxVhgCc241KC+EcTFGD
	ZKxX2x3RyEFGvOpBTcSibG4488hBFU4BFtdYjuDFiwSqtowP7AVlOZbeZ2dY0JLJeakV+D2uwt1
	QB2Tj+GmpcNwTMHu5pkjuYoEsrEg5ucOWRmw/vpavbLrCgDCZh8XqsVlN+tzsEyJRjDpSsPU0v5
	yZuYjEH7xCtfESfzAwY0/9qKSw==
X-Google-Smtp-Source: AGHT+IE18SzMLwF3utlkSZJlOpCr66UsQEOcgJJYDVN6NXM/57M0cClIXolDeJb8o7FFzhwJQYeJ7Q==
X-Received: by 2002:a2e:7d17:0:b0:307:db5f:c44f with SMTP id 38308e7fff4ca-30a44dd63bemr16825581fa.19.1739999075258;
        Wed, 19 Feb 2025 13:04:35 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30923bc174dsm18977791fa.84.2025.02.19.13.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 13:04:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/2] gpio-mmio: Extend to handle pinctrl back-ends
Date: Wed, 19 Feb 2025 22:04:32 +0100
Message-Id: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBHtmcC/1XMSwrCMBSF4a2UjI0ktw9TR+5DHKTJTXvBNpJIU
 Er3bloQ2uE58H8zixgII7sWMwuYKJKf8ihPBTODnnrkZPNmIKAWIEueXCMFH0fyHK11Grumk+2
 F5eAV0NFnw+6PvAeKbx++m53k+v6Zas8kyQVvjDFWQAuoqtuTJh382YeerU6CfVsfWshtpVvpl
 FGobH1ol2X5AVz9FPLhAAAA
X-Change-ID: 20250213-vf610-mmio-eddfaeb6b197
To: Johan Korsnes <johan.korsnes@remarkable.no>, 
 Bough Chen <haibo.chen@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 imx@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

If we're using gpio-mmio with a pinctrl backend the
direction callbacks need to finalize their work by
calling into the pin control back-end.

As I was made aware that the vf610 driver was missing
only that to use gpio-mmio instead of custom code,
I took a stab at it.

This patch is made on top of Johan Korsnes bug fix (v3),
so it needs to be applied after that is in, if this
works.

Plese try it out on vf610!

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Use the port->gpio_base for accessing GPIO registers.
- Specify only GPOR for setting/clearing/reading the
  output, hoping a RMW on that register works with MMIO.
- Rebased on the applied v3 version of Johan's fix patch.
- Link to v2: https://lore.kernel.org/r/20250215-vf610-mmio-v2-0-4a91f8c8e8d5@linaro.org

Changes in v2:
- Use the dual input/output set/clear registers for output.
- Provide the BGPIOF_READ_OUTPUT_REG_SET flag so the driver
  behaves as described in the commit message...
- Drop the now unused spinlock (gpio-mmio has its own).
- Fix a speling mistake.
- Link to v1: https://lore.kernel.org/r/20250214-vf610-mmio-v1-0-6cccd0292e84@linaro.org

---
Linus Walleij (2):
      gpio: mmio: Add flag for calling pinctrl back-end
      gpio: vf610: Switch to gpio-mmio

 drivers/gpio/Kconfig        |   1 +
 drivers/gpio/gpio-mmio.c    |  36 +++++++++++----
 drivers/gpio/gpio-vf610.c   | 105 +++++++-------------------------------------
 include/linux/gpio/driver.h |   3 ++
 4 files changed, 49 insertions(+), 96 deletions(-)
---
base-commit: f751bf0670cbb166c58e99d57373765405178426
change-id: 20250213-vf610-mmio-eddfaeb6b197

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


