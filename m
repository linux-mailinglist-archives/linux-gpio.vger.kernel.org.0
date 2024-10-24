Return-Path: <linux-gpio+bounces-11901-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E59ADC72
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 08:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCE6D282456
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Oct 2024 06:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CFE189B86;
	Thu, 24 Oct 2024 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mg3TLwOc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880206CDBA;
	Thu, 24 Oct 2024 06:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729752261; cv=none; b=FnLU/BTBqKa9dd7sUn6o0eqSSamNs73EYyLl6dNSH0P9Z1S4fogtEmGp+lZnHDK8oS+eSch0i7N8xSvu2AzYY7l7ikEhf2gVCX64k+Tzh13wI527ycfBFAgv59x5+MWG0rv+ohnoTkfdX2r4I4d3f0y4BRL4sTPo4vzdbDFB4Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729752261; c=relaxed/simple;
	bh=NXetDMK/L1pnmV2P2THQJEIEy11n4oSpCXDcoIwy05A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7quJemYQ20p+hbBNvUR7RkNSBiZO2EGS/Pt/6Sjx3vaMGzwf/tSXvyOeowwZq5VXgB8YLzKGqlbPJjKEQZk7RRxMZD93UInJ2ncUGZA1XONvXHVZp5unZdADdcDesFkeyChPo+536/vhWwmyEj9Il+1cEQh9nn8oCRvGTRdGBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mg3TLwOc; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-28c7f207806so292860fac.3;
        Wed, 23 Oct 2024 23:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729752258; x=1730357058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2FoyLE/Cf4zQLw+m56F5a8lGY5yFq1EiEZ4WN3sp8cs=;
        b=mg3TLwOc6LBlbfIlJLqjnRNSOXbBEhowRWG7Ih4oy8s27CRH7lPWgQyd77cqNmMNcW
         bdh3v5WLIXma2sr37kFyzDUlT66apOEtzL0P6MSjyE4/bqUBgi7Fpzb7004X7RDe1Zy7
         R3/OlxPrP+S+ffY2o5zgCJdOK4UNQlT/APg8dB40AjyHBB70wd7MWqCDM+S12i4R8yFZ
         fEys2caM733lACRiUwidht+UZmPP4udbNzwF57KT/yXZfYekmvqZcDkurJftq5hOG44p
         WLkVrzwsQNsCOD2OoOQWywlptPD1/Wd7phsLhxMJxWWnAlReTJxhgOoWZnos1rFZDH3Y
         ZF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729752258; x=1730357058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FoyLE/Cf4zQLw+m56F5a8lGY5yFq1EiEZ4WN3sp8cs=;
        b=KNGQFMa9JGj9Xz9+D4JBPcPiuFH0/TeJiX84dMK/U5sKn2XECc4N956BsJIlRVtuBK
         YyBIlyFrAaAcKrNfhjXfQMpdaaZWLAtRWcWE611n11VhzqPi62bCBOZoyFBS6BlzYYu+
         Bv7kcX91K5YAZLupSrC8eGRBA4mIvS4IdJ4ePrA4NnwLejh+kbpLaDOqMAM9AYlIHVYd
         mQMwZC380XqShS8QOHmBTQiMcIutwnY3xTg9DPxoERV8Qnswt/7Pry3fTq8SPOUIh1Tp
         ez25pjNUPRXjxWVdVobdH0FLAT/O3idCDOtINYYPkwWfjP6Xb6QMd/Pq4lcjkS46IYKd
         9SBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDQDo9p0atVdx1JaWc7ks+NtdRr8ZxON6mP32mKJmprazTnwBNE5ikifxsuPTNfCKGlz/qitIWc7jH@vger.kernel.org, AJvYcCXTofoHPnqQN3oPu3rINXBQliIhREVWKRnvfkkoojZ8SXeMI+x/nLWvOKZSXnHMymupEFdiy7cBMfzBZ5ud@vger.kernel.org, AJvYcCXxETrdJljLQp0axzT4VWKv4F3NhAz9zx6qbp056GVUr2jJZXFNdgzZIZgLRwlb3M/eeqpVjkw628eSCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAvQFnAR6XqSXRu8O04dIZ+kLv39GQ62JtyJJ3ckx1PZXrfocW
	rb7hkD54YMXtL9R00l8/kYZqEgKJVeUXHvYERb0Q63NYyCkXYCiz
X-Google-Smtp-Source: AGHT+IGZ+O2r4XtVYPHiHdNtVx8h+km4OBAtGWY/VsB1qpgXll72J2UuhE4eux2WpZ4NG1pffRU0nA==
X-Received: by 2002:a05:6870:1701:b0:288:816a:72e6 with SMTP id 586e51a60fabf-28ccb44c8c7mr5021125fac.7.1729752258523;
        Wed, 23 Oct 2024 23:44:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1312ccbsm7311977b3a.1.2024.10.23.23.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:44:17 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] riscv: sophgo: Add pinctrl support for SG2042
Date: Thu, 24 Oct 2024 14:43:53 +0800
Message-ID: <20241024064356.865055-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
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

Add support for SG2042 pinctrl device.

Inochi Amaoto (3):
  dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC
  pinctrl: sophgo: add support for SG2042 SoC
  riscv: dts: sophgo: sg2042: add pinctrl support

 .../pinctrl/sophgo,sg2042-pinctrl.yaml        |  96 +++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  72 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |   6 +
 drivers/pinctrl/sophgo/Kconfig                |  14 +
 drivers/pinctrl/sophgo/Makefile               |   2 +
 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c   | 583 ++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.c       | 642 ++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-sg2042.h       |  50 ++
 include/dt-bindings/pinctrl/pinctrl-sg2042.h  | 196 ++++++
 9 files changed, 1661 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,sg2042-pinctrl.yaml
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042-ops.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2042.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2042.h

--
2.47.0


