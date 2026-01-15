Return-Path: <linux-gpio+bounces-30598-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C54A1D2445E
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 12:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A658D302E7CB
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 11:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C60A37BE71;
	Thu, 15 Jan 2026 11:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="bgojcElQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E600837F728
	for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477298; cv=none; b=CVwiQBQzr8PRmLSfabgz6pCVNeUxyKM4chC8SLtWHXC/oPFxBt8SBM+ZTZPDfS3cnzOmOdqqr8yWbD+OWHo0ozCsZ6EJhPVWjxI4crSyOBAbvCvx+9MvvieoUxVhBUxf/dKwKLrpQoBm+4Wp6i9mLDIp4O9dK+AzU+hJh//vS1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477298; c=relaxed/simple;
	bh=kGLAInhaNaEk5rc2QTU8x+5FcCE5pgYroSfVZcUveHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lF0UMCy1XrkDLJPiIoU5tWgeHqPSnTj6e+TOxAc37fufZGVL0eo1kyTkUJSEbqJDY2hkEeolzeX6a5KAxSfjRHxU+i4FR6MTZv8ILqhHvp2W+LGWhsvRezOmtB7Gq+Vs3bnCddpDFs4c3ZZxQ3VPAxizRJGtje7WkBwS2Nt4WRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=bgojcElQ; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1233c155a42so926157c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jan 2026 03:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477294; x=1769082094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6Hh4x4yU6+a4AjWH4xSBmP3UWp5wIhlMj96VEo5V8g=;
        b=bgojcElQFKHWk8J2QDM7bzI7VeTyPtMU5yByyGLHBGEn0Yzh6BeApsylOLgTpadW4C
         KTO1oV5OARVmQgoUL2M7aMX8JxJbTyaGXnuY1QlkT9ZTwtT4DFVNXsbB7oM/L3ESDuh+
         IVs1btTKYgCKpoOZMrBCkWDrae+Qk25O2wHtNBudsylq5Gdj9fYDS2GIRpqIIdBYA2jF
         hsfBZOtSrnv2D+T1AfKZxKG/klbK0DitTvy5qNG9gy1RmjLb/J+wl2WooBVlzq4LRMJP
         vwoW4R36Rj15ZIavj6NtwxzN41g92CfBvH2dEcieMaVZeOXyIIIJw137E7xK7o4Zmtrc
         sZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477294; x=1769082094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A6Hh4x4yU6+a4AjWH4xSBmP3UWp5wIhlMj96VEo5V8g=;
        b=mXRc54pZ/OoeasgiS7iNv5rlgZzMBBv4o7+95V7cHtx6NqJDHL/TDbjzTo9e83yKg+
         Lkt844H+KwLN72rupYjbR+mFezVrBEuG+3gBOqn3u0JXQMIHJrVkPbxuEe1Ux+oqcm1R
         9mRISB2A00staNljCxYKPrsLYMRWy8SO5h2yqBdEKbUPBBIlo2Tr19/sca7lY3SVC5Tt
         ekwhebMI7/MLvR0LIm9/4DDSdOkgc6r/N/NlKgszPYjsoyQwzgXpu5YrShj8O6adpmkb
         lGpnN+CDdbLILuzGm3yxOKnI/v8jOjsIQ95RydUHNmePkNCHFsVywh6e6RLL3+AESz/L
         lxfg==
X-Forwarded-Encrypted: i=1; AJvYcCVVUyeeOAAISV5UZNJq5Jdksls3XfGijCvvpm8htk30KzRlN/Wume5CMI3MZ4Uahc2ZWqFPxARWY9yD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz42QVVY5lRRgdQi9VGDU+d0d6OhNdThJ9ihvi2ZW2UJtOuKvNY
	7v0T26nRFvEr2WVjwsyDX84X7iEinjnrcrKiO1LTBDgm0Ol4VOJnd7ABUOHPQcT2jBE=
X-Gm-Gg: AY/fxX4sVXkJMBG5ArHgGjGXnsFG5ALfmt9zNEW8j7h74NOcO9TsfQd5B83ABNqb78X
	aONUclSaYSd3jlDyBgzH8Jct2bOml1QsWiyo8CgXXyUQCxbPhiTwxm9UsgYSH2tuqABqk2w70nH
	1IkN4tqc1ckDWKWCC1Vd2kWQLeOMj/9AB03apDNtS5PWQuUjtHt6QySqMGZIgPa2JS1VFlx8NXB
	6BafL41vSZ3NwH4OAOVaL3mQSb4OLTVzvYXpCkLxySoq2mAUY1qol8Yhaq+qP/wL4b3Dx33p97g
	NLX6cXnDiSi1uGjBCIeZuVXX3BQn0SeJCh6gTwJ8PRiHyt9qk6zozw1Yg6zW4CwfxEg3Dlhdh9I
	lpEMTEDfcrPQwqi8+eLUt8ZLs9mOitpEnw3l4meq+svTApS7g2TZbsrJ3esuVt3W/EU4evEuGp8
	v583+M/fJrSAP/tJUiKA0FcbdLiG294eTFvNhdz78HArm1RBfX/v+Yz2p28nN7RKTHok/W7Fse6
	Om/pC6g
X-Received: by 2002:a05:701b:220b:b0:119:e56b:98bf with SMTP id a92af1059eb24-12336a82526mr5837069c88.38.1768477294058;
        Thu, 15 Jan 2026 03:41:34 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:33 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 07/11] arm64: dts: microchip: add LAN969x clock header file
Date: Thu, 15 Jan 2026 12:37:32 +0100
Message-ID: <20260115114021.111324-8-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses hardware clock indexes, so document theses in a header to make
them humanly readable.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v5:
* Relicense to GPL-2.0-or-later OR MIT to match DTSI

 arch/arm64/boot/dts/microchip/clk-lan9691.h | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h

diff --git a/arch/arm64/boot/dts/microchip/clk-lan9691.h b/arch/arm64/boot/dts/microchip/clk-lan9691.h
new file mode 100644
index 000000000000..0f2d7a0f881e
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/clk-lan9691.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR MIT) */
+
+#ifndef _DTS_CLK_LAN9691_H
+#define _DTS_CLK_LAN9691_H
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


