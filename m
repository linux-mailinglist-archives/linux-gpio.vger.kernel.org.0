Return-Path: <linux-gpio+bounces-15687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3388DA302C0
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 06:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC0667A3511
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 05:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0541D6DC8;
	Tue, 11 Feb 2025 05:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ll2AY41R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6430626BDA7;
	Tue, 11 Feb 2025 05:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739251092; cv=none; b=fmmvWey5OimdyRB1d/RmhbqqAxiPkC1XpgcfyPMffLQpQwD9I2YUPFfli47upPEevHQAxYGcDhdrYJqGypVQsGzvRODHLpZplDf8AtQAm/MSyYY9lPUw1B9MIeZwOF8nAKzpaRNSo6uD3kuyXIhZ5tw6OxbloC7CxQKKxtn1fjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739251092; c=relaxed/simple;
	bh=N6CCy1fGYq4C9K6nlPTKU+07WdNYTpGi77Dlw0TLX3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=soZZe/xWYZFZmudFyhRfPl0CIxMJ+qx9DGtT5zV5g7eTcPvVkHcTlUpusgPvmkWI6wnSdi4/4y3oXmYKVIJZdHS6F1yFut41E1FB2xvsLSJABZjutD7AL7uFdyvIS4OOtiHMIvMlG+mhiukcyuG6w/NYxe98v+OgOTqX9P2niWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ll2AY41R; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c050c6e201so247674885a.0;
        Mon, 10 Feb 2025 21:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251090; x=1739855890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WzpjNfBqOlKT2BSz+1kp1kL8skU7thu6xUdM/EtgpZs=;
        b=ll2AY41R448Ma+fms+llnzwsi2EvxorV8/9oqhxQsi10J0zy6io8xTh/JaL+aDQRtu
         jicxeKNoPD2FEMeXwSFyxZ4mjVe8M+tJwBSjVGztD4nyKtL3tFI89iJlEBpF4HCKeuf8
         uo6q96UoCHRVApqnFFMWcuZybakpKtapo9X7KQW9KcIqWzgEQtFKMqDU3/hNCmz4Izd0
         21Ci8d+A4L6o7kgTcAjiIABCYpKhlF/+TYmy2nSpfrU4C9tzEaGLs7mwuRy2tCnw2tJd
         +V1PmgTUvWnrNEKSEu5jZ7AkKosRs/ucw+7Zz7Nu3Dq6YFfMMyFU3fLzF1/Zf9P7tkp0
         DCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251090; x=1739855890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzpjNfBqOlKT2BSz+1kp1kL8skU7thu6xUdM/EtgpZs=;
        b=SrslAihfkCOAaV+9Vl/fUyzkCGf1mQPo0Hbny1W6uq5ocgcJNy8YvdVke126h/nfxy
         A7ZNrnGluFHnWr+2OZefW4OuMS4HvZUBKe8JaRKfyzYJI3fMQ5PvHxpHFwZ3d9AS/RTg
         9AXg+DHrsmjDzocLyqLRa+oAn4EvJqf5ItUJbyzr1XKZbTcK2vm11JetHBJj7HLJCEfA
         JN6pZjzGLLNxIFlj9yklezO3a0jbR8ZxBEvKG6YjW5rlXMS7Y1i8o2lFTw2S5pekVa8G
         IO9ts05scHTY2sL0YVQFGpY+G2U7FocIGiB4R9+esM+znmZ3U9kARjKEvsgniVKEWHPW
         fcaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfDAOp0mL91/FyUJwxW6eODhlHYmdX7Eqreee4tLHYjUbtg8GoE80tQ+sbVxj8+Zkp4AaFa3/Jbe+IGw==@vger.kernel.org, AJvYcCVMwD7poXvoeEc2jHht+E4dgBDvG9Cc3MUl0ZpIGqvvAVMsGN3FjLcu2p8rvJQKjmi5ABZxGz5R1bImIXzz@vger.kernel.org, AJvYcCXSN8bdEx2qWQ+54O5yomWkjkOoSWSF+/XAQmpEM/WnLPCU3EIkFsQ0qqB8IPS/NvNxJ8LRyqjEIzMw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ceoIP9y0pXcCXbI9OaxRiMUIDZm4ppq/AZOHtZ7tOF7Cg6Mq
	v0AXthv6eVXjvenyISsA54+GDh1Jweal4IZplLdV6cIFUsPVLeJH
X-Gm-Gg: ASbGncu4LUqgvUTLGmu9vlIJAYM21hKe2bDMhNpK/OAiUbOOnvJBTEewFdRj9MQJRbu
	C6EqGpaG07k0Vn2DnYfFbApPvIEX60WFh65nyHBB8fDyKiPIhXuzX7rO6VKf7txyqkI2zt7o8L2
	nccrd5M6Xw59/yeYWuAtkIeUf9f21QJlFRJD9RaiGi/43Mn7hv97nyzoYGfBzWug9P96Y2k+H59
	GN9ljm0AcJ2e3/DWq0c8QjOXJb4O6ZgWD9mhd/jHfcRIb931zS32mvxcB3UsbEJxUY=
X-Google-Smtp-Source: AGHT+IEI9E5fTbRoq6W5/oLfP1d80KE78Bpt9hACo2akmSZ485e5xOa0rGu7oPZ/n2fRyaJ/vpAwSg==
X-Received: by 2002:a05:620a:1903:b0:7be:6f05:1b2a with SMTP id af79cd13be357-7c047cae609mr2807842585a.56.1739251090233;
        Mon, 10 Feb 2025 21:18:10 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041e9f506sm624267285a.71.2025.02.10.21.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:09 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for SG2042
Date: Tue, 11 Feb 2025 13:17:48 +0800
Message-ID: <20250211051801.470800-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SG2042 has a simple pinctrl device for all configurable pins.
It supports setting pull up/down, drive strength and input schmitt
trigger.

Add support for SG2042 and SG2044 pinctrl device.

Changed from v1:
- https://lore.kernel.org/all/20241024064356.865055-1-inochiama@gmail.com/
1. Fix the binding documentation error.
2. Refactor the cv18xx code so SG2042 can uses the same code.
3. Add SG2044 pinctrl support as it has the same layout.

Inochi Amaoto (8):
  pinctrl: sophgo: avoid to modify untouched bit when setting cv1800
    pinconf
  pinctrl: sophgo: introduce generic data structure for cv18xx pinctrl
    driver
  pinctrl: sophgo: generalize shareable code of cv18xx pinctrl driver
  pinctrl: sophgo: introduce generic probe function
  dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC
  pinctrl: sophgo: add support for SG2042 SoC
  pinctrl: sophgo: add support for SG2044 SoC
  riscv: dts: sophgo: sg2042: add pinctrl support

 .../pinctrl/sophgo,sg2042-pinctrl.yaml        | 129 ++++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  72 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   6 +
 drivers/pinctrl/sophgo/Kconfig                |  46 +-
 drivers/pinctrl/sophgo/Makefile               |   8 +-
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c      |  27 +-
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c      |  27 +-
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c       | 602 ++++-----------
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h       |  66 +-
 drivers/pinctrl/sophgo/pinctrl-sg2000.c       |  27 +-
 drivers/pinctrl/sophgo/pinctrl-sg2002.c       |  27 +-
 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c   | 296 ++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.c       | 655 ++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.h       |  49 ++
 drivers/pinctrl/sophgo/pinctrl-sg2044.c       | 718 ++++++++++++++++++
 .../pinctrl/sophgo/pinctrl-sophgo-common.c    | 451 +++++++++++
 drivers/pinctrl/sophgo/pinctrl-sophgo.h       | 136 ++++
 include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 +++++
 include/dt-bindings/pinctrl/pinctrl-sg2044.h  | 221 ++++++
 19 files changed, 3217 insertions(+), 542 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.h
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2044.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sophgo-common.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sophgo.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2044.h

--
2.48.1


