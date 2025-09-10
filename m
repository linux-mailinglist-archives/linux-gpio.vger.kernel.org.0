Return-Path: <linux-gpio+bounces-25914-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CA0B51C54
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 17:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D470B62D18
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 15:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F417632A812;
	Wed, 10 Sep 2025 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="HLkKXw8j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925E24A06B;
	Wed, 10 Sep 2025 15:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757519192; cv=pass; b=GlQbQ/PJlb/+9s6daqH082nj1hcnoRBecJPyoKso7t4t8W/6aVT/GfyQobAxrMcLtUohJnSxmUA8OT5g0snoLjHCVot0k32XJMXJzQQryQ4odT3r+CqsmfSgiQ33lgjjfY6/wRKzW3ukIH3KQjZ1/CZfv8y08jyTg4ghkxpOIms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757519192; c=relaxed/simple;
	bh=7qn7DIIrep9h++o37ZdZO5bIcBEhE5NWIRzhS56sk5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkjp1UegKUC4KJC5HQ02kv4QQwzSu+d5c3SCjVnRoT3PDLhYqXooZeO6dZMsJvquL1VnBoi0qUSDDAza7jQv39x6szUgtnyNcP69O0DueL7jrM2dtyDRsVKfLAHpGXvhaQ0FCf18sYwUnFGJqyF1nEVA10KmTNODlmdxQdp604A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=HLkKXw8j; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757519131; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L0DtszCRN5Y/m3JI1gxskLdlVgkiG9AHgQ1cUm66JTQs9bIzujOba5h9a+93kAc3Nc9BoXUIvkYdNguw0XTFQ1tCnFN5vYyWlKNaEirDhoKz5kd7+jvDa7jb7O8lqdqVAJmEd6awy2OOcL4/JTvR4rf54nq6bDsV2zASuEPfB6w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757519131; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JMzN9b3t7BMjqu1J5pi1n04VolEUQbl9H1P61fZolSo=; 
	b=Pb5kKl3POTswMjdStNOQmfYie4X5OhEiBgBUJMwa3oknUGsYJse83TFYp4E/wG2CbsdSbmk45arOOMNyYW4OwzoorFCib4tAS4otfTs/uerkzCLDsugxQKO1T2JNciWT3L6i/boNFe/FgyVcfWKlD3DfbJ1Wf4O0ikNWUEkOH9w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757519131;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JMzN9b3t7BMjqu1J5pi1n04VolEUQbl9H1P61fZolSo=;
	b=HLkKXw8jkxJmG84iLQYxQkVyHTUDdgNYWke2yhJi70hDiNQhL1kQI4MsQzKf77SN
	KyX99n3Hauig9vtMgyWJxwc1ahMWks4Ld4jZ9gbyBiP9QiAdazZaR2uJLGQ1G3B376X
	DZhIWZPtyviCLrJ+ncLHe9qWAt9Ewu0dRdrcdQAA=
Received: by mx.zohomail.com with SMTPS id 1757519128121467.87872040448076;
	Wed, 10 Sep 2025 08:45:28 -0700 (PDT)
Message-ID: <f6b9158b-4e73-4a5f-95b5-bacb6ea2e185@collabora.com>
Date: Wed, 10 Sep 2025 12:45:12 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/14] dt-bindings: display: mediatek,ufoe: Add
 mediatek,gce-client-reg property
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
 <20250820171302.324142-8-ariel.dalessandro@collabora.com>
 <20250821-wandering-vermilion-pigeon-b8c9f0@kuoka>
 <28049fe0-0ae7-4b40-9f95-1513e317547f@collabora.com>
 <a37db87d-c3b1-4ce4-bec0-4f496dc209b5@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <a37db87d-c3b1-4ce4-bec0-4f496dc209b5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Krzysztof,

On 9/10/25 11:21 AM, Krzysztof Kozlowski wrote:
> On 10/09/2025 16:04, Ariel D'Alessandro wrote:
>> Krzysztof,
>>
>> On 8/21/25 3:50 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 20, 2025 at 02:12:55PM -0300, Ariel D'Alessandro wrote:
>>>> Current, the DT bindings for Mediatek UFOe (Unified Frame Optimization
>>>> engine) is missing the mediatek,gce-client-reg property. Add it and
>>>
>>> Why is it missing? If the binding is complete, it cannot be missing...
>>
>> Due to the following error:
>>
>> $ make -j$(nproc) CHECK_DTBS=y mediatek/mt8173-elm.dtb
>>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>>     DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
>> [...]
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: ufoe@1401a000
>> (mediatek,mt8173-disp-ufoe): 'mediatek,gce-client-reg' does not match
>> any of the regexes: '^pinctrl-[0-9]+$'
>> 	from schema $id:
>> http://devicetree.org/schemas/display/mediatek/mediatek,ufoe.yaml#
> 
> So there are users of it? Then please explain that.

Ack. Will fix in v2. Thanks.

> 
>>
>>>
>>>> update the example as well.
>>>>
>>>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>>> ---
>>>>    .../bindings/display/mediatek/mediatek,ufoe.yaml      | 11 +++++++++++
>>>>    1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>>>> index 61a5e22effbf2..ecb4c0359fec3 100644
>>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
>>>> @@ -64,6 +64,14 @@ properties:
>>>>          - port@0
>>>>          - port@1
>>>>    
>>>> +  mediatek,gce-client-reg:
>>>> +    description: The register of client driver can be configured by gce with
>>>> +      4 arguments defined in this property, such as phandle of gce, subsys id,
>>>> +      register offset and size. Each GCE subsys id is mapping to a client
>>>
>>> Don't explain what DT syntax is. We all know, so that's completely
>>> redundant description. Explain the purpose. Explain Arguments with sechema - items.
>>
>> Although I agree with your suggestions, this is exactly how the rest of
>> the Mediatek DT bindings describe this node. This patch is based on the
>> other +20 files, which describe the node in the same way.
> 
> 
> Last time I tried to fix something for Mediatek display I got
> condescending and useless review from Collabora, so I won't be bothering
> with fixing these bindings to make your job easier. I don't care, you
> can thank someone inside. Therefore other poor bindings are not a valid
> excuse for this patch not being correct.

I see. Will rework this properly in v2.

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


