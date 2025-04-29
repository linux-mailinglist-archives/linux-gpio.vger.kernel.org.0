Return-Path: <linux-gpio+bounces-19436-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB69AA05A3
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 10:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53A248454BF
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 08:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C373829B788;
	Tue, 29 Apr 2025 08:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l/eMqVIJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D64294A10
	for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 08:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914931; cv=none; b=NUej3i7mkaDwvp7rnFJb0NZQLCw3CVEbDRTtZAfGkrxaw4G+8Ot6Q8U+FUTtlhdIDnd3j6cAse0qVNwiZqTj30a19NwSPlXEyYwpIJxOVbuxGnmc92ZqEKi9EPXdXNt4ViLgjvH43WrvFAUmgUr3eII9oEZ7Tz2hg+Frlgs+6bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914931; c=relaxed/simple;
	bh=CC+x9TIuGKZlk9DpvDXPrvuJ/RoLRSdU1UZ8DDd6rSE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hHIjT3uNU7pVMv3XT+vDVXzmxOaSctPkEweQPa4Ww7E4jrQpzBjJhtmGrNfAUzeeklim8AZ7ebITpvbsBGS3qEPnzlSgW7X9oYEGABc6EUSwMdrZ3gD620jS2Xh7AZ9TjDzA5Q1PrfhkRti5WO6fix/gvqEukJYQQ1QqT7njOqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l/eMqVIJ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so701936666b.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Apr 2025 01:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745914927; x=1746519727; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjWwsLzQyeO/7s5cGzDJW5RdjgmzsifvXsymD4VMbYI=;
        b=l/eMqVIJIHcrEJmrvHPlbCrIuL+TGqC/7BKBQxPadEs4Qsl9k2f8+q75iRIVI/6g2d
         cA1ATZfBJaacUYBHGJ6fOZksxrXdc389nLin0CFOV8GzpNTIdCzs/j+tpTfcspnBfc5k
         y+SraQvBPG5iQAeqhPSpmSB3B4oWignWN8unjw0Vqj9AxObzMF7id0NL4+FFFdd2x7E/
         OEu2iUebEKb5/DfHmillvHNHCV1+FDl8JNUH1lQgCqj/cgkP1DpMVuNx4EkX3UftP9AI
         r3pnDO15lDlYTBJ8Kmk4QuB2+G361r0nmf1kYVwDn4tA58jhECuWHi7pjBosp+H+ri16
         KZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914927; x=1746519727;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjWwsLzQyeO/7s5cGzDJW5RdjgmzsifvXsymD4VMbYI=;
        b=jZR4W5U7iALKgCIuoSIPBpwCeHiTG2diAA8kcsg1oaTERFv8IJGEz3B7Gsh+2Wah4M
         7u+ZqwZUocoENypETmaAo/ttfVeboUoa7vkZWh6HgKy1ZfG6oXObZO8e99XQOVRrjUDL
         HgKXSODkFlRa1fAaIRgAmi3uttFSv6YsosXSAEE+3xBWDNkW1ixonblcPeM81hkopU45
         NrrnWT4Jvx/k0FV0ngNWgjzClBa12Ye4o29KoeDIou8a1Ftre24jDWdLzGy0Nf8cyckJ
         0t9l8znW1XcvIJZ3d2jHnz2U9fLJwyUZ10yUTGjRK7yuKPe8z1PrlkKJn2pmdrO5BdWc
         KVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc3oOcUh/y0nVXQtaq6S2vjNWL8MN8qZyVb2M6qhZrerva6VzcLLDGWyhV6eijGmUUl7fAd3lAV0mt@vger.kernel.org
X-Gm-Message-State: AOJu0YwzUecfaFOhqF2ZEOUEr0f583qZno5alzmMN8tvdZ6CRetaVdNN
	jmh5lXD9eI0lZwln5VTHWbABja5Tpi85FbIUbtaM0NjTFc3faO5anRI7uuRlSfM=
X-Gm-Gg: ASbGncuTX11dKbmV5+n8xCq0HGD2IlHahu+xFEQMrGIIVfag9PEhbFSY0rqKE65nC5m
	28UR6C7KulFaIYcL2pRl4E0QFY3HKdhWFhB0lWL93ArdqdgAH+Quq77V490TUmuC/iukEhj8kEg
	R2Ej6yRapjEdPwBl+97v4y1p5gbIfuOwUGjeTohClr96WEUABYCa3CosJCcXQCwSk4SGv+PehIE
	OgvTP4arNdDq/Gxv1EiVoSYnxTAdYycviIYYltFdmQOnrPY+Yl6NLDAqvhhdw3LyP3HD7YaATNH
	eW1BmcCsMpHzPvA+TpOCPmtfQtWtAlG4SP+x1xIwEewtGEiY8S0i45RO7EVAQcUec1iEm/5wbUq
	Xbo9RF1M599WD3recWczRFL9a
X-Google-Smtp-Source: AGHT+IEJLdAyByvjWpRoQZ5u+uEMWUik7hg7SKC/v1n2JhrHzJOvQXoId+i7WUJMsyDMVZ567KCnZw==
X-Received: by 2002:a17:907:7f0f:b0:aca:c49a:aec5 with SMTP id a640c23a62f3a-acec84b7d10mr137455466b.8.1745914927052;
        Tue, 29 Apr 2025 01:22:07 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bbf4sm737905466b.36.2025.04.29.01.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:22:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v8 0/6] Maxim Integrated MAX77759 PMIC MFD-based drivers
Date: Tue, 29 Apr 2025 09:21:36 +0100
Message-Id: <20250429-max77759-mfd-v8-0-72d72dc79a1f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABCMEGgC/33PTWrDMBCG4asErasyHksjuaveo3Qx+ksEjV3kY
 lKC714lm7gW7fIbeF6Yq5hjyXEWL4erKHHJc57GOuzTQfgTj8coc6hbIKAGRCXPfDHG6EGeU5D
 MbLjvsHOEopLPElO+3HNv73Wf8vw1le97felu1z9CSydBokuppzQE0Pr1I49cpuepHMWttOBW0
 05j1Uw6uojOAw+N7rfa7nRfNfie0ASFGqnR6qHrszutqnYD2EBA3nrXaL3RqHdaV02DC5TAsDG
 tpv80Ve3BGvBMhI4bbR5aNX+bqmNIUYHvKEX7S6/r+gMULYNHHQIAAA==
X-Change-ID: 20250224-max77759-mfd-aaa7a3121b62
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Srinivas Kandagatla <srini@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Changes in v8:
- gpio: switch to gpio_chip::set_rv() (Bartosz)
- gpio, nvmem: replace MODULE_ALIAS() with .id_table (Krzysztof)
- gpio, nvmem: drop previous tags due to above
- Link to v7: https://lore.kernel.org/r/20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org

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
 drivers/gpio/gpio-max77759.c                       | 530 ++++++++++++++++
 drivers/mfd/Kconfig                                |  20 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/max77759.c                             | 690 +++++++++++++++++++++
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/max77759-nvmem.c                     | 162 +++++
 include/linux/mfd/max77759.h                       | 165 +++++
 14 files changed, 1781 insertions(+)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20250224-max77759-mfd-aaa7a3121b62

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


