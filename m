Return-Path: <linux-gpio+bounces-1396-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0028119E9
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AA791C211A7
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA1939FCF;
	Wed, 13 Dec 2023 16:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rrg1DXMa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1076B189;
	Wed, 13 Dec 2023 08:44:51 -0800 (PST)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231213164449epoutp023fd64615399e6e62e744eadbe1de0d03~gceVxlC9d0917409174epoutp02V;
	Wed, 13 Dec 2023 16:44:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231213164449epoutp023fd64615399e6e62e744eadbe1de0d03~gceVxlC9d0917409174epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702485889;
	bh=RD0jG/REDL3S4PTv/Ck6hMfscjCMHfpmiHODJta/i+4=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=rrg1DXMab0ZoBrqQJ6/jivHONHqfn+9bCe0dOZ9W8qydXK17X3EU88oSAVfPO/RTL
	 mAa7+b3Aw99ev55GWPK9OvKdbaqOtVZTxpXQP8BBzQF6Hm1oZoNx2AtftU3ON4Yy1l
	 wFqbbKeja3vval2Ox812QZMuPuYy4/bF8ENwvjNg=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTP id
	20231213164448epcas5p4e976f034ca8830f70a48a1cf9e14ae6e~gceVI4JSX2992729927epcas5p4y;
	Wed, 13 Dec 2023 16:44:48 +0000 (GMT)
Received: from epsmgec5p1-new.samsung.com (unknown [182.195.38.181]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4Sr1YC0x4Mz4x9Pq; Wed, 13 Dec
	2023 16:44:47 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmgec5p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6B.79.19369.E7FD9756; Thu, 14 Dec 2023 01:44:47 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20231213164446epcas5p43cb1c94693f386127918f6b15e6f2bd5~gceTOeOGm2992729927epcas5p4v;
	Wed, 13 Dec 2023 16:44:46 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231213164446epsmtrp1ab24ca6f10f89d2b8bd173b303387534~gceTMBZaB2259122591epsmtrp1F;
	Wed, 13 Dec 2023 16:44:46 +0000 (GMT)
X-AuditID: b6c32a50-c99ff70000004ba9-65-6579df7ecbd4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	03.7C.08755.E7FD9756; Thu, 14 Dec 2023 01:44:46 +0900 (KST)
Received: from INBRO000447 (unknown [107.122.12.5]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231213164442epsmtip14c8055805388afac3f2d1c0e9a4cd35e~gcePBbyEn2325823258epsmtip1b;
	Wed, 13 Dec 2023 16:44:42 +0000 (GMT)
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
In-Reply-To: <20231211162331.435900-14-peter.griffin@linaro.org>
Subject: RE: [PATCH v7 13/16] tty: serial: samsung: Add gs101 compatible and
 common fifoszdt_serial_drv_data
Date: Wed, 13 Dec 2023 22:14:41 +0530
Message-ID: <017601da2de3$ae2298e0$0a67caa0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQEeDlMUs+qnFg95EVUf+Z9FZqMuEwIiSpF9Afs8Mk6x/r4tkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0zTVxTHc/trfy1M9Gdl41odds2YSga22HaXIeKUbb/FmZD5z+aSsQ5+
	oYzSdn2omGUwHMh4CUQIa3goOIldXaFAKU9neSiIuCUMkFTUUcdjilJB5b2Wn27897nnfr/n
	3HNuDgfjtrN5nHiljtIoZQoB7s20tu/cHpR8J4kSNqUwUN1kLRMtFXSx0aML2QCZWvsYaHBm
	jIXKO/pY6GSlGUdTpVuRrcEX5Y7fw9CZxSoGsowOsNB09ggL1ZYvAlR8s42Beitz2Gjo1zY2
	cp7rZaA/et5HPYNPcFRdvMxEaa0dbNT+4BQLZdqXcLQ8UMNEY7lu1+jgIo6MTe4kruEv0A8O
	CTK6VgAanVjG9vFJa7OVRZrKTIBcmC8A5KOhNDbZaLjNJs9a9KTF+CNOOgZacPKiycQiL5ea
	2GTt+WSy/1oqi2x8lsImc+uMgHxi8Y/acCRhj5ySxVIaPqWMUcXGK+PCBQcPRx+IlkiFoiBR
	KHpHwFfKEqlwQeTHUUEfxCvc4xLwj8oUencoSqbVCnbt3aNR6XUUX67S6sIFlDpWoRarg7Wy
	RK1eGRespHTvioTCEIlb+GWCvOD5HVxd4Xv81MpFRgro2ZgJvDiQEMPzZUW4h7lEC4BnKkIy
	gbebXQCmmi/h9OEpgH2mW6yXjvvWbIy+aAVw8ec5Bn0YB3Dq90GmR4UTQdBWmb6a15cYweBg
	33seEUaYMDi34sA8F17EPrjcdhd4eBOhhM5r11cNTCIAFvZ2sD3sQ4TCjroCjOaNsPsn52oB
	jNgGGx6WYPST+HDu/gUWHfeDE52015fYD69XW4GnMCQyveH49BROGyLhuclCQPMmOHm1jk0z
	D06cTnczx80krFjk0WE5fFhlfiGPgL/1lzA9EozYCc1Nu+iy62HOgpNBO31gRjqXVgfAk1N/
	MmneAvOzsl4MkYTGii52HnjDsKYxw5rGDGuaMfxf7CxgGgGPUmsT46gYiVoUpKSO/ffhMapE
	C1jdpsAoG/ileinYDhgcYAeQgwl8fbptxyiuT6ws6QSlUUVr9ApKawcS97jzMd6rMSr3Oip1
	0SJxqFAslUrFobulIoGfzz9ppbFcIk6moxIoSk1pXvoYHC9eCqPRIE/M7r4cIrYf1Oe99bbs
	7ontH/bZmjvbW4r9j1QN610R0PFNyXei52MNqUWznwpmL30k2XKziBn293z+XIvQu9lirdtd
	z/O6QUEmcWjGcFW7P8SRHRwmxcPyuAuZLuvxHPO8d2dVWti6bZ/ZT9ckPbjRb3/FSUa1uhbt
	f+2Yrer/5LHxcHhr1kBE4Jvf6pPLwvg1M7OdY1hO/WsbGv2wo8EZHV8t3dLnTYRqpnZMT9e8
	jh9w8BOF6F6P/wiX8zWVEbA1AnPOefV+f6U/b3P93s1mWM0LSR9RRQ49u40+HxiR8Z7iysJh
	cZmi4fGVJVv2ukNyla6rfH3tkDDc7C1gauUyUSCm0cr+BXTGkFLWBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7bCSnG7d/cpUg1PLZC22vNrMYvF30jF2
	i/fLehgt1uw9x2Rx/ctzVov5R86xWjQvXs9m8W6ujMWO7SIWfS8eMltM+bOcyWLT42usFh97
	7rFabJ7/h9Fixvl9TBZnFveyW9xYt4/d4snCM0wWF0+5Wpy6/pnNYsOMfywWrXuPsFscftPO
	atF16C+bxb9rG1ksnvcBdT2+/ofNYtUuoCGfbsVZtNwxtVj16T+jxeOX/5gdFDy27d7G6rFm
	3hpGj9+/JjF6vL/Ryu6xc9Zddo8Fm0o9Nq3qZPO4c20Pm8fKNWtYPfbPXcPusXlJvceVE02s
	Hju/N7B79G1ZxejxeZNcAH8Ul01Kak5mWWqRvl0CV8akH/fZChaJVLT/X8nUwHhKsIuRk0NC
	wETi6bYe5i5GLg4hgd2MElvu/GaESEhLXN84gR3CFpZY+e85O0TRM0aJPx++sYAk2AR0JXYs
	bmMDSYgIfGKWWP3/BpjDLLCLWeJcQxsrRMsRRom12+6DzeUUcJD4t+8BmC0skCOxcvE+sFEs
	AqoSU88cAdvHK2ApcWTLJGYIW1Di5MwnQDUcQFP1JNo2grUyC8hLbH87hxniPAWJn0+XsULE
	xSVeHoUYIyLgJHF6wzbGCYzCs5BMmoUwaRaSSbOQdC9gZFnFKJlaUJybnltsWGCYl1quV5yY
	W1yal66XnJ+7iRGcoLQ0dzBuX/VB7xAjEwfjIUYJDmYlEd6TO8pThXhTEiurUovy44tKc1KL
	DzFKc7AoifOKv+hNERJITyxJzU5NLUgtgskycXBKNTCdFFNaUj65wTFWmMXQvt6t0NF7OaOu
	QoqBVJnn08jF6f8ydacaTKoNtP19IZibJWSZTndMtuClxuMsvgXm/EeOrnNXDdebY+inkCDY
	OWVWnIPUlWUH7zTN+WmTbdbTfIcpQrbujBDz6fnH91peWLCZ2798xURR2cBZ3m33hI4cWnPx
	AuPBwATvjnvX7aJl5tVfv+L22Z7nea79raeVcrVN/QYLz0SXChgwPjnGxMO/MuNFSuj6556n
	TrY9mfM11WLvQ+0lb2zmlKYKzTdYtEek8cmpsoz6J3rciSWc50uMXjxiaVS+rBLbEp+a08fg
	KB8ilFvj1SCQJdcfG3DLx/yr9f0vs9k2X3z5dMckJZbijERDLeai4kQA4KQRub8DAAA=
X-CMS-MailID: 20231213164446epcas5p43cb1c94693f386127918f6b15e6f2bd5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231211162437epcas5p2d640158c5afd1b4a58c7f9f7b2966300
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	<CGME20231211162437epcas5p2d640158c5afd1b4a58c7f9f7b2966300@epcas5p2.samsung.com>
	<20231211162331.435900-14-peter.griffin@linaro.org>



> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>
> Sent: Monday, December 11, 2023 9:53 PM
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
> Subject: [PATCH v7 13/16] tty: serial: samsung: Add gs101 compatible and
> common fifoszdt_serial_drv_data
> 
> Add serial driver data for Google Tensor gs101 SoC and a common
> fifoszdt_serial_drv_data that can be used by platforms that specify the
> samsung,uart-fifosize DT property.
> 
> A corresponding dt-bindings patch updates the yaml to ensure
> samsung,uart-fifosize is a required property.
> 
> Tested-by: Will McVicker <willmcvicker@google.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  drivers/tty/serial/samsung_tty.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c
> b/drivers/tty/serial/samsung_tty.c
> index 1b0c2b467a30..71d17d804fda 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2490,14 +2490,25 @@ static const struct s3c24xx_serial_drv_data
> exynos850_serial_drv_data = {
>  	.fifosize = { 256, 64, 64, 64 },
>  };
> 
> +/*
> + * Common drv_data struct for platforms that specify
> +samsung,uart-fifosize in
> + * device tree.
> + */
> +static const struct s3c24xx_serial_drv_data
> exynos_fifoszdt_serial_drv_data = {
> +	EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +	.fifosize = { 0 },
> +};
[snip]
>  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> --
> 2.43.0.472.g3155946c3a-goog



