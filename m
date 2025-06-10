Return-Path: <linux-gpio+bounces-21173-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C82AD3613
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 560913B2F53
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA87290D9F;
	Tue, 10 Jun 2025 12:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="sB2y45r3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EFA290D84;
	Tue, 10 Jun 2025 12:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558188; cv=none; b=KroyWTsXLwK0KLCFU+A46KPuJS7xMjfG1L7e7f1gEO+kHK+1111m3JNzufotYtFM6TNlM9rX5/EkW1xy6sOFodTyTxF50C4tZDURL1qL7umH6xuQ+JR3fepTRGuvYLgq+3A+RQuRAcHB/hPUJ/9Z2gqfhbufnC9aolOIKdnbRAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558188; c=relaxed/simple;
	bh=KfeUVbcSCFP1T2kBXbqY1+q2hxmS4hdRneI4dnE/UAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HvscKPYEtkZ7VSUeVy/V6Sk0aW4kO2u2cuva3wxW6QfC3JfZcoraPQqhJ/aRr0XfpzHWJ8hEPdlDg5gTt0fgRYfm/fnTem1XDwsXUAHcJxlwP3PA38nLtfB+gnqvAwkw/SVFEfUEHzbKuWPfMGwaNe2TTDVK5Ecpviq3IfRNL8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=sB2y45r3; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLEIT013926;
	Tue, 10 Jun 2025 14:22:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vtivjLTREzj3xhUyN5Ni31CViS5Q+PvnvLeG0iZlrcE=; b=sB2y45r3vLSNQ2D3
	Uvp21XuXqL78esQhQKZfXzybGiUPlzMD5WzROhXNXMhz5I2Qf6sA+3XtzhPR6yhA
	z8goGGaGkQfFtjmXGXrITS0+041glQb3O3RAHkD58LC4eqNMq4bPjj/V9bRwFoH0
	Oew+fMowKFeQ0HrorR+qQvpTuDI2ZqoHx3uNe14eopQ7fy/o5JjlOEA3njYbw8Du
	HQTCZLXPseBl7Upk4UihrQCFvMqq4vL+M/eTnYzp4d/sxCysSXNVI6GfdpjxMVwc
	VvtKTNsQVCO3Lo/tedoEj5C6QHjUPdt5wRzxrBEFflTbQF98Zr9vHHmVkQLz5bfH
	jqVooQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahm2yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:22:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3F73440066;
	Tue, 10 Jun 2025 14:21:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD68CB2149E;
	Tue, 10 Jun 2025 14:20:28 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:20:28 +0200
Message-ID: <3a9e5a1b-41fd-4ddf-938a-bed98551a024@foss.st.com>
Date: Tue, 10 Jun 2025 14:20:27 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Introduce HDP support for STM32MP platforms
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdZ2NUfcn7O7tKSFDyAr8Hni3pvpTN6QpOz7N3J+EsFdLg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01

On 6/5/25 15:03, Linus Walleij wrote:
> On Wed, May 28, 2025 at 3:33 PM Clément Le Goffic
> <clement.legoffic@foss.st.com> wrote:
> 
>> Clément Le Goffic (9):
>>        gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>>        dt-bindings: pinctrl: stm32: Introduce HDP
>>        pinctrl: stm32: Introduce HDP driver
>>        MAINTAINERS: add Clément Le Goffic as STM32 HDP maintainer
> 
> Can I apply the driver and bindings patches 1-4 separately
> from the rest of the series?

The MAINTAINERS file will need a fix in the future revision.
I'll wait Krzysztof answers before submitting a V5 with the fix.

Otherwise patch 1-3 can be merged, but I think you may need the 
MAINTAINERS file to merge the driver + bindings.

Clément

> 
>>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
>>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
>>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
>>        ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pinctrl node
>>        ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2 board
> 
> Or does it need to be merged along with these?
> 
> Yours,
> Linus Walleij


