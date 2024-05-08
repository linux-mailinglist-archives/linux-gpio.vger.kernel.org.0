Return-Path: <linux-gpio+bounces-6222-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E3C8BF690
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 08:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E673B1C2134B
	for <lists+linux-gpio@lfdr.de>; Wed,  8 May 2024 06:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB1922301;
	Wed,  8 May 2024 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iKGv8vI5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7521717C72;
	Wed,  8 May 2024 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715151119; cv=none; b=aJkQSzLqILAhqctzimY/+8IGyguOz7IDRkHLcHuroUyHLvrYshQS2TEIV83BcW927TIqN1FmRWy6ipjCAqjMRmMmQfqH4Ab8NAiYhfcYMaGvyYC3uzAQGKAePjcn0TK5YI8xNFf5L9ob6kPWvEAopbRBpQV3IvG9M3GsFysRsSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715151119; c=relaxed/simple;
	bh=8tMm0vKZ7/QYeUIxxaN6I4ebRfGzeidiLXa6IH1bn4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jpcFUCjvaMNEIlaqpaVfyqjwTvz9WFzgyV6fXfwfuylVMHmPvy+/UtSi2kGR1RWgIuAD8ZZ59jo7dVCuzyi1wkT9hmnbhVR9XB4LOf6e/l0zXMD1lt9CaZrupmhgKaYLBpWNZo6KZACHod8aafLJZi3ZPhWhJ6QVwlae5i/p264=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iKGv8vI5; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1ed835f3c3cso36827975ad.3;
        Tue, 07 May 2024 23:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715151118; x=1715755918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WskmxvCHwHG3hfNPcbruZ83J/Bg2hUlZTocqPe8dPgI=;
        b=iKGv8vI5wpfbXd6dRnztsJxwxzs0dw6/IzPa2aVdWSF5/EINDMrvfLOTWbNILkOfEA
         DOvIK/hdh9dN6uEN5Db276o/jzoOIYb5NNLCwNyMaIvYMy5Wl+Q0tH4d+e2gvGbGzitw
         +aWY/i3gITJiC08IT6lIebH7NFouq5fVC7XIegRrqGvp0ai0rKbtRsGurKXxB837Cl5n
         efjl3UkmJ0yess4u8LTpZqqDqZOcNUeeeVh11qIub3yZznITmsg5O7eyx3/apzJ7oy/j
         lym4HZjftYwLUMxkXwxORoyZdhvByeilIZUykYgXe+UE6ZOMt7ARhbb+NoH3YeE3Lz/w
         iAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715151118; x=1715755918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WskmxvCHwHG3hfNPcbruZ83J/Bg2hUlZTocqPe8dPgI=;
        b=DAUqIGOCStHE+tLFzmKXPvbatyzKdne+3iO/v9C/AlFDpXq+qeMpNdXPL/C4XEu7+V
         j2V8T/C6/Y08A7uQP6q2AwIx0+tjmJ2IIl2m0fgPMvanJjyq1IcyNgRXkRsazo3Os/Zr
         4N27rIRNoM3moFmd7wZBGdHIFUjd6BYqFQdg4PsY5XawObuDGskKVHKX00XZDmdG2kOr
         kzsWvRukva2jHvBq+XCRaeOLFJt0mWW2kBOTJfgYe9TFdr/hY2YvEIE4bxI7lr031R9I
         dr3SPLTtKb/d4r8YD1h+Pv2dnoaygWSVWod+xYt5c7vF8c+9HsWS0WiAnQSxiYc5mStQ
         bXsw==
X-Forwarded-Encrypted: i=1; AJvYcCVRKoNuV7iDXVuZSaQD62Qvnv/r2RXg47lAKXfNXgTGkOHstbAbxbs2BNQIWVH1Q3UDlLywoayWkVyy1YEV2/0t+KS/tuwKIvyf8XGGm+F0FW3apX0BuLpwfYygZovJw8A8NJ+ThIcbcCKnFPpHD7CZNUwfgFeUdpWNCiO3ln5KaHoYOeg=
X-Gm-Message-State: AOJu0YxXvCuZc6PpkHcOPZVGvwhyjlEaBVzNB848Ngbu1/ll9KNfXeBw
	pXKwk5PaYzE+2At1ZHSIXUmVCm9EbM0qt8No8V1wDVpQiOUwhc2A
X-Google-Smtp-Source: AGHT+IFznNnqBEiRDo5hWVDYp3yJ8T9y+3Zi4TiiHVmFM4beO+uR4Wt/1JIWOn/pJK2F4BlV5ewuDg==
X-Received: by 2002:a17:903:191:b0:1ea:b125:befa with SMTP id d9443c01a7336-1eeb078efddmr21188235ad.55.1715151117636;
        Tue, 07 May 2024 23:51:57 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e434923462sm11136267plg.50.2024.05.07.23.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 23:51:57 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: linus.walleij@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	j.neuschaefer@gmx.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com
Subject: [PATCH v8 0/3] Add support for nuvoton ma35d1 pin control
Date: Wed,  8 May 2024 06:51:38 +0000
Message-Id: <20240508065141.565848-1-ychuang570808@gmail.com>
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
 drivers/pinctrl/nuvoton/pinctrl-ma35.c        | 1197 +++++++++++
 drivers/pinctrl/nuvoton/pinctrl-ma35.h        |   52 +
 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c      | 1799 +++++++++++++++++
 7 files changed, 3249 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,ma35d1-pinctrl.yaml
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35.c
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35.h
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-ma35d1.c

-- 
2.34.1


