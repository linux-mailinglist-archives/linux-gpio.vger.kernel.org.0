Return-Path: <linux-gpio+bounces-16975-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD4A4CD01
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 21:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 569A318964FE
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 20:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6783722E3F9;
	Mon,  3 Mar 2025 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QX6aeBRf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5BF215041;
	Mon,  3 Mar 2025 20:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741035294; cv=none; b=bp4cU52gy7tONyEP4q/lEh705q+b5F5o9srWExlsuR8lD8X7gLMYVCkzHEhIuFbd4fw5cyR5VQRqKJjhFMXFkbMbCM3qykBCfEstUKM4qBLOT1PFvI9ekBJpUk3/an2dJ5AYfv1DysyhPXRnyD6SP8npKqG5VvbZ4Q/mA5e1w7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741035294; c=relaxed/simple;
	bh=xVCVyhzR3znyQ+Dlc6TH1lqIzrAr9sb7OwnE/9udCog=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MiYebNTAX8gM6Ecqlg1nVxivcj/9gjyOcAmKcJbrLR8wgsUupimlqOWc8iZ0aRmnA2trj9y6CktWNAciVDXgQqrNWMn+S7KonK0NhglY6bva3BQIDj/2BIBCGC50a41fvtgVXU6cfV1JoPhIU5IaVfvYMoqBJtcdWB3XwkOHjbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QX6aeBRf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaec111762bso903503266b.2;
        Mon, 03 Mar 2025 12:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035291; x=1741640091; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQhzWt7YqEgE2rzFMAAkDAkDqzJUmTO0QBEUSSYff7c=;
        b=QX6aeBRfk64Gs1yi0Sfww4c74JRJ5lDrQgOVyMdzLV2Gev88C6/OTdW6mVccHuZ7EG
         ezd1KN3hvdl+2j+4YFVoxXkMxV0DGvKYCtW1cvzoDp7QLv3YiLIxutGDQHqwM33YwQC9
         qVJ7pwzbnn5jztBowzjfyOuEN0zWEnmQRRTzjMfYiYULBIwD5g1zlcwPuUJgq2SWfOkh
         EfiqcXVvuD9/TWgC/OdNL28JTJI2tshG0x7qt89jWDYCYHHM004X5YC8mSzzeQLsCIqU
         pL4g9xBW4h8t7zYiR4mEG8xQ+rOg35QoI+tu6sevh/890bJesF8oonYmQHJ72aVMmfN7
         fPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035291; x=1741640091;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQhzWt7YqEgE2rzFMAAkDAkDqzJUmTO0QBEUSSYff7c=;
        b=jHPKd06f9pGMjREoAMm5HYDFCKP31rwPBnbi4renbPNM/V6mtS0N2oquaOnhnW8Rj0
         HgB9enzHmrPvWXTJFT0jZXiW2SpxfcO087HX4Ob5GRQHwKCkzOxASIdfax69VQNCtafo
         J1c2x6sEqJVGD9SOEfFRgqyB41sS3RC4mcBi75cCZl94WPmpQJyzk+OgmhaJe/+orv9m
         /ZtHkbWyHzGaTYPM94NpW2mr+zmnpHQ41Wub0JVJFfkvad85avfznkP7hynEfTmDJ2MV
         AS1c0Y7jVp3ldqhjN2A7Fh8RU60fEaAtGvAZybhuwpCdsVj/4hfvM8wmijg9Q2my8Ioh
         gBfA==
X-Forwarded-Encrypted: i=1; AJvYcCUA1EsV4L+McZOvzoJifas044PJQG0Nfl2reKhCk08Okt6pdT5wr+zXNhIhCOtSnzfP5TlQUBgaxWam@vger.kernel.org, AJvYcCVcNd4QaEZUj8p/aomf4eDHbdBAagb4x7N7mHhXWT8T0WyrGJ7FmgGcqfLEUQmaaMHmDub7bSz4ZDi/1cG5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/CB4CKJth0CM3hNQpfKmqC7Qz+YjJq09K+pIQR/2XADisSj4i
	HEXq1G3DP91CTqj0uAFj7nc+4RXWuYjBAJf3iygrvmX+gXShSvZc
X-Gm-Gg: ASbGncvD2RdYkvvvwcu12oG3juPduJPjXz+3MUxlFtXnBowV1HgLQI9xNNFdIVGs7TO
	wNOffLckIRdraYocoGjIjm8XCHxcUAQr0KIpP2tf1rB90gEDFR6HTkQIENLpi/3bmWDvC7Pautq
	e+qdPb8K5mKuGBIpqunZbZBMq3sHgV1SIIPAbjrvupisIrlHnTRFgXX5qA6zE/Fg6TuTLL5bE3e
	F/0Q0IkTDnEiMJ0fUP0Y1O9DSg17vBLq3/LrQsPD6iALjMh+qxIVNKfJ7d/2w7sHN6CXzzQM7wO
	icT3woiLOYwgZbOdEs+rP/G0fmbnJiIe+FN7QT3ylRNTf6Ok94a1DRBA9rzPx2c7pMnI5BnELDX
	bchE6GqY5lRUhQM4=
X-Google-Smtp-Source: AGHT+IGjsLpBcJ4huPnLK9kNshjLmzCr3cNTlyU/iMrHPVTnl0eG1OpQl1Ob0qh8cGft9hFa7R01SQ==
X-Received: by 2002:a17:907:3f9a:b0:ab7:8079:78ae with SMTP id a640c23a62f3a-abf265e9bcfmr1729909866b.44.1741035290437;
        Mon, 03 Mar 2025 12:54:50 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:50 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v3 0/6] pinctrl: bcm281xx: Add support for BCM21664 pinmux
Date: Mon, 03 Mar 2025 21:54:45 +0100
Message-Id: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABUXxmcC/23NTQrCMBCG4atI1kaSiSbWlfcQF20yaQf6R1KCU
 np304JQ0OX7wTwzs4iBMLLbYWYBE0Ua+hzqeGC2KfsaObncDARcBAjNK9uB1PrMR+rtFFoulXX
 GKW+uWrN8Ngb09NrIxzN3Q3Eawnv7kOS6fjHziyXJBUdjfWmLCpyq7nVXUnuyQ8dWLMEOAPkHg
 AwYJ70AU3iUeg8sy/IBncSBSPEAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=3492;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=xVCVyhzR3znyQ+Dlc6TH1lqIzrAr9sb7OwnE/9udCog=;
 b=o44mWwlPUdj/Bs+98rpZroni8KRsbLqO0CiFsLgQf4GmNufT1fNciaLL9kcUepaxRJom2cryS
 t1d1JLnE+uvBopdTdZvrp9A/GiuMXTayWWjstLeS/CzL5DMmde9PFv0
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
Changes in v3:
- Rebase on latest linux-pinctrl.git for-next branch
- Fix DT binding example for I2C pins
- Make DT binding more strict
- Link to v2: https://lore.kernel.org/r/20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com

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

 .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 152 ++++
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |   7 +
 arch/arm/boot/dts/broadcom/bcm2166x-pinctrl.dtsi   | 297 +++++++
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c             | 849 +++++++++++++++++++--
 4 files changed, 1242 insertions(+), 63 deletions(-)
---
base-commit: 920d1159328017ef0d57cb3172160ad7d33a9709
change-id: 20250206-bcm21664-pinctrl-13cd7d3f7866

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


