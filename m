Return-Path: <linux-gpio+bounces-8474-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 377ED9426AF
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 08:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2282823AA
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 06:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA18716D9A8;
	Wed, 31 Jul 2024 06:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QQlDHhC7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="btVtL2fY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WihMl513";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ov3FaK6U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A9516D4EC;
	Wed, 31 Jul 2024 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407216; cv=none; b=QAVJ8Ay9eHrJeBNSX7mRum94hoQqTAqb3QoH0N83OU8J2pSJAyMFnEdVea43tXVbb8BlFWchq3Lmm8qhPFJtL2DlhoKl3/zG2iEWE0cQVH6ScV/MTmYN0gums0ellemSPvyyHsnAhvPPp6pIEzGinLWsaXLIGOtyiZTpx4V6DLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407216; c=relaxed/simple;
	bh=5lCEw3+z/BnHgRQVexCYggElEjI+EoPtTzLeHVf9Q0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jJG1WMKoASCrCNfNnUdGAh80PyRjCjBVmogT2M0YCyP/EdYc3ow58FoyKhuTMFQX4HjWBe1WMKNzrDaOOmaDLlV6Oav5aeMUjbb4QIEterYHdvQj90LC78Ej2Sx9bJN0HPBTlPo9TJ3LL7i/1aLpaBomJmdvDB5lRGzVA16HKYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QQlDHhC7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=btVtL2fY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WihMl513; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ov3FaK6U; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D08CC21EFE;
	Wed, 31 Jul 2024 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722407213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ysVg8NKYfuKZ0U1GU6lkjKZUC39/oYsEHCysihtmi4I=;
	b=QQlDHhC7x/H1HzdWxFNzy/R8r1YNUx4HAgpYipbmTV6YvaWfjo7NK7Gm882iO6MgZh0kKG
	0AjHaKF0Q6Sn1ESpMcecN74lz3wSiCKTg/egY9Oxm36CSZyIpLNcFWtMUQPczF6u7A77Z7
	Umb8KYtAg9hzNAHynDUngKyhWxqw0Gs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722407213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ysVg8NKYfuKZ0U1GU6lkjKZUC39/oYsEHCysihtmi4I=;
	b=btVtL2fYuwlyqtdVZEMd4xiRQipwxN7B/yL+KbUrCRRmlZYO2/NtD3JxpcheJbqg2O+crE
	O68LrJr20y8hnzBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722407211; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ysVg8NKYfuKZ0U1GU6lkjKZUC39/oYsEHCysihtmi4I=;
	b=WihMl513lFSFx5FL2zCdpwrtOgQeEogBi83iWMIJLZ4bVLAIcMKAcbJZwI2zjZCl4wlJQ2
	JTuuMN/VypQ9QjQ4kjTf4epQP5U0tMb4q9/ALAIGnspM7xTyRtAnFJALcgtweQ1WRlQae5
	s7ofJgF6fyIJsWC/dn1LMTs0svHl9B8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722407211;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ysVg8NKYfuKZ0U1GU6lkjKZUC39/oYsEHCysihtmi4I=;
	b=Ov3FaK6UX+pPuq45Is5/3Tb3P/F4VBsuFAO24RYaYcIe/M0dgMfxgRnEfv+2kYwAbD7Sj9
	uKN6x+q7M5S0p2BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A61F913297;
	Wed, 31 Jul 2024 06:26:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 008ZKCvZqWYkZgAAD6G6ig
	(envelope-from <iivanov@suse.de>); Wed, 31 Jul 2024 06:26:51 +0000
From: "Ivan T. Ivanov" <iivanov@suse.de>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	andrea.porta@suse.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Ivan T. Ivanov" <iivanov@suse.de>
Subject: [PATCH 0/7] Add pin control driver for BCM2712 SoC
Date: Wed, 31 Jul 2024 09:28:07 +0300
Message-ID: <20240731062814.215833-1-iivanov@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
X-Spamd-Result: default: False [1.90 / 50.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmx.net,suse.com,vger.kernel.org,lists.infradead.org,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,imap1.dmz-prg2.suse.org:helo];
	TAGGED_RCPT(0.00)[dt];
	FREEMAIL_ENVRCPT(0.00)[gmx.net]
X-Spam-Flag: NO
X-Spam-Score: 1.90

Hi,

The following patches add a pin control driver for the BCM2712 SoC and few
pin/gpio Devicetree nodes for Raspberry Pi 5.

Device driver is follow up version on what Andrea posted in April [1].

It is based on sources from here [2]. I just made few cosmetic changes
and addressed review comments from earlier submission. I don't have
documentation for this controller.

Patch 3 was already posted by Andrea and it is in Broadcom integration tree[3].
Unfortunately it is still not in the Linus tree[4]. So I added it here as base
for my changes and to easy building and testing.

Patch 5 wire up power button on RPi5

Patch 6 adds WiFi Devicetree node for RPi5

Patch 7 adds Bluetooth Devicetree node for RPi5

They are few complaints from checkpatch.pl. Like few lines over 100 columns,
which I keep that way for better readability or usage of EOPNOTSUPP,
but it is according pin control API document.

All this have been tested as kernel was directly booted RPi5 via
kernel= config.txt option and cmdline.txt file with following content
(Note I am using Tumbleweed RPi raw images)

# cat /boot/efi/cmdline.txt
root=/dev/mmcblk0p3 rootwait rw systemd.show_status=1 console=tty ignore_loglevel earlycon console=ttyAMA10,115200

With all these patches Bluetooth and Wifi are working fine (tm) with
firmware files provided by openSUSE Tumbleweed.

All comments and suggestions are welcome!

Happy hacking!
Ivan

[1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
[2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/drivers/pinctrl/bcm/pinctrl-bcm2712.c
[3] https://lore.kernel.org/lkml/20240605120712.3523290-1-florian.fainelli@broadcom.com/#t
[4] https://lore.kernel.org/all/bfc60a7e-54d2-48a6-a288-4fe76d66507a@gmx.net/


Andrea della Porta (1):
  arm64: dts: broadcom: Add support for BCM2712

Ivan T. Ivanov (6):
  dt-bindings: pinctrl: Add support for Broadcom STB pin controller
  pinctrl: bcm: Add STB family pin controller driver
  arm64: dts: broadcom: bcm2712: Add pin controller nodes
  arm64: dts: broadcom: bcm2712: Add one more GPIO node
  arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
  arm64: dts: broadcom: bcm2712: Add UARTA controller node.

 .../pinctrl/brcm,brcmstb-pinctrl.yaml         |   73 +
 arch/arm64/boot/dts/broadcom/Makefile         |    1 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  203 +++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  357 +++++
 drivers/pinctrl/bcm/Kconfig                   |   13 +
 drivers/pinctrl/bcm/Makefile                  |    1 +
 drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 1217 +++++++++++++++++
 7 files changed, 1865 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,brcmstb-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2712.dtsi
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c


base-commit: dc1c8034e31b14a2e5e212104ec508aec44ce1b9
-- 
2.43.0


