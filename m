Return-Path: <linux-gpio+bounces-29566-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DF1CBEF18
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 17:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 13DB43018495
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E05D3093C9;
	Mon, 15 Dec 2025 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="AIWJvlhh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5E30AACF
	for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816714; cv=none; b=FgoJyrfwvkI3dmKeK9CGR//mu5fSG8Y4iyqfc1WH0jh9WJS5pJyFw/+A846SE2kc4qVkGbhKP3XC+x2rFd9lAOJ/gqhePWKsbTy5gK2gb4+aE0tRyIuRgr2gdkPe96OFVoEO8lliIteP81PBHl9oQgSl6kbvcOhy46dOGJnyqhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816714; c=relaxed/simple;
	bh=k/Yd1BmFzU0e9UFcJv9URIkTbmDEVBM0hOo+JTGIPAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1YzWpb01JLzi1HScgHCVfkeVxb7F5vyXUbGXn5EhBp1D9TvOLus4ZnFZvodkN7C1gEK2pfOz8J3szwfm1HHFnVHwCZVR1jvRHouytAFsSjgQ4+0A692sZMdnDx6eS5QE96KQOUxrXi54vFXDwxmoILVDxtCugcScXF70oWgvSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=AIWJvlhh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso28044785e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 15 Dec 2025 08:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1765816709; x=1766421509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=;
        b=AIWJvlhhcWl5hbSyydkjLe/GDVS3V4vTDb4qeNWdR80M81ODF67qfM5mpLQNIjN2zg
         Cg0N+4vq4jQXHdnYY3svgMl/T49I5Zrp29STPCUNk6JrOin56BtaqbkiwBbaqR3OEZxD
         49isbVf+h4T2y7jhcwZgxNVTn28fbsNDx6pSx03mQF/0PDPnwg/ClnbgMkoHgXwi33ES
         l4rcR55YPGa4n54zK4ReHi/Fp9QkdZ9iXcPVs3V1UJHq0sTlTOTD31QjCOJN1tBd4HdH
         ScnT8mVHvKhb7KcWLzK4aDi21gN7q6e+xh5Vf/QLRwsO8/PdYTmcByG2duRS9HvdtUPv
         m4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816709; x=1766421509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnKll+Mu3yr6wHuUg3E47hI29XfbMlTNI5VvcSPHEnI=;
        b=FrsCPfNsANMLscPeWCezSJuAHB5hw3Z1dI1mp2fYQz+UTpcvZPzLxGw6b6+/FaWqNJ
         lXcLp2D/k88jJy4jIjVY6wex18qxhBo72yDGELYDdVonMSfHWDqenwC8nA+ZJBKwo1AM
         m9rCyGZ6dz5ttcjqkihz1l7hT7XxNm7Y5W4AjB8DW7ny/EUZYfcRHXpkpOTmFSNfgcu7
         6pSdVJLpjMwR2ocSxQO1funVeALOkapkdyxFi6qcJ4Ug9ATbnUIinoZDoO60/8WLuIDM
         Gm1Jckt9h7BwN303P7WWYLxzOIWcV6+JLpPMWeKKugxoo5cz4YWU0ReRvmOOY540y+CB
         1t3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXg8V4yOHYfmkpo6Um3tXrOxr3mRX7OLnwE710N0Ebj5voKlDt33bVXn7dzgkZ6nKJw4Q5gUcSY+08u@vger.kernel.org
X-Gm-Message-State: AOJu0Yy23XlcttllqzmnOQ/DsXHuD1WFnQRgb3FBubVyqOPkl8mDy09f
	AFLHNbWRPSEbcjGQXEORU6Q7rjzQgOmjtz61+McIDXkIG/R+NXLujr8TsogdUbS9iuU=
X-Gm-Gg: AY/fxX6I7Z7HKPmYM0Q8ZrrHm9AU8k85LX6vq412KHNsP0a23HJFuOaWLatdTrNVC9u
	7mmXeFCui0U2atpLJWrxkzwnxRVl5RZ2WRvFMBVNEOM/OjARnMm/nQMbPIAlObZ9AqQIyrl0EvZ
	6qP8A0kxZRucw/31rqau/NsXdDSKFa1zFg/84MuN3IMt1gOJC1xmRYZqibca+/35Zsm6SM49D+N
	L2nHISDfsajFP8lEkjfkmo3+ArG0384uUNOKSBKkzW69hd35HLhs0cv9BYRkbTHidcLw55N+zDD
	72FVWDeHS/i4X+PB1pHIHV5+jmL+ZFYtWIY817NFV/eJqA5g5LuioPQWNDqSG0A3lEwXu8lsMFa
	jqLRY3KmVTL91bTBm0O9PhfLR0nI5PtXfoRLULsfX8aJw9CIJKur/9pd8PT76IYDNo6pxcrSuwt
	ePjynD8Zb0Q5MQd+WkLRlSaniu6eA4xXSmM1M9R+Pwmwie
X-Google-Smtp-Source: AGHT+IHqk87hRgFNW+4zdWPZBEuhhkRVJA1LnAloDmFeZHxaQu5P+L96TkAMIyaxKGjp4sqU43QQWQ==
X-Received: by 2002:a05:600c:a086:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-47a8f90fefamr116081975e9.29.1765816709336;
        Mon, 15 Dec 2025 08:38:29 -0800 (PST)
Received: from fedora (cpezg-94-253-146-254-cbl.xnet.hr. [94.253.146.254])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47a8f74b44csm192209725e9.3.2025.12.15.08.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:38:28 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	linux@roeck-us.net,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	mwalle@kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 01/19] include: dt-bindings: add LAN969x clock bindings
Date: Mon, 15 Dec 2025 17:35:18 +0100
Message-ID: <20251215163820.1584926-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the required LAN969x clock bindings.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Rename file to microchip,lan9691.h

 include/dt-bindings/clock/microchip,lan9691.h | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/clock/microchip,lan9691.h

diff --git a/include/dt-bindings/clock/microchip,lan9691.h b/include/dt-bindings/clock/microchip,lan9691.h
new file mode 100644
index 000000000000..260370c2b238
--- /dev/null
+++ b/include/dt-bindings/clock/microchip,lan9691.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_LAN9691_H
+#define _DT_BINDINGS_CLK_LAN9691_H
+
+#define GCK_ID_QSPI0		0
+#define GCK_ID_QSPI2		1
+#define GCK_ID_SDMMC0		2
+#define GCK_ID_SDMMC1		3
+#define GCK_ID_MCAN0		4
+#define GCK_ID_MCAN1		5
+#define GCK_ID_FLEXCOM0		6
+#define GCK_ID_FLEXCOM1		7
+#define GCK_ID_FLEXCOM2		8
+#define GCK_ID_FLEXCOM3		9
+#define GCK_ID_TIMER		10
+#define GCK_ID_USB_REFCLK	11
+
+/* Gate clocks */
+#define GCK_GATE_USB_DRD	12
+#define GCK_GATE_MCRAMC		13
+#define GCK_GATE_HMATRIX	14
+
+#endif
-- 
2.52.0


