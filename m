Return-Path: <linux-gpio+bounces-25768-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F13B49AA8
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 22:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58FE02062D1
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 20:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5472D7DE8;
	Mon,  8 Sep 2025 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="hM5q/qJM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44A9219A86;
	Mon,  8 Sep 2025 20:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757361955; cv=pass; b=hmTX3CcDHzVBHIID1R+iVappo1etwt+EUarRflfZDtymSWJHlTlP4S8SbS2nxYoX3IGw3Dox1MdO+5xCSv2p/7Ie4PEiRzkGZ4Uqu5j7bwy6WKiaISGB8mLWTvVrNchWu4x800Isu0rb9C0DFc85DmBydx0JQQxOLXz5uo99foY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757361955; c=relaxed/simple;
	bh=erTUly9Qg9X6cog7y18GcAb2e51Bg9D6zVP2Ld+yegU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3F5oM1el+YgBvHLUZhBx6ltCucQuKoFjn94yRuWd0qFE37Xfx57ZAULiqcW8vkZ8pzyMb/UCPsVjImjFO5uHbj4hF/fjf7MdyYEtsvcrKiEj47wV8mKEthN6L2v/YgQp9NlxOB4OY7VDo+asKP4y4OrNEXyqM3jr6WPyZgx/4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b=hM5q/qJM; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1757361899; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FBqZoto3NaNrr+QEk2kOlolOBw3muYFVoz92mSEsCqHEHx9bRDQVMBbpJvXLiEZn1Q7eNia7ROlo6ioobMA+XLoysc8dYZF2eB4bzoY2q4Mvdb1w+fUxt8QL5vlTMVEHXiU9sJF53nbHrsyPV3UhZpUZZNyk0Y2P5HGhidk7fn0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757361899; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8Qmtq2CeP5Jx7vZXKA2CMOipGElDjnWELU/7DNqKtTE=; 
	b=MxHttsUDp1O7iL94CxpC4azMxrqzbdHtZMwsjWmfVfDp8Kmnr2njcXzIJ9sg+185/H7MVUIhbYTGKo2AvEKkeCrHmqcY0aJmhVSm9dlrtrpjzhe6/gvFYThXkLahFKnJupZ127Pgmdll3zTjB/HE7cv6WeXprzWlrH1t6Cdaqrk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757361899;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8Qmtq2CeP5Jx7vZXKA2CMOipGElDjnWELU/7DNqKtTE=;
	b=hM5q/qJMILxUA2nOZg1Nvj3qrcEKZCqnn9aoxyH8Z6+lErg0o9Y5rGzh7VrQQh5j
	/Vq82lI51wz8mQvigoFmbhZv+IZco6nfWCamUyuuMcf08vsBx+PYt5RNWhKIKHVhwpk
	R/LDv7vzYP2AP5Oo+otV7uUA0uLne4OUJJM8R37A=
Received: by mx.zohomail.com with SMTPS id 1757361898233170.25250327031745;
	Mon, 8 Sep 2025 13:04:58 -0700 (PDT)
Message-ID: <d32af8e4-0771-4674-8317-78dd1e24c95b@collabora.com>
Date: Mon, 8 Sep 2025 17:04:41 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/14] sound: dt-bindings: Convert MediaTek RT5650
 codecs bindings to YAML
To: Rob Herring <robh@kernel.org>
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
 p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
 simona@ffwll.ch, support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-6-ariel.dalessandro@collabora.com>
 <20250822151415.GA3819434-robh@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250822151415.GA3819434-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Rob,

On 8/22/25 12:14 PM, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 02:12:53PM -0300, Ariel D'Alessandro wrote:
>> Convert the existing text-based DT bindings for Mediatek MT8173 RT5650
>> codecs to a YAML schema.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../sound/mediatek,mt8173-rt5650.yaml         | 73 +++++++++++++++++++
>>   .../bindings/sound/mt8173-rt5650.txt          | 31 --------
>>   2 files changed, 73 insertions(+), 31 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
>>
>> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>> new file mode 100644
>> index 0000000000000..36e4f9c4c3d62
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Mediatek MT8173 with RT5650 codecs and HDMI via I2S
>> +
>> +maintainers:
>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: "mediatek,mt8173-rt5650"
> 
> Drop quotes.

Ack.

> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  mediatek,audio-codec:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description:
>> +      The phandles of rt5650 codecs and of the HDMI encoder node.
>> +    minItems: 2
>> +
>> +  mediatek,platform:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      The phandle of MT8173 ASoC platform.
>> +
>> +  mediatek,mclk:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      The MCLK source.
>> +      0: external oscillator, MCLK = 12.288M
>> +      1: internal source from mt8173, MCLK = sampling rate * 256
>> +
>> +  codec-capture:
>> +    description: Subnode of rt5650 codec capture.
>> +    type: object
>> +
>> +    properties:
>> +      sound-dai:
>> +        maxItems: 1
>> +        description: phandle of the CPU DAI
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - mediatek,audio-codec
>> +  - mediatek,platform
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    sound: sound {
> 
> Drop unused label.

Ack.

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


