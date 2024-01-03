Return-Path: <linux-gpio+bounces-1987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A14B822E42
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 14:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFD831C23566
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jan 2024 13:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74800199B8;
	Wed,  3 Jan 2024 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="oBVzL9xV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33811A28F
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 32E863F74C
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2024 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288536;
	bh=yWWe6H23myTSvjfVff9zG/62qYLCD/sbWwOipagSJuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=oBVzL9xVAQ/5evAZW5+By3z6tyFpB0FMqcCpS6fw/l4c42E9JdB8Rg8bzNWUrRd/s
	 pCx0TdiHBXbV0TIIRAVHZpZYgTZvsUm/zHoVasJs1h5mNzffkVj0ecPkdrzOsPIcca
	 /FhuSKaKC97Nxf1rlVsaCpMexD7k4voHjG10GW9czu8GUqmMGUwyIDvPY94HYmODre
	 RqQxKKjhSeUC42/VQmI6zAComeRcdDktGXKvO+ocmF+sceJbjuDKrlZjk2cFGjnMdy
	 NcgiCkO0KKGynZPt7PzIbcq3vEA9Vl77X5OYtS2TFmQ4kDHnv+bIhG6XtJR6jixrNK
	 ofvSUFR3k5Y4A==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a28102bc0f1so85408566b.0
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jan 2024 05:28:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288534; x=1704893334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWWe6H23myTSvjfVff9zG/62qYLCD/sbWwOipagSJuM=;
        b=DmDhsco2dpGhgKYKIq7P2mZ5DCPtSUvl8kmKGyo2homLNGRu/BeMXW4GVDclD4kpqG
         35NsEh3LdBtioDM0kWR/Gpf1DBLojvcW108HaNWaN8tGWN6wGQxkThS1fgB4axg/azD+
         gC3FU/uHq8rJ/dA2bMM1/9si9ILMdS6vmzYg4YAr9BK46tnwDIp+ldRCP3XQIf42jPK4
         xL34kKkpy6TbW5PK6ZnThq2HfSjzVMfJPrr+Qj+DQi3B16yE9A15KLCboFec5x2jPTVT
         mFt9wZ8D7hK4R4LcBggLyJiM4DKxBCDucaC6nq6wf2yxsH/8RyhUvYIQbeDKZsi8k9aK
         HCKg==
X-Gm-Message-State: AOJu0Yyi3i9Y8CUz5GPqsDzTO2uzG2dVe5UdoC9rtHwF7GwS7ZQI6F/5
	/aKKp+uKA7Junhu7aYxJzUFBjLkzrQLsYYM9cdayeHcMmojleYH8yA/p5xmY2DSlAVQLJnvbZnP
	BI4zZI6YKw66CMS3T/TVw8qkbYt2mVCP18rJfAxRWGFva9Q==
X-Received: by 2002:a17:907:36c7:b0:a27:d55d:73d3 with SMTP id bj7-20020a17090736c700b00a27d55d73d3mr3348198ejc.23.1704288534032;
        Wed, 03 Jan 2024 05:28:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCAg1DXImZMtkXe7TWoLXcnmyhjNjWaMpeNZkVAjpDt/dd1YDA1CXZvWTJalXLzI+MUZw+JQ==
X-Received: by 2002:a17:907:36c7:b0:a27:d55d:73d3 with SMTP id bj7-20020a17090736c700b00a27d55d73d3mr3348189ejc.23.1704288533638;
        Wed, 03 Jan 2024 05:28:53 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:28:53 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 0/8] Add T-Head TH1520 SoC pin control
Date: Wed,  3 Jan 2024 14:28:37 +0100
Message-ID: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a pin control driver for the T-Head TH1520 RISC-V SoC used on
the Lichee Pi 4A and BeagleV Ahead boards and updates the device trees
to make use of it.

It can be easily tested using my th1520 branch at

  https://github.com/esmil/linux.git

..which also adds the MMC, PWM, ethernet and USB drivers that have
been posted but are not upstream yet.

Jisheng: I've added this driver to the generic TH1520 entry in
MAINTAINERS like you did with your USB driver. Let me know if that's not
ok and I'll create a separate entry for this driver with me as
maintainer.

Drew: The last patch is purely based on reading the schematics. It'd be
great if you could give it a spin on real hardware.

Changes since v1
- Keep pinmux data for each pin so we can mux by type instead of directly
  using the mux index. Eg. use function = "uart" etc. (Linus)
- Drop the strong pull-up property and prevent Linux from combining the strong
  pull-up with the regular pull up/down. This also means we can't report such
  usage if it set up by earlier stages, but that problem is deferred until we
  encounter it (Linus)
- Reference pinmux-node.yaml properly (Rob)
- Specify valid pin names for each group (Rob)
- Enable bus clock (Emil)
- Implement gpio_request_enable() and gpio_set_direction() for automatic
  GPIO handling (Emil)
- Drop patch adding gpio-ranges to the gpio-dwapb bindings that is
  merged in gpio/for-next. (Emil)
- Patch 6/8 adding GPIO line names for the Lichee Pi 4M module (Emil)
- Various code nits (Andy)

/Emil

Emil Renner Berthing (8):
  dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
  pinctrl: Add driver for the T-Head TH1520 SoC
  riscv: dts: thead: Add TH1520 pin control nodes
  riscv: dts: thead: Add TH1520 GPIO ranges
  riscv: dts: thead: Adjust TH1520 GPIO labels
  riscv: dts: thead: Add Lichee Pi 4M GPIO line names
  riscv: dts: thead: Add TH1520 pinctrl settings for UART0
  riscv: dtb: thead: Add BeagleV Ahead LEDs

 .../pinctrl/thead,th1520-pinctrl.yaml         | 372 ++++++++
 MAINTAINERS                                   |   1 +
 .../boot/dts/thead/th1520-beaglev-ahead.dts   |  87 ++
 .../dts/thead/th1520-lichee-module-4a.dtsi    |  43 +
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  28 +
 arch/riscv/boot/dts/thead/th1520.dtsi         |  62 +-
 drivers/pinctrl/Kconfig                       |   9 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-th1520.c              | 891 ++++++++++++++++++
 9 files changed, 1478 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
 create mode 100644 drivers/pinctrl/pinctrl-th1520.c

-- 
2.43.0


