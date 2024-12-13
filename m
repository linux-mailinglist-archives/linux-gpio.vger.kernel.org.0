Return-Path: <linux-gpio+bounces-13857-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 502009F0AF2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 12:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11274280F0C
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 11:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CDD1DE4F3;
	Fri, 13 Dec 2024 11:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HLVfOaZ4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E1E1A7273;
	Fri, 13 Dec 2024 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089230; cv=none; b=e3+ViOg7F06cWSU18PxvHuDhlFgmOajs/iZq1c4LOWRckS5DpGE31yLSAQsa20K7WPsevUJBOg9jKPWdlDCxDIdqZIymA3qLBFtF/PzMnthUHZSyxvaD51l7dmAMr0R0ixdxU1b/Sg31rMFncw+3J3kbogQzCmp2JXso5hdWfZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089230; c=relaxed/simple;
	bh=aecKC1nbFGwMKzZFE60/uPoM9kBBXM5M0QpP3eJbLPk=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IPVCfq+fFLNjsNMvZ/IP7VRMPTLRFvuPXdz++PBearOhZggyhwkuRIfmSozV4WxZZ0t2VVs7RLCtZaoWTKDRShNHc1+33zdgBJFsyeAQ511HY6ZIT9Lu9EfnsVGHt+Hj0iSOkd2dh+G/5dKyFxE4uqUI+7k9YIB6qr12zp0vp3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HLVfOaZ4; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAwAZL006431;
	Fri, 13 Dec 2024 12:26:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	aecKC1nbFGwMKzZFE60/uPoM9kBBXM5M0QpP3eJbLPk=; b=HLVfOaZ4HH/xwZ66
	2EpBl4mtew7RZOjkKJU/IihLFHHtRWRnnTD5/sWFXR2czRt0RvR+meKQBQy5/WsC
	J93gzzx1QzjoDbjN2EmMlrgSI0XyzCotviywLLV65Q8IX+q887Hfe+lqiq5BQYuU
	QqwkEGc5BuVUw5shcuoFnk92f1xDeLA8rXrhqfCQFegMHoV2foZeKA8ccJG2CDhs
	nF8yJFW1fzdUkERAAeum7KLmfHX6PnfKbczMY/Ns5PGuWQMZ8w/BLsUFXuelX+xm
	b9JWBpWv0/yAKqdpM5UxccUcj1nEebR9dzdK69bQefMhhN/fEPFWK6cSYJtltXSH
	XT6Zaw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ggwes10m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Dec 2024 12:26:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D116A40046;
	Fri, 13 Dec 2024 12:25:35 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ECDA726B635;
	Fri, 13 Dec 2024 12:24:51 +0100 (CET)
Received: from [192.168.8.15] (10.48.87.33) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 13 Dec
 2024 12:24:51 +0100
Message-ID: <799c111fbae0b707ac76348f4fd8c9c3bbafcdc0.camel@foss.st.com>
Subject: Re: [PATCH v4] pinctrl: stm32: Add check for clk_enable()
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Mingwei Zheng <zmw12306@gmail.com>, <marex@denx.de>
CC: <linus.walleij@linaro.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <make24@iscas.ac.cn>,
        <peng.fan@nxp.com>, <fabien.dessenne@foss.st.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jiasheng Jiang <jiashengjiangcool@gmail.com>
Date: Fri, 13 Dec 2024 12:24:47 +0100
In-Reply-To: <20241213010948.2623382-1-zmw12306@gmail.com>
References: <20241213010948.2623382-1-zmw12306@gmail.com>
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

On Thu, 2024-12-12 at 20:09 -0500, Mingwei Zheng wrote:
> Convert the driver to clk_bulk*() API.
> Add check for the return value of clk_bulk_enable() to catch
> the potential error.
>=20
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled wh=
en LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---

Rewiewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks!

