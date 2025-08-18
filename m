Return-Path: <linux-gpio+bounces-24482-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3CDB29CBA
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 10:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 418FC177874
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 08:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEF8304BA3;
	Mon, 18 Aug 2025 08:50:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3B0304962;
	Mon, 18 Aug 2025 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755507042; cv=none; b=PGoRkcGbV0gUTFJ5DZavqAiZGFJD4J6RSw5BRpJ8WCKg2fp4hoWkOHI4qZfjn8k1MQfwNuTCkEyLoesIUaGdXEbVBeZfEGpABDtXFicWl0kcCBp4FPgsKiMJTV5DBf/v+J3Zq+QADeCm7qS21dXcwvVVot1+DUEI89Px2e5Tyr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755507042; c=relaxed/simple;
	bh=i4pkSh+CLs8Uue0AHp7O0b9DSesGmkbEmw+FmH4nsh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3V1Xfn0D4WYuMD1VRqD+09qTI1Q831VSVM9m1efuNkT05p7LsON9kzur4LzYyz9f6Q5kt1SEWgv8K+n2aqYLnB6BrnnPqAg0d1CSQlRydUGZZVBWiEauCu1G6NLRVdCWNRuXcprGso5O07NWQ1KuBLJwGW8Wkyo6cJFN7KaATU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55kL3mnlz9sWd;
	Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0_Y38SyLNAT; Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55kL2Zsnz9sWc;
	Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AE7D8B764;
	Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 0VXbaU8cA_eG; Mon, 18 Aug 2025 10:39:54 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E12538B763;
	Mon, 18 Aug 2025 10:39:53 +0200 (CEST)
Message-ID: <88b259e8-433f-49f1-a25b-f65a40c8da65@csgroup.eu>
Date: Mon, 18 Aug 2025 10:39:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
 <0fd6fefc-9fad-4ea6-a619-e9f480747ac0@kernel.org>
 <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CAL_Jsq+1Aw5AyBeW+BhTuyWZ8BN8BJUq047oJCDKVQPZWxWYCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 12/08/2025 à 19:16, Rob Herring a écrit :
> On Tue, Aug 12, 2025 at 10:23 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 12/08/2025 13:02, Christophe Leroy wrote:
>>> The QUICC Engine provides interrupts for a few I/O ports. This is
>>> handled via a separate interrupt ID and managed via a triplet of
>>> dedicated registers hosted by the SoC.
>>>
>>> Implement an interrupt driver for it for that those IRQs can then
>>> be linked to the related GPIOs.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
>>>   1 file changed, 63 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>> new file mode 100644
>>> index 0000000000000..7c98706d03dd1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
>>> @@ -0,0 +1,63 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +
>>> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
>>> +
>>> +maintainers:
>>> +  - name: Christophe Leroy
>>> +    email: christophe.leroy@csgroup.eu
>>
>> Oh no...
>>
>>> +
>>> +description: |
>>> +  Interrupt controller for the QUICC Engine I/O ports found on some
>>> +  Freescale/NXP PowerQUICC and QorIQ SoCs.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - fsl,mpc8323-qe-ports-ic
>>> +      - fsl,mpc8360-qe-ports-ic
>>> +      - fsl,mpc8568-qe-ports-ic
>>> +
>>> +  reg:
>>> +    description: Base address and size of the QE I/O Ports Interrupt Controller registers.
>>> +    minItems: 1
>>> +    maxItems: 1
>>
>> This was never tested but more important this and everything further
>> looks like generated by AI. Please don't do that or at least mark it
>> clearly, so I will prioritize accordingly (hint: AI generates poor code
>> and burden to decipher AI slop should not be on open source reviewers
>> but on users of AI, but as one of maintainers probably you already know
>> that, so sorry for lecturing).
> 
> If anyone needs some AI (chatgpt) converted bindings, my "dt-convert"
> branch has ~800 of them. Feeding the warnings back to AI to fix was
> somewhat effective. The result is not the worst I've seen submitted.
> It saves some of the boilerplate, but can't fix things that are just
> wrong or unclear in .txt bindings. Despite my 'prompt engineering'
> attempts, it still tends to get the same things wrong over and over.

By the way, the new binding was not generated from text binding. I fed 
the AI with the driver C source file.

Christophe

