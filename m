Return-Path: <linux-gpio+bounces-25765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2570B499C0
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 21:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A818E3416E2
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 19:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D5F2594B9;
	Mon,  8 Sep 2025 19:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="MDQHe4Dq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9B424A04D;
	Mon,  8 Sep 2025 19:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359221; cv=pass; b=aLhlpsQvCcqdw7OGsnbWd4GoL0nTO0ax6qzWZlSei2CRlMiUork4intDIiFjuXOgpga4tfYxysSyNvH8WN6mfdfGeOv4z5yRPJu0hxw6n3XGe+njua5u5pCCfYcpTpRp3EVXEhCHQJRlJcX8+NtULAPMgBOB6Kjb07L+FS/uTrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359221; c=relaxed/simple;
	bh=N4KX4iYjQlsSAC7XbRdcqC2Wav7eEMkfZTLFXxOZ5mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TzmWK6mwJVw73OJlutWSvfA+sKtd6hl90Lyh9zXRmfXZub0eQQPuL02ASUhV+yaVrGd8I4BAz/X2mkCHRXmJM3JaByub/pp03cZPumdINsa1pSMcjtszfv4j7+7l/WfFVxps7y5C7iKt6hTkrHyZ3+0yIxBeUg/iESrE1aUHRdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=MDQHe4Dq; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757359161; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SR21xJbjuheCmpRO47GHS8daLjO4bieeiZzmtZ1cpc55VPRfVg548p5JS7agjhBhxNyqLOj4aSq+sv4fBoBAFwinz+AErAYyDnm9dFMD1lYZFLK2nGxh32KU9UBpnwa4JOgAkGhXXZk1Ezt/EytGOrIDKz/fJ1yBYOqSVdPDvEQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757359161; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WKomwiWRLnM4IVkNJXgsDxoTaoxCuRYCEVpcC0hexTc=; 
	b=htmAjoNLy5CO05zAuH6G9LKsksKbRORMRlY2ga//3IUV8oR1JzNf+k84WVaUN8L2BLKsKIhlEp5YQ3KZB1vW4nlER4kFzE9gNteCx4wTgatNBcVznKJb5H1OLhHsmd7Rx2SXOPvHQ6Ssw5cfdqXuwJAAJJ/8DSbGxjiAwoM21VE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757359161;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WKomwiWRLnM4IVkNJXgsDxoTaoxCuRYCEVpcC0hexTc=;
	b=MDQHe4Dqfppv+jVMwZnyFuAG2uAH30HHHO82FejqVc2iciJuMenfzAvgyXzq4Uui
	4cmxT8BC0FYcgwWgEs3oRnI/N4M6nE/u/LHyPhm0wpuYeXoPlqRJqe/erXnbU3QzXJ8
	v3SChD6qsHNwSMzyTd0ri4Nf8MkPaF09mbhQTE+8=
Received: by mx.zohomail.com with SMTPS id 175735915950243.97346092425232;
	Mon, 8 Sep 2025 12:19:19 -0700 (PDT)
Message-ID: <1cf0b296-adaa-4c80-864c-9b78f09cd3e3@collabora.com>
Date: Mon, 8 Sep 2025 16:19:03 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/14] dt-bindings: arm: mediatek: mmsys: Add
 assigned-clocks/rates properties
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
 <20250820171302.324142-4-ariel.dalessandro@collabora.com>
 <20250821-electric-kestrel-of-awe-cb89dc@kuoka>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250821-electric-kestrel-of-awe-cb89dc@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Krzysztof,

On 8/21/25 3:43 AM, Krzysztof Kozlowski wrote:
> On Wed, Aug 20, 2025 at 02:12:51PM -0300, Ariel D'Alessandro wrote:
>> Current, the DT bindings for MediaTek mmsys controller is missing the
>> assigned-clocks and assigned-clocks-rates properties. Add these and
> 
> No, they do not miss them. I don't understand why you are adding these.

The reason I added these is due to the following check error:

$ make -j$(nproc) CHECK_DTBS=y mediatek/mt8173-elm.dtb
   DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
[...]
arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscon@14000000 
(mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do 
not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: 
http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#

> 
>> update the example as well.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> index 3f4262e93c789..d045d366eb8e2 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> @@ -68,6 +68,12 @@ properties:
>>         of the power controller specified by phandle. See
>>         Documentation/devicetree/bindings/power/power-domain.yaml for details.
>>   
>> +  assigned-clocks:
>> +    maxItems: 1
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 1
>> +
> 
> Drop both, completely redundant and not actually in the scope of the binding.

Ack. Will fix accordingly in v2 based on the discussion above.

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


