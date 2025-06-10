Return-Path: <linux-gpio+bounces-21168-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4F6AD35A5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42E693B4BA3
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7362028E588;
	Tue, 10 Jun 2025 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="fnDqXI6O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892A28D854;
	Tue, 10 Jun 2025 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557399; cv=none; b=C4el1tMmGbAaIqULS/y6Yw/zWKDzwvDba2Z2OmjRANkNsRvjGq3G/SEeySIGQbXaQQnqUTcODdIWR35CzurW0fT6EahTS06DZDJnrmKnI7bIdziqAyv/7+eAV5Rnj90tl4vSHL3r2B9PhN7Fmh1QFhucK5ERY37ecLfIZvKgbIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557399; c=relaxed/simple;
	bh=sxCaVWyMI1/m+bD68f6pI/fH2+IWROB6x1dwutaaZEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L42MkBPWQPVvgxdfVFgriH0a3VxVIliFONqGxq7w09TrLLm9U3wjXHwxh90cCNwBAOqkmhurN6ygZ+16nmy6myhqEAt/VHvSu7mvaPxL9utYob8GVka3277ekP3pQGmszIBoVpu90cqDFbWmDoEhu5SLLOfW3BUxADvv0zyXc8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=fnDqXI6O; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AC92oj024409;
	Tue, 10 Jun 2025 14:09:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	rbT+/LcXhnguYXXSk/7BxGc8Wpdz3ZyHLa8xXsRBNrQ=; b=fnDqXI6O+WJPistn
	bnZ8DY90tUXzuIBXtkCiwKYbQ0yuNFQecwxgJs/UlcPmsZrU2CYGPmTYSYmeZHOj
	d1cwA+XuSl4xlbDUgNjsNZFueqhF7omyMWhJBDZLcyDmwHJloTFXQcDrWB9t7Zfi
	R8NICF8GKNtMa1wWdwZflkEOHzfYOCCXd9lLfloPdd/+2Xdm3R1pizI6oATBcHGj
	Xv8ZLdGa/f8d3eRrh8J/edSZpBF63QbwVD6xsN1woB5EezODMS1rKZcfP5B/8azg
	ZzYoPNt/P5DXh3c/zWfQUTHVRZI9nR2TCnV2gzZQ3oZvabmZTbNMoqcMlufQNS6e
	RLzqkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahm10e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:09:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 69F014006E;
	Tue, 10 Jun 2025 14:08:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3843B394F9;
	Tue, 10 Jun 2025 14:07:48 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:07:48 +0200
Message-ID: <7f7d6fb3-f696-4dd4-ac19-e5d77134a061@foss.st.com>
Date: Tue, 10 Jun 2025 14:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] ARM: dts: stm32: add alternate pinmux for HDP pin
 and add HDP pinctrl node
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
 <CACRpkdaXY1=v_HY9-PDZ=HYwJrP7P8ncZoCDm1da=vxoEazD4Q@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdaXY1=v_HY9-PDZ=HYwJrP7P8ncZoCDm1da=vxoEazD4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01

On 6/5/25 14:57, Linus Walleij wrote:
> On Fri, May 23, 2025 at 2:40 PM Clément Le Goffic
> <clement.legoffic@foss.st.com> wrote:
> 
>> Introduce hdp node to output a user defined value on port hdp2.
>> Add pinctrl nodes to be able to output this signal on one SoC pin.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> 
> That's nice, this is exactly how pin control is supposed to be
> used!

Hi Linus, thank you!

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij


