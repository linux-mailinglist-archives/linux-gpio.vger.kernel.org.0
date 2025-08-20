Return-Path: <linux-gpio+bounces-24607-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C9EB2DA73
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 13:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAEE91C473AA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 11:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB992E2DF7;
	Wed, 20 Aug 2025 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BMc5CsDl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2708F17A316
	for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 10:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755687587; cv=none; b=DaxzJz183FyF3W5qE8rLVl0Y3J9kp/d5XsD8W33jhemKyJc3YSM34jJ68+F7zFA/GGbn7H70MBoDyfYqJI894e87E9f3os/O9Utq8KdUTvbr0iHzmXvccQ6SBxhmp8XnkqCHXZ6d2aGqnxBFohPmhMD7HpbhdfxSzTY2yePn0OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755687587; c=relaxed/simple;
	bh=TWZDGkbhMcuhXXzU+zf7/2XfecMUMguBI+bq+5KH974=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oLKqxsJRtc0eWG+24PTzpOoFS9fXya/XIhlOCbtjeXI5jTHLqqyT+RwiwAmIriwMqoTZ9uUGcMd4X6Cnlzvobr70GMhvV6Guk1loraEsEfSub4gotRM9uoJAG5NIuoWIqH4plfYUzYcU0dN+vDZSs6cXQGqGx7FK8ApaB62algs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BMc5CsDl; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55ce510f4f6so6733439e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Aug 2025 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755687584; x=1756292384; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUAfPvLFYAkc6CMJY147Fri1xsOKEAnRwMPgaXAsxZ4=;
        b=BMc5CsDle/fuJYs5/B7d2p3fgr7aP6UPgsyyNEiVxqoTqAgHnA2WB+eLOWIiiU1AOh
         sWHehA33bToaR8Vu4nMBKWL2sakKykixrqgjjLdw+VDOgren7ZaIiwrrQATKgBwAUnBS
         XnIR9Qkxb9EFMkVmrT6mQqXk/KZv6w6rBZ83MykKlBEgGoZTYbIBtxooNPQw26oVrWgu
         sYAE5V+tDmsXkgxxV/WxcSYLLJCP/ASKwWMGC5NzKWVEEq/aDZnXJTlvEwJhaW0iJIbK
         ujltn9rItNpk06YQO7XdCDjTFP4Np1kiR2rd+cjwkpe7H+r8Cqjwliv0C1NkQ4pI+07a
         wGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755687584; x=1756292384;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUAfPvLFYAkc6CMJY147Fri1xsOKEAnRwMPgaXAsxZ4=;
        b=EqKfloD3LCpAPfEZSDr9QNY8AWCO/AGP69EKoI+4pmJsIIyTht8ey+5flXgYDP+Om1
         VO3wC3Xk65QeQdYXFdKQyX7K4jYAog0vlvAPwgIbX4ftRdTm33wQFruJdb6rkb5z/Hka
         qggjwJMMQOsZkVqYM971JBzzxIowU9hmo6VLwXJdYLcIb5fhoatUeCs2OqGHau+EY3pn
         e3OYvJlGVqIxPD+rL7mz5uFxxxU3MZWC8emCOeS9V1/2w6TIM76Q1CzjGnNXlZM57YA4
         tJ9UtNVn6JH72SILQU6BeEg7jzgt42eksoLw966WMWsMvmHj2naJKWagoy6bCs/HyXzT
         RyHg==
X-Gm-Message-State: AOJu0YwBBtayvbCxy/gZx7R2ULPX1ijRwC/9kUKTiVcSU/1uvPug8veh
	ut23dmbSXOA6AnvlwJdzhMe1A/Z3tGYpfku81u9dy6jAHcWwH6xInxxkcVblDSjvdKk=
X-Gm-Gg: ASbGncswmuMKEgvJ3ugOiCbikNMO4Xh57+XDi3lJTK6WAPx0gg9YwErOVtPFDH+ZTE3
	/cWoUfeO/XO2dW3qPTRDC7Jc4l/EDFWjQp1Hsmt2cnUAE+00FkRRA7J11eICWRF2vUMmNvhHxYd
	ogoqGnVAZzzxklBYMD9rTuhChPcRrpcgCVygZ7l44ch+DFYGSLo7C/ixqygyS9yCJXyaUYdEKr5
	KRUO+hMoJsC4Gm9CqwKUoKLxJmmla1QxyH9JDiBwe3ZOMxaz8apTD6QYOAbO/tzSWRstus4/bln
	3bXw1kZSIwcA3qHIqyiMGJHefH1+HVgTORldq7Q0m6YKcOImTuOesO+hbl/pJfDx4mY/duYmC8T
	lu2vJdZ2LhrxGvVcWYWJdsKU4OHFnXuSc
X-Google-Smtp-Source: AGHT+IFYbR3WeFTK0ooUHD1L33Dezd/U7VscLXaIJmNH0mR/jZ+qUo9jkoyY+oTbkCllHQnE83p4Gg==
X-Received: by 2002:a05:6512:15a2:b0:55c:df64:3780 with SMTP id 2adb3069b0e04-55e06bde67bmr772860e87.50.1755687584094;
        Wed, 20 Aug 2025 03:59:44 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef369843sm2518285e87.60.2025.08.20.03.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:59:43 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] gpio: mmio: Support IXP4xx expansion bus MMIO GPIO
Date: Wed, 20 Aug 2025 12:59:42 +0200
Message-Id: <20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ6qpWgC/x2MQQqAIBAAvxJ7bsHEUvpKdLDabA+lKIQg/j3pM
 jCHmQKJIlOCuSsQ6eXE/mky9B3sl30cIR/NQQo5CiMFcg4qZ6QN75s9utBghDHqnLS1k4ZWhkg
 n5/+6rLV+3taqVGUAAAA=
X-Change-ID: 20250820-ixp4xx-eb-mmio-gpio-80884f67aa67
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

After Florian reminded me to do things properly, here are
fixups and additions to the MMIO GPIO bindings and a
tie-in to the IXP4xx expansion bus memory controller.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (4):
      dt-bindings: gpio-mmio: Support hogs
      dt-bindings: Add bank width to Intel IXP4xx memory controller
      dt-bindings: gpio-mmio: Add MMIO for IXP4xx expansion bus
      gpio: mmio: Add compatible for the ixp4xx eb MMIO

 .../devicetree/bindings/gpio/gpio-mmio.yaml        | 37 +++++++++++++++++++++-
 .../intel,ixp4xx-expansion-peripheral-props.yaml   |  5 +++
 drivers/gpio/gpio-mmio.c                           |  1 +
 3 files changed, 42 insertions(+), 1 deletion(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250820-ixp4xx-eb-mmio-gpio-80884f67aa67

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


