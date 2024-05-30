Return-Path: <linux-gpio+bounces-6899-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 740918D43E1
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 04:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97FD21C21D04
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 02:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4E31EB45;
	Thu, 30 May 2024 02:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rdvZR14t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9331CA9E
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 02:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717037529; cv=none; b=jMqycFZQHU9RVNtgdNRZpAF0BBjONeUwVoylJbyntuBOT1UVOBi40yjcJ7mhqZBmtUQtI/s+TYsXTFMD4Efb9Ec6sY4N+cWytWBIHPgU8re6gn3sNQtbTMHHjLt22VLzawTcz0CQzODxB2kzHn+5MzGtD517fakvsedrX+lZcBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717037529; c=relaxed/simple;
	bh=miEHNok7QEtZGRuhkj2DCMgsJtPesw/DzPb3C3l2APo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=tY1gsewbeBbmQydk3Pk8tJfd/xbKW9uUFRvKhF+rAtSjzh6dcgZBZ8QuX2B1qqTAKbmlGtM5IOt+gBrMgJc5F7chsHvILosqzUbPB5JRYza+73Wg6mkroe41c/8CwN+M0NIdog/E2T6imKzAFS6sa75NdrS0HprF3NTvKBbEntc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rdvZR14t; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20240530025159epoutp0293cd31b41bb01f0293d7f4c7d80bc797~UJIbH9q1X1416414164epoutp02k
	for <linux-gpio@vger.kernel.org>; Thu, 30 May 2024 02:51:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20240530025159epoutp0293cd31b41bb01f0293d7f4c7d80bc797~UJIbH9q1X1416414164epoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1717037519;
	bh=/F0uw//c+T+/uRIEgO1oiWlAp6TSXKaJ83RVO7SGw40=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=rdvZR14tsR3r/gt6L3HTCMFYzu6HGk5GV8IrEYlwVR4TMHMZXQ21Lm7H6iKv2ioBb
	 N9gY2KLbyhMM+gP03hgFDUC9TMPvrWQFrfhVRKZe9FSHJmCe3INT+qzeTE0mqwPUCW
	 X0ywf0TNtOOUX05XAaVclVrrNCZ8bk1KTbYZy5mU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20240530025158epcas5p4ce7134952595ebd196ed7fd27b325dc7~UJIa1axCE2072620726epcas5p4g;
	Thu, 30 May 2024 02:51:58 +0000 (GMT)
Received: from epsmgec5p1new.samsung.com (unknown [182.195.38.183]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4VqW4F5J2Jz4x9Ps; Thu, 30 May
	2024 02:51:57 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
	epsmgec5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	D9.22.08853.DC9E7566; Thu, 30 May 2024 11:51:57 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20240530025156epcas5p1b9fa65a7a70eb6cd12288d9e8b142725~UJIY_z3sX2438324383epcas5p1p;
	Thu, 30 May 2024 02:51:56 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20240530025156epsmtrp2456537252670c458cbfd5172a85a0c6a~UJIY_Dcma0660706607epsmtrp2d;
	Thu, 30 May 2024 02:51:56 +0000 (GMT)
X-AuditID: b6c32a44-fc3fa70000002295-51-6657e9cdd62e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	E3.A2.08336.CC9E7566; Thu, 30 May 2024 11:51:56 +0900 (KST)
Received: from INBRO002756 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20240530025155epsmtip2d4d5b9d10aa39db954e1dff17d739e77~UJIXeSNS92242222422epsmtip2e;
	Thu, 30 May 2024 02:51:55 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Vishnu Reddy'" <vishnu.reddy@samsung.com>, <krzk@kernel.org>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <pankaj.dubey@samsung.com>,
	<ravi.patel@samsung.com>
In-Reply-To: <20240529065939.36369-1-vishnu.reddy@samsung.com>
Subject: RE: [PATCH] pinctrl: samsung: Add support for pull-up and pull-down
Date: Thu, 30 May 2024 08:21:53 +0530
Message-ID: <002601dab23c$559263d0$00b72b70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLxKHH81TrGQH9mk3YrmwmVK5Ft8wKHISlnr23t8YA=
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBJsWRmVeSWpSXmKPExsWy7bCmhu7Zl+FpBg2LNCzOn9/AbjHlz3Im
	i02Pr7FabJ7/h9Hi8q45bBYzzu9jsli09Qu7xcMPe9gtDr9pZ7WYNz3Kgctj06pONo871/aw
	eWxeUu/Rt2UVo8fnTXIBrFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJ
	uam2Si4+AbpumTlANykplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCkwK9IoTc4tL
	89L18lJLrAwNDIxMgQoTsjOOfHrMXPBbu6LtzRTGBsYrGl2MnBwSAiYSqw53sHYxcnEICexm
	lJh46TCU84lR4lXXFEaQKiGBb4wSS9YIwXR8/32bCaJoL6PExg9/GCGcF4wSs4/tZgapYhPQ
	ldixuI0NxBYRqJLYc2ojG0gRs8BJRolnK06AjeUUsJN49+YuK4gtLOAjcaTvKFgzi4CqxM11
	X8FqeAUsJe7N/ccCYQtKnJz5BMxmFtCWWLbwNTPESQoSP58uY4VYZiXxce5UqBpxiZdHj7CD
	LJYQWMghcfXWMxaIBheJ+XfnsEHYwhKvjm9hh7ClJD6/2wsVz5Y4fnEWlF0h0d36EarGXmLn
	o5tAcziAFmhKrN+lD7GLT6L39xMmkLCEAK9ERxs0tFQlmt9dhdoqLTGxu5sVwvaQmLGlk3EC
	o+IsJJ/NQvLZLCQfzEJYtoCRZRWjZGpBcW56arJpgWFeajk8wpPzczcxgpOslssOxhvz/+kd
	YmTiYDzEKMHBrCTCe2ZSaJoQb0piZVVqUX58UWlOavEhRlNgcE9klhJNzgem+bySeEMTSwMT
	MzMzE0tjM0Mlcd7XrXNThATSE0tSs1NTC1KLYPqYODilGphqrQrNhdl1grV2uJ470fUk4+Tq
	Emcexxm+m8uW5PF+28J2SERB4s3kvZcX8fCnHFz5UYQloqfnwVSZ9leXlz3qPy3OcK7Wpt7r
	eV1ME/+qZT0venymP+26zHxga6W1uJXBkQmn0w+LPdb6yDRZbIHuKsfFz+7r/npsda1xagdn
	n/hRHaGaPr7mCof2R6m7w56VJZW+EFoosmw1W8bsRxH+QQ9z658WzilK2uFz7aTIpybPZ7Nu
	zbikv/bujrnvVdT2zp9gNtli3iQ1w5vpu5pnPrulcPHTh+iPSzaLvpya6RueyvLNhaewM75v
	wZkkFpf+mQx/db99l/j92DHhdv4MW/dnvELVLxdMmZPEkHtQiaU4I9FQi7moOBEAquO04zsE
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsWy7bCSvO6Zl+FpBtvW61ucP7+B3WLKn+VM
	FpseX2O12Dz/D6PF5V1z2CxmnN/HZLFo6xd2i4cf9rBbHH7Tzmoxb3qUA5fHplWdbB53ru1h
	89i8pN6jb8sqRo/Pm+QCWKO4bFJSczLLUov07RK4Mr6cDSmYp1zx7PxN9gbGCbJdjJwcEgIm
	Et9/32bqYuTiEBLYzSix+NJaVoiEtMT1jRPYIWxhiZX/nrNDFD1jlNhycQdYgk1AV2LH4jY2
	EFtEoE5i/4MTYDazwFlGial9YRAN/YwSt26/A5vKKWAn8e7NXTBbWMBH4kjfUWYQm0VAVeLm
	uq+MIDavgKXEvbn/WCBsQYmTM5+wQAzVlnh68ymcvWzha2aI6xQkfj5dxgpxhJXEx7lToWrE
	JV4ePcI+gVF4FpJRs5CMmoVk1CwkLQsYWVYxSqYWFOem5xYbFhjmpZbrFSfmFpfmpesl5+du
	YgRHmpbmDsbtqz7oHWJk4mA8xCjBwawkwntmUmiaEG9KYmVValF+fFFpTmrxIUZpDhYlcV7x
	F70pQgLpiSWp2ampBalFMFkmDk6pBqaGZXcOOvjHlxTreXnt23DM9eJ3y98aTK5LpUsPqs0Q
	mHjBjeUmG6sx36HgGbJni86IHG5LuVg1UXaCpszzL/ondWyV5x52z3W7e3kZt/fnWwovnr4t
	dT750ndfxPIjEh083oH/X4ZoPzx4raty9srjGcuLRTUyztpovb/OeTRGevv26EdOT5IkFfe0
	/ryp8yQj6mqy2XX7eyzT1jWmPLvResFKXMX2zIKYntbOeXUacUfWXN7A9f636TPemTI/mufX
	B0gufdkcc+5v8k4/rbJN65w81Rcv5HL04n7PHtDJkzqpykDLZO1B789Fb3dFlS23Ftt72qbq
	ZwxT++ND6Ydlz1zu4QtZZOYVH6xwaIoSS3FGoqEWc1FxIgDcPe6gIwMAAA==
X-CMS-MailID: 20240530025156epcas5p1b9fa65a7a70eb6cd12288d9e8b142725
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240529070220epcas5p140580a28b93ce5cb256ef825c778c649
References: <CGME20240529070220epcas5p140580a28b93ce5cb256ef825c778c649@epcas5p1.samsung.com>
	<20240529065939.36369-1-vishnu.reddy@samsung.com>

Hi Vishnu,

> -----Original Message-----
> From: Vishnu Reddy <vishnu.reddy=40samsung.com>
> Sent: Wednesday, May 29, 2024 12:30 PM
> To: krzk=40kernel.org; s.nawrocki=40samsung.com; alim.akhtar=40samsung.co=
m;
> linus.walleij=40linaro.org
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kern=
el.org;
> linux-gpio=40vger.kernel.org; linux-kernel=40vger.kernel.org;
> pankaj.dubey=40samsung.com; ravi.patel=40samsung.com
> Subject: =5BPATCH=5D pinctrl: samsung: Add support for pull-up and pull-d=
own
>=20
> gpiolib framework has the implementation of setting up the PUD configurat=
ion
> for GPIO pins but there is no driver support.
>=20
> Add support to handle the PUD configuration request from the userspace in
> samsung pinctrl driver.
>=20
> Signed-off-by: Vishnu Reddy <vishnu.reddy=40samsung.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c =7C 51 +++++++++++++++++++++++
> drivers/pinctrl/samsung/pinctrl-samsung.h =7C  7 ++++
>  2 files changed, 58 insertions(+)
>=20
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c
> b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index ed07e23e0912..a4b6eea5e168 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> =40=40 -939,6 +939,56 =40=40 static int samsung_pinctrl_unregister(struct
> platform_device *pdev,
>  	return 0;
>  =7D
>=20
> +/*
> + * samsung_gpio_set_pud will enable or disable the pull-down and
> + * pull-up for the gpio pins in the PUD register.
> + */
> +static void samsung_gpio_set_pud(struct gpio_chip *gc, unsigned int offs=
et,
> +				 unsigned int value)
> +=7B
> +	struct samsung_pin_bank *bank =3D gpiochip_get_data(gc);
> +	const struct samsung_pin_bank_type *type =3D bank->type;
> +	void __iomem *reg;
> +	unsigned int data;
> +
> +	reg =3D bank->pctl_base + bank->pctl_offset;
> +	data =3D readl(reg + type->reg_offset=5BPINCFG_TYPE_PUD=5D);
> +	data &=3D =7E(0xf << (offset * 4));
For the mask, you can use =22type->fld_width=22 as that is more generic and=
 will work for all SoC
I didn=E2=80=99t=20get,=20why=20you=20are=20multiplying=20offset=20with=204=
?=20Is=20this=20true=20for=20all=20SoC?=0D=0A=0D=0A>=20+=09data=20=7C=3D=20=
value=20<<=20(offset=20*=204);=0D=0A>=20+=09writel(data,=20reg=20+=20type->=
reg_offset=5BPINCFG_TYPE_PUD=5D);=0D=0A>=20+=7D=0D=0A>=20+=0D=0A>=20+/*=0D=
=0A>=20+=20*=20samsung_gpio_set_config=20will=20identify=20the=20type=20of=
=20PUD=20config=20based=0D=0A>=20+=20*=20on=20the=20gpiolib=20request=20to=
=20enable=20or=20disable=20the=20PUD=20configuration.=0D=0A>=20+=20*/=0D=0A=
>=20+static=20int=20samsung_gpio_set_config(struct=20gpio_chip=20*gc,=20uns=
igned=20int=20offset,=0D=0A>=20+=09=09=09=09=20=20=20unsigned=20long=20conf=
ig)=0D=0A>=20+=7B=0D=0A>=20+=09struct=20samsung_pin_bank=20*bank=20=3D=20gp=
iochip_get_data(gc);=0D=0A>=20+=09unsigned=20long=20flags;=0D=0A>=20+=09uns=
igned=20int=20value=20=3D=200;=0D=0A>=20+=0D=0A>=20+=09switch=20(pinconf_to=
_config_param(config))=20=7B=0D=0A>=20+=09case=20PIN_CONFIG_BIAS_DISABLE:=
=0D=0A>=20+=09=09value=20=3D=20DISABLE_PIN_PULL_UP_DOWN;=0D=0A>=20+=09=09br=
eak;=0D=0A>=20+=09case=20PIN_CONFIG_BIAS_PULL_DOWN:=0D=0A>=20+=09=09value=
=20=3D=20ENABLE_PIN_PULL_DOWN;=0D=0A>=20+=09=09break;=0D=0A>=20+=09case=20P=
IN_CONFIG_BIAS_PULL_UP:=0D=0A>=20+=09=09value=20=3D=20ENABLE_PIN_PULL_UP;=
=0D=0A>=20+=09=09break;=0D=0A>=20+=09default:=0D=0A>=20+=09=09return=20-ENO=
TSUPP;=0D=0A>=20+=09=7D=0D=0A>=20+=0D=0A>=20+=09raw_spin_lock_irqsave(&bank=
->slock,=20flags);=0D=0A>=20+=09samsung_gpio_set_pud(gc,=20offset,=20value)=
;=0D=0A>=20+=09raw_spin_unlock_irqrestore(&bank->slock,=20flags);=0D=0A>=20=
+=09return=200;=0D=0A>=20+=7D=0D=0A>=20+=0D=0A>=20=20static=20const=20struc=
t=20gpio_chip=20samsung_gpiolib_chip=20=3D=20=7B=0D=0A>=20=20=09.request=20=
=3D=20gpiochip_generic_request,=0D=0A>=20=20=09.free=20=3D=20gpiochip_gener=
ic_free,=0D=0A>=20=40=40=20-948,6=20+998,7=20=40=40=20static=20const=20stru=
ct=20gpio_chip=20samsung_gpiolib_chip=20=3D=20=7B=0D=0A>=20=20=09.direction=
_output=20=3D=20samsung_gpio_direction_output,=0D=0A>=20=20=09.to_irq=20=3D=
=20samsung_gpio_to_irq,=0D=0A>=20=20=09.add_pin_ranges=20=3D=20samsung_add_=
pin_ranges,=0D=0A>=20+=09.set_config=20=3D=20samsung_gpio_set_config,=0D=0A=
>=20=20=09.owner=20=3D=20THIS_MODULE,=0D=0A>=20=20=7D;=0D=0A>=20=0D=0A>=20d=
iff=20--git=20a/drivers/pinctrl/samsung/pinctrl-samsung.h=0D=0A>=20b/driver=
s/pinctrl/samsung/pinctrl-samsung.h=0D=0A>=20index=20ab791afaabf5..23b70ddc=
accc=20100644=0D=0A>=20---=20a/drivers/pinctrl/samsung/pinctrl-samsung.h=0D=
=0A>=20+++=20b/drivers/pinctrl/samsung/pinctrl-samsung.h=0D=0A>=20=40=40=20=
-61,6=20+61,13=20=40=40=20enum=20pincfg_type=20=7B=0D=0A>=20=20=23define=20=
PIN_CON_FUNC_INPUT=09=090x0=0D=0A>=20=20=23define=20PIN_CON_FUNC_OUTPUT=09=
=090x1=0D=0A>=20=0D=0A>=20+/*=0D=0A>=20+=20*=20Values=20for=20the=20pin=20P=
UD=20register.=0D=0A>=20+=20*/=0D=0A>=20+=23define=20DISABLE_PIN_PULL_UP_DO=
WN=090x0=0D=0A>=20+=23define=20ENABLE_PIN_PULL_DOWN=09=090x1=0D=0A>=20+=23d=
efine=20ENABLE_PIN_PULL_UP=09=090x3=0D=0AUse=20consistent=20naming=20conven=
tions=20as=20per=20this=20file,=20so=20=0D=0APIN_PUD_PULL_UP_DOWN_DISABLE=
=0D=0APIN_PUD_PULL_DOWN_ENABLE=0D=0APIN_PUD_PULL_UP_ENABLE=0D=0A=0D=0A>=20+=
=0D=0A>=20=20/**=0D=0A>=20=20=20*=20enum=20eint_type=20-=20possible=20exter=
nal=20interrupt=20types.=0D=0A>=20=20=20*=20=40EINT_TYPE_NONE:=20bank=20doe=
s=20not=20support=20external=20interrupts=0D=0A>=20--=0D=0A>=202.17.1=0D=0A=
=0D=0A=0D=0A

