Return-Path: <linux-gpio+bounces-6486-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F11998CA5B4
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 03:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 31628B20CE6
	for <lists+linux-gpio@lfdr.de>; Tue, 21 May 2024 01:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D4A848A;
	Tue, 21 May 2024 01:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTQ3YY2L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5340323B1;
	Tue, 21 May 2024 01:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716254696; cv=none; b=ZBrxSves006OvEJlqdkD/N7vI2xg5v5yCi7dnIJOSvIl6vP4cuZEcqqFdWIeszWw1oWO41t9xYoE6mQWftopmSbFYc5NG8TYEXEi849mNFZeHgUKsMgJ+zzbjc6D5+v30e54FGDVdWr5Tf9g2aEpuOJ9UNMKm0UoBrEOHBne/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716254696; c=relaxed/simple;
	bh=mlKHlNHeRZJ1JNKcVo4YtnQWkRNUTKol1zsZTyOmgl4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=osv4D0KPBdzoBBSQUI9RFsUtKt9dET9qs/Hc/sH9faDuIwz3/1xT73+e9oAlBMz4xQhqjpc30IHtFVEgpg0loogIWfNlKYFJ4lt9mjE5RfxtixNm+0DxB1B3A+FxPDC5b9gJ3QufJisjSJzRPqmgpFNIvs/Qa6pVAQ3/OcTmDOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTQ3YY2L; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f6b1ac1e90so968078b3a.1;
        Mon, 20 May 2024 18:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716254694; x=1716859494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0+4CFDABta5FvIV2tRRbFSIuE3j1iSrR6GdVOPZVmLQ=;
        b=YTQ3YY2LHzulL8a9VOE48Q3sGh8KE30egQMHtmiVoKtNoDNiofwsPjrourH4BB46JN
         58l3wL/dP9Z9ZQaFBy+Qsu/nFWRBQu4+GE4IB+Vh5ld20QdMxbyv3b0agn2Fbsl6T8nc
         44ovb340h2ojawko8cm0rHf6a357LOTR12BfTdggPWlhLR/Xi+sL3OfkeF/NXpEofPU2
         wDrGLleJwmdAbOzqK48TXdftw5MZelonBO3zmUqPSAajIjD3rn94TP7/kkndLml1+cic
         lGXZM7CsGcVSOMcLMXSk40iMbu2QwOZNS0AJ78hGzqFuJJRHjDgUKY1DxchqCkAqDve5
         nJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716254694; x=1716859494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+4CFDABta5FvIV2tRRbFSIuE3j1iSrR6GdVOPZVmLQ=;
        b=KBRcZoqSkVRRTpLgliU4tHm/usggfXEb7J6tZzcXwNQ7YBJ7QApNtAQ5+SOBv7kmxb
         xk8tovh0s9EUPMygsSNUzS42ChaErrFUQdg74kJKWJWOcLABcmV8QN7ojdpR6qlmLeoD
         RDyaibncogfmubEGUiPUPpl7MaArDrAB8twrGa3RKSQnSmRMUhE5sEcLq/yZ3ZiSuO7T
         LQQ+Fa+J3MEZrKUZgUNzNu5QR2c/2oTzi2UGMZMCUzPzo6OLIh+F0fMhIzp+hd9kFthp
         FNfo6WI5qNoLI+vIxgsKcnQqREqN65JqjvOiyAV01kZa22GiNlW1Z9xpnv7cq3v4zcwN
         HO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUwmBiHngbeGu2N9Ftuz/ggsmFhDKUqe3pzW989czox3gzCroQ69+PPGxyyu0r/4Uy4SVNTmcEJuihk4HEvmd/cXeyC9oPHX7HphcfCDCpJE67Qdk9QEu4BJIVJiqzNcr6l4GaOo2oP0zBFA5pVfdOjo8/ZHVAggnEIKes9GtIkiA789A=
X-Gm-Message-State: AOJu0YzaASb5AMbJUHsb978jKn+Dpd7zGIEdqFH2Y5KLSExQ3EOC+/VQ
	3/FuTMG+As/V4BiAyhEemOsGsMZeXxnXxyyy+UU3+zZ5wQqkki/9
X-Google-Smtp-Source: AGHT+IGhcTBnIguWiP0Po6ZM5wdGwMm+O7B8V+O9EFI6oGHcpl4Dz6okJFdjNBhwpaCRSN9kqygocw==
X-Received: by 2002:a05:6a20:734e:b0:1af:6914:1154 with SMTP id adf61e73a8af0-1b1ca3b8f77mr11150075637.7.1716254694395;
        Mon, 20 May 2024 18:24:54 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-65e149dd925sm6477563a12.58.2024.05.20.18.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 18:24:54 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: linus.walleij@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com
Subject: [PATCH v9 0/3] Add support for nuvoton ma35d1 pin control
Date: Tue, 21 May 2024 01:24:44 +0000
Message-Id: <20240521012447.42211-1-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

This patch series adds the pin control and GPIO driver for the nuvoton ma35d1
ARMv8 SoC. It includes DT binding documentation and the ma35d1 pin control driver.

This pin control driver has been tested on the ma35d1 som board with Linux 6.9.0-rc7.

v9:
  - Update pinctrl driver:
    - Fixed a compilation warning reported by testrobot.
    - Removed unnecessary gpiochip_remove().
    - Made other minor fixes.

v8:
  - Update pinctrl driver:
    - Utilize macros wherever possible for managing register bit fields.
    - Revise the usage of 'hwirq'.
    - Transition to fwnode-based operations instead of device_node as possible.
    - Refactor function ma35_pinctrl_parse_groups().
    - Adopt new PM macros.
    - Implement other minor fixes.
  - Update dt-binding docuemnt:
    - Add property 'reg' to this pinctrl node.
    - Correct the patternProperties name from "pins-" to "-pins" and relocate
      it under "-grp".

v7:
  - Replace the magic numbers appearing in the driver with defined constants, or
    provide comments to explain them.
  - Update the ma35_irq_irqtype()
    - irq_set_handler_locked(d, handle_edge_irq) and
      irq_set_handler_locked(d, handle_level_irq)
    - add case IRQ_TYPE_EDGE_BOTH
  - Use handle_bad_irq for girq->handler, instead of handle_level_irq

v6:
  - Remove DTS from this patchset. The DTS will be submitted in another patchset.

v5:
  - Update the pinctrl driver header file pinctrl-ma35.h
    - Include platform_device.h to fix compile issues.

v4:
  - Update the pinctrl driver Kconfig
    - Add depends to CONFIG_PINCTRL_MA35D1 to prevent compilation errors.
  - Update the pinctrl driver
    - Utilize devm_kcalloc() instead of devm_kzalloc().
    - Employ ARRAY_SIZE() instead of sizeof()/sizeof().

v3:
  - Update DTS and YAML files
    - Corrected the unit address of nodes gpioa ~ gpion.
    - Removed the invalid "pin-default" node.
    - Removed the phandle entry from "nuvoton,pins".
  - Update pinctrl driver
    - Fixed the Kconfig by using "depend on" instead of "if".
    - Removed unused #include of header files.
    - Utilized immutable irq_chip instead of dynamic irq_chip.
    - Replaced ma35_dt_free_map() with pinconf_generic_dt_free_map().
    - Implemented other minor fixes as suggested by the reviewer.

v2:
  - Update nuvoton,ma35d1-pinctrl.yaml
    - Update the 'nuvoton,pins' to follow the style of rockchip pinctrl approch.
    - Use power-source to indicate the pin voltage selection which follow the
      realtek pinctrl approch.
    - Instead of integer, use drive-strength-microamp to specify the real driving
      strength capability of IO pins.
  - Update ma35d1 pinctrl driver
    - Add I/O drive strength lookup table for translating device tree setting
      into control register.
  - Remove ma35d1-pinfunc.h which is unused after update definition of 'nuvoton,pins'.

Jacky Huang (3):
  dt-bindings: reset: Add syscon to nuvoton ma35d1 system-management
    node
  dt-bindings: pinctrl: Document nuvoton ma35d1 pin control
  pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO driver

 .../pinctrl/nuvoton,ma35d1-pinctrl.yaml       |  178 ++
 .../bindings/reset/nuvoton,ma35d1-reset.yaml  |    3 +-
 drivers/pinctrl/nuvoton/Kconfig               |   19 +
 drivers/pinctrl/nuvoton/Makefile              |    2 +
 drivers/pinctrl/nuvoton/pinctrl-ma35.c        | 1187 +++++++++++
 drivers/pinctrl/nuvoton/pinctrl-ma35.h        |   52 +
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c      | 1799 +++++++++++++++++
 7 files changed, 3239 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35.c
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35.h
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c

-- 
2.34.1


