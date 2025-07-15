Return-Path: <linux-gpio+bounces-23281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F22B05489
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 10:17:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FA521AA2AE3
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 08:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6542750EA;
	Tue, 15 Jul 2025 08:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="GzTnNJo9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EFC2652B6;
	Tue, 15 Jul 2025 08:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567417; cv=none; b=FzZ5p4fZ+Cbr2j3OZGv7McoaxfW5VeWuaFL4NO+3OpJ2eTKLKdAcAeO1WoCqCFgWqZRWzJDw4VSWiu3ZsawQNrzi3dihJZwvxLCIWW+3i6HFfMzjPWFeo6yAOPvuPQ9KZyOJOWTI9gbNWf+5tQ1J1GGvjzUOQ1E4tfwY7uxz9h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567417; c=relaxed/simple;
	bh=lZnu3rvuoEPqS5m02ApnpemM35Q8K8ovBDyPEkNum5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Zphg+W7cWr2YTZD5CZ9aJocSKS1TaNZ0Qg95kFDBP+fz7cjrK4llkT2xa3CmIbffXi5DFut7L3ovhkTxzwVfU+L5GVMvwQ6CxYMZJiXiQYeAulncM1PVO541dru8HAUePUXdcum+2jIdYk08afju3eo+aZuW1C5EwyQvX3eqMoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=GzTnNJo9; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F6eaSF008220;
	Tue, 15 Jul 2025 10:16:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dHBf9KIGX9skQDUPGn9m/eAuRafYFNCwT7CcfK1pNpg=; b=GzTnNJo9R2dr9qiG
	dXXiL4QKZ5+6RSkjo1J8110/xGhbC42nGIM+nV0B/3cGYN7BAkzsojekd+W9uNTk
	+CH4862GDkMuP+CJbxswzyFD0F10lPWJ6C9Eyg5hO5TF/4Z3q/VaD0n76ysw5a5v
	2egIirYzKTaXMHZYd3nThIRuw6t/K09U6ghuPPDrW/u5VtfP5+deRJwnrRSR/3sc
	+arH37hRWeez5SfHYQmKmVStYraZaZZcgp8UexB3BJtHpeV6okWlDTywcebeukKi
	rPBmN46kal7qXgHKxnEuHYcT9em4aWlXZSJtU5WoXHBGq9zCzXe0Bo8D6DPdZhV+
	9nl/qQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47v2nnrvj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 10:16:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9CC8040054;
	Tue, 15 Jul 2025 10:15:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F185EB60F4A;
	Tue, 15 Jul 2025 10:13:54 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 10:13:54 +0200
Message-ID: <7f363c87-01d5-43f7-a15b-844fb5530c5d@foss.st.com>
Date: Tue, 15 Jul 2025 10:13:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/8] dt-bindings: pinctrl: stm32: Introduce HDP
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio Borneo
	<antonio.borneo@foss.st.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250711-hdp-upstream-v7-0-faeecf7aaee1@foss.st.com>
 <20250711-hdp-upstream-v7-1-faeecf7aaee1@foss.st.com>
 <11a49801-d187-479b-865b-810ca5adbf00@foss.st.com>
 <CACRpkdYXQRGO7BrF9+08StWyOkDoqLhNQdgk=bhoccg1BogpqQ@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdYXQRGO7BrF9+08StWyOkDoqLhNQdgk=bhoccg1BogpqQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01

Hi Linus,

On 7/11/25 20:51, Linus Walleij wrote:
> On Fri, Jul 11, 2025 at 10:04 AM Clement LE GOFFIC
> <clement.legoffic@foss.st.com> wrote:
> 
>>> +maintainers:
>>> +  - Clément LE GOFFIC <clement.legoffic@foss.st.com>
>>
>> Oops, need to change the mail address here too.
> 
> Don't worry I fixed it while applying the patch.

Cool thank you :-) !

Best regards,
Clément

