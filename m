Return-Path: <linux-gpio+bounces-11279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BE999C341
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 10:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE153B21457
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 08:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAB915C130;
	Mon, 14 Oct 2024 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oGlpjvaL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E5155C98;
	Mon, 14 Oct 2024 08:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894466; cv=none; b=C+caC7swSvxfAm/r0wIjUxZAUkg05DbfO81xkotOXPUKP4s7XKeZMU5FHSJK5zbvaL2PkjSTsq32RYmOxsAvJN7o8r61LhWBVvHentJOKnUS7zvTv0aHyu1RThslnzqqFGmR3kiZAXjtkuGgm1mwHYkmakf1AVhPZLB26GANYRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894466; c=relaxed/simple;
	bh=+/txDlTZRlfL1E6ViTuAgBK8brlnyiBPLDdgnvnwqDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JLig9+7I2EHC+aHl89OxiwgxXIJjcB4Pf96Hej0yI2vObmsfZLVPa53umWroT3GI1e1kEq+aw99rUguWWddYWRLWrsKjx2MfGOfVclQS7kLfx6GarYV3aqex9P3j30SYFSkaoRW+6NjEIau4kaJLT14FFQVl92N49Feg885UzOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oGlpjvaL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728894462;
	bh=+/txDlTZRlfL1E6ViTuAgBK8brlnyiBPLDdgnvnwqDk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oGlpjvaLOFy32Lo1P06OUFkRk6EJg1ZJSCKb/94dsaYCVZp0GaPX26RqAVb1e4NuS
	 hcHdudD971rEQOiAcw1BTU1ZrFeheKg4FnpUs1RG6ZTckrOACEyYjwjfCrehR/jMOo
	 yziINUYCyAbaBSycRSsOJ3Rk3h0IG47uvKS9Cxc3yUTIO5foqiiZMPE9XSQKHEZDMr
	 0IJN8nZovv+gFGaZPAMagSQXqhgYvdulWHsmLRtUsJbBfIXTpDlganLyYe4t2HsoTa
	 1QOsST92XnKF2QdV9BhkpiQJ36dvRhZBMX+p8pI2POY+zJPWEguR7uyLFrK5FKT3M7
	 MmGP0ZzMWIM/Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35A3D17E10A0;
	Mon, 14 Oct 2024 10:27:42 +0200 (CEST)
Message-ID: <2608306c-da19-4160-b0c7-dbb8935abc42@collabora.com>
Date: Mon, 14 Oct 2024 10:27:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: Rob Herring <robh@kernel.org>, Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-2-y.oudjana@protonmail.com>
 <20241011165640.GA2475122-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011165640.GA2475122-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/10/24 18:56, Rob Herring ha scritto:
> On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>
>> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
>> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml which
>> has a description of the pinmux property, as well as some additional
>> descriptions for some pin configuration properties. Pull those changes
>> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
>> preparation to combine the MT6795 document into it.
>>
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>> ---
>>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38 ++++++++++++++-----
>>   1 file changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> index 3bbc00df5548d..352a88d7b135e 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>> @@ -111,12 +111,12 @@ allOf:
>>           - "#interrupt-cells"
>>   
>>   patternProperties:
>> -  '-[0-9]*$':
>> +  '-pins$':
> 
> Worst case, this could be an ABI break. Best case, it's churn for
> mt6779. Is it worth unifying?
> 
All those MediaTek pinctrl bindings are mostly the same, where only the pin
definitions in the binding header does actually change.

I think that it's worth unifying them, not only to get rid of the duplication
but mostly for consistency between all of those subnode names which are wildly
differing for no real reason... and consistency is a long time issue with
MediaTek bindings/dts in general (which is way way way better now, but still)...

Besides - just for context and nothing else: the driver doesn't care about
the names of the subnodes, anyway... so while this is technically an ABI break
it's not really creating any functionality issue, and then, actually, Yassine
is also modifying the devicetrees to comply with his consistency changes, so,
in my own perspective, it's still acceptable.

If you think otherwise, though, I'm still fine with your POV.

Cheers,
Angelo

