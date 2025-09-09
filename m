Return-Path: <linux-gpio+bounces-25775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6EB4A24C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 08:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EB21175095
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 06:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B4C303A0C;
	Tue,  9 Sep 2025 06:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pp/hdWj6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92B118A93F;
	Tue,  9 Sep 2025 06:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757399551; cv=none; b=KEceyEFFXzBzuVvbjbnS7dRp6DwlwW15gknr+jb8AhZFDGr0KEiEr1yv+pmRz5Qgt5aQz64wUPGJU7N5feCHtx2JSLm1rBf+a7ueYUQCB+Cf+i971nuf+sbvd0Jjt4Z3iQI02rGUKfaDgYFIZxgntBjTTxasG3Um/Qbok+DPPJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757399551; c=relaxed/simple;
	bh=2G05gzx1PbaHyR1yYOE2y+mLcbStlpmfMPAJKrEzaC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQpcxBDGFDVYOzLAK+x8GbMPJABX+l0gMvQQQWYwGE5lJlCIjz4Qr1qWUOwWR/LME2ryNWI9NXibLe1T1GHz3zmigHr4cvKu+OoutV6x6C0IQXemU9kWVfCHWmkTc3ZWsrE6V1KPtHgt1RJCjXigIC8xhuoA0pWjNm2Zk6SKBhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pp/hdWj6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634CDC4CEF5;
	Tue,  9 Sep 2025 06:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757399549;
	bh=2G05gzx1PbaHyR1yYOE2y+mLcbStlpmfMPAJKrEzaC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pp/hdWj6LY6bGFjsgsADGJsGjUD6dcZ8sIz1E2W8Bp78HpLJf5tiqc6PaS2tctJdm
	 vmRk4z5ffK38g1LunQBW0MQIF8wH/i8WasdyLDVZhqU5vYlbAWpRm+5WdrI4F4e1nx
	 SZk6v7FD0wB9wfJnihoizbTt7Ts6XaoOFKQzUFaVUmnfIwh3Fb69isdIlQwB+DU/zV
	 sUK7LXBTh4A/R913c5kWjfFNoDCsJAzLL/Fjd+T7S001RLhPcMZsFqlGTK+5PtZRI4
	 Rh2iw78Rf2haihzrZVl0vVKInRdOFZSP9QhMrMB3DmwQLT65Da5TroKWm2ahjZzO7A
	 YG0KA2UCAnqHw==
Message-ID: <5421cfe7-dfe0-4bb8-8722-6f449cd365be@kernel.org>
Date: Tue, 9 Sep 2025 08:32:17 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/14] media: dt-bindings: Convert MediaTek mt8173-mdp
 bindings to YAML
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
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
 <d286ec0b-c8dc-4103-9aa3-2f40e0ade4a3@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <d286ec0b-c8dc-4103-9aa3-2f40e0ade4a3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/09/2025 19:52, Ariel D'Alessandro wrote:
> Krzysztof,
> 
> On 8/21/25 3:46 AM, Krzysztof Kozlowski wrote:
>> On Wed, Aug 20, 2025 at 02:12:49PM -0300, Ariel D'Alessandro wrote:
>>> Convert the existing text-based DT bindings for MediaTek MT8173 Media Data Path
>>> to a YAML schema.
>>
>> Please wrap commit message according to Linux coding style / submission
>> process (neither too early nor over the limit):
>> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
> Thanks. Looks like my editor was misconfigured, sorry. Will fix in v2.
> 
>>
>>>
>>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>> ---
>>>   .../bindings/media/mediatek,mt8173-mdp.yaml   | 174 ++++++++++++++++++
>>>   .../bindings/media/mediatek-mdp.txt           |  95 ----------
>>>   2 files changed, 174 insertions(+), 95 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>>>   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>>> new file mode 100644
>>> index 0000000000000..f3a08afc305b1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>>> @@ -0,0 +1,174 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek MT8173 Media Data Path
>>> +
>>> +maintainers:
>>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>> +
>>> +description:
>>> +  Media Data Path is used for scaling and color space conversion.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>
>> Just enum, no items here
> 
> See below.
> 
>>
>>
>>> +          - enum:
>>> +              - mediatek,mt8173-mdp-rdma
>>> +              - mediatek,mt8173-mdp-rsz
>>> +              - mediatek,mt8173-mdp-wdma
>>> +              - mediatek,mt8173-mdp-wrot
>>> +      - items:
>>> +          - enum:
>>> +              - mediatek,mt8173-mdp-rdma
>>> +              - mediatek,mt8173-mdp-rsz
>>> +              - mediatek,mt8173-mdp-wdma
>>> +              - mediatek,mt8173-mdp-wrot
>>> +          - const: mediatek,mt8173-mdp
>>
>> This makes no sense. How devices can be compatible and can not be
>> compatible.
> 
> According to the driver source code (and the previous txt mt8173-mdp 
> bindings), there must be a "controller node" with compatible 
> `mediatek,mt8173-mdp`. Then its sibling nodes (including itself) should 

But you did not define "mediatek,mt8173-mdp" here, so what are you
talking about?

I talk here about "wrot" and others, I thought it is obvious from the
mistake in the schema.


> be one of the component node ids, listed in `struct of_device_id 
> mtk_mdp_comp_dt_ids[]`.
> 
> Is there a proper/different way to describe this compatible binding in 
> the yaml? Or you're saying the driver doesn't make sense here?
> 
> [0] drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> 
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks: true
>>
>> No, there's no such syntax. Look at other bindings.
> 
> Ack.
> 
>>
>>
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +
>>> +  iommus:
>>> +    description: |
>>
>> Drop |
> 
> Ack.
> 
>>
>>> +      This property should point to the respective IOMMU block with master port as argument,
>>> +      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
>>
>> Drop entire description, completely redundant. I don't know why my patch
>> fixing this was not applied, so you keep repeating same mistakes...
> 
> Ack.
> 
>>
>>> +    maxItems: 1
>>> +
>>> +  mediatek,vpu:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      Describes point to vpu.
>>
>> Useless description. We see that from the property name. Explain the
>> purpose in the hardware.
> 
> Ack.
> 
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - power-domains
>>> +
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: mediatek,mt8173-mdp-rdma
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: Main clock
>>> +            - description: Mutex clock
>>> +    else:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: Main clock
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - mediatek,mt8173-mdp-rdma
>>> +              - mediatek,mt8173-mdp-wdma
>>> +              - mediatek,mt8173-mdp-wrot
>>> +    then:
>>> +      required:
>>> +        - iommus
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: mediatek,mt8173-mdp
>>
>> This makes no sense either.
> 
> Same question above about compatibles.

How same question? Do you understand this code? It is nothing the same -
you have here contains!


Best regards,
Krzysztof

