Return-Path: <linux-gpio+bounces-35273-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yC5OAThZ5mmtvAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35273-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 18:50:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F18430150
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 18:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58AFA34D2203
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 15:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18543D1706;
	Mon, 20 Apr 2026 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="PPA3xX8X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561503A5E82;
	Mon, 20 Apr 2026 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776695290; cv=none; b=p5G2TWGrVilXH6FcZ9zssD8OM3hsSQEnXkg5bZWkkhuLLt6kmmr+VOrNNmFTilkGawd3LOdyBdZVxeU211hILmHlIxIIelxzyI2SMHvWXFFQnaF/63AJhGDeleV6JIhpPU7JPPUyPUdmnCfjohySJcHTKGbO7z/sxNIJQqjrL/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776695290; c=relaxed/simple;
	bh=mhsuqBnDYaNy0r1jBQ7ImxEqI134ijo5W6BiMiwFb0o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=geQS0csqmu8EObpk5K224c6V5imWfHeKUbyqKKj+1PyjzCd7x5PmB0pw0fo379YETEX0XmkBzEnHuoS+ZqLJ6dj/jleHq67o65NcyBigPPQ4nO4Yj12iemqDUB6n+EDmYK2OJItf9wvec2yNXfHlAxcoVd7TKPCo+Wg+3gxmTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=PPA3xX8X; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776695281; x=1776954481;
	bh=t1pQgxgFpCDa+wxeiNLcdVPuUfml1zmjp4HoS0YAPLA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PPA3xX8Xbq3gADe1O1VMbaliOrQkXO8eCFkVkJIu20J8ugh0jFHoEOphW/xbTAOaN
	 pA53Pwm36SFWwGSWuLodjA2GtwNrdv/ecPWd04udJuqSdpjMyOx3+gZ8U0GvoLTt15
	 NkOpC97FMBOS9eKbCICtMd3tCggm8RPjSi7XKmrd+RxSaDqeBt8ngGEjg0zB9yuvzU
	 8el/DBXeLiq0s4rs+lD7NVXf8eYosf632rjgz0IL0ne3G1WlNbwYV4UNAn0yAodMJH
	 6ryZ0xRGlk4R3c0cy0bRjvhmlPMA756Lt7lZBQVPkikvTWsm4DmDPyqD3IteDscH3p
	 No8bTBBTMd95w==
Date: Mon, 20 Apr 2026 14:27:55 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,eliza-tlmm: Update function list
Message-ID: <20260420-fix-eliza-pinctrl-v2-1-b68329fd6701@pm.me>
In-Reply-To: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 33ab825d1686fd732bc5eb1ecb05ef1ac44dc102
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35273-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: A0F18430150
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the function list to include the QUPs whose lanes can have more
than one GPIO option.

This allows devicetrees to override the function for say, SE6 I2C SCL
pin from 54 to 42.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml        | 13 +++++++++=
+---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml=
 b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
index 282650426487..9010226bf1a0 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
@@ -86,9 +86,16 @@ $defs:
                 qdss_gpio_tracectl, qdss_gpio_tracedata, qlink_big_enable,
                 qlink_big_request, qlink_little_enable,
                 qlink_little_request, qlink_wmss, qspi0, qspi_clk,
-                qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4,
-                qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
-                qup2_se2, qup2_se3, qup2_se4, qup2_se5, qup2_se6,
+                qspi_cs, qup1_se0, qup1_se1, qup1_se2_l0, qup1_se2_l1,
+                qup1_se2_l2_mira, qup1_se2_l2_mirb, qup1_se2_l3_mira,
+                qup1_se2_l3_mirb, qup1_se2_l4, qup1_se2_l5, qup1_se2_l6,
+                qup1_se3, qup1_se4, qup1_se5, qup1_se6_l0, qup1_se6_l1_mir=
a,
+                qup1_se6_l1_mirb, qup1_se6_l2, qup1_se6_l3_mira,
+                qup1_se6_l3_mirb, qup1_se7_l0_mira, qup1_se7_l0_mirb,
+                qup1_se7_l1_mira, qup1_se7_l1_mirb, qup1_se7_l2, qup1_se7_=
l3,
+                qup2_se0, qup2_se1, qup2_se2, qup2_se3_l0_mira,
+                qup2_se3_l0_mirb, qup2_se3_l1_mira, qup2_se3_l1_mirb,
+                qup2_se3_l2, qup2_se3_l3, qup2_se4, qup2_se5, qup2_se6,
                 qup2_se7, resout_gpio, sd_write_protect, sdc1, sdc2,
                 sdc2_fb_clk, tb_trig_sdc1, tb_trig_sdc2, tmess_prng0,
                 tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,

--=20
2.53.0



