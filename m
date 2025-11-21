Return-Path: <linux-gpio+bounces-28969-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A60C7ADBD
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 17:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 53BBC38036E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 16:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FE33346AA;
	Fri, 21 Nov 2025 16:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcvDNtId"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32432ECE91
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763742566; cv=none; b=amud8QK2qdYk5+f6FKpupthumDHhvhsnNnv+jHZejrPdpfPV55SPI26IlXOOs8+Z8btNT/cKG3Loqn1Zm/JlASOFTSgkPYoCaNzGdQ/cm7gNgFtJeovh6K4Af2PXbVcp2UkYeZBFba3xYiQscLKOFlQ1EPRxkzyEabv/O7AAIk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763742566; c=relaxed/simple;
	bh=7o7uX2j4VBKIWlMxveJ1KpLTVJmsViZBHWPDUcOxwp8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=d4OF4Uxky/fzbP3KyEhV7U4V2aIZ1n3hd8SJRxoIEjvHSgWIQOQIW7x+VFokvRgyQnX9X7FMQjYXQwXqRwQZdtDZZPrZ4cI/b5jb5I24wx4eNNlHV+hWRtuHVFfNhPm+ysS2kqAXJC6sjHoif96WM9Qrcjkr6tOSucaZY3fJ1Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcvDNtId; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B3AC4CEF1
	for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763742566;
	bh=7o7uX2j4VBKIWlMxveJ1KpLTVJmsViZBHWPDUcOxwp8=;
	h=From:Date:Subject:To:Cc:From;
	b=lcvDNtIdAcR3hb0A3NsXrVojdztkNH5gMDHLYUMOHjH8G0KompaB9s14kTfi8u0FT
	 1YG5clB4kzwIJxuAsp1dpR1+tg7oSAK4DdA4D4V7yz09HcmkcixtfMLuaaHuT4dHGF
	 7KtBmaAwPEVjkSkxLOYS3GDNwO+1DB1VS/GJn3OvbN76A8gSk4iANS4I1M0PQO3JBj
	 R7sqdqbni5CqpTrsNR6cDBgV8TWrz3s2hFJByQ0LRLn12fPGHCcVWCbHrfwshGcHqB
	 mz0Y1vvmZFXXWZ76W8Easa+5Q6/VdbwjpvSfaPurW1l1B77Hysz0u291sUJYtbkdLZ
	 jBE/oEo7eYtKQ==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-63fc8c337f2so2116037d50.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Nov 2025 08:29:26 -0800 (PST)
X-Gm-Message-State: AOJu0Ywt4yef0EyVs84XLZOJeU8s17XFzzIWd7n5H2HQsm23LSpeaAJj
	kdtpqUVEUtoRLGSZq2c50yti1h6KY+gJom3fp/ek0I1HniBku1z6fgIZEMPQLmvT2t7VPRcumY1
	NxLumVuQ/dg3KrTIrY9JdzElBk/1C6ms=
X-Google-Smtp-Source: AGHT+IFxgereYg7GAPNkUOGnhTg2DcIy/LNCZeLGTrQ5g85z/Td+Yw09SuC1STYe/mjyveTCSpP0zj336maWFi8B4WI=
X-Received: by 2002:a05:690c:7207:b0:787:deea:1ba8 with SMTP id
 00721157ae682-78a8b5512c5mr40674887b3.50.1763742565662; Fri, 21 Nov 2025
 08:29:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 21 Nov 2025 17:29:13 +0100
X-Gmail-Original-Message-ID: <CAD++jLkMzdYPdMpGMx-U5EMm_9EWtg_kext8QHXY1dNsdSSFVw@mail.gmail.com>
X-Gm-Features: AWmQ_bk7D9T2UCAa100IZfjSRl1fVBqUUah-dNxoC_znStw1P3Q5iuh9p-kPKMs
Message-ID: <CAD++jLkMzdYPdMpGMx-U5EMm_9EWtg_kext8QHXY1dNsdSSFVw@mail.gmail.com>
Subject: [GIT PULL] pin control fixes for v6.18
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

here are some pin control fixes for v6.18 just noise really,
the details are in the signed tag. Maybe the deadlock discovered
in the Qualcomm driver is a bit interesting.

Please pull it in!

I'm starting to use this kernel.org mail adress because reasons.
I think I managed to add it to my PGP/GPG key. The signature
on the tags shouls be the same.

Yours,
Linus Walleij

PS: I saw you're playing highlander games with Linus Sebastian,
there are still many of us left! ;)

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
tags/pinctrl-v6.18-2

for you to fetch changes up to 79afd3c5edac93b684393ec84185b2776d0630ef:

  dt-bindings: pinctrl: xlnx,versal-pinctrl: Add missing
unevaluatedProperties on '^conf' nodes (2025-11-19 15:21:44 +0100)

----------------------------------------------------------------
Pin control fixes for the v6.18 series:

- Fix register naming in the Mediatek mt8189 driver.

- Select REGMAP_MMIO for the Realtek RTD driver.

- Fix the number of items in groups in the Toshiba
  Visconti driver.

- Fix a memory leak in the Cirrus CS42L43 driver.

- Fix a deadlock (!) in Qualcomm pinmux configuration.

- Fix use of uninitialized memory and list initialization
  in the S32CC pin controller.

----------------------------------------------------------------
Haotian Zhang (1):
      pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_probe()

Jared Kangas (2):
      pinctrl: s32cc: fix uninitialized memory in s32_pinctrl_desc
      pinctrl: s32cc: initialize gpio_pin_config::list after kmalloc()

Krzysztof Kozlowski (1):
      dt-bindings: pinctrl: toshiba,visconti: Fix number of items in groups

Louis-Alexis Eyraud (2):
      pinctrl: mediatek: mt8196: align register base names to dt-bindings ones
      pinctrl: mediatek: mt8189: align register base names to dt-bindings ones

Praveen Talari (1):
      pinctrl: qcom: msm: Fix deadlock in pinmux configuration

Rob Herring (Arm) (1):
      dt-bindings: pinctrl: xlnx,versal-pinctrl: Add missing
unevaluatedProperties on '^conf' nodes

Yu-Chun Lin (1):
      pinctrl: realtek: Select REGMAP_MMIO for RTD driver

 .../bindings/pinctrl/toshiba,visconti-pinctrl.yaml | 26 ++++++++++++----------
 .../bindings/pinctrl/xlnx,versal-pinctrl.yaml      |  1 +
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 23 +++++++++++++++----
 drivers/pinctrl/mediatek/pinctrl-mt8189.c          |  4 +---
 drivers/pinctrl/mediatek/pinctrl-mt8196.c          |  6 ++---
 drivers/pinctrl/nxp/pinctrl-s32cc.c                |  3 ++-
 drivers/pinctrl/qcom/pinctrl-msm.c                 |  2 +-
 drivers/pinctrl/realtek/Kconfig                    |  1 +
 8 files changed, 41 insertions(+), 25 deletions(-)

