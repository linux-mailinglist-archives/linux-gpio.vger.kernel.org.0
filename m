Return-Path: <linux-gpio+bounces-29307-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A9CA93D3
	for <lists+linux-gpio@lfdr.de>; Fri, 05 Dec 2025 21:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5628B30F7966
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Dec 2025 20:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6267026CE2C;
	Fri,  5 Dec 2025 20:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="NL+W52IF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E6C25A2A2
	for <linux-gpio@vger.kernel.org>; Fri,  5 Dec 2025 20:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764965825; cv=none; b=cZxLbW/lecbuj3erATtESqeThnW51oUQQDQoDEmYVe1+mQKttuR3S4PDMtH1V58j3HxcoK1+ttTXbI2JaQTFJZDmnFKnWZmEAse4+YHx6Q6qDjpiOidUQ3XHaP+SxLkt7WYcl2Bh3CxCOvKdv53ENXIpuIoF0GKAqLddw6rCNPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764965825; c=relaxed/simple;
	bh=c6lOALAg8Z8lVxKLXwRMLDhzCV9m6rH/N0CHYY1xybg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9EXR36rvrvDgqaU5XZEyxUlZ39da8eSzb/IJVL3bFEsMMMVmRltcyPSkEcfYDe4TVruSwAz7G2WojsW3t5DYnwjrPUC6lBBJ+9m+FJnHDjGeyIf/pmEwK1oEnUxP4eGsAcYDSaGsWIGrT5qALlJ9jO2gU7u+mKtEUbiK7inlf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=tika.stderr.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=NL+W52IF; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tika.stderr.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pn/ekbTIZqC3VuEnsI273ukLxN04lGciAMmt5wrgHOY=; b=NL+W52IFlmNuXro/qvyh6AlREY
	us+g7Y8e5U72qis/gZq0auakjgcasXr3p4AITtRvMHeo0W0dREe1n/potg0I+vJyNHTKY55JfnYZY
	AusMf1u+ruPh1bpj+97ycA9qtCLIcbnyHOySNUOlH3wCbFmHBedM5lEwjS11CeUO//Q0=;
X-Preliminary-Spam-Score: -4.3 (----)
Received: from [45.142.19.84] (helo=zozo)
	by tika.stderr.nl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <matthijs@tika.stderr.nl>)
	id 1vRcEX-00DDbl-1b;
	Fri, 05 Dec 2025 21:16:56 +0100
Received: (nullmailer pid 2868416 invoked by uid 1000);
	Fri, 05 Dec 2025 20:16:53 -0000
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, Matthijs Kooijman <matthijs@stdin.nl>
Subject: [PATCH 2/2] arm64: dts: rockchip: rk3308: Add gpio-ranges properties
Date: Fri,  5 Dec 2025 21:06:53 +0100
Message-ID: <20251205201254.2865179-5-matthijs@stdin.nl>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251205201254.2865179-2-matthijs@stdin.nl>
References: <20251205201254.2865179-2-matthijs@stdin.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the mapping between gpio and pinctrl explicit.

This does not immediately change functionality, because the
gpio-rockchip.c driver has a workaround that defines ranges when they
are not present in DT, but that relies on global gpio numbering (so
AFAICS only works when the rockchip gpio banks are initialized first and
in-order). This prevents the fragility of the workaround for rk3308.

Signed-off-by: Matthijs Kooijman <matthijs@stdin.nl>
---
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 31c25de2d689c..681d2429d541d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -889,6 +889,7 @@ gpio0: gpio@ff220000 {
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru PCLK_GPIO0>;
 			gpio-controller;
+			gpio-ranges = <&pinctrl 0 0 32>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -900,6 +901,7 @@ gpio1: gpio@ff230000 {
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru PCLK_GPIO1>;
 			gpio-controller;
+			gpio-ranges = <&pinctrl 0 32 32>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -911,6 +913,7 @@ gpio2: gpio@ff240000 {
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru PCLK_GPIO2>;
 			gpio-controller;
+			gpio-ranges = <&pinctrl 0 64 32>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -922,6 +925,7 @@ gpio3: gpio@ff250000 {
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru PCLK_GPIO3>;
 			gpio-controller;
+			gpio-ranges = <&pinctrl 0 96 32>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -933,6 +937,7 @@ gpio4: gpio@ff260000 {
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru PCLK_GPIO4>;
 			gpio-controller;
+			gpio-ranges = <&pinctrl 0 128 32>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.48.1


