Return-Path: <linux-gpio+bounces-39099-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k3OqIs86QmpO2QkAu9opvQ
	(envelope-from <linux-gpio+bounces-39099-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 11:28:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E89766D834A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 11:28:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=vOylTQL+;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39099-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39099-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 233A430315CD
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jun 2026 09:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A0D3F9288;
	Mon, 29 Jun 2026 09:23:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42046BE63
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 09:23:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782725010; cv=none; b=NfpRySdCRiAY7jmeWcc23fh18EnpDhU0z2gJtiiujl0qLAJ8xUb3Ooji2NFoDm+9Oj1mN/ytUVRJH0I1KHZigrNMRUkZJwMn1aFoTZuY0TijuJqqEOrvZdDiKXFSVrfbJqjP1N+GaoUYD/PLJwRN6/Xnu64qB83FC+FApX2CpQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782725010; c=relaxed/simple;
	bh=QkEEiADwAVpFN+OWtSTqn9ldkcCnp9NTLwAkmsmy2VI=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=eQyr88BZWyQFWEYziGq4n8WZWBfiuN7DmBFCvY7gzx56SSpHHQj/Nu8NiIs6fY9Gd6XIj2K5QrNo1zlbyIBiqGLAOfCsSMeQNlCm3IF/bzzXynmy2iqVjQXLw7Ei8BYt7mcjqyg5U9ZEc/MoUh/LEJJy56EfzzaDtxH+zThwHeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vOylTQL+; arc=none smtp.client-ip=203.254.224.34
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260629092320epoutp04371003b1dcc7f5c87f15f2beae4597fa~9gvE5_KoV0069900699epoutp04G
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jun 2026 09:23:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260629092320epoutp04371003b1dcc7f5c87f15f2beae4597fa~9gvE5_KoV0069900699epoutp04G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782725000;
	bh=no4d9D62wGD6q8nT4wtCHAMErmb+Fb5FN/Jb/bKiHW0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vOylTQL+lmRoXTIWQQT7soH5X1LGKFOSynlUyEYTQwIiV0wVo7e50wtwfRdLKDkRW
	 qmX/MXulpam1uP4ZKEKFyqpD6H7WyUNKuQYeptK6+FfcoFbHhzTYt//SSIF/MxygrB
	 uL3RoNYcIGA0VLGvWcZ9MnZzKRqdZL5g6sdEu3vQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260629092319epcas5p2c79999ceb939cdcbb9a846c23183d453~9gvEVcFL11996019960epcas5p2O;
	Mon, 29 Jun 2026 09:23:19 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4gpgn21yBlz3hhT7; Mon, 29 Jun
	2026 09:23:18 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260629092317epcas5p18b01064644f8ce94f638cd8fe906f541~9gvCzuR9O0475904759epcas5p1x;
	Mon, 29 Jun 2026 09:23:17 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260629092315epsmtip161f615b52140b2ecd44769e198d44f75~9gvAgDcAF1476314763epsmtip1b;
	Mon, 29 Jun 2026 09:23:15 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Youngmin Nam'"
	<youngmin.nam@samsung.com>
Cc: <krzk@kernel.org>, <s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<semen.protsenko@linaro.org>, <ivo.ivanov.ivanov1@gmail.com>,
	<ryu.real@samsung.com>, <d7271.choe@samsung.com>, <shin.son@samsung.com>,
	<jaewon02.kim@samsung.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <CADrjBPqYT9h_UJKSxBJ_KMQ4yQv4yyTuHaPYjC+K1-6TZj+PXg@mail.gmail.com>
Subject: RE: [PATCH v3 2/5] pinctrl: samsung: fix incorrect pin-bank entries
 on Exynos2200/7885/8890/8895
Date: Mon, 29 Jun 2026 14:53:13 +0530
Message-ID: <0e6201dd07a8$eb5884d0$c2098e70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIr5xjB9BZkcy1LV54fp2FD5N/QnAF3wuMlAatK81MBmh+d8rWRk0XQ
Content-Language: en-us
X-CMS-MailID: 20260629092317epcas5p18b01064644f8ce94f638cd8fe906f541
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba
References: <CGME20251202093027epcas2p24adbd3226dd50b2780baceee6588f3ba@epcas2p2.samsung.com>
	<20251202093613.852109-1-youngmin.nam@samsung.com>
	<20251202093613.852109-3-youngmin.nam@samsung.com>
	<CADrjBPqYT9h_UJKSxBJ_KMQ4yQv4yyTuHaPYjC+K1-6TZj+PXg@mail.gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-39099-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peter.griffin@linaro.org,m:youngmin.nam@samsung.com,m:krzk@kernel.org,m:s.nawrocki@samsung.com,m:linus.walleij@linaro.org,m:semen.protsenko@linaro.org,m:ivo.ivanov.ivanov1@gmail.com,m:ryu.real@samsung.com,m:d7271.choe@samsung.com,m:shin.son@samsung.com,m:jaewon02.kim@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ivoivanovivanov1@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,samsung.com,linaro.org,gmail.com,lists.infradead.org,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,linaro.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,samsung.com:dkim,samsung.com:email,samsung.com:mid,samsung.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E89766D834A

Hi Krzysztof, Peter

> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Saturday, March 7, 2026 2:47 AM
> To: Youngmin Nam <youngmin.nam=40samsung.com>
> Cc: krzk=40kernel.org; s.nawrocki=40samsung.com; alim.akhtar=40samsung.co=
m;
> linus.walleij=40linaro.org; semen.protsenko=40linaro.org;
> ivo.ivanov.ivanov1=40gmail.com; ryu.real=40samsung.com;
> d7271.choe=40samsung.com; shin.son=40samsung.com;
> jaewon02.kim=40samsung.com; linux-arm-kernel=40lists.infradead.org; linux=
-
> samsung-soc=40vger.kernel.org; linux-gpio=40vger.kernel.org; linux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH v3 2/5=5D pinctrl: samsung: fix incorrect pin-bank =
entries on
> Exynos2200/7885/8890/8895
>=20
> Hi Youngmin,
>=20
> On Tue, 2 Dec 2025 at 09:30, Youngmin Nam
> <youngmin.nam=40samsung.com> wrote:
> >
> > This patch corrects wrong pin bank table definitions for 4 SoCs based
> > on their TRMs.
> >
> > Exynos2200
> > - gpq0/1/2 were using EXYNOS_PIN_BANK_EINTN(), which implies a
> >   'bank_type_off' layout (.fld_width =3D =7B4,1,2,2,2,2=7D).
> > - Per the SoC TRM these banks must use the 'alive' layout
> >   (.fld_width =3D =7B4,1,4,4=7D).
> > - Switch them to
> EXYNOS9_PIN_BANK_EINTN(exynos9_bank_type_alive, ...).
> >
> > Exynos7885
> > - etc0, etc1: update bank type to match the SoC TRM.
> > - gpq0 is a non-wakeup interrupt bank; change EINTW -> EINTN accordingl=
y.
> >
> > Exynos8890
> > - Per the SoC TRM, rename bank ect0 to gpb3 and mark it as
> >   a non-external interrupt bank.
> > - gpi1, gpi2: update bank type to match the SoC TRM.
> >   exynos8895_bank_type_off (.fld_width =3D =7B4,1,2,3,2,2=7D) ->
> >   exynos5433_bank_type_off (.fld_width =3D =7B4,1,2,4,2,2=7D)
> > - Per the SoC TRM, mark etc1 as a non-external interrupt bank.
> > - apply lower case style for hex numbers.
> >
> > Exynos8895
> > - gpa4 is a non-wakeup interrupt bank per the SoC TRM.
> >   change EINTW -> EINTN. (The bank_type itself was correct and is kept
> >   unchanged.)
> > - apply lower case style for hex numbers.
> >
> > This aligns the pin-bank tables with the documented bitfield layouts
> > and wakeup domains. No DT/ABI change.
> >
> > Signed-off-by: Youngmin Nam <youngmin.nam=40samsung.com>
> > Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> > Reviewed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1=40gmail.com>
> > Tested-by: Sam Protsenko <semen.protsenko=40linaro.org>
> > ---
>=20
> This patch contains some worthwhile fixes for multiple Exynos SoCs. Do yo=
u
> plan to re-send it? I think it would be good to get this merged (even if =
there
> isn't broad agreement around renaming the pinctrl macros to EXYNOS9_)
>=20
Can we relook into this series?=20
AFA EXYNOS9_ macro is concern, Exynos990, Exynos9810 etc already support av=
ailable upstream.
Of course it does not justify why Exynos9, but we can consider all SoCs whi=
ch has come after 2020 have this newer architecture.=20
Or Just have SAMSUNG_ prefix for all such newer SoC.

A unified Macro help in adding new SoC support without much confusion(like =
I am trying with Exynos8855)

=40Youngmin, will you have some time to re-spin these series?

> Thanks,
>=20
> Peter


