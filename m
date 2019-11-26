Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C52110977C
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2019 02:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbfKZBOw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Nov 2019 20:14:52 -0500
Received: from mailout3.samsung.com ([203.254.224.33]:29749 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKZBOw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Nov 2019 20:14:52 -0500
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20191126011448epoutp03e5f4088856479e640ac28144df9a8689~akWZouhZ60171601716epoutp037
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2019 01:14:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20191126011448epoutp03e5f4088856479e640ac28144df9a8689~akWZouhZ60171601716epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1574730888;
        bh=qWv1nppkeTYmHRJPMpTCBTwc9cQ4Z7/0In6wd4P3aiw=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=deYa45UWsjnz7lPd6cpDYZB3AoNa6d2ks7hB7UYjgB763aYQem/4F40JrYgyc4gxt
         vPeLNi20vXKpj4jNmwO86it/GxXa4O0axTUNH/8skG/xYaLuHg3mt6075+9qfwu61P
         0tM81M84V9J4Ys/YAsqli2XNCvtgwQSaDnS6R/go=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTP id
        20191126011448epcas2p386e62dfedb12cc84acff2d908913f5e3~akWZVjisC1490214902epcas2p3R;
        Tue, 26 Nov 2019 01:14:48 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.185]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 47MQtF6s0DzMqYkv; Tue, 26 Nov
        2019 01:14:45 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        74.5F.24889.48C7CDD5; Tue, 26 Nov 2019 10:14:44 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20191126011443epcas2p446cdece191e5f8db67971059a182a063~akWVHSB8A1168911689epcas2p4x;
        Tue, 26 Nov 2019 01:14:43 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191126011443epsmtrp2314e73504a5a76bf566b607b66565c37~akWVGla981613716137epsmtrp2q;
        Tue, 26 Nov 2019 01:14:43 +0000 (GMT)
X-AuditID: b6c32a45-493ff70000016139-dd-5ddc7c84002f
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        74.D2.10238.38C7CDD5; Tue, 26 Nov 2019 10:14:43 +0900 (KST)
Received: from KORNO0023990000 (unknown [12.36.165.128]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191126011443epsmtip20ed8f84c1ae068d88c32844ceeaa9994~akWU8MX6-3130031300epsmtip2l;
        Tue, 26 Nov 2019 01:14:43 +0000 (GMT)
From:   "Hyunki Koo" <hyunki00.koo@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzk@kernel.org>
Cc:     "'Tomasz Figa'" <tomasz.figa@gmail.com>, <s.nawrocki@samsung.com>,
        <linus.walleij@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <CAJKOXPckbRowhCmnJfT8-DT3gYaTpDOf0wVxmxdf-tZpOyM5ew@mail.gmail.com>
Subject: RE: [PATCH] pinctrl: samsung: modularize samsung pinctrl driver
Date:   Tue, 26 Nov 2019 10:14:42 +0900
Message-ID: <028901d5a3f6$e2d72310$a8856930$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 14.0
Content-Language: ko
Thread-Index: AQJ+RvWTv0zrR0xzbBBQ4/Koidr2qQIbsHhoAgL+PSumKmWXkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTURjGObvb3Z22uk3Nw+hjXCu0mu6aW3eVfZqttDCCBHHMi7tNcV/s
        bpERpRGa9mn1x1rSd2nTsqaEiZqoYRkqUYqVIeZHopampBUGbbtF/vc7zznP+77POQdDJOWo
        FMs02xmbmTYSaAD/SVOESn7yaI9W0XcnmOroeCSkLs+W8ChPf5eAqrw+C6g3NcUo5eyo51FN
        Y/kCyl0zC7Zgmqeuj0KNx12Aanq6alFN5Z3jmnNVbqCZ8ixNQlOMGzMYWs/YZIw53aLPNBti
        iYT9uu06pUpBykk1tY6QmWkTE0vEJSbJ4zON3nkI2SHa6PBKSTTLElGbNtosDjsjy7Cw9liC
        seqNVpK0RrK0iXWYDZHpFtN6UqGIVnpPphkz7t/8zLfe1R5uGX3LywFtKYVAhEE8BuYP54NC
        EIBJ8GoAa0fLedxiEsCh/Lq/O9MAlt1q4hcCzG9pntjM6XUA5uYOIb5SEvwLgKWTyT5GcTl8
        c3uA5+NgL1d2lwh9BsRX1Vk35C8kwvfBL6f9Z4JwDXzePgx8zMdXwF6Py6+LcTXsOj8u5Hgh
        fHllgO9jBF8N790cRbgIMljdNgo4PRheLchDuL7bYNevKn8AiE+h0PnpBMIFiINVFcmcNwiO
        tFQJOZbCqa91KMfHYX1ekZDzngHw58SggNtYC11DvvvCvM0iYEVNFFcyDDa//zvafHiq6beQ
        k8XwVJ6EM66ED6eHeRwvhuWDNcILgHDNCeaaE8w1J4zrf68bgO8GixgrazIwbLSVnPvUHuD/
        qat2VANne2IjwDFAzBP/aPuglQjoQ2y2qRFADCGCxfFt3VqJWE9nH2FsFp3NYWTYRqD03nsR
        Ig1Jt3j/vdmuI5XRKpVCraSUqmiKCBVXBr5LleAG2s5kMYyVsf3z8TCRNAes+XavcIbdc7C/
        NSvg1eSlBcmiBulrvkMU8Vg7EzNcfwBJUy9LLZhJ22u4VnLsxYD6WVnvBfn4QPaDrUcublie
        F9re2/K9Fx1D9JFjO90pIUWHWzcHhTubw3TXpuXhDdOBZLtStmTk7MrigNL0QOZ2XF/56q+7
        dks6BeA1XdyZYCH4bAZNrkJsLP0Hgd1ywb8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsWy7bCSvG5zzZ1Ygy1LDC3On9/AbjHlz3Im
        i02Pr7FabJ7/h9Hi8q45bBYzzu9jsjj8pp3VYtWuP4wOHB47Z91l99i0qpPN4861PWwem5fU
        e/RtWcXo8XmTXABbFJdNSmpOZllqkb5dAlfG/2l3GQtuOlY0P17F3MDYYNbFyMEhIWAiceSD
        fRcjF4eQwG5GicfTL7J2MXICxWUkJrxYwgxhC0vcbznCClH0mlFi468DTCAJNgFdicuLn4DZ
        IkD25hvL2UFsZoEfjBIzj3pANFxglDjVv48VZBunQKDE226wemEBD4mj514wgtgsAqoS9zfN
        AovzClhKXOt/zw5hC0qcnPmEBWKmtkTvw1ZGGHvZwtdQxylI7Dj7GiouIjG7s40Z4h4niWu/
        tjBOYBSehWTULCSjZiEZNQtJ+wJGllWMkqkFxbnpucWGBYZ5qeV6xYm5xaV56XrJ+bmbGMHx
        paW5g/HykvhDjAIcjEo8vD/O3o4VYk0sK67MPcQowcGsJMLrdvZGrBBvSmJlVWpRfnxRaU5q
        8SFGaQ4WJXHep3nHIoUE0hNLUrNTUwtSi2CyTBycUg2Mi59f2rHE4AHzhaexru9tjRiqGU+3
        9Rpem1AhH5s3e+mxDxvLe/RtgoQtCuo3b1PwnNZ7g3H9eY9088i9Rxkvp8nc7b207HbtTcng
        olMFj+UXefy5Lq/n4bn5r3da5+70DzyntlVxRub4v+addzG8+UVNY13QS+Ew3aItzQ3BS/lO
        5E9RttinxFKckWioxVxUnAgAZVAhO6sCAAA=
X-CMS-MailID: 20191126011443epcas2p446cdece191e5f8db67971059a182a063
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191121072643epcas2p452071a503725c7764acf5084d24425b1
References: <CGME20191121072643epcas2p452071a503725c7764acf5084d24425b1@epcas2p4.samsung.com>
        <001001d5a03d$05de1f70$119a5e50$@samsung.com>
        <CAJKOXPckbRowhCmnJfT8-DT3gYaTpDOf0wVxmxdf-tZpOyM5ew@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Nov 2019 at 16:38, Krzysztof Kozlowski <krzk=40kernel.org> wrote=
:
> Hi,
>
> Thanks for the patch. Few comments below:
>
> On Thu, 21 Nov 2019 at 15:26, =EA=B5=AC=ED=98=84=EA=B8=B0=20<hyunki00.koo=
=40samsung.com>=20wrote:=0D=0A>>=0D=0A>>=20Enable=20samsung=20pinctrl=20dri=
ver=20to=20be=20compiled=20as=20modules.=0D=0A>=0D=0A>=20Why?=20What's=20th=
e=20benefit?=20Are=20platforms=20capable=20of=20such=20boot?=20Pinctrl=20is=
=20needed=20early=20-=20even=20before=20mounting=20rootfs...=0D=0A>=20What=
=20about=20module=20unloading?=20Is=20it=20reasonable?=0D=0A>=20Please=20an=
swer=20to=20all=20this=20also=20in=20commit=20message.=0D=0A>=0D=0A=0D=0ASo=
rry=20to=20late=20and=20Thank=20you=20for=20your=20comment,=20I=20would=20l=
ike=20to=20apply=20GKI=20on=20the=20pinctrl=20driver=0D=0ASo=20I=20would=20=
like=20to=20cut=20off=20dependency=20from=20ARCH_EXYNOS.=0D=0AI=20will=20sp=
lit=20into=20two=20part,=0D=0AFirst,=20cut=20off=20the=20dependency=20with=
=20ARCH_EXYNOS=20in=20arch/arm64/Kconfig.platform.=0D=0ASecond,=20I=20will=
=20make=20the=20pinctrl=20driver=20as=20a=20module.=0D=0A=0D=0A>>=0D=0A>>=
=20Change-Id:=20I92a9953c92831a316f7f50146898ff19831549ec=0D=0A>=0D=0A>=20T=
his=20does=20not=20belong=20to=20Git.=0D=0A>=0D=0A>>=20Signed-off-by:=20Hyu=
nki=20Koo=20<hyunki00.koo=40samsung.com>=0D=0A>=0D=0A>You=20=22From=22=20na=
me=20is=20different=20than=20written=20here=20in=20Signed-off-by.=20They=20=
should=20match=20and=20I=20do=20not=20know=20Korean=20to=20be=20able=20to=
=20tell=20whether=20they=20really=20match=20or=20not=20:).=0D=0A>How=20abou=
t=20using=20Latin=20transliteration=20also=20in=20=22From=22=20field?=0D=0A=
>=0D=0A>>=20---=0D=0A>>=20=20drivers/pinctrl/samsung/Kconfig=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=7C=20=205=20+----=0D=0A>>=20=20drivers/pi=
nctrl/samsung/Makefile=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=7C=2013=
=20+++++++------=0D=0A>>=20=20drivers/pinctrl/samsung/pinctrl-exynos-arm.c=
=20=20=20=7C=20=202=20++=0D=0A>>=20=20drivers/pinctrl/samsung/pinctrl-exyno=
s-arm64.c=20=7C=20=202=20++=0D=0A>>=20=20drivers/pinctrl/samsung/pinctrl-ex=
ynos.c=20=20=20=20=20=20=20=7C=20=202=20++=0D=0A>>=20=20drivers/pinctrl/sam=
sung/pinctrl-samsung.c=20=20=20=20=20=20=7C=2013=20+++++++++++++=0D=0A>>=20=
=206=20files=20changed,=2027=20insertions(+),=2010=20deletions(-)=0D=0A>>=
=0D=0A>>=20diff=20--git=20a/drivers/pinctrl/samsung/Kconfig=20=0D=0A>>=20b/=
drivers/pinctrl/samsung/Kconfig=20index=20425fadd6c346..25e16984ef23=20=0D=
=0A>>=20100644=0D=0A>>=20---=20a/drivers/pinctrl/samsung/Kconfig=0D=0A>>=20=
+++=20b/drivers/pinctrl/samsung/Kconfig=0D=0A>>=20=40=40=20-3,14=20+3,13=20=
=40=40=0D=0A>>=20=20=23=20Samsung=20Pin=20control=20drivers=0D=0A>>=20=20=
=23=0D=0A>>=20=20config=20PINCTRL_SAMSUNG=0D=0A>>=20-=20=20=20=20=20=20=20b=
ool=0D=0A>>=20+=20=20=20=20=20=20=20tristate=20=22Pinctrl=20driver=20data=
=20for=20Samsung=20SoCs=22=0D=0A>>=20=20=20=20=20=20=20=20=20select=20PINMU=
X=0D=0A>>=20=20=20=20=20=20=20=20=20select=20PINCONF=0D=0A>>=0D=0A>>=20=20c=
onfig=20PINCTRL_EXYNOS=0D=0A>>=20=20=20=20=20=20=20=20=20bool=20=22Pinctrl=
=20driver=20data=20for=20Samsung=20EXYNOS=20SoCs=22=0D=0A>>=20=20=20=20=20=
=20=20=20=20depends=20on=20OF=20&&=20GPIOLIB=20&&=20(ARCH_EXYNOS=20=7C=7C=
=20ARCH_S5PV210)=0D=0A>>=20-=20=20=20=20=20=20=20select=20PINCTRL_SAMSUNG=
=0D=0A>>=20=20=20=20=20=20=20=20=20select=20PINCTRL_EXYNOS_ARM=20if=20ARM=
=20&&=20(ARCH_EXYNOS=20=7C=7C=20ARCH_S5PV210)=0D=0A>>=20=20=20=20=20=20=20=
=20=20select=20PINCTRL_EXYNOS_ARM64=20if=20ARM64=20&&=20ARCH_EXYNOS=0D=0A>>=
=0D=0A>>=20=40=40=20-25,9=20+24,7=20=40=40=20config=20PINCTRL_EXYNOS_ARM64=
=20=20config=20PINCTRL_S3C24XX=0D=0A>>=20=20=20=20=20=20=20=20=20bool=20=22=
Samsung=20S3C24XX=20SoC=20pinctrl=20driver=22=0D=0A>>=20=20=20=20=20=20=20=
=20=20depends=20on=20ARCH_S3C24XX=20&&=20OF=0D=0A>>=20-=20=20=20=20=20=20=
=20select=20PINCTRL_SAMSUNG=0D=0A>>=0D=0A>>=20=20config=20PINCTRL_S3C64XX=
=0D=0A>>=20=20=20=20=20=20=20=20=20bool=20=22Samsung=20S3C64XX=20SoC=20pinc=
trl=20driver=22=0D=0A>>=20=20=20=20=20=20=20=20=20depends=20on=20ARCH_S3C64=
XX=0D=0A>>=20-=20=20=20=20=20=20=20select=20PINCTRL_SAMSUNG=0D=0A>>=20diff=
=20--git=20a/drivers/pinctrl/samsung/Makefile=0D=0A>>=20b/drivers/pinctrl/s=
amsung/Makefile=0D=0A>>=20index=20ed951df6a112..b3ac01838b8a=20100644=0D=0A=
>>=20---=20a/drivers/pinctrl/samsung/Makefile=0D=0A>>=20+++=20b/drivers/pin=
ctrl/samsung/Makefile=0D=0A>>=20=40=40=20-1,9=20+1,10=20=40=40=0D=0A>>=20=
=20=23=20SPDX-License-Identifier:=20GPL-2.0=0D=0A>>=20=20=23=20Samsung=20pi=
n=20control=20drivers=0D=0A>>=0D=0A>>=20-obj-=24(CONFIG_PINCTRL_SAMSUNG)=20=
=20+=3D=20pinctrl-samsung.o=0D=0A>>=20-obj-=24(CONFIG_PINCTRL_EXYNOS)=20=20=
=20+=3D=20pinctrl-exynos.o=0D=0A>>=20-obj-=24(CONFIG_PINCTRL_EXYNOS_ARM)=20=
=20=20=20=20=20=20+=3D=20pinctrl-exynos-arm.o=0D=0A>>=20-obj-=24(CONFIG_PIN=
CTRL_EXYNOS_ARM64)=20=20=20=20=20+=3D=20pinctrl-exynos-arm64.o=0D=0A>>=20-o=
bj-=24(CONFIG_PINCTRL_S3C24XX)=20=20+=3D=20pinctrl-s3c24xx.o=0D=0A>>=20-obj=
-=24(CONFIG_PINCTRL_S3C64XX)=20=20+=3D=20pinctrl-s3c64xx.o=0D=0A>>=20+obj-=
=24(CONFIG_PINCTRL_SAMSUNG)=20=20+=3D=20pinctrl-samsung-super.o=0D=0A>>=20+=
pinctrl-samsung-super-=24(CONFIG_PINCTRL_SAMSUNG)=20=20=20=20=20=20=20=20+=
=3D=20pinctrl-samsung.o=0D=0A>>=20+pinctrl-samsung-super-=24(CONFIG_PINCTRL=
_EXYNOS)=20+=3D=20pinctrl-exynos.o=0D=0A>>=20+pinctrl-samsung-super-=24(CON=
FIG_PINCTRL_EXYNOS_ARM)=20=20=20=20=20+=3D=20pinctrl-exynos-=0D=0A>>=20arm.=
o=0D=0A>>=20+pinctrl-samsung-super-=24(CONFIG_PINCTRL_EXYNOS_ARM64)=20=20=
=20+=3D=20pinctrl-exynos-=0D=0A>>=20arm64.o=0D=0A>>=20+pinctrl-samsung-supe=
r-=24(CONFIG_PINCTRL_S3C24XX)=20=20=20=20=20=20=20=20+=3D=20pinctrl-s3c24xx=
.o=0D=0A>>=20+pinctrl-samsung-super-=24(CONFIG_PINCTRL_S3C64XX)=20=20=20=20=
=20=20=20=20+=3D=20pinctrl-s3c64xx.o=0D=0A>=0D=0A>=20I=20don't=20get=20why=
=20you=20need=20to=20rename=20obj=20to=20pinctrl-samsung-super?=0D=0A=0D=0A=
I=20would=20like=20to=20make=20pinctrl=20as=20a=20super=20module.=20It=20is=
=20many=20dependency=20between=20pinctrl-exynos,=20pinctr-exynos-arm64=20an=
d=20pinctrl-samsung=0D=0A>=0D=0A>>=20diff=20--git=20a/drivers/pinctrl/samsu=
ng/pinctrl-exynos-arm.c=0D=0A>>=20b/drivers/pinctrl/samsung/pinctrl-exynos-=
arm.c=0D=0A>>=20index=2085ddf49a5188..28906bf213c4=20100644=0D=0A>>=20---=
=20a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c=0D=0A>>=20+++=20b/drivers=
/pinctrl/samsung/pinctrl-exynos-arm.c=0D=0A>>=20=40=40=20-14,6=20+14,7=20=
=40=40=0D=0A>>=20=20//=20external=20gpio=20and=20wakeup=20interrupt=20suppo=
rt.=0D=0A>>=0D=0A>>=20=20=23include=20<linux/device.h>=0D=0A>>=20+=23includ=
e=20<linux/module.h>=0D=0A>>=20=20=23include=20<linux/of_address.h>=0D=0A>>=
=20=20=23include=20<linux/slab.h>=0D=0A>>=20=20=23include=20<linux/err.h>=
=0D=0A>>=20=40=40=20-891,3=20+892,4=20=40=40=20const=20struct=20samsung_pin=
ctrl_of_match_data=20=0D=0A>>=20exynos5420_of_data=20__initconst=20=3D=20=
=7B=0D=0A>>=20=20=20=20=20=20=20=20=20.ctrl=20=20=20=20=20=20=20=20=20=20=
=20=3D=20exynos5420_pin_ctrl,=0D=0A>>=20=20=20=20=20=20=20=20=20.num_ctrl=
=20=20=20=20=20=20=20=3D=20ARRAY_SIZE(exynos5420_pin_ctrl),=0D=0A>>=20=20=
=7D;=0D=0A>>=20+MODULE_LICENSE(=22GPL=22);=0D=0A>>=20diff=20--git=20a/drive=
rs/pinctrl/samsung/pinctrl-exynos-arm64.c=0D=0A>>=20b/drivers/pinctrl/samsu=
ng/pinctrl-exynos-arm64.c=0D=0A>>=20index=20b6e56422a700..2b19476ad5ff=2010=
0644=0D=0A>>=20---=20a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c=0D=0A=
>>=20+++=20b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c=0D=0A>>=20=40=
=40=20-14,6=20+14,7=20=40=40=0D=0A>>=20=20//=20external=20gpio=20and=20wake=
up=20interrupt=20support.=0D=0A>>=0D=0A>>=20=20=23include=20<linux/slab.h>=
=0D=0A>>=20+=23include=20<linux/module.h>=0D=0A>>=20=20=23include=20<linux/=
soc/samsung/exynos-regs-pmu.h>=0D=0A>>=0D=0A>>=20=20=23include=20=22pinctrl=
-samsung.h=22=0D=0A>>=20=40=40=20-422,3=20+423,4=20=40=40=20const=20struct=
=20samsung_pinctrl_of_match_data=20=0D=0A>>=20exynos7_of_data=20__initconst=
=20=3D=20=7B=0D=0A>>=20=20=20=20=20=20=20=20=20.ctrl=20=20=20=20=20=20=20=
=20=20=20=20=3D=20exynos7_pin_ctrl,=0D=0A>>=20=20=20=20=20=20=20=20=20.num_=
ctrl=20=20=20=20=20=20=20=3D=20ARRAY_SIZE(exynos7_pin_ctrl),=0D=0A>>=20=20=
=7D;=0D=0A>>=20+MODULE_LICENSE(=22GPL=22);=0D=0A>>=20diff=20--git=20a/drive=
rs/pinctrl/samsung/pinctrl-exynos.c=0D=0A>>=20b/drivers/pinctrl/samsung/pin=
ctrl-exynos.c=0D=0A>>=20index=20ebc27b06718c..630d606330f1=20100644=0D=0A>>=
=20---=20a/drivers/pinctrl/samsung/pinctrl-exynos.c=0D=0A>>=20+++=20b/drive=
rs/pinctrl/samsung/pinctrl-exynos.c=0D=0A>>=20=40=40=20-18,6=20+18,7=20=40=
=40=0D=0A>>=20=20=23include=20<linux/irqdomain.h>=0D=0A>>=20=20=23include=
=20<linux/irq.h>=0D=0A>>=20=20=23include=20<linux/irqchip/chained_irq.h>=0D=
=0A>>=20+=23include=20<linux/module.h>=0D=0A>>=20=20=23include=20<linux/of.=
h>=0D=0A>>=20=20=23include=20<linux/of_irq.h>=0D=0A>>=20=20=23include=20<li=
nux/slab.h>=0D=0A>>=20=40=40=20-713,3=20+714,4=20=40=40=20exynos_retention_=
init(struct=20=0D=0A>>=20samsung_pinctrl_drv_data=20*drvdata,=0D=0A>>=0D=0A=
>>=20=20=20=20=20=20=20=20=20return=20ctrl;=0D=0A>>=20=20=7D=0D=0A>>=20+MOD=
ULE_LICENSE(=22GPL=22);=0D=0A>>=20diff=20--git=20a/drivers/pinctrl/samsung/=
pinctrl-samsung.c=0D=0A>>=20b/drivers/pinctrl/samsung/pinctrl-samsung.c=0D=
=0A>>=20index=20de0477bb469d..4483eaed27f8=20100644=0D=0A>>=20---=20a/drive=
rs/pinctrl/samsung/pinctrl-samsung.c=0D=0A>>=20+++=20b/drivers/pinctrl/sams=
ung/pinctrl-samsung.c=0D=0A>>=20=40=40=20-15,6=20+15,7=20=40=40=0D=0A>>=20=
=20//=20but=20provides=20extensions=20to=20which=20platform=20specific=20im=
plementation=20=0D=0A>>=20of=20the=20gpio=20=20//=20and=20wakeup=20interrup=
ts=20can=20be=20hooked=20to.=0D=0A>>=0D=0A>>=20+=23include=20<linux/module.=
h>=0D=0A>>=20=20=23include=20<linux/init.h>=0D=0A>>=20=20=23include=20<linu=
x/platform_device.h>=0D=0A>>=20=20=23include=20<linux/io.h>=0D=0A>>=20=40=
=40=20-1275,6=20+1276,7=20=40=40=20static=20const=20struct=20of_device_id=
=20=0D=0A>>=20samsung_pinctrl_dt_match=5B=5D=20=3D=20=7B=20=20=23endif=0D=
=0A>>=20=20=20=20=20=20=20=20=20=7B=7D,=0D=0A>>=20=20=7D;=0D=0A>>=20+MODULE=
_DEVICE_TABLE(of,=20samsung_pinctrl_dt_match);=0D=0A>>=0D=0A>>=20=20static=
=20const=20struct=20dev_pm_ops=20samsung_pinctrl_pm_ops=20=3D=20=7B=0D=0A>>=
=20=20=20=20=20=20=20=20=20SET_LATE_SYSTEM_SLEEP_PM_OPS(samsung_pinctrl_sus=
pend,=0D=0A>>=20=40=40=20-1296,3=20+1298,14=20=40=40=20static=20int=20__ini=
t=20samsung_pinctrl_drv_register(void)=0D=0A>>=20=20=20=20=20=20=20=20=20re=
turn=20platform_driver_register(&samsung_pinctrl_driver);=0D=0A>>=20=20=7D=
=0D=0A>>=20=20postcore_initcall(samsung_pinctrl_drv_register);=0D=0A>>=20+=
=0D=0A>>=20+static=20void=20__exit=20samsung_pinctrl_drv_unregister(void)=
=0D=0A>>=20+=7B=0D=0A>>=20+=20=20=20=20=20=20=20platform_driver_unregister(=
&samsung_pinctrl_driver);=0D=0A>>=20+=7D=0D=0A>>=20+module_exit(samsung_pin=
ctrl_drv_unregister);=0D=0A>=0D=0A>=20Since=20.suppress_bind_attrs=20are=20=
defined,=20I=20find=20it=20weird=20to=20be=20able=20to=20unload=20module...=
=20Another=20warning=20sign...=0D=0A=0D=0AOkay=20I=20will=20apply=20your=20=
comment=0D=0A>=0D=0A>>=20+=0D=0A>>=20+=0D=0A>>=20+MODULE_LICENSE(=22GPL=22)=
;=0D=0A>>=20+MODULE_AUTHOR(=22Hyunki=20Koo=20<hyunki00.koo=40samsung.com>=
=22);=0D=0A>=0D=0A>=20I=20cannot=20find=20any=20contributions=20to=20this=
=20file=20from=20you.=20The=20author=20should=20be=20the=20main=20contribut=
or(s).=20You=20need=20to=20go=20through=20history...=0D=0A>=0D=0A>>=20+MODU=
LE_DESCRIPTION(=22Samsung=20Exynos=20PINCTRL=20driver=22);=0D=0A>=0D=0A>=20=
That's=20not=20Exynos=20but=20Samsung-generic=20part...=20Samsung=20Exynos/=
S3C/S5P=20pinctrl=20driver.=0D=0A>=0D=0A=0D=0AOkay=20I=20will=20apply=20you=
r=20comment=0D=0A=0D=0A
