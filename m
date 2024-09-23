Return-Path: <linux-gpio+bounces-10379-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A06FF97E99A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 12:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52C7E1F21869
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Sep 2024 10:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6694A194A54;
	Mon, 23 Sep 2024 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TUjORmG8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798241C36;
	Mon, 23 Sep 2024 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727086354; cv=none; b=pB86EAqtSCcD72RjzfeKNGxsaE3Pe2zCGWDvZF1VQoeQJE6emqn97ZWyBmjpqGaI5Q/smBazxT2fcUfBcfOmznrV/vc0YUctdU88xQWVZ4s4XQ6D3nnGuDsixOJwfLJKOzT5LNI/wAnutvk3YyrpRa3j79n70kATLk41TBLvj3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727086354; c=relaxed/simple;
	bh=wzbqTKNSENMNnM1WJXcjlwbi8yyEVGWGNC4XJRlTbas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVwO2iLfrFRysF6x+SzHUSzvj+F3zV7IuWOd36cZLhxyqc7PS9PKzmkE22/j4raRTNF5wLdjE+BJ51a13ylkWQ5SgZXdewCxq6lgISyLHMz1g6GjtJG9wqTCwPFOu0dUYSuVNjd38OqPMxQt7AklyU38RywCVqE0/OEI4kXN0/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TUjORmG8; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=KSpGKT8tqlqF3uvKBUIVDjvirodZerxMHtuK5v8dth0=;
	b=TUjORmG8AilmAXRxk2sMBokBtdklYj8nnZuKcyl6igsregyr/n84hnYY0c24FJ
	b/r6Tw0kgpIfvNpKGUOETv7K1W/mDjG4+6hPCvUI1CQCZe2siIgHNaEPsNoZeDXd
	26LpIVH55UwoOJuxDmHEWoKyT+AsoA4zh7GCQrFNIc4gs=
Received: from [192.168.31.242] (unknown [27.18.197.191])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wAHDX1PO_Fm3gDcCw--.9132S2;
	Mon, 23 Sep 2024 17:56:34 +0800 (CST)
Message-ID: <c8e3f856-d2ca-4e54-af28-50b6bb2bc05a@163.com>
Date: Mon, 23 Sep 2024 17:56:31 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 3/3] riscv: dts: canaan: Add k230's pinctrl node
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240916063021.311721-1-18771902331@163.com>
 <20240916064706.318793-2-18771902331@163.com>
 <1d57b766-0db1-4266-9aa5-11c131a636df@linaro.org>
 <33e64928-0939-434a-9e6c-5f1af57992b2@163.com>
 <20240923-gyration-enzyme-16cd3fc6d091@spud>
Content-Language: en-US
From: Ze Huang <18771902331@163.com>
In-Reply-To: <20240923-gyration-enzyme-16cd3fc6d091@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wAHDX1PO_Fm3gDcCw--.9132S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW7CrW3CF1DKw4kAw4DXFb_yoW8Ww1kpw
	4agFs8Crn7JrsIyF1aqFyqgr1avan2yr40gw13KryUJr1aqry3GwnYqr48WryDWF4xZ3y0
	9r4Fq34I9r1YyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRrb15UUUUU=
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiNwhjombxMMbYZQAAsi

On 9/23/24 5:50 PM, Conor Dooley wrote:
> On Wed, Sep 18, 2024 at 04:39:29PM +0800, Ze Huang wrote:
>> On 9/16/24 11:52 PM, Krzysztof Kozlowski wrote:
>>> On 16/09/2024 08:47, Ze Huang wrote:
>>>> Add pinctrl device, containing default config for uart, pwm, iis, iic and
>>>> mmc.
>>>>
>>>> Signed-off-by: Ze Huang <18771902331@163.com>
>>>> ---
>>>>    arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi | 316 +++++++++++++++++++
>>>>    arch/riscv/boot/dts/canaan/k230-pinctrl.h    |  18 ++
>>>>    arch/riscv/boot/dts/canaan/k230.dtsi         |   2 +
>>>>    3 files changed, 336 insertions(+)
>>>>    create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>>>>    create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
>>>>
>>>> diff --git a/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>>>> new file mode 100644
>>>> index 000000000000..0737f50d2868
>>>> --- /dev/null
>>>> +++ b/arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
>>>> @@ -0,0 +1,316 @@
>>>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>>>> +/*
>>>> + * Copyright (C) 2024 Ze Huang <18771902331@163.com>
>>>> + */
>>>> +#include "k230-pinctrl.h"
>>>> +
>>>> +/ {
>>>> +	soc {
>>>> +		pinctrl: pinctrl@91105000 {
>>> That's odd style - defining SoC nodes outside of SoC DTSI. Are you sure
>>> that's preferred coding style in RISC-V or Canaan?
>> Pinctrl-related nodes were separated the for ease of maintenance, but the
>> convention in Canaan is to place them in the board-level DTS file. Would it
>> be better to stay consistent with their approach?
> Yeah, please put them in the board-level file.

OK

>
> Thanks,
> Conor.


