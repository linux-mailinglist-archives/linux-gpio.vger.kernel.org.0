Return-Path: <linux-gpio+bounces-38462-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dqBPGaizL2oJEwUAu9opvQ
	(envelope-from <linux-gpio+bounces-38462-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:11:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFDB6846C9
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:11:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=EsfwaGg7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38462-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38462-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BCA83037DF6
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A4C3C0A14;
	Mon, 15 Jun 2026 08:05:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F1F3C0A00
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:05:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781510708; cv=none; b=X5bi1cduIKdAUkaJ0J6iTMJLRxhXfQufYMOgJCLdcuGpXW1OnWtHtL13P7yh7sTpL73xrK6rz1lQHkyuuRMOd5nbOOxPzrWf/4zN2vDl2OvKBCSurA2dEumc3OILKsoRq4IDY2eLDiH+eWa1IkB2tG1rdwGLEuqievfIGEPbuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781510708; c=relaxed/simple;
	bh=bVx/jDOnt13llMcfjd60CLseSlZQWqaWHYeakaAMc2o=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=fl+OcfA6nZxPE5ifw495ianC0LeEj8uYG/AuWh2seJssI7/nR8Le+/jrpavAueN3yqKx+mhKrsNCTnZzSYw6D1fpI9zCuhPZxP3xEq4csP6p851/+tHvCkfoeGxplyBIDHqfIQh0euu6H4TBbc8hLU9R/AdroRNpydZNHcuLDu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=EsfwaGg7; arc=none smtp.client-ip=203.254.224.24
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260615080503epoutp01621482cb1b88c70b62e2136cde1dc1b3~5MovTR2wX2856928569epoutp01M
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:05:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260615080503epoutp01621482cb1b88c70b62e2136cde1dc1b3~5MovTR2wX2856928569epoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781510703;
	bh=bVx/jDOnt13llMcfjd60CLseSlZQWqaWHYeakaAMc2o=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=EsfwaGg7L457+s8ZLYeYh+NjeERFnLEzWdTsQH/8UCb4LBiNJed0NJzKJMnjb86up
	 nKhKcIqzK5oyQGHrcs00v9i/69YBuNn/yo94jLm2ykLYS1MVUehXZsS3SFwr6Vb2n6
	 h0UOM+Ij9jMkasfEa/80JxGlkdT2khMIoe0OUPZA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260615080503epcas5p35553994bb8f7d3be24c29516080ec968~5Mou6Loct0252002520epcas5p3-;
	Mon, 15 Jun 2026 08:05:03 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gf2jB3gCtz6B9m7; Mon, 15 Jun
	2026 08:05:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260615080502epcas5p42e70f43116e861807a0527998adf8be3~5MottcCXy1008610086epcas5p45;
	Mon, 15 Jun 2026 08:05:02 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260615080500epsmtip2369c86913d9268e10c98c53ab6a139b9~5MosXefMD1575515755epsmtip2D;
	Mon, 15 Jun 2026 08:05:00 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Linus Walleij'" <linusw@kernel.org>
Cc: <krzk@kernel.org>, <peter.griffin@linaro.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <hajun.sung@samsung.com>
In-Reply-To: <CAD++jL=mQUJCqVyqK746UdkZCsO+2oeO1MCQM4F-_pSOfpuQuA@mail.gmail.com>
Subject: RE: [PATCH 5/5] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
Date: Mon, 15 Jun 2026 13:34:59 +0530
Message-ID: <007a01dcfc9d$aa94dd60$ffbe9820$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJYum4ZwFB4G57e/mAdy9OEA4w1FQFdc8KuAafn3wwBg/tdALUjd9ag
Content-Language: en-us
X-CMS-MailID: 20260615080502epcas5p42e70f43116e861807a0527998adf8be3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8
References: <CGME20260612161148epcas5p33904df90bd840d20a6db05622aaa28b8@epcas5p3.samsung.com>
	<20260612163020.411761-1-alim.akhtar@samsung.com>
	<20260612163020.411761-6-alim.akhtar@samsung.com>
	<CAD++jL=mQUJCqVyqK746UdkZCsO+2oeO1MCQM4F-_pSOfpuQuA@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38462-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,infradead.org:email,samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CEFDB6846C9

Thanks Linus for your review

> -----Original Message-----
> From: Linus Walleij <linusw=40kernel.org>
> Sent: Monday, June 15, 2026 12:51 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>
> Cc: krzk=40kernel.org; peter.griffin=40linaro.org; robh=40kernel.org;
> conor+dt=40kernel.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; hajun.sung=40samsung.com
> Subject: Re: =5BPATCH 5/5=5D MAINTAINERS: Add entry for Samsung Exynos885=
5
> SoC
>=20
> Hi Alim,
>=20
> On Fri, Jun 12, 2026 at 6:11=E2=80=AFPM=20Alim=20Akhtar=20<alim.akhtar=40=
samsung.com>=0D=0A>=20wrote:=0D=0A>=20=0D=0A>=20>=20Add=20maintainers=20ent=
ry=20for=20the=20Samsung=20Exynos8855=20SoC=20based=20platforms=0D=0A>=20>=
=0D=0A>=20>=20Signed-off-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=
=0D=0A>=20(...)=0D=0A>=20>=20+SAMSUNG=20EXYNOS8855=20SoC=20SUPPORT=0D=0A>=
=20>=20+M:=20=20=20=20=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=0D=0A>=
=20>=20+L:=20=20=20=20=20linux-arm-kernel=40lists.infradead.org=20(moderate=
d=20for=20non-=0D=0A>=20subscribers)=0D=0A>=20>=20+L:=20=20=20=20=20linux-s=
amsung-soc=40vger.kernel.org=0D=0A>=20>=20+S:=20=20=20=20=20Maintained=0D=
=0A>=20>=20+F:=20=20=20=20=20arch/arm64/boot/dts/exynos/exynos8855*=0D=0A>=
=20=0D=0A>=20If=20you=20really=20want=20to=20single=20out=20a=20single=20pl=
atform=20like=20this=20(and=20I=20don't=20even=0D=0A>=20know=20if=20that=20=
is=20a=20good=20idea...=20how=20do=20you=20keep=20the=20big=20picture=20in=
=20mind?)=20you=0D=0A>=20should=20probably=20want=20to=20also=20add=20a=20w=
ildcard=20for=20all=20the=0D=0A>=208855=20device=20tree=20files.=0D=0A>=20=
=0D=0AI=20am=20also=20not=20sure,=20just=20followed=20what=20was=20done=20h=
istorically,=20other=20Exynos8855=20file=20will=20get=20added=20once=20they=
=0D=0Aare=20posted=20for=20review,=20e.g.=20clock=20driver.=0D=0ALet=20me=
=20discuss=20with=20Krzk=20during=20OSS=20(Mumbai)=20and=20see=20how=20do=
=20we=20handle=20this=20or=20any=20other=20better=20ways.=0D=0A=0D=0A=0D=0A=
>=20Yours,=0D=0A>=20Linus=20Walleij=0D=0A=0D=0A

