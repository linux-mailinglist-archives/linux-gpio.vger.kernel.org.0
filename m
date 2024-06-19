Return-Path: <linux-gpio+bounces-7565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D58FB90F3EF
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 18:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DFD2287160
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Jun 2024 16:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03EBD156243;
	Wed, 19 Jun 2024 16:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="r5BoTtpl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C53155A5F;
	Wed, 19 Jun 2024 16:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718813977; cv=none; b=XZtJ6uyXo0XsAnf/ryxbTyfNB0dMtOhkcNXQPOy/TFEh7rAuKJe31td8Ri3T/TKGImeNcTx1g2pnA5oqtemBeUBDAnJ9VUeN3cIffIMBJoB0wEztp7dwmEfHWqi5Kf+n51wx1f4n2j6BW0kW/vQPzfPNb9IVEZCCOBYP3BIvRBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718813977; c=relaxed/simple;
	bh=3KvxBET2y5jKjuO29Ijw2Ch0iSqQIKcl603N9UJfkeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=db4an2pnodf1H5B6ujj8gD1cFviAVEMOzWADEZxtho5UKZjcG7bCenTmjrAVwgGs9snrYyb8S8AEdK5W7iO2IGa6N2otdJs2xo7JzshGJ4RqFiZ/4b7KPifSBLZDk84mLeQT3dZHazBHeLe9dhQI22tJPcSr2tXvuXHJvVw1H4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=r5BoTtpl; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45JGJEr8039856;
	Wed, 19 Jun 2024 11:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718813954;
	bh=w9Hz1Zj6qVVo83JgmbjuRtdlhc6TYk982qtNVzNil4Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=r5BoTtplK2yVwF0yHj3i52Dz5n2BtYVppFRDtLCw9Iw9N8hVDr59Njc4c+NtGs3zt
	 AAXioJqOXVF8ELDKoqMPSNlBGN9/hmH5hlSv+l/DYHAvgD/D8j4DCImPJBB5RTltpM
	 RfPDanCaCOwwdvjbzsa2uPskN7182M8K8JRWxz/A=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45JGJENL007917
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Jun 2024 11:19:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Jun 2024 11:19:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Jun 2024 11:19:14 -0500
Received: from [128.247.81.8] (ula0226330.dhcp.ti.com [128.247.81.8] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45JGJDBd057924;
	Wed, 19 Jun 2024 11:19:13 -0500
Message-ID: <c1b7a47e-cb05-4701-9766-d1fc13612f34@ti.com>
Date: Wed, 19 Jun 2024 11:19:09 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: pinctrl-single: Define a max count
 for "pinctrl-single,gpio-range"
To: Nishanth Menon <nm@ti.com>, "Rob Herring (Arm)" <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
References: <20240618165102.2380159-1-nm@ti.com>
 <171873566448.3500109.16734660300499772836.robh@kernel.org>
 <20240618185705.5fwevm7drphgvwl2@dilation>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240618185705.5fwevm7drphgvwl2@dilation>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 6/18/24 1:57 PM, Nishanth Menon wrote:
> On 12:34-20240618, Rob Herring wrote:
>>
>> On Tue, 18 Jun 2024 11:51:02 -0500, Nishanth Menon wrote:
>>> "pinctrl-single,gpio-range" allows us to define a dis-contiguous
>>> range of pinctrl registers that can have different mux settings for
>>> GPIO mode of operation. However, the maxItems seem to be set to 1 in
>>> processed schema for some reason. This is incorrect. For example:
>>> arch/arm64/boot/dts/hisilicon/hi6220.dtsi and others have more than
>>> one dis-contiguous range.
>>>
>>> Arbitrarily define a max 100 count to override the defaults.
>>>
>>> Signed-off-by: Nishanth Menon <nm@ti.com>
>>> ---
>>> I am not sure if I should call this RFC or not.. and if this is even the
>>> right solution.. I am on 2024.05 dt-schema for this check.
>>>
>>> I noticed this when adding gpio-ranges for am62p platform:
>>> https://gist.github.com/nmenon/7019cd2f24be47997640df5db60a7544
>>>
>>> It is possible that this is a bug in dt-schema, but I have'nt been able
>>> to track it down either.
>>>
>>> behavior seen is the following:
>>> pinctrl-single,gpio-range = <&mcu_pmx_range 0 21 7>;
>>> generates no warning
>>> However,
>>> pinctrl-single,gpio-range = <&mcu_pmx_range 0 21 7>, <&mcu_pmx_range 32 2 7>;
>>>
>>> generates "is too long" warning.
>>>
>>>
>>>   Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml: properties:pinctrl-single,gpio-range: {'description': 'Optional list of pin base, nr pins & gpio function', '$ref': '/schemas/types.yaml#/definitions/phandle-array', 'maxItems': 100, 'items': [{'items': [{'description': 'phandle of a gpio-range node'}, {'description': 'pin base'}, {'description': 'number of pins'}, {'description': 'gpio function'}]}]} should not be valid under {'required': ['maxItems']}
>> 	hint: "maxItems" is not needed with an "items" list
>> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> 
> yes, I had expected the same, but processed schema indicates a maxItems
> of 1 for reasons I am unable to make sense of.. will be great to have
> some additional eyes:
> 

As the warning says, setting the item count is not needed when the
item list content (and therefore item count) is explicitly defined.
The binding is saying there is a single item of 4 elements.

"pinctrl-single,gpio-range"'s type is a single phandle-array[0]. What
you want is an array of phandle-arrays. The length of each is usually
set by the target of the phandle with its #*-cells property.

This binding is a bit of a mess, the phandle is always a pointer to
a node with the cells length hard-coded to 3. This looks to have been done
to allow the driver to use the function "of_parse_phandle_with_args" which
needs a property name for to find the cell count. But that makes no sense
as the count is always 3, the driver cannot accept any other value. The
driver should have just looped of_get_property() 3 times but wanted to
use the helper. So a silly driver mistake has turned into a binding issue.

We should drop the "pinctrl-single,gpio-range" from the binding and
fix the driver.

Andrew

[0] https://patchwork.kernel.org/project/netdevbpf/patch/20220119015038.2433585-1-robh@kernel.org/

> https://gist.github.com/nmenon/7019cd2f24be47997640df5db60a7544#file-processed-schema-pinctrl
> 
> next-20240617 baseline

