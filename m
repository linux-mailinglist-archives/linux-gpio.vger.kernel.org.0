Return-Path: <linux-gpio+bounces-19138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F76DA97290
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 18:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C50216D929
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Apr 2025 16:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473FE292904;
	Tue, 22 Apr 2025 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Pv+e9eH3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB822918FF;
	Tue, 22 Apr 2025 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745339027; cv=pass; b=jgpEyKpeOedol//jWfOT642Ux+QCbFqyDTDDvc1W0e07FrGILsSEnn/rcOeK1t8DfyAdDvIfJ2eayPZNPHddDAi1VWFqHm9Apfjmuc88JCEcIZtMVMLOWBmd8LXu9h2nzGuFdGWQtiHqCe2eT5P99asqLYnViBUBYhbPWCUkjKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745339027; c=relaxed/simple;
	bh=vJLo1SAXOEL8jJq2shI0SXXGScBhN8GY9w5yBhm7w5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bDZTxRzN8pYtZOMCyGo9HlvMq0FidZsVCJjayWeimPLEG28gFIF4QH5YQHOyxdrZL63UzOA22JAncyeRQ+qHuncN2RJMZ6Fo5vwmHdU4AmfJnBsoSz9FkIAyeswO8CkcHy5pqBshhXNwdR5syaI/zzDZ+GYfKB9f6UROCqyXszk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=Pv+e9eH3; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1745339009; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TYyfRxCdzIpIgWKgNSE+gRu2Yx+DLe3sMn33GgGr7AvTLi39f/YcFH9wMs7flSeImNqsRg+QAqT/2Cy0H6ZK9zlmhRkTy45r2XSmaWaYLC8oR32FW2u2MaylctzMY6DgG0yMoFUjjaLRRe5dilad2nVIcTQz3btTgTcXhdF37IA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745339009; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rEwnOtEV8d3LGVq1BDTwLd40sKEfTcqEpmUBhVrools=; 
	b=NtIpdsDq+AjI12Pb+9xq/hCRbdYvsHXfKfLpM6qGjM+y9y7T+kKkjjPZcqjmx27vz7bElJU3KA/0grQW9lAvT4DH7/7Q+YDSsxPvtX7dpvr59y0aBxTGljjQqSxCzXc85JBIbUR1Gi6kxGI00S8f34UICQso4OvCGcRORLlxLhk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745339009;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rEwnOtEV8d3LGVq1BDTwLd40sKEfTcqEpmUBhVrools=;
	b=Pv+e9eH3EKh6j7+yRLxi5l7fqBCBEL7K738huaCFwLg6uf7TaeahOeurbxGaKpT8
	iaK6RoJbFplwI8A0hkGIxNGZ1eberti/pPZjTQo+816vwTKyptrOcIn0bCpJSQkj+vm
	0dcjkXDRzFgPJbuKKP/5uwmM/D6FSmKdnYi8eXLXxH46dcbcKgwz8jhZUmsa4RE1U1o
	uxjahZGw03JQhM14uE6FVkkB8Drh8eprvhh5cauxrxewWctmG66ro1GqS/r/4eujvT+
	ZxFWiEiRp/SgJl5u3Z/P/Mk5YLG1gLbcCVG3DD9RuFVxDCwhTB2ECAT0z12X0H1SY6y
	iGK4zVfquQ==
Received: by mx.zohomail.com with SMTPS id 1745339006390925.2438196310163;
	Tue, 22 Apr 2025 09:23:26 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] riscv: dts: starfive: jh7110-pine64-star64: force no USB overcurrent
Date: Wed, 23 Apr 2025 00:22:50 +0800
Message-ID: <20250422162250.436169-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162250.436169-1-uwu@icenowy.me>
References: <20250422162250.436169-1-uwu@icenowy.me>
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
 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index 31e825be2065a..dab0e0054e648 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -81,6 +81,8 @@ &spi0 {
 };
 
 &sysgpio {
+	starfive,force-high-inputs = <GPI_SYS_USB_OVERCURRENT>;
+
 	usb0_pins: usb0-0 {
 		vbus-pins {
 			pinmux = <GPIOMUX(25,  GPOUT_SYS_USB_DRIVE_VBUS,
-- 
2.49.0


