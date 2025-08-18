Return-Path: <linux-gpio+bounces-24510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00539B2AF48
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 19:21:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04C3A5651DE
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 17:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B9F2765D4;
	Mon, 18 Aug 2025 17:20:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B8726C398;
	Mon, 18 Aug 2025 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755537638; cv=none; b=YV2QAs1gC/iVVUbui/TVyLdpGgZiaqSOQmP92ZNYGoGrvRN9EdQIUWn+8ugx9diY+Tz7scWVs49gQpjYJAhW2KGYBxQdi39byy4CIuOHpJY9mpoUe106jxsqfexvZaE6qUugWDOHxrQabA9c2MVLDYJPLfJKeh9Mk16jYnFTqM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755537638; c=relaxed/simple;
	bh=antcrhCguodTcTOhvbLUOOfuYhTcaV/a1botVNHGusU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3r2vE8NJDqgAzdFbJAqUeeE5dRsFWuZPPSUY2qy/Lx8Hh+Sbfr6kfuny69mQNZGylt2q7KI/CF/jssdThQhDK8VhQ+c+8LLpAjiag31iq5oWsPAr35GvArrgaIRoY+a2qUDjni0ty04VYF1zMdXVIlGQiLj5za0T66/HY8NYss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c5K1X3wsYz9sSW;
	Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrZScAyopd0z; Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c5K1X2hLYz9sSV;
	Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 44EC58B764;
	Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aw5_3grXJjSH; Mon, 18 Aug 2025 19:08:48 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9EC3B8B763;
	Mon, 18 Aug 2025 19:08:47 +0200 (CEST)
Message-ID: <732b5fb6-ec38-43d9-b544-b27802a844ab@csgroup.eu>
Date: Mon, 18 Aug 2025 19:08:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Conor Dooley <conor@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
 <20250818-tyke-pungent-20d9ffd47ecc@spud>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250818-tyke-pungent-20d9ffd47ecc@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 18/08/2025 à 19:03, Conor Dooley a écrit :
> On Mon, Aug 18, 2025 at 10:45:57AM +0200, Christophe Leroy wrote:
>> In the QE, a few GPIOs are IRQ capable. Similarly to
>> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
>> GPIO"), add IRQ support to QE GPIO.
>>
>> Add property 'fsl,qe-gpio-irq-mask' similar to
>> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>>
>> Here is an exemple for port B of mpc8323 which has IRQs for
>> GPIOs PB7, PB9, PB25 and PB27.
>>
>> 	qe_pio_b: gpio-controller@1418 {
>> 		#gpio-cells = <2>;
>> 		compatible = "fsl,mpc8323-qe-pario-bank";
>> 		reg = <0x1418 0x18>;
>> 		interrupts = <4 5 6 7>;
>> 		fsl,qe-gpio-irq-mask = <0x01400050>;
>> 		interrupt-parent = <&qepic>;
>> 		gpio-controller;
>> 	};
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v2: Document fsl,qe-gpio-irq-mask
>> ---
>>   .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 ++++++++++++++++++
>>   drivers/soc/fsl/qe/gpio.c                     | 20 +++++++++++++++++++
>>   2 files changed, 39 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
>> index 09b1b05fa677..9cd6e5ac2a7b 100644
>> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
>> @@ -32,6 +32,15 @@ Required properties:
>>     "fsl,mpc8323-qe-pario-bank".
>>   - reg : offset to the register set and its length.
>>   - gpio-controller : node to identify gpio controllers.
>> +Optional properties:
>> +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item tells
>> +  which ports have an associated interrupt (ports are listed in the same order
>> +  QE ports registers)
>> +- interrupts : This property provides the list of interrupt for each GPIO having
>> +  one as described by the fsl,cpm1-gpio-irq-mask property. There should be as
>> +  many interrupts as number of ones in the mask property. The first interrupt in
>> +  the list corresponds to the most significant bit of the mask.
>> +- interrupt-parent : Parent for the above interrupt property.
>>   
>>   Example:
>>   	qe_pio_a: gpio-controller@1400 {
>> @@ -42,6 +51,16 @@ Example:
>>   		gpio-controller;
>>   	  };
>>   
>> +	qe_pio_b: gpio-controller@1418 {
>> +		#gpio-cells = <2>;
>> +		compatible = "fsl,mpc8323-qe-pario-bank";
>> +		reg = <0x1418 0x18>;
>> +		interrupts = <4 5 6 7>;
>> +		fsl,qe-gpio-irq-mask = <0x01400050>;
>> +		interrupt-parent = <&qepic>;
>> +		gpio-controller;
>> +	  };
>> +
>>   	qe_pio_e: gpio-controller@1460 {
>>   		#gpio-cells = <2>;
>>   		compatible = "fsl,mpc8360-qe-pario-bank",
> 
> Why is there a binding change hiding in here alongside a driver one?

I did the same way as commit 726bd223105c ("powerpc/8xx: Adding support 
of IRQ in MPC8xx GPIO")

Should it be done differently ?

Thanks
Christophe

