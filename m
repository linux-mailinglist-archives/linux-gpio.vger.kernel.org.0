Return-Path: <linux-gpio+bounces-23319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF06B06605
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 20:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54566566F74
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 18:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BDF2BE7A0;
	Tue, 15 Jul 2025 18:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EHSkE1kV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E885226863
	for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 18:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604209; cv=none; b=RW0+yD3IS9kSMpEJ4JEcdorrTbKwOwABJfWkP1wUM2qjb1eqYkrva8cD1dTzFUzEP5ls7MqxCdtOzXGCi+f2kw7UrTVUGbJAkOkAwcKngqDEmASTBpoOiELj/9s4AwolISYpPi3dYHwlcEHDstHhoEoPEOEXry1vi4t3jgY1KTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604209; c=relaxed/simple;
	bh=OG4SrjBpGcgo80E7iHJAxFbVbBSCrUzfqs/vGbjG08M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/Tyiyvx1J+CLlrcgNHYOCu+oahgupbZyz3mcKxk/byrSaBiiqmIq6QNAisImlJJss0fIctf9Q2+hKfJbg5EFR2XySyEaWC9mefcRIeAjwxcPiPnEO4698pio5Pap1T8S1Uz9kVjtLGqcmvrUAy7zRlepClGl2eHGnPYO7uNUas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EHSkE1kV; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-ae0dad3a179so972959666b.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Jul 2025 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752604204; x=1753209004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uvjjouxvZp03dNr4GPQAUqRZmBS74KdM8wrzyT4z5C0=;
        b=EHSkE1kV4wYDzENnn6RM9Ers8k2OzkMSxNoylFRKMumiUocZlJV8EtFDBbFOEbR+Xt
         nmcm+bDjvVEFtvZhmPCnSJKeExFIZEkPouN3U5QCxFkjdVD62CWhu7yHlNjN5n+ft50R
         FAU4WdZX34pUMKXT2Hc51y6uKP00G0j+JHfRrClu+90+d2nCyW1ihO2OitdY21qLlPdW
         phStzFmovVtgEIncjUVQ83illZgGmf6fSX90RBP9gXBAsnIIwNb0rStfyaR08lIC7iea
         /ksWhkSeEh0CStEwbIVhGEJHp2qVcdqHlFVisYBKT/imncXDCNTZfwWltBnSw2AaZ4AF
         xmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604204; x=1753209004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvjjouxvZp03dNr4GPQAUqRZmBS74KdM8wrzyT4z5C0=;
        b=j7eKV71GVFdqppUerN/SfNVjwFhKVI8Ka0WyK8I464QvJMKHD0oPWNq20LhW+Djmlc
         1AiMzTZcpegmsZZVupL6hOQiDSr1pZrAPpSNP0+VO6IrYEgLum3jXgCnsrbm45dulJ2O
         g11xgQInle4Gx7Nt8E49bOJ+GjEKlqolrbTRJ4snX37bPlLojikZnl4JCEHz2prRiXHf
         wlyIZsYDFYL3kcppU/cPs02AOxRorcctM0WZmd2CsgAjOuyu7A8ufWmCJNBToiTZPtTO
         DqwyNDSF3WpTKXTWbocIrE2LsnJ3vLUSwsATIkA/Ub+Ezbp/Rvk3g1/w/fHqN4ar73BE
         tr2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFqP+mhxVcTQ3c3D0ZC0pSjMQovPfvrNNpRlhYnn/PfxB9De7iTpjyxLWJk/h5QUauX9CmDVdXp+cN@vger.kernel.org
X-Gm-Message-State: AOJu0YwRDqm6ydZriFrvYSJ2F4okvY/WPiMV/sopKAAqBbmL17CG+ahZ
	+n96FwtveEmIrCMBVNRC5616KpIBsYtucQ38P9kqmLLxzg080wie2/KDDd3LKYglUN8=
X-Gm-Gg: ASbGncuQTx+ikqyCf5100gEzuOCP4RNBb0YCMnKZ8NFDdblmdG6L6wPXit1Ow81115J
	+BUGk8EYjzB+sPNKcrhvknqQygwhIP6EO9oyWoFzRl312Ku92HLrKQoZIkRDLikHsxedCYA9atO
	KdmkrMo2FWl/YLKrmVfwxd7R8t7E451fbYOxiLb5G0H0pgFQh4s/DuweLeyhVsfVbkltgTn/AJS
	q/95BOf4xItzsqG/MJYtJyaqnbJm4ffjRUSfwM7J+I4i1o3dnfPXQlpGZUx7vnNX2rtYlfFl/Rm
	p/RmGfQnHzxhFbN6rqAzRGX5djURFsNcjDVAI3TWNIMpjHbR7wf4RKRBW84BhC2Ef2qwJjnSfAF
	BLyZBkfLT//Ob/nGqfg8nAEaspz1pqJOOfkTOMEybEOrXS9BU7Otuol54sM1nNF1gGJch
X-Google-Smtp-Source: AGHT+IGFJbWKXB+kQL0O549amLz17SFCU/R3WUlLT6+iJaf7qSYAHhdJnbOpegB9FUbKE3rnsTsc4w==
X-Received: by 2002:a17:907:7f86:b0:ae6:f163:5d75 with SMTP id a640c23a62f3a-ae9c995443fmr57569466b.11.1752604203618;
        Tue, 15 Jul 2025 11:30:03 -0700 (PDT)
Received: from localhost (host-79-47-155-191.retail.telecomitalia.it. [79.47.155.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df56esm1041676366b.156.2025.07.15.11.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:30:03 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org
Cc: conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 0/7] Add pin control driver for BCM2712 SoC
Date: Tue, 15 Jul 2025 20:31:37 +0200
Message-ID: <cover.1752584387.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

The following patches add a pin control driver for the BCM2712 SoC and few
pin/gpio Devicetree nodes for Raspberry Pi 5.

Device driver is follow up version on what Andrea posted in April [1].

It is based on sources from here [2]. I just made few cosmetic changes
and addressed review comments from earlier submission. I don't have
documentation for this controller.

Patch 4 wire up power button on RPi5.

Patch 5 adds WiFi Devicetree node for RPi5.

Patch 6 adds Bluetooth Devicetree node for RPi5.

All this have been tested as kernel was directly booted RPi5 via
kernel= config.txt option and cmdline.txt file with following content
(Note I am using Tumbleweed RPi raw images)

# cat /boot/efi/cmdline.txt
root=/dev/mmcblk0p3 rootwait rw systemd.show_status=1 console=tty ignore_loglevel earlycon console=ttyAMA10,115200

With all these patches Bluetooth and Wifi are working fine (tm) with
firmware files provided by openSUSE Tumbleweed.

All comments and suggestions are welcome!

Happy hacking!
Ivan and Andrea

[1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
[2] https://github.com/raspberrypi/linux/blob/rpi-6.6.y/drivers/pinctrl/bcm/pinctrl-bcm2712.c
[3] https://lore.kernel.org/lkml/20240605120712.3523290-1-florian.fainelli@broadcom.com/#t
[4] https://lore.kernel.org/all/bfc60a7e-54d2-48a6-a288-4fe76d66507a@gmx.net/


CHANGES in V2: (all patchset is based upon linux-next/master)

--- PINCTRL DRIVER ---

- dropped bcm2712_c0_aon_sgpio_pin_funcs[] and bcm2712_d0_aon_sgpio_pin_funcs[]
  struct array definitions since they are not used anywhere.

- dropped 'arg' variable in brcmstb_pinconf_set() as it's not used.

- updated copyright info at the top.

- several changes in the declared macros. Renaming the macro name and the
  macro parameters to better reflect the semantic.

- reworked MUX_BIT() macro to be more streamlined and easy to
  understand.

- added PAD_BIT() macro to avoid code duplication.

- renamed 'lock' variable to 'fsel_lock'.

- added some comments about non-existent pins on D0 silicon revision pin
  declarations.

- brcmstb_pinctrl_fsel_set(), brcmstb_pull_config_set()  and
  brcmstb_pinconf_set() (and functions that call them) can now return -EINVAL
  as error.

- added myself as MODULE_AUTHOR.

- dropped the 'brcm,bcm2712-[aon-]pinctrl' fallback compatible. Only c0 or d0
  compatibles are permitted now.


--- DTS ---

- moved 'clock-frequency' property from (uarta) board dts node to SoC dtsi node.

- added 'brcm,sdhci-brcmstb' compatible and 'clock-names' property to mmc node
  to avoid dt_binding_check errors.

- added 'brcm,bcm7445-gpio' compatible to gpio node to avoid dt_binding_check
  errors.

- renamed all pinctrl pin nodes as per yaml schema (*-state and *-pins).

- changed 'brcm,bcm2712-*pinctrl' to 'brcm,bcm2712c0-*pinctrl' since the
  former was more of a fallback and does not reflect a real silicon revision.

- moved status="okay" to the last entry in 'uarta' node.

- removed 'local-*-address' property from everywhere.

- dropped 'skip-init' property in 'uarta' node since it does not apply to
  linux kernel.

- renamed 'pwr-button' node to 'gpio-keys' and 'pwr_key' node to
  'power_button'.

- dropped an userspace related 'brcm,gpio-direct' property from gpio node.



--- DT BINDINGS ---

- binding schema file renamed to 'brcm,bcm2712c0-pinctrl.yaml' to reflect the
  compatible name.

- dropped the 'brcm,bcm2712-[aon-]pinctrl' fallback compatible. Only c0 or d0
  compatibles are permitted now.

- added example section.

- moved allOf: block at the beginning of the schema.

- dropped some unnecessary new lines.

- replaced current layout to describe the pin subnodes with patternProperties
  (nodes now end with -state and -pins).

- expanded the schema description to give some context about STB family of pin
  controller and added some details about C0 and D0 silicon variants. This is
  also reflected in the commit message.


--- MISC ---

- enabled CONFIG_PINCTRL_BRCMSTB in arm64 defconfig.


Andrea della Porta (1):
  arm64: defconfig: Enable BCM2712 on-chip pin controller driver

Ivan T. Ivanov (6):
  dt-bindings: pinctrl: Add support for Broadcom STB pin controller
  pinctrl: bcm: Add STB family pin controller driver
  arm64: dts: broadcom: bcm2712: Add pin controller nodes
  arm64: dts: broadcom: bcm2712: Add one more GPIO node
  arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
  arm64: dts: broadcom: bcm2712: Add UARTA controller node

 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       |  123 ++
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  |  134 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |   48 +
 arch/arm64/configs/defconfig                  |    1 +
 drivers/pinctrl/bcm/Kconfig                   |   13 +
 drivers/pinctrl/bcm/Makefile                  |    1 +
 drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 1195 +++++++++++++++++
 7 files changed, 1515 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c

-- 
2.35.3


