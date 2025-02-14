Return-Path: <linux-gpio+bounces-16053-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A73A368E9
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 00:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E5491893E69
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 23:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C65B1A83F2;
	Fri, 14 Feb 2025 23:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="StCHJ1Ot"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF411C8638
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739574771; cv=none; b=GXQ8PLMpmMANKhgMJIpopXA68glyCpgNcMsuSmWuleDEjeW5PBw3FuCojDWo5+i/D5QacVfnhqT/3gGpDE3e80bNCTbuNCS5EMzdK5VHBdpXnOkSvg59xZkC/5A2FAb6rUdNDBRUb7M5Zvh7SjEz1D9fwdO+t+5p4mnClLW8auk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739574771; c=relaxed/simple;
	bh=1HodoEsYvID1utfqD+WrCKo+0ulptHHJtuUpdZXnGGc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q07wosNUOO5Le5UDPE5u5C1j9/5UNp1iJmsEESd2gkJGkHtsHK69TcfghvZFgNFKBJt58i8uFEYIi4IpZFsWo2m0Iaie5zCnR8s9whTprmQRF8nOi0iuDqQnHZQ4pk1otQf1/r2vwfBFfboxYPpF+gGvH25m0uHqJB82Weh62co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=StCHJ1Ot; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5450475df18so2715515e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 15:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739574767; x=1740179567; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=//3kaILmAVCifLR+ZMBAtzVbHvcdVOa4q7e9Zu0PGvA=;
        b=StCHJ1OtOfkV5IeDj3k+qmTdYF7uhnZDR4JWu5jI6/fW6f7ldagKbMKOJQD6BofYA4
         V4j6RvENm5R3k6VXtgBNIY5z1WsvI6uizDQyoBxZDUzEYQOC0YkoHb0htSZfhyy+ru4E
         SvZJx4uBYxkSGaPf143xki9wz4kWL6eMf0l6M55iQT7bkIx+bIIzv1zjZ8iDodVpoRfJ
         pmSdM9HnYj/KXYA4L5JcqQXCKPxw122MYZVgxxo+jmW+ZlkW7VEyEZ2QqAVB4fxZFXiy
         yDRMAmvQ1Ie7mMyu5c3RBCDkiBn7nTPJd5Py7DHIC7B25M0+/jWLCuTkricZeIuiwacL
         USMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739574767; x=1740179567;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//3kaILmAVCifLR+ZMBAtzVbHvcdVOa4q7e9Zu0PGvA=;
        b=V2KPJB1mVA/Cm3c1U83DKOOrw7dmMM01QjXYCxbR9XwD+HjuA3CHIJli78zxK7nNu3
         QDmqKQFoLCgNuePKin39cpJVisC/4pSK9ib4thkZAcaeirjAW8gNyplvcvhaf963H017
         5C0/P6Ec5DWkStqOqKl4nDcRGCn82/gHoZwly6VzlRyq4YSlh0wqn2aHoG68fCChuBev
         PrcjHNNUHnwM2wLrjGdbVtAn2dz3xGenkrIY8myR9J3P0XmblrFfRguC57+mVm/V2Sxx
         wb1B5FZkRetBp36QJe4vdVLbjUwXuQi4A1lp9/Gp4KA25BDolsZ1ceN9tHFGGFWjTiuA
         Xlcw==
X-Gm-Message-State: AOJu0YynS2ixdVY5FBDzkXBlpN98pRa9XdUfvuWEjN6AF5ZeQUOOpnKY
	HcyhRIu4V1iSoEThdqnBHI2tbeoNnai9ebjEoz+NaIr4t0xCMqu+Y7x0xcIgohM=
X-Gm-Gg: ASbGncsWyfCqIuJz4613cPDXMFv7ylBDrEnt1dkmyjy/AIrsxU2kPXTDCvvYAvdjbnO
	Evi2sLIk4LQkary0DRQeAGVH6ij3jPahg92gm7DuyNHonzIqkuz3Ccw/5W3jJ52mqpZab2YCyxU
	lKA66s53Q32C5DkgtqE2qILhGshUUumQMnLfPkE1NJmUoOrZZUJTdFAtGju38MNJy4CZ6qZfg+U
	YT3rGWtOllUK7Rb9CTNULtgkMyq7yHB2PuV1UZS/cXCZGZ54oKTI9AhP6/GMIQQ8Cf7tH+KSxXv
	RSAb+0CeUTZ9iST7ryvaqhXF7g==
X-Google-Smtp-Source: AGHT+IGd/KOnanlyObtGQI1NfeHu4pY/roPX3rU9GRBVTaBzLAtz1ji+zH2PWmWglvfwspa27dyY0w==
X-Received: by 2002:a05:6512:3996:b0:53e:3a7c:c0b5 with SMTP id 2adb3069b0e04-5452fe26b9cmr383538e87.10.1739574767246;
        Fri, 14 Feb 2025 15:12:47 -0800 (PST)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452f676aa5sm158515e87.50.2025.02.14.15.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 15:12:46 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/2] gpio-mmio: Extend to handle pinctrl back-ends
Date: Sat, 15 Feb 2025 00:12:44 +0100
Message-Id: <20250215-vf610-mmio-v2-0-4a91f8c8e8d5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOzNr2cC/03MQQrCMBCF4auUWRtJYo3WlfeQLtJk0g7YRCYSl
 NK7GwuCy//B+xbIyIQZLs0CjIUypVhD7xpwk40jCvK1QUt9lFodRAlGSTHPlAR6HywOZlDdCer
 hwRjotWG3vvZE+Zn4vdlFfdcf0/4zRQkpjHPOS91pPLfXO0XLaZ94hH5d1w/o4X2ipQAAAA==
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

This patch is made on top of Johan Korsnes bug fix,
so it needs to be applied after that is in, if this
works.

Plese try it out on vf610!

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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
 drivers/gpio/gpio-vf610.c   | 109 +++++++-------------------------------------
 include/linux/gpio/driver.h |   3 ++
 4 files changed, 49 insertions(+), 100 deletions(-)
---
base-commit: 8e2ad024bbbbd1add00e9ddc4aa943d3a27fa146
change-id: 20250213-vf610-mmio-eddfaeb6b197

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


