Return-Path: <linux-gpio+bounces-32397-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JZg+BXbxpWn6IAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32397-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 21:22:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5B21DF3F7
	for <lists+linux-gpio@lfdr.de>; Mon, 02 Mar 2026 21:22:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63FC1305A6F9
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2026 20:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621A437BE75;
	Mon,  2 Mar 2026 20:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b="wOnXC1G/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from tika.stderr.nl (tika.stderr.nl [94.142.244.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F592FE044;
	Mon,  2 Mar 2026 20:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.142.244.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772482929; cv=none; b=Cbb6G4v1wuzxi7erxeg+3mBHEd0AQDE2C3zXdIuyx3w0aUJaNdwVacL55NZqD20fH1TQDEgOQKy4sCUvBZ6RuRzaWEcu9Y/nyLUPNz0wAbwR4AbkzPc9XBf6WzCagwOykFdNLmbEdFyEsd4CdRAy3YJHFjodXHnFaz3D61rEUos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772482929; c=relaxed/simple;
	bh=/P+MkVP/ZEooxSE585O6UmyCThqJpWuKVQH3Tp3byk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rrr1Qm7Fzw6z7NBohz/amaBDHZvJg3vyPIi6bC2zkFsTm+G+l0imJP74uA4BOIk286B2S297VboFP19RK11B0hO0w2uVwRN1RpCwh9iUiUl5sLX56Sm1T4Wcy0Jpno59ebvwA3zvbTg0ayqkaqP2bqMjh99q6W0QCz0Mw1UZRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl; spf=none smtp.mailfrom=tika.stderr.nl; dkim=pass (1024-bit key) header.d=mail.tikatika.nl header.i=@mail.tikatika.nl header.b=wOnXC1G/; arc=none smtp.client-ip=94.142.244.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stdin.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tika.stderr.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.tikatika.nl; s=201709.tika; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NaQco9z9Nma2E2mabZxblSYYNbReqO+JGj82aIQuKH0=; b=wOnXC1G/Vt7gdctTcUfcM3RVK8
	OoBRunMK2CcwRG2miNLn2nPYzMiTzDmGBzi8i0MdlosJXUttAMIVY7c6MSzMvzXoXKkcLjdly/8or
	Cg6COCiehVfyyXsMwEyTPyFJPJBEwIbrPgE0iHY9cHbfmcmCltXjAoMCuBtxGAxkYxLQ=;
X-Preliminary-Spam-Score: -4.2 (----)
Received: from [45.142.19.84] (helo=zozo)
	by tika.stderr.nl with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <matthijs@tika.stderr.nl>)
	id 1vx9m9-00HGhC-1D;
	Mon, 02 Mar 2026 21:22:00 +0100
Received: (nullmailer pid 198612 invoked by uid 1000);
	Mon, 02 Mar 2026 20:21:57 -0000
From: Matthijs Kooijman <matthijs@stdin.nl>
To: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: matthijs@stdin.nl, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH RESEND 1/2] arm64: dts: rockchip: rk3308: Add gpio-ranges properties
Date: Mon,  2 Mar 2026 21:17:14 +0100
Message-ID: <20260302202121.197288-3-matthijs@stdin.nl>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260302202121.197288-1-matthijs@stdin.nl>
References: <20260302202121.197288-1-matthijs@stdin.nl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6A5B21DF3F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[mail.tikatika.nl:s=201709.tika];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[stdin.nl];
	TAGGED_FROM(0.00)[bounces-32397-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[matthijs@stdin.nl,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.978];
	DKIM_TRACE(0.00)[mail.tikatika.nl:-];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ff230000:email,ff220000:email,ff260000:email]
X-Rspamd-Action: no action

This makes the mapping between gpio and pinctrl explicit.

This does not immediately change functionality, because the
gpio-rockchip.c driver has a workaround that defines ranges when they
are not present in DT, but that relies on global gpio numbering (so
AFAICS only works when the rockchip gpio banks are initialized first and
in-order).

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


