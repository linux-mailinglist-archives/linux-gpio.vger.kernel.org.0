Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50290444FB1
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 08:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230306AbhKDHfE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 03:35:04 -0400
Received: from mx.socionext.com ([202.248.49.38]:14433 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230119AbhKDHfE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Nov 2021 03:35:04 -0400
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 04 Nov 2021 16:32:25 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id C8BA7203F6D9;
        Thu,  4 Nov 2021 16:32:25 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Thu, 4 Nov 2021 16:32:25 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
        by iyokan2.css.socionext.com (Postfix) with ESMTP id 51CA9B62AB;
        Thu,  4 Nov 2021 16:32:25 +0900 (JST)
Received: from [10.212.183.139] (unknown [10.212.183.139])
        by yuzu2.css.socionext.com (Postfix) with ESMTP id E0ED1B6291;
        Thu,  4 Nov 2021 16:32:24 +0900 (JST)
Subject: Re: [PATCH v2] dt-bindings: pinctrl: uniphier: Add child node
 definitions to describe pin mux and configuration
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1635385599-17778-1-git-send-email-hayashi.kunihiko@socionext.com>
 <YYGmT9zLiqpb1fH8@robh.at.kernel.org>
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <138d4e8f-b63e-8118-2d66-23384af9cc6d@socionext.com>
Date:   Thu, 4 Nov 2021 16:32:24 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YYGmT9zLiqpb1fH8@robh.at.kernel.org>
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2021/11/03 5:57, Rob Herring wrote:
> On Thu, Oct 28, 2021 at 10:46:39AM +0900, Kunihiko Hayashi wrote:
>> In arch/arm/boot/dts/uniphier-pinctrl.dtsi, there are child nodes of
>> pinctrl that defines pinmux and pincfg, however, there are no rules about
>> that in dt-bindings.
>>
>> 'make dtbs_check' results an error with the following message:
>>
>>     pinctrl: 'ain1', 'ain2', 'ainiec1', 'aout', 'aout1', 'aout2', ...
>>     ... 'usb2', 'usb3' do not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> To avoid this issue, add the rules of pinmux and pincfg in each child node
>> and grandchild node.
>>
>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>> ---
>> Changes since v1:
>> - Replace additionalProperties with unevaluatedProperties
>> - Add additionalProperties for child and grandchild nodes
>>
>>   .../pinctrl/socionext,uniphier-pinctrl.yaml        | 50 +++++++++++++++++++++-
>>   1 file changed, 49 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
> b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
>> index a804d9bc1602..7e504e003181 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yaml
>> @@ -26,10 +26,58 @@ properties:
>>         - socionext,uniphier-pxs3-pinctrl
>>         - socionext,uniphier-nx1-pinctrl
>>   
>> +additionalProperties:
>> +  type: object
>> +
>> +patternProperties:
>> +  "^.*$":
>> +    if:
>> +      type: object
>> +    then:
>> +      allOf:
> 
> All of the above should be:
> 
> additionalProperties:
>    type: object
>    allOf:
>    ...

I see. I'll rewrite it instead of "patternProperties".

> 
>> +        - $ref: pincfg-node.yaml#
>> +        - $ref: pinmux-node.yaml#
>> +
>> +      properties:
>> +        phandle: true
>> +        function: true
>> +        groups: true
>> +        pins: true
>> +        bias-pull-up: true
>> +        bias-pull-down: true
>> +        bias-pull-pin-default: true
>> +        drive-strength: true
>> +
>> +      additionalProperties:
>> +        type: object
>> +
>> +      patternProperties:
>> +        "^.*$":
>> +          if:
>> +            type: object
>> +          then:
>> +            allOf:
>> +              - $ref: pincfg-node.yaml#
>> +              - $ref: pinmux-node.yaml#
>> +
>> +            properties:
>> +              phandle: true
>> +              function: true
>> +              groups: true
>> +              pins: true
>> +              bias-pull-up: true
>> +              bias-pull-down: true
>> +              bias-pull-pin-default: true
>> +              drive-strength: true
>> +
>> +            unevaluatedProperties: false
>> +
>> +      unevaluatedProperties: false
>> +
>>   required:
>>     - compatible
>>   
>> -additionalProperties: false
>> +unevaluatedProperties: false
> 
> Drop +unevaluatedProperties.

I understand that "additionalProperties" has already been used at the top
level, so this "unevaluatedProperties" is unnecessary.

For the same reason, "unevaluatedProperties" at the child node is also unnecessary.

I think "unevaluatedProperties" at the grandchild node should be left because
the grandchild node doesn't have "additionalProperties".


additionalProperties:
   type: object
   allOf:
     ...
     additionalProperties:
       type: object
       allOf:
         ...
         unevaluatedProperties: false
     [X]
[X]

Thank you,

---
Best Regards
Kunihiko Hayashi
