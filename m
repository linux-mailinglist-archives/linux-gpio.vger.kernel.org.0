Return-Path: <linux-gpio+bounces-35385-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HRaKYSj6WnafwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35385-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:43:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3406944D049
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:43:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 96FC430059BF
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 04:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763A03C6A41;
	Thu, 23 Apr 2026 04:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="qOE5wfgo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEC43CA4A3;
	Thu, 23 Apr 2026 04:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919426; cv=none; b=VmK6baP8msfzVr+EAqe/7To0sZrgIkrTX6+v2es2BvqzO0n7uw2P8bLdD/K1IXJVPJitnlv3sFJM8u2V59wE9zWkAVEdrm/mUtH3t8zDSo+YKc/YnJx9Qi7vJbDVuxE4T4isIScbKE9p3WWfzUC51ke67+sobw2G+6pbVy8UD/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919426; c=relaxed/simple;
	bh=EYuIBjNnilK0gp+COq4EHzzvltEapk1OHFuqKc9EuOs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DSuNQCcHI877K/eQkWkgwDY4vZgVh6/ZYn9+okf2IvTOkwxbHCO8tER231qAVrCveh5aMWsXCU9B2FJc4tAqhs5jvlleXWGhRtfifx6VD6S4mA9A2oH2XrtLc3AASz0yLNLQYQCTs9pJ+vALQuWal0CPOKEZudAjNcLFh6iTXBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=qOE5wfgo; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776919421; x=1777178621;
	bh=EYuIBjNnilK0gp+COq4EHzzvltEapk1OHFuqKc9EuOs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qOE5wfgoZ6XkYiKUSLX1CSqbZCnXclaOfq8EXxgfrnEHPmtyLcYNhgFcrLx9eB2jq
	 rbtacEaKCxgx9EffwDzey/Row9PGEVDZl8AecfGAexO17gnpU9dljgL2yi4Zxmh43n
	 Ft1hnrIY6QKvIBNlQDNY2/s92AuiVPXSg9e+Z7UpcP5uFxOQ3sG/vlsYckczu55Jyi
	 6BH3NliK2h4klr+pKRMi3MZ6nhKl6zuCWemMUDCXaLqL7hR64MkdgvQBcOkF0is4Qn
	 6CHBqiWpXn0VnwFJZHamXHQ+2rwhWDxfDo56wy0o0eQwtXEjA62FCzTPlJP6W9HOqO
	 w5wE1aIOC/H5g==
Date: Thu, 23 Apr 2026 04:43:37 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 3/4] pinctrl: qcom: eliza: Split QUP lane mirror alternates
Message-ID: <20260423-fix-eliza-pinctrl-v3-3-68b24893ae63@pm.me>
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: ad38e37a1334c1dcecef455f2e4a7a67e19827f7
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35385-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: 3406944D049
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Several QUP lanes have MIRA/MIRB mirror routings which are collapsed
under a single function name (e.g. qup1_se6).

This is an issue because it means there are multiple functions defined
for a given pin that share the same name:

[42] =3D PINGROUP(42, qup1_se6, qup1_se2, qup1_se6...

So when you select pin 42 and request function qup1_se6, it will select
the first instance of it in this group, which just happens to be
QUP1_SE6_L2, making the second instance (QUP1_SE6_L1_MIRA) effectively
unreachable.

Split each of these lanes that has an alternative GPIO into their own
function so they can actually be selected, following the pattern seen
in pinctrl-sm8550.c.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 132 ++++++++++++++++++++++++++++++-=
----
 1 file changed, 114 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pi=
nctrl-eliza.c
index c1f756cbcdeb..8f74756771b8 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -563,15 +563,31 @@ enum eliza_functions {
 =09msm_mux_qup1_se0,
 =09msm_mux_qup1_se1,
 =09msm_mux_qup1_se2,
+=09msm_mux_qup1_se2_l2_mira,
+=09msm_mux_qup1_se2_l2_mirb,
+=09msm_mux_qup1_se2_l3_mira,
+=09msm_mux_qup1_se2_l3_mirb,
 =09msm_mux_qup1_se3,
 =09msm_mux_qup1_se4,
 =09msm_mux_qup1_se5,
 =09msm_mux_qup1_se6,
+=09msm_mux_qup1_se6_l1_mira,
+=09msm_mux_qup1_se6_l1_mirb,
+=09msm_mux_qup1_se6_l3_mira,
+=09msm_mux_qup1_se6_l3_mirb,
 =09msm_mux_qup1_se7,
+=09msm_mux_qup1_se7_l0_mira,
+=09msm_mux_qup1_se7_l0_mirb,
+=09msm_mux_qup1_se7_l1_mira,
+=09msm_mux_qup1_se7_l1_mirb,
 =09msm_mux_qup2_se0,
 =09msm_mux_qup2_se1,
 =09msm_mux_qup2_se2,
 =09msm_mux_qup2_se3,
+=09msm_mux_qup2_se3_l0_mira,
+=09msm_mux_qup2_se3_l0_mirb,
+=09msm_mux_qup2_se3_l1_mira,
+=09msm_mux_qup2_se3_l1_mirb,
 =09msm_mux_qup2_se4,
 =09msm_mux_qup2_se5,
 =09msm_mux_qup2_se6,
@@ -978,7 +994,23 @@ static const char *const qup1_se1_groups[] =3D {
 };
=20
 static const char *const qup1_se2_groups[] =3D {
-=09"gpio52", "gpio53", "gpio54", "gpio52", "gpio55", "gpio53", "gpio40", "=
gpio42", "gpio30",
+=09"gpio52", "gpio53", "gpio40", "gpio42", "gpio30",
+};
+
+static const char *const qup1_se2_l2_mira_groups[] =3D {
+=09"gpio54",
+};
+
+static const char *const qup1_se2_l2_mirb_groups[] =3D {
+=09"gpio52",
+};
+
+static const char *const qup1_se2_l3_mira_groups[] =3D {
+=09"gpio55",
+};
+
+static const char *const qup1_se2_l3_mirb_groups[] =3D {
+=09"gpio53",
 };
=20
 static const char *const qup1_se3_groups[] =3D {
@@ -994,11 +1026,43 @@ static const char *const qup1_se5_groups[] =3D {
 };
=20
 static const char *const qup1_se6_groups[] =3D {
-=09"gpio40", "gpio42", "gpio54", "gpio42", "gpio40", "gpio55",
+=09"gpio40", "gpio42",
+};
+
+static const char *const qup1_se6_l1_mira_groups[] =3D {
+=09"gpio42",
+};
+
+static const char *const qup1_se6_l1_mirb_groups[] =3D {
+=09"gpio54",
+};
+
+static const char *const qup1_se6_l3_mira_groups[] =3D {
+=09"gpio40",
+};
+
+static const char *const qup1_se6_l3_mirb_groups[] =3D {
+=09"gpio55",
 };
=20
 static const char *const qup1_se7_groups[] =3D {
-=09"gpio81", "gpio78", "gpio80", "gpio114", "gpio114", "gpio78",
+=09"gpio78", "gpio114",
+};
+
+static const char *const qup1_se7_l0_mira_groups[] =3D {
+=09"gpio81",
+};
+
+static const char *const qup1_se7_l0_mirb_groups[] =3D {
+=09"gpio78",
+};
+
+static const char *const qup1_se7_l1_mira_groups[] =3D {
+=09"gpio80",
+};
+
+static const char *const qup1_se7_l1_mirb_groups[] =3D {
+=09"gpio114",
 };
=20
 static const char *const qup2_se0_groups[] =3D {
@@ -1014,7 +1078,23 @@ static const char *const qup2_se2_groups[] =3D {
 };
=20
 static const char *const qup2_se3_groups[] =3D {
-=09"gpio79", "gpio116", "gpio97", "gpio100", "gpio100", "gpio116",
+=09"gpio100", "gpio116",
+};
+
+static const char *const qup2_se3_l0_mira_groups[] =3D {
+=09"gpio79",
+};
+
+static const char *const qup2_se3_l0_mirb_groups[] =3D {
+=09"gpio116",
+};
+
+static const char *const qup2_se3_l1_mira_groups[] =3D {
+=09"gpio97",
+};
+
+static const char *const qup2_se3_l1_mirb_groups[] =3D {
+=09"gpio100",
 };
=20
 static const char *const qup2_se4_groups[] =3D {
@@ -1236,15 +1316,31 @@ static const struct pinfunction eliza_functions[] =
=3D {
 =09MSM_PIN_FUNCTION(qup1_se0),
 =09MSM_PIN_FUNCTION(qup1_se1),
 =09MSM_PIN_FUNCTION(qup1_se2),
+=09MSM_PIN_FUNCTION(qup1_se2_l2_mira),
+=09MSM_PIN_FUNCTION(qup1_se2_l2_mirb),
+=09MSM_PIN_FUNCTION(qup1_se2_l3_mira),
+=09MSM_PIN_FUNCTION(qup1_se2_l3_mirb),
 =09MSM_PIN_FUNCTION(qup1_se3),
 =09MSM_PIN_FUNCTION(qup1_se4),
 =09MSM_PIN_FUNCTION(qup1_se5),
 =09MSM_PIN_FUNCTION(qup1_se6),
+=09MSM_PIN_FUNCTION(qup1_se6_l1_mira),
+=09MSM_PIN_FUNCTION(qup1_se6_l1_mirb),
+=09MSM_PIN_FUNCTION(qup1_se6_l3_mira),
+=09MSM_PIN_FUNCTION(qup1_se6_l3_mirb),
 =09MSM_PIN_FUNCTION(qup1_se7),
+=09MSM_PIN_FUNCTION(qup1_se7_l0_mira),
+=09MSM_PIN_FUNCTION(qup1_se7_l0_mirb),
+=09MSM_PIN_FUNCTION(qup1_se7_l1_mira),
+=09MSM_PIN_FUNCTION(qup1_se7_l1_mirb),
 =09MSM_PIN_FUNCTION(qup2_se0),
 =09MSM_PIN_FUNCTION(qup2_se1),
 =09MSM_PIN_FUNCTION(qup2_se2),
 =09MSM_PIN_FUNCTION(qup2_se3),
+=09MSM_PIN_FUNCTION(qup2_se3_l0_mira),
+=09MSM_PIN_FUNCTION(qup2_se3_l0_mirb),
+=09MSM_PIN_FUNCTION(qup2_se3_l1_mira),
+=09MSM_PIN_FUNCTION(qup2_se3_l1_mirb),
 =09MSM_PIN_FUNCTION(qup2_se4),
 =09MSM_PIN_FUNCTION(qup2_se5),
 =09MSM_PIN_FUNCTION(qup2_se6),
@@ -1326,9 +1422,9 @@ static const struct msm_pingroup eliza_groups[] =3D {
 =09[37] =3D PINGROUP(37, qup1_se4, qup1_se4, ibi_i3c, _, _, _, _, _, _, _,=
 _),
 =09[38] =3D PINGROUP(38, _, _, _, _, _, _, _, _, _, _, _),
 =09[39] =3D PINGROUP(39, _, _, _, _, _, _, _, _, _, _, _),
-=09[40] =3D PINGROUP(40, qup1_se6, qup1_se2, qup1_se6, _, qdss_gpio_traced=
ata, gnss_adc1, ddr_pxi1, _, _, _, _),
+=09[40] =3D PINGROUP(40, qup1_se6, qup1_se2, qup1_se6_l3_mira, _, qdss_gpi=
o_tracedata, gnss_adc1, ddr_pxi1, _, _, _, _),
 =09[41] =3D PINGROUP(41, _, _, _, _, _, _, _, _, _, _, _),
-=09[42] =3D PINGROUP(42, qup1_se6, qup1_se2, qup1_se6, qdss_gpio_tracedata=
, gnss_adc0, ddr_pxi1, _, _, _, _, _),
+=09[42] =3D PINGROUP(42, qup1_se6, qup1_se2, qup1_se6_l1_mira, qdss_gpio_t=
racedata, gnss_adc0, ddr_pxi1, _, _, _, _, _),
 =09[43] =3D PINGROUP(43, _, _, _, _, _, _, _, _, _, _, _),
 =09[44] =3D PINGROUP(44, qup1_se3, _, _, _, _, _, _, _, _, _, _),
 =09[45] =3D PINGROUP(45, qup1_se3, _, _, _, _, _, _, _, _, _, _),
@@ -1338,10 +1434,10 @@ static const struct msm_pingroup eliza_groups[] =3D=
 {
 =09[49] =3D PINGROUP(49, _, _, _, _, _, _, _, _, _, _, _),
 =09[50] =3D PINGROUP(50, sdc2_fb_clk, _, _, _, _, _, _, _, _, _, _),
 =09[51] =3D PINGROUP(51, _, _, _, _, _, _, _, _, _, _, _),
-=09[52] =3D PINGROUP(52, qup1_se2, pcie1_clk_req_n, qup1_se2, ddr_bist_com=
plete, qdss_gpio_tracedata, _, vsense_trigger_mirnat, _, _, _, _),
-=09[53] =3D PINGROUP(53, qup1_se2, qup1_se2, gcc_gp1, ddr_bist_stop, _, qd=
ss_gpio_tracedata, _, _, _, _, _),
-=09[54] =3D PINGROUP(54, qup1_se2, qup1_se6, qdss_gpio_tracedata, gnss_adc=
1, atest_usb, ddr_pxi0, _, _, _, _, _),
-=09[55] =3D PINGROUP(55, qup1_se2, dp0_hot, qup1_se6, _, gnss_adc0, atest_=
usb, ddr_pxi0, _, _, _, _),
+=09[52] =3D PINGROUP(52, qup1_se2, pcie1_clk_req_n, qup1_se2_l2_mirb, ddr_=
bist_complete, qdss_gpio_tracedata, _, vsense_trigger_mirnat, _, _, _, _),
+=09[53] =3D PINGROUP(53, qup1_se2, qup1_se2_l3_mirb, gcc_gp1, ddr_bist_sto=
p, _, qdss_gpio_tracedata, _, _, _, _, _),
+=09[54] =3D PINGROUP(54, qup1_se2_l2_mira, qup1_se6_l1_mirb, qdss_gpio_tra=
cedata, gnss_adc1, atest_usb, ddr_pxi0, _, _, _, _, _),
+=09[55] =3D PINGROUP(55, qup1_se2_l3_mira, dp0_hot, qup1_se6_l3_mirb, _, g=
nss_adc0, atest_usb, ddr_pxi0, _, _, _, _),
 =09[56] =3D PINGROUP(56, usb0_hs, tsense_pwm1, tsense_pwm2, tsense_pwm3, t=
sense_pwm4, _, _, _, _, _, _),
 =09[57] =3D PINGROUP(57, sd_write_protect, _, _, _, _, _, _, _, _, _, _),
 =09[58] =3D PINGROUP(58, _, _, _, _, _, _, _, _, _, _, _),
@@ -1364,10 +1460,10 @@ static const struct msm_pingroup eliza_groups[] =3D=
 {
 =09[75] =3D PINGROUP(75, cci_i2c_scl, _, phase_flag, _, _, _, _, _, _, _, =
_),
 =09[76] =3D PINGROUP(76, cci_i2c_sda, cci_timer, prng_rosc2, _, phase_flag=
, _, _, _, _, _, _),
 =09[77] =3D PINGROUP(77, cci_i2c_scl, jitter_bist, _, _, _, _, _, _, _, _,=
 _),
-=09[78] =3D PINGROUP(78, qup1_se7, qup1_se7, _, phase_flag, _, _, _, _, _,=
 _, _),
-=09[79] =3D PINGROUP(79, qspi0, mdp_vsync, qup2_se3, _, _, _, _, _, _, _, =
_),
-=09[80] =3D PINGROUP(80, pcie0_clk_req_n, qup1_se7, _, phase_flag, _, _, _=
, _, _, _, _),
-=09[81] =3D PINGROUP(81, wcn_sw_ctrl, qup1_se7, dbg_out_clk, _, _, _, _, _=
, _, _, _),
+=09[78] =3D PINGROUP(78, qup1_se7, qup1_se7_l0_mirb, _, phase_flag, _, _, =
_, _, _, _, _),
+=09[79] =3D PINGROUP(79, qspi0, mdp_vsync, qup2_se3_l0_mira, _, _, _, _, _=
, _, _, _),
+=09[80] =3D PINGROUP(80, pcie0_clk_req_n, qup1_se7_l1_mira, _, phase_flag,=
 _, _, _, _, _, _, _),
+=09[81] =3D PINGROUP(81, wcn_sw_ctrl, qup1_se7_l0_mira, dbg_out_clk, _, _,=
 _, _, _, _, _, _),
 =09[82] =3D PINGROUP(82, _, _, _, _, _, _, _, _, _, _, _),
 =09[83] =3D PINGROUP(83, _, _, _, _, _, _, _, _, _, _, _),
 =09[84] =3D PINGROUP(84, uim0_data, _, _, _, _, _, _, _, _, _, _),
@@ -1383,10 +1479,10 @@ static const struct msm_pingroup eliza_groups[] =3D=
 {
 =09[94] =3D PINGROUP(94, qlink_wmss, _, _, _, _, _, _, _, _, _, _),
 =09[95] =3D PINGROUP(95, qlink_big_request, _, _, _, _, _, _, _, _, _, _),
 =09[96] =3D PINGROUP(96, qlink_big_enable, _, _, _, _, _, _, _, _, _, _),
-=09[97] =3D PINGROUP(97, uim1_data, qspi0, qup2_se3, _, _, _, _, _, _, _, =
_),
+=09[97] =3D PINGROUP(97, uim1_data, qspi0, qup2_se3_l1_mira, _, _, _, _, _=
, _, _, _),
 =09[98] =3D PINGROUP(98, uim1_clk, qspi0, _, _, _, _, _, _, _, _, _),
 =09[99] =3D PINGROUP(99, uim1_reset, qspi0, _, _, _, _, _, _, _, _, _),
-=09[100] =3D PINGROUP(100, uim1_present, qspi0, qup2_se3, coex_uart2_tx, q=
up2_se3, mdp_vsync, _, _, _, _, _),
+=09[100] =3D PINGROUP(100, uim1_present, qspi0, qup2_se3, coex_uart2_tx, q=
up2_se3_l1_mirb, mdp_vsync, _, _, _, _, _),
 =09[101] =3D PINGROUP(101, _, _, _, _, _, _, _, _, _, _, _),
 =09[102] =3D PINGROUP(102, _, _, _, _, _, _, _, _, _, _, _),
 =09[103] =3D PINGROUP(103, _, _, _, _, _, _, _, _, _, _, _),
@@ -1400,9 +1496,9 @@ static const struct msm_pingroup eliza_groups[] =3D {
 =09[111] =3D PINGROUP(111, coex_uart1_tx, _, _, _, _, _, _, _, _, _, _),
 =09[112] =3D PINGROUP(112, coex_uart1_rx, _, _, _, _, _, _, _, _, _, _),
 =09[113] =3D PINGROUP(113, _, nav_gpio3, _, _, _, _, _, _, _, _, _),
-=09[114] =3D PINGROUP(114, qup1_se7, qup1_se7, _, qdss_gpio_tracedata, _, =
_, _, _, _, _, _),
+=09[114] =3D PINGROUP(114, qup1_se7, qup1_se7_l1_mirb, _, qdss_gpio_traced=
ata, _, _, _, _, _, _, _),
 =09[115] =3D PINGROUP(115, _, qspi0, cci_async_in, _, _, _, _, _, _, _, _)=
,
-=09[116] =3D PINGROUP(116, qspi0, coex_uart2_rx, qup2_se3, qup2_se3, _, _,=
 _, _, _, _, _),
+=09[116] =3D PINGROUP(116, qspi0, coex_uart2_rx, qup2_se3, qup2_se3_l0_mir=
b, _, _, _, _, _, _, _),
 =09[117] =3D PINGROUP(117, nav_gpio1, _, vfr_1, _, _, _, _, _, _, _, _),
 =09[118] =3D PINGROUP(118, nav_gpio2, _, _, _, _, _, _, _, _, _, _),
 =09[119] =3D PINGROUP(119, nav_gpio0, _, _, _, _, _, _, _, _, _, _),

--=20
2.53.0



