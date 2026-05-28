Return-Path: <linux-gpio+bounces-37644-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJC0KOt7GGrbkQgAu9opvQ
	(envelope-from <linux-gpio+bounces-37644-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 19:31:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 969EF5F5A67
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 19:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C7863080829
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 17:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9233FE66B;
	Thu, 28 May 2026 17:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="U1Pg3ept"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136DA3FE658
	for <linux-gpio@vger.kernel.org>; Thu, 28 May 2026 17:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779989108; cv=none; b=iKvO1slPC7++6X9JPw1jU4MViycagHpZcNPteYJpmMfd/QZd2W+FAdHATvB9R+Z9dNZjKUG0dpVF50G+4wMq3uF3lbwM77AkuVNAo9hm4Wq/eaAXZp8b2tdFe07GW8ue49n77XU79pMKYXq+5UkSPR++785+kOb+9dvvsKWKbhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779989108; c=relaxed/simple;
	bh=ZzExrYy0BQ16Tbydiro3jbBk5BdYDYTPA/Y0aVdDzdc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SGy6GIK8XCz9nQerlwY/UNy2f87p1Apw8LrqvMK88CAP8yIe8VDuTau4jlvNm7MR1rsE204LHxADSyMjATT9xGP5Z2q0kzp35QaWniNtQLNMpWoetekis9IkMyxOqZK6jilVMiOibIqExzYR9QDizMV1A3XAsV1V99BOPRYgGt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=U1Pg3ept; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1779989098; x=1780248298;
	bh=BoYkvI2WjcsQCtI26PtJ10p6lX2JRDVsMLT/e1gckfc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=U1Pg3eptjX5rLzIBpNCyl4ec/IYofvK+ouluKNv3Ln1FZ5Cz4WzC7r6n8Vk46SBBB
	 Te5Jd/W1PMxLxU0s80DwMjnqXoYc6y6O8G1gMVNaTPQoS+XICr+Z8HUnPM2OqKvypd
	 Up7YUkI6btax3NUs3w7BR+L+cls4q+g2CDENulmeQfzhGzbeLhBiGUlK1sfM4bYLSE
	 DR0EpJ/MRU1mg6LEp+0KP2X7wxjfqRrIKJDoF1hrTnmi8oJV98SJpmQYgyFKGcxlPQ
	 0vlVkF5E4s8QEE8H8d6pfH5jahjcU8i+TaH+P/CccgRWl8ouqqlxXdC89RXD5rAp3p
	 D8BnW6FS7FRdA==
Date: Thu, 28 May 2026 17:24:52 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] pinctrl: qcom: eliza: Fix HDMI_RCV_DET function slot
Message-ID: <P33wW6i3eN15uYIbIb8LfIVRvmL0zVdiI_FOKDoMIM_KFi01m_7PMaZmU1z3YJl9mGN2kDtSvXUujD-TWaXXiSOZeEH-kwj3JSjmIRfRb54=@pm.me>
In-Reply-To: <5dae3a56-a17c-4201-ba0b-8591646197ef@oss.qualcomm.com>
References: <20260423-misc-eliza-pinctrl-v1-0-2498b365ff2c@pm.me> <20260423-misc-eliza-pinctrl-v1-1-2498b365ff2c@pm.me> <5dae3a56-a17c-4201-ba0b-8591646197ef@oss.qualcomm.com>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: cd99b66da121e7271911e9b6f60ed50e4b3269e2
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37644-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,pm.me:mid,pm.me:dkim]
X-Rspamd-Queue-Id: 969EF5F5A67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, April 23rd, 2026 at 7:08 PM, Konrad Dybcio <konrad.dybcio@oss.=
qualcomm.com> wrote:

> On 4/23/26 6:51 AM, Alexander Koskovich wrote:
> > The hdmi_rcv_det function was placed at alt function slot 2, but the
> > correct mux value for this function on GPIO 19 is slot 3. Move it
> > accordingly and leave slot 2 unassigned.
>=20
> No, 2 is the desired one per docs
>=20
> 0 -> GPIO
> 1 -> QUP2_SE5_L3
> 2 -> HDMI_RCV_DET

Is it possible that CQ7790S is a special case? The pin assignment I have fo=
r it
here is:

0 -> GPIO
1 -> QUP2_SE5_L3
2 -> N/A
3 -> GP_PDM_MIRA[0]/HDMI_RCV_DET

>=20
> Konrad
>=20

Thanks,
Alex

> 

