Return-Path: <linux-gpio+bounces-37759-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCn3F19tHWq6agkAu9opvQ
	(envelope-from <linux-gpio+bounces-37759-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 13:30:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5929961E585
	for <lists+linux-gpio@lfdr.de>; Mon, 01 Jun 2026 13:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31243300A58A
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jun 2026 11:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29793009E2;
	Mon,  1 Jun 2026 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOV+Z1rd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5687C2E7394;
	Mon,  1 Jun 2026 11:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313431; cv=none; b=GoZCMRz9/Y61TUkQ/Q8bE21g2PLCKOM3aM2lzBDNFv5iRJirZZLtoH+/0h0jVS2qdDr4ytiMiw6itJ9ij3UzBC/y7IJeQ4BI2JFxAM0p0f+8w5mIay0U1sSpLQK/NRpZfFC/4Wdi+NFaIgmhzLLODGpYshLNLvcNoLdMFEpAjvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313431; c=relaxed/simple;
	bh=8Ucj4fp6cxZ4+DnmoRcnCdkdviUW0b3KUei+/dNPcYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdEbz57LHbO/QtZBE10qqANESup7yPCmcfh2LzcD6VRE3043iAnmvyV+AfN15/wIeWMXQPEiBle1zrOpgJseO85ANyPsRfjgP/9OyA1R2JHcLLe/h6YDxYiRSxSKAT3XBPFIdEOT9IjO1y+IGJ/8o16fPDbzwHvo0lj9QGdsRgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOV+Z1rd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF131F00893;
	Mon,  1 Jun 2026 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780313430;
	bh=jQJ/act9W7vDrGgLtIYr+ZfV8kr/t5gDKLTOLvDLfL4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DOV+Z1rdoMGaXgBjVmLd0BoV6ZtE+a3pGAoXoMIDB5en0CspvBpbc/Tc8QxwPZtUu
	 7ECXAM+vrMspIxI7tiRR7ZDh1NlLlk4M8hBAVNzqTd4vvFZV94KCacDik5iArqrPG3
	 fYaVJNK7yYZHPyo7nXGX55voioIzpinnKdwFdzNdoohN5p3aygb4x58oSeVpQbHjni
	 pPSzzhgZsO6A9On4UTNmC8t4kwQy3DlgPVekmgkpu6yN+yn7BEnBHJzOf78+x9EfvF
	 c7620oVpL1Ywvk8W+3udXGfTzdVDA/m/WfRhZoPJdnHE4XE9aHxl59i7lf9a7Bf/jB
	 xlzKpatnMkQ3A==
Message-ID: <d764694f-0cb6-4488-8ee8-ec4ce658ebd4@kernel.org>
Date: Mon, 1 Jun 2026 13:30:22 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 level-shifter function
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 David Collins <david.collins@oss.qualcomm.com>,
 Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
 Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
 <20260530-thankful-maroon-boar-be86f8@quoll>
 <158920bf-3b52-4772-9305-18afcd5807e3@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <158920bf-3b52-4772-9305-18afcd5807e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37759-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 5929961E585
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 07:00, Fenglin Wu wrote:
> 
> On 5/30/2026 6:29 PM, Krzysztof Kozlowski wrote:
>> On Thu, May 28, 2026 at 06:05:36PM -0700, Fenglin Wu wrote:
>>> Add the "level-shifter" function and add the required DT properties to
>>> allow RPMh firmware to control the level-shifter. Introduce a custom
>>> pinconf parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
>>> level-shifter function.
>> I don't get how PMIC, which is not a child of RPMh at all or not
>> talking with RPMh RSC, needs to configure its pin via RPMh. It feels it
>> is misrepresented.
> 
> The control for enabling or disabling the bi-directional level shifter 
> has been centralized in AOP, similar to how regulator resources are 
> managed. This allows it to be used on a serial bus shared by multiple 
> clients from different subsystems. Each subsystem can vote for its 
> enable state through RPMh commands, and AOP determines the final status 
> to turn the BIDIR_LVL_SHIFTER PMIC modules on or off. Additionally, each 
> bi-directional level shifter shares its physical pins with a pair of 
> PMIC GPIO modules and is mutually exclusive with other PMIC GPIO 
> functions, which means those PMIC GPIO functions must be disabled.

So two completely independent hardware devices - PMIC and RPMh -
configure the same hardware - level shifter and pin function?

> 
> For these reasons, adding bi-directional level shifter software support 
> to the pinctrl-spmi-gpio driver is considered the best approach. Let me 
> know if you have a better suggestion.
> 
>>> Additionally, add the "groups" property with the allowed group names
>>> that can be used to control the level-shifter function on pmh0101.
>>>
>>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>> ---
>>>   .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 66 +++++++++++++++++++++-
>>>   include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
>>>   2 files changed, 64 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>> index b8109e6c2a10..19dc61ddff2d 100644
>>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
>>> @@ -119,6 +119,21 @@ properties:
>>>         The first cell will be used to define gpio number and the
>>>         second denotes the flags for this gpio
>>>   
>>> +  qcom,rpmh:
>>> +    description:
>>> +      Phandle to the RPMh controller device. Required for PMICs when the
>>> +      bidirectional level shifters is used (e.g., pmh0101), to enable
>>> +      communication with RPMh firmware for level shifter control.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +
>>> +  qcom,pmic-id:
>>> +    description:
>>> +      The ID of the PMIC which supports bidirectional level shifter function.
>>> +      It is used as the RPMh resource name suffix to request control of the
>>> +      level shifter to the RPMh firmware.
>>> +    $ref: /schemas/types.yaml#/definitions/string
>>> +    pattern: "^[A-N]_E[0-3]+$"
>> You do not get instance IDs (it's explcitly documented in docs).
> 
> Okay. This is primarily for creating the resource names used to obtain 
> the rpmh addresses from the cmd-db for the level-shifter.
> 
> I can change it to a different name if you still agree to add the 
> support in the pinctrl driver.

ID or name, same thing. Still not allowed.

> 
>>> +
>>>   additionalProperties: false
>>>   
>>>   required:
>>> @@ -330,6 +345,22 @@ allOf:
>>>             contains:
>>>               enum:
>>>                 - qcom,pmh0101-gpio
>>> +    then:
>>> +      properties:
>>> +        gpio-line-names:
>>> +          minItems: 18
>>> +          maxItems: 18
>>> +        gpio-reserved-ranges:
>>> +          minItems: 1
>>> +          maxItems: 9
>>> +        qcom,rpmh: true
>>> +        qcom,pmic-id: true
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>>                 - qcom,pmih0108-gpio
>>>       then:
>>>         properties:
>>> @@ -523,6 +554,19 @@ $defs:
>>>           items:
>>>             pattern: '^gpio([0-9]+)$'
>>>   
>>> +      groups:
>>> +        $ref: /schemas/types.yaml#/definitions/string-array
>>> +        description:
>>> +          List of GPIO groups to apply properties to. Only valid for
>>> +          function "level-shifter" on pmh0101. Valid groups are
>>> +          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
>>> +        items:
>>> +          enum:
>>> +            - gpio11, gpio12
>>> +            - gpio13, gpio14
>>> +            - gpio15, gpio16
>>> +            - gpio17, gpio18
>>> +
>>>         function:
>>>           items:
>>>             - enum:
>>> @@ -536,6 +580,7 @@ $defs:
>>>                 - dtest4
>>>                 - func3  # supported by LV/MV GPIO subtypes
>>>                 - func4  # supported by LV/MV GPIO subtypes
>>> +              - level-shifter  # supported only by pmh0101
>>>   
>>>         bias-disable: true
>>>         bias-pull-down: true
>>> @@ -592,9 +637,24 @@ $defs:
>>>             configured as digital input.
>>>           enum: [1, 2, 3, 4]
>>>   
>>> -    required:
>>> -      - pins
>>> -      - function
>>> +      qcom,1p2v-1p8v-ls-en:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        description:
>>> +          Enable or disable the bidirectional 1.2V/1.8V level shifter
>>> +          associated with the specified GPIO group. When set to 1, an RPMh
>>> +          vote is sent to AOP to enable the level shifter. When set to 0,
>>> +          the vote is withdrawn. Only valid when function is "level-shifter"
>>> +          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
>>> +          on pmh0101).
>> And there are no generic pinconf properties defining the voltage?
> 
> The 1.2V and 1.8V voltages on each side of the bidirectional level 
> shifter are not configurable. They are fixed in the hardware with 
> built-in reference voltages at each side of the pins. I am adding this 
> custom pinconf parameter mainly to control its enabling status. Also, I 
> am adding "1p2v-1p8v" in the parameter name to provide additional 
> clarity for users about the "level-shifter" function.

So there are or there are not?

Best regards,
Krzysztof

