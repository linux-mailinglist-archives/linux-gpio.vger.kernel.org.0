Return-Path: <linux-gpio+bounces-15569-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC072A2CD64
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 21:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1181188E91C
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 20:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005E119F130;
	Fri,  7 Feb 2025 20:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ee3onl77"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BB419E826;
	Fri,  7 Feb 2025 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958567; cv=none; b=UEaiVBCljBk8Kc9HSAmffIQw9bKD5hVD0mWM6e+IL9J02RVfdwpoGQLGkOlT5ByM2nci6PlL6d7+Ni3woLwaF8ep7/N66OyDSYD2LmSBJxIkYJPBRHzfxf43CG8TF7RPUjFDVkIKtPOnUhZfeh9aIcDqFbjyPLVa4qkLLheVfLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958567; c=relaxed/simple;
	bh=PVJ6I93uY0R9A7EkGpZMTr75rFuHDwRPliUXmsFjesA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GBQDo6DBg3L8uq+4SF569tzjzSEUQDI3pbR4Ih5YOhmSeo9vLNvfk2pp1wCxpgPkbmFmqj0WzvjIj6vQmfSyYB5hO1fU1rQFoC0GDU5l1BLtMDvK2GBSXTQonHkTd+lqc7DhMSi5cX3Th5+nNiNVcfwTAOMWpe6/vfAStzXlkPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ee3onl77; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dcd3454922so5071663a12.1;
        Fri, 07 Feb 2025 12:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958564; x=1739563364; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MAoqGjsKjKYAcfl1FF0omT/hBVvR9f1Og52o3S2J4zg=;
        b=Ee3onl77asYaMDtJIQoNuJ5ANTvFGEgy0xuqcDhSdczh5T0H3diTqOOo+bDZV3h/ZK
         Py6nV52EDCarzG7bKh/kz/morJDzPcgXXXwpPzuje1etbe9B1wSBb5QLJ+KTSt2buolO
         lzRHFthKpz+ejuHVKeU4gBFzhqUG5rwZlgF3kpjSjhjHAvTd8n3Vtkn6Tz9TXozjBKyH
         4X9HkL01tP4SAehdzJgAXxs/b4wVmnfyQOxduRsSglMz3Vt+hJOTUZcLJQkt+SKcgdP8
         PjSumt+pbScekz6FnBVCUwPnO53Y+cG0YZUl6Wy6g3bXElP85cK4IXv6yH7ziwDjdz+k
         XcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958564; x=1739563364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MAoqGjsKjKYAcfl1FF0omT/hBVvR9f1Og52o3S2J4zg=;
        b=pzEbEUksayMpY1/HEqXGKyQUpCZ0M8VjnUur/vApcZSp8172pKG/9g3HdynIQ3fADS
         vSF/x1NMY19ZAZaxqm14GabkXDo5mbPS4o0yJKONlG4mlIu6pZyNIc1ydcPcIXWkVJkC
         whJ1FHsw44M/hnJG4vUYgD5FyJNnIGIQNLfLsB2oG8QLaK0jDl4qkY3QN6wO7HGKimmQ
         qVb6WqHaVrSy4JYXIKm0tjs7CzQt2JmcHEpoDVh9CFyYVbmH7w7jCDWEs0WTx4blzGhi
         f4V418YnV5/tKAkxQTY4YtsqbVu7ftaAWvior34TM2GjRCRIeij8hlGbwtj106DkuPhY
         EU6A==
X-Forwarded-Encrypted: i=1; AJvYcCWGM9XiXDqE4mC9SjNYCk+XyZISQws8hN0fUh3zXO7jRnocX61Vwl+uVOJKR8eYVQnuI7UmVpOjUE9h@vger.kernel.org, AJvYcCXkfEZnMZYPsWClWncv4VzJLVU03O5Efp7yqnWc8WgfPowr+3cxbFrttUOACKxthkryLC835bi3Rg1qbLeI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx17LBGNaK9YWhv/CEmZaKqCTW4RzEAkcZNYA2S0DhrzJsibkPh
	217PmPDBFgLsqqCiytbOf7VP2q8xyRFdCdKgQkU6Zhk3dAZkBWBYEHTBfQ==
X-Gm-Gg: ASbGncvnEk4dnLbly8RtHOgi7CJTKfvRJSmfyMXwtAxju9KEPByEJElChrPLMwXAHcK
	7GhZjkDXgEUkUVpUL0Y40XAI7/CRAxq+KmsMhDfJeB/K5EpqBR+mxdh+9mt3KLN1Y4pUrVVM2p0
	vnj7e4c6hlommPJDahQ0ecBknVjdAsNXLNg43fZM/nKLVyo3I6fADnay5/8vrHSg5pk4yt0Ep2s
	YfzcrRUm4x5Rj8xVWXHC1xFfhLAdxFFUm4QgKCoDlyjFb49ZgA0C/UcUNmK4qZkcoBTdd4UliN1
	g4tfunJn3lB0f5Gl3ZCbKy50rT3v66d0WNlNcujBsv/WPdtvEmvZ1BPg
X-Google-Smtp-Source: AGHT+IFCIU/WMo5fR5DhFgQY023VWnV7TO15nPnUoYJLvw70AT6oyrtEhwvHFV1d+unGDpOvscUwtg==
X-Received: by 2002:a05:6402:34c7:b0:5d1:22c2:6c56 with SMTP id 4fb4d7f45d1cf-5de45022b39mr5550778a12.17.1738958563980;
        Fri, 07 Feb 2025 12:02:43 -0800 (PST)
Received: from hex.my.domain (83.8.206.8.ipv4.supernova.orange.pl. [83.8.206.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de59f893ebsm256797a12.45.2025.02.07.12.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:02:43 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH 0/7] pinctrl: bcm281xx: Add support for BCM21664 pinmux
Date: Fri, 07 Feb 2025 21:02:39 +0100
Message-Id: <20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9mpmcC/x3MTQ5AMBBA4avIrDXpD0NcRSxop0xCSSsiEXfXW
 H6L9x5IFJkSdMUDkS5OvIcMVRZglzHMJNhlg5a6llqimOymFWIlDg72jKtQxrrGGd+0iJCzI5L
 n+1/2w/t+2nif9WIAAAA=
X-Change-ID: 20250206-bcm21664-pinctrl-13cd7d3f7866
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Christian Daudt <bcm@fixthebug.org>, Sherman Yin <syin@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738958562; l=2917;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=PVJ6I93uY0R9A7EkGpZMTr75rFuHDwRPliUXmsFjesA=;
 b=GlcJmGxxUMO6rkikwfKoNX9DJ6exqY44G8qXnStLQrxv8D6P9NvNfia+15DlyTlJVBlV0l3uD
 xRR6NEXcgm/CqVEWlCsz0pMwab9OOhP6NvLYGEUnl4DDinuphrEk67C
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

BCM21664 is another chip from the Kona line of Broadcom SoCs, and
its pinmux shares a lot of similarities with the BCM281xx pinmux.

Add support for the BCM21664 pinmux controller to the BCM281xx driver.

This also enables pinmux support for the BCM23550, which has an
identical pinmux config to the BCM21664 (hence they can share a
single compatible, brcm,bcm21664-pinctrl).

While we're at it - fix a bug that affected higher registers in the
BCM281XX driver and replace bare "unsigned" with "unsigned int" to
comply with checkpatch requirements.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
By the way - while working on this patch, I noticed two things that
are not implemented in mainline, but seem to be present in the pin
controller regs according to the RDB[1][2]:

- On both BCM21664 and BCM281XX, TRACE* pins only have two bits for
  DRV_STR and no HYST bit. That seems like it deserves its own pin
  type; however, since I don't know how to translate the reduced
  DRV_STR value to a drive strength in mA, I did not implement it.
  For now, I kept the same type for BCM21664 as for BCM281XX for these
  pins (standard).

- On both BCM21664 and BCM281XX, two SIM-related pins (SIM and SIM2
  on BCM281XX, SIMDAT and SSPDO on BCM21664) have extra PUPM0 and PUPM1
  offsets (bits 11 and 12 respectively). Vendor kernel does not do
  anything with these bits, so I don't know what they do.

If any Broadcom engineers could shed some light on these, I'd be
grateful. Otherwise, neither of these are pressing issues, and this
patchset is complete without them (they can be fixed in another
patchset).

[1] https://github.com/knuxdroid/android_kernel_samsung_baffinlite/blob/cm-12.1/arch/arm/mach-hawaii/include/mach/rdb/brcm_rdb_padctrlreg.h
[2] https://github.com/s2plus/android_kernel_samsung_galaxys2plus/blob/cm-10.1_base-4.2/arch/arm/mach-capri/include/mach/rdb/brcm_rdb_padctrlreg.h

---
Artur Weber (7):
      dt-bindings: pinctrl: Add bindings for BCM21664 pin controller
      pinctrl: bcm281xx: Fix incorrect regmap max_registers value
      pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
      pinctrl: bcm281xx: Provide pinctrl device info as OF platform data
      pinctrl: bcm281xx: Add support for BCM21664 pinmux
      ARM: dts: bcm2166x-common: Add pinctrl node
      ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI

 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 169 ++++
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |   7 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi   | 297 +++++++
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             | 849 +++++++++++++++++++--
 4 files changed, 1259 insertions(+), 63 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250206-bcm21664-pinctrl-13cd7d3f7866

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


