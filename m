Return-Path: <linux-gpio+bounces-38616-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dfeOIO0yMmqDwgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38616-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 07:38:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BAB696A00
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 07:38:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=N9sqzBRZ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38616-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38616-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 654CC3007B94
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2026 05:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50ACF3A0E85;
	Wed, 17 Jun 2026 05:38:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB43955EF
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 05:38:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781674729; cv=none; b=OS+5kmAMlvuVeR9PASYV5IbkiMmzU2YgPuLPjwq7TTnn1ZUhZcaU4EREhDpQYml/nQapdbpMbV+6aa2iQbeyuOLURmgAnmJqEP5FRu2RAns5X4ahiG5Fl7S1tnB5cbnqOzyObk5FyY4tFjIPSo8Y9FOokJogjXew+UCFaJJINMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781674729; c=relaxed/simple;
	bh=OaPq1O6MDi4D4DBxtibKpqpzzKzkQkUrys3yKPAAve0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=GtgsDp1fmKITMHY6qZ6AangQj2toJlJkPDTAEO4S1Jljuf0tp/mqsaNpm6Ro2374Bx5GWfusJzbwPQtbMG9sXTwby241b2wwbKRAdL8H+XOZIsVdqtufuY7scmw5c9mexDwo5ktY5PUSLsAjHquxlDNWSQfGZs2gtBX6GdVJ+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=N9sqzBRZ; arc=none smtp.client-ip=203.254.224.34
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260617053840epoutp044c8bb83855881979b81c5fedc131cbad~5x7f-pkGj0439404394epoutp04Z
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jun 2026 05:38:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260617053840epoutp044c8bb83855881979b81c5fedc131cbad~5x7f-pkGj0439404394epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781674720;
	bh=Gz8vQff29nJELzRfscuT7CueAARMLh0cyeZkCiiSr9I=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=N9sqzBRZvAObe2N2iBfNxxc6FEVNlpfA/HjvruBFJVejYhNIDiWZWPyZzcwt87CeB
	 qYp1fIJN2/gWC3qAMK5lJkTQMkMycbGNQ9Oho36sy17laEIZBa43pctPjE5GmkYNPx
	 992T1Rtl2f2aAhg1vxuXbQphDZUYW+uzM2eXMKrA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260617053840epcas5p211ca33c9accb62c6e82a923adbd66dd6~5x7fo5yiQ2670226702epcas5p2X;
	Wed, 17 Jun 2026 05:38:40 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ggCMM23frz6B9m6; Wed, 17 Jun
	2026 05:38:39 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260617053838epcas5p19d736449ed87012bdca788003f4e4496~5x7eKNwiK0232302323epcas5p1Z;
	Wed, 17 Jun 2026 05:38:38 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260617053837epsmtip212052e3ec7bf5298bf926d28ed7571c9~5x7c0ZYLt0897908979epsmtip2W;
	Wed, 17 Jun 2026 05:38:37 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>
Cc: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<linusw@kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <hajun.sung@samsung.com>
In-Reply-To: <CADrjBPpyNymPXtYgdeOGtp1KDkdp9gTrBAEcJR89B+wwF8uUXw@mail.gmail.com>
Subject: RE: [PATCH v2 3/5] pinctrl: samsung: Add Exynos8855 pinctrl
 configuration
Date: Wed, 17 Jun 2026 11:08:35 +0530
Message-ID: <008d01dcfe1b$8c538c50$a4faa4f0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGWEf5gFzfJqjC43hWcQDFMYsOTVAGT6tp2AP5oUIcBL72Cmrax/7Ng
Content-Language: en-us
X-CMS-MailID: 20260617053838epcas5p19d736449ed87012bdca788003f4e4496
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260615083423epcas5p3acec08339e81e2d276d7953b3c6ee51a
References: <CGME20260615083423epcas5p3acec08339e81e2d276d7953b3c6ee51a@epcas5p3.samsung.com>
	<20260615085252.1964423-1-alim.akhtar@samsung.com>
	<20260615085252.1964423-4-alim.akhtar@samsung.com>
	<CADrjBPpyNymPXtYgdeOGtp1KDkdp9gTrBAEcJR89B+wwF8uUXw@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-38616-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[alim.akhtar@samsung.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:peter.griffin@linaro.org,m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 17BAB696A00



> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Monday, June 15, 2026 7:45 PM
> To: Alim Akhtar <alim.akhtar=40samsung.com>
> Cc: krzk=40kernel.org; robh=40kernel.org; conor+dt=40kernel.org;
> linusw=40kernel.org; linux-samsung-soc=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; hajun.sung=40samsung.com
> Subject: Re: =5BPATCH v2 3/5=5D pinctrl: samsung: Add Exynos8855 pinctrl
> configuration
>=20
> Hi Alim,
>=20
> Thanks for your patch. It's great to see more Exynos SoCs being supported=
=21
>=20
Thanks Peter, more patches to follow.

> On Mon, 15 Jun 2026 at 09:34, Alim Akhtar <alim.akhtar=40samsung.com>
> wrote:
> >
> > Add pinctrl configuration for Exynos8855. The bank type macros are
> > reused from Exynos850 SoC.
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > ---
> >  .../pinctrl/samsung/pinctrl-exynos-arm64.c    =7C 123 ++++++++++++++++=
++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c     =7C   2 +
> >  drivers/pinctrl/samsung/pinctrl-samsung.h     =7C   1 +
> >  3 files changed, 126 insertions(+)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > index fe9f92cb037e..db120ae4d847 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> > =40=40 -943,6 +943,129 =40=40 const struct samsung_pinctrl_of_match_dat=
a
> exynos850_of_data __initconst =3D =7B
> >         .num_ctrl       =3D ARRAY_SIZE(exynos850_pin_ctrl),
> >  =7D;
> >
>=20
> Are you sure you want to use E850 pinctrl macros and not the GS101 ones?
> The GS101 macros allow the fltcon offset to be specified, which I think i=
s
> required for all Exynos9 (including e850 SoC). Youngmin sent a series
> previously https://lore.kernel.org/lkml/20251202093613.852109-1-
> youngmin.nam=40samsung.com/
> fixing up some of this but it hasn't been re-spun in a while. In particul=
ar this
> patch https://lore.kernel.org/lkml/20251202093613.852109-4-
> youngmin.nam=40samsung.com/.
>=20
Thanks for pointing out, let me re-look into this, according will change.

> > +/* pin banks of exynos8855 pin-controller 0 (ALIVE) */ static const
> > +struct samsung_pin_bank_data exynos8855_pin_banks0=5B=5D __initconst =
=3D =7B
> > +       /* Must start with EINTG banks, ordered by EINT group number. *=
/
=5BSnip=5D
> > +static const struct samsung_pin_ctrl exynos8855_pin_ctrl=5B=5D __initc=
onst =3D =7B
> > +       =7B
> > +               /* pin-controller instance 0 ALIVE data */
> > +               .pin_banks      =3D exynos8855_pin_banks0,
> > +               .nr_banks       =3D ARRAY_SIZE(exynos8855_pin_banks0),
> > +               .eint_wkup_init =3D exynos_eint_wkup_init,
> > +               .eint_gpio_init =3D exynos_eint_gpio_init,
> > +       =7D, =7B
>=20
> With fltcon_offset specified, you could then use
> gs101_pinctrl_suspend/gs101_pinctrl_resume callbacks here.
>=20
Let me cross check with UM and will add accordingly.=20



