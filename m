Return-Path: <linux-gpio+bounces-37123-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCJJDnQODGqJVAUAu9opvQ
	(envelope-from <linux-gpio+bounces-37123-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:17:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E2578D12
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DFC83022850
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 07:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F563D47DA;
	Tue, 19 May 2026 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZ0aH4KH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745D13D0924;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175001; cv=none; b=gzPC1a20owOXiFyalEsmulX+aCjIdCKO2kl0/3fPQ+84JFMR7vMeIPjHOqTYmmh1nQOmRpKVsfrAx8jIluzWxrgQciFTGULW07/HS7uSkEz881WIQSUtUjag9iHbPdbggC/4iVtjKjg3Dk4Po9r7fXB1sOTeJtQJgxWSs+zgtws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175001; c=relaxed/simple;
	bh=YNV4oMrK6Qs5jSigZA6uUXDiqIGdLX01+lYl4OrYnKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f59RocolbtfhijzGcs8sT1bjKlBjKWTQ31V41YuLMctX94I4Z6aADext1KQFoJdhYXDyBiWGPpAWA09A/Nzfsz8YmvGX8T6Np0xBLJhVwRWCrj4W4HqMm8BjaGWMC8/l4qbCuWHsBNdWEHpA4cmvTjNxD0KQWJva4+707+tVoAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZ0aH4KH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3CFF3C2BCC9;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779175001;
	bh=YNV4oMrK6Qs5jSigZA6uUXDiqIGdLX01+lYl4OrYnKo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nZ0aH4KHmDgOj0cAW+2vbzm73+0D+ziwYZHeSnI9/MDevk0YXFCBh+JmD+wfOisSJ
	 ryUbdyYYQW4PuY1HMP9CZ3oRwMw/E53OxOsLyTTf/zSCiTAKlsgfSLxLqlwmY0aZ9D
	 lHEMYynnpxMZ0mz0A64DRkD2pQw8Pj5XMJMillWIykcqj88vCEQfV1bTBkxyee51rX
	 rV2Fi0PYkGEMYjj2dQqHE32qkLxHTqEZsVmKtjgcsDyx3m4pyVkRvMspuQV8oMDGAx
	 y19aBnRifgV6PeEgo4a5PW2Tn0hGT4IcjL6sk7F2YYCTqliWzZWr8Ts7AKq4LHqYm+
	 P20+pZ1lQqMNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3567ACD4F5B;
	Tue, 19 May 2026 07:16:41 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 19 May 2026 09:16:37 +0200
Subject: [PATCH v3 7/8] ARM: dts: qcom: pm8921: Add USB ID extcon
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-mainline-send-v1-sending-v3-7-3dd7aa125353@alex-min.fr>
References: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
In-Reply-To: <20260519-mainline-send-v1-sending-v3-0-3dd7aa125353@alex-min.fr>
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
 iommu@lists.linux.dev, phone-devel@vger.kernel.org, 
 Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779174999; l=1141;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=7LFsLsEUiYEeh3bW/vbTHCTwzetxBuEF5Bgg6PKOt0I=;
 b=yCJ9eifEYu/jios1gp2u4NSu25jxUULeTqywdYHiosDCBM7LTZDJkiHGBM79I0YtLqq2beTgt
 v9okRz/c/mkCU3PbN4EyuYOaE8TnKH1tNG4E18/PoZYAxkFXHLcN9sZ
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37123-lists,linux-gpio=lfdr.de,contact.alex-min.fr];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-gpio@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CA7E2578D12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alexandre MINETTE <contact@alex-min.fr>

PM8921 exposes the USB ID signal through the PMIC interrupt controller as
USB_ID_IN. Add an extcon child for this interrupt so USB controllers can
consume it for role detection.

Unlike PM8941, the PM8921 USB ID interrupt path has no known register
resource. The downstream PM8xxx misc device is also instantiated without
one, and the mainline extcon driver only consumes the named USB ID
interrupt. Keep the node non-addressable and describe only the interrupt.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 535cb6a2543f..30366536f580 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -121,6 +121,13 @@ ref_muxoff: adc-channel@f {
 				reg = <0x00 0x0f>;
 			};
 		};
+
+		usb_id: usb-detect {
+			compatible = "qcom,pm8921-misc";
+			interrupt-names = "usb_id";
+			interrupts-extended = <&pm8921 49 IRQ_TYPE_EDGE_BOTH>;
+			status = "disabled";
+		};
 	};
 };
 

-- 
2.43.0



