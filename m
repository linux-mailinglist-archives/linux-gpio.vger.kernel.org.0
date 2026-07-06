Return-Path: <linux-gpio+bounces-39506-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X2quNt6BS2paSgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39506-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:22:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2683470F183
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 12:22:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=j++VBWBh;
	dmarc=pass (policy=none) header.from=samsung.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39506-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39506-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B4B0311782E
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 09:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4011541F7F5;
	Mon,  6 Jul 2026 09:29:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE49495517
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:29:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330168; cv=none; b=ouso5ojRV64xeVTNM1O3TnLg3eRrnzpHUPOdZPV5TLg+brOHKqlEocvk2THYnjzG8xgmM07VYMYjBjZSdTa2kII4OWhQs3cdmOI9cfAtTrhyQVpIDpzh76hGMUo+sGySu1MSO5wmbC+bDMJTnzdnAxe8lua41ATmtwIRTKLN6z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330168; c=relaxed/simple;
	bh=EtTeMkSietV82o09083ScOBldAiMO7Zi+RQtHU058Vk=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=NlppPq5AYkmn6K8Y1YwI6B2kf36YiZQEEutN0A521P2wibhyQ5m4PY0NmfUdArR08XTRxFLBQBaHtm7BOXtfrfAAoZLYOxP1libjBECHHh9t96tclfJqgwMHfLGGBPRWGUHP6zM/CPsjG+bmXPj44iEZwKY6MBrAoBxKJL2QVnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=j++VBWBh; arc=none smtp.client-ip=203.254.224.25
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260706092916epoutp024b3d3d1c6b838968b70f43b5d17a6a22~-qVQ4Ehfs0791607916epoutp02k
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2026 09:29:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260706092916epoutp024b3d3d1c6b838968b70f43b5d17a6a22~-qVQ4Ehfs0791607916epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783330156;
	bh=sjT0IPTOSn0u4yhDDfauttQeuJn0RC/0VaE+UuyEXj8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=j++VBWBhnPEuL2ixP8Z9/x0vzAQanKeP4q8cPRvVdhzWZAj38aSQlgq0DrhKHH6Gw
	 F2OP5kZmTqKeArm4W/2KCMJ8SiL/m1F7cG87Sxe6T4aKSwRBVn1evFAl9yEceKI2HH
	 oELOpfNQhoxEORPnr49kS99EoN9jtLWi4X6LEYo4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260706092916epcas5p3dcc9ed7dd654e31eb3153e8b9e85a0c5~-qVQeksJF1289612896epcas5p3r;
	Mon,  6 Jul 2026 09:29:16 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gtzZg1Ndpz6B9m7; Mon,  6 Jul
	2026 09:29:15 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260706092914epcas5p3c6fc7bffadde0ddf98eb47901ad2c054~-qVPDW91r1295312953epcas5p3W;
	Mon,  6 Jul 2026 09:29:14 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260706092911epsmtip173548a58b163e9246f115ae93d774359~-qVMJ2vGD1965019650epsmtip1V;
	Mon,  6 Jul 2026 09:29:11 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Ivaylo Ivanov'" <ivo.ivanov.ivanov1@gmail.com>, <krzk@kernel.org>,
	<peter.griffin@linaro.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linusw@kernel.org>
Cc: <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<hajun.sung@samsung.com>
In-Reply-To: <c0e3a874-0d9b-4fc7-bfe9-23ad9d339918@gmail.com>
Subject: RE: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
Date: Mon, 6 Jul 2026 14:59:09 +0530
Message-ID: <0a0101dd0d29$e8d50e00$ba7f2a00$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIex+rgVwEhIQu0sswQMAVV+431vwFQlI8kAbGHTCcCTSL4ewKR0wgKAm/gYqC1iizCYA==
Content-Language: en-us
X-CMS-MailID: 20260706092914epcas5p3c6fc7bffadde0ddf98eb47901ad2c054
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
	<08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com>
	<c0e3a874-0d9b-4fc7-bfe9-23ad9d339918@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39506-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:from_mime,samsung.com:email,samsung.com:mid,samsung.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2683470F183



> -----Original Message-----
> From: Ivaylo Ivanov <ivo.ivanov.ivanov1=40gmail.com>
> Sent: Monday, July 6, 2026 1:27 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; krzk=40kernel.org;
> peter.griffin=40linaro.org; robh=40kernel.org; conor+dt=40kernel.org;
> linusw=40kernel.org
> Cc: linux-samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org;
> hajun.sung=40samsung.com
> Subject: Re: =5BPATCH v3 1/6=5D dt-binding: ARM: samsung: Add Samsung
> Exynos8855
>=20
> On 7/6/26 6:44 AM, Alim Akhtar wrote:
> > Hi Ivaylo,
> > Thanks for your review.
>=20
> No problem :D
>=20
> >
> >> -----Original Message-----
> >> From: Ivaylo Ivanov <ivo.ivanov.ivanov1=40gmail.com>
> >> Sent: Monday, July 6, 2026 4:11 AM
> >> To: Alim Akhtar <alim.akhtar=40samsung.com>; krzk=40kernel.org;
> >> peter.griffin=40linaro.org; robh=40kernel.org; conor+dt=40kernel.org;
> >> linusw=40kernel.org
> >> Cc: linux-samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.or=
g;
> >> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org;
> >> hajun.sung=40samsung.com
> >> Subject: Re: =5BPATCH v3 1/6=5D dt-binding: ARM: samsung: Add Samsung
> >> Exynos8855
> >>
> >> On 6/27/26 20:12, Alim Akhtar wrote:
> >>> Add Samsung Exynos8855 smdk board to documentation
> >>>
> >>> Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> >>> ---
> >>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     =7C 6 ++=
++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> index 753b3ba1b607..273464400477 100644
> >>> ---
> >>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-
> >> boards.yam
> >>> +++ l
> >>> =40=40 -235,6 +235,12 =40=40 properties:
> >>>                - winlink,e850-96                 =23 WinLink E850-96
> >>>            - const: samsung,exynos850
> >>>
> >>> +      - description: Exynos8855 based boards
> >>> +        items:
> >>> +          - enum:
> >>> +              - samsung,exynos8855-smdk         =23 Samsung SMDK
> >>> +          - const: samsung,exynos8855
> >>
> >> Is there any particular reason for using =22exynos8855=22 rather than =
the
> >> commercial name - exynos1580? We've already established using the
> >> latter naming scheme as a convention (e.g. exynos3830 -> exynos850,
> >> exynos9830 ->
> >> exynos990) rather than the development model numbers, so I don't
> >> think breaking that will help anyone with the already painful model nu=
mber
> confusion.
> >>
> > The reason for using Exynos8855 is that it comes from the chip-id regis=
ter,
> which is RO register.
> > And in my opinion it has to be chip-id, maintaining two names is confus=
ing (as
> you also mentioned).
>=20
> I see your point but I'm not sure whether exynos-based platforms like ten=
sors
> will follow this. Afaik GS101's development name is e9845. So there likel=
y will
> still be some deviation.
>=20
Hmm...I would say, those are custom SoCs (of course based on Exynos as base=
 platform) and they don=E2=80=99t=20carry=20=22Exynos=22=0D=0Ain=20their=20=
nomenclature,=20like=20GS101,=20or=20Artpec=20and=20many=20more...=20=0D=0A=
However=20Exynos8855=20and=20other=20SoCs=20in=20this=20family=20are=20nati=
ve=20Exynos=20SoCs.=0D=0ASo=20for=20Exynos=20SoCs=20(exception=20850,=20990=
),=20let's=20have=20chip-id=20based=20nomenclature=20as=20a=20standard,=20t=
hat's=20what=20I=20am=20thinking,=20it=20is=20easy=20to=20maintain=20that=
=20way.=20=0D=0A=0D=0A>=20It's=20not=20really=20a=20fatal=20thing,=20just=
=20a=20nit=20imo=20because=20all=20bindings=20will=20have=20to=20follow=0D=
=0A>=20that=20for=20the=20upstreamed=20SoC,=20so=20non-revertable.=20But=20=
if=20maintainers=20are=20okay=20with=0D=0A>=20this,=20I'm=20happy=20to=20st=
art=20using=20chip-id=20names=20for=20future=20contributions=20too.=0D=0A>=
=20=0D=0AThank=20you,=20Looking=20forward=20for=20more=20contributions,=20n=
o=20need=20to=20revert=20what=20is=20merged=20already.=20=0D=0A=0D=0A>=20Be=
st=20regards,=0D=0A>=20Ivaylo=0D=0A>=20=0D=0A>=20>=20Yes,=20there=20were=20=
couple=20of=20deviation=20but=20let's=20come=20back=20to=20the=20=22origina=
l=22=0D=0A>=20convention=20(which=20is=20to=20use=20chip-id).=0D=0A>=20>=0D=
=0A>=20>=20=40=20Krzysztof,=20Peter=0D=0A>=20>=20Any=20input=20on=20this?=
=0D=0A>=20>=0D=0A>=20>>=20Best=20regards,=0D=0A>=20>>=20Ivaylo=0D=0A>=20>>=
=0D=0A>=20>>>=20+=0D=0A>=20>>>=20=20=20=20=20=20=20=20-=20description:=20Ex=
ynos8895=20based=20boards=0D=0A>=20>>>=20=20=20=20=20=20=20=20=20=20items:=
=0D=0A>=20>>>=20=20=20=20=20=20=20=20=20=20=20=20-=20enum:=0D=0A>=20>=0D=0A=
>=20>=0D=0A=0D=0A=0D=0A

