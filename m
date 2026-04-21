Return-Path: <linux-gpio+bounces-35315-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGNTF3ys52kM/AEAu9opvQ
	(envelope-from <linux-gpio+bounces-35315-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 18:57:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEBF43DAAC
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 18:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AAA93062A00
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Apr 2026 16:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0634534D3B2;
	Tue, 21 Apr 2026 16:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="FR32Ip3O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CDD37B02A
	for <linux-gpio@vger.kernel.org>; Tue, 21 Apr 2026 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776790260; cv=none; b=oVch0brybltyq1fX/BGDIvJVYi/pKd6afgizTG9A3dN4uZSoZUmGYjUNdcfF88of7Z9B/7O1NzvfqsuLhAVTM9y/DHUCCAGrjUbMcjXbyxzwJ692DIvATdhF7US4dVOMIgcHIFB1Uq9nQ62TPKQ8g0gnA9iQP4Ke5KmQuI52YNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776790260; c=relaxed/simple;
	bh=FbU2IvOTeNvy9bey8cf4nfDCn74akoWtK/nq07U1TxA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=szSGba1ZwFpKHUEOwu8j4gwcm8+Ir7qej0yAFwM0CU7FgrtXSbPVDRtKqFioR2iTzYGCfU88YUzI470ol3SMv70OitO57QsCi2czy9H1HfROaings0I2sau3R7vMJG3VKEo1lUv7JJsqTQaueZDNRm0ON7wiffdkGCuCfI3QGrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=FR32Ip3O; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776790251; x=1777049451;
	bh=EdX3AvgX/aH6F/p+FwltMFglS9SHJ2o00uCI9YuBjn8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FR32Ip3OL9/5Mevs56fAmnllDbd+7Iel25HEYYfFftzrY2UnRCoTNmniVMJUpKPIg
	 SFE2rNsGmd1bMT6c9C11i33WbnJNyLC01tvzQ1wWuqlo6mPndur6b6WUKmbpifwio5
	 FXBi3dCpcEoj4v6Qc47N1wFg/z9mCqQ5JwWO96F6fY1qbJwV9wH/65JTKr/mrh0leA
	 5QFY/akXpoq96CSQGz19/2bACrWkYxHd/JNYqABidfb1j9BnXXmmvKW3F0byzd9+tc
	 boJZCLC4KWMcwozj4ExpieM3kTfvCJMZW1bIEjRrvY2thrXADS6xSx9gqF3gyJq/1h
	 tsp8W7mFtvTiw==
Date: Tue, 21 Apr 2026 16:50:47 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: eliza: Split up some QUP pin groups
Message-ID: <Li2-2Zov5lvXZcLfb6l0_7mDAg2QB-ag10-aLD59ulR1pntDBHpNORrd0I5Gg_YGqo-rGdIgil2DmrVw1CoDhgN1S7QLsnId_k2mf4u5DYk=@pm.me>
In-Reply-To: <cdaf1f7d-72d1-4481-aa3f-4b15990cf6a6@oss.qualcomm.com>
References: <20260420-fix-eliza-pinctrl-v2-0-b68329fd6701@pm.me> <20260420-fix-eliza-pinctrl-v2-2-b68329fd6701@pm.me> <cdaf1f7d-72d1-4481-aa3f-4b15990cf6a6@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b9430b1ac5c23f3d6d19d159fa48febd6d22a217
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
	TAGGED_FROM(0.00)[bounces-35315-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[pm.me:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,pm.me:dkim,pm.me:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0AEBF43DAAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tuesday, April 21st, 2026 at 9:06 AM, Konrad Dybcio <konrad.dybcio@oss.q=
ualcomm.com> wrote:

> On 4/20/26 4:28 PM, Alexander Koskovich wrote:
> > Multiple QUPs have lanes that can be routed to one of two GPIOs and
> > collapsing them prevents devicetrees from requesting specific routing.
> >
> > For example, a board that wires an I2C SCL line to one of two GPIOs
> > cannot request that specific pin with the groups collapsed.
> >
> > This change splits them up so devicetrees can request the configuration
> > they need.
>=20
> Please massage the commit message so that it highlights that the issue
> is that there are multiple functions defined for a given pin, sharing
> the same name

Will do in v3, also I was looking at how sm8550 handles this with qup2_se0,=
 and
noticed they don't split every lane in this case, they only split out the
lanes that have two possible GPIOS:

=09msm_mux_qup2_se0_l0_mira,
=09msm_mux_qup2_se0_l0_mirb,
=09msm_mux_qup2_se0_l1_mira,
=09msm_mux_qup2_se0_l1_mirb,
=09msm_mux_qup2_se0_l2_mira,
=09msm_mux_qup2_se0_l2_mirb,
=09msm_mux_qup2_se0_l3_mira,
=09msm_mux_qup2_se0_l3_mirb,

For Eliza I split them all out since I figured if I was already splitting s=
ome
out for mira/mirb I should just also split the rest, but should I mirror th=
is?

>=20
> Konrad
>=20

Thanks,
Alex

> 

