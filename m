Return-Path: <linux-gpio+bounces-8013-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D4892621B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 15:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55744285353
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 13:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7119317C7AB;
	Wed,  3 Jul 2024 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="moCHim05"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C6517B50E;
	Wed,  3 Jul 2024 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720014413; cv=none; b=oU7N29DfSApWcbQ70Bz+xgSdtc7y6SiKlIeTXr1TMsFWA5TUyq5QcGOuyKUkAVX9q2O3y/ImLL0NX7ShuzIsJaSc1z/mpjDOjFAd67dQNF0pa0ggnkDjfVnHSs2EfrbQM9Hj8TGd9VZYmxAjMnykMiufaNY+cQBHG5PoZqudIEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720014413; c=relaxed/simple;
	bh=nu1tNQkTVLU7Ya4bLMrb5FRJPuYZJI5uK4FTnTbBLpo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DN6/YLEgmbk/dfccTlHMfwXgq49BCaY+S2cof1PEtWHzBdDO1YMUrQABC0YqJ9cGvxhMnqzMKxkRRChqxZbQgBpe31oOJFY4nuNqwQSSX4zgEc8ykcEnhugUn2NB8oatijLLFFHtj/OBIMSjzKaHEKFlCbbDHPp7dI8woOcPMUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=moCHim05; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 920C61C0003;
	Wed,  3 Jul 2024 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720014409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ztq3xYiUAHRYqYmVghJuHU6InRmUrnOPuEKwBJVsIWU=;
	b=moCHim054x+A4xuomiAEjt3JRF9ifcfaZSOByPlA4VGfKfaRcQdzhJnPEMHiUeaQhUakTF
	gBYsuXBW7TOQH5EtegRwy6urhE9mC07hr4PFXc1VR+NHaItsYBXp1/tNNgQBx+0cRgf8Nb
	kEvqpedZb4MnNg5r8/6H7rhMdcw0YmqqPD1HMqlgCuoT7B6pialZkt8HYsC6z0KOEuMQgK
	TAVqZG7EsVn3cidQ+mD0uMD81+9Dz67mv/d2VEAdDPJyl81HsS1cyLYYACGCoBxeQx1k7x
	29V8MPAQ29sLOwSTKH9vZdXnxHVEbMm2xOXyTbrGIGSB/6HgfS+GjsB/BuDS1g==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH v2 0/2] Add Mobileye EyeQ5 pinctrl support
Date: Wed, 03 Jul 2024 15:46:46 +0200
Message-Id: <20240703-mbly-pinctrl-v2-0-eab5f69f1b01@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEZWhWYC/3XMSwrDIBSF4a2EO+4takseHXUfJQM12lxINKhIQ
 3DvtZl3+B843wHRBDIRHs0BwWSK5F0NcWlAz9K9DdJUGwQTd9aKHle17LiR0yksqGzXKnsbmOw
 01MsWjKXPyb3G2jPF5MN+6pn/1j9Q5shQ913PBzG1ismn8j4t5K7arzCWUr44Mv7kqgAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev-13183
X-GND-Sasl: theo.lebrun@bootlin.com

This is a new iteration on the Mobileye system-controller series. It
used to be sent as a single series [0], but has been split in the
previous revision (see [1], [2], [3], [4]) to faciliate merging.

This series adds a driver handling EyeQ5 (and only EyeQ5, not EyeQ6L nor
EyeQ6H) SoC pin config and muxing. It is an auxiliary driver being
instantiated by the platform clk driver.

Related series are targeted at clk [5], reset [6] and MIPS [4]. The
first two are receiving a second version. The last one has no change
and stays at its V1.

Have a nice day,
Théo

[0]: https://lore.kernel.org/lkml/20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com/

[1]: https://lore.kernel.org/lkml/20240628-mbly-clk-v1-0-edb1e29ea4c1@bootlin.com/
[2]: https://lore.kernel.org/lkml/20240628-mbly-reset-v1-0-2a8294fd4392@bootlin.com/
[3]: https://lore.kernel.org/lkml/20240628-mbly-pinctrl-v1-0-c878192d6b0a@bootlin.com/
[4]: https://lore.kernel.org/lkml/20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com/

[5]: https://lore.kernel.org/lkml/20240703-mbly-clk-v2-0-fe8c6199a579@bootlin.com/
[6]: https://lore.kernel.org/lkml/20240703-mbly-reset-v2-0-3fe853d78139@bootlin.com/

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Changes in v2:
- Kconfig: replace "depends on AUXILIARY_BUS" by "select AUXILIARY_BUS".
- Kconfig: add "depends on OF" for pinconf_generic_dt_node_to_map_pin().
- driver: cast dev_get_platdata()'s return value to (void __iomem *).
- Link to v1: see [3]

Changes since OLB v3 [0]:
 - MAINTAINERS: Move changes into a separate commit to avoid merge
   conflicts. This commit is in the MIPS series [3].
 - dt-bindings: Take Reviewed-by: Rob Herring and Linus Walleij.
 - Kconfig: do not depend on COMMON_CLK_EYEQ. This symbol is not defined
   in this series, it is defined in the clk series [1].
 - Kconfig: do depend on AUXILIARY_BUS.
 - Kconfig: remove outdated "select MFD_SYSCON".
 - driver: remove "#include <linux/platform_device.h>".

---
Théo Lebrun (2):
      Revert "dt-bindings: pinctrl: mobileye,eyeq5-pinctrl: add bindings"
      pinctrl: eyeq5: add platform driver

 .../bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml   | 242 ---------
 drivers/pinctrl/Kconfig                            |  15 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-eyeq5.c                    | 575 +++++++++++++++++++++
 4 files changed, 591 insertions(+), 242 deletions(-)
---
base-commit: f2661062f16b2de5d7b6a5c42a9a5c96326b8454
change-id: 20240628-mbly-pinctrl-bf76bf390a7c

Best regards,
-- 
Théo Lebrun <theo.lebrun@bootlin.com>


