Return-Path: <linux-gpio+bounces-24483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A29B29CCD
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 10:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAE6618A2E53
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 08:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7211307AE7;
	Mon, 18 Aug 2025 08:50:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AD73009E1;
	Mon, 18 Aug 2025 08:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507056; cv=none; b=LuuX1SGbGjE48+y5jMELWV1lWfhXwKpTH7tGF+dQlJ7GV3ozPYIGtwbRLqP6dRP/O1MdwwO6inwiudeD4eViyZT2tK3st6ce+l44HBrPSomLwPFaLsBs/Z+n/f6H21XDR/sDhctUJ53TkOjrKLR+tLfcUs+dlwEDNx82gx54NYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507056; c=relaxed/simple;
	bh=52MqNBhfxIXlW4z+xIwz2mVXD3DBPmvokEdteP4bV/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ph5Uqa+GrDs0pBEYIfVFEnDknwvGWNOhqm7Yw+F10SpL+bMwx/O6Poz1YxQ1hKsW8/fdX141ivafsuvScoskq99g71pnkEmYTN7/0ApLxouNpsx0xevyxdKI5+rYyWcg7oZNJMnJv+bBU1SjrQVjzfJfPNhYVkgSyi3K9V04L0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55g45CxBz9sWv;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkJOApxeOfnh; Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55g43xC4z9sWt;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6ECF68B764;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id U_Z-I48WiQ0s; Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D1758B763;
	Mon, 18 Aug 2025 10:37:04 +0200 (CEST)
Message-ID: <a14e4ec5-74ff-4f0b-bc26-76c59ecb2357@csgroup.eu>
Date: Mon, 18 Aug 2025 10:37:04 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: Krzysztof Kozlowski <krzk@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
 <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 12/08/2025 à 17:23, Krzysztof Kozlowski a écrit :
> On 12/08/2025 13:02, Christophe Leroy wrote:
>> The QUICC Engine provides interrupts for a few I/O ports. This is
>> handled via a separate interrupt ID and managed via a triplet of
>> dedicated registers hosted by the SoC.
>>
>> Implement an interrupt driver for it for that those IRQs can then
>> be linked to the related GPIOs.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
>>   1 file changed, 63 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>> new file mode 100644
>> index 0000000000000..7c98706d03dd1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>> @@ -0,0 +1,63 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +
>> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
>> +
>> +maintainers:
>> +  - name: Christophe Leroy
>> +    email: christophe.leroy@csgroup.eu
> 
> Oh no...
> 
>> +
>> +description: |
>> +  Interrupt controller for the QUICC Engine I/O ports found on some
>> +  Freescale/NXP PowerQUICC and QorIQ SoCs.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - fsl,mpc8323-qe-ports-ic
>> +      - fsl,mpc8360-qe-ports-ic
>> +      - fsl,mpc8568-qe-ports-ic
>> +
>> +  reg:
>> +    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
>> +    minItems: 1
>> +    maxItems: 1
> 
> This was never tested but more important this and everything further
> looks like generated by AI. Please don't do that or at least mark it
> clearly, so I will prioritize accordingly (hint: AI generates poor code
> and burden to decipher AI slop should not be on open source reviewers
> but on users of AI, but as one of maintainers probably you already know
> that, so sorry for lecturing).

Yes sorry, overconfidence into AI. Until now I knew almost nothing about 
YAML and the generated file had a good look. I didn't know there was a 
special procedure to test bindings, I thought checkpatch was doing all 
necessary checks.

Fixed in v2.

