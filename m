Return-Path: <linux-gpio+bounces-896-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 990ED801991
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 02:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 064731F21130
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Dec 2023 01:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4F917D8;
	Sat,  2 Dec 2023 01:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Ec6Fc+r4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46979116;
	Fri,  1 Dec 2023 17:37:08 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20231202013704epoutp0314a96f3c01f44f6f9faf51e3ca51dd67~c3-oHhd680848308483epoutp03E;
	Sat,  2 Dec 2023 01:37:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20231202013704epoutp0314a96f3c01f44f6f9faf51e3ca51dd67~c3-oHhd680848308483epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1701481024;
	bh=NAUOP5glSSEGnnndp5/S6z3pH6Eg7w9HHN5zGthYgYA=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Ec6Fc+r47Rs+3Gd9fGyIlmC87RTwHDImblyF5I48EnZqFXu7t6fJaPSVlRF1Xa8xt
	 9DeCrQfWjNnP7GMxBlZl6hXXa5g7noUcHxpemh/3xdtgury3pOhiUv14XXercMlEJG
	 XPtjJ1xxKSwlxCdQKAC85JxSPpvsSeCmWRrB6AuM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTP id
	20231202013703epcas5p37b6db3daf203919987775e5ba43dd5af~c3-nrZGUz2539825398epcas5p31;
	Sat,  2 Dec 2023 01:37:03 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.182]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Shswt4BnDz4x9Pp; Sat,  2 Dec
	2023 01:37:02 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6F.69.19369.E3A8A656; Sat,  2 Dec 2023 10:37:02 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20231202013701epcas5p3e38615b5df70212fd8107a683b17a166~c3-lPdmnM1425014250epcas5p3l;
	Sat,  2 Dec 2023 01:37:01 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231202013701epsmtrp187add00342b07418ef07cb0bf98dba74~c3-lOQwBB3066630666epsmtrp1Y;
	Sat,  2 Dec 2023 01:37:01 +0000 (GMT)
X-AuditID: b6c32a50-9e1ff70000004ba9-9a-656a8a3e9edd
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	91.34.08817.C3A8A656; Sat,  2 Dec 2023 10:37:00 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231202013655epsmtip2f8e6d48c1daad106fce0da14d719f17b~c3-gDer4Z2613526135epsmtip2V;
	Sat,  2 Dec 2023 01:36:55 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sam Protsenko'" <semen.protsenko@linaro.org>, "'Peter Griffin'"
	<peter.griffin@linaro.org>
Cc: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mturquette@baylibre.com>, <conor+dt@kernel.org>, <sboyd@kernel.org>,
	<tomasz.figa@gmail.com>, <s.nawrocki@samsung.com>,
	<linus.walleij@linaro.org>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<cw00.choi@samsung.com>, <tudor.ambarus@linaro.org>,
	<andre.draszik@linaro.org>, <saravanak@google.com>,
	<willmcvicker@google.com>, <soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <kernel-team@android.com>,
	<linux-serial@vger.kernel.org>
In-Reply-To: <CAPLW+4kBOWFPx3Hr-=UoLWvRxCorzBY9RCOiBhfkKcU0LAa21Q@mail.gmail.com>
Subject: RE: [PATCH v5 14/20] pinctrl: samsung: Add gs101 SoC pinctrl
 configuration
Date: Sat, 2 Dec 2023 07:06:53 +0530
Message-ID: <000001da24c0$0b83aab0$228b0010$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMZG2Jo00AXYc5gpqO7ljuo7OX79gFwV0FnAdd5hcEBr5czMK3vif9w
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0zTVxTHc/tr+ytIt58F5qUaLY3GIc9ulF0cOJIB+WUss87wz5INK/xC
	GdB2faAzC4IIQwQEdAQaEZBRHpaBhfF+uAIKyljcoDDEDQUERGAD4+TVreXnNv773nM+537P
	OTeXg/G6cD4nRq6hVHJpnJBtz2zsdnPzPJLxOeXzaMEZNTytZ6LNvNs4WtJnAmToGGSgkecz
	LFTcM8hCKWW1bLRYtAc1Nzmh7NlHGLqyUcFAxkkzC/2Z+RsL1RdvAFTwUycDDZRl4Wj0u04c
	TZUOMND9uyHo7sgKG9UVWJgotaMHR93PvmahDNMmG1nMN5loJttaNTmywUbVrdZLlsc+Q+fH
	xah6+W+AJucsWJCAbGxrZJGGawZArq/lAXJpNBUnW3QPcbLEqCWN1RfY5Li5nU1WGQwssqvI
	gJP1354lh/rOsciWv5JwMruhGpArxr2S1z+JDZBR0ihKJaDkkYqoGHl0oDDseMT7EWI/H5Gn
	yB+9IxTIpfFUoDD4Q4lnaEycdV1CQYI0TmsNSaRqtdD7SIBKodVQAplCrQkUUsqoOKWv0kst
	jVdr5dFeckpzWOTj85bYCp6IlZUbqzDltYOn9ZXPsCTQeyADcDiQ8IWZXeoMYM/hEe0AVplS
	QQawsx6WAfxjmEMnXgBoMuYxbAlbQX/ZAkZDHQCOJbNpaBbAlbpLuC3BJjxhc1ka26adiJOw
	rO4cboMwopUNLfnJW5AdcQyWjDeybNqRCIfLWT9sxZnEftinH8Ns7XEJf9hWHmQLc4mdsL9w
	imnTGOEO9aXzGN2QAK5O61m0Vyi8VT6K0cwuONfbg9NMtj0sXfuY1sHwcpqRRWtH+PROwyuG
	D+cupeH0Vkh4fYNPh2VwoaIW0Po9eGvoKtOGYIQbrG31pp1eg1nrUwy6kgvT03g0fQCmLA4z
	ab0b5l68+MqUhD8OVmI5wFW3bS7dtrl02/rX/W9WApjVgE8p1fHRVKRYKfKUU6f+e+xIRbwR
	bP2kQ5JmcKNu08sEGBxgApCDCZ24I9PRFI8bJf3yDKVSRKi0cZTaBMTWZedifOdIhfUryjUR
	Il9/H18/Pz9f/7f9RMJd3PnUoigeES3VULEUpaRU/9YxOHb8JAY/qEMztE9X8TKHU1PZFZAw
	bXbwFoadDj7LelzDLMx3H/Z0rXleZXzpd+zgKj+PberGFtolTuc54onJIveCFjJEn1tYNbR4
	+IKlTS25Kp3nJkaGzGYJwnYqzDu+ydgxnBz1e+pSY87IV5u7eQ3ywPtPgsDx5SuirJTaXJfY
	0F8TKzYbHPqWyGTL8MI9F4/wGf7aeOzjoNb+o2eaipvCBhfSUh0XS8Z+7kWJG/sTT04f/eBB
	jENcWhb1y0RCyYnRPQO1Hq2fPsANmn35rm/c63vSjb84NfFw8MbIbQ9Z+rudw+nOXwj3htx5
	03zT4uIh9b6+vhpcOVP1PQpPxl20H3Xy6oRMtUwqOoSp1NJ/ANvC98/SBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7bCSvK5NV1aqweFmC4strzazWPyddIzd
	4v2yHkaLNXvPMVlc//Kc1WL+kXOsFs2L17NZvJsrY7Fju4hF34uHzBZT/ixnstj0+Bqrxcee
	e6wWm+f/YbSYcX4fk8WZxb3sFjfW7WO3eLLwDJPFxVOuFqeuf2az2DDjH4tF694j7BaH37Sz
	WnQd+stm8e/aRhaL531AXY+v/2GzWLULaMinW3EWLXdMLVZ9+s9o8fjlP2YHBY9tu7exeqyZ
	t4bR4/evSYwe72+0snvsnHWX3WPBplKPTas62TzuXNvD5rFyzRpWj/1z17B7bF5S73HlRBOr
	x87vDewefVtWMXp83iQXwB/FZZOSmpNZllqkb5fAlfH32kPGguMyFYu617I1MC4U72Lk5JAQ
	MJE4ufgtcxcjF4eQwG5Gia5n+9ggEtIS1zdOYIewhSVW/nsOZgsJPGOU6LmbBGKzCehK7Fjc
	BlYvIpAk8fTjMnaQQcwCd9gk/r1ewwIxtZtJ4sS9X8wgVZwCgRIL7mxjBbGFBYIlWv5dZgKx
	WQRUJE4suwVUw8HBK2ApsXupA0iYV0BQ4uTMJywgNrOAtkTvw1ZGGHvZwtfMEMcpSPx8uowV
	4gg3iQNLbzBD1IhLvDx6hH0Co/AsJKNmIRk1C8moWUhaFjCyrGKUTC0ozk3PLTYsMMpLLdcr
	TswtLs1L10vOz93ECE5PWlo7GPes+qB3iJGJg/EQowQHs5II7/Wn6alCvCmJlVWpRfnxRaU5
	qcWHGKU5WJTEeb+97k0REkhPLEnNTk0tSC2CyTJxcEo1MLWbfmpdWlZxS3LnVHnOhFk/K6YV
	+z3TajCpqjzY05Y20yKfnSvm6qyjxWsOcErq9z6dLrzOqrpK1zNK4/eOLY4uRue4nx5mW7p9
	8VXuK4GP1Cr3V/RdnGi6fFJ9Q0hsxP6leznl528Tny75UcV5jRKL7i797DtFf9TDQ6dzlOio
	rlVs89vH/uc9Z8mt/GN7PZ/oL5ho5Nskeu9XwWk2LcdWz0WTrrDt3Xl6ldLW57uDWyWOcM1R
	C7y/8cTyq0uqrgdZb7cOPewfN9tuZ37Bit0vPqlVTy//aRZ9TcNG7YS6tVWOsZDc9ix3pddJ
	r+PcLIMdVe/XP4ia869a481BkUvLVGXXb55aN9+u4o7+GSWW4oxEQy3mouJEAL9e0hm+AwAA
X-CMS-MailID: 20231202013701epcas5p3e38615b5df70212fd8107a683b17a166
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231202004026epcas5p4d3947d7bb99e54f70ca37272cfdc5e55
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
	<20231201160925.3136868-15-peter.griffin@linaro.org>
	<CGME20231202004026epcas5p4d3947d7bb99e54f70ca37272cfdc5e55@epcas5p4.samsung.com>
	<CAPLW+4kBOWFPx3Hr-=UoLWvRxCorzBY9RCOiBhfkKcU0LAa21Q@mail.gmail.com>



> -----Original Message-----
> From: Sam Protsenko <semen.protsenko=40linaro.org>
> Sent: Saturday, December 2, 2023 6:10 AM
> To: Peter Griffin <peter.griffin=40linaro.org>
> Cc: robh+dt=40kernel.org; krzysztof.kozlowski+dt=40linaro.org;
> mturquette=40baylibre.com; conor+dt=40kernel.org; sboyd=40kernel.org;
> tomasz.figa=40gmail.com; s.nawrocki=40samsung.com; linus.walleij=40linaro=
.org;
> wim=40linux-watchdog.org; linux=40roeck-us.net; catalin.marinas=40arm.com=
;
> will=40kernel.org; arnd=40arndb.de; olof=40lixom.net;
> gregkh=40linuxfoundation.org; jirislaby=40kernel.org;
> cw00.choi=40samsung.com; alim.akhtar=40samsung.com;
> tudor.ambarus=40linaro.org; andre.draszik=40linaro.org;
> saravanak=40google.com; willmcvicker=40google.com; soc=40kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org; linux-
> gpio=40vger.kernel.org; linux-watchdog=40vger.kernel.org; kernel-
> team=40android.com; linux-serial=40vger.kernel.org
> Subject: Re: =5BPATCH v5 14/20=5D pinctrl: samsung: Add gs101 SoC pinctrl
> configuration
>=20
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM=20Peter=20Griffin=20<peter.griffi=
n=40linaro.org>=0D=0A>=20wrote:=0D=0A>=20>=0D=0A>=20>=20Add=20support=20for=
=20the=20pin-controller=20found=20on=20the=20gs101=20SoC=20used=20in=0D=0A>=
=20>=20Pixel=206=20phones.=0D=0A>=20>=0D=0A>=20>=20Signed-off-by:=20Peter=
=20Griffin=20<peter.griffin=40linaro.org>=0D=0A>=20>=20---=0D=0A>=20>=20=20=
.../pinctrl/samsung/pinctrl-exynos-arm64.c=20=20=20=20=7C=20159=20+++++++++=
+++++++++=0D=0A>=20>=20=20drivers/pinctrl/samsung/pinctrl-exynos.c=20=20=20=
=20=20=20=7C=20=20=202=20+=0D=0A>=20>=20=20drivers/pinctrl/samsung/pinctrl-=
exynos.h=20=20=20=20=20=20=7C=20=2034=20++++=0D=0A>=20>=20=20drivers/pinctr=
l/samsung/pinctrl-samsung.c=20=20=20=20=20=7C=20=20=202=20+=0D=0A>=20>=20=
=20drivers/pinctrl/samsung/pinctrl-samsung.h=20=20=20=20=20=7C=20=20=201=20=
+=0D=0A>=20>=20=205=20files=20changed,=20198=20insertions(+)=0D=0A>=20>=0D=
=0A>=20>=20diff=20--git=20a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c=
=0D=0A>=20>=20b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c=0D=0A>=20>=
=20index=20cb965cf93705..e1a0668ecb16=20100644=0D=0A>=20>=20---=20a/drivers=
/pinctrl/samsung/pinctrl-exynos-arm64.c=0D=0A>=20>=20+++=20b/drivers/pinctr=
l/samsung/pinctrl-exynos-arm64.c=0D=0A>=20>=20=40=40=20-796,3=20+796,162=20=
=40=40=20const=20struct=20samsung_pinctrl_of_match_data=0D=0A>=20fsd_of_dat=
a=20__initconst=20=3D=20=7B=0D=0A>=20>=20=20=20=20=20=20=20=20=20.ctrl=20=
=20=20=20=20=20=20=20=20=20=20=3D=20fsd_pin_ctrl,=0D=0A>=20>=20=20=20=20=20=
=20=20=20=20.num_ctrl=20=20=20=20=20=20=20=3D=20ARRAY_SIZE(fsd_pin_ctrl),=
=0D=0A>=20>=20=20=7D;=0D=0A>=20>=20+=0D=0A>=20>=20+/*=0D=0A>=20>=20+=20*=20=
bank=20type=20for=20non-alive=20type=0D=0A>=20>=20+=20*=20(CON=20bit=20fiel=
d:=204,=20DAT=20bit=20field:=201,=20PUD=20bit=20field:=204,=20DRV=20bit=0D=
=0A>=20>=20+field:=204)=0D=0A>=20>=20+=20*=20(CONPDN=20bit=20field:=202,=20=
PUDPDN=20bit=20field:=204)=20=20*/=20static=20struct=0D=0A>=20>=20+samsung_=
pin_bank_type=20gs101_bank_type_off=20=20=3D=20=7B=0D=0A>=20>=20+=20=20=20=
=20=20=20=20.fld_width=20=3D=20=7B=204,=201,=204,=204,=202,=204,=20=7D,=0D=
=0A>=20>=20+=20=20=20=20=20=20=20.reg_offset=20=3D=20=7B=200x00,=200x04,=20=
0x08,=200x0c,=200x10,=200x14,=20=7D,=20=7D;=0D=0A>=20=0D=0A>=20This=20is=20=
just=20the=20same=20as=20exynos850_bank_type_off=20(100%=20duplication).=0D=
=0A>=20Here=20is=20what=20I=20suggest.=20Now=20that=20it's=20obvious=20ther=
e=20is=20some=20common=20platform=0D=0A>=20for=20moder=20Exynos=20SoCs,=20a=
nd=20it's=20probably=20Exynos9,=20I'd=20suggest=20next=20course=20of=0D=0A>=
=20action=20(if=20maintainers=20agree):=0D=0A>=20=20=201.=20Remove=20this=
=20one=0D=0A>=20=20=202.=20Rename=20exynos850_bank_type_off=20to=20exynos9_=
bank_type_off=0D=0A>=20=20=203.=20Use=20it=20for=20both=20gs101=20and=20exy=
nos850=0D=0A>=20=0D=0A>=20Does=20it=20make=20sense?=0D=0A>=20=0D=0AMy=20opi=
nion=20is=20to=20reuse=20exynos850=20for=20gs101=20(wherever=20applicable),=
=20same=20philosophy=20was=20historically=20followed=20in=20this=20file.=0D=
=0AThat=20way=20(using=20exynos850=20for=20gs101)=20things=20will=20be=20si=
mple.=20=0D=0AAdding=20exynos9_*=20is=20not=20adding=20any=20benefit,=20rat=
her=20it=20create=20confusion.=0D=0A=0D=0A>=20>=20+=0D=0A>=20>=20+/*=0D=0A>=
=20>=20+=20*=20bank=20type=20for=20alive=20type=0D=0A>=20>=20+=20*=20(CON=
=20bit=20field:=204,=20DAT=20bit=20field:=201,=20PUD=20bit=20field:=204,=20=
DRV=20bit=0D=0A>=20>=20+field:=204)=20=20*/=20static=20const=20struct=20sam=
sung_pin_bank_type=0D=0A>=20>=20+gs101_bank_type_alive=20=3D=20=7B=0D=0A>=
=20>=20+=20=20=20=20=20=20=20.fld_width=20=3D=20=7B=204,=201,=204,=204,=20=
=7D,=0D=0A>=20>=20+=20=20=20=20=20=20=20.reg_offset=20=3D=20=7B=200x00,=200=
x04,=200x08,=200x0c,=20=7D,=20=7D;=0D=0A=5B...=5D=0D=0A=0D=0A

