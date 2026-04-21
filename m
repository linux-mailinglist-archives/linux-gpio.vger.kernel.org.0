Return-Path: <linux-gpio+bounces-35301-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Or/GFhH52mw6AEAu9opvQ
	(envelope-from <linux-gpio+bounces-35301-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:46:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2078043906E
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 11:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01670303B5F7
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 09:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DF53B2FFD;
	Tue, 21 Apr 2026 09:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uliJLphc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1103B0AD4;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764713; cv=none; b=P7GhzBKsvl0ESjSzD4rgRFNnWBlhIAuAgu79S1oirmogLta7QdDlgLEHmXSVTfb92xrZuuV6MmetA0HYK17+CmXK/iXDtW+JbNyd3KqW8W7UXLNhMODQdon7W026Xt+8dP/prlPeWaK0vsrjvy3fwRpTp0YTFjo8ls8AiFZ+JEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764713; c=relaxed/simple;
	bh=Sx6Bi9Kgi4SOUT2qOWXNOGw9mni/B/cMt/ZXaHiuEzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CkykGw4QndqQiI4pWH6tt06uZ35ImtRByDRbJD91QffzwwXk9mdqnTRe/01eRy8DFDc0QkHlUUvkTud90sGIvxsYSXLa+r11DYpdd08MXf0t4F9hIEvHjpis3C/3n/pCvXDpOUjf4JpIjDnGjxi0yCEDAcfXn0gCFkiTOhLiWsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uliJLphc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 664AEC2BD05;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776764713;
	bh=Sx6Bi9Kgi4SOUT2qOWXNOGw9mni/B/cMt/ZXaHiuEzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uliJLphcVEb89TOuv+D0JiNyLS9ooBHgsxsHV+NR/d8MwGOxmAvbpcbHcqw/UmCLq
	 HW7L7EdcyCwr7M2RW5Y13duBVw174BFzRXG2nGqx+guOgLrR8dNR9RZkzSZTAWfVzf
	 k2rMUfoX9X70Rw0rHKGmBRxY1l7gwPpwyiDn6DjGtuCp0o4TIsadYBdkrdjdQTFp3c
	 KLVe4TmKYy0o/BBb3lMOYUOUmZws3Nhra0PqTTR/EzZsRq2ZDkRDA7bBTqfw8ps4tF
	 7+PeGzhtS0T2UglZKuzENNqDtH55qjJPnyxbjOBADY2KnBlOCZ4JDtV4xbkm82ixCC
	 c2QIJfJGcSRZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E0EBF327CF;
	Tue, 21 Apr 2026 09:45:13 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 21 Apr 2026 11:45:12 +0200
Subject: [PATCH 6/8] ARM: dts: qcom: apq8064: Fix USB controller clocks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-mainline-send-v1-sending-v1-6-bcb0857724de@alex-min.fr>
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 iommu@lists.linux.dev, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776764711; l=2686;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=wgP1bM5ymk1Eupjr35R5wqoVSiJ4e1/FdAtsOMwTJzs=;
 b=ZmpwY5UglQfONgYbKMko+TziUXQrI6gxQnYKfRSXPCJXUrredP/tNGXTiviCiJewggp7kBQ92
 ss4FJeRYpOYBJLVScrq1+2nvUMG9uIIez8Hx7aCmYrCyKEbi5x73SVt
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35301-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.191.49.80:email,0.191.10.64:email,0.190.188.32:email];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,alex-min.fr:email,alex-min.fr:replyto,alex-min.fr:mid]
X-Rspamd-Queue-Id: 2078043906E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexandre MINETTE <contact@alex-min.fr>

The APQ8064 HS USB controller nodes describe the transceiver clock as
"core", but the ChipIdea MSM glue expects "core" to be the controller
fabric clock and "fs" to be the transceiver clock.

This mismatch can leave the fabric clock disabled while the controller is
accessed. Some boards may tolerate that if the clock is already enabled
elsewhere, but it is not a correct description of the hardware.

Describe the RPM Daytona fabric clock as "core", the AHB clock as
"iface", and the transceiver clock as "fs" for all APQ8064 HS USB
controllers. Without this, USB does not probe reliably on Samsung Galaxy
S4 because the fabric clock remains disabled.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 09062b2ad8ba..62ea38b7a652 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -813,8 +813,10 @@ usb1: usb@12500000 {
 			reg = <0x12500000 0x200>,
 			      <0x12500200 0x200>;
 			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
-			clock-names = "core", "iface";
+			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+				 <&gcc USB_HS1_H_CLK>,
+				 <&gcc USB_HS1_XCVR_CLK>;
+			clock-names = "core", "iface", "fs";
 			assigned-clocks = <&gcc USB_HS1_XCVR_CLK>;
 			assigned-clock-rates = <60000000>;
 			resets = <&gcc USB_HS1_RESET>;
@@ -844,8 +846,10 @@ usb3: usb@12520000 {
 			reg = <0x12520000 0x200>,
 			      <0x12520200 0x200>;
 			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc USB_HS3_XCVR_CLK>, <&gcc USB_HS3_H_CLK>;
-			clock-names = "core", "iface";
+			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+				 <&gcc USB_HS3_H_CLK>,
+				 <&gcc USB_HS3_XCVR_CLK>;
+			clock-names = "core", "iface", "fs";
 			assigned-clocks = <&gcc USB_HS3_XCVR_CLK>;
 			assigned-clock-rates = <60000000>;
 			resets = <&gcc USB_HS3_RESET>;
@@ -875,8 +879,10 @@ usb4: usb@12530000 {
 			reg = <0x12530000 0x200>,
 			      <0x12530200 0x200>;
 			interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc USB_HS4_XCVR_CLK>, <&gcc USB_HS4_H_CLK>;
-			clock-names = "core", "iface";
+			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+				 <&gcc USB_HS4_H_CLK>,
+				 <&gcc USB_HS4_XCVR_CLK>;
+			clock-names = "core", "iface", "fs";
 			assigned-clocks = <&gcc USB_HS4_XCVR_CLK>;
 			assigned-clock-rates = <60000000>;
 			resets = <&gcc USB_HS4_RESET>;

-- 
2.43.0



