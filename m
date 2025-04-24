Return-Path: <linux-gpio+bounces-19231-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F9A9A195
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 08:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7454E461F1E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Apr 2025 06:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 104BA1EE7B6;
	Thu, 24 Apr 2025 06:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="QXmvSEi3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8E1EB5D4;
	Thu, 24 Apr 2025 06:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475661; cv=pass; b=flNMUw8sT6TuZMbqvkaR1gfio7DUUiwnUoyeDxvjpQH12Qjynlv5DXhhOnza97KqR2aiR0PkbNlngTl6lY9lF4OyaRboG3In/U2GUvOzRJJibQ1xiXEEMl2z4vXUdugpDzQKc8NO5sng5abC/ILEgItf07ZGiSJYoWIwmAKmJ58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475661; c=relaxed/simple;
	bh=vN7xR5GWyDc/8bfvleAm7zAUmZRyy+KJnQ6jPDHmxaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZMky2CtVAqPVI/raKIdUkHONEmdZRyv1GSFVjeU2wKCyMmW88606slRxfUCZCcPe59QhMZk/jBzxsDXVt3mL+0nDw/AhjwPiMjMXHxFkNyzeaKPV5rpC4HrxtjR8sfzhbBCKdf6c6liiySCQiwcJjdNWkC8jY/mx4qzQgmB/mnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=QXmvSEi3; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745475644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oGwvTcG9MIW+fBY4Cgq7o37G3QIjlBY+wGR7kJDQftPVNQcdg2P23TeQq4my8AwwD7Pp+6IUvyFlsGZ9pZndu8XUMngi/9Cyvo7x1SfKLrHRAAqroZSDyzKmf1VmpYEye0JUZjxtfgqGyEYV6UPOjlnHLi7+uep3QwmXuFz94g4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745475644; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4b8Iw4s/SYPaEv7/xDENn5gEin7xJfAzu3E1qui9INM=; 
	b=F2rI7QNb7MtuLGaWXErPv6Z5Pp1bRF0J6NavZcagjKlEY821XfpSUW5jxRFuDDlZkrF04OcetpccVuUpgOgsJCEmFwj903eKya3UuS4At9JtyL21bUduc2weFwWq+GZDWQHtipy6JKw+8UZ7ZrJD/7LZ+utE5UZDwxm0bBPbPU0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745475644;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4b8Iw4s/SYPaEv7/xDENn5gEin7xJfAzu3E1qui9INM=;
	b=QXmvSEi3S9d3purgYeNXHYF1ciARDcIhdB6aBBukpYQBzeWNeSoFMy99Sv7vB8di
	0JsIunfO7rTQ3LIMZK+BOKqIImPMSsJl8Beud/8J9rtrn2MDQl9pUiTIKdj0na+Wg/P
	IsPcbOsZo6sJm1Gn3JjKdlmdLDJ/7dSUcTV0+WzQ1wVH5TKsgcVXBs7yzkusUXECCKs
	uuZLvoysybsB0exVCpdcgZJB2MD1dgaNPnEmQkbjkli3VDtLllRtd7DW3+dvT6TGAoR
	x2Xztbl+IFhY3kZYpPWCGIM0TSI82f/u099p45nKsTUg8Ez6jgGUjmo8BLbNXSQFfgq
	d+MWSiqDXQ==
Received: by mx.zohomail.com with SMTPS id 1745475641388238.64234871132396;
	Wed, 23 Apr 2025 23:20:41 -0700 (PDT)
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
Subject: [PATCH v2 2/3] pinctrl: starfive: jh7110: add support for PAD_INTERNAL_* for GPI
Date: Thu, 24 Apr 2025 14:20:16 +0800
Message-ID: <20250424062017.652969-3-uwu@icenowy.me>
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

The JH7110 SoC's both pin controller support routing GPI signals to
internal fixed low/high level.

As we allocated two special "pin" numbers for these situations
(PAD_INTERNAL_{LOW,HIGH}), add special handling code for these "pins".
The DOEn/DOUT/FUNCTION fields are ignored and the internal input signal
specified by the DIN field is routed to fixed low/high level.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../starfive/pinctrl-starfive-jh7110.c        | 41 +++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 1d0d6c224c104..fb18c7974ec86 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -291,6 +291,24 @@ void jh7110_set_gpiomux(struct jh7110_pinctrl *sfp, unsigned int pin,
 }
 EXPORT_SYMBOL_GPL(jh7110_set_gpiomux);
 
+static void jh7110_set_gpi(struct jh7110_pinctrl *sfp, u32 gpi, u32 val)
+{
+	u32 offset, shift;
+	u32 reg_val;
+	const struct jh7110_pinctrl_soc_info *info = sfp->info;
+
+	offset = 4 * (gpi / 4);
+	shift  = 8 * (gpi % 4);
+
+	reg_val = readl_relaxed(sfp->base +
+				info->gpi_reg_base + offset);
+	reg_val &= info->gpi_mask << shift;
+	reg_val |= (val & info->gpi_mask) << shift;
+
+	writel_relaxed(reg_val, sfp->base +
+				info->gpi_reg_base + offset);
+}
+
 static int jh7110_set_mux(struct pinctrl_dev *pctldev,
 			  unsigned int fsel, unsigned int gsel)
 {
@@ -307,14 +325,23 @@ static int jh7110_set_mux(struct pinctrl_dev *pctldev,
 	pinmux = group->data;
 	for (i = 0; i < group->grp.npins; i++) {
 		u32 v = pinmux[i];
+		u32 pin = jh7110_pinmux_pin(v);
 
-		if (info->jh7110_set_one_pin_mux)
-			info->jh7110_set_one_pin_mux(sfp,
-					jh7110_pinmux_pin(v),
-					jh7110_pinmux_din(v),
-					jh7110_pinmux_dout(v),
-					jh7110_pinmux_doen(v),
-					jh7110_pinmux_function(v));
+		switch (pin) {
+		case PAD_INTERNAL_LOW:
+		case PAD_INTERNAL_HIGH:
+			jh7110_set_gpi(sfp, jh7110_pinmux_din(v),
+				       pin == PAD_INTERNAL_HIGH);
+			break;
+		default:
+			if (info->jh7110_set_one_pin_mux)
+				info->jh7110_set_one_pin_mux(sfp,
+						jh7110_pinmux_pin(v),
+						jh7110_pinmux_din(v),
+						jh7110_pinmux_dout(v),
+						jh7110_pinmux_doen(v),
+						jh7110_pinmux_function(v));
+		}
 	}
 
 	return 0;
-- 
2.49.0


