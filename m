Return-Path: <linux-gpio+bounces-25756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E915BB497A0
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 19:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34FD31B22285
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 17:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEB03176FE;
	Mon,  8 Sep 2025 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="eVpN7Xxa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240323164A1;
	Mon,  8 Sep 2025 17:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757354029; cv=pass; b=kRMP2hP8YK4CPKtuWGPvnbKoMZKrNZiPB0I0xutMdmBoA9Gsj8t5wxIfbKdpEp6BVe3GgeSr5f9zVEpMsBkmwUQ/nXF64LRHLgICbRoQP5n95lG6NU0Cm/jnrQYmulxQil1L0nZmXbbVfp95CA0XC6YWiii3/90cPIrgWYQUit0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757354029; c=relaxed/simple;
	bh=OwdRsR4Z/3cQRq3276yVLRfEIjsQhJZfigcO//zTXpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqfSPWGqUpqnCc9QYYvOXeb1pXOsly/g8WLyGDHPRgbP2dkx4/Y6VkSaKmP2U/7BBFSemdZtbGjCaYFW4Wxy1XZdIdK/Q09a8rUNIFNDpwPifatbS722J7J4mLq2kGSw1tr3e5u+hTTc2D41RRzrAWHb105aUBSr9KPz9i18Eyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=eVpN7Xxa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757353964; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B4Mf6hX3bTYR3a7xiqiYtVcengOCYMtJ4uJlkCgsH8CHDfIpfPDn9QFXXw2JTXPIXbPjoVEoqmDlJ6+//kQSKYrl74uNirNimliuVIRmMSaqO/i326YtwRB2KLadoFMiMx/dZb9nrPGLCt0tlj96LCoXSGBmxLY/tHo2jPRkQ7o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757353964; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=naMSKwdItJDOVEut1clldy6rzfJ23gNVWfzo/NG/EPk=; 
	b=mKNy732zMOeES4VFouY2+RdFC7btgwlztF00TDru9mn+yIv54ZdfAz8e39jQq4oiLF3IRxkBk0qG800GVy3RMMg6HIi+SOu16q91R8tjFTDKRMMEYw8qpMBfCCXqnL97P/1Xj46QZu3zXFHh2SqXEGGh//Hs+ErONriwiN8purw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757353963;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=naMSKwdItJDOVEut1clldy6rzfJ23gNVWfzo/NG/EPk=;
	b=eVpN7XxaqwQUND+7FTzrATUGruIrEV/dnqxKdmazR6+iYVeul/IphtNTHtGsv/+L
	kSzW1wYYT7hhzaaRz6IIPqgwHQp/4hshW+ePcAIsT0Bbv+tXe5d9KCs4aIW4JcYdeo4
	yCZAuQEIoq/b/D9UUwXMI99G0aw05EuN8qyh0Jzo=
Received: by mx.zohomail.com with SMTPS id 1757353961706173.12105076966714;
	Mon, 8 Sep 2025 10:52:41 -0700 (PDT)
Message-ID: <d286ec0b-c8dc-4103-9aa3-2f40e0ade4a3@collabora.com>
Date: Mon, 8 Sep 2025 14:52:23 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/14] media: dt-bindings: Convert MediaTek mt8173-mdp
 bindings to YAML
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
 <20250820171302.324142-2-ariel.dalessandro@collabora.com>
 <20250821-silky-slug-of-novelty-e4bb64@kuoka>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250821-silky-slug-of-novelty-e4bb64@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Krzysztof,

On 8/21/25 3:46 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 20, 2025 at 02:12:49PM -0300, Ariel D'Alessandro wrote:
>> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data Path
>> to a YAML schema.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Thanks. Looks like my editor was misconfigured, sorry. Will fix in v2.

> 
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../bindings/media/mediatek,mt8173-mdp.yaml   | 174 ++++++++++++++++++
>>   .../bindings/media/mediatek-mdp.txt           |  95 ----------
>>   2 files changed, 174 insertions(+), 95 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>> new file mode 100644
>> index 0000000000000..f3a08afc305b1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>> @@ -0,0 +1,174 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek MT8173 Media Data Path
>> +
>> +maintainers:
>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> +
>> +description:
>> +  Media Data Path is used for scaling and color space conversion.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
> 
> Just enum, no items here

See below.

> 
> 
>> +          - enum:
>> +              - mediatek,mt8173-mdp-rdma
>> +              - mediatek,mt8173-mdp-rsz
>> +              - mediatek,mt8173-mdp-wdma
>> +              - mediatek,mt8173-mdp-wrot
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt8173-mdp-rdma
>> +              - mediatek,mt8173-mdp-rsz
>> +              - mediatek,mt8173-mdp-wdma
>> +              - mediatek,mt8173-mdp-wrot
>> +          - const: mediatek,mt8173-mdp
> 
> This makes no sense. How devices can be compatible and can not be
> compatible.

According to the driver source code (and the previous txt mt8173-mdp 
bindings), there must be a "controller node" with compatible 
`mediatek,mt8173-mdp`. Then its sibling nodes (including itself) should 
be one of the component node ids, listed in `struct of_device_id 
mtk_mdp_comp_dt_ids[]`.

Is there a proper/different way to describe this compatible binding in 
the yaml? Or you're saying the driver doesn't make sense here?

[0] drivers/media/platform/mediatek/mdp/mtk_mdp_core.c

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks: true
> 
> No, there's no such syntax. Look at other bindings.

Ack.

> 
> 
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    description: |
> 
> Drop |

Ack.

> 
>> +      This property should point to the respective IOMMU block with master port as argument,
>> +      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> 
> Drop entire description, completely redundant. I don't know why my patch
> fixing this was not applied, so you keep repeating same mistakes...

Ack.

> 
>> +    maxItems: 1
>> +
>> +  mediatek,vpu:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Describes point to vpu.
> 
> Useless description. We see that from the property name. Explain the
> purpose in the hardware.

Ack.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - power-domains
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: mediatek,mt8173-mdp-rdma
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Main clock
>> +            - description: Mutex clock
>> +    else:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Main clock
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - mediatek,mt8173-mdp-rdma
>> +              - mediatek,mt8173-mdp-wdma
>> +              - mediatek,mt8173-mdp-wrot
>> +    then:
>> +      required:
>> +        - iommus
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: mediatek,mt8173-mdp
> 
> This makes no sense either.

Same question above about compatibles.

> 
>> +    then:
>> +      required:
>> +        - mediatek,vpu
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/mt8173-clk.h>
>> +    #include <dt-bindings/memory/mt8173-larb-port.h>
>> +    #include <dt-bindings/power/mt8173-power.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        mdp_rdma0: rdma@14001000 {
> 
> One example is enough. Two could be fine if they differ significantly.

Sounds good. Will keep just a single example, including a node for the 
controller node and one for each of the components.

Thanks a lot for the feedback!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


