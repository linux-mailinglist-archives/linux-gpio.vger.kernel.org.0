Return-Path: <linux-gpio+bounces-10119-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85179979326
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 21:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 307DC1F22200
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2024 19:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468C080C04;
	Sat, 14 Sep 2024 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="VyABFD5/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D275175BF;
	Sat, 14 Sep 2024 19:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726341039; cv=none; b=pNEcDMffx4llZuSWu88d3fxMuFC5J3AusJADMwDnjrBbIJaaIHkRGh8c2M3pKP+YoWwwKMdUItWUumoGV3JyiqvGa+PRGR3/oEFK8YrPg/T/cJHAebmQB9tyRYJZ+R2q7RzZhh03ilZ01KqqRE2vlJHEO5OkysJDVdpDQRY8V4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726341039; c=relaxed/simple;
	bh=fA1i+LFpTdmNvbAqJul+OWfUJe2k3jNyASYB+A1+Jfw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=hEtow3nZNDUu+hY7UNpoTS4uBC0x867/Q9cMrL/rJ3S7vi1cFRl7dOGuFtNVNvFqlPRtsWm2Gz8qlMRx5f+r5/m1XMl+lv4LD/+QRHM+1H7QTzMb1sRNPIwhQFY+snoAY4wqHrEjVdTCAZtb+8D94If85wWn6waLfMSG1h06D0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=VyABFD5/; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726341037; x=1757877037;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=fA1i+LFpTdmNvbAqJul+OWfUJe2k3jNyASYB+A1+Jfw=;
  b=VyABFD5/xy9xzbKAX+PRis8v8RrlatxtGwfFLsRMwsHzj5tiuJvoCBRM
   h7LrklL5N8Cs8CdIdF4PfsKq22D6cqkbTeGqxuze0BUSJkOPqHG1FdIvb
   VEEv74+eIKCY8euk1vUdGe9QmCSw4U8Lpd7pcjyobTB7r2QR5Olciq+cw
   +NoxmtDo2SAb+EAYi9QJq96lgEZrEVJoZ81NEILvv9I2rN5SYBLu0ZC0E
   o+WIeeWIyI3PwQ7xjz0L//Fu2MsCg814fwC1H3fvCPMmIozCGUWsko1ao
   6qTBirf4J3zJVClcocpWlTpqjEFr2Q9UAXTO4GEwwqKVCKV0yPy2Z6h+Y
   A==;
X-CSE-ConnectionGUID: aORpv4XtRiOtN55YVRgpfg==
X-CSE-MsgGUID: Bdxol7M6R++9c8ZMkPuUPA==
X-IronPort-AV: E=Sophos;i="6.10,229,1719903600"; 
   d="scan'208";a="31675563"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Sep 2024 12:10:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 14 Sep 2024 12:10:30 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sat, 14 Sep 2024 12:10:28 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH 0/2] pinctrl: ocelot: add support for lan969x SoC
Date: Sat, 14 Sep 2024 21:10:07 +0200
Message-ID: <20240914-lan969x-pinctrl-v1-0-1b3a4d454b0d@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI/f5WYC/x3MTQqDQAxA4atI1g2Mgz9Mr1K6mIlpDUi0GRVBv
 HunXX6L907IbMIZ7tUJxrtkmbWgvlVAY9Q3owzF4J1vXKg9TlFDFw5cRGm1CRsKbUuOU+86KNV
 i/JLjf3w8i1PMjMmi0vj7DLzjZ+ON4bq+sBlaR30AAAA=
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
Daniel Machon (2):
      dt-bindings: ocelot: document lan969x-pinctrl
      pinctrl: ocelot: add support for lan969x SoC pinctrl

 .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml      |  32 +++-
 drivers/pinctrl/pinctrl-ocelot.c                   | 203 +++++++++++++++++++++
 2 files changed, 227 insertions(+), 8 deletions(-)
---
base-commit: 3cfb5aa10cb78571e214e48a3a6e42c11d5288a1
change-id: 20240912-lan969x-pinctrl-4c955c0eb706

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


