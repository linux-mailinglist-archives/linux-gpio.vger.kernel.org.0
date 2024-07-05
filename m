Return-Path: <linux-gpio+bounces-8071-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6614B928893
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 14:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 882111C20DDC
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jul 2024 12:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5201414A4EB;
	Fri,  5 Jul 2024 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PvCNF/AY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9843C14A4D6
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720181877; cv=none; b=lcozxLJW6BO54dotrCy71hkT+OZs00JuFTb6tTN5d+fCsVuDB5tsn6GWzJQUC9zlan84NHl/SP/NoBn7YrKIz9k52/tpt4KKoiuIHCCn+gxhlRLATkAcpCFJxqZgMMkXihNLsjTkLSzjtL+xX13JO2ELftpX+T39xV2UFVNhRvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720181877; c=relaxed/simple;
	bh=5myUzlNWSQ47ctpeo7xpumA5G4blaQK84pPHqsQ8lq8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=d0ck9QruS7F63L0PAdmwlg98CEJU96sMZZ6oFikywzLgiGOiY9tEwCeZx2s9kSSaSDY9n6l3r7ZzFc+/OkeoQqom2N9gu/6+zbrCp4iYqX9+6Lv0tJyxhTyM+YXBMqI4sM+5USgN9mRDJx1PxXTOJ0OlTi8ch23T5u4fx7Bhhjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PvCNF/AY; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20240705121749epoutp04a9a8f472c3642fe0b15b2ecd8bd0204d~fUEvwyvet1457314573epoutp04T
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jul 2024 12:17:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20240705121749epoutp04a9a8f472c3642fe0b15b2ecd8bd0204d~fUEvwyvet1457314573epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1720181869;
	bh=dpGHo0GNqlJ/jMZ378zxGP91I0O9HD+XoLpkx6S31oU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=PvCNF/AYvnW6EbXu3/ULJ09PdLX9ghqAfD7589/UbfpxfzgNtYGvePpacmtTwekIo
	 GLNgsswKTUMeZ728IvnaJ0M/2R5WHmEJBI2NPlx9uyr+l5IO6fp7kJl3BECiHUbIGL
	 VsoFXuktYbe+0p14Nbx4TYmBg2BUfyXkfoDOMisU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20240705121749epcas5p3cb0af333adf5ab0c88d3ded6c3a2a6ed~fUEvehNVb3263432634epcas5p30;
	Fri,  5 Jul 2024 12:17:49 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.175]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4WFswW5bkLz4x9Pp; Fri,  5 Jul
	2024 12:17:47 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	B7.10.06857.B64E7866; Fri,  5 Jul 2024 21:17:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20240705115932epcas5p24f8d21daeec52d4a0c871bb12c9781ea~fT0x1hXwR1136911369epcas5p2b;
	Fri,  5 Jul 2024 11:59:32 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240705115932epsmtrp2fcf609ef3a079389d6451f840a34f0ed~fT0x0uFM_2038120381epsmtrp2m;
	Fri,  5 Jul 2024 11:59:32 +0000 (GMT)
X-AuditID: b6c32a4b-ae9fa70000021ac9-d8-6687e46b4f4d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4D.A3.29940.420E7866; Fri,  5 Jul 2024 20:59:32 +0900 (KST)
Received: from FDSFTE582 (unknown [107.122.82.121]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240705115930epsmtip2f281f1b9b6680d7583df84ebb202b3b9~fT0wLNf4l2405724057epsmtip2q;
	Fri,  5 Jul 2024 11:59:30 +0000 (GMT)
From: "Vishnu Reddy" <vishnu.reddy@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
	<s.nawrocki@samsung.com>, <alim.akhtar@samsung.com>,
	<linus.walleij@linaro.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>, <gost.dev@samsung.com>
In-Reply-To: <4781d95e-a44c-423b-97b6-973c1826a1ab@linaro.org>
Subject: RE: [PATCH v3] pinctrl: samsung: Add support for pull-up and
 pull-down
Date: Fri, 5 Jul 2024 17:29:29 +0530
Message-ID: <01cb01daced2$cbd9e600$638db200$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEXLUryvsEZTY1KBQCVEhAHxpFbTAKfUFNkAZFH5HmzTcWI4A==
Content-Language: en-in
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmlm72k/Y0g8sHNSwezNvGZnHzwE4m
	i72vt7JbTPmznMli0+NrrBab5/9htLi8aw6bxYzz+5gsFm39wm7x8MMedovDb9pZHbg97lzb
	w+axeUm9R9+WVYwenzfJBbBEZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynk
	Jeam2iq5+AToumXmAB2lpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwKdArTswt
	Ls1L18tLLbEyNDAwMgUqTMjOaLlwjrHgm1/F7Z/XWBsYdzp0MXJySAiYSPx+/JSli5GLQ0hg
	N6NE575zTBDOJ0aJ50uvQDnfGCWOPpvKDtPS9+szK0RiL6PE67VnwBJCAi8YJc7tBOrg4GAT
	0JdoviEBEhYRmMgoMe2WAkg9s8BDRomJ9z+xgiQ4Bewk5l3YBGYLCwRKLN44iRHEZhFQkfiw
	YB0zyBxeAUuJObvyQMK8AoISJ2c+YQGxmQW0JZYtfM0McY+CxM+ny1ghdjlJrJ07nRWiRlzi
	6M8eZpC9EgJbOCSObzwA9YCLxIV9s1kgbGGJV8e3QMWlJD6/28sGYSdLrP99ih3kBgmBHIme
	aQoQYXuJA1fmsICEmQU0Jdbv0ocIy0pMPbWOCWItn0Tv7ydMEHFeiR3zYGw1iWOTIE6TEJCR
	6Fxxg3ECo9IsJJ/NQvLZLCQfzELYtoCRZRWjZGpBcW56arFpgXFeajk8upPzczcxglOslvcO
	xkcPPugdYmTiYDzEKMHBrCTCK/W+OU2INyWxsiq1KD++qDQntfgQoykwtCcyS4km5wOTfF5J
	vKGJpYGJmZmZiaWxmaGSOO/r1rkpQgLpiSWp2ampBalFMH1MHJxSDUzOGteD61wX/n1z+ZNi
	1guWXZMZfzP/lT2azutiYp+qNlfTKGRvtf6ZpbO/zf0w6XFO1vG3xkKu4XUS9YFq9akXnOUF
	dnipv+s13/DVqDp/+7/oVXkHd6s4d61KP/BY7LS2o0uK+eZNZ9/KKylOnDAtsy73yjP56ufq
	5o2uijdLjWOuMrS/K9wyO9s1+LT56YsukyesXJOUpGbSZCP78dKG2CMcfJW7/7rJtm1p3nCm
	uCXHSP1Z4JovQrG59Rx9xk3ec9/fcvv1I7BuliXf9ZdbfnHEn/6hxcg5Q+i4z9GMXYY7U9+3
	ZqzcsCdmKjvz5ZyStZk269k1n9oH/ksuj02Yuav4yF+ZLye3TvM+N1mJpTgj0VCLuag4EQC5
	0XtgOgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsWy7bCSvK7Kg/Y0g7dPhC0ezNvGZnHzwE4m
	i72vt7JbTPmznMli0+NrrBab5/9htLi8aw6bxYzz+5gsFm39wm7x8MMedovDb9pZHbg97lzb
	w+axeUm9R9+WVYwenzfJBbBEcdmkpOZklqUW6dslcGXc3H2dpeCPT8WdP//YGxi323UxcnJI
	CJhI9P36zNrFyMUhJLCbUWLxn4WsEAkZiQ93tjBD2MISK/89Z4coesYocbG1CSjBwcEmoC/R
	fEMCJC4iMJlRYl9bD1gRs8BzRolNL+YxgXQLCRxklFizOxDE5hSwk5h3YRPYBmEBf4np09aB
	bWARUJH4sGAd2FBeAUuJObvyQMK8AoISJ2c+YQGxmQW0JXoftjLC2MsWvoY6TkHi59NlYCNF
	BJwk1s6dzgpRIy5x9GcP8wRG4VlIRs1CMmoWklGzkLQsYGRZxSiZWlCcm55bbFhgmJdarlec
	mFtcmpeul5yfu4kRHGtamjsYt6/6oHeIkYmD8RCjBAezkgiv1PvmNCHelMTKqtSi/Pii0pzU
	4kOM0hwsSuK84i96U4QE0hNLUrNTUwtSi2CyTBycUg1MonptL07YpG9by7mB4Xz63rfhBtPN
	xOZMuLvUaLlRysFQCfnZba2Ke1nL7io5tZk8OcyZqOreuOvZ3uDL7MZend+cZ91oOJIV8Gmh
	7dtpftk/uKcrxa2f1yvFu+bOZs2qp8HSD7cdnnDHnOvrCUbmC6e3WRTPelOmcDkz/FLTxJ76
	YF8HrldRG5mvfH2//ZAU22mmxSXPnuR6b1a4uG62pvrJzZGTd06ZtV2/h2XJjHaxh/OO5ubk
	3U7VnCX78rFkIutyqxLRRYs32HufvrVvYef9Obk+TCKunmsn7vrNa66WO2nN5u0CRnVN5k9F
	d+XtD9n1cLXSrOWbhBpqoz3aCx5H/Lpq6jRpfcrdu3tX7VdiKc5INNRiLipOBAA5zfR2JAMA
	AA==
X-CMS-MailID: 20240705115932epcas5p24f8d21daeec52d4a0c871bb12c9781ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240704043358epcas5p282acd174113c7baf3f7a3472ba4c39ff
References: <CGME20240704043358epcas5p282acd174113c7baf3f7a3472ba4c39ff@epcas5p2.samsung.com>
	<20240704042629.26151-1-vishnu.reddy@samsung.com>
	<4781d95e-a44c-423b-97b6-973c1826a1ab@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski =5Bmailto:krzysztof.kozlowski=40linaro.org=5D
> Sent: 05 July 2024 15:09
> To: Vishnu Reddy <vishnu.reddy=40samsung.com>;
> s.nawrocki=40samsung.com; alim.akhtar=40samsung.com;
> linus.walleij=40linaro.org
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org; linux-gpio=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; pankaj.dubey=40samsung.com;
> ravi.patel=40samsung.com; gost.dev=40samsung.com
> Subject: Re: =5BPATCH v3=5D pinctrl: samsung: Add support for pull-up and=
 pull-
> down
>=20
> On 04/07/2024 06:26, Vishnu Reddy wrote:
> > gpiolib framework has the implementation of setting up the PUD
> > configuration for GPIO pins but there is no driver support.
> >
> > Add support to handle the PUD configuration request from the userspace
> > in samsung pinctrl driver.
> >
> > Signed-off-by: Vishnu Reddy <vishnu.reddy=40samsung.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-exynos-arm.c =7C 15 ++++
> >  drivers/pinctrl/samsung/pinctrl-s3c64xx.c    =7C 15 ++++
> >  drivers/pinctrl/samsung/pinctrl-samsung.c    =7C 80
> ++++++++++++++++++++
> >  drivers/pinctrl/samsung/pinctrl-samsung.h    =7C 24 ++++++
> >  4 files changed, 134 insertions(+)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> > b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> > index 85ddf49a5188..426d1daacef2 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> > =40=40 -40,6 +40,20 =40=40 static const struct samsung_pin_bank_type
> bank_type_alive =3D =7B
> >  =23define S5P_OTHERS_RET_MMC		(1 << 29)
> >  =23define S5P_OTHERS_RET_UART		(1 << 28)
> >
> > +/*
> > + * s5pv210_pud_value_init: initialize the drvdata pud_val with s5pv210
> pud values
> > + * s5pv210_pull_disable:	0
> > + * s5pv210_pull_down_enable:	1
> > + * s5pv210_pull_up_enable:	2
>=20
> Please use proper defines, e.g. S5P_PIN_PUD_PULL_DISABLE
Ack, Will update.
>=20
>=20
> > + */
> > +static void s5pv210_pud_value_init(struct samsung_pinctrl_drv_data
> > +*drvdata) =7B
> > +	unsigned int i, *pud_val =3D drvdata->pud_val;
> > +
> > +	for (i =3D 0; i < PUD_MAX; i++)
> > +		pud_val=5Bi=5D =3D i;
>=20
> pud_val=5BPUD_PULL_DISABLE=5D =3D PROPER_DEFINE
>=20
> > +=7D
> > +
> >  static void s5pv210_retention_disable(struct samsung_pinctrl_drv_data
> > *drvdata)  =7B
> >  	void __iomem *clk_base =3D (void __iomem
> > *)drvdata->retention_ctrl->priv; =40=40 -133,6 +147,7 =40=40 static con=
st struct
> samsung_pin_ctrl s5pv210_pin_ctrl=5B=5D __initconst =3D =7B
> >  		.nr_banks	=3D ARRAY_SIZE(s5pv210_pin_bank),
> >  		.eint_gpio_init =3D exynos_eint_gpio_init,
> >  		.eint_wkup_init =3D exynos_eint_wkup_init,
> > +		.pud_value_init	=3D s5pv210_pud_value_init,
> >  		.suspend	=3D exynos_pinctrl_suspend,
> >  		.resume		=3D exynos_pinctrl_resume,
> >  		.retention_data	=3D &s5pv210_retention_data,
> > diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> > b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> > index c5d92db4fdb1..cf57b0f16999 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
> > =40=40 -255,6 +255,20 =40=40 static int s3c64xx_irq_get_trigger(unsigne=
d int
> type)
> >  	return trigger;
> >  =7D
> >
> > +/*
> > + * s3c64xx_pud_value_init: initialize the drvdata pud_val with s3c64xx=
 pud
> values
> > + * s3c64xx_pull_disable:	0
> > + * s3c64xx_pull_down_enable:	1
> > + * s3c64xx_pull_up_enable:	2
>=20
> Use proper defines. Comments are not the place to define magic values.
Ack, Will update.
>=20
>=20
> > + */
> > +static void s3c64xx_pud_value_init(struct samsung_pinctrl_drv_data
> > +*drvdata) =7B
> > +	unsigned int i, *pud_val =3D drvdata->pud_val;
> > +
> > +	for (i =3D 0; i < PUD_MAX; i++)
> > +		pud_val=5Bi=5D =3D i;
> > +=7D
> > +
> >  static void s3c64xx_irq_set_handler(struct irq_data *d, unsigned int
> > type)  =7B
> >  	/* Edge- and level-triggered interrupts need different handlers */
> > =40=40 -797,6 +811,7 =40=40 static const struct samsung_pin_ctrl
> s3c64xx_pin_ctrl=5B=5D __initconst =3D =7B
> >  		.nr_banks	=3D ARRAY_SIZE(s3c64xx_pin_banks0),
> >  		.eint_gpio_init =3D s3c64xx_eint_gpio_init,
> >  		.eint_wkup_init =3D s3c64xx_eint_eint0_init,
> > +		.pud_value_init	=3D s3c64xx_pud_value_init,
> >  	=7D,
> >  =7D;
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > index 623df65a5d6f..7d7e924c1fdb 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > =40=40 -997,6 +997,80 =40=40 static int samsung_pinctrl_unregister(stru=
ct
> platform_device *pdev,
> >  	return 0;
> >  =7D
> >
> > +/*
> > + *samsung_pud_value_init: initialize the drvdata pud_val
>=20
> You use some weird style of comments. It's not kerneldoc, it's not a prop=
er
> neither useful comment. Either use proper kerneldoc (and test
> it=21) or drop duplicated function names. They are not helping. This appl=
ies
> everywhere.
Ack, Will update.
>=20
>=20
> > + */
> > +static void samsung_pud_value_init(struct samsung_pinctrl_drv_data
> > +*drvdata) =7B
> > +	unsigned int  *pud_val =3D drvdata->pud_val;
> > +
> > +	pud_val=5BPUD_PULL_DISABLE=5D =3D
> PIN_PUD_PULL_UP_DOWN_DISABLE;
> > +	pud_val=5BPUD_PULL_DOWN=5D =3D PIN_PUD_PULL_DOWN_ENABLE;
> > +	pud_val=5BPUD_PULL_UP=5D =3D PIN_PUD_PULL_UP_ENABLE; =7D
> > +
> > +/*
> > + * samsung_gpio_set_pud will enable or disable the pull-down and
> > + * pull-up for the gpio pins in the PUD register.
> > + */
> > +static void samsung_gpio_set_pud(struct gpio_chip *gc, unsigned int
> offset,
> > +				 unsigned int value)
> > +=7B
> > +	struct samsung_pin_bank *bank =3D gpiochip_get_data(gc);
> > +	const struct samsung_pin_bank_type *type =3D bank->type;
> > +	void __iomem *reg;
> > +	unsigned int data, mask;
> > +
> > +	reg =3D bank->pctl_base + bank->pctl_offset;
> > +	data =3D readl(reg + type->reg_offset=5BPINCFG_TYPE_PUD=5D);
> > +	mask =3D (1 << type->fld_width=5BPINCFG_TYPE_PUD=5D) - 1;
> > +	data &=3D =7E(mask << (offset * type->fld_width=5BPINCFG_TYPE_PUD=5D)=
);
> > +	data =7C=3D value << (offset * type->fld_width=5BPINCFG_TYPE_PUD=5D);
> > +	writel(data, reg + type->reg_offset=5BPINCFG_TYPE_PUD=5D);
> > +=7D
> > +
> > +/*
> > + * samsung_gpio_set_config will identify the type of PUD config based
> > + * on the gpiolib request to enable or disable the PUD configuration.
> > + */
> > +static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned int
> offset,
> > +				   unsigned long config)
> > +=7B
> > +	struct samsung_pin_bank *bank =3D gpiochip_get_data(gc);
> > +	struct samsung_pinctrl_drv_data *drvdata =3D bank->drvdata;
> > +	unsigned int value;
> > +	int ret =3D 0;
> > +	unsigned long flags;
> > +
> > +	switch (pinconf_to_config_param(config)) =7B
> > +	case PIN_CONFIG_BIAS_DISABLE:
> > +		value =3D drvdata->pud_val=5BPUD_PULL_DISABLE=5D;
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_DOWN:
> > +		value =3D drvdata->pud_val=5BPUD_PULL_DOWN=5D;
> > +		break;
> > +	case PIN_CONFIG_BIAS_PULL_UP:
> > +		value =3D drvdata->pud_val=5BPUD_PULL_UP=5D;
> > +		break;
> > +	default:
> > +		return -ENOTSUPP;
> > +	=7D
> > +
> > +	ret =3D clk_enable(drvdata->pclk);
> > +	if (ret) =7B
> > +		dev_err(drvdata->dev, =22failed to enable clock=5Cn=22);
> > +		return ret;
> > +	=7D
> > +
> > +	raw_spin_lock_irqsave(&bank->slock, flags);
> > +	samsung_gpio_set_pud(gc, offset, value);
> > +	raw_spin_unlock_irqrestore(&bank->slock, flags);
> > +
> > +	clk_disable(drvdata->pclk);
> > +
> > +	return ret;
> > +=7D
> > +
> >  static const struct gpio_chip samsung_gpiolib_chip =3D =7B
> >  	.request =3D gpiochip_generic_request,
> >  	.free =3D gpiochip_generic_free,
> > =40=40 -1006,6 +1080,7 =40=40 static const struct gpio_chip
> samsung_gpiolib_chip =3D =7B
> >  	.direction_output =3D samsung_gpio_direction_output,
> >  	.to_irq =3D samsung_gpio_to_irq,
> >  	.add_pin_ranges =3D samsung_add_pin_ranges,
> > +	.set_config =3D samsung_gpio_set_config,
> >  	.owner =3D THIS_MODULE,
> >  =7D;
> >
> > =40=40 -1237,6 +1312,11 =40=40 static int samsung_pinctrl_probe(struct
> platform_device *pdev)
> >  	if (ctrl->eint_wkup_init)
> >  		ctrl->eint_wkup_init(drvdata);
> >
> > +	if (ctrl->pud_value_init)
> > +		ctrl->pud_value_init(drvdata);
> > +	else
> > +		samsung_pud_value_init(drvdata);
> > +
> >  	ret =3D samsung_gpiolib_register(pdev, drvdata);
> >  	if (ret)
> >  		goto err_unregister;
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > index d50ba6f07d5d..61384096b6d7 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.h
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
> > =40=40 -61,6 +61,28 =40=40 enum pincfg_type =7B
> >  =23define PIN_CON_FUNC_INPUT		0x0
> >  =23define PIN_CON_FUNC_OUTPUT		0x1
> >
> > +/*
> > + * Values for the pin PUD register.
> > + */
> > +=23define PIN_PUD_PULL_UP_DOWN_DISABLE	0x0
>=20
> EXYNOS_PIN_PUD_PULL_DISABLE
>=20
> > +=23define PIN_PUD_PULL_DOWN_ENABLE	0x1
>=20
> EXYNOS_PIN_PID_PULL_DOWN
>=20
> > +=23define PIN_PUD_PULL_UP_ENABLE		0x3
>=20
> EXYNOS_PIN_PID_PULL_UP
Ack, Will update.
>=20
> > +
> > +/*
> > + * enum pud_index: Index values to access the pud_val array in
> > + *	struct samsung_pinctrl_drv_data.
> > + * =40PUD_PULL_DISABLE: Index for value of pud disable
> > + * =40PUD_PULL_DOWN: Index for the value of pull down enable
> > + * =40PUD_PULL_UP: Index for the value of pull up enable
> > + * =40PUD_MAX: Maximun value of the index
>=20
> Typo: Maximum
Ack, Will update.
>=20
> > + */
> > +enum pud_index =7B
> > +	PUD_PULL_DISABLE,
> > +	PUD_PULL_DOWN,
> > +	PUD_PULL_UP,
> > +	PUD_MAX,
> > +=7D;
>=20
> Best regards,
> Krzysztof



