Return-Path: <linux-gpio+bounces-24075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8151B1E93E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 15:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EDF47A76B1
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Aug 2025 13:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA7B27E076;
	Fri,  8 Aug 2025 13:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpFuo+rV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E70277008;
	Fri,  8 Aug 2025 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754659830; cv=none; b=caZsWOdREgP2JLRfnQ3PVmiALDf/eqYfKGdy0XIDYr8KbCGo4MlRW4X9WLM9W7kv2KE4AX4XFGDBFjBYYmdYKZR6H3k6sTkdOmkTQDbaAbokO0In1WINjJNpdCeIiDJaxiVHkZFXiOwqEszEiHH0zRaX6FEdK5fQG5QNWAiot8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754659830; c=relaxed/simple;
	bh=vaEY+BmFiOXjdWpT0qSy6urLO/5nt6n1iSwLDhDQoXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPnBIz9SCHAs1AkNZGq+Lnl5qLW5ME2S013tJzYSIlUepSQ0B9MVSpxRkm2s+cMAP3+Ea4u9VuXfNO4uWdg/CDGnXf2Eqf5lH7gwK+Qyowrud8sf9XWRH11FkfU1l35/W2pZ0W+vwrA/tFcDDLkDiIDi9OOooanvIO/iyvfHwsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpFuo+rV; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b78310b296so1057449f8f.2;
        Fri, 08 Aug 2025 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754659826; x=1755264626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OSPQlhFp9J6rhxGGLDY9Xj8C7mWGfjR96GY1FwNJsRg=;
        b=bpFuo+rVm85le7uI3jCwlfxrGnYMnqeuhK8UTNJKn5segUvfSUaz+cyaVcAMYe5Ife
         LuP3R0AOtQo5oeAIUykfq9kN6QYbuya23IZQyjtnrwe4tF/IbD88R+tXNJqrQuUypvx+
         syc3aUNoarMwpYc5klZlpGefFKcKMRRG3/Y0XDCGmMqVKWm4Mx0Mj2DUBKFXJ0CT4ROA
         0DyMRH9Px/cOy3arzqiWikrcDu4RZ9BbkaSnmKwere5tmaGyENTUVWIZxpJYLwSQh2ns
         g7oMlWQexSMh/Lj9StQPCYBBatcmB3AJ559wGSmELQP+g/9P61U+/G4Z1p/YrJSWxdqK
         rlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754659826; x=1755264626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSPQlhFp9J6rhxGGLDY9Xj8C7mWGfjR96GY1FwNJsRg=;
        b=MWJmIxXdqibAddCYdAiQBc8PLclHJ2uLaQaVTtkRl7prDd+63Z+R9F5lAn43qmFAPj
         LFZJi/PvdAi357DALviAVcPl/weVQZLwRz19UXh+D4a0A+FOktcPWg+mEPEJBjy2I1kC
         dtlOf5xl35LhHuuOQ90tQdUEpu1RNi5lMnaUBo/Eqaml/v4nmmpRHFv6eSfHcqhk3oYL
         7WkhGXIFjUZcTLWdWGGQ465K+GMQEbC37HxzLPXkNJ/Y/OulaQD5IiXJWZJhTub22wG7
         jrYWMNpjlCki63N8dO1OTsiVCgz7cLA27iRHjaEQoSZi0Cwic2cZezYUZVI3c+HvMpkD
         jYiw==
X-Forwarded-Encrypted: i=1; AJvYcCUHa311UUtm9LQqZmx6hK297sCjSMhc+D1OLORVi4L2++akX+zAsu6DUi48fLH6qQFPHFG1c7eC939mOg==@vger.kernel.org, AJvYcCVSQaPL7AR7Bp6PuOGSaBSdjFnR0Z6HatmD31YcrNK7JuhN2IhjE8n9MPjURiJBac0nAb0GJDn2Dkdc@vger.kernel.org, AJvYcCVhNivg8E5rrwbAIPN5iWyOqyf8Yt4EQxRjVxQOY9S/JkVhY4qkzZ+yyUfKjKS/MntTzFYiDo3AW7G2FJpp@vger.kernel.org
X-Gm-Message-State: AOJu0YwJaaMuM7A3GrXLtNamjsEZVX3d+RYpoVgbL+0xZ2xWdXeixM7V
	cG8J8HYm6nQ5cSDbleFuh/0OiAekJLdDa+Mpns0xXmWS0bpgUVN4YJqx
X-Gm-Gg: ASbGncsj0oi4siqGVgKqmvxSFQZCptYt5h6tgb59a0p3DiXJskC/O20ZITq7K3OKBZu
	xSFYxjOxxxzhPf/Ep8eykIYAJq8Vq+bVSACs4BGPUKqG/nfkiy7AKPWMR7a5ERkXvv7zHR/zPLM
	7OxROYrh8PLE8kOUcFSBMRuBOCaSqWN3KN3vAc139yHXcu8xkxAde7GWlAcZqy1PTRMKhpyGi6F
	ySt3C2Lgc31Eh0XC2+I8lB9MLthTw8vUAGa+Amexz9yjb2Gv7GTsVjFB7CH6zsQ5WWtHMvagpxG
	vyuzEzIoBOzvub6JMjm+SeyJ9RJJTQDSLQBYcvd7M2sbu6XBaYeHo1QcH98AtZs26QUKYfqxFzM
	HQ9psLDaexTJ/kW8MtYedV1sAOfA4Uu+7bfe+k+ATQPIIzPfxqkICt/x2nhTA9D2XeMj3XkYGrV
	sBLka0jbg=
X-Google-Smtp-Source: AGHT+IET4VmkoACh+hHG9EeFTPuM9uUSbhSy5TObg2EXstp0s2Cl3dSLsKTuKFqqeJHBhzUAASnTsA==
X-Received: by 2002:a05:6000:4310:b0:3b7:8410:22b6 with SMTP id ffacd0b85a97d-3b90092c99fmr2595874f8f.6.1754659825950;
        Fri, 08 Aug 2025 06:30:25 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm31527769f8f.70.2025.08.08.06.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 06:30:25 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/3] Add pinctrl driver for RZ/T2H and RZ/N2H SoCs
Date: Fri,  8 Aug 2025 14:30:14 +0100
Message-ID: <20250808133017.2053637-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

Add pinctrl driver support for the Renesas RZ/T2H and RZ/N2H SoCs. The
RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins. Both
share the same controller architecture, and the series includes
documentation, device tree bindings, and the driver implementation.

v4->v5:
- Renamed DT binding file from renesas,rzt2h-pinctrl.yaml to
  renesas,r9a09g077-pinctrl.yaml
- Updated the title and description to include RZ/N2H SoC
- Updated description, fixing the information about mux functions
- Dropped sd0-sd-tmp-pins sub node from sdhi0_sd_pins in the example node
- Added reviewed-by tag from Rob for patch 1/3
- Updated Kconfig description to include RZ/N2H SoC
- Grouped PM_* macros
- Made use of BIT() macro for PM_INPUT/OUTPUT
- Added necessary new lines for readability
- Dropped port_pins from struct rzt2h_pinctrl_data and
  made use of rzt2h_gpio_names directly
- Added comment for mutex and lock in struct rzt2h_pinctrl
  to clarify its use
- Replaced u16 to unsigned in rzt2h_pinctrl_write*/rzt2h_pinctrl_read*
- Updated rzt2h_validate_pin() to make used of BIT() macro instead of
  open coding (1 << pin)
- Added consistent spacing around colons
- Inverted the logic to reduce indentation
- Updated if checks to use `reg & PM_OUTPUT/INPUT` instead of
  `reg == PM_OUTPUT/INPUT`
- Dropped assigning drv_data for individual pins
- Opencoded devm_platform_ioremap_resource_byname() for "srs" resource
  to avoid error message print as the resource is optional
- Replaced set_rv with set
- Added RZT2H_GET_BASE() macro and simplified
  rzt2h_pinctrl_write*/rzt2h_pinctrl_read* macros
- Moved rzt2h_gpio_direction_output() below rzt2h_gpio_direction_input()
- Used consistent name ie reg64/reg16 in rzt2h_pinctrl_set_pfc_mode()
- Dropped updating Kconfig help string as that was done in patch 2/3
- Used 0xXX for consistent formatting in r9a09g087_gpio_configs
- Added reviewed-by tag from Geert for patch 3/3

v3->v4:
- Used patternProperties for pin configuration nodes
- Expanded example nodes

v2->v3:
- Fixed Kconfig dependency
- Added dependency for 64bit to avoid build errors on 32bit systems
- Dropped refference to gpio.txt in the binding file
- Added missing include for bitfield.h in the driver

v1->v2:
- Added a new DT binding file
- Added support for RZ/N2H SoC

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: pinctrl: renesas: document RZ/T2H and RZ/N2H SoCs
  pinctrl: renesas: rzt2h: Add support for RZ/N2H SoC

Thierry Bultel (1):
  pinctrl: renesas: Add support for RZ/T2H

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml    | 172 ++++
 drivers/pinctrl/renesas/Kconfig               |  13 +
 drivers/pinctrl/renesas/Makefile              |   1 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c       | 813 ++++++++++++++++++
 .../pinctrl/renesas,r9a09g077-pinctrl.h       |  22 +
 5 files changed, 1021 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzt2h.c
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

-- 
2.50.1


