Return-Path: <linux-gpio+bounces-8463-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4001194175C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 18:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71D9B1C23682
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 16:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA7D18C929;
	Tue, 30 Jul 2024 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HvpkmqcG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD60F189918;
	Tue, 30 Jul 2024 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355706; cv=none; b=gDXq0VM6UAvN6LSewQcA/7h4qwjSrdlNRSG9RrTMx+0EB9m/ZIiNrcjboMtKvYVL6o3xzZAOX0JM1QfuWcv+hNOx/4HYvvRxjcnQffPJApzpfJRIYdhLA2D11/eEw5mdOHFlQd82nUVWEmexqejB2qPtbodurgm5Wrn34dyeK0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355706; c=relaxed/simple;
	bh=nu1tNQkTVLU7Ya4bLMrb5FRJPuYZJI5uK4FTnTbBLpo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=onWRv6YuX3WgmnstrRfZdRNCpmQz2qYgg0D9zlz8hD6FQOWkJp6VkqVgW76Ntlh1tDz5VQmkRBvazBQREWL2zZ0FCb87DapqA/N7REW+2apLPtSkD323DzVPAZdHaPRvywbrraxIKwRqQcJS+2znJViS15BVOFY8sjfN+bn262w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HvpkmqcG; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8F0611BF207;
	Tue, 30 Jul 2024 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722355702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ztq3xYiUAHRYqYmVghJuHU6InRmUrnOPuEKwBJVsIWU=;
	b=HvpkmqcG0YS24q+WxzBOZ7umJCdkCtzREPINZDVSMERfKqniaF3m1PCR7FuZkfhhvjC2QG
	a5fYAfpH+24f0IaRkj4yxRRDltlKYk4tevfSptiRannNRIQ/UMVXABK0pX1Jcpqcrj2vNL
	1mbaZ/ZuuCVpA7W4ltspkqTtr/6sYqSSKPY1oxKy967EFG+FaNEEOyn4uu7+BQGlhh1K5z
	ihVWmCmRtABtEmqTKxuAsFFkISJvhffibaNcikZrwv8XPEnGAiAg+Lbo3WAKetDx84KQgT
	eQ4pmfFEYIk5p7nkdNUUjETUASmOP80HgPm3es5b2GnQus/SqLcbrscIDN0QrQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH RESEND v2 0/2] Add Mobileye EyeQ5 pinctrl support
Date: Tue, 30 Jul 2024 18:08:17 +0200
Message-Id: <20240730-mbly-pinctrl-v2-0-d470f64e0395@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Mailer: b4 0.14.1
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


