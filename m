Return-Path: <linux-gpio+bounces-19230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9210A9A198
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4AB45A2FD2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 06:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37361E7C10;
	Thu, 24 Apr 2025 06:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="hBO8klqu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CA91DE3B5;
	Thu, 24 Apr 2025 06:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475657; cv=pass; b=lzNdx4Vd3xN/uqzXcdmWfQ5o8wpV/xcJZUhX9Rky1y0ROqniHQLyDOA+pZ4WjXGxcrmkOPAKvOR/XsZVznKxmEzz2YZ0aLxT3zjnJucmPtbUtcuGdBcYunLoxwniCIkfydmmKg2nHt3c8ri/gVvReAI4WK7Z4e1GYcsue9dEKGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475657; c=relaxed/simple;
	bh=//Yyo8IfmPE6LsmKMvdBpJlfkzrhUWHmpZ4E1fP/vUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P0Ns4cxN4vrFjbv+GLEnxCKT0sNtB0PcumuyGCm3By+u61kL2lgx+HxfrcUsdp1RbY7jqFJyUMLCeoA65rOwI8rOKXE/kPrebNYC1jDpkn5sIiWsyDXFqYUxDucDnPBD8nfJtkmBGEzoW4EeNl3E9+v6vAiUca6zoZ5y1wG2IlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=hBO8klqu; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745475638; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g4ZXJoPrb+24H0QzTpCpAXUjnh4cpDujKSrt+Vs8YSGt0cEwjqvcX8GP9qbW0fpuGqCr/f2tWKNlKyc1cfuhChuqWLmfKST7L8CtAm4LHobvigSLYDVCilhyUDSU0LGwRri/RBgG3gOTb4cpoEChHNksL4avR/pW5mc/DHWDro8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745475638; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yCYzlAh9kSuErrhhEc/Udz9PQzNnvyNC+qUoV6xkhr0=; 
	b=bFee/xfV9I3KZMtiVH+bjfRxCIsF5QbpMbmYLF+n0Xtcnwq5VaWjFdPbawdjkbCd4KDEHszr9B8QIzPIv3ouo1x9xXZvvIPDKw4jyiX7O5eG9HDdd8n0JNKVrlqh9O3oQu5YYSKB7CekLrJQwnrL//bX5ZqBOjhtHJBU4HEYBtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745475638;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yCYzlAh9kSuErrhhEc/Udz9PQzNnvyNC+qUoV6xkhr0=;
	b=hBO8klqu5eB5mxFUDI4u7WQ+8WEAO6x2lYfSG4Z8r9WG5or25HrG32lYBueq9pO4
	3QzRhLBy3SM7RajujKttrCU7Vpa34ivPFT5w1mhQmdcO14ZpAEf1bu1PPIhp5GMNXKC
	HAJ18ab5Ww+5/WRtTj1emC20fnZiJYX1u6oNdhqVe1/8XXvIKbpOOt24pNByi8TD0i0
	0R2dYg+RVDlx26XG48/dVQAD0IBXx0nuvY2Rg4WdKNkwAm+8a2Tm/ie9GpWh+ZnFMKL
	JwNj4Y0bop0lWt7vSWvYghb6/QFDFEMJl8kSg28OZNIls01+1Qutd+6LcvuzDIQDgCV
	/AotWYzZPA==
Received: by mx.zohomail.com with SMTPS id 1745475636355491.3825414260032;
	Wed, 23 Apr 2025 23:20:36 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add PAD_INTERNAL_* virtual pins
Date: Thu, 24 Apr 2025 14:20:15 +0800
Message-ID: <20250424062017.652969-2-uwu@icenowy.me>
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

The JH7110 SoC could support internal GPI signals to be routed to not
external GPIO but internal low/high levels.

Add two macros, PAD_INTERNAL_LOW and PAD_INTERNAL_HIGH, as two virtual
"pads" to represent internal GPI sources with fixed low/high levels.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
index 3865f01396395..3cca874b2bef7 100644
--- a/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
@@ -126,6 +126,10 @@
 #define	PAD_GMAC0_TXEN		18
 #define	PAD_GMAC0_TXC		19
 
+/* virtual pins for forcing GPI */
+#define PAD_INTERNAL_LOW	254
+#define PAD_INTERNAL_HIGH	255
+
 #define GPOUT_LOW		0
 #define GPOUT_HIGH		1
 
-- 
2.49.0


