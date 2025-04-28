Return-Path: <linux-gpio+bounces-19397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED1CA9EF41
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 13:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D8E23B928B
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 11:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E590C267B14;
	Mon, 28 Apr 2025 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oP+2P46G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CEC267701
	for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 11:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840171; cv=none; b=EYbYJkKjLblYhkfipjQlGEBNiN26aQjlOxUj51q27BZ44XAYBNmRG7Nl9Btb+J0T5urYWwvZJaopX9E7RXH0gEPIDhizHrS7DSPNPLmtDfko0c/Ws6Mt+uryoW9tUXuovkumhYhzQDX13bXNRoAJ8tOn3HO3Db43VtDULVxsTNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840171; c=relaxed/simple;
	bh=eidpo+RHarAjPhf4Wn+n/8wPoKZOIs5bIp3f754wNAc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WQFw509uLbRC4Ib1C8+5Vu2tDlq7wMhWw8vfwjtEr6sh0P4pDN1sJSbCEmPTyuC5UGEzZtQbiCmSOXynk/coaPuqykFTVOHyt/k7VmDE86+hOc8e5eI5OiUB8Fopq12DcZTPz//Shkx37aDoWn5gvlBu5UfDMfYKbfACt47UTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oP+2P46G; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2c663a3daso916950166b.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Apr 2025 04:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745840167; x=1746444967; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=igDDxeHaTBC8idF8WoV6aqXk3OpWnaEdmdH1olhNzQg=;
        b=oP+2P46GbEznBQSxU3KfQC6BrpAc865hjLpVkXgW9OowoSrRVIXMnza5AxYz6UJshg
         ksd5t5U3fzCdTUDEBssw9wA68tjV22vwjrxKhimsooJAqrVU6QY5uuE+jnSaEwvCwdhV
         y0IpAaoKvNsHGrNWrXRFc+A/A/hFreHPPrBqAE3qEtsMnQDkH+TPeuXiQPI9KYRfs2QI
         3gdAJ06oHyLggaOut0WH3YBJG8KtxIBKkBn5K3vqW9ch5M0AROL8metBG8c+WLsKg+WB
         LUn7NTqPGq6Jsx5+phyLdVACaS/B6bOznOskhUX9A49EzoELosVMQLhu1kdqsGemPQIk
         Er3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840167; x=1746444967;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igDDxeHaTBC8idF8WoV6aqXk3OpWnaEdmdH1olhNzQg=;
        b=I3Q+BQVXMgTmArCVpzu6UXrHzzSFQHuKvVLoj0dzCyHW0NhkGA6TJongfAlSrcwpIv
         PVqypDigDURzDsDZNTeNbz2rEjcA2tC3drWve/BJDFpdjC0/31oObRrO+6jsAZxNhE2f
         zE5t1Oyw2SYkHVQQ1QXuFwp4UFYWWwYVKU3Cz8Y07SX7Gq8OOj6eQoi9R5N9yk8Q/DD4
         pl45XCGkWgVSomzFfakqWzajS3xTGo7UFZxyFDArC72PHMZkAf2SbhwBsjy4nAixOvxO
         j5dy/ksRggcCnakwBmGrxR9tpXMWKjkvwjRGnFev/YjhZ25eRdQtX9M8E0j85b8VDZXE
         K8UA==
X-Forwarded-Encrypted: i=1; AJvYcCWu+C+MIo9jY/U7A8j7g2xsvyDqz7zj2A+A/ukb58qFyOm8mgjpQh2a4FgtEnvlj9UT983FrNJtqaXG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5WePAVMAfeu1SVpoU7swHbhIz3pM8gzJWwGmE1nORs3hj8C4
	VLiZ5fFqCvVnvkURRgeSjZ+7Yh0C7oXctD+oPsrhcJegokiv0KRTnmcYFDTguTxdjZssZyhRu5E
	33xQ=
X-Gm-Gg: ASbGncvRS+LzRBcLs0gqR+5HTRoXItr9gcQlyD4oz7EBG1mslteI88X3BDhMWqQZc7P
	kl7nKD8GOGKHo6roz1BtU35xh/0FR58gWGfw0g95h0MR3PCRX2WcUpy52LcaCAplVkEoCMKPvOF
	uFi7pYONPud+/KBPny/fcwTtsfhS2wBBHID60x+8Uazvb91cGOwQfPe4BoEpIO+Z5MgQAB6DIXq
	O8ZyLboy5mrcOYIDBGcitpJFcwAYyAbsPTSxXmG3XuwyunSO9CEwJT3s8VRVhn+P4beR0J9t2sh
	AKjPhBynKXO6fI0lDvsGZh8EQS2S2ZotYQhim/HDporEN2garlMI6UWUx5m2aRsGn2c3GaA+r/X
	RXK8yWEgGMrl5yQ1j1vbpbm7O
X-Google-Smtp-Source: AGHT+IFWWhs8yiQOOm4i2sK1ZBH1fWgKhQaGZ0sZr7TEtC9VAGG3tk2XO9DCdq0s/WKIDaV1FA3//g==
X-Received: by 2002:a17:906:730d:b0:ace:6f8e:e857 with SMTP id a640c23a62f3a-ace846073f4mr750465866b.0.1745840167501;
        Mon, 28 Apr 2025 04:36:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1580sm619937766b.175.2025.04.28.04.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 04:36:07 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v7 0/6] Maxim Integrated MAX77759 PMIC MFD-based drivers
Date: Mon, 28 Apr 2025 12:36:03 +0100
Message-Id: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACNoD2gC/33PTWrDMBCG4asErasyHlkzdle9R+li9JcIGjvIx
 aQE371KNnVt2uU38LwwNzXFkuOkXg43VeKcpzwOdfDTQfmTDMeoc6hbIaAFxFaf5crMttfnFLS
 IsJgGG0eoKrmUmPL1kXt7r/uUp8+xfD3qc3O//hGaGw0aXUqGUh/A2tePPEgZn8dyVPfSjGtNG
 41VC9noIjoP0u+0Wetuo03V4A0hhxYt0k63P7o+u9Ft1a6HLhCQ77zbabvSaDfaVk29C5SAhXm
 v6T9NVXvoGLwQoZNfelmWb6c/SY/fAQAA
X-Change-ID: 20250224-max77759-mfd-aaa7a3121b62
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
Changes in v7:
- rebased against next-20250424
- Link to v6: https://lore.kernel.org/r/20250325-max77759-mfd-v6-0-c0870ca662ba@linaro.org

Changes in v6:
- add one missing change in core driver
- Link to v5: https://lore.kernel.org/r/20250325-max77759-mfd-v5-0-69bd6f07a77b@linaro.org

Changes in v5:
- core: incorporate Lee's comments (hoping I didn't miss any :-)
- Link to v4: https://lore.kernel.org/r/20250312-max77759-mfd-v4-0-b908d606c8cb@linaro.org

Changes in v4:
- collect tags
- mfd: add missing build_bug.h include
- mfd: update an irq chip comment
- mfd: fix a whitespace in register definitions
- Link to v3: https://lore.kernel.org/r/20250228-max77759-mfd-v3-0-0c3627d42526@linaro.org

Changes in v3:
- collect tags
- mfd: drop gpio-controller and gpio-cells, GPIO is provided by the
  child (Rob)
- gpio: drop duplicate init of 'handled' variable in irq handler
- gpio: use boolean with IRQ_RETVAL() (Linus)
- gpio: drop 'virq' variable inside irq handler to avoid confusion
  (Linus)
- gpio: drop assignment of struct gpio_chip::owner (Linus)
- Link to v2: https://lore.kernel.org/r/20250226-max77759-mfd-v2-0-a65ebe2bc0a9@linaro.org

Changes in v2:
- reorder bindings patches to avoid validation failures
- add dependency information to cover letter (Krzysztof)
- fix max77759_gpio_direction_from_control() in gpio driver
- gpio: drop 'interrupts' property from binding and sort properties
  alphabetically (Rob)
- nvmem: drop example from nvmem binding as the MFD binding has a
  complete one (Rob)
- nvmem: rename expected nvmem subdev nodename to 'nvmem-0' (Rob)
- mfd: add kernel doc
- mfd: fix an msec / usec typo
- mfd: error handling of devm_mutex_init (Christophe)
- whitespace fixes & tidy-ups (Christophe)
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
 .../devicetree/bindings/mfd/maxim,max77759.yaml    |  99 +++
 .../bindings/nvmem/maxim,max77759-nvmem.yaml       |  32 +
 MAINTAINERS                                        |  10 +
 drivers/gpio/Kconfig                               |  13 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-max77759.c                       | 524 ++++++++++++++++
 drivers/mfd/Kconfig                                |  20 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/max77759.c                             | 690 +++++++++++++++++++++
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/max77759-nvmem.c                     | 156 +++++
 include/linux/mfd/max77759.h                       | 165 +++++
 14 files changed, 1769 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250224-max77759-mfd-aaa7a3121b62

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


