Return-Path: <linux-gpio+bounces-1399-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA081811A42
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 18:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D730282A04
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB504C3A9;
	Wed, 13 Dec 2023 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vLuaFn2t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FE34D5;
	Wed, 13 Dec 2023 09:00:26 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20231213170024epoutp01a43e564b72d0c450c1a467733ec97763~gcr8wMsft2662626626epoutp01z;
	Wed, 13 Dec 2023 17:00:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20231213170024epoutp01a43e564b72d0c450c1a467733ec97763~gcr8wMsft2662626626epoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702486824;
	bh=862TZdAgd6+AsuSl92ow11fR2h1cMu4TUKSVhr/77g0=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vLuaFn2tdxtkfoJ0uzpzbXNVpmpQYDGHmtsYSxcUdGouQQXlz5fsK7b0452vNYQIy
	 RTnZT8N0LGlLaGhPWUjWnavxYCkP0INxLadG5mDOjiIXgMLKEtVYWQk7lEzEDwwUdI
	 Q9T18o5BdZE+uQjD9rrcdfnlFKnqswiQATfQrvx8=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTP id
	20231213170024epcas5p297b937d7beb5d4f06808249f367d05c3~gcr8bQ2sm0341203412epcas5p2n;
	Wed, 13 Dec 2023 17:00:24 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Sr1vB4kKwz4x9Pp; Wed, 13 Dec
	2023 17:00:22 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A9.30.10009.623E9756; Thu, 14 Dec 2023 02:00:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20231213170022epcas5p166f8e3d92554ad33db3e1074423cd386~gcr6gfZQy2678926789epcas5p1T;
	Wed, 13 Dec 2023 17:00:22 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231213170022epsmtrp270efdf5cbb7272c8b4c6b38e3d98af58~gcr6ZNTEh3029930299epsmtrp2P;
	Wed, 13 Dec 2023 17:00:22 +0000 (GMT)
X-AuditID: b6c32a4a-261fd70000002719-68-6579e326df8e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	65.66.07368.523E9756; Thu, 14 Dec 2023 02:00:21 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231213170017epsmtip1fec7a5169d19e15afc32bf3705a5b6f9~gcr2Q5d0z3081730817epsmtip1g;
	Wed, 13 Dec 2023 17:00:17 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
	<conor+dt@kernel.org>, <sboyd@kernel.org>, <tomasz.figa@gmail.com>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <arnd@arndb.de>, <olof@lixom.net>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<cw00.choi@samsung.com>
Cc: <tudor.ambarus@linaro.org>, <andre.draszik@linaro.org>,
	<semen.protsenko@linaro.org>, <saravanak@google.com>,
	<willmcvicker@google.com>, <soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <kernel-team@android.com>,
	<linux-serial@vger.kernel.org>
In-Reply-To: <20231211162331.435900-17-peter.griffin@linaro.org>
Subject: RE: [PATCH v7 16/16] MAINTAINERS: add entry for Google Tensor SoC
Date: Wed, 13 Dec 2023 22:30:16 +0530
Message-ID: <018e01da2de5$dbb40620$931c1260$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQEeDlMUs+qnFg95EVUf+Z9FZqMuEwFbwR+LAmZgagyyAZ3uIA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Tf0xTVxjd7evrK0zmo+K8Mh3lJahICkUpu53iD9DlDdkkM9ONLbKGvrSG
	/rKlU5ybbAxUxApMDBDwx3A1dp1ISxS0VSigoE7iRIoGjAyMyhAmAk4tspaHG/+de+4593zf
	d/PxMUE9Eczfoslg9BqZiuL5c880hi8ULejNZMT28lBU02/novGiSwQaMucDZHVe5yD3yAMc
	HWm6jqPsyioeGqyYh2rPBiHTwx4MHfSc4CBbbweOnuTfxZH9iAegkrYLHHStcj+BOk9dIFDf
	sWscdOPKWnTF/ZSHTpe84qIcZxOBGgd24yjPNc5DrzqqueiByevqdXt4yHLO+8jwnc3oxy4J
	sgxPANT76BW2SkifOX8Gp62HrYB++aII0EOdOQRdV9ZN0EdtRtpm2cujuzocPPqk1YrTFyus
	BG0/votub/kBp+ueZRG0qcYC6Ke2d5NnpqQvVzIyOaMXMpo0rXyLRhFHrduQmpAqiRVHi6Kl
	6D1KqJGpmThqTVKy6IMtKu+4KOHXMpXRSyXLDAYqasVyvdaYwQiVWkNGHMXo5CpdjC7SIFMb
	jBpFpIbJeD9aLF4i8Qq/Slc6Rvq5us7A7fmlp/As0DAzD/jxIRkDf7+8h+PDAvI8gPl5G/KA
	vxcPA+hoaMbZwxiAPW03wWtH5/d7MdbhBLB6PIIVPQTwXOvdyQseKYK1lbk8Hw4i72LQfX21
	T4SRVgw+n+iaFPmRq+At+4Q3m8+fRSbCgp4kH80lw2D9b4NcHw4gpbAr6xLO4kDYWto3yWNk
	CDz7uBxjCxLC5/fNOMvPgY+amwg2Nx4+HzqF+XIhafKHI+UmnDWsgYfGsggWz4L9l2umcDB8
	Oujk+eqBJA1/9gSztBI+PlE11fxKWN9ezvVJMDIcVp2LYmPfgvtf9nFYZwDckytg1WEwe/AW
	l8XvwMJ9+6YKoKG1+zanAISWTWusbFpjZdOaKfs/7CjgWsBcRmdQKxiDRLdEw2z777fTtGob
	mFylxYm1oOfe35EuwOEDF4B8jAoKaK3dxggC5LLMHYxem6o3qhiDC0i80y7Egmenab27qMlI
	jY6RimNiY2NjpEtjo6k5AX/lVMgFpEKWwaQzjI7Rv/Zx+H7BWRxNW9Qi6fANo5UeqFdkDwRK
	hSU9Oww56oaa71q2/+LZHcr7bGR+Ysk852jmly7HdstF/0PFM8Y/bH+54Fu1UyRAJ/2etbYU
	hLaQZMG1P5K6Z5SvNJsOEOsD2xXjQ7c+TvE8sRUuWlsuXlQNPin6KPng1ai0ECN/cfzIQLpa
	+4azTnRcFdlot99ffXrXWOkKfXHu0jH51eRl5uZl8Vvl1EIFVfbrJkXl6M7Nz77ZVOwSfDpq
	6nDPdbx9J7wqat1Gh1LwaMbOhI05uw//SUVgEe75P01sbDh5NCQID+O++MLVWn3zzRSB5N7M
	f3h1weEDE8eAOT9htri3+/bWxkq++fOb61MJimtQyqIXY3qD7F9iMTOI0wQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTVxzHd+6bJg2XUuIBTTVdUEMGrolbDjqFuJHciTM+YnSwqBVukNAC
	ueUxTYyVlymptYJhWEXkYTdrhbV1UB7qhuhW4+rwURoEo6lbhShkhUzYsB2lWcZ/n/P9ne/n
	/P44DC6xkAlMfmEJLxQqVXJKRHTdlsuSE31H+A+fV6Si6xMOAr2ru0ujKbMeIOsNN4aGZ/wk
	ah50k6iyrZNCk00rkLNbigyvXuDo7Py3GLL7PCT6U/+MRI7meYAaH9zE0P22UzTydtyk0cuW
	+xgaupeB7g1PU+j7xiCBqm8M0uj265Mkqh14R6Ggx0Ygv2Gh5Ruep5Cld0ESGNmPqkY/QpZA
	CCDfeBBPX8V19XWRnPWiFXD//F0HuClvNc31mMZo7pK9lLNbdBQ36umnuCtWK8ndarLSnKP9
	OPf4lwqS63mrpTnDdQvgpu2yHdFZok9yeVV+GS+s23xQdLh/ZoIo9sZ8rT/XQWrBT9G1IIqB
	7HroPaHDa4GIkbB9ANY2n8Qig+Vw2GakIxwLrwT9iyxh/wCw4oEizBSbDJ1tNVS4LGUDOLwa
	8i4ecLYXh25tDRnRDgJ4tr4TD1ei2HT4xBFaeIJhYtmt0PhiWzgm2ET447VJIsxiNhWOau+S
	EY6BrnMvifB1nE2BNTYQjnF2Jex+cwGPLLcKzv1uJiP5Mjh+Z3BxUSm7Bc5NdeBGEGtaYjL9
	bzItMZmWtC8BwgLi+WKNOk+doyhWFPLlKRqlWlNamJeSU6S2g8XvlLTWCZ41B1MGAMaAAQAZ
	XC4Vu5zlvEScqzxylBeKDgilKl4zAJYzhHyZWNF4PlfC5ilL+AKeL+aF/6YYE5WgxdZ8udq5
	Ie0vg2pWUlm269H7V3c+5ZFLGm9OjusIrO+VGeuNnr47z4cOiRoefrC2SKy3DL3SGfrdOm9T
	5lHfmNQ1M8vknynYnxPy74lT+XHzU82xNM/pdRs369+b7S4I/fp4xD4my0zYkRXVuunyypip
	bZ3brZejK0t09fmt3+kPqVK3qyVV8fjpn8W2LMP5zN+UXae2fnospuWLTiOJzXTL/J+VheoM
	5ha3J0nYnW3P1men38qoaqXipyXVGVsaqgKrD4wK2rm4j9M8P+z7qmZcHRxJc+08mNhwhsp2
	TBw/ccH2OR79UPVWO9nuNu39pv0a6rloSn60x5VXvgEIPXJCc1ipSMIFjfJfpq0gw70DAAA=
X-CMS-MailID: 20231213170022epcas5p166f8e3d92554ad33db3e1074423cd386
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231211162440epcas5p2a6f884784e8d9b03fcd9e6024ca9d3cf
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	<CGME20231211162440epcas5p2a6f884784e8d9b03fcd9e6024ca9d3cf@epcas5p2.samsung.com>
	<20231211162331.435900-17-peter.griffin@linaro.org>



> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>
> Sent: Monday, December 11, 2023 9:54 PM
> To: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> mturquette@baylibre.com; conor+dt@kernel.org; sboyd@kernel.org;
> tomasz.figa@gmail.com; s.nawrocki@samsung.com; linus.walleij@linaro.org;
> wim@linux-watchdog.org; linux@roeck-us.net; catalin.marinas@arm.com;
> will@kernel.org; arnd@arndb.de; olof@lixom.net;
> gregkh@linuxfoundation.org; jirislaby@kernel.org;
> cw00.choi@samsung.com; alim.akhtar@samsung.com
> Cc: peter.griffin@linaro.org; tudor.ambarus@linaro.org;
> andre.draszik@linaro.org; semen.protsenko@linaro.org;
> saravanak@google.com; willmcvicker@google.com; soc@kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> gpio@vger.kernel.org; linux-watchdog@vger.kernel.org; kernel-
> team@android.com; linux-serial@vger.kernel.org
> Subject: [PATCH v7 16/16] MAINTAINERS: add entry for Google Tensor SoC
> 
> Add maintainers entry for the Google tensor SoC based platforms.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 98f7dd0499f1..b731d6b9876a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8990,6 +8990,16 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-
> platform/linux.git
>  F:	drivers/firmware/google/
> 
> +GOOGLE TENSOR SoC SUPPORT
> +M:	Peter Griffin <peter.griffin@linaro.org>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-
> subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> +F:	arch/arm64/boot/dts/exynos/google/
> +F:	drivers/clk/samsung/clk-gs101.c
> +F:	include/dt-bindings/clock/google,clk-gs101.h
> +
>  GPD POCKET FAN DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
>  L:	platform-driver-x86@vger.kernel.org
> --
> 2.43.0.472.g3155946c3a-goog



