Return-Path: <linux-gpio+bounces-572-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EAC7FBB6B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 14:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02324282D58
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 13:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0701158AA1;
	Tue, 28 Nov 2023 13:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l+sNZgcm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EEEEDA;
	Tue, 28 Nov 2023 05:25:39 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9036B60004;
	Tue, 28 Nov 2023 13:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701177938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ofb5DztxekXhN3yofu4Ak0quar7W/LQtnV5utRbbo1M=;
	b=l+sNZgcmAYNacJGLGSpjTmMqdte0rwzAYJYNk8htPE1wdgCBf1ALXWJ02vxb6XgXBwJ1fx
	76KDjQ/Ala/8VIvrvWOphL0RB3kRzCg/3H1cnvyL9a4ASDckPotv+RFnJGkjoJ39g9MXZZ
	Oyun/EL3sMKmPScZcbh1fQ/1YCgfMHpgy1yLFe1yKQekfTIgLIaJF9kxrx/YkwCc1I+4k+
	Ni3cIaqsiA75IMmI3A9egAf5z9PbdNxAytsdBg7IHO4TS/zcMgD69161TTW7UA0zClj/x5
	nche3zL2uH6/EVJxl9lY8Pa+ZmOPk0KZjM3Qts9k4ziFGyz6DF4BYYUYiolGpQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 0/5] Add support for framer infrastructure and PEF2256 framer
Date: Tue, 28 Nov 2023 14:25:29 +0100
Message-ID: <20231128132534.258459-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi,

This series introduces the framer infrastructure and adds the PEF2256
framer provider.

Patches were previously sent as part of a full feature series and were
previously reviewed in that context:
"Add support for QMC HDLC, framer infrastructure and PEF2256 framer" [1]

In order to ease the merge, the full feature series has been split and
this series contains patches related to the framer part (infrastructure
and provider).
 - Introduce framer infrastructure (patch 1)
 - Add PEF2256 framer provider (patches 2, 3, 4, 5)

Compare to the original full feature series, a modification was done on
patch 3 in order to fix a dependency issue detected my a kernel test
robot.

Best regards,
Hervé

[1]: https://lore.kernel.org/linux-kernel/20231115144007.478111-1-herve.codina@bootlin.com/

Changes compare to the full feature series:
  - Patch 3
    Add 'depends on HAS_IOMEM' to fix the following issue detected by a
    kernel test robot:
       WARNING: unmet direct dependencies detected for MFD_CORE
       Depends on [n]: HAS_IOMEM [=n]
       Selected by [y]:
       - FRAMER_PEF2256 [=y] && NETDEVICES [=y] && WAN [=y] && FRAMER [=y] && OF [=y]

Patches extracted:
  - Patch 1 : full feature series patch 21
  - Patch 2 : full feature series patch 22
  - Patch 3 : full feature series patch 23
  - Patch 4 : full feature series patch 24
  - Patch 5 : full feature series patch 25

Herve Codina (5):
  net: wan: Add framer framework support
  dt-bindings: net: Add the Lantiq PEF2256 E1/T1/J1 framer
  net: wan: framer: Add support for the Lantiq PEF2256 framer
  pinctrl: Add support for the Lantic PEF2256 pinmux
  MAINTAINERS: Add the Lantiq PEF2256 driver entry

 .../bindings/net/lantiq,pef2256.yaml          | 213 +++++
 MAINTAINERS                                   |   8 +
 drivers/net/wan/Kconfig                       |   2 +
 drivers/net/wan/Makefile                      |   2 +
 drivers/net/wan/framer/Kconfig                |  42 +
 drivers/net/wan/framer/Makefile               |   7 +
 drivers/net/wan/framer/framer-core.c          | 882 ++++++++++++++++++
 drivers/net/wan/framer/pef2256/Makefile       |   8 +
 drivers/net/wan/framer/pef2256/pef2256-regs.h | 250 +++++
 drivers/net/wan/framer/pef2256/pef2256.c      | 880 +++++++++++++++++
 drivers/pinctrl/Kconfig                       |  15 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-pef2256.c             | 358 +++++++
 include/linux/framer/framer-provider.h        | 194 ++++
 include/linux/framer/framer.h                 | 205 ++++
 include/linux/framer/pef2256.h                |  31 +
 16 files changed, 3098 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
 create mode 100644 drivers/net/wan/framer/Kconfig
 create mode 100644 drivers/net/wan/framer/Makefile
 create mode 100644 drivers/net/wan/framer/framer-core.c
 create mode 100644 drivers/net/wan/framer/pef2256/Makefile
 create mode 100644 drivers/net/wan/framer/pef2256/pef2256-regs.h
 create mode 100644 drivers/net/wan/framer/pef2256/pef2256.c
 create mode 100644 drivers/pinctrl/pinctrl-pef2256.c
 create mode 100644 include/linux/framer/framer-provider.h
 create mode 100644 include/linux/framer/framer.h
 create mode 100644 include/linux/framer/pef2256.h

-- 
2.42.0


