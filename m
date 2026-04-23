Return-Path: <linux-gpio+bounces-35389-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ+aFtul6WlogAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35389-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:53:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9E944D184
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 06:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 118903060C9F
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 04:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB323CCA09;
	Thu, 23 Apr 2026 04:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="NPOQdWwa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBCA3CAE6C;
	Thu, 23 Apr 2026 04:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776919917; cv=none; b=qVMgDuG3GeY7662cnb44Oct7cWcYvznjahFYB+JS6sL4hOm0HFZNeTF47OhniOA5h1jDUh2+WKp+4VHmJlqtTpYnu//j/hJzQCbZbolBhEbwLuVo4MMT++YPc0/pqquOIjm/x4rpNAaWwbiazGx9+i+aAfgV7C2llihSbgA2+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776919917; c=relaxed/simple;
	bh=TR7ngD+JdK4DU+FncCkwlbE2pgVePIwx/bMTGXF3mX8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XuOnePqWVpIeHDuGadXneqXIKEThqVNJNvII79krxilmt7wDngQr6m4VWNX6b3rhKqzvpr0rcei+GHsW3TikGl1T5mQWWf5fH1xDsZNctp+znyN+2a9FSWJEaXw3DvEK3N3YfxIhp+ajm5xFIsHlzUr1yHAlTDvlRfG5I8UWwzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=NPOQdWwa; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776919909; x=1777179109;
	bh=TR7ngD+JdK4DU+FncCkwlbE2pgVePIwx/bMTGXF3mX8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NPOQdWwaMhiwus1AVugPqvCmN1yJIoa/0aXCdYZ2TNZD5gUWC8341gBqDHfdwcy2t
	 sIxif7Q9mIGYwq03fB58GJxf0fYXAHM6PCE8mveBTHYW/EmKcbuSeIS+ykZtWxUxv4
	 LhnJlQhwBLmLkz9OLH/OPb+j7RDuvNGQyuMgv6wDMWREVPuEQyr+Bm2aHPJZTSZVfw
	 SqDH9H02Q8Uh+RvouTVKcvPo3VcQkEbCL8TgHyNy6mbNYS0hBkdJuGFx9KUdhgQE/j
	 W1/h/qU1SkKNPGe456vwUxbPQ/ipQ3BNZP+vN48T5JhsVGQ/FRU+u2aFV3NY04xKvI
	 UO5giwjj8AaGw==
Date: Thu, 23 Apr 2026 04:51:45 +0000
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 2/2] pinctrl: qcom: eliza: Fix QDSS trace clock/control pingroup names
Message-ID: <20260423-misc-eliza-pinctrl-v1-2-2498b365ff2c@pm.me>
In-Reply-To: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 696da0a1c4e1f3a061f5ad25b9d5e8191c93cb7f
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
	TAGGED_FROM(0.00)[bounces-35389-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:dkim,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AC9E944D184
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix a few typos for these in their respective pingroups, the groups
already exist they just weren't referenced.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pi=
nctrl-eliza.c
index b3413520a115..ba99b2a20e9e 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -1340,7 +1340,7 @@ static const struct msm_pingroup eliza_groups[] =3D {
 =09[51] =3D PINGROUP(51, _, _, _, _, _, _, _, _, _, _, _),
 =09[52] =3D PINGROUP(52, qup1_se2, pcie1_clk_req_n, qup1_se2, ddr_bist_com=
plete, qdss_gpio_tracedata, _, vsense_trigger_mirnat, _, _, _, _),
 =09[53] =3D PINGROUP(53, qup1_se2, qup1_se2, gcc_gp1, ddr_bist_stop, _, qd=
ss_gpio_tracedata, _, _, _, _, _),
-=09[54] =3D PINGROUP(54, qup1_se2, qup1_se6, qdss_gpio_tracedata, gnss_adc=
1, atest_usb, ddr_pxi0, _, _, _, _, _),
+=09[54] =3D PINGROUP(54, qup1_se2, qup1_se6, qdss_gpio_traceclk, gnss_adc1=
, atest_usb, ddr_pxi0, _, _, _, _, _),
 =09[55] =3D PINGROUP(55, qup1_se2, dp0_hot, qup1_se6, _, gnss_adc0, atest_=
usb, ddr_pxi0, _, _, _, _),
 =09[56] =3D PINGROUP(56, usb0_hs, tsense_pwm1, tsense_pwm2, tsense_pwm3, t=
sense_pwm4, _, _, _, _, _, _),
 =09[57] =3D PINGROUP(57, sd_write_protect, _, _, _, _, _, _, _, _, _, _),
@@ -1358,7 +1358,7 @@ static const struct msm_pingroup eliza_groups[] =3D {
 =09[69] =3D PINGROUP(69, cam_mclk, audio_ext_mclk0, resout_gpio, prng_rosc=
1, _, _, _, _, _, _, _),
 =09[70] =3D PINGROUP(70, cci_i2c_sda, tmess_prng2, _, phase_flag, atest_ch=
ar, _, _, _, _, _, _),
 =09[71] =3D PINGROUP(71, cci_i2c_scl, tmess_prng3, _, phase_flag, atest_ch=
ar, _, _, _, _, _, _),
-=09[72] =3D PINGROUP(72, cci_i2c_sda, tmess_prng1, qdss_gpio_tracedata, at=
est_char, _, _, _, _, _, _, _),
+=09[72] =3D PINGROUP(72, cci_i2c_sda, tmess_prng1, qdss_gpio_tracectl, ate=
st_char, _, _, _, _, _, _, _),
 =09[73] =3D PINGROUP(73, cci_i2c_scl, tmess_prng0, qdss_cti, atest_char, _=
, _, _, _, _, _, _),
 =09[74] =3D PINGROUP(74, cci_i2c_sda, prng_rosc3, qdss_cti, atest_char, _,=
 _, _, _, _, _, _),
 =09[75] =3D PINGROUP(75, cci_i2c_scl, _, phase_flag, _, _, _, _, _, _, _, =
_),
@@ -1430,10 +1430,10 @@ static const struct msm_pingroup eliza_groups[] =3D=
 {
 =09[141] =3D PINGROUP(141, _, _, _, _, _, _, _, _, _, _, egpio),
 =09[142] =3D PINGROUP(142, _, _, _, _, _, _, _, _, _, _, egpio),
 =09[143] =3D PINGROUP(143, _, _, _, _, _, _, _, _, _, _, egpio),
-=09[144] =3D PINGROUP(144, _, qdss_gpio_tracedata, _, _, _, _, _, _, _, _,=
 egpio),
+=09[144] =3D PINGROUP(144, _, qdss_gpio_tracectl, _, _, _, _, _, _, _, _, =
egpio),
 =09[145] =3D PINGROUP(145, qdss_gpio_tracedata, _, _, _, _, _, _, _, _, _,=
 egpio),
 =09[146] =3D PINGROUP(146, _, qdss_gpio_tracedata, _, _, _, _, _, _, _, _,=
 egpio),
-=09[147] =3D PINGROUP(147, ddr_bist_fail, _, qdss_gpio_tracedata, _, _, _,=
 _, _, _, _, egpio),
+=09[147] =3D PINGROUP(147, ddr_bist_fail, _, qdss_gpio_traceclk, _, _, _, =
_, _, _, _, egpio),
 =09[148] =3D PINGROUP(148, _, _, _, _, _, _, _, _, _, _, egpio),
 =09[149] =3D PINGROUP(149, _, _, _, _, _, _, _, _, _, _, egpio),
 =09[150] =3D PINGROUP(150, _, _, _, _, _, _, _, _, _, _, egpio),

--=20
2.53.0



