Return-Path: <linux-gpio+bounces-22977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FE4AFE799
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 13:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAA863B4A62
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA07298CD1;
	Wed,  9 Jul 2025 11:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TxaTxBuS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934592980BF
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 11:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060160; cv=none; b=idwmStwm1S3Tma33Ly7vBRMOwHJKa36lTTeCmVSXa9drLRznkMkxLSl8v5I3TibNpyWqqVYYNPpnp2fsDyaHCSZIBbGLlTrGwi9m79M3gat8OMXgf3hXO47EzhUedT7gPm/Zd7pvgm7CMlN2Z4nMlReKnxlrcqEmH4s/+lcfeGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060160; c=relaxed/simple;
	bh=e5zAe4LytXHoMKx6I/SASM+3m+FmFrGqkcUpklIa1v0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U1uBsE6uzzLwEchp531WyZSiKOZI3nAlBzK81/HPZ3B8Y02DPhGAeQrPRqNIX1DKE92hSgiqyvwBypRHPH1UcugWjMFukvCj6bMx3wmKmV3ThoiqJiV59S/cP84G7AZCwQfsWJpqMed6Jf5ksRR2NDx8UgBcmg9Owr0owoXlH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TxaTxBuS; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0d7b32322so845346466b.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 04:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752060157; x=1752664957; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQUJHdPyj8W0gi2bd1ROwjjs1qRB3JgMZnsFYuser6g=;
        b=TxaTxBuSX5u9ZIVQnsDNUIBUSmsWXIRETtzKz9ySoOBMN+3xLJNV53Mqp3fN0PnCLd
         61ghfhTCWxKWZRjkvExvg1+a+8CmHWyxteSNZ8j7wjfxPmsp4Cps43Lny/xUbruYzgud
         Hr1sqLBly9fVbifmt5LC0mR4HqjVYcMHECbSaMciSEgogfg7zgXdY0xlR6hGgdWxArSh
         ioVLdypRyg1rjB7f29foxYvQQktRxS6cF8lSPcKpd7KF7+h1tvyWWnYd/QK9Ecj03Nd7
         p+7tfd7xm7NlkqNks7BzQQ7KqRubymbOGMV6FB+34wSfoOPEwfF0DYVZ2Mr60DyDvyOj
         eoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060157; x=1752664957;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQUJHdPyj8W0gi2bd1ROwjjs1qRB3JgMZnsFYuser6g=;
        b=PJLIAMJfkLFCgJJZl4POFx2r+UcHittnfdhszXmW5h9rVO1t4gvPRT9i/LThsRTWcg
         APLOkfQQszHHllI8lDAP9isgh0muKSktTX5pbKK/AUgE+vxyOlyUj4O7x7hWCXJde1Ij
         objQU+rgjw1VwMeXgKNkGCNqjhvhrWZ8KE6Usvk7g+P2Pwww+n/BbH0TgOQgNIuoE7Uo
         Mgiu7rGKyf72qjUTqOr0gosxGEzZzbMxFYF1OVLGae0BFGeJabVyZmbylT8bBE2eK/7A
         dZfn0cMfthLo7tEJBHNvtgpFI5WBRpSd6uBI4pdSNukv77j9dKaMdzT2n/3AFpCJddGL
         W6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUKDb0dUnbtFriE06x4sO4kMdvn1LvARWJLmZ0ohCzePEQGPuqM41mRNLGGrAJq9xp5x2OPS/r536Km@vger.kernel.org
X-Gm-Message-State: AOJu0YxiAAmPmged5QoQvavlv9mS7oZqNfRA6Q6mOkBEUHVUEk/ari5B
	vJkJDku0Qp+ksO6cuM6f3iYe6U4lkCxOtduonf/qPMZOaidl5gFDowQ+NFA5QEQQDWU=
X-Gm-Gg: ASbGnctbcqf5Xsi/Cl83FUoo2Wu6lO/BzH+vIe4uRFyc66ZhEMMG3WnjhG4xuftf2lM
	4lfahMG3aOc7cenwBMhchQv2xgK0WG0LcqmGhqHcVBPTamgjaERpvSiYLWDrg6ddgi23RuC7zrY
	NhK8xxO9L9NwAMslJb6kxeTatz+IFPsnGZMeVIf1fNC6pSwmeLx/bgk/U1vJAAIzWIp9VvNr82g
	Q/boQBhYS+leJuTjTOPIT4LuQ17Ze6jQXUH4NBjjKEFpHi2q3G3ZMyfMtXiZYzxwgNr0w+R1pqV
	ZslqX/buAeid8aNk1/msrRE5/B0spo3c2Z6XYcBqWeLf8rQHkZVZbiZ0KdRcama1bp28Tm6alje
	0z+AR6KbdZhjUsPHZVnfvz7E6Z8i0ScDJ
X-Google-Smtp-Source: AGHT+IHTfG6JAQuOkgrCHZh/dTq0UW8icnexBa5jfYXWv+zlfUgceZ6v69fBma7jvSHLlIpUiGQFIQ==
X-Received: by 2002:a17:907:944b:b0:ade:44f6:e3d6 with SMTP id a640c23a62f3a-ae6cf78bcc9mr209824266b.46.1752060156792;
        Wed, 09 Jul 2025 04:22:36 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d93basm1079861066b.4.2025.07.09.04.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:22:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add support for PMIV0104 PMIC
Date: Wed, 09 Jul 2025 13:22:25 +0200
Message-Id: <20250709-sm7635-pmiv0104-v2-0-ebf18895edd6@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPFQbmgC/2WQzW6DMBCEXwX53I38g23g1PeocjCwDj7wE9tYi
 SLevYa0olKPs9r5ZnZfJKB3GEhTvIjH5IKbpyz4R0G6wUw3BNdnTTjlkipOIYxaCQnL6BJltAR
 RGqXrWui+7kl2LR6texzEr+tbe7yvGRzfw5ObYw4qU4BraDl4XNBE9BDXyU03sFIJwTrVMmuax
 MnfUr/ms9LOOBG015WVUvOa2iax3duagNDN4+hiUyR1ybm+Y2RvObgQZ/883pCX95o/ePnv4sS
 Agqp6XumubJWgn9Y4vwzzhJdMJ9dt274Buvw45FgBAAA=
X-Change-ID: 20250620-sm7635-pmiv0104-34a679937d9d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752060155; l=1851;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=e5zAe4LytXHoMKx6I/SASM+3m+FmFrGqkcUpklIa1v0=;
 b=8t4l9dFepB9Ly8RCD74D5+Qlo4TsdWYEOdCTY1tu1FRXtor7wWzTX9sYLYo6XhnEq3/9Qlt4o
 L9H3a/QVk85DPbufDPeB7egSAojAkhMhLwhCJ8sMqptK7Qh0/BmGAGd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The PMIV0104 PMIC is used in conjuction with the Milos SoC. Add binding
docs, GPIO support and the devicetree description for it.

Depends on the eUSB2 repeater patchset, as specified by the b4 deps.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Update commit messages to mention Milos instead of SM7635
- Add critical thermal trip
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com

---
Luca Weiss (4):
      dt-bindings: mfd: qcom,spmi-pmic: Document PMIV0104
      dt-bindings: pinctrl: qcom,pmic-gpio: Add PMIV0104 support
      pinctrl: qcom: spmi: Add PMIV0104
      arm64: dts: qcom: Add PMIV0104 PMIC

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
 .../bindings/pinctrl/qcom,pmic-gpio.yaml           |  2 +
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi             | 73 ++++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c           |  1 +
 4 files changed, 77 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250620-sm7635-pmiv0104-34a679937d9d
prerequisite-change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa:v2
prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d
prerequisite-change-id: 20250620-sm7635-eusb-repeater-0d78f557290f:v1
prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d
prerequisite-patch-id: a618abb349c3de5b49f79b4b0f86d9ab502ad500
prerequisite-patch-id: 09f91ff3a25c16a0375bdfec80604a64eab0b4fb
prerequisite-patch-id: 8fca8b09d70409c5c78f9f1b77d0a4c75bce38cf
prerequisite-patch-id: f5c2c24d2baefcd7ff91718529ab2f2c264ab99f

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


