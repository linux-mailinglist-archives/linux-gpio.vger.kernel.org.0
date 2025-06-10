Return-Path: <linux-gpio+bounces-21166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 841ABAD3588
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FD7E3B4FB8
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F9D22F3B1;
	Tue, 10 Jun 2025 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="uxkwqydq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970B322F173;
	Tue, 10 Jun 2025 12:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557086; cv=none; b=B0QffD2/bXjD0WYt+23olK2HWt82xClo3Bw1W/kuHDhubLKQ7mUzU7gAHjM0ZXCUNs8mK3LCyUOCS4iUjLhQUxWwm0zq+gogoeMQTCT5IC9mLAxpfHab2xo7/dexk+mtJAk2rCPxL6VfCnSv8WvatLBodQ8nEmew2Pm+6/XrVtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557086; c=relaxed/simple;
	bh=FOVvDRtH0mywtOO2+ed9IL39TL5QFltNabVbXA78hiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=spgkqn3Z3FjnZ2h5uO5zKqJSVJAZVtci2DaSo3dygsg+7ZvsfD6+2EfDrawU9eSzZSEI3a6s+8eROcPM/Icug9sIoo1HSiPYXhBNOD886na+9qDzNs9jSAbuDiAkuKeBn7MNmMdiqxlqXkXKx9q5Dl+r5wwamI1xJvOATjB8JOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=uxkwqydq; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9ILvm010710;
	Tue, 10 Jun 2025 14:04:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	gqdWLmhlmvRAVAbQEmyb3OnvKFUT4lR61wher7OOzk8=; b=uxkwqydqfyLrmp7t
	TJl3Ulbxd6zF2T+xkvCBu74SD8g9pfxIaq+Wx4f+3NsfoFn/aLhc/wEQ0W22K7qt
	OzKjtrs7t++64ir1Z3zVov1dj3kFY6yVlBy30euB8rO+sUZUIgYwV9TaGGN+8C/n
	p2HDupMKjgC5tITajvL/4tB0UMAGeKUUc6w6Nm36KVBrdKZaVDh+U2uErYt+qinW
	eH/QibaZAAeyFICgO7TUz3Ycfp/1ZN1lhXoHugTDYpt6U7vxSSv3nvhU7UasK/WF
	ib3EjRS/7SELBKfeh1X/Fw8ig3urGWYz4Nu2sV/taSA77PCIpdFb7hU46/a7ZClb
	vfPkQg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y052bdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:04:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2495040044;
	Tue, 10 Jun 2025 14:03:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6EAAB35036;
	Tue, 10 Jun 2025 14:02:35 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:02:35 +0200
Message-ID: <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
Date: Tue, 10 Jun 2025 14:02:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01

On 5/29/25 11:01, Krzysztof Kozlowski wrote:
> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>
>>>> +		};
>>>> +
>>>> +		hdp: pinctrl@5002a000 {
>>>> +			compatible = "st,stm32mp131-hdp";
>>>> +			reg = <0x5002a000 0x400>;
>>>> +			clocks = <&rcc HDP>;
>>>>    			status = "disabled";
>>>
>>> Why are you disabling it? What is missing?
>>
>> Nothing is missing just disabled by default.
>> The node is then enabled when needed in board's dts file.
> Nodes should not be disabled by default if they are complete. That's why
> I asked what is missing. Drop.

Hi Krzysztof, OK I better understand now.
So yes the 'pinctrl-*' properties which are board dependent are lacking.

In the last patch of my serie I add them (only for stm32mp157f-dk2) but 
keep it disabled because the pin is on an external connector (the 
Arduino connector of the board).
This prevent any issue with a possible connected module.

> Best regards,
> Krzysztof


