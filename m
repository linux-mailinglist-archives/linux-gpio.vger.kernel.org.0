Return-Path: <linux-gpio+bounces-17689-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E92A65533
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 16:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97CEF1897402
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 15:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E50D246333;
	Mon, 17 Mar 2025 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q/VXCgWB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FFE42070;
	Mon, 17 Mar 2025 15:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742224229; cv=none; b=qgOzKnJ+Il0a5fSF50jxNeFOySpOc79fvOC3wTIQU7eNYrH9yFM3vVWL63QJzbOFY5IFVM+Vojs8+rj8JrFwOjqxbMtdtaRi9wRPjFxC7JZT0naIJ7HGt2zg+yTQ+VRZAe48C2V/X4f2g3ohlxDaIh7P0VXaJlo1TrURt9ScPFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742224229; c=relaxed/simple;
	bh=kqYx6b0Q2AbSrlMWtByIV/qXFsF3L/buRpNOgC/su3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aKDc1tKQXmWRjDtJexiaAFpTJ9OQA0vZNPyElVksiCoW6BtGYNzwnE/kFQ/VpvyPhvrQrdSkxitQbQpvN8kYIZz0GCUudrBFXTqPjRqwODI0xq43DlM2DsCbf34Y+gS6oeifkrMu41DrHwWlriAa9B6nRXwLiHfrt3Ia5KUId/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q/VXCgWB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF97C4CEE3;
	Mon, 17 Mar 2025 15:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742224228;
	bh=kqYx6b0Q2AbSrlMWtByIV/qXFsF3L/buRpNOgC/su3w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q/VXCgWBx9flKktGMWIUTFGlAe43G0ITwTm7+0NelEZG76xYgZqJyluVWVCJVk7tE
	 K1E+OxKUIQqjySmc3D438fVyvypZCX1Q0jscm1dzhcwRoCpFZzDwhD88BINihbXO8D
	 PPhmj8kmp5T3LQNe+8EObPRuIea+viUFvZN3PFWBAFx83tbhhmK5bYOoRZ2kpMJQGP
	 E7moIz8VDvJbBMhb7L/5BcI0zXnyFJ1PcsUo7HpKJbYDP4SmIx7/nlrAVqrSVdVVQm
	 1Rt5bhjooZG+GQtq04zSV8oxTpr4eqSm3/FFcsRKsGx0xy13LipZV45MRZQokn2+6S
	 D05sCT7Zle3nA==
Message-ID: <1b8228df-e007-4ecf-92b7-d4833efbc765@kernel.org>
Date: Mon, 17 Mar 2025 16:10:13 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: clock: qcom: Add MSM8937 Global Clock
 Controller
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-1-1f132e870a49@mainlining.org>
 <20250317-hot-obedient-sturgeon-394cb8@krzk-bin>
 <11695D76-7CBE-41CE-A8DD-D6845D01670C@mainlining.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <11695D76-7CBE-41CE-A8DD-D6845D01670C@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 10:57, Barnabás Czémán wrote:
> 
> 
> On March 17, 2025 10:17:46 AM GMT+01:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Sat, Mar 15, 2025 at 03:57:35PM +0100, Barnabás Czémán wrote:
>>> Add device tree bindings for the global clock controller on Qualcomm
>>> MSM8937 platform.
>>>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---
>>>  .../bindings/clock/qcom,gcc-msm8937.yaml           | 75 ++++++++++++++++++++++
>>>  include/dt-bindings/clock/qcom,gcc-msm8917.h       | 17 +++++
>>>  2 files changed, 92 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..3c3f6756048e195671f542b3a6cd09057558eafa
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8937.yaml
>>> @@ -0,0 +1,75 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8937.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Global Clock & Reset Controller on MSM8937
>>> +
>>> +maintainers:
>>> +  - Barnabas Czeman <barnabas.czeman@mainlining.org>
>>> +
>>> +description: |
>>> +  Qualcomm global clock control module provides the clocks, resets and power
>>> +  domains on MSM8937.
>>
>> This is exactly like msm8953, so why it cannot be there?
>>
> Not exactly clock names are different, msm8953 have sleep msm8937 have sleep_clk.

But this is the same clock, isn't it?

And while we are at this: fix the name, so "sleep" because there is no
point to write that an entry in clock-names is a clock. There is no
"_clk" anywhere else.


>>> +
>>> +  See also::
>>> +    include/dt-bindings/clock/qcom,gcc-msm8917.h
>>
>> typo, 8937
>>
> No

Ack

>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,gcc-msm8937
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: XO source
>>> +      - description: Sleep clock source
>>> +      - description: DSI phy instance 0 dsi clock
>>> +      - description: DSI phy instance 0 byte clock
>>> +      - description: DSI phy instance 1 dsi clock
>>> +      - description: DSI phy instance 1 byte clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: xo
>>> +      - const: sleep_clk
>>> +      - const: dsi0pll
>>> +      - const: dsi0pllbyte
>>> +      - const: dsi1pll
>>> +      - const: dsi1pllbyte
>>> +
>>> +required:
>>> +  - compatible
>>> +  - clocks
>>> +  - clock-names
>>> +  - '#power-domain-cells'
>>> +
>>> +allOf:
>>> +  - $ref: qcom,gcc.yaml#
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/clock/qcom,rpmcc.h>
>>> +
>>> +    clock-controller@1800000 {
>>> +      compatible = "qcom,gcc-msm8937";
>>> +      reg = <0x01800000 0x80000>;
>>> +      #clock-cells = <1>;
>>> +      #reset-cells = <1>;
>>> +      #power-domain-cells = <1>;
>>> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>>> +               <&sleep_clk>,
>>> +               <&dsi0_phy 1>,
>>> +               <&dsi0_phy 0>,
>>> +               <&dsi1_phy 1>,
>>> +               <&dsi1_phy 0>;
>>> +      clock-names = "xo",
>>> +                    "sleep_clk",
>>> +                    "dsi0pll",
>>> +                    "dsi0pllbyte",
>>> +                    "dsi1pll",
>>> +                    "dsi1pllbyte";
>>> +    };
>>> +...
>>> diff --git a/include/dt-bindings/clock/qcom,gcc-msm8917.h b/include/dt-bindings/clock/qcom,gcc-msm8917.h
>>> index 4b421e7414b50bef2e2400f868ae5b7212a427bb..ec1f0b261dd5ccfe4896a00ffa9cf86de98b9cb3 100644
>>> --- a/include/dt-bindings/clock/qcom,gcc-msm8917.h
>>> +++ b/include/dt-bindings/clock/qcom,gcc-msm8917.h
>>> @@ -170,6 +170,22 @@
>>>  #define VFE1_CLK_SRC				163
>>>  #define VSYNC_CLK_SRC				164
>>>  #define GPLL0_SLEEP_CLK_SRC			165
>>> +#define BLSP1_QUP1_I2C_APPS_CLK_SRC		166
>>> +#define BLSP1_QUP1_SPI_APPS_CLK_SRC		167
>>> +#define BLSP2_QUP4_I2C_APPS_CLK_SRC		168
>>> +#define BLSP2_QUP4_SPI_APPS_CLK_SRC		169
>>
>> Why are you adding bindings to 8917? Nothing in commit msg explains
>> that.
> Because msm8917 driver was expanded with 8937 bits, i will expand the commit message.


But this is about hardware, not driver. If you want to combine in one
bindings devices from the same family (which I doubt these are, too many
differences), then make it clear with prefixes, see
61b17d072d811df5733a1570889b8c6fa6834bf8

If they are not that related, then a separate file.

>>
>> Best regards,
>> Krzysztof
>>


Best regards,
Krzysztof

