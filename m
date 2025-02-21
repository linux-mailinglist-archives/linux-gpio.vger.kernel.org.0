Return-Path: <linux-gpio+bounces-16409-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8324A400F6
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 21:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A24D7425CF9
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 20:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827FD1DBB38;
	Fri, 21 Feb 2025 20:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QdQMcXJS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939154207F;
	Fri, 21 Feb 2025 20:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169965; cv=none; b=pFixSG3RToaICXAv1S6bdQMs/ghtJd1gB9OzCENwoMt794qui4DUrC6jS3juwgmWzWHTIGWiueg6maV4uo9FqJEk5/7WWtjSV2kTbEXc9SYsyTT6+u2KXpkJ+XGdOB93O7uQX9U1WQ99Ln7h3vBSOI9axo4WVbURW6lpt1wZhRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169965; c=relaxed/simple;
	bh=cYMGsql8WUyj71GmqI/5eWDIQK1a45bdPq3S1MYNGcs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bXrsJtGGFzgsRposL6P5fFdy2iUUZhJlnmskc+9OAjp0qM1dbKPKmAF6caei6mWLts6cxtI/0TpEGPB8NGQKIA/4jNud5Bnm0g6sxKqjBvSrQ6ko7VJ5HW2+CdzOeODtHsVbI6c/KY67OZUffEr/Oo8YXftL1f91eR3Q3+Hkd3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QdQMcXJS; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e0b70fb1daso2055688a12.1;
        Fri, 21 Feb 2025 12:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169962; x=1740774762; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCzEvvz/4hdaWug5SuXohPUbQgRfC2p1Rd/LU9zrC4Q=;
        b=QdQMcXJSzZ+NRNpKFY788bd5RO4t4INuuTmXR5YrA7a0xHwQxyQMceKDWTv/6/R7Oc
         EDwIbLuhJOtCcqCmMltEHBwFvb/cEX0jPtNYE4dTsfhVrfzj/ljLOOlMQnFjLyI4Ei4F
         qEWQR2pU13p8EJUbdKKOYa7mJ1PD+QEDj0FohmmRLQ3IS/rnaZ1w7EqC5HnAraAgGm+F
         R/TbPgg96oMyJFshm4wlf6Gecz64fbK64x9k8JKGl7Rg0RpV5305Esb7HpwLSRnwjMnK
         kfDvT1MYEQlczLbgJJguJ8HvZD6OZWhbPh3LDOQoTAShWVB/N4/8SCi4aRUmfCk3Mfu8
         RApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169962; x=1740774762;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCzEvvz/4hdaWug5SuXohPUbQgRfC2p1Rd/LU9zrC4Q=;
        b=VOJfjyWrxzzaVrZu2uV4frb0yfxwimhvgzGVtsu1jLYEB1I7hwkTjykAvu3xvh2WDj
         ql2SlFgIYqpP2gxpJtuw/JmWPNjT4eNwHw9gmA0jqjj1WI7izxCrVr7ZkVPPlmJ+pmcY
         a1AtoFR84m8OpEuf/+APIayiCVxIkF0Ij7CSubmjbVLBxC8hP/bkoqkVLVT4a3h80ERI
         AUY5TZPDsPH3HgTJg/dgBYYEyMrtNCv8GUO+pW31B23xiwAJkxgD0YUI6alkRyC2GUgk
         eA7YO0h5N3YEN/9RvMdpNe/kKuE84KZ7jJtDslSLpEPG5m1gjDIPz0mKAqoY1e8kD3rI
         5iDw==
X-Forwarded-Encrypted: i=1; AJvYcCX7LpWHCqZGRyVpQdlNKI6WgIKm5f6m8JtOMCaSs4XUhZJJl6GdVCS1xk+uM2acS7b/1x24liHnB/nCJ7Ob@vger.kernel.org, AJvYcCXfrpUdACqVzu/zh9Gf9IcT7zSeuPXlVWe/oll2NV5rVcimo+BzzCJ8Nn76t5rw4sBwif6aFkvt/C3S@vger.kernel.org
X-Gm-Message-State: AOJu0YydC1R++vOqFfpQ/vKkgPANTznj5EgV216Z3Jb4/0Mt6ZUHw7Kl
	FP4CnZEKF3oWUW4oKHHcwYpGH9nKERhIJxZR2vTqKMqsZcreR84X
X-Gm-Gg: ASbGncsLviNqqNI98wUyNGxX+XIhhb1Kt+lx4TA4EKbfuHwWfODAbv6XckN4oS+1avW
	BLlFjJtp5MpllWl04jE9eJgtu/UZWW1kVS8x9d1ZADXvSpSL0yn5uwYhfZTXVb88FrXLQQKD/H6
	VYD+P+makNYKuXhYAqJE5jcHA3F9aDuWbyCdyNBGs/DibsEEnidGVyUgGKPopf4RwfLoJo5bxB4
	lgIdYsYM3uaFSmVGfGIqmDZ13I7WoZ79DlY7Dc4b4zLnw7WWA7CzGPjCymTpt0rc3B1jrWyNmHq
	dMC+pYg4JxPM01JEyUkIzqoa7FofZjMlitdgNArAvdSDQb7e3YSS31+Kq/1I2gmjY8RCicWL
X-Google-Smtp-Source: AGHT+IFATILXQaMnADswtyDx+DZCyaSTYDChKpredh1QzWDuzwGO7pyJSkCn34wfYE8hgWfEzbMrGw==
X-Received: by 2002:a05:6402:3550:b0:5de:44b1:478 with SMTP id 4fb4d7f45d1cf-5e0b6fd559cmr4824146a12.0.1740169961632;
        Fri, 21 Feb 2025 12:32:41 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c418bsm14653485a12.24.2025.02.21.12.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:32:40 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v2 0/6] pinctrl: bcm281xx: Add support for BCM21664 pinmux
Date: Fri, 21 Feb 2025 21:32:36 +0100
Message-Id: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOTiuGcC/2WNywrCMBBFf6XM2kgemmhX/od00U6SdqAvkhKUk
 n83Fly5PAfuuTtEF8hFqKsdgksUaZkLyFMFOLRz7xjZwiC5vHLJNetwkkLrC1tpxi2MTCi0xip
 vblpDma3BeXodyWdTeKC4LeF9PCTxtb+Y+Y8lwThzBn2L905a1T36qaXxjMsETc75A+j9Z0uwA
 AAA
X-Change-ID: 20250206-bcm21664-pinctrl-13cd7d3f7866
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740169959; l=3255;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=cYMGsql8WUyj71GmqI/5eWDIQK1a45bdPq3S1MYNGcs=;
 b=eiBcGuyMljX0cyESjl05vFGTg4fcFnhWGAXzMqFTfOlr33th/rpYb6lg3VQJT40IsjbtyREtx
 UmJ5PVj32lHBaRU+nmlBf3IkANmRIdEwNkSGhasJnrUQEej31h2EFWR
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
Changes in v2:
- Rebase on linux-pinctrl.git for-next branch, drop patch 2 ("pinctrl:
  bcm281xx: Fix incorrect regmap max_registers value") as it has been
  applied separately
- Fix "initializer element is not a compile-time constant" warning
- Fix unused variable warning
- Simplify DT binding
- Link to v1: https://lore.kernel.org/r/20250207-bcm21664-pinctrl-v1-0-e7cfac9b2d3b@gmail.com

---
Artur Weber (6):
      dt-bindings: pinctrl: Add bindings for BCM21664 pin controller
      pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
      pinctrl: bcm281xx: Provide pinctrl device info as OF platform data
      pinctrl: bcm281xx: Add support for BCM21664 pinmux
      ARM: dts: bcm2166x-common: Add pinctrl node
      ARM: dts: bcm2166x: Add bcm2166x-pinctrl DTSI

 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 138 ++++
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |   7 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi   | 297 +++++++
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             | 849 +++++++++++++++++++--
 4 files changed, 1228 insertions(+), 63 deletions(-)
---
base-commit: d01895c5b11849113e70f012d9d142f1d88852f0
change-id: 20250206-bcm21664-pinctrl-13cd7d3f7866

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


