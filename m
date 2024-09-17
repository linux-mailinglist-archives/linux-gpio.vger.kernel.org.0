Return-Path: <linux-gpio+bounces-10215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF7A97B053
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 14:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B469328769E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 12:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF42171099;
	Tue, 17 Sep 2024 12:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lbsZKirE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839FB167D80;
	Tue, 17 Sep 2024 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726577182; cv=none; b=YOEIjebZU2Kxki+l4qIGJiaXJglpwNf6+7ypeBp4LQwilHXGnhCDMquKzC/Voxa4/Yll6mZbtDRXvOqoJUXDZaOq24nH+sTGavPL62Hqqp2olako+yRW0ruj5sLSks8uemI8xt8MDV+6cuV13St5oLR4srZlpkhyzchMazxi7h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726577182; c=relaxed/simple;
	bh=bZ5b6xs4uGqzHS2ma79eAvMeSc630G5yFXXNPzKYkfs=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Qq45VofQk4xTDwKDSgJTunrHQ1hZQVXrqTAiSkIz87ET2+/nDDwzgKczZIidCQf9X3mhn0ghSZT5L86fm5CzId8aCO92V4iDCAEH0yzQdYb3qVG0HwkZ2MuDYDNC5MXIkKzV+fEqFK9cJUbUinTrtzFaU+dM7NZkPy1WkFd1/Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=lbsZKirE; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726577181; x=1758113181;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=bZ5b6xs4uGqzHS2ma79eAvMeSc630G5yFXXNPzKYkfs=;
  b=lbsZKirE3G12ctX9T/I+AyaQ0T8VxleJIzo7/TYjFI5ruPP8Xm1pLSDl
   eeu9cGdQ274NFZIT5U+Kd3rrDXgpkzR4Y5j0z6xFdK0oWm4ATvil+fhkZ
   WV/EbzlzkCFeoMoRM2fPr9mdXrI3BV34/fLw+exW8QgACAuynRGpv7Ivf
   8zR2vygdL0Q4NGqdMkEYalW/XiGFH7UbtC2IeohSZJgvSlJuKqBKWBbuJ
   nDoxe/8Ste29sy4HHVI8T3c0+SNJ1FmurKjhp9U3sdW8FWj3WQCbesLQV
   twlSSklfO0/FaUe246+NViaiOm8uQaNnBdNGGhh3FYVriHJBLpYuAFijD
   A==;
X-CSE-ConnectionGUID: sQTfSDXxSnySe0MAAS5CZA==
X-CSE-MsgGUID: i09oUsOuQQeHeYeDjJje7g==
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="31891362"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2024 05:46:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 17 Sep 2024 05:45:55 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 17 Sep 2024 05:45:53 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH v2 0/2] pinctrl: ocelot: add support for lan969x SoC
Date: Tue, 17 Sep 2024 14:45:39 +0200
Message-ID: <20240917-lan969x-pinctrl-v2-0-ea02cbc56831@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPN56WYC/2WNyw6CMBQFf4V0bU2pBVNX/odh0cfV3gRabKHBE
 P7dQuLK5STnzKwkQURI5FatJELGhMEX4KeKGKf8CyjawoQzLpisOe2Vl61c6IjeTLGnwsimMQz
 0lbWkvMYIT1wO46MrrFUCqqPyxu0eC5m+Z5hh3zpMU4ifI57r/fHriL9Orimjtb4oYUUjNLP3A
 U0MxuF4NmEg3bZtXyiyPFLOAAAA
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14-dev

This series adds support for lan969x SoC pinctrl by reusing the existing
Ocelot pinctrl driver.

There are 66 General Purpose I/O pins that are individually configurable
to multiple interfaces. The matrix of available GPIO alternate functions
is detailed in the pinmuxing table of patch #2.

Patch #1 adds compatible strings for lan969x in the dt-bindings.
Patch #2 adds support for lan969x SoC pinctrl.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v2:
- dt-bindings: add only microchip,lan9691-pinctrl to conditional enum.
- Link to v1: https://lore.kernel.org/r/20240914-lan969x-pinctrl-v1-0-1b3a4d454b0d@microchip.com

---
Daniel Machon (2):
      dt-bindings: ocelot: document lan969x-pinctrl
      pinctrl: ocelot: add support for lan969x SoC pinctrl

 .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml      |  27 ++-
 drivers/pinctrl/pinctrl-ocelot.c                   | 203 +++++++++++++++++++++
 2 files changed, 222 insertions(+), 8 deletions(-)
---
base-commit: 3cfb5aa10cb78571e214e48a3a6e42c11d5288a1
change-id: 20240912-lan969x-pinctrl-4c955c0eb706

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


