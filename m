Return-Path: <linux-gpio+bounces-39825-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nkXeH3XaUGpI6QIAu9opvQ
	(envelope-from <linux-gpio+bounces-39825-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:41:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5662F73A5B5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 13:41:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=mgJlBoez;
	dmarc=pass (policy=none) header.from=samsung.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39825-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39825-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76670305A4CE
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 11:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC2441B36C;
	Fri, 10 Jul 2026 11:38:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BCA4252C3
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 11:38:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683501; cv=none; b=qyLC7BgJMZLG+6iK0n297KRyVBk70c0izZp64ZdpuIl43faiIbTkaZlvdnFS4AWUphwO2ADLbONJH5s3XUU7CllArS9fY6wtQK2kjBACoP1rghzwbHxYuK048QUXDcSP14diU8jkgf/e5r+kNYVQz5wox5h49Hiv5efac/qCsvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683501; c=relaxed/simple;
	bh=X7pq3PyhM1o+IcurE1qdIIJe71ZzKZqVhCOunB17O7w=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=tYHA2Z7GzBZmp+HqZTIpRbEx5lT9mv3eqFrjrECpVi02YBfTYydN9OF6bp8a6rRt0kfd+PUzzG5Lbp3d/p/YkKkBRJPkoaau3zqYFwiPZ/gBbJXkyEhPzCmW/Po/bY3Qf21EYEBArJMb9pshiLkD7FaQqLM+FUW6sacjqpYhfXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=mgJlBoez; arc=none smtp.client-ip=203.254.224.34
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260710113802epoutp04e60000063d3dc9fcbb10a6f5ff6620b1~A6q1c3k-E0572305723epoutp04k
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 11:38:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260710113802epoutp04e60000063d3dc9fcbb10a6f5ff6620b1~A6q1c3k-E0572305723epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783683482;
	bh=BfsfxWnMvDHbHaU5VleFMtOa5AisCyr1aIft1Ku+Wz4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=mgJlBoezVDK93yp3oAvOl+5PQ18Edl33ssGWuA4AvO4GPIa6xarv1+gzmlffDsbCn
	 VE/oiHgUbHP/A/EA6X0OCYxy2LAP4ic59DkfjjR6M69LawDG3yTwhVFxfJW2I7AOqq
	 v75HmHzVlAKfRBMw77BqMg6C9z8uoCZCipWvZXhU=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260710113802epcas5p391861cea9a4c63274e786b6e52bad052~A6q00Vt0c2132921329epcas5p3M;
	Fri, 10 Jul 2026 11:38:02 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4gxVFP0dzGz2SSKY; Fri, 10 Jul
	2026 11:38:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260710113800epcas5p2a5461c3d10e8c69add826fc62806d6e3~A6qy-C7ya0882308823epcas5p2x;
	Fri, 10 Jul 2026 11:38:00 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260710113758epsmtip17831fbbbe17cf8bbc0feeb897f44aeee~A6qxpCEm20474004740epsmtip1f;
	Fri, 10 Jul 2026 11:37:58 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, "'Peter Griffin'"
	<peter.griffin@linaro.org>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <linusw@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<hajun.sung@samsung.com>
In-Reply-To: <54c419d0-b0cb-4add-8d74-94a40804f33e@kernel.org>
Subject: RE: [PATCH v3 5/6] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
Date: Fri, 10 Jul 2026 17:07:57 +0530
Message-ID: <152801dd1060$8f3baae0$adb300a0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQCQM7wiCxtRwyhZTDec7lkhalOHFwIex+rgAd5cQHMByjDVPgF/2VxQAn303Q8By1kGcQFci0CruJjxDHA=
Content-Language: en-us
X-CMS-MailID: 20260710113800epcas5p2a5461c3d10e8c69add826fc62806d6e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e
References: <CGME20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e@epcas5p4.samsung.com>
	<20260627171228.2687857-1-alim.akhtar@samsung.com>
	<20260627171228.2687857-6-alim.akhtar@samsung.com>
	<CADrjBPqYSTDExrBrYYf2z=23Ci8VqF9zXvbc+njDm1d4Ojrjrg@mail.gmail.com>
	<14cf01dd1052$4de88670$e9b99350$@samsung.com>
	<9eb6b0ef-cbc1-4b2f-b607-986f28ec46ee@kernel.org>
	<14e201dd1055$b7173940$2545abc0$@samsung.com>
	<54c419d0-b0cb-4add-8d74-94a40804f33e@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39825-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,samsung.com:from_mime,samsung.com:email,samsung.com:mid,samsung.com:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:peter.griffin@linaro.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5662F73A5B5



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk=40kernel.org>
> Sent: Friday, July 10, 2026 3:55 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Peter Griffin'
> <peter.griffin=40linaro.org>
> Cc: robh=40kernel.org; conor+dt=40kernel.org; linusw=40kernel.org; linux-=
samsung-
> soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org;
> hajun.sung=40samsung.com
> Subject: Re: =5BPATCH v3 5/6=5D arm64: dts: exynos: add initial support f=
or Samsung
> Exynos8855 smdk
>=20
> On 10/07/2026 12:20, Alim Akhtar wrote:
> >
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk=40kernel.org>
> >> Sent: Friday, July 10, 2026 3:30 PM
> >> To: Alim Akhtar <alim.akhtar=40samsung.com>; 'Peter Griffin'
> >> <peter.griffin=40linaro.org>
> >> Cc: robh=40kernel.org; conor+dt=40kernel.org; linusw=40kernel.org;
> >> linux-samsung- soc=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> >> devicetree=40vger.kernel.org; linux-gpio=40vger.kernel.org;
> >> hajun.sung=40samsung.com
> >> Subject: Re: =5BPATCH v3 5/6=5D arm64: dts: exynos: add initial suppor=
t
> >> for Samsung
> >> Exynos8855 smdk
> >>
> >> On 10/07/2026 11:55, Alim Akhtar wrote:
> >>>>> ---
> >>>>>  arch/arm64/boot/dts/exynos/Makefile           =7C   1 +
> >>>>>  .../boot/dts/exynos/exynos8855-pinctrl.dtsi   =7C 574
> ++++++++++++++++++
> >>>>>  .../arm64/boot/dts/exynos/exynos8855-smdk.dts =7C  32 +
> >>>>>  arch/arm64/boot/dts/exynos/exynos8855.dtsi    =7C 204 +++++++
> >>>>>  4 files changed, 811 insertions(+)  create mode 100644
> >>>>> arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> >>>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> >>>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
> >>>>> +       =7D;
> >>> =5Bsnip=5D
> >>>>> +
> >>>>> +       oscclk: clock-oscclk =7B
> >>>>> +               compatible =3D =22fixed-clock=22;
> >>>>> +               clock-output-names =3D =22oscclk=22;
> >>>>> +               =23clock-cells =3D <0>;
> >>>>> +       =7D;
> >>>>
> >>>> Small nit, but I believe oscclk node should be ordered
> >>>> alpha-numerically by the node name. See
> >>>> https://docs.kernel.org/devicetree/bindings/dts-coding-
> >>>> style.html
> >>>>
> >>> Thanks, will update in v4
> >>
> >>
> >> The node feels ordered, no? clock before cpu?
> >>
> > Right, =22 ordered alpha-numerically by the node name=22
> >
> > Krzysztof, do you want to send v4 with all the reviewed-by tag collecte=
d?
>=20
> No need, there are no changes planned, right? I just give it a day or two=
 if Peter
> or someone wants to review this one in such case.
>=20
Sure, no changes for now.=20
Thanks=21

> Best regards,
> Krzysztof


