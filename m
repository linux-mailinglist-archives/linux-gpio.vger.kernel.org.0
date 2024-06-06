Return-Path: <linux-gpio+bounces-7237-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304468FE54C
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 13:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EF211C22E0A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 11:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A4B1957EF;
	Thu,  6 Jun 2024 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="feYgjcSG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2525A160865;
	Thu,  6 Jun 2024 11:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717673126; cv=none; b=Yl8ldJcJZgHIyoeW15BI8T2/COpBu3Cg1TBFAKN7eo4OiUkeNZErCP0c7vBue9a0heLgVNlKA/X4OuhLkB+dikfK7IlpxUoNM3d2MFxvF5BnW9KFpLdvjAMiAUwYkan7dZv2AWtdVBrx0Z8FSGk/BksKlumUTQTMXNe6CxfuV8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717673126; c=relaxed/simple;
	bh=h/xa4eI3k6X86KwGTxpdw1YXWi5nn9xiWeQAYUex1Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=icdoBuxR0H2nuWPhMEPImXtxO9TvE9KdURhlzmPagxjCV+ONMj/BrcjCiW3WkJ0gbu1OaUa2QID39vOoEZAyrJVuXXxKVXquIegV7uTvWVZ0cQq/LZmlaewKttoeLxU7bmxnMuoUjtiNYSkCk5n3GWedzzjrFoVfqgMeppkp6B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=feYgjcSG; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
Message-ID: <a4e639fa-090c-481f-ae36-7d04d7a2cc17@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1717673121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=00XnzfKyvFc8UCi5vg7ycZAPYKRfP4qnEUVe/4uYGYc=;
	b=feYgjcSGrXSBzYcCMRnEjsfaeVtDHixqKtJOI1H6dUdgZP5sOU+sqNyV+fB+P6b5td39fw
	FbmOs60EQFuB978YYMf8NrV1egw8JdOO5l55Asl8TGbu1gVuT/Q0ZwrekbhJAke2iY08EU
	/K+WNCJxAfJ/gaYnrpOV3DhLkFlNsng=
Date: Thu, 6 Jun 2024 19:25:13 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] pinctrl: rockchip: fix RK3328 pinmux bits
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240606060435.765716-1-i@eh5.me>
 <20240606060435.765716-2-i@mail.eh5.me> <3862456.FjKLVJYuhi@diego>
Content-Language: en-US
From: Huang-Huang Bao <i@eh5.me>
In-Reply-To: <3862456.FjKLVJYuhi@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/6/24 18:08, Heiko Stübner wrote:
> Hi,
> 
> Am Donnerstag, 6. Juni 2024, 08:04:33 CEST schrieb Huang-Huang Bao:
>> The pinmux bits for GPIO2-B0 to GPIO2-B6 actually have 2 bits width,
>> correct the bank flag for GPIO2-B. The pinmux bits for GPIO2-B7 is
>> recalculated so it remain unchanged.
> 
> I've verified the gpio2-related pin settings via the TRM, so this part
> looks good :-)
> 
> 
>> The pinmux bits for GPIO3-B1 to GPIO3-B6 have different register offset
>> than common rockhip pinmux, set the correct value for those pins in
>> rk3328_mux_recalced_data.
>>
>> The pinmux bits for those pins are not explicitly specified in RK3328
>> TRM, however we can get hint from pad name and its correspinding IOMUX
>> setting for pins in interface descriptions, e.g.
>> IO_SPIclkm0_GPIO2B0vccio5 with GRF_GPIO2B_IOMUX[1:0]=2'b01 setting.
>>
>> This fix has been tested on NanoPi R2S for fixing confliting pinmux bits
>> between GPIO2-15 with GPIO2-13.
> 
> As you said, the gpio3-based pins are not documented in the TRM,
> but in your description above you're talking about pins in the gpio2-
> group?
> 
> So where did the gpio3-related pin information come from?

Sorry I didn't explained it clearly, gpio3 information is inferred from
pad name in interface descriptions similar to gpio2's, all those pad
name has format of "*GPIO<bank><pin number>*". So I just search up
interface description rows with pad name from "GPIO2B0" to "GPIO2B6" and
from "GPIO3B1" to "GPIO4B7" to find potential IOMUX bits definitions.
For example, there is IO_TSPd5m0_CIFdata5m0_GPIO3B1vccio6 with
GRF_GPIO3BH_iomux[3:2] = 2'b01 setting for GPIO3B1.

Maybe I can list all these occurrences in v2.

> 
> Also, could you please split this patch in two pieces, one fixing the
> gpio2-area and one for the new gpio3 pins please?

Sure.

> 
> 
> Thanks
> Heiko
> 
>> Signed-off-by: Huang-Huang Bao <i@eh5.me>
>> ---
>>   drivers/pinctrl/pinctrl-rockchip.c | 59 ++++++++++++++++++++++++++----
>>   1 file changed, 52 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
>> index 3bedf36a0019..23531ea0d088 100644
>> --- a/drivers/pinctrl/pinctrl-rockchip.c
>> +++ b/drivers/pinctrl/pinctrl-rockchip.c
>> @@ -634,23 +634,68 @@ static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
>>   
>>   static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
>>   	{
>> -		.num = 2,
>> -		.pin = 12,
>> -		.reg = 0x24,
>> -		.bit = 8,
>> -		.mask = 0x3
>> -	}, {
>> +		/* gpio2_b7_sel */
>>   		.num = 2,
>>   		.pin = 15,
>>   		.reg = 0x28,
>>   		.bit = 0,
>>   		.mask = 0x7
>>   	}, {
>> +		/* gpio2_c7_sel */
>>   		.num = 2,
>>   		.pin = 23,
>>   		.reg = 0x30,
>>   		.bit = 14,
>>   		.mask = 0x3
>> +	}, {
>> +		/* gpio3_b1_sel */
>> +		.num = 3,
>> +		.pin = 9,
>> +		.reg = 0x44,
>> +		.bit = 2,
>> +		.mask = 0x3
>> +	}, {
>> +		/* gpio3_b2_sel */
>> +		.num = 3,
>> +		.pin = 10,
>> +		.reg = 0x44,
>> +		.bit = 4,
>> +		.mask = 0x3
>> +	}, {
>> +		/* gpio3_b3_sel */
>> +		.num = 3,
>> +		.pin = 11,
>> +		.reg = 0x44,
>> +		.bit = 6,
>> +		.mask = 0x3
>> +	}, {
>> +		/* gpio3_b4_sel */
>> +		.num = 3,
>> +		.pin = 12,
>> +		.reg = 0x44,
>> +		.bit = 8,
>> +		.mask = 0x3
>> +	}, {
>> +		/* gpio3_b5_sel */
>> +		.num = 3,
>> +		.pin = 13,
>> +		.reg = 0x44,
>> +		.bit = 10,
>> +		.mask = 0x3
>> +	}, {
>> +		/* gpio3_b6_sel */
>> +		.num = 3,
>> +		.pin = 14,
>> +		.reg = 0x44,
>> +		.bit = 12,
>> +		.mask = 0x3
>> +	}, {
>> +		/* gpio3_b7_sel */
>> +		.num = 3,
>> +		.pin = 15,
>> +		.reg = 0x44,
>> +		.bit = 14,
>> +		.mask = 0x3
>>   	},
>>   };
>>   
>> @@ -3763,7 +3808,7 @@ static struct rockchip_pin_bank rk3328_pin_banks[] = {
>>   	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", 0, 0, 0, 0),
>>   	PIN_BANK_IOMUX_FLAGS(1, 32, "gpio1", 0, 0, 0, 0),
>>   	PIN_BANK_IOMUX_FLAGS(2, 32, "gpio2", 0,
>> -			     IOMUX_WIDTH_3BIT,
>> +			     0,
>>   			     IOMUX_WIDTH_3BIT,
>>   			     0),
>>   	PIN_BANK_IOMUX_FLAGS(3, 32, "gpio3",
>>
> 
> 
> 
> 

