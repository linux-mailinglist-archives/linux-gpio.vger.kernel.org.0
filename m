Return-Path: <linux-gpio+bounces-30741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC9D3AE8F
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 16:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99E0630F5586
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 15:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B407387349;
	Mon, 19 Jan 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="aAjyLJjC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE2937F74E;
	Mon, 19 Jan 2026 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835220; cv=none; b=IKLtT8l5HxrP3j6mQaY2l575QLzV8PYYM614M3yEivissv8fCg0CRIksaefc6lI1/GkzW9caeXy4CV3zmCWc1hLc3yXx6YBN/oP2guaihxB3nnDfg5ibcjQIP0WNBSzKvZfH8XX/u+A5ZJZ0SAnYHrWKH/HFpMfRkRUQ75vr5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835220; c=relaxed/simple;
	bh=I9MEXnwJEYO62O9tKx7OOsMckkALTXhUPIVdZdJtTxw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=lk0H4xyMabpHqfDSHl6+2M37OsIrDUVEngLVQRJwknNRNMEP2KZ3G18t8hgKViWzgOHyvIDIMUOFGVrVhKaVQP7PBnGYWD3GHyTMbzaE9YsTYUAbdqYJrP6rG0mWhNPACtuDeEarCbr8RRQvPK47joMZqM5Jos2QKnobcM356w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=aAjyLJjC; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768835218; x=1800371218;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=I9MEXnwJEYO62O9tKx7OOsMckkALTXhUPIVdZdJtTxw=;
  b=aAjyLJjCoMQ4Ji52WtCCkOCA416IhtdRjwM+4UUGBGgXD5eqb/uAh/bj
   7tEkJSx8ycmZyNFUA7+IyPlcyPk23QVvn9oYs7GyVPnhcqQRkQ6nf+2AT
   RjCSxbdvejHsNQnks8XwIyfi2Q/q108qeSWRfolf7ahZtrxtgpsJQSSFC
   CiqkDttsEiKJh9r4fZ9MAaNfFtKKlWk5S7GvnCyPahBxn4ESAkUuvaHmq
   LKP6KClwYERr+SCz9YLi/j/r5AI6FnSQtdJEhXBvzLCXvWdbNOG0nlQAD
   16zX9feFhDcVeHIkHfbqSVjUaGw1Sqvk0nX+vXxpg71sphrgOWHHEmX/I
   w==;
X-CSE-ConnectionGUID: 8vEf+C5CS42SOqXswAgYjQ==
X-CSE-MsgGUID: UWW0FlR5SU+cmFGtIwDVKQ==
X-IronPort-AV: E=Sophos;i="6.21,238,1763449200"; 
   d="scan'208";a="59119149"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 08:06:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 19 Jan 2026 08:06:27 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 19 Jan 2026 08:06:25 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Subject: [PATCH 0/3] pinctrl: ocelot: Extend pinctrl-ocelot driver for
 lan9645x
Date: Mon, 19 Jan 2026 16:06:08 +0100
Message-ID: <20260119-pinctrl_ocelot_extend_support_for_lan9645x-v1-0-1228155ed0ee@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGBIbmkC/x3NQQrDIBBA0auEWVeItgrpVUoRYybtgDgy2iKE3
 L3S5dv8f0BFIaxwnw4Q/FIlzgP6MkF8h/xCRdswmNm4WeurKpRjk+Q5YuLmsTfMm6+fUlia31l
 8CnlxN9uVdcHqdQ12MQgjWAR36v/Z43meP+F/P7l8AAAA
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Bartosz Golaszewski <brgl@kernel.org>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, Daniel Machon
	<daniel.machon@microchip.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev

LAN9645x is a switch chip family with several on-chip peripherals, such as
a GPIO controller. The LAN9645xF subfamily has 3 SKUs with the difference 
being number of supported ports. There are 5, 7 and 9 ported SKUs.

The LAN9645xF family come in a VQFN-DR package and supports 51 GPIOs, and
up to 7 alternate modes per pin.

Due to the way this GPIO controller modifies alternate modes on a pin, this 
means the usual pin stride is 2, but the alternate mode stride is 3. This 
is the first device supported by pinctrl-ocelot where these two numbers 
are not equal. As a consequence the register address calculation in the 
REG_ALT macro is generalized to handle this.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
Jens Emil Schulz Østergaard (3):
      dt-bindings: pinctrl: ocelot: Add LAN9645x SoC support
      pinctrl: ocelot: Update alt mode reg addr calculation
      pinctrl: ocelot: Extend support for lan9645xf family

 .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml      |   6 +
 drivers/pinctrl/pinctrl-ocelot.c                   | 184 ++++++++++++++++++++-
 2 files changed, 189 insertions(+), 1 deletion(-)
---
base-commit: cbe8e6bef6a3b4b895b47ea56f5952f1936aacb6
change-id: 20260113-pinctrl_ocelot_extend_support_for_lan9645x-56a51bba592e

Best regards,
-- 
Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>


