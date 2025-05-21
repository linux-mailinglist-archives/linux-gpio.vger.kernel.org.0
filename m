Return-Path: <linux-gpio+bounces-20421-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63904ABF13F
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 12:16:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1697F4E55BB
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFEC225D53A;
	Wed, 21 May 2025 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="L9Lrz04i"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F64B2472B4;
	Wed, 21 May 2025 10:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822581; cv=none; b=aMhwNx9ccpJtYRP+jwPsMNY6N//aNMUbzdoSopyoTfRm72n1aZVN4w266E6mSp+WXiaM/qUoOrepDwBIkkM7fugt3482N2XAVA8FvRq5KBjQwJ8jzHIWFVy52DpEdX21PxQ/BBEbjLtVW7jtUDCVderaWsY0NPgmuu53sy/hN/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822581; c=relaxed/simple;
	bh=/k/a4J1ZQRWcPa1nH/vET9PeEU5HG1j8mbumv3W+SpQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=bt735nEqfocNsR/nTOfjlNDXNDBnJA9kzMLAQzFriSLW9AspyoJieypEoDMpsiEsyBEPTfFN6QzVnkzvIYnw9ubQcfE8CsKVTD1lhb7DZen95dsfRyFcg/ZjZw4s62iwrkMIkJZUQerGwKNkrIoRCHHFi2qRMO58NDNyDlJr+EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=L9Lrz04i; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9l708029646;
	Wed, 21 May 2025 12:16:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	mzFSpe7hA7gsH1lLUxy+lsRSjB0E3F7awJ9YqjsAY4c=; b=L9Lrz04iPTNTANgU
	AKn3QsTq5dcgGz47H847d41uhxzoY61n5IoRI0nrz4Co/AAerPLM1nXJl+Gka6Mc
	xpuoprRQrzPLxjwWcHd9ywcv89aIa8MmPt+Uy52O5UtBbHAlI3XGZRunVv4vpF5T
	zoLxA2NfNvHX6g/Qp+eIgppFFmFngRtaNv7H2b5BG3ao/A0ir6Ne6QOhq1UU4MwP
	dMw0y5vMCCR+2d5Cce7ik92e1mbry3KRzGFu/EMaQIJG+1Tj1ohirKJRub5LVpxF
	K19jwKBV9gMhfIVdLueGckH8Dmzc9uU7fB4TW8smZAsFyOZNmin++aI5/zBp2a03
	Ni/JnA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwff3fgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 12:16:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B70F940045;
	Wed, 21 May 2025 12:14:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 14265BAEB1E;
	Wed, 21 May 2025 12:14:10 +0200 (CEST)
Received: from [10.48.81.67] (10.48.81.67) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 12:14:09 +0200
Message-ID: <929f6f1f-d47f-4954-8c8b-91c932127975@foss.st.com>
Date: Wed, 21 May 2025 12:14:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] pinctrl: stm32: Introduce HDP driver
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
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
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
 <CACRpkdZp6D-duzyVRLv5+PURb3Nu69njJx_33D-2aYS4DjmsoQ@mail.gmail.com>
 <94795d0c-0c73-41eb-ada6-9a01b2ac5892@foss.st.com>
Content-Language: en-US
In-Reply-To: <94795d0c-0c73-41eb-ada6-9a01b2ac5892@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01

On 5/21/25 11:49, Clement LE GOFFIC wrote:
> On 5/21/25 00:34, Linus Walleij wrote:
>> Hi Clément,
>>
>> thanks for your patch!
>>
>> On Tue, May 20, 2025 at 5:04 PM Clément Le Goffic
>> <clement.legoffic@foss.st.com> wrote:
>>
>>> This patch introduce the driver for the Hardware Debug Port available on
>>> STM32MP platforms. The HDP allows the observation of internal SoC
>>> signals by using multiplexers. Each HDP port can provide up to 16
>>> internal signals (one of them can be software controlled as a GPO).
>>>
>>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>
>> (...)
>>> +static int stm32_hdp_gpio_get_direction(struct gpio_chip *gc, 
>>> unsigned int offset)
>>> +{
>>> +       return GPIO_LINE_DIRECTION_OUT;
>>> +}
>>
>> That's reasonable.
>>
>>> +static int stm32_hdp_gpio_get(struct gpio_chip *gc, unsigned int 
>>> offset)
>>> +{
>>> +       struct stm32_hdp *hdp = gpiochip_get_data(gc);
>>> +
>>> +       if (((hdp->mux_conf & HDP_MUX_MASK(offset))) == 
>>> HDP_MUX_GPOVAL(offset))
>>> +               return !!(readl_relaxed(hdp->base + HDP_GPOVAL) & 
>>> BIT(offset));
>>> +       else
>>> +               return !!(readl_relaxed(hdp->base + HDP_VAL) & 
>>> BIT(offset));
>>> +}
>>
>> ...but you still make it possible to read the value of the line
>> if it's not muxed as GPO?
>>
>> Should it not stm32_hdp_gpio_get_direction() return
>> GPIO_LINE_DIRECTION_IN if HDP_MUX_MASK(offset))) != 
>> HDP_MUX_GPOVAL(offset)?
> 
> Hi, oops, you're right !

I've answer too quickly. All the pins are "out" in fact.
The hardware is not able to read input signal.
I wanted to implement a way to read the register value in any case by 
leaving the line direction unchanged.

>>
>>> +static void stm32_hdp_gpio_set(struct gpio_chip *gc, unsigned int 
>>> offset, int value)
>>> +{
>>> +       struct stm32_hdp *hdp = gpiochip_get_data(gc);
>>> +
>>> +       if (value)
>>> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOSET);
>>> +       else
>>> +               writel_relaxed(BIT(offset), hdp->base + HDP_GPOCLR);
>>> +}
>>
>> Can't you just use GPIO_GENERIC for this?
>>
>> bgpio_init(gc, dev, ARRAY_SIZE(stm32_hdp_pins), // == 8
>>      hdp->base + HDP_VAL,
>>      hdp->base + HDP_GPOSET,
>>      hdp->base + HDP_GPOCLR,
>>      NULL,
>>      NULL,
>>      0);
>>
>> The default behaviour of GPIO MMIO is to read the output register
>> for the value if the line is in output mode.
>>
>> You may wanna override the .get_direction() callback after bgpio_init()
>> and before registering the chip, either with what you have or what
>> I described above.
> 
> I didn't know about it, I'll take a look and provide a V3.
> 
> Thank you,
> 
> Clément
> 
>> Yours,
>> Linus Walleij
> 


