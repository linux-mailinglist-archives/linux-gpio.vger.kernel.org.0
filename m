Return-Path: <linux-gpio+bounces-35386-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCNeEAul6Wn1gAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35386-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:50:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA92644D111
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F312D30B5BA1
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 04:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1D23C6A41;
	Thu, 23 Apr 2026 04:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="NTkmatSH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01031E0E14;
	Thu, 23 Apr 2026 04:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919444; cv=none; b=JlpYyv+gyz6YwZ3YmrGb0iMN5iQTDpFvbEdk2CV3tvvJHpdkY8TMyLeICN2NEMNC23BZQQu3ZAJC1g1V2/1BAg9IpJQkrsHH/0KA0Ha1WM1g+9vdtGSKQqrgjIIlekvgFRpe86jhzJYMzbJMI8Ji82gwVny+3upmU1zW34tzzVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919444; c=relaxed/simple;
	bh=tsb3VmFovTma25ROmHyZX3mhVbxmykCkGGat9WGW/6o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eFfsd9XOFFmh+L+4h8AHTmVEWBiYoGcztwMhLdE3oY2MvZSHrVUrhXnq6UccXRjEBqy+zvfhMDTw34AvY6W/xNhkq8k8if94Zht0bj6ytxIXGwdpTZzhMVn9YMGljOKK6lXC3QuQiHMjesEIbBQLjDmchPwyhjUgRlqmmL/F+FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=NTkmatSH; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776919432; x=1777178632;
	bh=tsb3VmFovTma25ROmHyZX3mhVbxmykCkGGat9WGW/6o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NTkmatSH/yAbQN4EFXiHy7Gbq3936wvC7h13ce3+gSH0BKGqVXthyDKhKW/J/pK4k
	 dFLBQyQ2tJZ2dsEdHNzY5GJijemJWgNMovNFN0lUu0+xSKSaDk9ZM9OaPQvFml+wXa
	 1cmyWT1mfl0PAUOYTNK+I+tpeGftZks30Z4NuofY71jot7/zCWkNRKvEMofhiGBwRI
	 j6v+0/1bjIBI/oPY+KYCbOCJdZk5r+QK+r7pQH4ZKon5DytP3v3UGqezPKbU6Y2BuR
	 H0+sKxOflXjXqK2F51QdENyDEfXzIRYSGa4WKfKd3Uu4CHwdAwZCYBaGWA90vS0IXT
	 oy/cMRmLydvQw==
Date: Thu, 23 Apr 2026 04:43:46 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3 4/4] pinctrl: qcom: eliza: Split QUP1_SE4 lanes
Message-ID: <20260423-fix-eliza-pinctrl-v3-4-68b24893ae63@pm.me>
In-Reply-To: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
References: <20260423-fix-eliza-pinctrl-v3-0-68b24893ae63@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6fc27e899e2f21e55cca2b0cf463bea3fc3983cf
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35386-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: BA92644D111
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

QUP1_SE4 shares GPIO_36 & GPIO_37 for both L0/L1 and L3/L2 so the
function name cannot be the same or the alternate function cannot
be selected.

Split them up into individual lane functions so boards can specify.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pi=
nctrl-eliza.c
index 8f74756771b8..40e263e35b45 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -568,7 +568,10 @@ enum eliza_functions {
 =09msm_mux_qup1_se2_l3_mira,
 =09msm_mux_qup1_se2_l3_mirb,
 =09msm_mux_qup1_se3,
-=09msm_mux_qup1_se4,
+=09msm_mux_qup1_se4_l0,
+=09msm_mux_qup1_se4_l1,
+=09msm_mux_qup1_se4_l2,
+=09msm_mux_qup1_se4_l3,
 =09msm_mux_qup1_se5,
 =09msm_mux_qup1_se6,
 =09msm_mux_qup1_se6_l1_mira,
@@ -1017,8 +1020,20 @@ static const char *const qup1_se3_groups[] =3D {
 =09"gpio44", "gpio45", "gpio46", "gpio47",
 };
=20
-static const char *const qup1_se4_groups[] =3D {
-=09"gpio36", "gpio37", "gpio37", "gpio36",
+static const char *const qup1_se4_l0_groups[] =3D {
+=09"gpio36",
+};
+
+static const char *const qup1_se4_l1_groups[] =3D {
+=09"gpio37",
+};
+
+static const char *const qup1_se4_l2_groups[] =3D {
+=09"gpio37",
+};
+
+static const char *const qup1_se4_l3_groups[] =3D {
+=09"gpio36",
 };
=20
 static const char *const qup1_se5_groups[] =3D {
@@ -1321,7 +1336,10 @@ static const struct pinfunction eliza_functions[] =
=3D {
 =09MSM_PIN_FUNCTION(qup1_se2_l3_mira),
 =09MSM_PIN_FUNCTION(qup1_se2_l3_mirb),
 =09MSM_PIN_FUNCTION(qup1_se3),
-=09MSM_PIN_FUNCTION(qup1_se4),
+=09MSM_PIN_FUNCTION(qup1_se4_l0),
+=09MSM_PIN_FUNCTION(qup1_se4_l1),
+=09MSM_PIN_FUNCTION(qup1_se4_l2),
+=09MSM_PIN_FUNCTION(qup1_se4_l3),
 =09MSM_PIN_FUNCTION(qup1_se5),
 =09MSM_PIN_FUNCTION(qup1_se6),
 =09MSM_PIN_FUNCTION(qup1_se6_l1_mira),
@@ -1418,8 +1436,8 @@ static const struct msm_pingroup eliza_groups[] =3D {
 =09[33] =3D PINGROUP(33, qup1_se1, ibi_i3c, host2wlan_sol, gcc_gp3, _, _, =
_, _, _, _, _),
 =09[34] =3D PINGROUP(34, qup1_se1, qup1_se5, tb_trig_sdc1, ddr_bist_start,=
 qdss_gpio_tracedata, _, _, _, _, _, _),
 =09[35] =3D PINGROUP(35, qup1_se1, qup1_se5, tb_trig_sdc2, gcc_gp2, qdss_g=
pio_tracedata, _, _, _, _, _, _),
-=09[36] =3D PINGROUP(36, qup1_se4, qup1_se4, ibi_i3c, _, _, _, _, _, _, _,=
 _),
-=09[37] =3D PINGROUP(37, qup1_se4, qup1_se4, ibi_i3c, _, _, _, _, _, _, _,=
 _),
+=09[36] =3D PINGROUP(36, qup1_se4_l0, qup1_se4_l3, ibi_i3c, _, _, _, _, _,=
 _, _, _),
+=09[37] =3D PINGROUP(37, qup1_se4_l1, qup1_se4_l2, ibi_i3c, _, _, _, _, _,=
 _, _, _),
 =09[38] =3D PINGROUP(38, _, _, _, _, _, _, _, _, _, _, _),
 =09[39] =3D PINGROUP(39, _, _, _, _, _, _, _, _, _, _, _),
 =09[40] =3D PINGROUP(40, qup1_se6, qup1_se2, qup1_se6_l3_mira, _, qdss_gpi=
o_tracedata, gnss_adc1, ddr_pxi1, _, _, _, _),

--=20
2.53.0



