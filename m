Return-Path: <linux-gpio+bounces-19232-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA1A9A1E1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EEB95A3DAB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 06:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C530120E6F7;
	Thu, 24 Apr 2025 06:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="aTmw7cA0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58409207DFE;
	Thu, 24 Apr 2025 06:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475756; cv=pass; b=AvaGCkM411bL6anUYAkA/QGSZ6gEmvDLw2kYzLc4Wfk+vxmTAUY6GfnGTWLcoaOljiFpsxkarzLCFJZ6xaNHZuWa2ssypdATPJ0L9T4BtJcIifQsvzd9KgSAGOe0RkcGpGFCRYbqUkFlO8k/XVB3YUEwBcnDsMXTDxlZlygipNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475756; c=relaxed/simple;
	bh=Hsya3hwoUK8Ds+oFmJkETUofzArkqVuMq/FiU0wxbT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvhrRn4PSs/RA9KSZLGC1NU/9HID8GBtpUUxVRrr5ypQ2DZeQzPgtVTfkYvqwhSG2JP/GiW6epaWhS12N8CUul50i5A8iuPa3MP1TaTk4LHgXZh4qXumaCq9HugaKV/JmfyfBpa0vbSBqFpku2SmLl4cs1OqOBB/9oEa0gnspdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=aTmw7cA0; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745475729; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kDArssAjro99bi32ehmZfpQjev/z2RBPR3f4PwgXnYPpQjWPxuGrhX2gTQhwX6DeyIm9kTYxhi/klXB+pi+hwHPBx17ODPMIw2JS3r/E7K+0LtlLu9aknopkwB8NM2b3Fs1Sdr9sJFOlq9XbgsFP/+w9pC7SYN1eNwg6/zDSF2A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745475729; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xVNOvXEvdW6leQE28c3jHe0aUAqH+GUjgXBsNd/0dtY=; 
	b=Xbqexsx+Y827fYArushI327qEhT+N+Q32WMJPDdq94wAAWWWujOiHtONtYGU1LAP49Lp00f08EpXOVPkZwAnRrBaY+M2iNNlg+wtf1KJEm90dI+wdMo0Em49jYrE7Fx2c7FPOhFxJsanfBRvai6C+f7N+NgD0hZtSSmD3EeN7HU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745475729;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xVNOvXEvdW6leQE28c3jHe0aUAqH+GUjgXBsNd/0dtY=;
	b=aTmw7cA0A0R7yGwvidNysZ7lVbcK8j3iS0tYCpm6FjiTxXMnaR9ptnsGRb1kzUMC
	V3JtyIIZ1XuzwEuN7Gz0sHdJYzzGQb5T65nideQk+BM00P1mp292UrO9bVXvF9cwB5y
	Ihuc7dxMXSGibLBQJZpmBEV/2bXLS487kXHyYbj9P03roC7UYmkuxzU8Ji3dJsz9MCl
	uRogeAoqAEEvn6mBfxWIJTIgH3wm3VpcZakcs6QmT6gvhqVAlgalOYQy+EVWwCTELyI
	HhCyx1COuaqz6odjBcY9ScWA0CZEMssyVF1ylHqaI/Jf5TYtrqwKSgezprny/F0I7Qh
	bdIfjBFarA==
Received: by mx.zohomail.com with SMTPS id 1745475727228758.2441586398901;
	Wed, 23 Apr 2025 23:22:07 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 3/3] riscv: dts: starfive: jh7110-pine64-star64: force no USB overcurrent
Date: Thu, 24 Apr 2025 14:21:54 +0800
Message-ID: <20250424062154.655128-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424062017.652969-1-uwu@icenowy.me>
References: <20250424062017.652969-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The Star64 board has no GPIOs to indicate USB overcurrent, however the
USB controller would stop to work if the overcurrent_n signal it gets is
low (which means overcurrent situations happening because of the _n).

Use the pin controller to force the overcurrent_n signal to be high in
order to ensure stable behavior of the USB controller.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
This patch depends on [1] for including the necessary header file.

[1] https://lore.kernel.org/linux-riscv/20250424060605.638678-1-uwu@icenowy.me/T/#u

 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 31e825be2065a..4fb522d127e21 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -91,6 +91,13 @@ GPOEN_ENABLE,
 			input-schmitt-disable;
 			slew-rate = <0>;
 		};
+
+		overcurrent-pins {
+			pinmux = <GPIOMUX(PAD_INTERNAL_HIGH,
+					  GPOUT_LOW,
+					  GPOEN_DISABLE,
+					  GPI_SYS_USB_OVERCURRENT)>;
+		};
 	};
 };
 
-- 
2.49.0


