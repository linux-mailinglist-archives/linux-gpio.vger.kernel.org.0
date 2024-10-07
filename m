Return-Path: <linux-gpio+bounces-10939-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E028D99270D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 10:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ECFC1F237BE
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Oct 2024 08:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B98818BBA1;
	Mon,  7 Oct 2024 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSbRbCEr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6411318BB82;
	Mon,  7 Oct 2024 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728290030; cv=none; b=iFVNt3JCFDO52pK5yCwAgmVOkwsYYjLBd+MIfpo5OBvRPwfGfcvK5re5XNiyesPYcm95T7q7xL72Eem5Fq4GECoCVdCpVB/rITYL1jk3bm9XoHpF8Lv0Cs1K27WFV6Z9f/831dprwD+dGVDsvcYWDcf6Nelcj7GwqxI1z9IBmn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728290030; c=relaxed/simple;
	bh=//VTubRTW2Lb8UanrZh1CnRgQFRcmLJwn/1v8wHSiAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JflcNedPRfRm8Bu37JP54ZuKI3L1NTbsksIVLyUjtyqDv8KAkrBILFKFr3DCqujk4efqI4xgHuq3vs8itXE3FouQXSUJlUbD0Uaq3kFWZ4ZbXBiBhDpYtueDIZ7pKXWi7PhRKyCVBqA8hmf/r13D4CAR0uBbDo+RUcNe2SvBykA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSbRbCEr; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e029efecdso626791b3a.3;
        Mon, 07 Oct 2024 01:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728290028; x=1728894828; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGihVTjUeeYrn99rsowchi3hpQiQKhU/jkrVJ72CxnU=;
        b=aSbRbCErSS7Vut9hQ5zwc/Ke/bGw6i/GyF33dLKRW40ykQi1nQw/OCfQkLOZb7SVNs
         +kjHxTV7zTpO4rSWnVR9LhyOAQRpJq6ajHLd9oQ+qmoUSrLkc2kxHcDzvWHuJgaxsVBH
         jkzTMEPVAs4NlhLvvPmjEOfh9mtlf7TSunnvqkAt94STHyGlqoe5ImZzYRyb+ofd3vqX
         pmXEbf2BMlDv1Lzi070M4ef53znG01L5w3bCZ0T13aCL12WxcyN1AEowq4nOqAzaNZaW
         nvRSEJy8W75Jy7CTyhIgya9sMeybahZlufy+lkA7P+inVjvjdtsCSrGx+4gvB7mDWflM
         tFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728290028; x=1728894828;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGihVTjUeeYrn99rsowchi3hpQiQKhU/jkrVJ72CxnU=;
        b=iEap4EKV/74fVFRi1yTZ0Gai+6zbkvPh6NBjE2oQf6VSoELEsVvAuEJemYq2AZJOnr
         +NKZu6p2prAWpSyjDZpwzyPRFdnuGOceFMM9LzzrCRHvPbKrntRehaO5GK7QJ+n308uI
         4EIXjig9nZ/4GNb7sh7UEvjgIQmfBOzz1DToHOLF8iREu4yOw4zeB9k5YouxxU84Snis
         9JTnJIF3jMsDVpkNqAmNPnH6LrvFcWKfhgoL2/zulkslX7t/l/oT92f8kNiSi8dUF1sE
         oJhBUPP0zdiaZxRmX3oe8mubm4slYm0GplHWeymv1+C/8mLyztK0T/pm8bmDQaEwb/Ey
         t6OQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Rhtmq6qn2Yw6p0qBDTZreuIGGriWMKJoix6rAmrVBpUePUVexWHGPErZODYvdJAQE6llasr6R2U3@vger.kernel.org, AJvYcCVVenD7wRvviyBiUSxQEAZ8oY8B1obuJYLqa6Bre1vCU06QlNBheXEZmPRqHjT7kzf2OzQRuvVk8BucMcdv@vger.kernel.org
X-Gm-Message-State: AOJu0YwARy9qbetLsiu6SIcZJDlZRUb9zZqL3d9D+dMlGOglQmfap8fS
	Pgpm3Gp/JaXu1zb+Su/7WEjLgkq47K4MqSpAizb16LfigTysolIc
X-Google-Smtp-Source: AGHT+IEIp1OgQMe1EXbDIikix5+kKdDhhCHE7wIFB+RuK1BjT5OhJs1xojw2EDRzFNoGGMRe1LErEw==
X-Received: by 2002:a05:6a21:1519:b0:1d2:ba7c:c6e7 with SMTP id adf61e73a8af0-1d6dfa5a199mr16220057637.30.1728290027612;
        Mon, 07 Oct 2024 01:33:47 -0700 (PDT)
Received: from mail.google.com (125-239-144-11-fibre.sparkbb.co.nz. [125.239.144.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20af569acsm4746143a91.28.2024.10.07.01.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 01:33:47 -0700 (PDT)
Date: Mon, 7 Oct 2024 21:33:38 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
	ping.bai@nxp.com, kernel@pengutronix.de, linus.walleij@linaro.org,
	Sascha@mail.google.com, Hauer@mail.google.com,
	s.hauer@pengutronix.de, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paulo.miguel.almeida.rodenas@gmail.com
Subject: [PATCH] pinctrl: imx27: Fix redefinition of 'PC' in imx27 driver
Message-ID: <ZwOc4o2i-Wzp5QIV@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The `PC` macro in `drivers/pinctrl/freescale/pinctrl-imx27.c` is
clashing with an existing `PC` macro defined in
`arch/mips/include/uapi/asm/ptrace.h`. This leads to a compilation
error when building for MIPS architecture.

Rename those to use a more specific prefix (`MX27_`) to avoid
conflicts with other platform definitions.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/pinctrl/freescale/pinctrl-imx27.c | 352 +++++++++++-----------
 1 file changed, 176 insertions(+), 176 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx27.c b/drivers/pinctrl/freescale/pinctrl-imx27.c
index 1738df461235..67db00d501f7 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx27.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx27.c
@@ -15,189 +15,189 @@
 
 #include "pinctrl-imx1.h"
 
-#define PAD_ID(port, pin) (port*32 + pin)
-#define PA 0
-#define PB 1
-#define PC 2
-#define PD 3
-#define PE 4
-#define PF 5
+#define MX27_PAD_ID(port, pin) (port*32 + pin)
+#define MX27_PA 0
+#define MX27_PB 1
+#define MX27_PC 2
+#define MX27_PD 3
+#define MX27_PE 4
+#define MX27_PF 5
 
 enum imx27_pads {
-	MX27_PAD_USBH2_CLK = PAD_ID(PA, 0),
-	MX27_PAD_USBH2_DIR = PAD_ID(PA, 1),
-	MX27_PAD_USBH2_DATA7 = PAD_ID(PA, 2),
-	MX27_PAD_USBH2_NXT = PAD_ID(PA, 3),
-	MX27_PAD_USBH2_STP = PAD_ID(PA, 4),
-	MX27_PAD_LSCLK = PAD_ID(PA, 5),
-	MX27_PAD_LD0 = PAD_ID(PA, 6),
-	MX27_PAD_LD1 = PAD_ID(PA, 7),
-	MX27_PAD_LD2 = PAD_ID(PA, 8),
-	MX27_PAD_LD3 = PAD_ID(PA, 9),
-	MX27_PAD_LD4 = PAD_ID(PA, 10),
-	MX27_PAD_LD5 = PAD_ID(PA, 11),
-	MX27_PAD_LD6 = PAD_ID(PA, 12),
-	MX27_PAD_LD7 = PAD_ID(PA, 13),
-	MX27_PAD_LD8 = PAD_ID(PA, 14),
-	MX27_PAD_LD9 = PAD_ID(PA, 15),
-	MX27_PAD_LD10 = PAD_ID(PA, 16),
-	MX27_PAD_LD11 = PAD_ID(PA, 17),
-	MX27_PAD_LD12 = PAD_ID(PA, 18),
-	MX27_PAD_LD13 = PAD_ID(PA, 19),
-	MX27_PAD_LD14 = PAD_ID(PA, 20),
-	MX27_PAD_LD15 = PAD_ID(PA, 21),
-	MX27_PAD_LD16 = PAD_ID(PA, 22),
-	MX27_PAD_LD17 = PAD_ID(PA, 23),
-	MX27_PAD_REV = PAD_ID(PA, 24),
-	MX27_PAD_CLS = PAD_ID(PA, 25),
-	MX27_PAD_PS = PAD_ID(PA, 26),
-	MX27_PAD_SPL_SPR = PAD_ID(PA, 27),
-	MX27_PAD_HSYNC = PAD_ID(PA, 28),
-	MX27_PAD_VSYNC = PAD_ID(PA, 29),
-	MX27_PAD_CONTRAST = PAD_ID(PA, 30),
-	MX27_PAD_OE_ACD = PAD_ID(PA, 31),
+	MX27_PAD_USBH2_CLK = MX27_PAD_ID(MX27_PA, 0),
+	MX27_PAD_USBH2_DIR = MX27_PAD_ID(MX27_PA, 1),
+	MX27_PAD_USBH2_DATA7 = MX27_PAD_ID(MX27_PA, 2),
+	MX27_PAD_USBH2_NXT = MX27_PAD_ID(MX27_PA, 3),
+	MX27_PAD_USBH2_STP = MX27_PAD_ID(MX27_PA, 4),
+	MX27_PAD_LSCLK = MX27_PAD_ID(MX27_PA, 5),
+	MX27_PAD_LD0 = MX27_PAD_ID(MX27_PA, 6),
+	MX27_PAD_LD1 = MX27_PAD_ID(MX27_PA, 7),
+	MX27_PAD_LD2 = MX27_PAD_ID(MX27_PA, 8),
+	MX27_PAD_LD3 = MX27_PAD_ID(MX27_PA, 9),
+	MX27_PAD_LD4 = MX27_PAD_ID(MX27_PA, 10),
+	MX27_PAD_LD5 = MX27_PAD_ID(MX27_PA, 11),
+	MX27_PAD_LD6 = MX27_PAD_ID(MX27_PA, 12),
+	MX27_PAD_LD7 = MX27_PAD_ID(MX27_PA, 13),
+	MX27_PAD_LD8 = MX27_PAD_ID(MX27_PA, 14),
+	MX27_PAD_LD9 = MX27_PAD_ID(MX27_PA, 15),
+	MX27_PAD_LD10 = MX27_PAD_ID(MX27_PA, 16),
+	MX27_PAD_LD11 = MX27_PAD_ID(MX27_PA, 17),
+	MX27_PAD_LD12 = MX27_PAD_ID(MX27_PA, 18),
+	MX27_PAD_LD13 = MX27_PAD_ID(MX27_PA, 19),
+	MX27_PAD_LD14 = MX27_PAD_ID(MX27_PA, 20),
+	MX27_PAD_LD15 = MX27_PAD_ID(MX27_PA, 21),
+	MX27_PAD_LD16 = MX27_PAD_ID(MX27_PA, 22),
+	MX27_PAD_LD17 = MX27_PAD_ID(MX27_PA, 23),
+	MX27_PAD_REV = MX27_PAD_ID(MX27_PA, 24),
+	MX27_PAD_CLS = MX27_PAD_ID(MX27_PA, 25),
+	MX27_PAD_PS = MX27_PAD_ID(MX27_PA, 26),
+	MX27_PAD_SPL_SPR = MX27_PAD_ID(MX27_PA, 27),
+	MX27_PAD_HSYNC = MX27_PAD_ID(MX27_PA, 28),
+	MX27_PAD_VSYNC = MX27_PAD_ID(MX27_PA, 29),
+	MX27_PAD_CONTRAST = MX27_PAD_ID(MX27_PA, 30),
+	MX27_PAD_OE_ACD = MX27_PAD_ID(MX27_PA, 31),
 
-	MX27_PAD_SD2_D0 = PAD_ID(PB, 4),
-	MX27_PAD_SD2_D1 = PAD_ID(PB, 5),
-	MX27_PAD_SD2_D2 = PAD_ID(PB, 6),
-	MX27_PAD_SD2_D3 = PAD_ID(PB, 7),
-	MX27_PAD_SD2_CMD = PAD_ID(PB, 8),
-	MX27_PAD_SD2_CLK = PAD_ID(PB, 9),
-	MX27_PAD_CSI_D0 = PAD_ID(PB, 10),
-	MX27_PAD_CSI_D1 = PAD_ID(PB, 11),
-	MX27_PAD_CSI_D2 = PAD_ID(PB, 12),
-	MX27_PAD_CSI_D3 = PAD_ID(PB, 13),
-	MX27_PAD_CSI_D4 = PAD_ID(PB, 14),
-	MX27_PAD_CSI_MCLK = PAD_ID(PB, 15),
-	MX27_PAD_CSI_PIXCLK = PAD_ID(PB, 16),
-	MX27_PAD_CSI_D5 = PAD_ID(PB, 17),
-	MX27_PAD_CSI_D6 = PAD_ID(PB, 18),
-	MX27_PAD_CSI_D7 = PAD_ID(PB, 19),
-	MX27_PAD_CSI_VSYNC = PAD_ID(PB, 20),
-	MX27_PAD_CSI_HSYNC = PAD_ID(PB, 21),
-	MX27_PAD_USBH1_SUSP = PAD_ID(PB, 22),
-	MX27_PAD_USB_PWR = PAD_ID(PB, 23),
-	MX27_PAD_USB_OC_B = PAD_ID(PB, 24),
-	MX27_PAD_USBH1_RCV = PAD_ID(PB, 25),
-	MX27_PAD_USBH1_FS = PAD_ID(PB, 26),
-	MX27_PAD_USBH1_OE_B = PAD_ID(PB, 27),
-	MX27_PAD_USBH1_TXDM = PAD_ID(PB, 28),
-	MX27_PAD_USBH1_TXDP = PAD_ID(PB, 29),
-	MX27_PAD_USBH1_RXDM = PAD_ID(PB, 30),
-	MX27_PAD_USBH1_RXDP = PAD_ID(PB, 31),
+	MX27_PAD_SD2_D0 = MX27_PAD_ID(MX27_PB, 4),
+	MX27_PAD_SD2_D1 = MX27_PAD_ID(MX27_PB, 5),
+	MX27_PAD_SD2_D2 = MX27_PAD_ID(MX27_PB, 6),
+	MX27_PAD_SD2_D3 = MX27_PAD_ID(MX27_PB, 7),
+	MX27_PAD_SD2_CMD = MX27_PAD_ID(MX27_PB, 8),
+	MX27_PAD_SD2_CLK = MX27_PAD_ID(MX27_PB, 9),
+	MX27_PAD_CSI_D0 = MX27_PAD_ID(MX27_PB, 10),
+	MX27_PAD_CSI_D1 = MX27_PAD_ID(MX27_PB, 11),
+	MX27_PAD_CSI_D2 = MX27_PAD_ID(MX27_PB, 12),
+	MX27_PAD_CSI_D3 = MX27_PAD_ID(MX27_PB, 13),
+	MX27_PAD_CSI_D4 = MX27_PAD_ID(MX27_PB, 14),
+	MX27_PAD_CSI_MCLK = MX27_PAD_ID(MX27_PB, 15),
+	MX27_PAD_CSI_PIXCLK = MX27_PAD_ID(MX27_PB, 16),
+	MX27_PAD_CSI_D5 = MX27_PAD_ID(MX27_PB, 17),
+	MX27_PAD_CSI_D6 = MX27_PAD_ID(MX27_PB, 18),
+	MX27_PAD_CSI_D7 = MX27_PAD_ID(MX27_PB, 19),
+	MX27_PAD_CSI_VSYNC = MX27_PAD_ID(MX27_PB, 20),
+	MX27_PAD_CSI_HSYNC = MX27_PAD_ID(MX27_PB, 21),
+	MX27_PAD_USBH1_SUSP = MX27_PAD_ID(MX27_PB, 22),
+	MX27_PAD_USB_PWR = MX27_PAD_ID(MX27_PB, 23),
+	MX27_PAD_USB_OC_B = MX27_PAD_ID(MX27_PB, 24),
+	MX27_PAD_USBH1_RCV = MX27_PAD_ID(MX27_PB, 25),
+	MX27_PAD_USBH1_FS = MX27_PAD_ID(MX27_PB, 26),
+	MX27_PAD_USBH1_OE_B = MX27_PAD_ID(MX27_PB, 27),
+	MX27_PAD_USBH1_TXDM = MX27_PAD_ID(MX27_PB, 28),
+	MX27_PAD_USBH1_TXDP = MX27_PAD_ID(MX27_PB, 29),
+	MX27_PAD_USBH1_RXDM = MX27_PAD_ID(MX27_PB, 30),
+	MX27_PAD_USBH1_RXDP = MX27_PAD_ID(MX27_PB, 31),
 
-	MX27_PAD_I2C2_SDA = PAD_ID(PC, 5),
-	MX27_PAD_I2C2_SCL = PAD_ID(PC, 6),
-	MX27_PAD_USBOTG_DATA5 = PAD_ID(PC, 7),
-	MX27_PAD_USBOTG_DATA6 = PAD_ID(PC, 8),
-	MX27_PAD_USBOTG_DATA0 = PAD_ID(PC, 9),
-	MX27_PAD_USBOTG_DATA2 = PAD_ID(PC, 10),
-	MX27_PAD_USBOTG_DATA1 = PAD_ID(PC, 11),
-	MX27_PAD_USBOTG_DATA4 = PAD_ID(PC, 12),
-	MX27_PAD_USBOTG_DATA3 = PAD_ID(PC, 13),
-	MX27_PAD_TOUT = PAD_ID(PC, 14),
-	MX27_PAD_TIN = PAD_ID(PC, 15),
-	MX27_PAD_SSI4_FS = PAD_ID(PC, 16),
-	MX27_PAD_SSI4_RXDAT = PAD_ID(PC, 17),
-	MX27_PAD_SSI4_TXDAT = PAD_ID(PC, 18),
-	MX27_PAD_SSI4_CLK = PAD_ID(PC, 19),
-	MX27_PAD_SSI1_FS = PAD_ID(PC, 20),
-	MX27_PAD_SSI1_RXDAT = PAD_ID(PC, 21),
-	MX27_PAD_SSI1_TXDAT = PAD_ID(PC, 22),
-	MX27_PAD_SSI1_CLK = PAD_ID(PC, 23),
-	MX27_PAD_SSI2_FS = PAD_ID(PC, 24),
-	MX27_PAD_SSI2_RXDAT = PAD_ID(PC, 25),
-	MX27_PAD_SSI2_TXDAT = PAD_ID(PC, 26),
-	MX27_PAD_SSI2_CLK = PAD_ID(PC, 27),
-	MX27_PAD_SSI3_FS = PAD_ID(PC, 28),
-	MX27_PAD_SSI3_RXDAT = PAD_ID(PC, 29),
-	MX27_PAD_SSI3_TXDAT = PAD_ID(PC, 30),
-	MX27_PAD_SSI3_CLK = PAD_ID(PC, 31),
+	MX27_PAD_I2C2_SDA = MX27_PAD_ID(MX27_PC, 5),
+	MX27_PAD_I2C2_SCL = MX27_PAD_ID(MX27_PC, 6),
+	MX27_PAD_USBOTG_DATA5 = MX27_PAD_ID(MX27_PC, 7),
+	MX27_PAD_USBOTG_DATA6 = MX27_PAD_ID(MX27_PC, 8),
+	MX27_PAD_USBOTG_DATA0 = MX27_PAD_ID(MX27_PC, 9),
+	MX27_PAD_USBOTG_DATA2 = MX27_PAD_ID(MX27_PC, 10),
+	MX27_PAD_USBOTG_DATA1 = MX27_PAD_ID(MX27_PC, 11),
+	MX27_PAD_USBOTG_DATA4 = MX27_PAD_ID(MX27_PC, 12),
+	MX27_PAD_USBOTG_DATA3 = MX27_PAD_ID(MX27_PC, 13),
+	MX27_PAD_TOUT = MX27_PAD_ID(MX27_PC, 14),
+	MX27_PAD_TIN = MX27_PAD_ID(MX27_PC, 15),
+	MX27_PAD_SSI4_FS = MX27_PAD_ID(MX27_PC, 16),
+	MX27_PAD_SSI4_RXDAT = MX27_PAD_ID(MX27_PC, 17),
+	MX27_PAD_SSI4_TXDAT = MX27_PAD_ID(MX27_PC, 18),
+	MX27_PAD_SSI4_CLK = MX27_PAD_ID(MX27_PC, 19),
+	MX27_PAD_SSI1_FS = MX27_PAD_ID(MX27_PC, 20),
+	MX27_PAD_SSI1_RXDAT = MX27_PAD_ID(MX27_PC, 21),
+	MX27_PAD_SSI1_TXDAT = MX27_PAD_ID(MX27_PC, 22),
+	MX27_PAD_SSI1_CLK = MX27_PAD_ID(MX27_PC, 23),
+	MX27_PAD_SSI2_FS = MX27_PAD_ID(MX27_PC, 24),
+	MX27_PAD_SSI2_RXDAT = MX27_PAD_ID(MX27_PC, 25),
+	MX27_PAD_SSI2_TXDAT = MX27_PAD_ID(MX27_PC, 26),
+	MX27_PAD_SSI2_CLK = MX27_PAD_ID(MX27_PC, 27),
+	MX27_PAD_SSI3_FS = MX27_PAD_ID(MX27_PC, 28),
+	MX27_PAD_SSI3_RXDAT = MX27_PAD_ID(MX27_PC, 29),
+	MX27_PAD_SSI3_TXDAT = MX27_PAD_ID(MX27_PC, 30),
+	MX27_PAD_SSI3_CLK = MX27_PAD_ID(MX27_PC, 31),
 
-	MX27_PAD_SD3_CMD = PAD_ID(PD, 0),
-	MX27_PAD_SD3_CLK = PAD_ID(PD, 1),
-	MX27_PAD_ATA_DATA0 = PAD_ID(PD, 2),
-	MX27_PAD_ATA_DATA1 = PAD_ID(PD, 3),
-	MX27_PAD_ATA_DATA2 = PAD_ID(PD, 4),
-	MX27_PAD_ATA_DATA3 = PAD_ID(PD, 5),
-	MX27_PAD_ATA_DATA4 = PAD_ID(PD, 6),
-	MX27_PAD_ATA_DATA5 = PAD_ID(PD, 7),
-	MX27_PAD_ATA_DATA6 = PAD_ID(PD, 8),
-	MX27_PAD_ATA_DATA7 = PAD_ID(PD, 9),
-	MX27_PAD_ATA_DATA8 = PAD_ID(PD, 10),
-	MX27_PAD_ATA_DATA9 = PAD_ID(PD, 11),
-	MX27_PAD_ATA_DATA10 = PAD_ID(PD, 12),
-	MX27_PAD_ATA_DATA11 = PAD_ID(PD, 13),
-	MX27_PAD_ATA_DATA12 = PAD_ID(PD, 14),
-	MX27_PAD_ATA_DATA13 = PAD_ID(PD, 15),
-	MX27_PAD_ATA_DATA14 = PAD_ID(PD, 16),
-	MX27_PAD_I2C_DATA = PAD_ID(PD, 17),
-	MX27_PAD_I2C_CLK = PAD_ID(PD, 18),
-	MX27_PAD_CSPI2_SS2 = PAD_ID(PD, 19),
-	MX27_PAD_CSPI2_SS1 = PAD_ID(PD, 20),
-	MX27_PAD_CSPI2_SS0 = PAD_ID(PD, 21),
-	MX27_PAD_CSPI2_SCLK = PAD_ID(PD, 22),
-	MX27_PAD_CSPI2_MISO = PAD_ID(PD, 23),
-	MX27_PAD_CSPI2_MOSI = PAD_ID(PD, 24),
-	MX27_PAD_CSPI1_RDY = PAD_ID(PD, 25),
-	MX27_PAD_CSPI1_SS2 = PAD_ID(PD, 26),
-	MX27_PAD_CSPI1_SS1 = PAD_ID(PD, 27),
-	MX27_PAD_CSPI1_SS0 = PAD_ID(PD, 28),
-	MX27_PAD_CSPI1_SCLK = PAD_ID(PD, 29),
-	MX27_PAD_CSPI1_MISO = PAD_ID(PD, 30),
-	MX27_PAD_CSPI1_MOSI = PAD_ID(PD, 31),
+	MX27_PAD_SD3_CMD = MX27_PAD_ID(MX27_PD, 0),
+	MX27_PAD_SD3_CLK = MX27_PAD_ID(MX27_PD, 1),
+	MX27_PAD_ATA_DATA0 = MX27_PAD_ID(MX27_PD, 2),
+	MX27_PAD_ATA_DATA1 = MX27_PAD_ID(MX27_PD, 3),
+	MX27_PAD_ATA_DATA2 = MX27_PAD_ID(MX27_PD, 4),
+	MX27_PAD_ATA_DATA3 = MX27_PAD_ID(MX27_PD, 5),
+	MX27_PAD_ATA_DATA4 = MX27_PAD_ID(MX27_PD, 6),
+	MX27_PAD_ATA_DATA5 = MX27_PAD_ID(MX27_PD, 7),
+	MX27_PAD_ATA_DATA6 = MX27_PAD_ID(MX27_PD, 8),
+	MX27_PAD_ATA_DATA7 = MX27_PAD_ID(MX27_PD, 9),
+	MX27_PAD_ATA_DATA8 = MX27_PAD_ID(MX27_PD, 10),
+	MX27_PAD_ATA_DATA9 = MX27_PAD_ID(MX27_PD, 11),
+	MX27_PAD_ATA_DATA10 = MX27_PAD_ID(MX27_PD, 12),
+	MX27_PAD_ATA_DATA11 = MX27_PAD_ID(MX27_PD, 13),
+	MX27_PAD_ATA_DATA12 = MX27_PAD_ID(MX27_PD, 14),
+	MX27_PAD_ATA_DATA13 = MX27_PAD_ID(MX27_PD, 15),
+	MX27_PAD_ATA_DATA14 = MX27_PAD_ID(MX27_PD, 16),
+	MX27_PAD_I2C_DATA = MX27_PAD_ID(MX27_PD, 17),
+	MX27_PAD_I2C_CLK = MX27_PAD_ID(MX27_PD, 18),
+	MX27_PAD_CSPI2_SS2 = MX27_PAD_ID(MX27_PD, 19),
+	MX27_PAD_CSPI2_SS1 = MX27_PAD_ID(MX27_PD, 20),
+	MX27_PAD_CSPI2_SS0 = MX27_PAD_ID(MX27_PD, 21),
+	MX27_PAD_CSPI2_SCLK = MX27_PAD_ID(MX27_PD, 22),
+	MX27_PAD_CSPI2_MISO = MX27_PAD_ID(MX27_PD, 23),
+	MX27_PAD_CSPI2_MOSI = MX27_PAD_ID(MX27_PD, 24),
+	MX27_PAD_CSPI1_RDY = MX27_PAD_ID(MX27_PD, 25),
+	MX27_PAD_CSPI1_SS2 = MX27_PAD_ID(MX27_PD, 26),
+	MX27_PAD_CSPI1_SS1 = MX27_PAD_ID(MX27_PD, 27),
+	MX27_PAD_CSPI1_SS0 = MX27_PAD_ID(MX27_PD, 28),
+	MX27_PAD_CSPI1_SCLK = MX27_PAD_ID(MX27_PD, 29),
+	MX27_PAD_CSPI1_MISO = MX27_PAD_ID(MX27_PD, 30),
+	MX27_PAD_CSPI1_MOSI = MX27_PAD_ID(MX27_PD, 31),
 
-	MX27_PAD_USBOTG_NXT = PAD_ID(PE, 0),
-	MX27_PAD_USBOTG_STP = PAD_ID(PE, 1),
-	MX27_PAD_USBOTG_DIR = PAD_ID(PE, 2),
-	MX27_PAD_UART2_CTS = PAD_ID(PE, 3),
-	MX27_PAD_UART2_RTS = PAD_ID(PE, 4),
-	MX27_PAD_PWMO = PAD_ID(PE, 5),
-	MX27_PAD_UART2_TXD = PAD_ID(PE, 6),
-	MX27_PAD_UART2_RXD = PAD_ID(PE, 7),
-	MX27_PAD_UART3_TXD = PAD_ID(PE, 8),
-	MX27_PAD_UART3_RXD = PAD_ID(PE, 9),
-	MX27_PAD_UART3_CTS = PAD_ID(PE, 10),
-	MX27_PAD_UART3_RTS = PAD_ID(PE, 11),
-	MX27_PAD_UART1_TXD = PAD_ID(PE, 12),
-	MX27_PAD_UART1_RXD = PAD_ID(PE, 13),
-	MX27_PAD_UART1_CTS = PAD_ID(PE, 14),
-	MX27_PAD_UART1_RTS = PAD_ID(PE, 15),
-	MX27_PAD_RTCK = PAD_ID(PE, 16),
-	MX27_PAD_RESET_OUT_B = PAD_ID(PE, 17),
-	MX27_PAD_SD1_D0 = PAD_ID(PE, 18),
-	MX27_PAD_SD1_D1 = PAD_ID(PE, 19),
-	MX27_PAD_SD1_D2 = PAD_ID(PE, 20),
-	MX27_PAD_SD1_D3 = PAD_ID(PE, 21),
-	MX27_PAD_SD1_CMD = PAD_ID(PE, 22),
-	MX27_PAD_SD1_CLK = PAD_ID(PE, 23),
-	MX27_PAD_USBOTG_CLK = PAD_ID(PE, 24),
-	MX27_PAD_USBOTG_DATA7 = PAD_ID(PE, 25),
+	MX27_PAD_USBOTG_NXT = MX27_PAD_ID(MX27_PE, 0),
+	MX27_PAD_USBOTG_STP = MX27_PAD_ID(MX27_PE, 1),
+	MX27_PAD_USBOTG_DIR = MX27_PAD_ID(MX27_PE, 2),
+	MX27_PAD_UART2_CTS = MX27_PAD_ID(MX27_PE, 3),
+	MX27_PAD_UART2_RTS = MX27_PAD_ID(MX27_PE, 4),
+	MX27_PAD_PWMO = MX27_PAD_ID(MX27_PE, 5),
+	MX27_PAD_UART2_TXD = MX27_PAD_ID(MX27_PE, 6),
+	MX27_PAD_UART2_RXD = MX27_PAD_ID(MX27_PE, 7),
+	MX27_PAD_UART3_TXD = MX27_PAD_ID(MX27_PE, 8),
+	MX27_PAD_UART3_RXD = MX27_PAD_ID(MX27_PE, 9),
+	MX27_PAD_UART3_CTS = MX27_PAD_ID(MX27_PE, 10),
+	MX27_PAD_UART3_RTS = MX27_PAD_ID(MX27_PE, 11),
+	MX27_PAD_UART1_TXD = MX27_PAD_ID(MX27_PE, 12),
+	MX27_PAD_UART1_RXD = MX27_PAD_ID(MX27_PE, 13),
+	MX27_PAD_UART1_CTS = MX27_PAD_ID(MX27_PE, 14),
+	MX27_PAD_UART1_RTS = MX27_PAD_ID(MX27_PE, 15),
+	MX27_PAD_RTCK = MX27_PAD_ID(MX27_PE, 16),
+	MX27_PAD_RESET_OUT_B = MX27_PAD_ID(MX27_PE, 17),
+	MX27_PAD_SD1_D0 = MX27_PAD_ID(MX27_PE, 18),
+	MX27_PAD_SD1_D1 = MX27_PAD_ID(MX27_PE, 19),
+	MX27_PAD_SD1_D2 = MX27_PAD_ID(MX27_PE, 20),
+	MX27_PAD_SD1_D3 = MX27_PAD_ID(MX27_PE, 21),
+	MX27_PAD_SD1_CMD = MX27_PAD_ID(MX27_PE, 22),
+	MX27_PAD_SD1_CLK = MX27_PAD_ID(MX27_PE, 23),
+	MX27_PAD_USBOTG_CLK = MX27_PAD_ID(MX27_PE, 24),
+	MX27_PAD_USBOTG_DATA7 = MX27_PAD_ID(MX27_PE, 25),
 
-	MX27_PAD_NFRB = PAD_ID(PF, 0),
-	MX27_PAD_NFCLE = PAD_ID(PF, 1),
-	MX27_PAD_NFWP_B = PAD_ID(PF, 2),
-	MX27_PAD_NFCE_B = PAD_ID(PF, 3),
-	MX27_PAD_NFALE = PAD_ID(PF, 4),
-	MX27_PAD_NFRE_B = PAD_ID(PF, 5),
-	MX27_PAD_NFWE_B = PAD_ID(PF, 6),
-	MX27_PAD_PC_POE = PAD_ID(PF, 7),
-	MX27_PAD_PC_RW_B = PAD_ID(PF, 8),
-	MX27_PAD_IOIS16 = PAD_ID(PF, 9),
-	MX27_PAD_PC_RST = PAD_ID(PF, 10),
-	MX27_PAD_PC_BVD2 = PAD_ID(PF, 11),
-	MX27_PAD_PC_BVD1 = PAD_ID(PF, 12),
-	MX27_PAD_PC_VS2 = PAD_ID(PF, 13),
-	MX27_PAD_PC_VS1 = PAD_ID(PF, 14),
-	MX27_PAD_CLKO = PAD_ID(PF, 15),
-	MX27_PAD_PC_PWRON = PAD_ID(PF, 16),
-	MX27_PAD_PC_READY = PAD_ID(PF, 17),
-	MX27_PAD_PC_WAIT_B = PAD_ID(PF, 18),
-	MX27_PAD_PC_CD2_B = PAD_ID(PF, 19),
-	MX27_PAD_PC_CD1_B = PAD_ID(PF, 20),
-	MX27_PAD_CS4_B = PAD_ID(PF, 21),
-	MX27_PAD_CS5_B = PAD_ID(PF, 22),
-	MX27_PAD_ATA_DATA15 = PAD_ID(PF, 23),
+	MX27_PAD_NFRB = MX27_PAD_ID(MX27_PF, 0),
+	MX27_PAD_NFCLE = MX27_PAD_ID(MX27_PF, 1),
+	MX27_PAD_NFWP_B = MX27_PAD_ID(MX27_PF, 2),
+	MX27_PAD_NFCE_B = MX27_PAD_ID(MX27_PF, 3),
+	MX27_PAD_NFALE = MX27_PAD_ID(MX27_PF, 4),
+	MX27_PAD_NFRE_B = MX27_PAD_ID(MX27_PF, 5),
+	MX27_PAD_NFWE_B = MX27_PAD_ID(MX27_PF, 6),
+	MX27_PAD_PC_POE = MX27_PAD_ID(MX27_PF, 7),
+	MX27_PAD_PC_RW_B = MX27_PAD_ID(MX27_PF, 8),
+	MX27_PAD_IOIS16 = MX27_PAD_ID(MX27_PF, 9),
+	MX27_PAD_PC_RST = MX27_PAD_ID(MX27_PF, 10),
+	MX27_PAD_PC_BVD2 = MX27_PAD_ID(MX27_PF, 11),
+	MX27_PAD_PC_BVD1 = MX27_PAD_ID(MX27_PF, 12),
+	MX27_PAD_PC_VS2 = MX27_PAD_ID(MX27_PF, 13),
+	MX27_PAD_PC_VS1 = MX27_PAD_ID(MX27_PF, 14),
+	MX27_PAD_CLKO = MX27_PAD_ID(MX27_PF, 15),
+	MX27_PAD_PC_PWRON = MX27_PAD_ID(MX27_PF, 16),
+	MX27_PAD_PC_READY = MX27_PAD_ID(MX27_PF, 17),
+	MX27_PAD_PC_WAIT_B = MX27_PAD_ID(MX27_PF, 18),
+	MX27_PAD_PC_CD2_B = MX27_PAD_ID(MX27_PF, 19),
+	MX27_PAD_PC_CD1_B = MX27_PAD_ID(MX27_PF, 20),
+	MX27_PAD_CS4_B = MX27_PAD_ID(MX27_PF, 21),
+	MX27_PAD_CS5_B = MX27_PAD_ID(MX27_PF, 22),
+	MX27_PAD_ATA_DATA15 = MX27_PAD_ID(MX27_PF, 23),
 };
 
 /* Pad names for the pinmux subsystem */
-- 
2.46.0


