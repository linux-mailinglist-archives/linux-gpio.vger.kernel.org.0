Return-Path: <linux-gpio+bounces-28045-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E443AC32FE5
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 22:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A3E134E9575
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 21:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5C32F39D7;
	Tue,  4 Nov 2025 21:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ULnOsHzt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD55A230BDF
	for <linux-gpio@vger.kernel.org>; Tue,  4 Nov 2025 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762290034; cv=none; b=aH0FFIajATtSBtV7/EwmpQVdjwBYFJsdoZp7pQIeoo74AgmCMXAVf/JuRKC6v88Rt2FXLHAyb/Hi3iVC8Z44BYvod3XL8uLSz2Z1lHa+4JWTHhtvjzd6VueCIvP6fj3OCRXMbblr3XXpTthe66RR1ZZ+hcLw9T03kJ2Vc/bHf08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762290034; c=relaxed/simple;
	bh=WzG1Thd8rWTY5UVsOx6Uyiv/PmagrtT+BKyu17pXx84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAZQDgArj4fXGWb81B6ZQ+dhuw3MnxH7qv1yo+SKfen1g18xFH6tP/VCV4K9p6bO7MONmOWuT80ut5Eal/cXEigAf/oNb1qpEHrAwMnzk6Sa33UqulPXnCorOZNczU87s9/eEvFH82u3CrZyI2DTBMBM9EjP0CdXnepxbfxN4bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ULnOsHzt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640f0f82da9so1601123a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Nov 2025 13:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762290030; x=1762894830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cu6otQvJbxl54JqiS+7oNG2Lp4GfO1PIfQ60QhYKDa4=;
        b=ULnOsHztEJesoiusbybBbjyqcFBbJpiS9yljwCuck+y/Q5fN+Eif4Etnqd17TU95It
         23OjVjNgYGG/WAsJ0POkuJm0Ype56LT532UVF3kW2C8x2q5xo1jmtWMAo5X3dyoUBTRk
         y8ZCRsg3hhwa4ahJEPW151bpkXbATG9sMbd6BIOBQAeToztlJXe2yi89xBJflqSCwb1O
         OB/PQBqSK5lZLAlEsBJe6lxI9DC+djde8S4he1rMC033nSjbm0+5kk+5/1RMNB4Z+UsV
         o0oA54cIELHDEwRtwXsERKsutBlnqt/6lMUxwMD7kDdKQPRm2wPMgd5SJLnVX9f72K8D
         gTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762290030; x=1762894830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cu6otQvJbxl54JqiS+7oNG2Lp4GfO1PIfQ60QhYKDa4=;
        b=nZW052/J3ZVhKHiZsACLB2hmPgKQBAOdQTXfivPyfrqLYgz83y+r/lRDcF/qleLyaf
         b0l/XTsTsTT6kSbp4VZZLc7jQyM5dru/wxOxApWYvOSAwU40TjZIeB9kltdNuZB2rpPt
         Dh1p3vN8ftDoASwXXw4ObkEeqQoH1n5qB6YlP8mRWGaotLsWbKo8DBrC8Js4eP5BkXig
         9JUCiWAsEpNsLitskiZ/fYnKe7YcAh1BQxFaNZnCnm3f1CQMbDC3OLba19jPo96k32sK
         1Aurm3mss95+CKtai2jxD0Fet8jJbs2XjYW06ZNjd246vLGfAYFNf0N5YNdW2GqPtps4
         FB4A==
X-Gm-Message-State: AOJu0Yz7I5TTSRjOmZORnADOkKcXc85lKjVXH0cXR8XugoOhw9CHRQka
	PwSb0IWO9Teh4F2BR+PzbkbvzH5vxyH6xS49RhHMx8ywNYSo50tePW/G
X-Gm-Gg: ASbGncuBq33AP2DKZa1whV+JSl/dNJTGfkoSImx6Kr544XtwFmFzS5ohhir/t0TQhVt
	0ey2x92+ngmjApcnZbD86vWgxWr0K0bJsjJ0h4IfBjUjxlJoNPjxqs2nDoj1b7gTTA8jonPrxhb
	i7HoBL65NFUZ+3XPoeAs2h3IFiulteGBO977k5+vNZWCZAuSH/ackwg9fNSav9sYwymjIri9F7I
	6V82F2qAd6HFOPXj9GMi7CbRFGz3UsHpq2r2KUJErvilSJBPyUAZM5tF+R/Qca9zyNCGyhSs4p6
	HU5NpqWVUMv0ro/ekAaB9Z12szU/JoGx3EdAB6cWjhN5EqccGilf4JhEfMUVK4TsFcF2RBqwimn
	q4HvF0NXmtgtgtFR0ewAXH/FwJ1q41dIWIa2GeDtAtRLMfMirj356uCKyhPZzf6Pr2N3MHctwXh
	9iCkw402TslB4iWQ==
X-Google-Smtp-Source: AGHT+IGknnmMjTDBfXdME3H3Wv5oEbmwjqdcOSLbNVmT1j3boNqZqijOYzH69nr4IyFFWpqlJGBCpg==
X-Received: by 2002:a05:6402:27ce:b0:640:9d56:50a7 with SMTP id 4fb4d7f45d1cf-641058af4c4mr577091a12.9.1762290029712;
        Tue, 04 Nov 2025 13:00:29 -0800 (PST)
Received: from builder.. ([2001:9e8:f13f:9116:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a70b5bsm2990017a12.26.2025.11.04.13.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 13:00:29 -0800 (PST)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Richard <thomas.richard@bootlin.com>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v3 0/2] add gpio-line-mux
Date: Tue,  4 Nov 2025 21:00:19 +0000
Message-ID: <20251104210021.247476-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This proposes a new type of virtual GPIO controller and corresponding
driver to provide a 1-to-many mapping between virtual GPIOs and a single
real GPIO in combination with a multiplexer. Existing drivers apparently
do not serve the purpose for what I need.

I came across an issue with a switch device from Zyxel which has two
SFP+ cages. Most similar switches either wire up the SFP signals
(RX_LOS, MOD_ABS, TX_FAULT, TX_DISABLE) directly to the SoC (if it has
enough GPIOs) or two a GPIO expander (for which a driver usually
exists). However, Zyxel decided to do it differently in the following
way:
  The signals RX_LOS, MOD_ABS and TX_FAULT share a single GPIO line to
  the SoC. Which one is actually connected to that GPIO line at a time
  is controlled by a separate multiplexer, a GPIO multiplexer in this
  case (which uses two other GPIOs). Only the TX_DISABLE is separate.

The SFP core/driver doesn't seem to support such a usecase for now, for
each signal one needs to specify a separate GPIO like:

  los-gpio = <&gpio0 0 GPIO_ACTIVE_HIGH>;
  mod-def0-gpio = <&gpio0 1 GPIO_ACTIVE_LOW>;
  ...

But for my device, I actually need to directly specify multiplexing
behavior in the SFP node or provide a mux-controller with 'mux-controls'.

To fill this gap, I created a dt-schema and a working driver which
exactly does what is needed. It takes a phandle to a mux-controller and
the 'shared' gpio, and provides several virtual GPIOs based on the
gpio-line-mux-states property.

This virtual gpio-controller can then be referenced in the '-gpio'
properties of the SFP node (or other nodes depending on the usecase) as
usual and do not require any modification to the SFP core/driver.

---
Changelog:

v3: - fixed dt_binding_check errors in DT schema
    - as requested by Rob (for DT schema):
      - removed example from gpio-mux.yaml
      - added '|' to preserve formatting
      - 'shared-gpio' --> 'shared-gpios'
    - general fixes to DT schema
    - use mux_control_select_delay (as suggested by Peter) with
      hopefully reasonable delay of 100us
    - gpiochip ops implementation changes:
      - drop '.set' implementation (as suggested by Peter)
      - new '.set' implementation just returning -EOPNOTSUPP
      - '.direction_output' and '.direction_input' dropped
      - '.get_direction' returns fixed value for 'input'
    - direction of shared gpio set to input during probe
    - as suggested by Thomas
      - usage of dev_err_probe
      - further simplifications

    Since the consensus was that this should be input-only,
    '.direction_output' and '.direction_input' have been dropped
    completely, as suggested in the docs of struct gpio_chip. '.set' is
    kept but returns -ENOTSUPP.

    The shared GPIO is set to input during probe, thus '.direction_input'
    doesn't need to be implemented. '.get_direction' is kept (as
    suggested in docs of struct gpio_chip) but always returns
    GPIO_LINE_DIRECTION_IN.

Link to v2:
https://lore.kernel.org/linux-gpio/20251026231754.2368904-1-jelonek.jonas@gmail.com/

v2: - as requested by Linus:
      - renamed from 'gpio-split' to 'gpio-line-mux'
      - added better description and examples to DT bindings
    - simplified driver
    - added missing parts to DT bindings
    - dropped RFC tag
    - renamed patchset

Link to v1 (in case it isn't linked properly due to changed title):
https://lore.kernel.org/linux-gpio/20251009223501.570949-1-jelonek.jonas@gmail.com/

---
Jonas Jelonek (2):
  dt-bindings: gpio: add gpio-line-mux controller
  gpio: add gpio-line-mux driver

 .../bindings/gpio/gpio-line-mux.yaml          | 109 ++++++++++++++
 MAINTAINERS                                   |   6 +
 drivers/gpio/Kconfig                          |   9 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-line-mux.c                  | 137 ++++++++++++++++++
 5 files changed, 262 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
 create mode 100644 drivers/gpio/gpio-line-mux.c


base-commit: bac88be0d2a83daf761129828e7ae3c79cc260c2
-- 
2.48.1


