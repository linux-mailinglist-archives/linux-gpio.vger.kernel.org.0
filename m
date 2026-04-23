Return-Path: <linux-gpio+bounces-35383-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKFRHXyj6WnafwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35383-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:43:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2106944D03C
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 199B63007890
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 04:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1443CC9F6;
	Thu, 23 Apr 2026 04:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Upn6giTC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874B13C6A41;
	Thu, 23 Apr 2026 04:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919417; cv=none; b=feVOUDvibnAl6ecExHBU0ELKQ4M/B4j/KupRLca1KTqB2YM9jJ809mDJt2m72wZxw+g/fsfarC1j8JKCmbh1O0wYwLv0IyICySdgGjZqhtM3aZlcf5hmq+vHJ/ajw+8F4mrILyQz6yQj8DhUJ+MnbbdJe+olzwjynqjpQH+EK/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919417; c=relaxed/simple;
	bh=9YTHEvkeFZ+qth4YK9gjEe2ZN9Wcna7fcSLY4EhtMlY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nFIweVuGSkwPFVNaM8WJI+eqcpPkVMQUzMYcJxgw3X0DGGc2PY2ottvEL/OVllviRk+khbrQkIvvn7B4O/81V+MuiccaO9Dei2V1ox1DY9EgV387Lb/L6nxVraqRlBk1Jvn8tm5zc0F5ieDa7Zc/0OZsiIaFYwdY9QpNqGsxXmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Upn6giTC; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776919405; x=1777178605;
	bh=ZpoZxI1iv6Hm6E5vmoDrPM6e7FDQ9kxew8Rq9lidrKs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Upn6giTCZAD3/96YqFfm1KwHteTlVNrwXQP7kph1hmJcjkS/J3zUg99u0ecq/kM21
	 hEk55DcVXD+OV5hoR3Yi4XLRDvsborzTqqWSXKAP1Zj1TgK+xyE6eAyLIMPsIKdyzZ
	 Fwox7xn2T66RHfHwI/1QEPnBnlsHDZt4lu356HIcJrE8MUI3CpFDkIWH+FsNxIf1z9
	 pQWxlYeHpNaT6s2NMwQOUSbPzHjHrNgw6AmsgOPJGdbpJRFZcbNoexuA8wI6wsgehA
	 s27vQ2RkEZiUPPktyOiJXW5XN9qDL+NPFoM7cBvleQUD2VF42ujohGKOb6EWd43fG/
	 nH6GokLCMQD6Q==
Date: Thu, 23 Apr 2026 04:43:19 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 1/4] dt-bindings: pinctrl: qcom,eliza-tlmm: Split QUP lane mirror alternates
Message-ID: <20260423-fix-eliza-pinctrl-v3-1-68b24893ae63@pm.me>
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 67941d019ba801c353964fadd296df3f09d47d16
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35383-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: 2106944D03C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Several QUP lanes have MIRA/MIRB mirror routings that let the same lane
be muxed out on alternative GPIOs. On Eliza these were all collapsed
under the base function name (e.g. qup1_se6), which prevented boards
from selecting the mirror variants.

Add explicit function names for each mirror lane, matching the pattern
already established by qcom,sm8550-tlmm and related bindings.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 .../bindings/pinctrl/qcom,eliza-tlmm.yaml          | 25 +++++++++++++-----=
----
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml=
 b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
index 282650426487..be7b4680045f 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,eliza-tlmm.yaml
@@ -86,16 +86,21 @@ $defs:
                 qdss_gpio_tracectl, qdss_gpio_tracedata, qlink_big_enable,
                 qlink_big_request, qlink_little_enable,
                 qlink_little_request, qlink_wmss, qspi0, qspi_clk,
-                qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3, qup1_se4,
-                qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
-                qup2_se2, qup2_se3, qup2_se4, qup2_se5, qup2_se6,
-                qup2_se7, resout_gpio, sd_write_protect, sdc1, sdc2,
-                sdc2_fb_clk, tb_trig_sdc1, tb_trig_sdc2, tmess_prng0,
-                tmess_prng1, tmess_prng2, tmess_prng3, tsense_pwm1,
-                tsense_pwm2, tsense_pwm3, tsense_pwm4, uim0_clk,
-                uim0_data, uim0_present, uim0_reset, uim1_clk, uim1_data,
-                uim1_present, uim1_reset, usb0_hs, usb_phy, vfr_0, vfr_1,
-                vsense_trigger_mirnat, wcn_sw_ctrl ]
+                qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se2_l2_mira,
+                qup1_se2_l2_mirb, qup1_se2_l3_mira, qup1_se2_l3_mirb,
+                qup1_se3, qup1_se4, qup1_se5, qup1_se6, qup1_se6_l1_mira,
+                qup1_se6_l1_mirb, qup1_se6_l3_mira, qup1_se6_l3_mirb,
+                qup1_se7, qup1_se7_l0_mira, qup1_se7_l0_mirb,
+                qup1_se7_l1_mira, qup1_se7_l1_mirb, qup2_se0, qup2_se1,
+                qup2_se2, qup2_se3, qup2_se3_l0_mira, qup2_se3_l0_mirb,
+                qup2_se3_l1_mira, qup2_se3_l1_mirb, qup2_se4, qup2_se5,
+                qup2_se6, qup2_se7, resout_gpio, sd_write_protect, sdc1,
+                sdc2, sdc2_fb_clk, tb_trig_sdc1, tb_trig_sdc2,
+                tmess_prng0, tmess_prng1, tmess_prng2, tmess_prng3,
+                tsense_pwm1, tsense_pwm2, tsense_pwm3, tsense_pwm4,
+                uim0_clk, uim0_data, uim0_present, uim0_reset, uim1_clk,
+                uim1_data, uim1_present, uim1_reset, usb0_hs, usb_phy,
+                vfr_0, vfr_1, vsense_trigger_mirnat, wcn_sw_ctrl ]
     required:
       - pins
=20

--=20
2.53.0



