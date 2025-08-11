Return-Path: <linux-gpio+bounces-24188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 830BEB20C99
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 16:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B2B462101D
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 14:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5984C1624DD;
	Mon, 11 Aug 2025 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e5G08uop"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC409263892
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923512; cv=none; b=HljET7CCJhhiJHm54KXG8CiGqhgHyQ48rlv1H3xW+xXTMdCTEdJpokrlHsnLYZ/Z9OirWnpbbD7oeSKQkbQfxr5pqTuxN6kVcmDgdy24bUe8xkeiog+YKGPhjlH4S+9DVGaht0pbpAyiwg9z85mS+JqWO23swV8xt3bsgZNH6OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923512; c=relaxed/simple;
	bh=ssZi2V2BpkiG5DrbhwdFR2j15/GCo9BoYjkK7NmEm7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gvZ6Ab++hUVgKYhGoxRGE8HEDqntBE4iyuB4aMdi8lYuZFAX0XyECxpUtMrBNkSnCABQt+AYjRRBzTKoPQMhKP1HkPAhBtWFdeF6XOv/x8Bw97+Ev1xDvbPlmYIB6PdWmyLMkOjVbLIOfrTmHGpUxXh3zpEtCyvEyzf5vBE1bNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e5G08uop; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-acb5ec407b1so612819266b.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 07:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754923507; x=1755528307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hJcoOLDf8BTazRGK+87/HJW+Db0TPk2aWIU1Zf6mQlM=;
        b=e5G08uopp2ry8GMtJImk70FuZW9mAjtaS0BO1RCuacHJ38omWJomrID9F5VP90AwR9
         wq2fsmHQ6kaOSt4CJ3fhi36HrY+taeheZqDFhLeMsAinlR2paTFZ8OMonjfYKb2W+vZD
         BePvn8ApZG6Kk6WeCDOX7wWFsjpe7nX4p2VGw1/lBs3iuosHEB93qVtKOGeRDVQAspJF
         Kd8QKyfVHqQFTZoWpp0FspjmRdUTLLQfywJe1wSHMm5Et0wR+GPOssNbReSzNDEpKRlo
         BkLvlSoPypJM05xJFRE5MPkN0VNIGl+i5MHDOwOEsClyZQZvymiAHSwVwOelb2Vil6Sg
         A+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923507; x=1755528307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJcoOLDf8BTazRGK+87/HJW+Db0TPk2aWIU1Zf6mQlM=;
        b=xHGcDF5hD7K5HXJUZ072DyjeEJpkbenLRxj06iBPacYP+fcKlJkBT+HcWdXaw3trkc
         nTDM0Q2X4cL7W8cJRRl+Rd6MWo14JN97lz97ILJY1VI75WxhYPoAkpLiCf9JV5ssKULb
         hUCmEBz5JVZVywbG2T1CSzwmGzwDwfri8R+a57RKPYx79lbCfPU8KdPrvq75p3rGFkAA
         jubitx+7+74bRJbHH3S/aEAYzILgpYbVNkhZLuhPT+dtgK4GUwP1mgHXKWKQkPBgdHrS
         l/bLs1hfjt9PqC5v5iV2ehuh/FZWMWkVksltE5y2SOqgQwRRj8nnm0p/RwGYm6/FTP8s
         TZbA==
X-Forwarded-Encrypted: i=1; AJvYcCUv2bHNvibHF9GGWc7k6/aV+qcvU7ZJn+c80gh7x9Nh75nyOl5HeGzdQ8d+XkLrCQSx3VCRQrJkqaSn@vger.kernel.org
X-Gm-Message-State: AOJu0YyfDvjouTpUEtL1Dw1moDzuxvuVTObaijmgH3dYLkiZQ7or4fsw
	nx7GbY9xQHqCxSf/L+CT7h8ttqfPHCvsCfxSrOoDtBjU1u62GQ9ZVqWr9fre7yGYF8M=
X-Gm-Gg: ASbGncupUWpN05veEL9JBQ/xWRfW6NLZp1CogGzkNWhED13MtLhuIs9YJ2VLyxPIyKu
	aUu13GQwD9PY/SiwyCkSH7bpJdJk9KqViKSJmin9c5oKn+/nfs1xxAFEl6YO6mc5vAQtvgYu+NY
	gl82MJy+mQp0g73Uq9Jl3VZIPS7ses1Q6ufCKzmhIsA6W6egSq4PPdC3tVfLq+a+7LPlBTIFyGI
	naiB3BO07GqDy+M13J7Q5PFdc9WoEc9S6uJKPjncL6RZbDzwWe3PYtMKLmOfeuj1Gq5+x1Je1fM
	k6pkvNqtutqDpmPCU6fDZ/GeTMU2t4bgTA20XTCyw/A5poZsDKCCRv/ItXXdQvRpAIgJFi620w2
	TcTpKEO0xMeGGHVXWxsTbGoBM1ZjQarXq3YAlKD10Hy1SuYnKXYOfmsa8elvWWW5uCQ==
X-Google-Smtp-Source: AGHT+IGxUCzXjFil7BaQruhMsAvs3m/J8Chpjk13kDIOzDYu/beUtkNUJBMy4y0EFRLuwUY2CuxLOw==
X-Received: by 2002:a17:907:7fa4:b0:ae3:c767:da11 with SMTP id a640c23a62f3a-af9c65de7eemr1074989066b.50.1754923506918;
        Mon, 11 Aug 2025 07:45:06 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af937c86989sm1814983866b.74.2025.08.11.07.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:45:06 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 0/3] Add pin control driver for BCM2712 SoC
Date: Mon, 11 Aug 2025 16:46:50 +0200
Message-ID: <cover.1754922935.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*important note* - For clarity's sake, here's the revision list from which
this patchset derives:

V3 (this patchset, split-up to deal exclusively with pin controller stuff)
V2 (missing v2 in the mail subject): https://lore.kernel.org/all/cover.1752584387.git.andrea.porta@suse.com/
V1 (original by Ivan): https://lore.kernel.org/all/20240731062814.215833-1-iivanov@suse.de/

Also, in V3 the patchset has been split into two:

- patches 1, 2 and 7 from V2 form the new revision V3 to deal with
  core pinctrl stuff only.

- all remaining patches will respawn as a new patchset that adds new DT
  nodes for the peripherals that use the pinctrl. As a consequence, it
  will require the above mentioned V3 patchset as a prerequisite.

--- 

Hi,

The following patches add a pin control driver for the BCM2712 SoC.

Device driver is follow up version on what Andrea posted in April [1].

It is based on sources from here [2]. I just made few cosmetic changes
and addressed review comments from earlier submission. I don't have
documentation for this controller.

A separate patchset will add peripheral nodes that rely on the SoC pin
controller to setup and config the pins.

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


CHANGES in V3:

--- PATCHES ---

- The V2 patchset has been split into two. This patchset (V3) contains reworked
  patches 1,2,7 from V2 while the remaining (again, reworked) patches will
  respawn as an entirely new patchset.


--- DT BINDINGS ---

- brcm,bcm2712c0-pinctrl.yaml: emmc_* pins are specific and do not provide
  other alternate function, so the function property can be dropped for those
  pins.

- brcm,bcm2712c0-pinctrl.yaml: fixed the schema ID reflecting the current
  filename.


--- DRIVER ---

- pinctrl-brcmstb.c: wrapped a couple of lines exceeding 100 columns.


Andrea della Porta (1):
  arm64: defconfig: Enable BCM2712 on-chip pin controller driver

Ivan T. Ivanov (2):
  dt-bindings: pinctrl: Add support for Broadcom STB pin controller
  pinctrl: bcm: Add STB family pin controller driver

 .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       |  135 ++
 arch/arm64/configs/defconfig                  |    1 +
 drivers/pinctrl/bcm/Kconfig                   |   13 +
 drivers/pinctrl/bcm/Makefile                  |    1 +
 drivers/pinctrl/bcm/pinctrl-brcmstb.c         | 1197 +++++++++++++++++
 5 files changed, 1347 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
 create mode 100644 drivers/pinctrl/bcm/pinctrl-brcmstb.c

-- 
2.35.3


