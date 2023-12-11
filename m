Return-Path: <linux-gpio+bounces-1272-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE48D80DFC3
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 00:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 852962825FE
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 23:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702F656B84;
	Mon, 11 Dec 2023 23:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PUT/0HrM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF8439B;
	Mon, 11 Dec 2023 15:57:17 -0800 (PST)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231211235712epoutp02fc6492c306a0c87b00f73d2b96eaddb1~f7FS22I-N1560215602epoutp02X;
	Mon, 11 Dec 2023 23:57:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231211235712epoutp02fc6492c306a0c87b00f73d2b96eaddb1~f7FS22I-N1560215602epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1702339032;
	bh=bBw6NK33ONaSuHSNqwie2fG1DfnIrR8z9bBcfqRccco=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=PUT/0HrMIoBxCMk8iXdgFD0X2Sg28os0ByEf6vCuabil4sWM0oFEYVseZv4lSYqGa
	 LsccOknD0Dn8ODSwTq9QpwtT39Vp0wonnBzyqeETRPkUJk0S10LW+thNOiM5+ibXmp
	 AU+1O/H/t6/tRSNZdApzyfnLCAzYAFg6AXeuaPOU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20231211235712epcas1p39dede76e04ae14189f0260fca7d7d07a~f7FSfcmRd2517825178epcas1p3Y;
	Mon, 11 Dec 2023 23:57:12 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.144]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4SpzF30zJRz4x9Q1; Mon, 11 Dec
	2023 23:57:11 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	40.C5.19104.6D1A7756; Tue, 12 Dec 2023 08:57:11 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20231211235710epcas1p314c62a7abccf937bd63907c3c8166efc~f7FQ4CCEp2515825158epcas1p3o;
	Mon, 11 Dec 2023 23:57:10 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231211235710epsmtrp27050d1763a3b4c4daa8ddc76689a55d1~f7FQ2wCih2834428344epsmtrp2m;
	Mon, 11 Dec 2023 23:57:10 +0000 (GMT)
X-AuditID: b6c32a4c-80dff70000004aa0-47-6577a1d65ccb
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5D.68.07368.6D1A7756; Tue, 12 Dec 2023 08:57:10 +0900 (KST)
Received: from cw00choi03 (unknown [10.113.111.106]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20231211235710epsmtip18f3770cc7713786a97d3d0f4185e114d~f7FQUXaxH1746317463epsmtip1G;
	Mon, 11 Dec 2023 23:57:10 +0000 (GMT)
From: "Chanwoo Choi" <cw00.choi@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mturquette@baylibre.com>,
	<conor+dt@kernel.org>, <sboyd@kernel.org>, <tomasz.figa@gmail.com>,
	<s.nawrocki@samsung.com>, <linus.walleij@linaro.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <arnd@arndb.de>, <olof@lixom.net>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<alim.akhtar@samsung.com>
Cc: <tudor.ambarus@linaro.org>, <andre.draszik@linaro.org>,
	<semen.protsenko@linaro.org>, <saravanak@google.com>,
	<willmcvicker@google.com>, <soc@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <kernel-team@android.com>,
	<linux-serial@vger.kernel.org>
In-Reply-To: <20231211162331.435900-7-peter.griffin@linaro.org>
Subject: RE: [PATCH v7 06/16] dt-bindings: clock: google,gs101: fix
 incorrect numbering and DGB suffix
Date: Tue, 12 Dec 2023 08:57:09 +0900
Message-ID: <0ecc01da2c8d$c129e490$437dadb0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: ko
Thread-Index: AQEeDlMUs+qnFg95EVUf+Z9FZqMuEwIO8XO4Aj/o0Sqx+ofWIA==
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xbVRz29La3hQ28KzWcIWFdjS5DCxQoHshw6hi5GZiQoeCMDhq4UkJp
	mz4ANWbEPRgPCRsQoZPBwkTA8n6/xiiMDUTcskFR2AYWB4xZBIIbg4Itlyn/fb/vfN/vdfLj
	YNwbbBdOvFxDqeQSmQC3Zzb3HvQUGq8kU163lxlo8nIzjhofNzCR5WI/Gy2UZQGk7xpmoOK+
	YRY6XVqDI3ORK2pt4aHs2SkM5a3/yED1plEWWsx6wEINxesAFfx6jYGGSr9lo7Hqa2w0fWWI
	ge4MHkWDxmUc1RZsMNHZrj426n2SxkIZBguONkbrmGgm2+oyGddxVNluTbL0+0l0ZkKMKpc2
	ATLNbWDv8snmjmYWqb+sB+Ta84uAXBg7yybbdPfZZEm9lqyvTMfJidFOnKzQ61lkd5GeTTZc
	PUXeu/UNi2x7msomsxsrAblc7xb28icJh6SUJJZS8Sl5jCI2Xh4XKAgJjzoSJfbzEglF/uht
	AV8uSaQCBUGhYcLgeJl1XQJ+kkSmtVJhErVa4PnOIZVCq6H4UoVaEyiglLEypVjpoZYkqrXy
	OA85pQkQeXl5i63C6ARpz4MLbGWjY4pxKikVtOzOAHYcSPjCkqYWdgaw53CJTgCLxywYHSwB
	2HKpA6eDfwCs7s/DXliKh0oB/dAF4FrrPJMO5gBMvTppVXE4OPEWLHn2kc3AIyYx2JVnZ9Ng
	hB6Dq5sTW5nsiMNwrCuVacNOhBROmsu3eCbxOlzMKcJt2IHwh+3V/Swa74EDhdNbeozYB1v+
	+n67Iz5c/bOMRfM8eCn9HEYXfh8+HC1g2ApDIt8ejlWtsGlDELQsDbNo7AQf32zc5l3gsrkL
	pw25AN6Zn8fooAbAuooz2+V8YPcPuQzbmBhxENa0e9L0fti2VgToLhyheSWLZZNAwgGeP8el
	Ja/Bu5P3GTTeC0vT0vEcINDtmE23Yzbdjnl0/xcrAcxK4EIp1YlxVIxIKRLKqeT/vjxGkVgP
	tu7JPbQVPK2xeBgAgwMMAHIwAc/BtU9NcR1iJV98SakUUSqtjFIbgNi68QuYyysxCutByjVR
	Il9/L18/bx9fJPITCZwdhu4lUVwiTqKhEihKSale+BgcO5dURuG4wJkbohAmGTLtlPExCTdK
	onXy/bzdAcnhP9UYuj/46jtqc5yXfCsenxl42EQWvKk9/+y97LvtsRXD3ZbstM58t2nxqONh
	QwrgJ7XxnGqdgqOTmv7+xXRkSusXODcyN1Pce6D1WM5vhaFCc6QUKBJz43qYox+fqLPfNC3l
	D2QOwD1uE4O1DQufPRefTnX8XK3K7vMZ3+e0Ykkxyma/No9M1UasRxuH+t0OSL0fhWTCXe03
	J6TOp9449vPxhiBRd3mhMau36mREMOuEynfcHPfk9qOEYPdF18Jd4WXXj2dwZ6tGcvcarq+W
	j3/4amT9HwUdJpfIgD5PYYRF1hP2KfMlAVMtlYjcMZVa8i8FxU6q2AQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sb0xTVxyGc+6/XpqBl9K5U8YY62JG3FYpzu3MGCUsS26yxJHhPogZ2MC1
	GKCQVtAuY1QcVYsQhhspZVgMiuFSRUoH0lL+tEwRkdmGFMKUaQpBHOgEE8RBGaVZxrf3PL/f
	+5zz4dC4qJmMpo+qjnFqlSJXSgmJDrc09kPfxeNcwuy4BD280EEh25N2Aq1W3xSgZ03nALI4
	RzBkHhgh0anGVgo9rY9BNzrFqPLxIxz9tHIFQ1a/j0TPz02SqN28ApDx9x4MDTdWCND4tR4B
	mro4jCHP0OdoaGyRQteNAQKVOQcEyD13mkQG1yqFAr42As1Urrf8YysU4u3rkoWJdPTD/V2I
	X1gDyD8bwJPi2A5HB8laLlgA+8+rasA+Gy8TsF2mBwK2wVrIWvmzFHvf102xzRYLyfbWWwRs
	+6USdnSwlGS7lnQCttLGA3bRGpuyJU24J4vLPVrEqXfsPSzM7p/8UVBgizgx9qhIBzpfM4Aw
	GjIfQfNwIzAAIS1iHAB6WhxkaCCBNZ7fcAOg13MUdLs1oZ0ZAO/8VY4FOcV8ABtefh3kYuYF
	Dvkzy1jwgDN2HI7o9GSo4QbQ52+hgtYwZh8cd+qIYI5ijkBvTQ0WzASzDT6vqt/YCWc+hfZr
	N8lQjoS3a6eI4G04I4P6NhDEOPM27Jz/BQ89NA4uTzeRIS6GdWf1G1zMJMM/fUasCkSZNplM
	/5tMm0ymTe0GQPBAwhVo8pR5mfICuYo7LtMo8jSFKqUsMz/PCjZ+0/b4G2DSHJC5AEYDF4A0
	LhWHxwxoOFF4lkL7LafOz1AX5nIaF3iTJqRvhMuNdVkiRqk4xuVwXAGn/m+K0WHROux7+9Wr
	ezOe1qWW7dvzyiZL8bRsPZDaVjrnuuXw9CrfT5p8oD15K/HQnb4rVF1i9VfqmlHzZ+9VvEVL
	17zf/IFNxyfm/GxIbb1X+mVgd0l/SqSxb3m6L3lL8b14yimUL+3cKuku1zmaGXPsdxMv/Ky+
	9YTXe+A6//iTXQ8zLqkjlxUV8w5YX2zvGZpaLUy//W5CX/7r/KxWX5Sf0G7PTIpbTFOF7b+c
	TPe+FGqravX8RO1aSWzE0oDmi3Rbv69p4e6TrkGt/dcdimhMdNiLV6gaD/49f3Iu+4zNtDvt
	/PlyOklSlHMk+uPLztMGZluxcnSn/FTbIB+xMH/3nZmY7pJqKaHJVsi342qN4l/cq8GFvAMA
	AA==
X-CMS-MailID: 20231211235710epcas1p314c62a7abccf937bd63907c3c8166efc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231211162506epcas1p290e6adbb82f27ebade65376f298f7fd3
References: <20231211162331.435900-1-peter.griffin@linaro.org>
	<CGME20231211162506epcas1p290e6adbb82f27ebade65376f298f7fd3@epcas1p2.samsung.com>
	<20231211162331.435900-7-peter.griffin@linaro.org>



> -----Original Message-----
> From: Peter Griffin <peter.griffin@linaro.org>
> Sent: Tuesday, December 12, 2023 1:23 AM
> To: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> mturquette@baylibre.com; conor+dt@kernel.org; sboyd@kernel.org;
> tomasz.figa@gmail.com; s.nawrocki@samsung.com; linus.walleij@linaro.org;
> wim@linux-watchdog.org; linux@roeck-us.net; catalin.marinas@arm.com;
> will@kernel.org; arnd@arndb.de; olof@lixom.net;
gregkh@linuxfoundation.org;
> jirislaby@kernel.org; cw00.choi@samsung.com; alim.akhtar@samsung.com
> Cc: peter.griffin@linaro.org; tudor.ambarus@linaro.org;
> andre.draszik@linaro.org; semen.protsenko@linaro.org;
saravanak@google.com;
> willmcvicker@google.com; soc@kernel.org; devicetree@vger.kernel.org;
linux-
> arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> clk@vger.kernel.org; linux-gpio@vger.kernel.org; linux-
> watchdog@vger.kernel.org; kernel-team@android.com; linux-
> serial@vger.kernel.org
> Subject: [PATCH v7 06/16] dt-bindings: clock: google,gs101: fix incorrect
> numbering and DGB suffix
> 
> 166 was skipped by mistake and two clocks:
> * CLK_MOUT_CMU_HSI0_USBDPDGB
> * CLK_GOUT_HSI0_USBDPDGB
> 
> Have an incorrect DGB ending instead of DBG.
> 
> This is an ABI break, but as the patch was only applied yesterday this
header
> has never been in an actual release so it seems better to fix this early
than
> ignore it.
> 
> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock
management
> unit bindings")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  include/dt-bindings/clock/google,gs101.h | 118 +++++++++++------------
>  1 file changed, 59 insertions(+), 59 deletions(-)
> 

(snip)

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

Best Regards,
Chanwoo Choi



