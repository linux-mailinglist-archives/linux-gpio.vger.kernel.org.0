Return-Path: <linux-gpio+bounces-7213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5278FDE44
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 07:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 281A2284716
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 05:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4860D45020;
	Thu,  6 Jun 2024 05:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NHpMifIu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F259446A1
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 05:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717652701; cv=none; b=NRG5UXhcbwFt/bw8JrEuzmFz6uJZ73YRCjcxUyjXAnl9rXpsPl6kzoVpzGXp2tnxbJ0Cbw96pwxx7xGONuF5CMJU9OW2sib7C9NGzDRpwSKbsdv94ZYHPIYu9AY3N3rq4nv27l8dfYc2QIbVfQMHUuf/b5erH/dfN+vTomsT16w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717652701; c=relaxed/simple;
	bh=IQbfyl/i6EbtXJZK/uWs0Dylt66M6GDfPVrvWh9SoUQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=GmIibuRpIMPfgs+8NevxxjnkEek49Rpnw63hMqiFDmg4WXUuV3igg/SKefsM5r4tDsQrVbvyXt8n44umHLs26oKVs+aN2mMuebCBXikK/0mMo3N8ZHvPZDZk+C3jSfbWVOaw7NXtMANxa59aIu/xxW0/ayrkiTYhgsUijrszbIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NHpMifIu; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240606054451epoutp02d860caa546f3a663d0afda080520a56c~WVAXNyCG50631906319epoutp024
	for <linux-gpio@vger.kernel.org>; Thu,  6 Jun 2024 05:44:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240606054451epoutp02d860caa546f3a663d0afda080520a56c~WVAXNyCG50631906319epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1717652691;
	bh=mIjK7nMg5peMFTify00f0fiff7N2VL5dYEp6TCGYoBs=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=NHpMifIuW+drG5MmrrwGDZzv9rHzm9YsmsiCR3etaYPfMQFrkMLTZLYoalCJfiDxz
	 IXwXIEIjnDydYGqUnxnrke4/OyQH9D21DCQG07XchnBu7TmxPbijok/OkhDGcRwpiK
	 NGBz16q2viLXexCPqwMxb/cs1gGoLOVLVdDUUMkM=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20240606054451epcas5p2c907694dac7490c8710ab258e090ea26~WVAWg6et13178031780epcas5p2F;
	Thu,  6 Jun 2024 05:44:51 +0000 (GMT)
Received: from epsmges5p3new.samsung.com (unknown [182.195.38.174]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4VvtZT3jL1z4x9Pw; Thu,  6 Jun
	2024 05:44:49 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
	F7.A5.10035.1DC41666; Thu,  6 Jun 2024 14:44:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20240606051157epcas5p3a66b898fbda92e83352893ca60db49bd~WUjo940-I0190701907epcas5p3X;
	Thu,  6 Jun 2024 05:11:57 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240606051157epsmtrp2f93d4067b8aa9b827cd20c71fbc4861c~WUjo9F9A41986719867epsmtrp2e;
	Thu,  6 Jun 2024 05:11:57 +0000 (GMT)
X-AuditID: b6c32a4b-8afff70000002733-d0-66614cd1d0b3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	68.96.18846.D1541666; Thu,  6 Jun 2024 14:11:57 +0900 (KST)
Received: from FDSFTE582 (unknown [107.122.82.121]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240606051156epsmtip296ec7005e7b469d56f0e228b7f842971~WUjndKxEq0325403254epsmtip2k;
	Thu,  6 Jun 2024 05:11:56 +0000 (GMT)
From: "Vishnu Reddy" <vishnu.reddy@samsung.com>
To: "'Alim Akhtar'" <alim.akhtar@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>
In-Reply-To: <002601dab23c$559263d0$00b72b70$@samsung.com>
Subject: RE: [PATCH] pinctrl: samsung: Add support for pull-up and pull-down
Date: Thu, 6 Jun 2024 10:41:55 +0530
Message-ID: <0c5101dab7d0$0de1bfb0$29a53f10$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQLxKHH81TrGQH9mk3YrmwmVK5Ft8wKHISlnAhFFTnGvaIWdUA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOJsWRmVeSWpSXmKPExsWy7bCmpu5Fn8Q0g96z0hYP5m1jszh/fgO7
	xZQ/y5ksNj2+xmqxef4fRovLu+awWcw4v4/JYtHWL+wWDz/sYbc4/Kad1YHLY9OqTjaPO9f2
	sHlsXlLv0bdlFaPH501yAaxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5
	ibmptkouPgG6bpk5QEcpKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMCvSKE3OL
	S/PS9fJSS6wMDQyMTIEKE7Izni4uKThvUtF9u5OtgXGuQRcjJ4eEgInExeMPGLsYuTiEBHYz
	Siy9840FwvnEKLH103JmkCowZ+HbcJiOQ0emQ3XsZJSY9+kKM4TzglHi3YZtrF2MHBxsAvoS
	zTckQBpEBCokrsw/yw5SwyxwklHi2YoTjCAJTgEriU17JrKB2MICPhJH+o6CbWMRUJGY++YK
	K4jNK2ApcXfPO0YIW1Di5MwnLCA2s4C2xLKFr5khLlKQ+Pl0GStEXFzi6M8eZojFThLHH+5g
	AlksIbCQQ2LzkwlMEA0uEmu6t7NA2MISr45vYYewpSQ+v9vLBmEnS6z/fYod5BkJgRyJnmkK
	EGF7iQNX5rCAhJkFNCXW79KHCMtKTD21jgniBD6J3t9PoDbxSuyYB2OrSRybNJ0VwpaR6Fxx
	g3ECo9IsJJ/NQvLZLCTfzELYtoCRZRWjZGpBcW56arFpgXFeajk8upPzczcxglOslvcOxkcP
	PugdYmTiYDzEKMHBrCTC61ccnybEm5JYWZValB9fVJqTWnyI0RQY3BOZpUST84FJPq8k3tDE
	0sDEzMzMxNLYzFBJnPd169wUIYH0xJLU7NTUgtQimD4mDk6pBiYecSazlqk9V3bNcTmlyB7X
	eIKrpOVyaKp/3r4Ypn3BRj9Fau3LbLtO7Dkw0f+E4y8N6Y5N8YFPuiTfdBk8ndOUzF/wij+6
	601Pxa9Pf3pkNqmGv4nwdq1ctrx6dX2QnPjJ65WH8lo7NNKOd/7nTul9miI0wS3oh5bh5Qlb
	Y2ZuOeyz+7DUnYR5DdLOkYwrl133/c70643j39T+OSd91uqs0rCpv/Limb2J8anIjojZHrem
	VdVuzF23czpXw+6gW3XbYrcGvDpn9PWqw73fgovmLHw//W+jbkngcRmhGb3+KzgaqvPebhac
	t/VqMffW/YI5SdGcPmZr9zxg8StRc138JXVxzf+Jvy9vzfRfs02JpTgj0VCLuag4EQCIUKnl
	OgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42LZdlhJXlfWNTHN4GinqcWDedvYLM6f38Bu
	MeXPciaLTY+vsVpsnv+H0eLyrjlsFjPO72OyWLT1C7vFww972C0Ov2lndeDy2LSqk83jzrU9
	bB6bl9R79G1ZxejxeZNcAGsUl01Kak5mWWqRvl0CV0bLtPcsBVO0Ko5dCG9gXKnUxcjJISFg
	InHoyHTGLkYuDiGB7YwSXXOWMUIkZCQ+3NnCDGELS6z895wdougZo8SuNz1ARRwcbAL6Es03
	JEBqRARqJJ63z2YHsZkFzjJKTO0Lg6jfyyixf2IL2FBOASuJTXsmsoHYwgI+Ekf6joItYBFQ
	kZj75goriM0rYClxd887RghbUOLkzCcsEEO1JXoftjLC2MsWvoY6TkHi59NlrBBxcYmjP3uY
	IQ5ykjj+cAfTBEbhWUhGzUIyahaSUbOQtC9gZFnFKJpaUJybnptcYKhXnJhbXJqXrpecn7uJ
	ERxhWkE7GJet/6t3iJGJg/EQowQHs5IIr19xfJoQb0piZVVqUX58UWlOavEhRmkOFiVxXuWc
	zhQhgfTEktTs1NSC1CKYLBMHp1QDU8+hPyc/tz9Uvl/wiYF3z58bE3a39DUkMejnzXP6VHzC
	c4NQ8fLE59pbi9676LgI/Hx9ISv55D2O1QZ27bolqesqy2YIN+57vCxtqo0Sv/0Sg7xVqntP
	vQpy1spZeE1FwvSz5+GoHDffnw7vvpVfOsQpIPKzVZvnY9OK7cd4f//5nXjlVmS9feGr+Qem
	TLVRlFymX6KWO1fsu/X/xbXN82tnt982OP9G36ztnMMLbfeExBUnNeWd5s/JzxF6wtnavPnT
	rXMbP58uVUlbXnph8hw5nZgdZ55MfdIt/X3z5tx7b5+H/1jqy9pq7vWvq8wiS73ojeeTCZ1L
	/L+vc3tpY/O9pVGNpXDB1+7HNZZvJiuxFGckGmoxFxUnAgB6RjwBHwMAAA==
X-CMS-MailID: 20240606051157epcas5p3a66b898fbda92e83352893ca60db49bd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240529070220epcas5p140580a28b93ce5cb256ef825c778c649
References: <CGME20240529070220epcas5p140580a28b93ce5cb256ef825c778c649@epcas5p1.samsung.com>
	<20240529065939.36369-1-vishnu.reddy@samsung.com>
	<002601dab23c$559263d0$00b72b70$@samsung.com>

Hi Alim, Thank you for reviewing the patch.

> -----Original Message-----
> From: Alim Akhtar =5Bmailto:alim.akhtar=40samsung.com=5D
> Sent: 30 May 2024 08:22
> To: 'Vishnu Reddy' <vishnu.reddy=40samsung.com>; krzk=40kernel.org;
> s.nawrocki=40samsung.com; linus.walleij=40linaro.org
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-
> soc=40vger.kernel.org; linux-gpio=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; pankaj.dubey=40samsung.com;
> ravi.patel=40samsung.com
> Subject: RE: =5BPATCH=5D pinctrl: samsung: Add support for pull-up and pu=
ll-down
>=20
> Hi Vishnu,
>=20
> > -----Original Message-----
> > From: Vishnu Reddy <vishnu.reddy=40samsung.com>
> > Sent: Wednesday, May 29, 2024 12:30 PM
> > To: krzk=40kernel.org; s.nawrocki=40samsung.com;
> alim.akhtar=40samsung.com;
> > linus.walleij=40linaro.org
> > Cc: linux-arm-kernel=40lists.infradead.org;
> > linux-samsung-soc=40vger.kernel.org;
> > linux-gpio=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> > pankaj.dubey=40samsung.com; ravi.patel=40samsung.com
> > Subject: =5BPATCH=5D pinctrl: samsung: Add support for pull-up and
> > pull-down
> >
> > gpiolib framework has the implementation of setting up the PUD
> > configuration for GPIO pins but there is no driver support.
> >
> > Add support to handle the PUD configuration request from the userspace
> > in samsung pinctrl driver.
> >
> > Signed-off-by: Vishnu Reddy <vishnu.reddy=40samsung.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-samsung.c =7C 51
> > +++++++++++++++++++++++ drivers/pinctrl/samsung/pinctrl-samsung.h =7C
> 7
> > ++++
> >  2 files changed, 58 insertions(+)
> >
> > diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > index ed07e23e0912..a4b6eea5e168 100644
> > --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> > +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> > =40=40 -939,6 +939,56 =40=40 static int samsung_pinctrl_unregister(stru=
ct
> > platform_device *pdev,
> >  	return 0;
> >  =7D
> >
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
> > +	unsigned int data;
> > +
> > +	reg =3D bank->pctl_base + bank->pctl_offset;
> > +	data =3D readl(reg + type->reg_offset=5BPINCFG_TYPE_PUD=5D);
> > +	data &=3D =7E(0xf << (offset * 4));
> For the mask, you can use =22type->fld_width=22 as that is more generic a=
nd will
> work for all SoC I didn=E2=80=99t=20get,=20why=20you=20are=20multiplying=
=20offset=20with=204?=20Is=20this=20true=0D=0A>=20for=20all=20SoC?=0D=0AAck=
,=20Will=20update.=0D=0A>=20=0D=0A>=20>=20+=09data=20=7C=3D=20value=20<<=20=
(offset=20*=204);=0D=0A>=20>=20+=09writel(data,=20reg=20+=20type->reg_offse=
t=5BPINCFG_TYPE_PUD=5D);=0D=0A>=20>=20+=7D=0D=0A>=20>=20+=0D=0A>=20>=20+/*=
=0D=0A>=20>=20+=20*=20samsung_gpio_set_config=20will=20identify=20the=20typ=
e=20of=20PUD=20config=20based=0D=0A>=20>=20+=20*=20on=20the=20gpiolib=20req=
uest=20to=20enable=20or=20disable=20the=20PUD=20configuration.=0D=0A>=20>=
=20+=20*/=0D=0A>=20>=20+static=20int=20samsung_gpio_set_config(struct=20gpi=
o_chip=20*gc,=20unsigned=20int=0D=0A>=20offset,=0D=0A>=20>=20+=09=09=09=09=
=20=20=20unsigned=20long=20config)=0D=0A>=20>=20+=7B=0D=0A>=20>=20+=09struc=
t=20samsung_pin_bank=20*bank=20=3D=20gpiochip_get_data(gc);=0D=0A>=20>=20+=
=09unsigned=20long=20flags;=0D=0A>=20>=20+=09unsigned=20int=20value=20=3D=
=200;=0D=0A>=20>=20+=0D=0A>=20>=20+=09switch=20(pinconf_to_config_param(con=
fig))=20=7B=0D=0A>=20>=20+=09case=20PIN_CONFIG_BIAS_DISABLE:=0D=0A>=20>=20+=
=09=09value=20=3D=20DISABLE_PIN_PULL_UP_DOWN;=0D=0A>=20>=20+=09=09break;=0D=
=0A>=20>=20+=09case=20PIN_CONFIG_BIAS_PULL_DOWN:=0D=0A>=20>=20+=09=09value=
=20=3D=20ENABLE_PIN_PULL_DOWN;=0D=0A>=20>=20+=09=09break;=0D=0A>=20>=20+=09=
case=20PIN_CONFIG_BIAS_PULL_UP:=0D=0A>=20>=20+=09=09value=20=3D=20ENABLE_PI=
N_PULL_UP;=0D=0A>=20>=20+=09=09break;=0D=0A>=20>=20+=09default:=0D=0A>=20>=
=20+=09=09return=20-ENOTSUPP;=0D=0A>=20>=20+=09=7D=0D=0A>=20>=20+=0D=0A>=20=
>=20+=09raw_spin_lock_irqsave(&bank->slock,=20flags);=0D=0A>=20>=20+=09sams=
ung_gpio_set_pud(gc,=20offset,=20value);=0D=0A>=20>=20+=09raw_spin_unlock_i=
rqrestore(&bank->slock,=20flags);=0D=0A>=20>=20+=09return=200;=0D=0A>=20>=
=20+=7D=0D=0A>=20>=20+=0D=0A>=20>=20=20static=20const=20struct=20gpio_chip=
=20samsung_gpiolib_chip=20=3D=20=7B=0D=0A>=20>=20=20=09.request=20=3D=20gpi=
ochip_generic_request,=0D=0A>=20>=20=20=09.free=20=3D=20gpiochip_generic_fr=
ee,=0D=0A>=20>=20=40=40=20-948,6=20+998,7=20=40=40=20static=20const=20struc=
t=20gpio_chip=20samsung_gpiolib_chip=20=3D=0D=0A>=20=7B=0D=0A>=20>=20=20=09=
.direction_output=20=3D=20samsung_gpio_direction_output,=0D=0A>=20>=20=20=
=09.to_irq=20=3D=20samsung_gpio_to_irq,=0D=0A>=20>=20=20=09.add_pin_ranges=
=20=3D=20samsung_add_pin_ranges,=0D=0A>=20>=20+=09.set_config=20=3D=20samsu=
ng_gpio_set_config,=0D=0A>=20>=20=20=09.owner=20=3D=20THIS_MODULE,=0D=0A>=
=20>=20=20=7D;=0D=0A>=20>=0D=0A>=20>=20diff=20--git=20a/drivers/pinctrl/sam=
sung/pinctrl-samsung.h=0D=0A>=20>=20b/drivers/pinctrl/samsung/pinctrl-samsu=
ng.h=0D=0A>=20>=20index=20ab791afaabf5..23b70ddcaccc=20100644=0D=0A>=20>=20=
---=20a/drivers/pinctrl/samsung/pinctrl-samsung.h=0D=0A>=20>=20+++=20b/driv=
ers/pinctrl/samsung/pinctrl-samsung.h=0D=0A>=20>=20=40=40=20-61,6=20+61,13=
=20=40=40=20enum=20pincfg_type=20=7B=0D=0A>=20>=20=20=23define=20PIN_CON_FU=
NC_INPUT=09=090x0=0D=0A>=20>=20=20=23define=20PIN_CON_FUNC_OUTPUT=09=090x1=
=0D=0A>=20>=0D=0A>=20>=20+/*=0D=0A>=20>=20+=20*=20Values=20for=20the=20pin=
=20PUD=20register.=0D=0A>=20>=20+=20*/=0D=0A>=20>=20+=23define=20DISABLE_PI=
N_PULL_UP_DOWN=090x0=0D=0A>=20>=20+=23define=20ENABLE_PIN_PULL_DOWN=09=090x=
1=0D=0A>=20>=20+=23define=20ENABLE_PIN_PULL_UP=09=090x3=0D=0A>=20Use=20cons=
istent=20naming=20conventions=20as=20per=20this=20file,=20so=0D=0A>=20PIN_P=
UD_PULL_UP_DOWN_DISABLE=20PIN_PUD_PULL_DOWN_ENABLE=0D=0A>=20PIN_PUD_PULL_UP=
_ENABLE=0D=0A>=20=0D=0AAck,=20Will=20update.=0D=0A>=20>=20+=0D=0A>=20>=20=
=20/**=0D=0A>=20>=20=20=20*=20enum=20eint_type=20-=20possible=20external=20=
interrupt=20types.=0D=0A>=20>=20=20=20*=20=40EINT_TYPE_NONE:=20bank=20does=
=20not=20support=20external=20interrupts=0D=0A>=20>=20--=0D=0A>=20>=202.17.=
1=0D=0A>=20=0D=0A>=20=0D=0ARegards,=0D=0AVishnu=20Reddy=0D=0A=0D=0A

