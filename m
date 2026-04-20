Return-Path: <linux-gpio+bounces-35274-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B1+MvlN5mkgugEAu9opvQ
	(envelope-from <linux-gpio+bounces-35274-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 18:02:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 405FD42EDC3
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 18:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41E4A31F4C58
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2026 15:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683B43D1CDB;
	Mon, 20 Apr 2026 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="VyICU1GJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387EA3D1CC5;
	Mon, 20 Apr 2026 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776695299; cv=none; b=RLRkF68N8hr1qV5nvDFcpcLbNAL1Owr2hXi3c9vsAoImzWC4eJFWBsuDEsenV1zqKIsB+7do+9G7OuyVOxIx4zouqWSx2uGeMSZ3rw7AWAQBsPtSnAaiu4zeYqxQDEUedrdtcbPD8+ZHQTT/e91421ILo8a1ZkQgqdX9cT1+EbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776695299; c=relaxed/simple;
	bh=9tLbAL/IkJ8RXG3NKCcoFK7v5tgajuxUZOxxl45bQkw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+CFHx2mpXjubuDO+wifjEV+FM1ixBX+4F9mkerxlJ1tGIP2MNQvHMC/0iqMZoHgi5F2+zaM7M7pDW6mFQmV4h4N/AT+jdmT+kaGWeTA0rmyJG+VY+B4cxxM+dGx7jqVHDcz7V256RoKtyfjIXnz91l4eMzlegqNz6bwdfkVneY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=VyICU1GJ; arc=none smtp.client-ip=109.224.244.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776695289; x=1776954489;
	bh=9tLbAL/IkJ8RXG3NKCcoFK7v5tgajuxUZOxxl45bQkw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VyICU1GJvjK/5vXjR/YBEZDqfpfOpG4BBXTAD9X6a7UdyoXGwmqi26e45zuxngyd7
	 oksq9WfdOl/gKg+EhmcCKNilCTrMBFsQdpggmk288VdAnYEz6nAZX7SN/8reNrZ+BO
	 CTnyZ5Mbg8py+06oZ+P22BWRgqBYa8gRDAa7Zidrojtoxn6nYXu3nLYe/QICKm1EVQ
	 Rsr4IBNusLiVdR4Wx8uUjsFRQ+8UNZmA2pp1gdJMUad/JZD8gLRzvdWzWPDQLbWXbp
	 knwXbLcCS/i1fwVJF6WQgJFJ7ORsq0zbaQWkVFf/H95Ow3Pbk/MczGyZhLrqkeYy9O
	 PnhXRB4/eT/FQ==
Date: Mon, 20 Apr 2026 14:28:04 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2 2/2] pinctrl: qcom: eliza: Split up some QUP pin groups
Message-ID: <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me>
In-Reply-To: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 0b36d055a9c635361ef9d952bdef044d3e7cad8a
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35274-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:email,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: 405FD42EDC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Multiple QUPs have lanes that can be routed to one of two GPIOs and
collapsing them prevents devicetrees from requesting specific routing.

For example, a board that wires an I2C SCL line to one of two GPIOs
cannot request that specific pin with the groups collapsed.

This change splits them up so devicetrees can request the configuration
they need.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 200 +++++++++++++++++++++++++++++--=
----
 1 file changed, 169 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pi=
nctrl-eliza.c
index c1f756cbcdeb..a1365bcd3bf6 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -562,16 +562,39 @@ enum eliza_functions {
 =09msm_mux_qspi_cs,
 =09msm_mux_qup1_se0,
 =09msm_mux_qup1_se1,
-=09msm_mux_qup1_se2,
+=09msm_mux_qup1_se2_l0,
+=09msm_mux_qup1_se2_l1,
+=09msm_mux_qup1_se2_l2_mira,
+=09msm_mux_qup1_se2_l2_mirb,
+=09msm_mux_qup1_se2_l3_mira,
+=09msm_mux_qup1_se2_l3_mirb,
+=09msm_mux_qup1_se2_l4,
+=09msm_mux_qup1_se2_l5,
+=09msm_mux_qup1_se2_l6,
 =09msm_mux_qup1_se3,
 =09msm_mux_qup1_se4,
 =09msm_mux_qup1_se5,
-=09msm_mux_qup1_se6,
-=09msm_mux_qup1_se7,
+=09msm_mux_qup1_se6_l0,
+=09msm_mux_qup1_se6_l1_mira,
+=09msm_mux_qup1_se6_l1_mirb,
+=09msm_mux_qup1_se6_l2,
+=09msm_mux_qup1_se6_l3_mira,
+=09msm_mux_qup1_se6_l3_mirb,
+=09msm_mux_qup1_se7_l0_mira,
+=09msm_mux_qup1_se7_l0_mirb,
+=09msm_mux_qup1_se7_l1_mira,
+=09msm_mux_qup1_se7_l1_mirb,
+=09msm_mux_qup1_se7_l2,
+=09msm_mux_qup1_se7_l3,
 =09msm_mux_qup2_se0,
 =09msm_mux_qup2_se1,
 =09msm_mux_qup2_se2,
-=09msm_mux_qup2_se3,
+=09msm_mux_qup2_se3_l0_mira,
+=09msm_mux_qup2_se3_l0_mirb,
+=09msm_mux_qup2_se3_l1_mira,
+=09msm_mux_qup2_se3_l1_mirb,
+=09msm_mux_qup2_se3_l2,
+=09msm_mux_qup2_se3_l3,
 =09msm_mux_qup2_se4,
 =09msm_mux_qup2_se5,
 =09msm_mux_qup2_se6,
@@ -977,8 +1000,40 @@ static const char *const qup1_se1_groups[] =3D {
 =09"gpio32", "gpio33", "gpio34", "gpio35",
 };
=20
-static const char *const qup1_se2_groups[] =3D {
-=09"gpio52", "gpio53", "gpio54", "gpio52", "gpio55", "gpio53", "gpio40", "=
gpio42", "gpio30",
+static const char *const qup1_se2_l0_groups[] =3D {
+=09"gpio52",
+};
+
+static const char *const qup1_se2_l1_groups[] =3D {
+=09"gpio53",
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
+};
+
+static const char *const qup1_se2_l4_groups[] =3D {
+=09"gpio40",
+};
+
+static const char *const qup1_se2_l5_groups[] =3D {
+=09"gpio42",
+};
+
+static const char *const qup1_se2_l6_groups[] =3D {
+=09"gpio30",
 };
=20
 static const char *const qup1_se3_groups[] =3D {
@@ -993,12 +1048,52 @@ static const char *const qup1_se5_groups[] =3D {
 =09"gpio132", "gpio133", "gpio134", "gpio135", "gpio34", "gpio35",
 };
=20
-static const char *const qup1_se6_groups[] =3D {
-=09"gpio40", "gpio42", "gpio54", "gpio42", "gpio40", "gpio55",
+static const char *const qup1_se6_l0_groups[] =3D {
+=09"gpio40",
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
+static const char *const qup1_se6_l2_groups[] =3D {
+=09"gpio42",
+};
+
+static const char *const qup1_se6_l3_mira_groups[] =3D {
+=09"gpio40",
 };
=20
-static const char *const qup1_se7_groups[] =3D {
-=09"gpio81", "gpio78", "gpio80", "gpio114", "gpio114", "gpio78",
+static const char *const qup1_se6_l3_mirb_groups[] =3D {
+=09"gpio55",
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
+};
+
+static const char *const qup1_se7_l2_groups[] =3D {
+=09"gpio114",
+};
+
+static const char *const qup1_se7_l3_groups[] =3D {
+=09"gpio78",
 };
=20
 static const char *const qup2_se0_groups[] =3D {
@@ -1013,8 +1108,28 @@ static const char *const qup2_se2_groups[] =3D {
 =09"gpio8", "gpio9", "gpio10", "gpio11", "gpio16", "gpio17", "gpio18",
 };
=20
-static const char *const qup2_se3_groups[] =3D {
-=09"gpio79", "gpio116", "gpio97", "gpio100", "gpio100", "gpio116",
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
+};
+
+static const char *const qup2_se3_l2_groups[] =3D {
+=09"gpio100",
+};
+
+static const char *const qup2_se3_l3_groups[] =3D {
+=09"gpio116",
 };
=20
 static const char *const qup2_se4_groups[] =3D {
@@ -1235,16 +1350,39 @@ static const struct pinfunction eliza_functions[] =
=3D {
 =09MSM_PIN_FUNCTION(qspi_cs),
 =09MSM_PIN_FUNCTION(qup1_se0),
 =09MSM_PIN_FUNCTION(qup1_se1),
-=09MSM_PIN_FUNCTION(qup1_se2),
+=09MSM_PIN_FUNCTION(qup1_se2_l0),
+=09MSM_PIN_FUNCTION(qup1_se2_l1),
+=09MSM_PIN_FUNCTION(qup1_se2_l2_mira),
+=09MSM_PIN_FUNCTION(qup1_se2_l2_mirb),
+=09MSM_PIN_FUNCTION(qup1_se2_l3_mira),
+=09MSM_PIN_FUNCTION(qup1_se2_l3_mirb),
+=09MSM_PIN_FUNCTION(qup1_se2_l4),
+=09MSM_PIN_FUNCTION(qup1_se2_l5),
+=09MSM_PIN_FUNCTION(qup1_se2_l6),
 =09MSM_PIN_FUNCTION(qup1_se3),
 =09MSM_PIN_FUNCTION(qup1_se4),
 =09MSM_PIN_FUNCTION(qup1_se5),
-=09MSM_PIN_FUNCTION(qup1_se6),
-=09MSM_PIN_FUNCTION(qup1_se7),
+=09MSM_PIN_FUNCTION(qup1_se6_l0),
+=09MSM_PIN_FUNCTION(qup1_se6_l1_mira),
+=09MSM_PIN_FUNCTION(qup1_se6_l1_mirb),
+=09MSM_PIN_FUNCTION(qup1_se6_l2),
+=09MSM_PIN_FUNCTION(qup1_se6_l3_mira),
+=09MSM_PIN_FUNCTION(qup1_se6_l3_mirb),
+=09MSM_PIN_FUNCTION(qup1_se7_l0_mira),
+=09MSM_PIN_FUNCTION(qup1_se7_l0_mirb),
+=09MSM_PIN_FUNCTION(qup1_se7_l1_mira),
+=09MSM_PIN_FUNCTION(qup1_se7_l1_mirb),
+=09MSM_PIN_FUNCTION(qup1_se7_l2),
+=09MSM_PIN_FUNCTION(qup1_se7_l3),
 =09MSM_PIN_FUNCTION(qup2_se0),
 =09MSM_PIN_FUNCTION(qup2_se1),
 =09MSM_PIN_FUNCTION(qup2_se2),
-=09MSM_PIN_FUNCTION(qup2_se3),
+=09MSM_PIN_FUNCTION(qup2_se3_l0_mira),
+=09MSM_PIN_FUNCTION(qup2_se3_l0_mirb),
+=09MSM_PIN_FUNCTION(qup2_se3_l1_mira),
+=09MSM_PIN_FUNCTION(qup2_se3_l1_mirb),
+=09MSM_PIN_FUNCTION(qup2_se3_l2),
+=09MSM_PIN_FUNCTION(qup2_se3_l3),
 =09MSM_PIN_FUNCTION(qup2_se4),
 =09MSM_PIN_FUNCTION(qup2_se5),
 =09MSM_PIN_FUNCTION(qup2_se6),
@@ -1316,7 +1454,7 @@ static const struct msm_pingroup eliza_groups[] =3D {
 =09[27] =3D PINGROUP(27, qup2_se4, aoss_cti, mdp_vsync11_out, qup2_se7, gc=
c_gp1, _, _, _, _, _, _),
 =09[28] =3D PINGROUP(28, qup1_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio)=
,
 =09[29] =3D PINGROUP(29, qup1_se0, ibi_i3c, _, _, _, _, _, _, _, _, egpio)=
,
-=09[30] =3D PINGROUP(30, qup1_se0, qup1_se2, cci_async_in, gcc_gp3, qdss_g=
pio_tracedata, _, _, _, _, _, egpio),
+=09[30] =3D PINGROUP(30, qup1_se0, qup1_se2_l6, cci_async_in, gcc_gp3, qds=
s_gpio_tracedata, _, _, _, _, _, egpio),
 =09[31] =3D PINGROUP(31, qup1_se0, cci_async_in, qdss_gpio_tracedata, _, _=
, _, _, _, _, _, egpio),
 =09[32] =3D PINGROUP(32, qup1_se1, ibi_i3c, audio_ref_clk, gcc_gp2, qdss_c=
ti, _, _, _, _, _, _),
 =09[33] =3D PINGROUP(33, qup1_se1, ibi_i3c, host2wlan_sol, gcc_gp3, _, _, =
_, _, _, _, _),
@@ -1326,9 +1464,9 @@ static const struct msm_pingroup eliza_groups[] =3D {
 =09[37] =3D PINGROUP(37, qup1_se4, qup1_se4, ibi_i3c, _, _, _, _, _, _, _,=
 _),
 =09[38] =3D PINGROUP(38, _, _, _, _, _, _, _, _, _, _, _),
 =09[39] =3D PINGROUP(39, _, _, _, _, _, _, _, _, _, _, _),
-=09[40] =3D PINGROUP(40, qup1_se6, qup1_se2, qup1_se6, _, qdss_gpio_traced=
ata, gnss_adc1, ddr_pxi1, _, _, _, _),
+=09[40] =3D PINGROUP(40, qup1_se6_l0, qup1_se2_l4, qup1_se6_l3_mira, _, qd=
ss_gpio_tracedata, gnss_adc1, ddr_pxi1, _, _, _, _),
 =09[41] =3D PINGROUP(41, _, _, _, _, _, _, _, _, _, _, _),
-=09[42] =3D PINGROUP(42, qup1_se6, qup1_se2, qup1_se6, qdss_gpio_tracedata=
, gnss_adc0, ddr_pxi1, _, _, _, _, _),
+=09[42] =3D PINGROUP(42, qup1_se6_l2, qup1_se2_l5, qup1_se6_l1_mira, qdss_=
gpio_tracedata, gnss_adc0, ddr_pxi1, _, _, _, _, _),
 =09[43] =3D PINGROUP(43, _, _, _, _, _, _, _, _, _, _, _),
 =09[44] =3D PINGROUP(44, qup1_se3, _, _, _, _, _, _, _, _, _, _),
 =09[45] =3D PINGROUP(45, qup1_se3, _, _, _, _, _, _, _, _, _, _),
@@ -1338,10 +1476,10 @@ static const struct msm_pingroup eliza_groups[] =3D=
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
+=09[52] =3D PINGROUP(52, qup1_se2_l0, pcie1_clk_req_n, qup1_se2_l2_mirb, d=
dr_bist_complete, qdss_gpio_tracedata, _, vsense_trigger_mirnat, _, _, _, _=
),
+=09[53] =3D PINGROUP(53, qup1_se2_l1, qup1_se2_l3_mirb, gcc_gp1, ddr_bist_=
stop, _, qdss_gpio_tracedata, _, _, _, _, _),
+=09[54] =3D PINGROUP(54, qup1_se2_l2_mira, qup1_se6_l1_mirb, qdss_gpio_tra=
cedata, gnss_adc1, atest_usb, ddr_pxi0, _, _, _, _, _),
+=09[55] =3D PINGROUP(55, qup1_se2_l3_mira, dp0_hot, qup1_se6_l3_mirb, _, g=
nss_adc0, atest_usb, ddr_pxi0, _, _, _, _),
 =09[56] =3D PINGROUP(56, usb0_hs, tsense_pwm1, tsense_pwm2, tsense_pwm3, t=
sense_pwm4, _, _, _, _, _, _),
 =09[57] =3D PINGROUP(57, sd_write_protect, _, _, _, _, _, _, _, _, _, _),
 =09[58] =3D PINGROUP(58, _, _, _, _, _, _, _, _, _, _, _),
@@ -1364,10 +1502,10 @@ static const struct msm_pingroup eliza_groups[] =3D=
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
+=09[78] =3D PINGROUP(78, qup1_se7_l3, qup1_se7_l0_mirb, _, phase_flag, _, =
_, _, _, _, _, _),
+=09[79] =3D PINGROUP(79, qspi0, mdp_vsync, qup2_se3_l0_mira, _, _, _, _, _=
, _, _, _),
+=09[80] =3D PINGROUP(80, pcie0_clk_req_n, qup1_se7_l1_mira, _, phase_flag,=
 _, _, _, _, _, _, _),
+=09[81] =3D PINGROUP(81, wcn_sw_ctrl, qup1_se7_l0_mira, dbg_out_clk, _, _,=
 _, _, _, _, _, _),
 =09[82] =3D PINGROUP(82, _, _, _, _, _, _, _, _, _, _, _),
 =09[83] =3D PINGROUP(83, _, _, _, _, _, _, _, _, _, _, _),
 =09[84] =3D PINGROUP(84, uim0_data, _, _, _, _, _, _, _, _, _, _),
@@ -1383,10 +1521,10 @@ static const struct msm_pingroup eliza_groups[] =3D=
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
+=09[100] =3D PINGROUP(100, uim1_present, qspi0, qup2_se3_l2, coex_uart2_tx=
, qup2_se3_l1_mirb, mdp_vsync, _, _, _, _, _),
 =09[101] =3D PINGROUP(101, _, _, _, _, _, _, _, _, _, _, _),
 =09[102] =3D PINGROUP(102, _, _, _, _, _, _, _, _, _, _, _),
 =09[103] =3D PINGROUP(103, _, _, _, _, _, _, _, _, _, _, _),
@@ -1400,9 +1538,9 @@ static const struct msm_pingroup eliza_groups[] =3D {
 =09[111] =3D PINGROUP(111, coex_uart1_tx, _, _, _, _, _, _, _, _, _, _),
 =09[112] =3D PINGROUP(112, coex_uart1_rx, _, _, _, _, _, _, _, _, _, _),
 =09[113] =3D PINGROUP(113, _, nav_gpio3, _, _, _, _, _, _, _, _, _),
-=09[114] =3D PINGROUP(114, qup1_se7, qup1_se7, _, qdss_gpio_tracedata, _, =
_, _, _, _, _, _),
+=09[114] =3D PINGROUP(114, qup1_se7_l2, qup1_se7_l1_mirb, _, qdss_gpio_tra=
cedata, _, _, _, _, _, _, _),
 =09[115] =3D PINGROUP(115, _, qspi0, cci_async_in, _, _, _, _, _, _, _, _)=
,
-=09[116] =3D PINGROUP(116, qspi0, coex_uart2_rx, qup2_se3, qup2_se3, _, _,=
 _, _, _, _, _),
+=09[116] =3D PINGROUP(116, qspi0, coex_uart2_rx, qup2_se3_l3, qup2_se3_l0_=
mirb, _, _, _, _, _, _, _),
 =09[117] =3D PINGROUP(117, nav_gpio1, _, vfr_1, _, _, _, _, _, _, _, _),
 =09[118] =3D PINGROUP(118, nav_gpio2, _, _, _, _, _, _, _, _, _, _),
 =09[119] =3D PINGROUP(119, nav_gpio0, _, _, _, _, _, _, _, _, _, _),

--=20
2.53.0



