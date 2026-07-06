Return-Path: <linux-gpio+bounces-39486-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gYUSE8ckS2qQMQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39486-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 05:45:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ACE70C5D2
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 05:45:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=MRINtwE1;
	dmarc=pass (policy=none) header.from=samsung.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39486-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39486-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46D20300B444
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 03:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746823AF66F;
	Mon,  6 Jul 2026 03:45:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D453AE6E2
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 03:45:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783309503; cv=none; b=pGOsfJ1Kt5gHQqt/9rQpvQQKKpgUt7hoGwBFDuLO/4CzSlyhes6Sh+ulN4QinHuv4BABURSZSyn6nOaLBBBvBQbsyjJDB5IH7feWkSXyVhpX1TQQa1A28ZtyNKJmL/jVuwIbz5QVmAdvkn7U4d0w5rvXuOgJ9UddMBanJqgiF9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783309503; c=relaxed/simple;
	bh=AvoROwak15xRTdKbG7RdNFiNAcYCdcOTGAIiSi0WzW4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=g4JlOoqg90m4giZqTPPsXsNAow4Jj1uiM4YShC+44FAxoHXnAbgIsmdUsqeYd1Iwoau5PYkQxzt7jGBBcnWkjCkA6eFtvmRi3DJrTbrbn091O7eG+TysyQqkBFV5xNUpUcqAtt5bWLNbk+OqYVuOhMAZntp35gqlxwMueIJXmEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=MRINtwE1; arc=none smtp.client-ip=203.254.224.24
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260706034451epoutp01219967644f1e19897cd01619be5b0783~-lojUsYbI3011330113epoutp015
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 03:44:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260706034451epoutp01219967644f1e19897cd01619be5b0783~-lojUsYbI3011330113epoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783309491;
	bh=ouGlszysSs4gITTNUdmNxxB0sAGe7tY5xZyujefdx7s=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=MRINtwE1ktxMbJHmMhIVWzFIA0qvrTHojBdSTEnWPf4QXPiDZqwJh+WWwwE0H3PEp
	 AfGJmeL2IFzleI3UdGAGznHGur38ACuhhh+a0zo3xggWO7+qZ1HlHpCvAwwJqT2XkB
	 kwFfn7/WKx3cdpyPqic918AePlCwZL90cgN/yhwM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20260706034451epcas5p4a3ff71f9e76779adf0b9b9d4eb427f7d~-loi_umYg1434614346epcas5p4J;
	Mon,  6 Jul 2026 03:44:51 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4gtqxG41F5z6B9mD; Mon,  6 Jul
	2026 03:44:50 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260706034450epcas5p2e5d0bd1ed0a0a2bbfb02ca8c8caf2ab2~-lohrt-wE0812208122epcas5p2K;
	Mon,  6 Jul 2026 03:44:50 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260706034448epsmtip2b3c3ae419652599f9709ed2d98b789dd~-lof4mPPf2417824178epsmtip2O;
	Mon,  6 Jul 2026 03:44:48 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Ivaylo Ivanov'" <ivo.ivanov.ivanov1@gmail.com>, <krzk@kernel.org>,
	<peter.griffin@linaro.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linusw@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<hajun.sung@samsung.com>
In-Reply-To: <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
Subject: RE: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
Date: Mon, 6 Jul 2026 09:14:46 +0530
Message-ID: <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIex+rgVwEhIQu0sswQMAVV+431vwFQlI8kAbGHTCcCTSL4e7Wx5jew
Content-Language: en-us
X-CMS-MailID: 20260706034450epcas5p2e5d0bd1ed0a0a2bbfb02ca8c8caf2ab2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
	<CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
	<20260627171228.2687857-2-alim.akhtar@samsung.com>
	<4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39486-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:from_mime,samsung.com:email,samsung.com:mid,samsung.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ivo.ivanov.ivanov1@gmail.com,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:ivoivanovivanov1@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2ACE70C5D2

Hi Ivaylo,
Thanks for your review.=20

> -----Original Message-----
> From: Ivaylo Ivanov <ivo.ivanov.ivanov1=40gmail.com>
> Sent: Monday, July 6, 2026 4:11 AM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; krzk=40kernel.org;
> peter.griffin=40linaro.org; robh=40kernel.org; conor+dt=40kernel.org;
> linusw=40kernel.org
> Cc: linux-samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org;
> hajun.sung=40samsung.com
> Subject: Re: =5BPATCH v3 1/6=5D dt-binding: ARM: samsung: Add Samsung
> Exynos8855
>=20
> On 6/27/26 20:12, Alim Akhtar wrote:
> > Add Samsung Exynos8855 smdk board to documentation
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > ---
> >  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     =7C 6 ++++=
++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > index 753b3ba1b607..273464400477 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> > +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-
> boards.yam
> > +++ l
> > =40=40 -235,6 +235,12 =40=40 properties:
> >                - winlink,e850-96                 =23 WinLink E850-96
> >            - const: samsung,exynos850
> >
> > +      - description: Exynos8855 based boards
> > +        items:
> > +          - enum:
> > +              - samsung,exynos8855-smdk         =23 Samsung SMDK
> > +          - const: samsung,exynos8855
>=20
> Is there any particular reason for using =22exynos8855=22 rather than the
> commercial name - exynos1580? We've already established using the latter
> naming scheme as a convention (e.g. exynos3830 -> exynos850, exynos9830 -=
>
> exynos990) rather than the development model numbers, so I don't think
> breaking that will help anyone with the already painful model number conf=
usion.
>=20
The reason for using Exynos8855 is that it comes from the chip-id register,=
 which is RO register.
And in my opinion it has to be chip-id, maintaining two names is confusing =
(as you also mentioned).
Yes, there were couple of deviation but let's come back to the =22original=
=22 convention (which is to use chip-id).

=40 Krzysztof, Peter=20
Any input on this?=20

> Best regards,
> Ivaylo
>=20
> > +
> >        - description: Exynos8895 based boards
> >          items:
> >            - enum:



