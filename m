Return-Path: <linux-gpio+bounces-30015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9EBCEBC2B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 11:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9052F300E7A5
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Dec 2025 10:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CEC31AF3B;
	Wed, 31 Dec 2025 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="VfB2YTq1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m155100.qiye.163.com (mail-m155100.qiye.163.com [101.71.155.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919CE2DECCC;
	Wed, 31 Dec 2025 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176292; cv=none; b=SUPn4yTiFqZJIc+ZwgCXXRJu37nGNvtqauI7pIjT8eVg1EB1hrLFL/93NLMGIiMcaST/aZP183oPw5NhG4TmZBp5LaoSIr2fTQT9hKapAysEtPCdMqP+mYWwYvi00BIeN+HYiQDTJcYUJqwbRR1//QDAApIeEykFC9f2XVr1jZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176292; c=relaxed/simple;
	bh=eeHdbBZjwEAs3eeUK7TgGOKWinCxLCEDBT8dMIb7XoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7qS2DnmMU83daD8IhUaQvZRizdxu7WniVLY7yX+ZH0EehCeOW8kpqeuTohHDnchc+4GwAkVX1fA/S53RHiRkRB3hBuSEnZDnV72nme1EUfjRk//PzOERx6yJPqnrcoPnfpdc21wXbMrRetMjdncYk4+rl8WgfWSF2VpYpFS8bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=VfB2YTq1; arc=none smtp.client-ip=101.71.155.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.16] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2f2651ced;
	Wed, 31 Dec 2025 18:12:44 +0800 (GMT+08:00)
Message-ID: <7370b9a4-692d-43f8-9a48-82da0b4de939@rock-chips.com>
Date: Wed, 31 Dec 2025 18:12:44 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] dt-bindings: pinctrl: rockchip: Add rk3506 rmio
 support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-6-ye.zhang@rock-chips.com>
 <20251228-olive-termite-of-painting-1bee5b@quoll>
From: Ye Zhang <ye.zhang@rock-chips.com>
In-Reply-To: <20251228-olive-termite-of-painting-1bee5b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b73e547e909d8kunm087a468e2a54c65
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhJTVZLH0tMH05NTE1OTU9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0
	pVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=VfB2YTq1dDLW4lPQb/wYiy8TiQJLBnx5w//V6mZeX82fybxRalbCFF764gDqYPMyY8TwubCdWJxDd0nDgN9nPJkdhk16V7IiHCYc2A0Bwh+vQZJ6Ra0U8vSuvApQSnLgkUmzXmfhUd46JG7C0+gqVzBw8EG2mRIIuHLqkuDY5zo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=38C12CA+yJXwWbEH8TepZMkmX51aW9ULukFZHKnMqZQ=;
	h=date:mime-version:subject:message-id:from;


在 2025/12/28 18:37, Krzysztof Kozlowski 写道:
> On Sat, Dec 27, 2025 at 07:49:55PM +0800, Ye Zhang wrote:
>> The RK3506 SoC introduces a secondary block-level pinmux controller called
>> RMIO (Rockchip Matrix I/O). When the primary IOMUX is selected to a
>> specific function, the pin signal is routed to the RMIO block, where a
>> secondary selection determines the final function.
>>
>> This patch adds the necessary properties to support RMIO:
>> - rockchip,rmio: phandle to the RMIO syscon node.
>> - rockchip,rmio-pins: a matrix to configure the RMIO block.
>>
>> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
>> ---
>>   .../bindings/pinctrl/rockchip,pinctrl.yaml    | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
>> index 97960245676d..887bec22b172 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
>> @@ -66,6 +66,13 @@ properties:
>>         Required for at least rk3188 and rk3288. On the rk3368 this should
>>         point to the PMUGRF syscon.
>>   
>> +  rockchip,rmio:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      The phandle of the syscon node for the RMIO registers, used by
>> +      some SoCs (e.g. rk3506) to configure the secondary block-level
>> +      pinmux functions.
>> +
> You need to disallow it for other variants in if:then: block.
Will be completed in v5.
>>     "#address-cells":
>>       enum: [1, 2]
>>   
>> @@ -144,6 +151,23 @@ additionalProperties:
>>                   The phandle of a node contains the generic pinconfig options
>>                   to use as described in pinctrl-bindings.txt.
>>   
>> +      rockchip,rmio-pins:
>> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +        minItems: 1
>> +        items:
>> +          items:
>> +            - minimum: 0
> That's redundant. 0 is already minimum.
I will remove it in v5
>> +              description: RMIO ID (Controller index)
> Why do you need this? Is this pin controller having multiple RMIO IDs?
> Nothing like that was expressed in previous DTS. No other IDs are
> present in this DTS, either...

The RMIO hardware IP itself is designed to support multiple instances. 
Although the RK3506 only integrates one instance, other chips (like the 
RK2116) already utilize multiple RMIO blocks.

We want to define the binding based on the capabilities of the IP block 
rather than the specific configuration of the RK3506. This ensures the 
binding format (3 cells) remains stable when support for multi-RMIO SoCs 
is added to Linux in the future, avoiding the need to handle different 
cell formats in the driver.

We prefer to keep the ID column (fixed to 0 for RK3506) for this forward 
compatibility.

Is this acceptable?

>> +            - minimum: 0
>> +              description: Pin index within the RMIO controller
>> +            - minimum: 0
>> +              description: Function Mux ID
>> +        description:
>> +          Configuration for the Rockchip Matrix I/O (RMIO) block. The format
>> +          is <rmio_id pin_id function_id>. This acts as a secondary muxing
>> +          layer when the primary 'rockchip,pins' mux is set to the RMIO
>> +          function.
>> +
>>   examples:
>>     - |
>>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>> -- 
>> 2.34.1
>>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>

