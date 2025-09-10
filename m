Return-Path: <linux-gpio+bounces-25910-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB9B51ACF
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 17:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B777C16B627
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 15:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5793C23F413;
	Wed, 10 Sep 2025 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="KQCrzMj7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A3819F111;
	Wed, 10 Sep 2025 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516100; cv=pass; b=M03aX0t+gbDW1bDScqAmlr+cu0HL7OyC7rO2pzt1y8xVD8X670zlGWTxywQ85mVzkbf2YpOGfbnMVd69D2vSgZLpeTyR8Z9gu3X8UekfCm8pk52+S+9sCjIeR5oJU42s4O9MSis/+vifZ+sBOn0Zjgmo8x1JFlICVwzM7KMNO+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516100; c=relaxed/simple;
	bh=b/OUs0/4Iwh0jTReAkuIvxGUsbn/C0Y7jBJ4MpQIXu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jlew4KjRszcTIabA/HB/SJkuQLzd25q/q5rWOtPu5NMglEtQm6HyhT4aE5cxrU0tNqfb/by4MzV09qOK2TrpZfPNLFhwuW4J8uFKoGJiZuksUsKnTUFYVZMNte0cqgJV6S5uGsizXur1CVQoFX4+I6nrcDeNK1CoFZ1SufpRSJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=KQCrzMj7; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757516039; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cySHIIHGOlRlLmI8Clj9g4NASUZop+O9QrS+8MOF2YLNmTcuhHKZlqj6Jv8rUd2DuPbZb/YnffF5+QJ4f9ciYW/817EXyvVP3nbo8tGdFmPCnz1Yjgh2NH3vVd+C0iWhqk2KQERVyMmeaBEadFVJiMupazVtaK2g0m5BXD5P4aU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757516039; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zpHcWl3XpbxmTQtYZyhIFwBgYhnEXqkN76+ct9zQsic=; 
	b=DWzQmQB9i923kc1wLtRSs0mJXECc9DTGPGje4vPcj3T90fTHT6l1WSITKn3EfaNeRiJE2o1zU8RI3+wVBOfGlRKlDouWdwnJnoxUD+1qyVOGSXiQQN62ul4GqExzm3w5WTCukE/ToKRcxU4WAEXfDz4t0HR6y1wxyOUtZ6Jdr0M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757516039;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zpHcWl3XpbxmTQtYZyhIFwBgYhnEXqkN76+ct9zQsic=;
	b=KQCrzMj7lQrIfPdvvl5BB41ka4CcnVgyULhxZ7WNqKbdb0jn99L8NCW8TUJ27Z8l
	RY98XcwJdO3A1TuA/2LA8lxWZbFr+ptDydjCvY1bLkyc8nGHq30FVZOf2ZM2ws7Gl85
	5UGX5u6XAwxqoc/MvOcVFWQmB7AkhYJkjlWawpgE=
Received: by mx.zohomail.com with SMTPS id 1757516037104680.5102248497525;
	Wed, 10 Sep 2025 07:53:57 -0700 (PDT)
Message-ID: <be01559a-ab26-4631-8b99-07c8cb82e555@collabora.com>
Date: Wed, 10 Sep 2025 11:53:43 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/14] regulator: dt-bindings: Convert Dialog
 Semiconductor DA9211 Regulators to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com,
 edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com,
 jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com,
 krzk+dt@kernel.org, kuba@kernel.org,
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com,
 linus.walleij@linaro.org, louisalexis.eyraud@collabora.com,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org,
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-11-ariel.dalessandro@collabora.com>
 <20250821-practical-coyote-of-hail-d2fddb@kuoka>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250821-practical-coyote-of-hail-d2fddb@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Krzysztof,

On 8/21/25 3:53 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 20, 2025 at 02:12:58PM -0300, Ariel D'Alessandro wrote:
>> Convert the existing text-based DT bindings for Dialog Semiconductor DA9211
>> Voltage Regulators family to a YAML schema. Examples are simplified, as
>> these are all equal.
> 
> Also not wrapped... fix your editor to recognize how commits are
> written.

Ack.

> 
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
> 
> ...
> 
>> +---
>> +$id: http://devicetree.org/schemas/regulator/dlg,da9211.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: |
> 
> Drop |

Ack.

> 
>> +  Dialog Semiconductor DA9211/DA9212/DA9213/DA9223/DA9214/DA9224/DA9215/DA9225
>> +  Voltage Regulator
>> +
>> +maintainers:
>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - "dlg,da9211"
>> +      - "dlg,da9212"
>> +      - "dlg,da9213"
>> +      - "dlg,da9223"
>> +      - "dlg,da9214"
>> +      - "dlg,da9224"
>> +      - "dlg,da9215"
>> +      - "dlg,da9225"
> 
> No quotes. I don't think this was ever tested.

Ack.

> 
> Also, keep it properly ordered

Good catch, thanks.

> 
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  regulators:
>> +    type: object
>> +    additionalProperties: false
>> +    description: |
> 
> Drop |

Ack.

> 
>> +      List of regulators provided by the device
>> +
>> +    patternProperties:
>> +      "^BUCK([A-B])$":
> 
> [AB]

Ack.

> 
>> +        type: object
>> +        $ref: regulator.yaml#
>> +        description: |
>> +          Properties for a single BUCK regulator
>> +
>> +        properties:
>> +          regulator-initial-mode:
>> +            items:
>> +              enum: [ 1, 2, 3 ]
>> +            description: Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
>> +
>> +          regulator-allowed-modes:
>> +            items:
>> +              enum: [ 1, 2, 3 ]
>> +            description: Defined in include/dt-bindings/regulator/dlg,da9211-regulator.h
>> +
>> +          enable-gpios:
>> +            maxItems: 1
>> +            description: Specify a valid GPIO for platform control of the regulator
> 
> Drop description, obvious.

Ack.

> 
>> +
>> +        unevaluatedProperties: false
> 
> For nested blocks this goes after $ref: regulator.

Ack.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - regulators
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/regulator/dlg,da9211-regulator.h>
>> +
>> +    i2c1 {
> 
> i2c

Ack.

> 
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        da9212: da9212@68 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Ack, thanks a lot for your help.

Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


