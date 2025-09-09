Return-Path: <linux-gpio+bounces-25798-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02062B4A80F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 11:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB763BE306
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C824E2737E3;
	Tue,  9 Sep 2025 09:20:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C021946AA;
	Tue,  9 Sep 2025 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409636; cv=none; b=BWHnKKuR7Ybe0GzBtoBOizAxYj5nCXl/MQ98guszyuBkrtel3KcypzkRoB45o1c+DJfluYHidLe/HnZlbrhoBwBGzIwhtL+d8W31QZAo2vn6V+SG5ekE5OSyx5NQ2W3QKSB7ucZw2OuRw6hslLpVhcfaVsuaCMiWPNJkxIOn5N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409636; c=relaxed/simple;
	bh=jof31GOepMVN3VwFj3dcUIkocpOgrK0Snh6jQKWjRnI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cov7fbBZsgvQVakc1aOmiC1p2sH/PA/MAnX6JUYEzfSuexRPOxAGDOYB6SkEqgcrlEK2TMKmacf0MBX3Vo5Ct9i4jv3EoDSqYJlSJCQs2jWFJ19fwGwE0BP+cZ2zn5K9dp6VPg4QOzVcrAeMBFCCjHjaZGSRLf1rgLBnDNqvmrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cLd2s6McVz9sRh;
	Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVtZoeAlc5y4; Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cLd2s55HRz9sRg;
	Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 83A658B766;
	Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vVFyT6NJGbhy; Tue,  9 Sep 2025 10:56:05 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D2D438B764;
	Tue,  9 Sep 2025 10:55:46 +0200 (CEST)
Message-ID: <ccb27487-9b3f-489f-bcea-dc5d7cca465e@csgroup.eu>
Date: Tue, 9 Sep 2025 10:55:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] dt-bindings: soc: fsl: qe: Convert QE GPIO to DT
 schema
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
 <48b4e7b25878b94dcb738f8239c815be484cf9c9.1756727747.git.christophe.leroy@csgroup.eu>
 <20250902212458.GA1184537-robh@kernel.org>
 <646c8a39-c78e-4c2c-b820-d7d57e0a85fc@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <646c8a39-c78e-4c2c-b820-d7d57e0a85fc@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Rob, Conor, Krzysztof,

Can one of you or someone else help me with below comment from Rob ?

Le 03/09/2025 à 06:58, Christophe Leroy a écrit :
> Hi Rob,
> 
> Le 02/09/2025 à 23:24, Rob Herring a écrit :
>> On Mon, Sep 01, 2025 at 02:05:13PM +0200, Christophe Leroy wrote:
>>> Convert QE QPIO devicetree binding to DT schema.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>> v5: New
>>> ---
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - fsl,chip-qe-pario-bank
>>> +      - const: fsl,mpc8323-qe-pario-bank
>>> +
> 
> snip
> 
>>
>>> +        compatible = "fsl,mpc8360-qe-pario-bank", "fsl,mpc8323-qe- 
>>> pario-bank";
>>
>> Doesn't match the schema.
>>
> 
> Can you be more explicit ? Is it the 'mpc8360' ? It is the 'chip'.
> 
> 
> bindings/soc/fsl/cpm_qe/qe/par_io.txt was saying:
> 
>    - compatible : should be "fsl,<chip>-qe-pario-bank", "fsl,mpc8323-qe- 
> pario-bank".
> 
> Which I first translated in yaml as :
> 
>    properties:
>      compatible:
>        items:
>          - enum:
>            - fsl,<chip>-qe-pario-bank
>          - const: fsl,mpc8323-qe-pario-bank
> 
> But 'make dt_binding_check' complained about the < > around 'chip' so I 
> removed them.
> 
> How should it be described ?
> 

Here is what we have in existing DTS upstream:

arch/powerpc/boot/dts/fsl/mpc8569mds.dts- 
compatible = "fsl,mpc8569-qe-pario-bank",
arch/powerpc/boot/dts/fsl/mpc8569mds.dts: 
             "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/fsl/mpc8569mds.dts- 
compatible = "fsl,mpc8569-qe-pario-bank",
arch/powerpc/boot/dts/fsl/mpc8569mds.dts: 
             "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/kmeter1.dts- 
compatible = "fsl,mpc8360-qe-pario-bank",
arch/powerpc/boot/dts/kmeter1.dts: 
     "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/mpc832x_rdb.dts: 
compatible = "fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/mpc836x_rdk.dts-                  compatible = 
"fsl,mpc8360-qe-pario-bank",
arch/powerpc/boot/dts/mpc836x_rdk.dts: 
"fsl,mpc8323-qe-pario-bank";
--
arch/powerpc/boot/dts/mpc836x_rdk.dts-                  compatible = 
"fsl,mpc8360-qe-pario-bank",
arch/powerpc/boot/dts/mpc836x_rdk.dts: 
"fsl,mpc8323-qe-pario-bank";

If the problem in the DT schema is the fsl,chip-qe-pario-bank, should I 
replace it with the two possible compatible we have in existing DTS, ie 
"fsl,mpc8569-qe-pario-bank" and "fsl,mpc8360-qe-pario-bank", or should I 
just ignore them are they are useless for the drivers, or else ?

Thanks
Christophe

