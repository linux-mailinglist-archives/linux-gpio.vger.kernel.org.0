Return-Path: <linux-gpio+bounces-34473-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB0HNuq0y2kpKAYAu9opvQ
	(envelope-from <linux-gpio+bounces-34473-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:50:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6265E36919B
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 13:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 842A430D3A63
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2026 11:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBADD3DE424;
	Tue, 31 Mar 2026 11:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="mdipEE9i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3267286D60;
	Tue, 31 Mar 2026 11:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774957294; cv=none; b=dOXGIYDjEZZO3QTtVfmHRo+AAkGU8kKSQGIHJRYGzEY2YfQj01c/7XEBV5m+Sv1HlKv9EmukglSr/24vl/JKjTzU9gq6xTDiqIFc21n1oDC9d3HtUlYesm0iw2eKCR1GhPJ88+gWmh+7XVhlxk+OwTh0IKmoqb8ottE/utDy1m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774957294; c=relaxed/simple;
	bh=VIg24rCCbEtwwC1LCboJxXzmgDY6tsK45vqmFQr6OJU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N4jTEa28D5Fz4hj3mRMhiuUyzXVkvw3kVh2wAvcrQAFSG6Ibm6ubKI52yGZKwYFCWiSssVDooiTb2JV9f4Kz21OQK0rfCMX3xZfPNREx8Yy9N5FvWjwwxcOjUIaVrvF0YMRtMn9fHFzlF8iTpcER0Atr37YwtwINv2kIflciRCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=mdipEE9i; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62VBcZKj93149082, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774957115; bh=F3Td0wZotLaBngEl3nbtygM4AkeeYKfycbQUwc+pVNg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=mdipEE9ipau4+TnEm7a93c2XOTuWXIFVPMA0RjmWseac5V7/xy19G0tgjxIYdjqiI
	 THlp+9ksq8GUUheKDxIQe7eaW7Fk8wB33Ajg3WuVwDs/QtovjJOgaasdhkD57Sl1ih
	 VKXEX5bWeTrnAGHj/sH3U/POpopW1e+A6d12Qh/EWQQvUbPe40UHbV3nNECkfofTS8
	 zSgFDs70LvgRJocguUmiFE/RYQoAYMQpnzDyNOr/p2w4tviRII4A//uOdpis65yCiE
	 tBBBvylYo1yCMvK8xnQ0n4mHjsw78jJNx22FVKhooL/zOwz4FyOZymXH6xuuiK6ZGv
	 Oml9kaiVTZo6Q==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62VBcZKj93149082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 31 Mar 2026 19:38:35 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 31 Mar 2026 19:38:36 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 31 Mar 2026 19:38:35 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 31 Mar 2026 19:38:35 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <brgl@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afaerber@suse.com>,
        <tychang@realtek.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <james.tai@realtek.com>
Subject: [PATCH 2/3] arm64: dts: realtek: Add GPIO support for RTD1625
Date: Tue, 31 Mar 2026 19:38:34 +0800
Message-ID: <20260331113835.3510341-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331113835.3510341-1-eleanor.lin@realtek.com>
References: <20260331113835.3510341-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34473-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eleanor.lin@realtek.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.1.92.32:email,realtek.com:dkim,realtek.com:email,realtek.com:mid,4e000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.2.59.24:email,0.0.30.120:email,0.0.121.124:email];
	DKIM_TRACE(0.00)[realtek.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6265E36919B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the GPIO node for the Realtek RTD1625 SoC.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 arch/arm64/boot/dts/realtek/kent.dtsi    | 43 ++++++++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi |  8 +++++
 arch/arm64/boot/dts/realtek/rtd1861.dtsi |  8 +++++
 arch/arm64/boot/dts/realtek/rtd1920.dtsi |  8 +++++
 4 files changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index 8d4293cd4c03..746932c26724 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -151,6 +151,39 @@ uart0: serial@7800 {
 				status = "disabled";
 			};
 
+			gpio: gpio@31100 {
+				compatible = "realtek,rtd1625-iso-gpio";
+				reg = <0x31100 0x398>,
+				      <0x31000 0x100>;
+				gpio-controller;
+				gpio-ranges = <&isom_pinctrl 0 0 2>,
+					      <&ve4_pinctrl 2 0 6>,
+					      <&iso_pinctrl 8 0 4>,
+					      <&ve4_pinctrl 12 6 2>,
+					      <&main2_pinctrl 14 0 2>,
+					      <&ve4_pinctrl 16 8 4>,
+					      <&main2_pinctrl 20 2 3>,
+					      <&ve4_pinctrl 23 12 3>,
+					      <&iso_pinctrl 26 4 2>,
+					      <&isom_pinctrl 28 2 2>,
+					      <&ve4_pinctrl 30 15 6>,
+					      <&main2_pinctrl 36 5 6>,
+					      <&ve4_pinctrl 42 21 3>,
+					      <&iso_pinctrl 45 6 6>,
+					      <&ve4_pinctrl 51 24 1>,
+					      <&iso_pinctrl 52 12 1>,
+					      <&ve4_pinctrl 53 25 11>,
+					      <&main2_pinctrl 64 11 28>,
+					      <&ve4_pinctrl 92 36 2>,
+					      <&iso_pinctrl 94 13 19>,
+					      <&iso_pinctrl 128 32 4>,
+					      <&ve4_pinctrl 132 38 13>,
+					      <&iso_pinctrl 145 36 19>,
+					      <&ve4_pinctrl 164 51 2>;
+				#gpio-cells = <2>;
+				status = "disabled";
+			};
+
 			iso_pinctrl: pinctrl@4e000 {
 				compatible = "realtek,rtd1625-iso-pinctrl";
 				reg = <0x4e000 0x1a4>;
@@ -161,6 +194,16 @@ main2_pinctrl: pinctrl@4f200 {
 				reg = <0x4f200 0x50>;
 			};
 
+			iso_m_gpio: gpio@89120 {
+				compatible = "realtek,rtd1625-isom-gpio";
+				reg = <0x89120 0x10>,
+				      <0x89100 0x20>;
+				gpio-controller;
+				gpio-ranges = <&isom_pinctrl 0 0 4>;
+				#gpio-cells = <2>;
+				status = "disabled";
+			};
+
 			isom_pinctrl: pinctrl@146200 {
 				compatible = "realtek,rtd1625-isom-pinctrl";
 				reg = <0x146200 0x34>;
diff --git a/arch/arm64/boot/dts/realtek/rtd1501.dtsi b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
index 65f7ede3df73..ae246a01f126 100644
--- a/arch/arm64/boot/dts/realtek/rtd1501.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
@@ -10,3 +10,11 @@
 &uart0 {
 	status = "okay";
 };
+
+&gpio {
+	status = "okay";
+};
+
+&iso_m_gpio {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1861.dtsi b/arch/arm64/boot/dts/realtek/rtd1861.dtsi
index 44c3de8f1f48..b5f08bdd9f17 100644
--- a/arch/arm64/boot/dts/realtek/rtd1861.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd1861.dtsi
@@ -10,3 +10,11 @@
 &uart0 {
 	status = "okay";
 };
+
+&gpio {
+	status = "okay";
+};
+
+&iso_m_gpio {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1920.dtsi b/arch/arm64/boot/dts/realtek/rtd1920.dtsi
index becf546216e9..94c8a43916a8 100644
--- a/arch/arm64/boot/dts/realtek/rtd1920.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd1920.dtsi
@@ -10,3 +10,11 @@
 &uart0 {
 	status = "okay";
 };
+
+&gpio {
+	status = "okay";
+};
+
+&iso_m_gpio {
+	status = "okay";
+};
-- 
2.34.1


