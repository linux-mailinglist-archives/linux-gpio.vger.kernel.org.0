Return-Path: <linux-gpio+bounces-14560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747FCA03D3B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 12:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4D463A3987
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 11:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B401DF756;
	Tue,  7 Jan 2025 11:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="mh2QRgB0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FA8219ED;
	Tue,  7 Jan 2025 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736247971; cv=none; b=QEA3hCyqd41gAbkiT9JUbc9dJyR8KCKpGs2ADxgB0Ez2KZgKkSeFrltxpYrDGPEWT6uvd8ks5kZ8u0VovuRA3TRmDnFqTBvhmBYMzUpp1OQi2OvB7rpUKTEGk4GJGYksxdvFmNhNCTTn7Ag3ZS4VE6EQvJYqupWIfNRGyNmw+tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736247971; c=relaxed/simple;
	bh=93Rb+Ogkxz3F4UcRyaPH1HS1f7gZEjIEkrgdACGwwuk=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DMtzxcwNCAIAcwcH4NO1XPdcmJ7IB4JVXD4jrkXIuDEG897IHK60dmIGW5EGgGAybNTjN9UYGDzL5NHK5WcxxpD6Nh3lq5yLFwpTaPbaYztOR88r2iL7DM+pvMy/zZM0WyLbSN0K7wpxBelhIl4/iYLVqaYD3CMIttlqAr3paUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=mh2QRgB0; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5079JpOV026708;
	Tue, 7 Jan 2025 12:05:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	93Rb+Ogkxz3F4UcRyaPH1HS1f7gZEjIEkrgdACGwwuk=; b=mh2QRgB08IDXzC+U
	BmwYIOLcWK0qAYMBVvbB87uoyS7SXLCjlj16b+tYqXXXFVvZ0oriOtPMVYsgl7uW
	/DzkR2boobP8NnBRkxVnAOV8nTD/3k8JB5W4QjqDbyrU0byRGsQPHJM1d8i8g6q8
	w/8qjrs0sYRSwTvcivKVbbg1O5dilr1y+6iSEORwCYolIqiAZO+MhxnJKruMzZi/
	WFndIvLr0p/gK3dHaESlCOBaFyX2DdT0kuUBh6IsAB8lXSVF/rvWyC8XHhpOLsh5
	RuIEaz8HdHKeMBMMpOkMwUWHv1PyRBYfTjPt93HFJpTouK5R+ODDU+RWMfs3sXGA
	zLOGZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4410vgrrxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 12:05:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5756C40048;
	Tue,  7 Jan 2025 12:04:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 112D22649E9;
	Tue,  7 Jan 2025 12:03:47 +0100 (CET)
Received: from [192.168.8.15] (10.48.86.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 7 Jan
 2025 12:03:46 +0100
Message-ID: <2f37dd23a4bf04c5c66aa193c6604f24a5f59011.camel@foss.st.com>
Subject: Re: [PATCH v10] pinctrl: stm32: Add check for clk_enable()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Mingwei Zheng <zmw12306@gmail.com>
CC: <marex@denx.de>, <linus.walleij@linaro.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <make24@iscas.ac.cn>,
        <peng.fan@nxp.com>, <fabien.dessenne@foss.st.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Tue, 7 Jan 2025 12:03:43 +0100
In-Reply-To: <20250106220659.2640365-1-zmw12306@gmail.com>
References: <20250106220659.2640365-1-zmw12306@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

On Mon, 2025-01-06 at 17:06 -0500, Mingwei Zheng wrote:
> Convert the driver to clk_bulk*() API.
> Add check for the return value of clk_bulk_enable() to catch
> the potential error.
>=20
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled wh=
en LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
> Changelog:
>=20
> v9 -> v10:
> 1. Move the id assignment into pctl->clks[i].clk assignment loop.
> 2. Remove empty lines.

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks!
Antonio

