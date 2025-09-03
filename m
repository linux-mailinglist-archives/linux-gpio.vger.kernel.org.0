Return-Path: <linux-gpio+bounces-25425-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6522B4144B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 07:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66BC07AC76B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 05:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4431D2D3A94;
	Wed,  3 Sep 2025 05:20:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222471C6FF6;
	Wed,  3 Sep 2025 05:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756876837; cv=none; b=JzoQLNgHda4ol0HVsQkqPwlI0rhkytV9iryRv93iok6pIFUdYM2goahGQB8jHL8fTLW0Y8WC7bW20HGnkoC8IRneMZN1Culi7v55ny77D+oSSJi4SDulOAYBo6DpKVeVP1jNtoB3miimkyZ/ZNrfIsLxboaj9MugWjiOw8OzU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756876837; c=relaxed/simple;
	bh=cQsd9f3pz0GvlDgstoKvbSwGB9vpxc0Tul+ZBHwCask=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GO2wum26iRFH0leQYhEmG224Q2jYxPDDDyGLizVh9YKHq3gm7alX07vv6MJvaYWsv9JzMhyY9X2Z5SJUvM3FNBT8mI7s2xybCCW2Nr4aCmOHKBD9VEeQLU8v3YYwC+nVLMeR/3zOnQRS+Z1HyVHpejzYzKxcV+iuf3bHFLx2fMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cGr3X4MGDz9sSC;
	Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqXfjTzkKbXw; Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cGr3X3cvPz9sRs;
	Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 665ED8B764;
	Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HhVS512OWuWk; Wed,  3 Sep 2025 06:58:32 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D82298B763;
	Wed,  3 Sep 2025 06:58:31 +0200 (CEST)
Message-ID: <646c8a39-c78e-4c2c-b820-d7d57e0a85fc@csgroup.eu>
Date: Wed, 3 Sep 2025 06:58:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
To: Rob Herring <robh@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
 <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
 <20250902212458.GA1184537-robh@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250902212458.GA1184537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rob,

Le 02/09/2025 à 23:24, Rob Herring a écrit :
> On Mon, Sep 01, 2025 at 02:05:13PM +0200, Christophe Leroy wrote:
>> Convert QE QPIO devicetree binding to DT schema.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v5: New
>> ---
> 
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - fsl,chip-qe-pario-bank
>> +      - const: fsl,mpc8323-qe-pario-bank
>> +

snip

> 
>> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe-pario-bank";
> 
> Doesn't match the schema.
> 

Can you be more explicit ? Is it the 'mpc8360' ? It is the 'chip'.


bindings/soc/fsl/cpm_qe/qe/par_io.txt was saying:

   - compatible : should be "fsl,<chip>-qe-pario-bank", 
"fsl,mpc8323-qe-pario-bank".

Which I first translated in yaml as :

   properties:
     compatible:
       items:
         - enum:
           - fsl,<chip>-qe-pario-bank
         - const: fsl,mpc8323-qe-pario-bank

But 'make dt_binding_check' complained about the < > around 'chip' so I 
removed them.

How should it be described ?

Thanks
Christophe

