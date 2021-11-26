Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B676D45EC2B
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Nov 2021 12:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhKZLIo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 06:08:44 -0500
Received: from mx.socionext.com ([202.248.49.38]:29987 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230336AbhKZLGo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 26 Nov 2021 06:06:44 -0500
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 26 Nov 2021 20:03:30 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 78AD8206E701;
        Fri, 26 Nov 2021 20:03:30 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Fri, 26 Nov 2021 20:03:30 +0900
Received: from yuzu2.css.socionext.com (yuzu2 [172.31.9.57])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id 37D02B62E0;
        Fri, 26 Nov 2021 20:03:30 +0900 (JST)
Received: from [10.212.1.68] (unknown [10.212.1.68])
        by yuzu2.css.socionext.com (Postfix) with ESMTP id 121EF10D20;
        Fri, 26 Nov 2021 20:03:30 +0900 (JST)
Message-ID: <5729f6e6-983a-f8b2-c5f3-ff07d8f43650@socionext.com>
Date:   Fri, 26 Nov 2021 20:03:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 2/2] dt-bindings: pinctrl: add bindings for Milbeaut
 pin controller
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        orito.takao@socionext.com,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>
References: <1637834276-10466-1-git-send-email-sugaya.taichi@socionext.com>
 <1637834276-10466-3-git-send-email-sugaya.taichi@socionext.com>
 <CACRpkdbgMMKJwS0cUi3D2swHYbbBH6ofSeOhyXy6qiMFrU5a8Q@mail.gmail.com>
From:   Sugaya Taichi <sugaya.taichi@socionext.com>
In-Reply-To: <CACRpkdbgMMKJwS0cUi3D2swHYbbBH6ofSeOhyXy6qiMFrU5a8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 2021/11/26 10:14, Linus Walleij wrote:
> On Thu, Nov 25, 2021 at 10:58 AM Sugaya Taichi
> <sugaya.taichi@socionext.com> wrote:
> 
>> Add Device Tree bindings documentation for pin controller of
>> the Milbeaut SoCs.
>>
>> Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
> 
> What is weird about this binding is what is not there:
> this is just GPIO, where are the pin mux and config
> nodes? The driver surely tries to use them.
> 
> Please use the existing standard bindings for functions
> and groups etc, check the other bindings.
> 
> Yours,
> Linus Walleij
> 

Thank you for comments.

I realized this is just GPIO by your comment.
OK I check them more.

Thanks,
Taichi Sugaya

>> ---
>>   .../pinctrl/socionext,milbeaut-pinctrl.yaml        | 51 ++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml
>> new file mode 100644
>> index 0000000..78bc2d4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/socionext,milbeaut-pinctrl.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/socionext,milbeaut-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Milbeaut SoCs pin controller
>> +
>> +maintainers:
>> +  - Taichi Sugaya <sugaya.taichi@socionext.com>
>> +
>> +description: |
>> +  Bindings for memory-mapped pin controller of the Milbeaut SoCs.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "pinctrl"
>> +
>> +  compatible:
>> +    enum:
>> +      - socionext,milbeaut-m10v-pinctrl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reg-names:
>> +    const: "pinctrl"
>> +
>> +  gpio-controller: true
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - gpio-controller
>> +  - "#gpio-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pinctrl: pinctrl@1d022000 {
>> +        compatible = "socionext,milbeaut-m10v-pinctrl";
>> +        reg = <0x1d022000 0x1000>;
>> +        reg-names = "pinctrl";
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +    };
>> --
>> 2.7.4
>>
