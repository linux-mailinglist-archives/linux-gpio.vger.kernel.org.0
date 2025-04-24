Return-Path: <linux-gpio+bounces-19229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F025FA9A192
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7224188188E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 06:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517D21E2847;
	Thu, 24 Apr 2025 06:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="jtlCVo/a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315091DE2A9;
	Thu, 24 Apr 2025 06:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475649; cv=pass; b=A56Ezqvo41kCbvR6CzlbeNgn32eOzZwLXmmUgaoyvTSCO2AaCN13Y6iYVwbXVCAqTo+peMzLW+WCAsh0b0i7aG21uFzfKO+WVgf//rJDHYJ1wsSQT5PjaXcYhUqdzE6erzxx3bfxaK1hMcb7NCcHjTnN1GN85vLf+Oo9y9SQTqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475649; c=relaxed/simple;
	bh=DABFka4HbdPBcXLGqrG9SJ6E1qB3G++DfXkrYihMjQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CcI/m50B9pVdb7GgnWOMl0IK3Hnaz8paaEjdWUaw39obA0XZhtn9VdbXfw4/9mV/ykkiHwO0oOx9wOB1JFXQ0tr8scqcq4aQpNgLs6+TbcCiN/JVfdnffvDXyLCnKuh6FsvosoQI5FZ/HBw6Nza7kQ3iMX5MoJ0HtOcuTTqpPQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=jtlCVo/a; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745475632; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZgWdWs6T4jDSmg8fPAFKBv3su7BYKlvoYG1bfveGbzjx7mstJAZVg7h/94HHVEemi1FjPlR7MyjS1sxI6XCxO4JcamM3/mMPtx9eXSYrn/DdQeNOJDpEh3LkDyN727VDE+OhAECv0sW+JfyLzfKeAI1pk8PlN/gQHWSkUNb2euE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745475632; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=a7HW1AHqiaoZotNjYh30I6Q8Dv5nJzE7H5N8Hb9REWM=; 
	b=IwnTKoSg3U5E1ojVPfpbqcd5JbFncewrn2LzJf5MLCCzBcvjtuEMuvsbZmZ7JF3Phcu6nEZwtpElz92m3wObDCdsC9KmIU8lByu7y35tBhS5Aom9lbFqoxypc78/aR229cNDKpPxykU3RobLQ71rjwTnC97R8pbyz1+hDJIAVWo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745475632;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=a7HW1AHqiaoZotNjYh30I6Q8Dv5nJzE7H5N8Hb9REWM=;
	b=jtlCVo/au+kCuKDcnZvatUtMmtYJ+kaNW5G9/GsFpOADTN6NFoeWN4uSFrrUTbwT
	/AYg68byV6+qz0B8+uTePracXzNCMCRIl43yW3lTj9MdgAYcRvWkHBcib7ugUoGzMIx
	vuD2TJmdMBfoKNCPneXjQ2Kxg3RS9YvuC1OtoG5EZot5p5rviKuMWcAfKxLasYEkz/T
	KQ5Wya3mD5VHJ4HmLi5D7VRGFwT7oppwUaR74GYtkbB4zAxdNpJ96iaoFNZwkLEEv/E
	Q8N+lOWvgeJ8ynCmXRCco/GTHtno4laff/f7OHvDDpmyFQV0P6fPUQu1B22ueYt1tuY
	z7dPgxf1ug==
Received: by mx.zohomail.com with SMTPS id 1745475629816913.3831701579998;
	Wed, 23 Apr 2025 23:20:29 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 0/3] pinctrl: starfive: jh7110: support force inputs
Date: Thu, 24 Apr 2025 14:20:14 +0800
Message-ID: <20250424062017.652969-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The input signals inside the JH7110 SoC (to be routed by the pin
controller) could be routed to GPIOs and internal fixed low/high levels.
As the total GPIO count of JH7110 is not very high, it's sometime
feasible to omit some hardwiring outside the SoC and do them in the pin
controller. One such example is the USB overcurrent_n signal, which
defaults to low at SoC reset, needs to be high for the USB controller to
correctly work (the _n means low indicates overcurrent situation) and
gets omitted on the Pine64 Star64 board.

Add the support for hardwiring GPI signals inside the JH7110 pin
controllers, via two virtual "pins" which mean fixed low/high.

Changes in v2:
- Use virtual pins instead of special properties.
- No longer RFC.

Icenowy Zheng (3):
  dt-bindings: pinctrl: starfive,jh7110: add PAD_INTERNAL_* virtual pins
  pinctrl: starfive: jh7110: add support for PAD_INTERNAL_* for GPI
  riscv: dts: starfive: jh7110-pine64-star64: force no USB overcurrent

 .../dts/starfive/jh7110-pine64-star64.dts     |  7 ++++
 .../starfive/pinctrl-starfive-jh7110.c        | 41 +++++++++++++++----
 .../pinctrl/starfive,jh7110-pinctrl.h         |  4 ++
 3 files changed, 45 insertions(+), 7 deletions(-)

-- 
2.49.0


