Return-Path: <linux-gpio+bounces-7259-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEBD90079D
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 16:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AD1128C879
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Jun 2024 14:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB11C19B3F9;
	Fri,  7 Jun 2024 14:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="P3P6vckA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE87919752F;
	Fri,  7 Jun 2024 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717771604; cv=none; b=Ooj05DezlXFCAhXZyZOBik8TT1Gn52X7jVuFUWWi5TGRXJ6HJXae/UtOONG56iPJwlK5Sq4U+0mnSg8GNR0LLGauP3zTKKXq+jVmFSeye4UTAlFVd+CM7Te0/nWX8121d7Ci6dPyCjnqkz1D/IFoSj0V5c67c9JCJxpFj3PENE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717771604; c=relaxed/simple;
	bh=Gt0HkIEfUxbCWkwENOJ1j6PQBdm4XvC9znlgCeBcdyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLH9AXn07y8vERh7BeTh4ugCDP1wi4K2soYWZ4nRPf+DhOuSCU7UFI3jFDHDj9mz3Z9qScTmAQGz7Qo4/dMUmworffmika24jBRPvz8cpr/hyCN4yrFa7bdUGOK8hIdoKTriMnELJQeiY+tPMR7tj3gQedj/tlXDLwUlzCaOZbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=P3P6vckA; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
Message-ID: <3dab2269-a048-4750-bea8-cce245df075a@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1717771593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=706MONW8kwoOXWqy8lP/xTe9KGJQQ7km3fno9upjptk=;
	b=P3P6vckAe+9O51qpHIr+vhuqx+or43Mdi2J3KmjjDmpZdnZ5GpVvg0ejQr1GkPyGv9t9sz
	uv0N/Q/MYxWm8fBGq0HkyUT5HN1lGOE5xQHeJa23B1/QS5p1EdRK3+ckhKGVQkvNWGlzjT
	LD0u9azQVehcATSjJhF8ueFykN0P8ps=
Date: Fri, 7 Jun 2024 22:46:19 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] pinctrl: rockchip: fix pinmux bits for RK3328
 GPIO3-B pins
To: Heiko Stuebner <heiko@sntech.de>, Linus Walleij
 <linus.walleij@linaro.org>, kever.yang@rock-chips.com
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240606125755.53778-1-i@eh5.me>
 <20240606125755.53778-3-i@eh5.me> <4786379.ElGaqSPkdT@phil>
Content-Language: en-US
From: Huang-Huang Bao <i@eh5.me>
In-Reply-To: <4786379.ElGaqSPkdT@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/7/24 20:32, Heiko Stuebner wrote:
> Am Donnerstag, 6. Juni 2024, 14:57:53 CEST schrieb Huang-Huang Bao:
>> The pinmux bits for GPIO3-B1 to GPIO3-B6 pins are not explicitly
>> specified in RK3328 TRM, however we can get hint from pad name and its
>> correspinding IOMUX setting for pins in interface descriptions. The
>> correspinding IOMIX settings for these pins can be found in the same
>> row next to occurrences of following pad names in RK3328 TRM.
>>
>> GPIO3-B1:  IO_TSPd5m0_CIFdata5m0_GPIO3B1vccio6
>> GPIO3-B2: IO_TSPd6m0_CIFdata6m0_GPIO3B2vccio6
>> GPIO3-B3: IO_TSPd7m0_CIFdata7m0_GPIO3B3vccio6
>> GPIO3-B4: IO_CARDclkm0_GPIO3B4vccio6
>> GPIO3-B5: IO_CARDrstm0_GPIO3B5vccio6
>> GPIO3-B6: IO_CARDdetm0_GPIO3B6vccio6
>>
>> Add pinmux data to rk3328_mux_recalced_data as mux register offset for
>> these pins does not follow rockchip convention.
>>
>> Signed-off-by: Huang-Huang Bao <i@eh5.me>
> 
> This matches the information that I found in my TRM, thanks to your
> detailed explanation.
> 
> Though I of course can't say if the TRM is just wrong or the hardware
> changed after the pads-description was written.
> 
> Did you test the usage of these pins on your board?
> 

My board(NanoPi R2S) is kinda integrated and does not have GPIO3 pins so
I can't test these pins directly.

 From DTS for RK3328(arch/arm64/boot/dts/rockchip/rk3328*.dts*), there is
pinctrl/cif-0/dvp_d2d9_m0 referencing part of GPIO3-B1+ pins(GPIO3-B1 to
GPIO3-B4) that indeed matches "Table 15-1 TSP interface description"
which contains hint pad names. And this DTS node exists from
initial commit to add RK3328 dtsi
(52e02d377a72 "arm64: dts: rockchip: add core dtsi file for RK3328 SoCs").

Though this node is not actually used in any RK3328 DTSs. So I can't
test indirectly either.

Huang-Huang

> 
> Heiko
> 
> 
> 
>> ---
>>   drivers/pinctrl/pinctrl-rockchip.c | 51 ++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
>> index 78dcf4daccde..23531ea0d088 100644
>> --- a/drivers/pinctrl/pinctrl-rockchip.c
>> +++ b/drivers/pinctrl/pinctrl-rockchip.c
>> @@ -634,17 +634,68 @@ static struct rockchip_mux_recalced_data rk3308_mux_recalced_data[] = {
>>   
>>   static struct rockchip_mux_recalced_data rk3328_mux_recalced_data[] = {
>>   	{
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
>>
> 
> 
> 
> 

