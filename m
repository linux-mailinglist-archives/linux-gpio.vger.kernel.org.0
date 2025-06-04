Return-Path: <linux-gpio+bounces-20990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C11CAACE12C
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 543C33A84EB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3B119ABAC;
	Wed,  4 Jun 2025 15:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVbZLGlz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1591717A316
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050748; cv=none; b=irlzQpk1ZW311h15UOIdDXnWvNKlcLmadD45swCREKFZjGSUl5SbhGBm9bdM103WU7T6YQ6toCr5tfQdEvTD9B8fcBwoGaVtt/JgX4ovmDiIy8nmRruvkvi2OaGZ0nyGmV2Ez/1f1a4a0NEAdkaJ/ky3gGbE2wQIXaLAOInYoSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050748; c=relaxed/simple;
	bh=isbY6m5bcY7s9P8U97tjZbqw2x3Sh9LSh6vgbTeTAd4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y2NHKeJ3W94/LoKrGdaYxl3gXEDd92A3WVGsRvjywUAIwCuzMBCkkNfaLqVfGdZVesvbSQ2Neepy4zfeEG1tqu/90v4y7DfXr8dGxq5HXAgoK+JR+MenkRIdynEQj+vNVK9iqFB6BlTypTG4mbpQFPlZ7B20+fAMldwMn/btweM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVbZLGlz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso11559361a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050744; x=1749655544; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Mjo0DOx9z6CkyXriQUpR9DCtiHO7VQ4yQ7cb2Q1zps=;
        b=XVbZLGlzRXRSfsnJMhZMh8/2nCcbPsq7nXU3E3x1R0OsodCLV0uCNaGw65o9Dywc6h
         3TFfECaNambjRaD3DB+XlmEZGgbmugpV/SZEBRL6GVso4QoXcYwhUnlmJTGjIrzi3bcR
         jngPlvdL+2dpt3Gb96E7ZP+iXaLyp+uG5ZUs8l/WhMH8Bm9d3UDSL3RttaXC3wq1bGuD
         S/5dTn6iXCld9OFfj+Qr8CGuE1I8RgMJ6mzHdhF82wLaA8oNJAVBkrsDZZVlNALajcnG
         dsnHR6Ql/h5QLT3lJamlIgLMiLwY+AaK3rWENfXTjpve0WRzD1dyq1nXa5SwccW6kvLc
         uVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050744; x=1749655544;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mjo0DOx9z6CkyXriQUpR9DCtiHO7VQ4yQ7cb2Q1zps=;
        b=WKn79BEDuYH5K9wutUE8CKJ74KnUyTBD6QH+soHy6ilXesATtvX84r3C1E5R8WPqwc
         7i7zBc8ZtZevvJbcn3dqecawitZFFPgWYkyGrQQhQEteDTm2WrCnC1Fz2O4iAQanrEuR
         uHpUDFQfKTvc70XQOHz6vFAPZcqMHfadi8kCjP8PfPBwZuXQIvWO31S5ot3eXJ6kqYIQ
         pB/nixiUk/ijGs40AOLSbjekhn9Ui4hT0uhRnzxUogaK7ZDRh4FXdeIU/6kt7mM6k2O1
         yctvr6W1Nl/yT9r01/P11xiFq0ZLkN/b20jaT+/5Zrrz7sPr/fuhd3bumZod3oiHjMPF
         YjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl32fqQdGUgXlq3VUtFVd+TRm8aio0MpUjQISgFE8kGxdVSG4gaezej5jiLmBUeXGxcgEx/Iliirg/@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKI0P9inJ/gRmXFbsoJc4IJ9NfqGIWb538u97Ru/YisSXAsRE
	Bx/s7udabBpsGV7yeYnba09vti5yNndw+Enyrtc7TOKOoPjk4UldDtfvuP9f2DO48m9hHE+C4Xc
	alhi7g9g=
X-Gm-Gg: ASbGnctUjZuYR/xXJb5nP8r9jUwpiZCQq5z90G/0DD1XFZbhx1Dz2BHMOp8Myr0yFUm
	MgUR7WBRTLX5UcFweg6d8NSZ/q/TyEFXhm4VNB1acfDDzUGontaRYUporHMbIAdcESfWKvEPCei
	SX6LJ0bD2z4XDRVcN5u0QsJFi4SvRTD7k1J26EVVh/TLKgqmzIOqxbrc/jV5yz4/Tbo88PPhp4Z
	Pf2sSuDaqXa85KrgL0XtCb15AlpF4uXrVFnnfEvcEQVBN1Io7g7NA8iv3MSAZ57QSL/liduY3ZZ
	4RImPnw/tl/vPJ7csjhSfjhqQUyuLHDQuHroWKXprMAzqHorsYxaw4QpldxRZB7WFzm00phJ85Q
	lcbD0nyu9PV0G23v1Aclf4YIlijuZMUlPED0=
X-Google-Smtp-Source: AGHT+IEsfd6MId7vxmTr6lUOonqiY+rpdnb7nQfDQA/Fz1+gfc7G0MeiG2xYshTRerLuSnxWlq43jg==
X-Received: by 2002:a05:6402:35d0:b0:601:fcc7:4520 with SMTP id 4fb4d7f45d1cf-606e944f274mr3150956a12.4.1749050744290;
        Wed, 04 Jun 2025 08:25:44 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 00/17] Samsung S2MPG10 regulator and S2MPG11 PMIC drivers
Date: Wed, 04 Jun 2025 16:25:39 +0100
Message-Id: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHNlQGgC/x3MSQqAMAxA0atI1hbaOnsVcVE11oATiYog3t3i8
 i3+f0CQCQXq6AHGi4S2NcDEEfSTWz0qGoLBapvpXCdK7LJ7cytGf87u2FhU4VLTl0lVuW6EEO6
 MI93/tGnf9wMRl45WZAAAAA==
X-Change-ID: 20250603-s2mpg1x-regulators-7a41c8399abf
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This series extends the existing S2MPG10 PMIC driver to add support for
the regulators, and adds new S2MPG11 core and regulator drivers.

This series must be applied in-order, due to the regulator drivers
depending on headers & definitions added by the bindings and core
drivers. I would expect them all to go via the MFD tree.

The patches are kept together in one series, due to S2MPG11 and its
regulators being very similar to S2MPG10.

The Samsung S2MPG11 PMIC is a Power Management IC for mobile
applications with buck converters, various LDOs, and power meters. It
typically complements an S2MPG10 PMIC in a main/sub configuration as
the sub-PMIC and both are used on the Google Pixel 6 and 6 Pro
(oriole / raven).

A DT update for Oriole / Raven to enable these is required which I will
send out separately once bindings have been OK'd.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (17):
      dt-bindings: firmware: google,gs101-acpm-ipc: convert regulators to lowercase
      regulator: dt-bindings: add s2mpg10-pmic regulators
      regulator: dt-bindings: add s2mpg11-pmic regulators
      dt-bindings: mfd: samsung,s2mps11: add s2mpg10-pmic regulators
      dt-bindings: mfd: samsung,s2mps11: add s2mpg11-pmic
      dt-bindings: firmware: google,gs101-acpm-ipc: update PMIC examples
      mfd: sec-common: Instantiate s2mpg10 bucks and ldos separately
      mfd: sec: Add support for S2MPG11 PMIC via ACPM
      regulator: s2mps11: drop two needless variable initialisations
      regulator: s2mps11: use dev_err_probe() where appropriate
      regulator: s2mps11: update node parsing (allow -supply properties)
      regulator: s2mps11: refactor handling of external rail control
      regulator: s2mps11: add S2MPG10 regulator
      regulator: s2mps11: refactor S2MPG10  ::set_voltage_time() for S2MPG11 reuse
      regulator: s2mps11: refactor S2MPG10 regulator macros for S2MPG11 reuse
      regulator: s2mps11: add S2MPG11 regulator
      regulator: s2mps11: more descriptive gpio consumer name

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |   44 +-
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |   87 +-
 .../regulator/samsung,s2mpg10-regulator.yaml       |  147 +++
 .../regulator/samsung,s2mpg11-regulator.yaml       |  150 +++
 MAINTAINERS                                        |    1 +
 drivers/mfd/sec-acpm.c                             |  213 +++-
 drivers/mfd/sec-common.c                           |   22 +-
 drivers/mfd/sec-irq.c                              |   67 +-
 drivers/regulator/s2mps11.c                        | 1144 ++++++++++++++++++--
 .../regulator/samsung,s2mpg10-regulator.h          |   66 ++
 include/linux/mfd/samsung/core.h                   |    1 +
 include/linux/mfd/samsung/irq.h                    |   99 ++
 include/linux/mfd/samsung/s2mpg10.h                |    8 +
 include/linux/mfd/samsung/s2mpg11.h                |  420 +++++++
 14 files changed, 2339 insertions(+), 130 deletions(-)
---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250603-s2mpg1x-regulators-7a41c8399abf

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


