Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A8F41BC89
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 04:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243710AbhI2CDd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 22:03:33 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:51922 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243661AbhI2CDd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 22:03:33 -0400
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20210929020151epoutp013ed79338112059cb43494e55c353e4de~pKImLWIDP0368503685epoutp01J
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 02:01:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20210929020151epoutp013ed79338112059cb43494e55c353e4de~pKImLWIDP0368503685epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1632880911;
        bh=6IjJ2MVMwpILLVgnmhxUb+libLBEmsYv6BtXAkfv+c4=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=cqpB+JUr1fpj+ZKT4rmall0CC+LzflNSYblltMbCtsr16pqpMdpFhNfGhe0/H3Sh3
         vCvmDxqMeBz/xexnFugUSleWpYHbyf5Yf1Y4XH7Xz4uw5JaJX3fs4e9BIy330rohSt
         yvCB8SYFHwcv1WfeIsSEdV4T1D3s/K39Yt6qUYYk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20210929020146epcas2p1f613f6372bf7cad9497325fa8d30bd79~pKIhld2LA0556905569epcas2p1Q;
        Wed, 29 Sep 2021 02:01:46 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.88]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 4HK03j6nj6z4x9QK; Wed, 29 Sep
        2021 02:01:37 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
        epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        A0.88.09472.BF8C3516; Wed, 29 Sep 2021 11:01:31 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20210929020121epcas2p4a31ff7bd24c0530d5d446ad68d2db658~pKIKrPCIa2744827448epcas2p4M;
        Wed, 29 Sep 2021 02:01:21 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210929020121epsmtrp14a178753f05d3dc2089a1f992f3fe73e~pKIKoDV8K1468114681epsmtrp1L;
        Wed, 29 Sep 2021 02:01:21 +0000 (GMT)
X-AuditID: b6c32a48-d5fff70000002500-f5-6153c8fb5353
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        09.CE.08750.1F8C3516; Wed, 29 Sep 2021 11:01:21 +0900 (KST)
Received: from KORCO039056 (unknown [10.229.8.156]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20210929020121epsmtip2990b40985a3f040a08747d6da8a4b2a8~pKIKQsvFn0639906399epsmtip2g;
        Wed, 29 Sep 2021 02:01:21 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Will McVicker'" <willmcvicker@google.com>,
        "'Russell King'" <linux@armlinux.org.uk>,
        "'Krzysztof Kozlowski'" <krzysztof.kozlowski@canonical.com>,
        "'Catalin Marinas'" <catalin.marinas@arm.com>,
        "'Will Deacon'" <will@kernel.org>,
        "'Michael Turquette'" <mturquette@baylibre.com>,
        "'Stephen Boyd'" <sboyd@kernel.org>,
        "'Sylwester Nawrocki'" <s.nawrocki@samsung.com>,
        "'Tomasz Figa'" <tomasz.figa@gmail.com>,
        "'Chanwoo Choi'" <cw00.choi@samsung.com>,
        "'Linus Walleij'" <linus.walleij@linaro.org>,
        "'Alessandro Zummo'" <a.zummo@towertech.it>,
        "'Alexandre Belloni'" <alexandre.belloni@bootlin.com>,
        "'John Stultz'" <john.stultz@linaro.org>,
        "'Thomas Gleixner'" <tglx@linutronix.de>
Cc:     "'Lee Jones'" <lee.jones@linaro.org>,
        "'Geert Uytterhoeven'" <geert@linux-m68k.org>,
        "'Saravana Kannan'" <saravanak@google.com>,
        <kernel-team@android.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>
In-Reply-To: <20210928235635.1348330-9-willmcvicker@google.com>
Subject: RE: [PATCH v2 08/12] pinctrl: samsung: modularize the ARM and ARM64
 pinctrls
Date:   Wed, 29 Sep 2021 11:01:20 +0900
Message-ID: <005501d7b4d5$e60f38f0$b22daad0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG22v7dcW676vpFb/BQW8l6Xu2xWgGPMZ+lApHLJcWr2us3gA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te1BUZRSf7959YZG3BeUDrYFFInGAXeTxQSANj+Y2klL80YyFdIe97fLa
        XfeCiQ0DDck7MYM2VwIkhjfiLhvgIsgs+MiMYFBkkKABQVB5JOIoL1v2avHf7/zO+Z3zO+eb
        T4ALf+E7COIUybRaQSWKeFs4Ld27/dxXrkdR4rxqEarsv81H2XNVfDRfVQDQnSf3uWhquAND
        N1fcUVurLdLNPsPQ2NIVgIpWqzGknxjkon8KRrmouWwVoAFjCQ9drb/FQz/92YkhU3EHQP03
        wlH3o2wuyjOt8dD6oI6DmvXFOKozmgXfjviguscvwPv2ZEt7C5dsKG0A5MBgP07OD53gk6UN
        X5PajO945EXtX3yyXJ9C6utyeeTI4CUeOdfbyydN3TmAbK5MJ08a6gCpKX2OkYv6tyOJQwmB
        cpqS0mpHWhGrlMYpZEGi/VExoTE+vmKJu8Qf+YkcFVQSHSQKi4h0/yAu0XwQkeNRKjHFTEVS
        DCPy3BeoVqYk045yJZMcJKJV0kSVn8qDoZKYFIXMQ0EnB0jEYi8fc+EXCfLbD2ox1ekp7Jhh
        4BqWAX5txPKAlQAS3nC6RAM2sJBoAzCzOSQPbDHjxwDWXFjgsMEigCtDo9xXimzdeYxNGAG8
        0XyZywbTAD7S91t68QhPOJPTYknYEpe4cKWvwCLBiVkMTpwfxjeqrIhgOLI6Y3FiQ3wKf7zf
        YeE5hAvM1PWZ1QKBNeEPjQNhG7Q18Sb87cw9zgbGiT2w6txDnLXkCJ9PVlns2RIhsHehls/W
        2MKzuVn4xlxIjFvB0SodZ6MnJMLglbtSVmsDH1wz8FnsAGcKs/hsfT6AJ8ZfvEzUA5j7TQSL
        g+GyxmDxhhO7YZPRk23pDHuGX1p7A+Z0r/FZ2hrmZAlZoSvsatVwWPwWzC9Z5J4CIu2mxbSb
        FtNuWkD7/6xywKkD22kVkySjGS+V93/PHatM0gPLb3Ej28DZ2QUPE8AEwASgABfZWj+zi6KE
        1lIq9TitVsaoUxJpxgR8zJf+HnfYFqs0fzdFcozE21/s7esr8fPyEfuJ7Kx/Xg+hhISMSqYT
        aFpFq1/pMIGVQwYWsO93uOxECvfmxdhuXzVEf7TT362m74JnWFP8scxl1x0Hfihy3qoiGu92
        H6juPJp2bmJboXeduGdkV7pwR5c89npI/QI+myrzfTf4ZhHTghe67HSYbPo7cDH646Q/MlKZ
        yQ/LsndlLRUsSJwHImpl5V/NPV0v3h9TIWcGDhqq7U1T5XbDS02GWM4dFyflvHD4vfCKscVo
        e6PudKXMkZgebydee/LZ/Na9NUdcTWkzocEV6vxTjfRczvGto4PhZ5xtNGNBr3PEa+8sx3to
        pT2hneqH2Xs+94n/pObL3LzDAQ33NJqhw0fSW5vTDj1tvOwpvXrQySDtArcGYZk7PHnR1M4R
        cRg5JXHD1Qz1L3Iat7G2BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7bCSvO7HE8GJBs87BC2WXLzKbtH+bhm7
        xftlPYwW1788Z7V4dmsvk8WZ37oWO7aLWGx8+4PJ4v7Xo4wWU/4sZ7LY9Pgaq8XHnnusFpvn
        /2G0uLxrDpvFsdVX2CxmnN/HZHFo6l5Gi4unXC0Ov2lnteg69JfN4t+1jSwWmzdNZbZYtQuo
        oeWOqcWqT/8ZHSQ9tu3exuqxZt4aRo/L1y4ye7y/0cruMW9Ntceshl42j52z7rJ7LNhU6rFp
        VSebx51re9g83p07x+5x6HAHo8fmJfUefVtWMXpMn/eTyePzJrkAgSgum5TUnMyy1CJ9uwSu
        jMa+pcwFky8zVazYfZS9gfHLLKYuRk4OCQETifaN64BsLg4hgR2MEpvbNrFBJGQlnr3bwQ5h
        C0vcbznCClH0jFHiYW8jI0iCTUBf4mXHNlYQW0TgCKvEys96IEXMAl+ZJD68vgk19jCjxIZV
        T8FGcQrYS9z58xJst7BAqMTHi8vAJrEIqEo0b7wANImDg1fAUmLXZReQMK+AoMTJmU9YQGxm
        AW2JpzefwtnLFr5mhrhOQeLn02VQRzhJnPuwkh2iRkRidmcb8wRG4VlIRs1CMmoWklGzkLQs
        YGRZxSiZWlCcm55bbFhglJdarlecmFtcmpeul5yfu4kRnGi0tHYw7ln1Qe8QIxMH4yFGCQ5m
        JRHeH+LBiUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUw
        HRBo2HjTodyOad05syvBx6aW3GV7e+Pb2hDJe4/e6zlI8Am6BrrVlb+M1314KWm74zaRqtQt
        B0/kH93UcPuEx3Z+n2dCWkI+FTfkD1ge+JLgsWMa85UXVzhW7jjY7j5Nr8QupHyt78eu4tRw
        v+tHFypEK7DPbM7OCDMvckt6ZHZzwxx2dSGNs7YX1X5OM5a+J3zlm97Jp0p8v4X5/wYIH6pw
        WMcqu9q8u02gWaD3T9fFEws8X+VGKp9ff03OlJ+56OpBlvZ1VTuXHc42iU9InjXB3Nb/dWGF
        wKyydkHFoETvJKdzc8+eb8y6uefD47Z9NRPW7bJNu3blh+TRe433JhvMPa25LLcq+XD1y7vS
        SizFGYmGWsxFxYkARsDDcqMDAAA=
X-CMS-MailID: 20210929020121epcas2p4a31ff7bd24c0530d5d446ad68d2db658
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210928235735epcas2p37cda2826b65deb8825449a3b71b50d17
References: <20210928235635.1348330-1-willmcvicker@google.com>
        <CGME20210928235735epcas2p37cda2826b65deb8825449a3b71b50d17@epcas2p3.samsung.com>
        <20210928235635.1348330-9-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> This patch modularizes the Samsung Exynos ARM and ARM64 pinctrl drivers.
> It creates 2 kernel modules (pending Kconfig changes):

Hmm. I think we can use pinctrl-samsung.ko as a super module because chip-s=
pecific objects can be selectable by Kconfig option.
So, we don't need to separate them.

>=20
> 1) pinctrl-samsung.ko: common pinctrl driver for all the samsung pinctrl
>    drivers.
> 2) pinctrl_exynos.ko: ARM and ARM64 pinctrl driver.
>=20
> Signed-off-by: Will McVicker <willmcvicker=40google.com>
> ---
>  drivers/pinctrl/samsung/Makefile              =7C  13 +--
>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c  =7C 102 ++++++++++--------
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    =7C  73 +++++++------
>  drivers/pinctrl/samsung/pinctrl-exynos.c      =7C  17 +--
>  drivers/pinctrl/samsung/pinctrl-samsung.c     =7C  11 +-
>  5 files changed, 117 insertions(+), 99 deletions(-)
>=20
> diff --git a/drivers/pinctrl/samsung/Makefile
> b/drivers/pinctrl/samsung/Makefile
> index ed951df6a112..767ce3357a19 100644
> --- a/drivers/pinctrl/samsung/Makefile
> +++ b/drivers/pinctrl/samsung/Makefile
> =40=40 -1,9 +1,10 =40=40
>  =23 SPDX-License-Identifier: GPL-2.0
>  =23 Samsung pin control drivers
>=20
> -obj-=24(CONFIG_PINCTRL_SAMSUNG)	+=3D pinctrl-samsung.o
> -obj-=24(CONFIG_PINCTRL_EXYNOS)	+=3D pinctrl-exynos.o
> -obj-=24(CONFIG_PINCTRL_EXYNOS_ARM)	+=3D pinctrl-exynos-arm.o
> -obj-=24(CONFIG_PINCTRL_EXYNOS_ARM64)	+=3D pinctrl-exynos-arm64.o
> -obj-=24(CONFIG_PINCTRL_S3C24XX)	+=3D pinctrl-s3c24xx.o
> -obj-=24(CONFIG_PINCTRL_S3C64XX)	+=3D pinctrl-s3c64xx.o
> +obj-=24(CONFIG_PINCTRL_SAMSUNG)			+=3D pinctrl-samsung.o
> +obj-=24(CONFIG_PINCTRL_EXYNOS)			+=3D pinctrl_exynos.o
> +pinctrl_exynos-y				+=3D pinctrl-exynos.o
> +pinctrl_exynos-=24(CONFIG_PINCTRL_EXYNOS_ARM)	+=3D pinctrl-exynos-arm.o
> +pinctrl_exynos-=24(CONFIG_PINCTRL_EXYNOS_ARM64)	+=3D pinctrl-exynos-arm6=
4.o
> +obj-=24(CONFIG_PINCTRL_S3C24XX)			+=3D pinctrl-s3c24xx.o
> +obj-=24(CONFIG_PINCTRL_S3C64XX)			+=3D pinctrl-s3c64xx.o
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> index 85ddf49a5188..f3bd8cf1bbb6 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm.c
> =40=40 -83,12 +83,12 =40=40 s5pv210_retention_init(struct samsung_pinctrl=
_drv_data
> *drvdata,
>  	return ctrl;
>  =7D
>=20
> -static const struct samsung_retention_data s5pv210_retention_data
> __initconst =3D =7B
> +static const struct samsung_retention_data s5pv210_retention_data =3D =
=7B
>  	.init	 =3D s5pv210_retention_init,
>  =7D;

Any reason why do we need to drop __initconst and __init?
AFAIK, they will be automatically converted in case of MODULE.

>=20
>  /* pin banks of s5pv210 pin-controller */ -static const struct
> samsung_pin_bank_data s5pv210_pin_bank=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data s5pv210_pin_bank=5B=5D =3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(4, 0x020, =22gpa1=22, 0x04), =40=40 -126,7 +126,7=
 =40=40
> static const struct samsung_pin_bank_data s5pv210_pin_bank=5B=5D __initco=
nst =3D
> =7B
>  	EXYNOS_PIN_BANK_EINTW(8, 0xc60, =22gph3=22, 0x0c),  =7D;
>=20
> -static const struct samsung_pin_ctrl s5pv210_pin_ctrl=5B=5D __initconst =
=3D =7B
> +static const struct samsung_pin_ctrl s5pv210_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 data */
>  		.pin_banks	=3D s5pv210_pin_bank,
> =40=40 -139,16 +139,17 =40=40 static const struct samsung_pin_ctrl
> s5pv210_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data s5pv210_of_data __initconst =
=3D
> =7B
> +const struct samsung_pinctrl_of_match_data s5pv210_of_data =3D =7B
>  	.ctrl		=3D s5pv210_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(s5pv210_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(s5pv210_of_data);
>=20
>  /* Pad retention control code for accessing PMU regmap */  static
> atomic_t exynos_shared_retention_refcnt;
>=20
>  /* pin banks of exynos3250 pin-controller 0 */ -static const struct
> samsung_pin_bank_data exynos3250_pin_banks0=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos3250_pin_banks0=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(6, 0x020, =22gpa1=22, 0x04), =40=40 -160,7 +161,7=
 =40=40
> static const struct samsung_pin_bank_data exynos3250_pin_banks0=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos3250 pin-controller 1 */ -static const struct
> samsung_pin_bank_data exynos3250_pin_banks1=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos3250_pin_banks1=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTN(8, 0x120, =22gpe0=22),
>  	EXYNOS_PIN_BANK_EINTN(8, 0x140, =22gpe1=22), =40=40 -196,7 +197,7 =40=
=40 static
> const u32 exynos3250_retention_regs=5B=5D =3D =7B
>  	S5P_PAD_RET_SPI_OPTION,
>  =7D;
>=20
> -static const struct samsung_retention_data exynos3250_retention_data
> __initconst =3D =7B
> +static const struct samsung_retention_data exynos3250_retention_data =3D
> +=7B
>  	.regs	 =3D exynos3250_retention_regs,
>  	.nr_regs =3D ARRAY_SIZE(exynos3250_retention_regs),
>  	.value	 =3D EXYNOS_WAKEUP_FROM_LOWPWR,
> =40=40 -208,7 +209,7 =40=40 static const struct samsung_retention_data
> exynos3250_retention_data __initconst
>   * Samsung pinctrl driver data for Exynos3250 SoC. Exynos3250 SoC
> includes
>   * two gpio/pin-mux/pinconfig controllers.
>   */
> -static const struct samsung_pin_ctrl exynos3250_pin_ctrl=5B=5D __initcon=
st =3D
> =7B
> +static const struct samsung_pin_ctrl exynos3250_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 data */
>  		.pin_banks	=3D exynos3250_pin_banks0,
> =40=40 -229,13 +230,14 =40=40 static const struct samsung_pin_ctrl
> exynos3250_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data exynos3250_of_data __initcons=
t
> =3D =7B
> +const struct samsung_pinctrl_of_match_data exynos3250_of_data =3D =7B
>  	.ctrl		=3D exynos3250_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(exynos3250_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(exynos3250_of_data);
>=20
>  /* pin banks of exynos4210 pin-controller 0 */ -static const struct
> samsung_pin_bank_data exynos4210_pin_banks0=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos4210_pin_banks0=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(6, 0x020, =22gpa1=22, 0x04), =40=40 -256,7 +258,7=
 =40=40
> static const struct samsung_pin_bank_data exynos4210_pin_banks0=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos4210 pin-controller 1 */ -static const struct
> samsung_pin_bank_data exynos4210_pin_banks1=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos4210_pin_banks1=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpj0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(5, 0x020, =22gpj1=22, 0x04), =40=40 -281,7 +283,7=
 =40=40
> static const struct samsung_pin_bank_data exynos4210_pin_banks1=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos4210 pin-controller 2 */ -static const struct
> samsung_pin_bank_data exynos4210_pin_banks2=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos4210_pin_banks2=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTN(7, 0x000, =22gpz=22),  =7D; =40=40 -296,7 +298,7 =
=40=40
> static const u32 exynos4_retention_regs=5B=5D =3D =7B
>  	S5P_PAD_RET_EBIB_OPTION,
>  =7D;
>=20
> -static const struct samsung_retention_data exynos4_retention_data
> __initconst =3D =7B
> +static const struct samsung_retention_data exynos4_retention_data =3D =
=7B
>  	.regs	 =3D exynos4_retention_regs,
>  	.nr_regs =3D ARRAY_SIZE(exynos4_retention_regs),
>  	.value	 =3D EXYNOS_WAKEUP_FROM_LOWPWR,
> =40=40 -309,7 +311,7 =40=40 static const u32 exynos4_audio_retention_regs=
=5B=5D =3D =7B
>  	S5P_PAD_RET_MAUDIO_OPTION,
>  =7D;
>=20
> -static const struct samsung_retention_data exynos4_audio_retention_data
> __initconst =3D =7B
> +static const struct samsung_retention_data exynos4_audio_retention_data
> +=3D =7B
>  	.regs	 =3D exynos4_audio_retention_regs,
>  	.nr_regs =3D ARRAY_SIZE(exynos4_audio_retention_regs),
>  	.value	 =3D EXYNOS_WAKEUP_FROM_LOWPWR,
> =40=40 -320,7 +322,7 =40=40 static const struct samsung_retention_data
> exynos4_audio_retention_data __initco
>   * Samsung pinctrl driver data for Exynos4210 SoC. Exynos4210 SoC
> includes
>   * three gpio/pin-mux/pinconfig controllers.
>   */
> -static const struct samsung_pin_ctrl exynos4210_pin_ctrl=5B=5D __initcon=
st =3D
> =7B
> +static const struct samsung_pin_ctrl exynos4210_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 data */
>  		.pin_banks	=3D exynos4210_pin_banks0,
> =40=40 -346,13 +348,14 =40=40 static const struct samsung_pin_ctrl
> exynos4210_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data exynos4210_of_data __initcons=
t
> =3D =7B
> +const struct samsung_pinctrl_of_match_data exynos4210_of_data =3D =7B
>  	.ctrl		=3D exynos4210_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(exynos4210_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(exynos4210_of_data);
>=20
>  /* pin banks of exynos4x12 pin-controller 0 */ -static const struct
> samsung_pin_bank_data exynos4x12_pin_banks0=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos4x12_pin_banks0=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(6, 0x020, =22gpa1=22, 0x04), =40=40 -370,7 +373,7=
 =40=40
> static const struct samsung_pin_bank_data exynos4x12_pin_banks0=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos4x12 pin-controller 1 */ -static const struct
> samsung_pin_bank_data exynos4x12_pin_banks1=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos4x12_pin_banks1=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(7, 0x040, =22gpk0=22, 0x08),
>  	EXYNOS_PIN_BANK_EINTG(7, 0x060, =22gpk1=22, 0x0c), =40=40 -398,13 +401,=
13
> =40=40 static const struct samsung_pin_bank_data exynos4x12_pin_banks1=5B=
=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos4x12 pin-controller 2 */ -static const struct
> samsung_pin_bank_data exynos4x12_pin_banks2=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos4x12_pin_banks2=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(7, 0x000, =22gpz=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos4x12 pin-controller 3 */ -static const struct
> samsung_pin_bank_data exynos4x12_pin_banks3=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos4x12_pin_banks3=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpv0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(8, 0x020, =22gpv1=22, 0x04), =40=40 -417,7 +420,7=
 =40=40
> static const struct samsung_pin_bank_data exynos4x12_pin_banks3=5B=5D
> __initconst =3D
>   * Samsung pinctrl driver data for Exynos4x12 SoC. Exynos4x12 SoC
> includes
>   * four gpio/pin-mux/pinconfig controllers.
>   */
> -static const struct samsung_pin_ctrl exynos4x12_pin_ctrl=5B=5D __initcon=
st =3D
> =7B
> +static const struct samsung_pin_ctrl exynos4x12_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 data */
>  		.pin_banks	=3D exynos4x12_pin_banks0,
> =40=40 -453,13 +456,14 =40=40 static const struct samsung_pin_ctrl
> exynos4x12_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data exynos4x12_of_data __initcons=
t
> =3D =7B
> +const struct samsung_pinctrl_of_match_data exynos4x12_of_data =3D =7B
>  	.ctrl		=3D exynos4x12_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(exynos4x12_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(exynos4x12_of_data);
>=20
>  /* pin banks of exynos5250 pin-controller 0 */ -static const struct
> samsung_pin_bank_data exynos5250_pin_banks0=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5250_pin_banks0=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(6, 0x020, =22gpa1=22, 0x04), =40=40 -489,7 +493,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5250_pin_banks0=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5250 pin-controller 1 */ -static const struct
> samsung_pin_bank_data exynos5250_pin_banks1=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5250_pin_banks1=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpe0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(2, 0x020, =22gpe1=22, 0x04), =40=40 -503,7 +507,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5250_pin_banks1=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5250 pin-controller 2 */ -static const struct
> samsung_pin_bank_data exynos5250_pin_banks2=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5250_pin_banks2=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpv0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(8, 0x020, =22gpv1=22, 0x04), =40=40 -513,7 +517,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5250_pin_banks2=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5250 pin-controller 3 */ -static const struct
> samsung_pin_bank_data exynos5250_pin_banks3=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5250_pin_banks3=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(7, 0x000, =22gpz=22, 0x00),  =7D; =40=40 -522,7 +=
526,7
> =40=40 static const struct samsung_pin_bank_data exynos5250_pin_banks3=5B=
=5D
> __initconst =3D
>   * Samsung pinctrl driver data for Exynos5250 SoC. Exynos5250 SoC
> includes
>   * four gpio/pin-mux/pinconfig controllers.
>   */
> -static const struct samsung_pin_ctrl exynos5250_pin_ctrl=5B=5D __initcon=
st =3D
> =7B
> +static const struct samsung_pin_ctrl exynos5250_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 data */
>  		.pin_banks	=3D exynos5250_pin_banks0,
> =40=40 -558,13 +562,14 =40=40 static const struct samsung_pin_ctrl
> exynos5250_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data exynos5250_of_data __initcons=
t
> =3D =7B
> +const struct samsung_pinctrl_of_match_data exynos5250_of_data =3D =7B
>  	.ctrl		=3D exynos5250_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(exynos5250_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(exynos5250_of_data);
>=20
>  /* pin banks of exynos5260 pin-controller 0 */ -static const struct
> samsung_pin_bank_data exynos5260_pin_banks0=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5260_pin_banks0=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(4, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(7, 0x020, =22gpa1=22, 0x04), =40=40 -590,7 +595,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5260_pin_banks0=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5260 pin-controller 1 */ -static const struct
> samsung_pin_bank_data exynos5260_pin_banks1=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5260_pin_banks1=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(7, 0x000, =22gpc0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(6, 0x020, =22gpc1=22, 0x04), =40=40 -600,7 +605,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5260_pin_banks1=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5260 pin-controller 2 */ -static const struct
> samsung_pin_bank_data exynos5260_pin_banks2=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5260_pin_banks2=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(7, 0x000, =22gpz0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(4, 0x020, =22gpz1=22, 0x04), =40=40 -610,7 +615,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5260_pin_banks2=5B=5D
> __initconst =3D
>   * Samsung pinctrl driver data for Exynos5260 SoC. Exynos5260 SoC
> includes
>   * three gpio/pin-mux/pinconfig controllers.
>   */
> -static const struct samsung_pin_ctrl exynos5260_pin_ctrl=5B=5D __initcon=
st =3D
> =7B
> +static const struct samsung_pin_ctrl exynos5260_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 data */
>  		.pin_banks	=3D exynos5260_pin_banks0,
> =40=40 -636,13 +641,14 =40=40 static const struct samsung_pin_ctrl
> exynos5260_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data exynos5260_of_data __initcons=
t
> =3D =7B
> +const struct samsung_pinctrl_of_match_data exynos5260_of_data =3D =7B
>  	.ctrl		=3D exynos5260_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(exynos5260_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(exynos5260_of_data);
>=20
>  /* pin banks of exynos5410 pin-controller 0 */ -static const struct
> samsung_pin_bank_data exynos5410_pin_banks0=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5410_pin_banks0=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(6, 0x020, =22gpa1=22, 0x04), =40=40 -682,7 +688,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5410_pin_banks0=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5410 pin-controller 1 */ -static const struct
> samsung_pin_bank_data exynos5410_pin_banks1=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5410_pin_banks1=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(5, 0x000, =22gpj0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(8, 0x020, =22gpj1=22, 0x04), =40=40 -696,7 +702,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5410_pin_banks1=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5410 pin-controller 2 */ -static const struct
> samsung_pin_bank_data exynos5410_pin_banks2=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5410_pin_banks2=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpv0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(8, 0x020, =22gpv1=22, 0x04), =40=40 -706,7 +712,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5410_pin_banks2=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5410 pin-controller 3 */ -static const struct
> samsung_pin_bank_data exynos5410_pin_banks3=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5410_pin_banks3=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(7, 0x000, =22gpz=22, 0x00),  =7D; =40=40 -715,7 +=
721,7
> =40=40 static const struct samsung_pin_bank_data exynos5410_pin_banks3=5B=
=5D
> __initconst =3D
>   * Samsung pinctrl driver data for Exynos5410 SoC. Exynos5410 SoC
> includes
>   * four gpio/pin-mux/pinconfig controllers.
>   */
> -static const struct samsung_pin_ctrl exynos5410_pin_ctrl=5B=5D __initcon=
st =3D
> =7B
> +static const struct samsung_pin_ctrl exynos5410_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 data */
>  		.pin_banks	=3D exynos5410_pin_banks0,
> =40=40 -748,13 +754,14 =40=40 static const struct samsung_pin_ctrl
> exynos5410_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data exynos5410_of_data __initcons=
t
> =3D =7B
> +const struct samsung_pinctrl_of_match_data exynos5410_of_data =3D =7B
>  	.ctrl		=3D exynos5410_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(exynos5410_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(exynos5410_of_data);
>=20
>  /* pin banks of exynos5420 pin-controller 0 */ -static const struct
> samsung_pin_bank_data exynos5420_pin_banks0=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5420_pin_banks0=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpy7=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTW(8, 0xC00, =22gpx0=22, 0x00), =40=40 -764,7 +771,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5420_pin_banks0=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5420 pin-controller 1 */ -static const struct
> samsung_pin_bank_data exynos5420_pin_banks1=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5420_pin_banks1=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpc0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(8, 0x020, =22gpc1=22, 0x04), =40=40 -782,7 +789,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5420_pin_banks1=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5420 pin-controller 2 */ -static const struct
> samsung_pin_bank_data exynos5420_pin_banks2=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5420_pin_banks2=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpe0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(2, 0x020, =22gpe1=22, 0x04), =40=40 -795,7 +802,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5420_pin_banks2=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5420 pin-controller 3 */ -static const struct
> samsung_pin_bank_data exynos5420_pin_banks3=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5420_pin_banks3=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(6, 0x020, =22gpa1=22, 0x04), =40=40 -809,7 +816,7=
 =40=40
> static const struct samsung_pin_bank_data exynos5420_pin_banks3=5B=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5420 pin-controller 4 */ -static const struct
> samsung_pin_bank_data exynos5420_pin_banks4=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5420_pin_banks4=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(7, 0x000, =22gpz=22, 0x00),  =7D; =40=40 -830,7 +=
837,7
> =40=40 static const u32 exynos5420_retention_regs=5B=5D =3D =7B
>  	EXYNOS5420_PAD_RET_DRAM_COREBLK_OPTION,
>  =7D;
>=20
> -static const struct samsung_retention_data exynos5420_retention_data
> __initconst =3D =7B
> +static const struct samsung_retention_data exynos5420_retention_data =3D
> +=7B
>  	.regs	 =3D exynos5420_retention_regs,
>  	.nr_regs =3D ARRAY_SIZE(exynos5420_retention_regs),
>  	.value	 =3D EXYNOS_WAKEUP_FROM_LOWPWR,
> =40=40 -842,7 +849,7 =40=40 static const struct samsung_retention_data
> exynos5420_retention_data __initconst
>   * Samsung pinctrl driver data for Exynos5420 SoC. Exynos5420 SoC
> includes
>   * four gpio/pin-mux/pinconfig controllers.
>   */
> -static const struct samsung_pin_ctrl exynos5420_pin_ctrl=5B=5D __initcon=
st =3D
> =7B
> +static const struct samsung_pin_ctrl exynos5420_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 data */
>  		.pin_banks	=3D exynos5420_pin_banks0,
> =40=40 -887,7 +894,8 =40=40 static const struct samsung_pin_ctrl
> exynos5420_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data exynos5420_of_data __initcons=
t
> =3D =7B
> +const struct samsung_pinctrl_of_match_data exynos5420_of_data =3D =7B
>  	.ctrl		=3D exynos5420_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(exynos5420_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(exynos5420_of_data);
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> index fe5f6046fbd5..9fb658c65b96 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
> =40=40 -62,7 +62,7 =40=40 static const struct samsung_pin_bank_type
> exynos850_bank_type_alive =3D =7B  static atomic_t
> exynos_shared_retention_refcnt;
>=20
>  /* pin banks of exynos5433 pin-controller - ALIVE */ -static const struc=
t
> samsung_pin_bank_data exynos5433_pin_banks0=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5433_pin_banks0=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS5433_PIN_BANK_EINTW(8, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS5433_PIN_BANK_EINTW(8, 0x020, =22gpa1=22, 0x04), =40=40 -76,32 +7=
6,32
> =40=40 static const struct samsung_pin_bank_data exynos5433_pin_banks0=5B=
=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5433 pin-controller - AUD */ -static const struct
> samsung_pin_bank_data exynos5433_pin_banks1=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5433_pin_banks1=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS5433_PIN_BANK_EINTG(7, 0x000, =22gpz0=22, 0x00),
>  	EXYNOS5433_PIN_BANK_EINTG(4, 0x020, =22gpz1=22, 0x04),  =7D;
>=20
>  /* pin banks of exynos5433 pin-controller - CPIF */ -static const struct
> samsung_pin_bank_data exynos5433_pin_banks2=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5433_pin_banks2=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS5433_PIN_BANK_EINTG(2, 0x000, =22gpv6=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos5433 pin-controller - eSE */ -static const struct
> samsung_pin_bank_data exynos5433_pin_banks3=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5433_pin_banks3=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS5433_PIN_BANK_EINTG(3, 0x000, =22gpj2=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos5433 pin-controller - FINGER */ -static const
> struct samsung_pin_bank_data exynos5433_pin_banks4=5B=5D __initconst =3D =
=7B
> +static const struct samsung_pin_bank_data exynos5433_pin_banks4=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS5433_PIN_BANK_EINTG(4, 0x000, =22gpd5=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos5433 pin-controller - FSYS */ -static const struct
> samsung_pin_bank_data exynos5433_pin_banks5=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5433_pin_banks5=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS5433_PIN_BANK_EINTG(6, 0x000, =22gph1=22, 0x00),
>  	EXYNOS5433_PIN_BANK_EINTG(7, 0x020, =22gpr4=22, 0x04), =40=40 -112,19
> +112,19 =40=40 static const struct samsung_pin_bank_data
> exynos5433_pin_banks5=5B=5D __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5433 pin-controller - IMEM */ -static const struct
> samsung_pin_bank_data exynos5433_pin_banks6=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5433_pin_banks6=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS5433_PIN_BANK_EINTG(8, 0x000, =22gpf0=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos5433 pin-controller - NFC */ -static const struct
> samsung_pin_bank_data exynos5433_pin_banks7=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5433_pin_banks7=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS5433_PIN_BANK_EINTG(3, 0x000, =22gpj0=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos5433 pin-controller - PERIC */ -static const struc=
t
> samsung_pin_bank_data exynos5433_pin_banks8=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5433_pin_banks8=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS5433_PIN_BANK_EINTG(6, 0x000, =22gpv7=22, 0x00),
>  	EXYNOS5433_PIN_BANK_EINTG(5, 0x020, =22gpb0=22, 0x04), =40=40 -146,7 +1=
46,7
> =40=40 static const struct samsung_pin_bank_data exynos5433_pin_banks8=5B=
=5D
> __initconst =3D  =7D;
>=20
>  /* pin banks of exynos5433 pin-controller - TOUCH */ -static const struc=
t
> samsung_pin_bank_data exynos5433_pin_banks9=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos5433_pin_banks9=5B=5D =
=3D =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS5433_PIN_BANK_EINTG(3, 0x000, =22gpj1=22, 0x00),  =7D; =40=40 -16=
5,7
> +165,7 =40=40 static const u32 exynos5433_retention_regs=5B=5D =3D =7B
>  	EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION,
>  =7D;
>=20
> -static const struct samsung_retention_data exynos5433_retention_data
> __initconst =3D =7B
> +static const struct samsung_retention_data exynos5433_retention_data =3D
> +=7B
>  	.regs	 =3D exynos5433_retention_regs,
>  	.nr_regs =3D ARRAY_SIZE(exynos5433_retention_regs),
>  	.value	 =3D EXYNOS_WAKEUP_FROM_LOWPWR,
> =40=40 -178,7 +178,7 =40=40 static const u32 exynos5433_audio_retention_r=
egs=5B=5D =3D =7B
>  	EXYNOS5433_PAD_RETENTION_AUD_OPTION,
>  =7D;
>=20
> -static const struct samsung_retention_data
> exynos5433_audio_retention_data __initconst =3D =7B
> +static const struct samsung_retention_data
> +exynos5433_audio_retention_data =3D =7B
>  	.regs	 =3D exynos5433_audio_retention_regs,
>  	.nr_regs =3D ARRAY_SIZE(exynos5433_audio_retention_regs),
>  	.value	 =3D EXYNOS_WAKEUP_FROM_LOWPWR,
> =40=40 -192,7 +192,7 =40=40 static const u32 exynos5433_fsys_retention_re=
gs=5B=5D =3D =7B
>  	EXYNOS5433_PAD_RETENTION_MMC2_OPTION,
>  =7D;
>=20
> -static const struct samsung_retention_data exynos5433_fsys_retention_dat=
a
> __initconst =3D =7B
> +static const struct samsung_retention_data
> +exynos5433_fsys_retention_data =3D =7B
>  	.regs	 =3D exynos5433_fsys_retention_regs,
>  	.nr_regs =3D ARRAY_SIZE(exynos5433_fsys_retention_regs),
>  	.value	 =3D EXYNOS_WAKEUP_FROM_LOWPWR,
> =40=40 -203,7 +203,7 =40=40 static const struct samsung_retention_data
> exynos5433_fsys_retention_data __init
>   * Samsung pinctrl driver data for Exynos5433 SoC. Exynos5433 SoC
> includes
>   * ten gpio/pin-mux/pinconfig controllers.
>   */
> -static const struct samsung_pin_ctrl exynos5433_pin_ctrl=5B=5D __initcon=
st =3D
> =7B
> +static const struct samsung_pin_ctrl exynos5433_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 data */
>  		.pin_banks	=3D exynos5433_pin_banks0,
> =40=40 -288,13 +288,14 =40=40 static const struct samsung_pin_ctrl
> exynos5433_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data exynos5433_of_data __initcons=
t
> =3D =7B
> +const struct samsung_pinctrl_of_match_data exynos5433_of_data =3D =7B
>  	.ctrl		=3D exynos5433_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(exynos5433_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(exynos5433_of_data);
>=20
>  /* pin banks of exynos7 pin-controller - ALIVE */ -static const struct
> samsung_pin_bank_data exynos7_pin_banks0=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos7_pin_banks0=5B=5D =3D =
=7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTW(8, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTW(8, 0x020, =22gpa1=22, 0x04), =40=40 -303,7 +304,7=
 =40=40
> static const struct samsung_pin_bank_data exynos7_pin_banks0=5B=5D __init=
const
> =3D =7B  =7D;
>=20
>  /* pin banks of exynos7 pin-controller - BUS0 */ -static const struct
> samsung_pin_bank_data exynos7_pin_banks1=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos7_pin_banks1=5B=5D =3D =
=7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(5, 0x000, =22gpb0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(8, 0x020, =22gpc0=22, 0x04), =40=40 -323,37 +324,=
37
> =40=40 static const struct samsung_pin_bank_data exynos7_pin_banks1=5B=5D
> __initconst =3D =7B  =7D;
>=20
>  /* pin banks of exynos7 pin-controller - NFC */ -static const struct
> samsung_pin_bank_data exynos7_pin_banks2=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos7_pin_banks2=5B=5D =3D =
=7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(3, 0x000, =22gpj0=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos7 pin-controller - TOUCH */ -static const struct
> samsung_pin_bank_data exynos7_pin_banks3=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos7_pin_banks3=5B=5D =3D =
=7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(3, 0x000, =22gpj1=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos7 pin-controller - FF */ -static const struct
> samsung_pin_bank_data exynos7_pin_banks4=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos7_pin_banks4=5B=5D =3D =
=7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(4, 0x000, =22gpg4=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos7 pin-controller - ESE */ -static const struct
> samsung_pin_bank_data exynos7_pin_banks5=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos7_pin_banks5=5B=5D =3D =
=7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(5, 0x000, =22gpv7=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos7 pin-controller - FSYS0 */ -static const struct
> samsung_pin_bank_data exynos7_pin_banks6=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos7_pin_banks6=5B=5D =3D =
=7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(7, 0x000, =22gpr4=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos7 pin-controller - FSYS1 */ -static const struct
> samsung_pin_bank_data exynos7_pin_banks7=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos7_pin_banks7=5B=5D =3D =
=7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(4, 0x000, =22gpr0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(8, 0x020, =22gpr1=22, 0x04), =40=40 -362,7 +363,7=
 =40=40
> static const struct samsung_pin_bank_data exynos7_pin_banks7=5B=5D __init=
const
> =3D =7B  =7D;
>=20
>  /* pin banks of exynos7 pin-controller - BUS1 */ -static const struct
> samsung_pin_bank_data exynos7_pin_banks8=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos7_pin_banks8=5B=5D =3D =
=7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(8, 0x020, =22gpf0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(8, 0x040, =22gpf1=22, 0x04), =40=40 -376,13 +377,=
13
> =40=40 static const struct samsung_pin_bank_data exynos7_pin_banks8=5B=5D
> __initconst =3D =7B
>  	EXYNOS_PIN_BANK_EINTG(3, 0x140, =22gpv6=22, 0x24),  =7D;
>=20
> -static const struct samsung_pin_bank_data exynos7_pin_banks9=5B=5D
> __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos7_pin_banks9=5B=5D =3D =
=7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS_PIN_BANK_EINTG(7, 0x000, =22gpz0=22, 0x00),
>  	EXYNOS_PIN_BANK_EINTG(4, 0x020, =22gpz1=22, 0x04),  =7D;
>=20
> -static const struct samsung_pin_ctrl exynos7_pin_ctrl=5B=5D __initconst =
=3D =7B
> +static const struct samsung_pin_ctrl exynos7_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 Alive data */
>  		.pin_banks	=3D exynos7_pin_banks0,
> =40=40 -436,13 +437,14 =40=40 static const struct samsung_pin_ctrl
> exynos7_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data exynos7_of_data __initconst =
=3D
> =7B
> +const struct samsung_pinctrl_of_match_data exynos7_of_data =3D =7B
>  	.ctrl		=3D exynos7_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(exynos7_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(exynos7_of_data);
>=20
>  /* pin banks of exynos850 pin-controller 0 (ALIVE) */ -static const
> struct samsung_pin_bank_data exynos850_pin_banks0=5B=5D __initconst =3D =
=7B
> +static const struct samsung_pin_bank_data exynos850_pin_banks0=5B=5D =3D=
 =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS850_PIN_BANK_EINTW(8, 0x000, =22gpa0=22, 0x00),
>  	EXYNOS850_PIN_BANK_EINTW(8, 0x020, =22gpa1=22, 0x04), =40=40 -453,7 +45=
5,7
> =40=40 static const struct samsung_pin_bank_data exynos850_pin_banks0=5B=
=5D
> __initconst =3D =7B  =7D;
>=20
>  /* pin banks of exynos850 pin-controller 1 (CMGP) */ -static const struc=
t
> samsung_pin_bank_data exynos850_pin_banks1=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos850_pin_banks1=5B=5D =3D=
 =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS850_PIN_BANK_EINTW(1, 0x000, =22gpm0=22, 0x00),
>  	EXYNOS850_PIN_BANK_EINTW(1, 0x020, =22gpm1=22, 0x04), =40=40 -466,27
> +468,27 =40=40 static const struct samsung_pin_bank_data exynos850_pin_ba=
nks1=5B=5D
> __initconst =3D =7B  =7D;
>=20
>  /* pin banks of exynos850 pin-controller 2 (AUD) */ -static const struct
> samsung_pin_bank_data exynos850_pin_banks2=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos850_pin_banks2=5B=5D =3D=
 =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS850_PIN_BANK_EINTG(5, 0x000, =22gpb0=22, 0x00),
>  	EXYNOS850_PIN_BANK_EINTG(5, 0x020, =22gpb1=22, 0x04),  =7D;
>=20
>  /* pin banks of exynos850 pin-controller 3 (HSI) */ -static const struct
> samsung_pin_bank_data exynos850_pin_banks3=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos850_pin_banks3=5B=5D =3D=
 =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS850_PIN_BANK_EINTG(6, 0x000, =22gpf2=22, 0x00),  =7D;
>=20
>  /* pin banks of exynos850 pin-controller 4 (CORE) */ -static const struc=
t
> samsung_pin_bank_data exynos850_pin_banks4=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos850_pin_banks4=5B=5D =3D=
 =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS850_PIN_BANK_EINTG(4, 0x000, =22gpf0=22, 0x00),
>  	EXYNOS850_PIN_BANK_EINTG(8, 0x020, =22gpf1=22, 0x04),  =7D;
>=20
>  /* pin banks of exynos850 pin-controller 5 (PERI) */ -static const struc=
t
> samsung_pin_bank_data exynos850_pin_banks5=5B=5D __initconst =3D =7B
> +static const struct samsung_pin_bank_data exynos850_pin_banks5=5B=5D =3D=
 =7B
>  	/* Must start with EINTG banks, ordered by EINT group number. */
>  	EXYNOS850_PIN_BANK_EINTG(2, 0x000, =22gpg0=22, 0x00),
>  	EXYNOS850_PIN_BANK_EINTG(6, 0x020, =22gpp0=22, 0x04), =40=40 -499,7 +50=
1,7
> =40=40 static const struct samsung_pin_bank_data exynos850_pin_banks5=5B=
=5D
> __initconst =3D =7B
>  	EXYNOS850_PIN_BANK_EINTG(6, 0x100, =22gpc1=22, 0x20),  =7D;
>=20
> -static const struct samsung_pin_ctrl exynos850_pin_ctrl=5B=5D __initcons=
t =3D =7B
> +static const struct samsung_pin_ctrl exynos850_pin_ctrl=5B=5D =3D =7B
>  	=7B
>  		/* pin-controller instance 0 ALIVE data */
>  		.pin_banks	=3D exynos850_pin_banks0,
> =40=40 -534,7 +536,8 =40=40 static const struct samsung_pin_ctrl
> exynos850_pin_ctrl=5B=5D __initconst =3D =7B
>  	=7D,
>  =7D;
>=20
> -const struct samsung_pinctrl_of_match_data exynos850_of_data __initconst
> =3D =7B
> +const struct samsung_pinctrl_of_match_data exynos850_of_data =3D =7B
>  	.ctrl		=3D exynos850_pin_ctrl,
>  	.num_ctrl	=3D ARRAY_SIZE(exynos850_pin_ctrl),
>  =7D;
> +EXPORT_SYMBOL_GPL(exynos850_of_data);
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c
> b/drivers/pinctrl/samsung/pinctrl-exynos.c
> index 0489c899b401..628c6e94d08c 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> =40=40 -20,6 +20,7 =40=40
>  =23include <linux/irqchip/chained_irq.h>
>  =23include <linux/of.h>
>  =23include <linux/of_irq.h>
> +=23include <linux/module.h>
>  =23include <linux/slab.h>
>  =23include <linux/spinlock.h>
>  =23include <linux/regmap.h>
> =40=40 -207,7 +208,7 =40=40 static void exynos_irq_release_resources(stru=
ct
> irq_data *irqd)
>  /*
>   * irq_chip for gpio interrupts.
>   */
> -static const struct exynos_irq_chip exynos_gpio_irq_chip __initconst =3D=
 =7B
> +static const struct exynos_irq_chip exynos_gpio_irq_chip =3D =7B
>  	.chip =3D =7B
>  		.name =3D =22exynos_gpio_irq_chip=22,
>  		.irq_unmask =3D exynos_irq_unmask,
> =40=40 -275,7 +276,7 =40=40 struct exynos_eint_gpio_save =7B
>   * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
>   * =40d: driver data of samsung pinctrl driver.
>   */
> -__init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
> +int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
>  =7B
>  	struct samsung_pin_bank *bank;
>  	struct device *dev =3D d->dev;
> =40=40 -399,7 +400,7 =40=40 static u32 eint_wake_mask_value =3D
> EXYNOS_EINT_WAKEUP_MASK_DISABLED;
>  /*
>   * irq_chip for wakeup interrupts
>   */
> -static const struct exynos_irq_chip s5pv210_wkup_irq_chip __initconst =
=3D =7B
> +static const struct exynos_irq_chip s5pv210_wkup_irq_chip =3D =7B
>  	.chip =3D =7B
>  		.name =3D =22s5pv210_wkup_irq_chip=22,
>  		.irq_unmask =3D exynos_irq_unmask,
> =40=40 -419,7 +420,7 =40=40 static const struct exynos_irq_chip
> s5pv210_wkup_irq_chip __initconst =3D =7B
>  	.set_eint_wakeup_mask =3D s5pv210_pinctrl_set_eint_wakeup_mask,
>  =7D;
>=20
> -static const struct exynos_irq_chip exynos4210_wkup_irq_chip __initconst
> =3D =7B
> +static const struct exynos_irq_chip exynos4210_wkup_irq_chip =3D =7B
>  	.chip =3D =7B
>  		.name =3D =22exynos4210_wkup_irq_chip=22,
>  		.irq_unmask =3D exynos_irq_unmask,
> =40=40 -438,7 +439,7 =40=40 static const struct exynos_irq_chip
> exynos4210_wkup_irq_chip __initconst =3D =7B
>  	.set_eint_wakeup_mask =3D exynos_pinctrl_set_eint_wakeup_mask,
>  =7D;
>=20
> -static const struct exynos_irq_chip exynos7_wkup_irq_chip __initconst =
=3D =7B
> +static const struct exynos_irq_chip exynos7_wkup_irq_chip =3D =7B
>  	.chip =3D =7B
>  		.name =3D =22exynos7_wkup_irq_chip=22,
>  		.irq_unmask =3D exynos_irq_unmask,
> =40=40 -521,7 +522,7 =40=40 static void exynos_irq_demux_eint16_31(struct=
 irq_desc
> *desc)
>   * exynos_eint_wkup_init() - setup handling of external wakeup interrupt=
s.
>   * =40d: driver data of samsung pinctrl driver.
>   */
> -__init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
> +int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
>  =7B
>  	struct device *dev =3D d->dev;
>  	struct device_node *wkup_np =3D NULL;
> =40=40 -760,3 +761,7 =40=40 exynos_retention_init(struct samsung_pinctrl_=
drv_data
> *drvdata,
>=20
>  	return ctrl;
>  =7D
> +
> +MODULE_DESCRIPTION(=22Pinctrl common driver for Exynos, S3C24XX, and
> +S3C64XX SoCs=22); MODULE_AUTHOR(=22Thomas Abraham
> +<thomas.ab=40samsung.com>=22); MODULE_LICENSE(=22GPL v2=22);
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c
> b/drivers/pinctrl/samsung/pinctrl-samsung.c
> index 2a0fc63516f1..7a5f1363d0d1 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> =40=40 -18,6 +18,7 =40=40
>  =23include <linux/init.h>
>  =23include <linux/platform_device.h>
>  =23include <linux/io.h>
> +=23include <linux/module.h>
>  =23include <linux/slab.h>
>  =23include <linux/err.h>
>  =23include <linux/gpio/driver.h>
> =40=40 -1299,8 +1300,8 =40=40 static struct platform_driver samsung_pinct=
rl_driver
> =3D =7B
>  	=7D,
>  =7D;
>=20
> -static int __init samsung_pinctrl_drv_register(void)
> -=7B
> -	return platform_driver_register(&samsung_pinctrl_driver);
> -=7D
> -postcore_initcall(samsung_pinctrl_drv_register);
> +module_platform_driver(samsung_pinctrl_driver);

To keep previous initcall order, please do not use module_platform_driver m=
acro.

Best Regards,
Chanho Park

