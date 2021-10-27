Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762DB43C26A
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 07:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbhJ0F6b (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 01:58:31 -0400
Received: from mx.socionext.com ([202.248.49.38]:45888 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236871AbhJ0F6a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Oct 2021 01:58:30 -0400
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 27 Oct 2021 14:56:04 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id D5983206E701;
        Wed, 27 Oct 2021 14:56:04 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Wed, 27 Oct 2021 14:56:04 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
        by iyokan2.css.socionext.com (Postfix) with ESMTP id 67CD6B62AB;
        Wed, 27 Oct 2021 14:56:04 +0900 (JST)
Received: from [10.212.181.22] (unknown [10.212.181.22])
        by yuzu2.css.socionext.com (Postfix) with ESMTP id 08487B6291;
        Wed, 27 Oct 2021 14:56:03 +0900 (JST)
Subject: Re: [PATCH] dt-bindings: pinctrl: uniphier: Add child node
 definitions to describe pin mux and configuration
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1634136848-20091-1-git-send-email-hayashi.kunihiko@socionext.com>
 <YXhluRBQ+sGMYGkj@robh.at.kernel.org>
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <79b9f644-1e7a-7e95-292d-13261a18dce6@socionext.com>
Date:   Wed, 27 Oct 2021 14:56:03 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YXhluRBQ+sGMYGkj@robh.at.kernel.org>
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,
Thank you for your comment,

On 2021/10/27 5:31, Rob Herring wrote:
> On Wed, Oct 13, 2021 at 11:54:08PM +0900, Kunihiko Hayashi wrote:
>> In arch/arm/boot/dts/uniphier-pinctrl.dtsi, there are child nodes of
>> pinctrl that defines pinmux and pincfg, however, there are no rules
> about
>> that in dt-bindings.
>>
>> 'make dtbs_check' results an error with the following message:
>>
>>     pinctrl: 'ain1', 'ain2', 'ainiec1', 'aout', 'aout1', 'aout2', ...
>>     ... 'usb2', 'usb3' do not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> To avoid this issue, add the rules of pinmux and pincfg in each child
> node
>> and grandchild node.
>>
>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>> ---
>>   .../pinctrl/socionext,uniphier-pinctrl.yaml        | 46
> +++++++++++++++++++++-
>>   1 file changed, 44 insertions(+), 2 deletions(-)
>>
>> diff --git
> a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yam
> l
> b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yam
> l
>> index a804d9bc1602..4567330fe536 100644
>> ---
> a/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yam
> l
>> +++
> b/Documentation/devicetree/bindings/pinctrl/socionext,uniphier-pinctrl.yam
> l
>> @@ -26,11 +26,53 @@ properties:
>>         - socionext,uniphier-pxs3-pinctrl
>>         - socionext,uniphier-nx1-pinctrl
>>   
>> -required:
>> -  - compatible
>> +patternProperties:
>> +  "^.*$":
>> +    if:
>> +      type: object
>> +    then:
> 
> After coming up with this hack, I found a better way using
> additionalProperties:
> 
> additionalProperties:
>    type: object

I see. I'll add it next.

> and then all this:
> 
>> +      allOf:
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
>> +      patternProperties:
>> +        "^.*$":
>> +          if:
>> +            type: object
>> +          then:
> 
> Same thing here.

Yes. I'll add it, too.

Thank you,

---
Best Regards
Kunihiko Hayashi
