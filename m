Return-Path: <linux-gpio+bounces-24729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E11B5B2F529
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 12:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA20E72714F
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Aug 2025 10:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F3A2472B5;
	Thu, 21 Aug 2025 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b="AxvdEdXq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout3.mo534.mail-out.ovh.net (smtpout3.mo534.mail-out.ovh.net [51.210.94.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D247263A
	for <linux-gpio@vger.kernel.org>; Thu, 21 Aug 2025 10:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.210.94.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771580; cv=none; b=GzFySfVBFhdbkgdbAdND9IAwDR3s/ojlEmCNJrjIs7dxgsi7HT7Xoy4pzSXEY+5AqkXvG2oDRinMICz8Q7zO379NcadEw52Ls6TXf8gfwwLV0Y2hUoV2+PLKskUiS2g7CL4AvcqAv7zeR5eoaA6H+QuW0X9yBZdYirOHkcSoZE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771580; c=relaxed/simple;
	bh=eref6ByY572qjZCGOScxzbw7tucOi1s0NHnKAHD1+cQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oJ2tDY3n+kmnXzOtiJjsoP0pMj8Su7Td9OGqD0pILW7xKBwZk22THMz+NTUYJs6GCnoTbuF9I0b39ZJousZlZuVZ63Vz+p4HWqADms1w0aES2YpkhOJ2hnizBYk8We0sly1y6Md/+FReRwq1uZ6W1jLc0IF7+DZ4JS+m+ZzFFQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet; spf=pass smtp.mailfrom=orca.pet; dkim=pass (2048-bit key) header.d=orca.pet header.i=@orca.pet header.b=AxvdEdXq; arc=none smtp.client-ip=51.210.94.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orca.pet
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orca.pet
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net [152.228.215.222])
	by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4c6zns5kwmz68YG;
	Thu, 21 Aug 2025 10:19:29 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net. [127.0.0.1])
        by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <brgl@bgdev.pl>; Thu, 21 Aug 2025 10:19:29 +0000 (UTC)
Received: from mta7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.109.249.147])
	by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4c6zns4FxHz5wDg;
	Thu, 21 Aug 2025 10:19:29 +0000 (UTC)
Received: from orca.pet (unknown [10.1.6.9])
	by mta7.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 353BDB832CD;
	Thu, 21 Aug 2025 10:19:28 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-97G002d21e2e92-e478-449c-be15-b81d5d0ce33e,
                    684E78C7C579463DAB27E2CA1F9C4E28A39E1181) smtp.auth=marcos@orca.pet
X-OVh-ClientIp:147.156.42.5
From: Marcos Del Sol Vives <marcos@orca.pet>
To: linux-kernel@vger.kernel.org
Cc: Marcos Del Sol Vives <marcos@orca.pet>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v3 0/3] Introduce support for Vortex GPIO pins
Date: Thu, 21 Aug 2025 12:18:56 +0200
Message-Id: <20250821101902.626329-1-marcos@orca.pet>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17487758829186930278
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedtleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrrhgtohhsucffvghlucfuohhlucggihhvvghsuceomhgrrhgtohhssehorhgtrgdrphgvtheqnecuggftrfgrthhtvghrnhepgffhgfefvefghfetveevgffhleffjedvjeekieejgeeiuddvffetieejjeejgfegnecukfhppeduvdejrddtrddtrddupddugeejrdduheeirdegvddrheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhgrrhgtohhssehorhgtrgdrphgvthdpnhgspghrtghpthhtohepledprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhgrrhgtohhssehorhgtrgdrphgvthdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrgh
 dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhptghisehvghgvrhdrkhgvrhhnvghlrdhorhhg
DKIM-Signature: a=rsa-sha256; bh=+QxckdVwic+8yzAxhOHqkLVteyChvAdbEUUs0+d9kek=;
 c=relaxed/relaxed; d=orca.pet; h=From; s=ovhmo-selector-1; t=1755771569;
 v=1;
 b=AxvdEdXqMVwLtMJhi6jOy7ehSdcR3/yQ7W7ccatuoMg4CF34HeBuJV79X0cgHWsYFTndlQpR
 haXSzYTpUjqLuzKbVVW44tfNiKa+ti80Bz0LLTcc/U/e/Byq4gAznVxRfGs1siYgTtkcGPcbB9Z
 kwy1N1UKsYaA36rg6nU7g86MkdTmIxpjTFwqZrCMH1ReMka3GgrRbz4djKu9E4meY8H3348RuzN
 KjdWPHQ7FdkRDrrktyj3xB3NKraZMKrD0/ydoqzRdmZzUhEQ5PFrme7fSWhdm8L8JeOgXq6EbgP
 iCHToPl+w/3hJTM7IOdGIGW2L/yTaR/MPcn5F2wcC5TCw==

This series of patches add support for the GPIO pins exposed on the
southbridge of DM&P's Vortex86 line of SoCs, using a new GPIO driver
plus a MFD driver to automatically load the driver in supported platforms.

Marcos Del Sol Vives (3):
  gpio: gpio-regmap: add flags to control some behaviour
  gpio: vortex: add new GPIO device driver
  mfd: vortex: implement new driver for Vortex southbridges

 MAINTAINERS                 |   6 ++
 drivers/gpio/Kconfig        |  11 ++++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-regmap.c  |  17 +++++-
 drivers/gpio/gpio-vortex.c  | 110 ++++++++++++++++++++++++++++++++++++
 drivers/mfd/Kconfig         |   9 +++
 drivers/mfd/Makefile        |   1 +
 drivers/mfd/vortex-sb.c     |  81 ++++++++++++++++++++++++++
 include/linux/gpio/regmap.h |  17 ++++++
 include/linux/pci_ids.h     |   1 +
 10 files changed, 253 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpio/gpio-vortex.c
 create mode 100644 drivers/mfd/vortex-sb.c

-- 
2.34.1


