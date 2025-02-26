Return-Path: <linux-gpio+bounces-16645-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD43A4686E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 18:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9F043AD99C
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Feb 2025 17:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF78229B36;
	Wed, 26 Feb 2025 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J4VdmL0M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF2A229B3C
	for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740592287; cv=none; b=hZ/wpeIcnC0KqGW0NUJ2s+jzAnEYTzRfa85WouKdqJjuZH76n6V7OrGZVNSDEMbprBrStcoOY6wvnExlN+xsXI+yh8bnFhQ3CDNLjHZrLdwqarS4gVdH6QGShoR1sQ7X6IZyZXXU2IX/cDwwSSKGe9GbGAjiS0WAMlwmG33aAZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740592287; c=relaxed/simple;
	bh=ZwtfC3nYp8CaPNEdKWyu9wlMvkqQmVSEvE+qMTsLNlE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OeejNHtiFpVAid7ztKRvexbdxtLAp2oZLmg+Y58Ov8x3cZO+s028sKIwn9uycXbNDLILX/cPp0Xw9/89J3MS4Jc9iSPWgIeUXL4NMQQY80uQm8tml4vikBV9jpU3Xz2yPzyOyY7YcBI8l2xa/3lu5NF7JjFG86z/77RIFTmmXRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J4VdmL0M; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abbec6a0bfeso2130266b.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Feb 2025 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740592284; x=1741197084; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WafmvwMcW3hiVK+DWV4tC0TIwlo3nMf0b8z1NxQd6Ao=;
        b=J4VdmL0M3YOVCStd8+G2z/+ufICtF16Rc9EtX8mL+/aqbVT/1P9q2oXoij99jz4vXp
         NXdK9r0RDO+SV8vKMwcPkpGfLayiVjVgAwuNlNFCVx7HF/zgQXzIrp9ptvp7rNx382hG
         LXcuYcfz38J4HhUDnEpqz4oIjWQp/IAcejhK/1PibLQXPt4q1GVnvl93kuG8Equ0fc3p
         7JjVQWT/pMWJOmepvc/Q/h2XSNDWRCrB6RFrVAlTzJ8tJFPCkJsziOslkz5xb3c7TWCr
         jfOL+KSsteOS24dtMYqrZYo7vQYfhMLMZJLabdGIMhvCDUJ4zq4SjAWtMGcPWWPP3FnS
         L7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740592284; x=1741197084;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WafmvwMcW3hiVK+DWV4tC0TIwlo3nMf0b8z1NxQd6Ao=;
        b=jRxKG3Yj0MszVInx4wIYw5oVQzlbdEepGgRrQTZdFzb9khzuFAsSlOWhQnhKgWZ1TK
         C9McdbzzrfaZYUXUNGlKFTJjTVnciqkh9vMr6I5ZDxDIuKOqL8uknjGi9uDqn4XRxBxG
         k9rdRhemPc7QSBaTbt2MwgXd4OjL6kuKoSou5iw/ezxkBsCUqFzdYaHV6CQgJEej5o6r
         /0f6XQTv1vsNhkkU4lJ7TRDJD5DoMhrNaeaxC9fQUovVlgCHOmwXels8jdG5/iE/jJ9Z
         9DApeEOIL4gqJtrv2XckA0XNrNPIqbw4U3Dz6/h3HmbNIhjj3KAKL7EX+ba1W4g458rC
         T2dA==
X-Forwarded-Encrypted: i=1; AJvYcCWpPCapvVH3UGtBYoCivGgQK+z9KjygKl/EmiAcnMtYkIL6ffc8pMJvf0fDv2w5Gvdpy1+aJezEpwxR@vger.kernel.org
X-Gm-Message-State: AOJu0YwlcagZxdVhGw+6wCJEOAcNWzbYVj7yna31e8WkPauvOQeLuklj
	MqKGuqQ+qjtBnRmtmlzuoRu4JEOMjuFK1BQxvqEZJpDwiWdxw9JHEqIlkSDMs7s=
X-Gm-Gg: ASbGncvUCo1GO+itsQDV9L7QFOWkszv5ngg0bYvDMlCa+meLx/3C2NiWDBEBdrpBO6R
	wQ+gjfO278l+IUY6EjIEvq2iE7SSfxBpVNqEwVqnMOijGSAxeTTz8cesh8dOzWBRi/k4/8nqvuG
	2dxeu5PqhuL2X+7jS6OyEVe7TUj5kdQwj7MZChs0APlxSEUqAS41vemGaYYW/66kbg9OiVoxeSt
	ivDit6TDKXOGUE/F7lUuFGa6/J6nt/qWF8i8q822fBNxMFyeqJHgeMtr96h/Z6nPqH6ZoeFH88t
	uUc3MVEFGAcThAAnf8jtj67df9/SYqJtqD2QYRLUQCwgyftWxvRdJL5UEjRiQrJuXd7Lt37iyVi
	/pSdas9ypYQ==
X-Google-Smtp-Source: AGHT+IEdPDAKGl/ciZ2BN9WrypNhCZ3g9/t9yKy7hpDMmhF9Ng5D1SSHBpZpIWrlovd12eP54BeIwg==
X-Received: by 2002:a17:906:30cb:b0:ab7:b878:e8bc with SMTP id a640c23a62f3a-abc09c19ea5mr2172730166b.38.1740592283838;
        Wed, 26 Feb 2025 09:51:23 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdb131sm361889866b.7.2025.02.26.09.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:51:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/6] Maxim Integrated MAX77759 PMIC MFD-based drivers
Date: Wed, 26 Feb 2025 17:51:19 +0000
Message-Id: <20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJhUv2cC/3XMQQ7CIBCF4as0sxYDUympK+9hupgKtJPYYsCQm
 oa7i927/F/yvh2Si+wSXJsdosucOKw18NTAY6Z1coJtbUCJWiJexEKbMUb3YvFWEJGhVqEaO4R
 6eUXneTu4+1B75vQO8XPoWf3WP1BWQgocvW8731up9e3JK8VwDnGCoZTyBWTk/bWpAAAA
X-Change-ID: 20250224-max77759-mfd-aaa7a3121b62
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

This series improves support for the Maxim Integrated MAX77759
companion PMIC for USB Type-C applications using the MFD framework.

This series must be applied in-order, due to interdependencies of some
of the patches:
* to avoid use of undocumented compatibles by the newly added drivers,
  the bindings are added first in this series
* patch 1 ("dt-bindings: gpio: add max77759 binding") also creates a
  new MAINTAINERS entry, including a wildcard match for the other
  bindings in this series
* patch 3 ("dt-bindings: mfd: add max77759 binding") references the
  bindings added in patch 1 and 2 and can not work if those aren't
  available
* patch 4 ("mfd: max77759: add Maxim MAX77759 core mfd driver") adds
  the core MFD driver, which also exposes an API to its leaf drivers
  and is used by patches 5 and 6
* patches 5 and 6 won't compile without patch 4

The MAX77759 PMIC includes Battery Charger, Fuel Gauge, temperature
sensors, USB Type-C Port Controller (TCPC), NVMEM, and a GPIO expander.

This PMIC is used on the Google Pixel 6 and 6 Pro (oriole / raven).

This series adds support for the top-level MFD device, the gpio, and
nvmem cells. Other components are excluded for the following reasons:

    While in the same package, Fuel Gauge and TCPC have separate and
    independent I2C addresses, register maps, interrupt lines, and
    aren't part of the top-level package interrupt hierarchy.
    Furthermore, a driver for the TCPC part exists already (in
    drivers/usb/typec/tcpm/tcpci_maxim_core.c).

    I'm leaving out temperature sensors and charger in this submission,
    because the former are not in use on Pixel 6 and I therefore can
    not test them, and the latter can be added later, once we look at
    the whole charging topic in more detail.

To make maintainers' work easier, I am planning to send the relevant
DTS and defconfig changes via a different series, unless everything
is expected to go via Lee's MFD tree in one series?

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- reorder bindings patches to avoid validation failures
- add dependency information to cover letter (Krzysztof)
- fix max77759_gpio_direction_from_control() in gpio driver
- Link to v1: https://lore.kernel.org/r/20250224-max77759-mfd-v1-0-2bff36f9d055@linaro.org

---
André Draszik (6):
      dt-bindings: gpio: add max77759 binding
      dt-bindings: nvmem: add max77759 binding
      dt-bindings: mfd: add max77759 binding
      mfd: max77759: add Maxim MAX77759 core mfd driver
      gpio: max77759: add Maxim MAX77759 gpio driver
      nvmem: max77759: add Maxim MAX77759 NVMEM driver

 .../bindings/gpio/maxim,max77759-gpio.yaml         |  44 ++
 .../devicetree/bindings/mfd/maxim,max77759.yaml    | 104 +++
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       |  32 +
 MAINTAINERS                                        |  10 +
 drivers/gpio/Kconfig                               |  13 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-max77759.c                       | 528 +++++++++++++++
 drivers/mfd/Kconfig                                |  20 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/max77759.c                             | 737 +++++++++++++++++++++
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/max77759-nvmem.c                     | 156 +++++
 include/linux/mfd/max77759.h                       |  98 +++
 14 files changed, 1758 insertions(+)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250224-max77759-mfd-aaa7a3121b62

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


