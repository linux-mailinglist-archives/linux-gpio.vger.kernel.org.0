Return-Path: <linux-gpio+bounces-20596-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E1AC519F
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 17:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF56D16C3B4
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 15:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6342798EA;
	Tue, 27 May 2025 15:07:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBEF2750E7;
	Tue, 27 May 2025 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358477; cv=none; b=tL/7+qpr2rYsaFtW+Zwmx2wkowDGN0vYQr/MqzprVqxYEG/URTgkfAZEWh2yyn8N36OmOxUANeJaNrwhbhKTXwU6xSceqyjpLiwkXi5Top6jM6tSmRMJtOvh+SBkNCi+pKmODc2z56YSs6fwkZRm02S0vgZ57g2WYi58oN85+z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358477; c=relaxed/simple;
	bh=vqd5489V0avFdRMIy9tvgVQe9WcgN2RWYY5hv0QOid0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKHt1UCw8hDkHRhYRitG5Hvgqwig/jsKeKGPxI6/g9U0mDzJ7yQhFl7sJQ0cF9NzEVH3WhNM4wksH3TKs66h36uVKtYHPactnZngiUgJ0U3z1EhK4pclBXbsKMwpxgJwrp/bc5cMpEtVRAEd5F/got1vNGtk6zi0TkWRwbaGFMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn; spf=pass smtp.mailfrom=whut.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=whut.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=whut.edu.cn
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [113.57.237.88])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1696b4356;
	Tue, 27 May 2025 23:07:40 +0800 (GMT+08:00)
Message-ID: <0b16c5df-94e2-43b0-876f-a5070ac71ba0@whut.edu.cn>
Date: Tue, 27 May 2025 23:07:40 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] dt-bindings: pinctrl: k230: fix child node name patterns
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 sophgo@lists.linux.dev
References: <20250527-k230-binding-fix-v1-1-3c18ae5221ab@whut.edu.cn>
 <20250527-activism-container-4a9da77a8da1@spud>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20250527-activism-container-4a9da77a8da1@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUhXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSkgfVh5CQhodTx1CTB9IT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkhVTkxVSUhMVUNDWVdZFhoPEhUdFFlBWU9CTFVISUxNQlVPVUhLS0pZBg
	++
X-HM-Tid: 0a971248f54b03a1kunm41ef4b31c6cea
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6N0k6Kio*KjEyUVZRFBYMTS0d
	NioaCwxVSlVKTE9DSE5DT01OSElMVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlK
	SkhVTkxVSUhMVUNDWVdZCAFZQUhOTUo3Bg++

On 5/27/25 10:36 PM, Conor Dooley wrote:
> On Tue, May 27, 2025 at 12:23:35AM +0800, Ze Huang wrote:
>> Rename child node name patterns to align with conventions.
>>
>>      uart0-pins      =>   uart0-cfg
>>          uart0-cfg            uart0-pins
>>
>> This avoids potential confusion and improves consistency with existing
>> bindings like sophgo,sg2042-pinctrl and starfive,jh7110-aon-pinctrl.
>>
>> Fixes: 561f3e9d21a1 ("dt-bindings: pinctrl: Add support for canaan,k230 SoC")
> You're changing something merged in October of last year, which is an
> ABI break, for what seems like a cosmetic change to me. What makes this
> worth it? Consistency with some devices by other vendors isn't a strong
> argument I don't think.

Thanks for the feedback.

You're right - this change would introduce an ABI break just for naming
consistency, there’s no strong functional benefit.

>> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
>> ---
>>   .../devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml          | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
>> index 0b462eb6dfe169a292bf716503c03d029f1ac7ee..f4e0da0bf7fa30af5132644109dbd371ddfc0228 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
>> @@ -22,7 +22,7 @@ properties:
>>       maxItems: 1
>>   
>>   patternProperties:
>> -  '-pins$':
>> +  '-cfg$':
>>       type: object
>>       additionalProperties: false
>>       description:
>> @@ -30,7 +30,7 @@ patternProperties:
>>         pinctrl groups available on the machine.
>>   
>>       patternProperties:
>> -      '-cfg$':
>> +      '-pins$':
>>           type: object
>>           allOf:
>>             - $ref: /schemas/pinctrl/pincfg-node.yaml
>> @@ -112,8 +112,8 @@ examples:
>>           compatible = "canaan,k230-pinctrl";
>>           reg = <0x91105000 0x100>;
>>   
>> -        uart2-pins {
>> -            uart2-pins-cfg {
>> +        uart2-cfg {
>> +            uart2-pins {
>>                   pinmux = <0x503>, /* uart2 txd */
>>                            <0x603>; /* uart2 rxd */
>>                   slew-rate = <0>;
>>
>> ---
>> base-commit: 0a4b866d08c6adaea2f4592d31edac6deeb4dcbd
>> change-id: 20250526-k230-binding-fix-3125ff43f930
>>
>> Best regards,
>> -- 
>> Ze Huang <huangze@whut.edu.cn>
>>


