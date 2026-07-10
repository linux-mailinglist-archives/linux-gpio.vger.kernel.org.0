Return-Path: <linux-gpio+bounces-39804-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zI4UGM7BUGpw4gIAu9opvQ
	(envelope-from <linux-gpio+bounces-39804-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 11:56:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59D7394FF
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 11:56:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=XxL419zM;
	dmarc=pass (policy=none) header.from=samsung.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39804-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39804-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AC503020FFC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 09:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6A43FBED8;
	Fri, 10 Jul 2026 09:56:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300843FAE0C
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 09:56:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677371; cv=none; b=CLZqxA8Zlfdoy1hAD0RpTsNTlKrcdNCQEMzVplI5ELZMUDJoRC6rukqb1xaYrerub2O3RqoYQY986a7S2c8nj4DP894jmHSFTSazzMFFySAW/Pkd/ItiKkClZxHKV9VEXOT1QfEvPmP7lainO3FAgt/Uo8buYmmMI/NZWDER27E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677371; c=relaxed/simple;
	bh=B3VU4yJiypPcN5IOxk0Ji0Cz6QjkMxN92TfqPAqYXcc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=lYyfOkWa95MDqOYqi08nOgm8Gbm18HgzgJ9PuiRw5FUQvZ4bMAOltIXeqCu/Q6xRPXqnZERH545Q6FVKUmN+R97QhXI+os5s++B8KrTCcqGgCmFgcoxouBh6qTvSxrM/SjEpiA41yV4SDdfWHogQAO9KGw4BtWPhOUHMI0DVoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XxL419zM; arc=none smtp.client-ip=203.254.224.34
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260710095559epoutp04ad9795f9d2eaa04413d01d844a211b32~A5Ruxx0gg1456814568epoutp04O
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 09:55:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260710095559epoutp04ad9795f9d2eaa04413d01d844a211b32~A5Ruxx0gg1456814568epoutp04O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783677359;
	bh=8vAKTnmdmvmDA1Ji9vn6HcRCE7MwnlpFhJBq71EW0FY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=XxL419zMc9u7ltGjbVEM2cBn1NvUNjNB3ocsZk2M73L7wixtQhd2OaEmGRhb1Mwq6
	 eukaAtTV0oohx7p5a5Ory9sX3M59g3e8i8bDF0H3CVBS84oV9xst0a3543vHqdRILE
	 9dE9MXXKlqtdVZPbqsk3L8Jlzyoaead1OkQ2V0E0=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260710095558epcas5p21f700629a4fd59103c125552625cb9d1~A5RuO9rFU2279422794epcas5p24;
	Fri, 10 Jul 2026 09:55:58 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.86]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4gxRzd6cFjz6B9m8; Fri, 10 Jul
	2026 09:55:57 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260710095557epcas5p3d8f4859aa37f6b868f937233f72ad4a9~A5Rs2Pu851894318943epcas5p3C;
	Fri, 10 Jul 2026 09:55:57 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260710095556epsmtip1449243a9c0c08a8f924b7b1eded2af93~A5Rrgdz121520515205epsmtip1P;
	Fri, 10 Jul 2026 09:55:55 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>
Cc: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linusw@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <hajun.sung@samsung.com>
In-Reply-To: <CADrjBPqYSTDExrBrYYf2z=23Ci8VqF9zXvbc+njDm1d4Ojrjrg@mail.gmail.com>
Subject: RE: [PATCH v3 5/6] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
Date: Fri, 10 Jul 2026 15:25:54 +0530
Message-ID: <14cf01dd1052$4de88670$e9b99350$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQCQM7wiCxtRwyhZTDec7lkhalOHFwIex+rgAd5cQHMByjDVPrjSAgjg
Content-Language: en-us
X-CMS-MailID: 20260710095557epcas5p3d8f4859aa37f6b868f937233f72ad4a9
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39804-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,samsung.com:dkim,samsung.com:mid,samsung.com:from_mime,samsung.com:url,samsung.com:email];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:peter.griffin@linaro.org,m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: CC59D7394FF



> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Thursday, July 9, 2026 7:20 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>
> Cc: krzk=40kernel.org; robh=40kernel.org; conor+dt=40kernel.org;
> linusw=40kernel.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; hajun.sung=40samsung.com
> Subject: Re: =5BPATCH v3 5/6=5D arm64: dts: exynos: add initial support f=
or Samsung
> Exynos8855 smdk
>=20
> On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar=40samsung.com> wro=
te:
> >
> > Add initial devicetree support for Samsung smdk board using
> > Exynos8855 SoC.
> > This SoC has Octa-core CPU with tri cluster architecture, a custom GPU
> > and a NPU supporting up to 14.7 TOPS apart from other supporting
> > peripheral and IPs.
> >
> > Commercially this SoC is also known as Exynos1580 =5B1=5D
> >
> > =5B1=5D
> > https://semiconductor.samsung.com/processor/mobile-processor/exynos-15
> > 80/
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > ---
> >  arch/arm64/boot/dts/exynos/Makefile           =7C   1 +
> >  .../boot/dts/exynos/exynos8855-pinctrl.dtsi   =7C 574 ++++++++++++++++=
++
> >  .../arm64/boot/dts/exynos/exynos8855-smdk.dts =7C  32 +
> >  arch/arm64/boot/dts/exynos/exynos8855.dtsi    =7C 204 +++++++
> >  4 files changed, 811 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> >  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> >  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
> > +       =7D;
=5Bsnip=5D
> > +
> > +       oscclk: clock-oscclk =7B
> > +               compatible =3D =22fixed-clock=22;
> > +               clock-output-names =3D =22oscclk=22;
> > +               =23clock-cells =3D <0>;
> > +       =7D;
>=20
> Small nit, but I believe oscclk node should be ordered alpha-numerically =
by the
> node name. See https://docs.kernel.org/devicetree/bindings/dts-coding-
> style.html
>=20
Thanks, will update in v4=20

> Peter
>=20


