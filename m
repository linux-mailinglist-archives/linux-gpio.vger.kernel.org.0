Return-Path: <linux-gpio+bounces-26959-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3445BCBF0E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 09:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E62681A631F8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 07:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF47274FDB;
	Fri, 10 Oct 2025 07:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3lgyOC9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354FE227E83;
	Fri, 10 Oct 2025 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760081910; cv=none; b=LigfA1/K/N1yMov9jxq1niOlqiR2Nvcf8xFcPGyD4GSi8+3Kddgmi5vKNgiBW78sV5D1aUGZwy3lyr+x3E/XoTabfuLaOZl+inoSuYG3L0fcSYnVKmmREwiLLI+cbgzsVZrB0OXQ3jcCm46tuL6F90lxNd9IfeqCmZ1q9gpnr/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760081910; c=relaxed/simple;
	bh=Q6HzM2MvSQlnCOaTaZkiU1inNVsXDeafJCBsIg7FT0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RmWBhX5O+Rvjjn/u0TswFKRdOXvQ995z257GodukOdscdbEklMteByueyY1LRfKtgoZYt+6bG/LY3BjRU9vbOGHX/jUYSUoXbFRS4LLiGmCA7Ypoin71Kn4Jh/vNfcGI+03uB/ArV0m6RC5dEt0Y7AvJwsNUajsmorm8Ae0k3C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3lgyOC9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBD9C4CEF1;
	Fri, 10 Oct 2025 07:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760081909;
	bh=Q6HzM2MvSQlnCOaTaZkiU1inNVsXDeafJCBsIg7FT0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i3lgyOC9imYax+tUhp8NtYRZW7ZI6jWI6Wl0gvNbO1g5vi7UeVkHBjEoir2lN7GJG
	 4Mi/6IcMN52dv9jbsU4Hg7EADJVpnsFFJgYTWK6PzKNJJjkVGDKsnEDNQBAd7bygli
	 tppTL3u83sAK1ITw3dMtVgM/ob0hfzy7kdhBrvs6MxemvdTODKw7EpkkX5Tw4cntJm
	 BXRZpjlr/pRjCXaWwvMtDR62DQGV0gOYACv4JZQ2dMqtv/vYUEGqzyaMYi7sbAKzE+
	 uyzsWP1XA4ps+2+RGFWOF/0uU+8UA1rSCKk6rNPOXAq7lHnXvagQn5sat4OCYmYGzY
	 6jw7uUQcM+2WQ==
Message-ID: <ae28f82a-9f34-4025-a364-d7605c7f6681@kernel.org>
Date: Fri, 10 Oct 2025 09:38:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] regulator: dt-bindings: add s2mpg10-pmic
 regulators
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
 <20250606-s2mpg1x-regulators-v2-2-b03feffd2621@linaro.org>
 <20250611-statuesque-dolphin-of-felicity-6fbf54@kuoka>
 <a4834c957f518d9f172b5a2dd0b8cd34980c7653.camel@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <a4834c957f518d9f172b5a2dd0b8cd34980c7653.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/10/2025 11:47, André Draszik wrote:
> Hi Krzysztof,
> 
> On Wed, 2025-06-11 at 10:55 +0200, Krzysztof Kozlowski wrote:
>> On Fri, Jun 06, 2025 at 04:02:58PM GMT, André Draszik wrote:
>>> The S2MPG10 PMIC is a Power Management IC for mobile applications with
>>> buck converters, various LDOs, power meters, RTC, clock outputs, and
>>> additional GPIO interfaces.
>>>
>>> It has 10 buck and 31 LDO rails. Several of these can either be
>>> controlled via software or via external signals, e.g. input pins
>>> connected to a main processor's GPIO pins.
>>>
>>> Add documentation related to the regulator (buck & ldo) parts like
>>> devicetree definitions, regulator naming patterns, and additional
>>> properties.
>>>
>>> S2MPG10 is typically used as the main-PMIC together with an S2MPG11
>>> PMIC in a main/sub configuration, hence the datasheet and the binding
>>> both suffix the rails with an 'm'.
>>>
>>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>>
>>> ---
>>> v2:
>>> - drop | (literal style mark) from samsung,ext-control-gpios
>>>   description
>>> ---
>>>  .../regulator/samsung,s2mpg10-regulator.yaml       | 147 +++++++++++++++++++++
>>>  MAINTAINERS                                        |   1 +
>>>  .../regulator/samsung,s2mpg10-regulator.h          |  48 +++++++
>>>  3 files changed, 196 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml
>>> b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..82f2b06205e9bdb15cf90b1e896fe52c335c52c4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpg10-regulator.yaml
>>> @@ -0,0 +1,147 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/regulator/samsung,s2mpg10-regulator.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Samsung S2MPG10 Power Management IC regulators
>>> +
>>> +maintainers:
>>> +  - André Draszik <andre.draszik@linaro.org>
>>> +
>>> +description: |
>>> +  This is part of the device tree bindings for the S2MG10 Power Management IC
>>> +  (PMIC).
>>> +
>>> +  The S2MPG10 PMIC provides 10 buck and 31 LDO regulators.
>>> +
>>> +  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
>>> +  additional information and example.
>>> +
>>> +definitions:
>>> +  s2mpg10-ext-control:
>>> +    properties:
>>> +      samsung,ext-control:
>>> +        description: |
>>> +          These rails can be controlled via one of several possible external
>>> +          (hardware) signals. If so, this property configures the signal the PMIC
>>> +          should monitor. For S2MPG10 rails where external control is possible other
>>> +          than ldo20m, the following values generally corresponding to the
>>> +          respective on-chip pin are valid:
>>> +            - 0 # S2MPG10_PCTRLSEL_ON - always on
>>> +            - 1 # S2MPG10_PCTRLSEL_PWREN - PWREN pin
>>> +            - 2 # S2MPG10_PCTRLSEL_PWREN_TRG - PWREN_TRG bit in MIMICKING_CTRL
>>> +            - 3 # S2MPG10_PCTRLSEL_PWREN_MIF - PWREN_MIF pin
>>> +            - 4 # S2MPG10_PCTRLSEL_PWREN_MIF_TRG - PWREN_MIF_TRG bit in MIMICKING_CTRL
>>> +            - 5 # S2MPG10_PCTRLSEL_AP_ACTIVE_N - ~AP_ACTIVE_N pin
>>> +            - 6 # S2MPG10_PCTRLSEL_AP_ACTIVE_N_TRG - ~AP_ACTIVE_N_TRG bit in MIMICKING_CTRL
>>> +            - 7 # S2MPG10_PCTRLSEL_CPUCL1_EN - CPUCL1_EN pin
>>> +            - 8 # S2MPG10_PCTRLSEL_CPUCL1_EN2 - CPUCL1_EN & PWREN pins
>>> +            - 9 # S2MPG10_PCTRLSEL_CPUCL2_EN - CPUCL2_EN pin
>>> +            - 10 # S2MPG10_PCTRLSEL_CPUCL2_EN2 - CPUCL2_E2 & PWREN pins
>>> +            - 11 # S2MPG10_PCTRLSEL_TPU_EN - TPU_EN pin
>>> +            - 12 # S2MPG10_PCTRLSEL_TPU_EN2 - TPU_EN & ~AP_ACTIVE_N pins
>>> +            - 13 # S2MPG10_PCTRLSEL_TCXO_ON - TCXO_ON pin
>>> +            - 14 # S2MPG10_PCTRLSEL_TCXO_ON2 - TCXO_ON & ~AP_ACTIVE_N pins
>>> +
>>> +          For S2MPG10 ldo20m, the following values are valid
>>> +            - 0 # S2MPG10_PCTRLSEL_LDO20M_ON - always on
>>
>> No, use standard regulator properties - regulator-always-on
>>
>>
>>> +            - 1 # S2MPG10_PCTRLSEL_LDO20M_EN_SFR - VLDO20M_EN & LDO20M_SFR
>>> +            - 2 # S2MPG10_PCTRLSEL_LDO20M_EN - VLDO20M_EN pin
>>> +            - 3 # S2MPG10_PCTRLSEL_LDO20M_SFR - LDO20M_SFR in LDO_CTRL1 register
>>> +            - 4 # S2MPG10_PCTRLSEL_LDO20M_OFF - disable
>>
>> I don't think we allowed such property in the past.
> 
> I've done some more investigation now - the reason we need to configure
> control of rails via signals (i.e. input pin on S2MPG1x) is that the PMU
> and power domains in particular control at least some of them.
> 
> As an example, power domain g3d disable toggles an output pin on GS101,
> which is connected to the G3D_EN pin on S2MPG1x on Pixel. The regulator
> driver needs to configure all the G3D-related-PMIC rails to react to this
> signal. There a) is a large amount of flexibility as to which rail should
> react to which signal, and b) the bootloader doesn't configure (all of)
> them.
> 
> Therefore, we need to be able to specify which rail should be controlled
> by which signal, both in DT and in the driver.
> 
> The alternative would be do add explicit (driver-based) regulator control
> for each power domain, rather than having the PMU handle this. Such an
> approach appears suboptimal, because after all that's what the PMU is for.
> 
> Additionally, there are sequencing requirements on enabling/disabling rails
> and when using the signals, the PMIC will ensure they're followed, whereas
> a driver would have to duplicate that information and could get it a) wrong,
> b) would use more CPU cycles due to additional code, and c) leave the rail
> on for longer than necessarily due to timer resolution.
> 
> Also, it might not work in all cases, e.g. if the PMU disables the rail for
> the CPU, the Linux driver can not afterwards disable the PMIC rail anymore,
> leaving it unnecessarily enabled. Equally, the Linux driver can not disable
> the rail before turning off the power domain, as once the rail is off, the
> CPU/Linux can not execute any further code.
> 
> 
> Hope the above justifies the introduction of this property :-)

Not completely, I am still not sure what's the problem. How I understood
above is pretty standard - you have power rails on PMIC, so regulators,
and power domains. These regulators should be supplies to power domains.
Sequencing should be handled in regulator part, IOW, power domains do
not care what is the sequence because regulator handles it. Which pin
goes were, is defined by using such regulator - so power domain does
regulator_get() and this should configure respective regulator to its pin.

Best regards,
Krzysztof

