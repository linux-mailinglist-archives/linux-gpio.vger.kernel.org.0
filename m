Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30678F13CF
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 11:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbfKFKYe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 05:24:34 -0500
Received: from mga06.intel.com ([134.134.136.31]:26912 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727239AbfKFKYe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 Nov 2019 05:24:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Nov 2019 02:24:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; 
   d="scan'208";a="201068007"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga007.fm.intel.com with ESMTP; 06 Nov 2019 02:24:29 -0800
Received: from [10.226.38.65] (rtanwar-mobl.gar.corp.intel.com [10.226.38.65])
        by linux.intel.com (Postfix) with ESMTP id 6A8875802B9;
        Wed,  6 Nov 2019 02:24:26 -0800 (PST)
Subject: Re: [PATCH v3 2/2] dt-bindings: pinctrl: intel: Add for new SoC
To:     Rob Herring <robh@kernel.org>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
References: <cover.1572926608.git.rahul.tanwar@linux.intel.com>
 <f91001d8c5f0cb2860fda720d0cb6298a4856dd3.1572926608.git.rahul.tanwar@linux.intel.com>
 <20191105212941.GA8677@bogus>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <e7d1d72e-54d7-63ae-0eae-685a207d36ef@linux.intel.com>
Date:   Wed, 6 Nov 2019 18:24:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105212941.GA8677@bogus>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Rob,

Thanks for the feedback.

On 6/11/2019 5:29 AM, Rob Herring wrote:
>> +      bias-pull-up:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: Specifies pull-up configuration.
> Isn't this boolean?
>
>> +
>> +      bias-pull-down:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: Specifies pull-down configuration.
> And this?
>
> Though looks like sometimes it has a value? Pull strength I guess.
>
>> +
>> +      drive-strength:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: Enables driver-current.
>> +
>> +      slew-rate:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: Enables slew-rate.
>> +
>> +      drive-open-drain:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: Specifies open-drain configuration.
> boolean?
>
>> +
>> +      output-enable:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: Specifies if the pin is to be configured as output.
> boolean?
>
> But really, all of these should have a common schema defining the types 
> and only put any additional constraints here.

Yes, you are right. These are all boolean types.
All these are standard properties & we are using them with no
additional constraintsi.e conforming to how they are already
documented in pinctrl-bindings.txt. Shall ijust omit documenting
these properties here in driver bindings ?

>> +
>> +examples:
>> +  # Pinmux controller node
>> +  - |
>> +    pinctrl: pinctrl@e2880000 {
>> +          compatible = "intel,lgm-pinctrl";
>> +          reg = <0xe2880000 0x100000>;
>> +
>> +          # Client device subnode
>> +          uart0:uart0 {
> space              ^

Just to be sure, you mean space misalignment at below
line <65>; /* UART_TX0 */ ?Or is it something else ?

>> +                pins = <64>, /* UART_RX0 */
>> +                             <65>; /* UART_TX0 */
>> +                function = "CONSOLE_UART0";
>> +                pinmux = <1>,
>> +                         <1>;
>> +                groups = "CONSOLE_UART0";
>> +          };
>> +    };
>> +
>> +...
>> -- 
>> 2.11.0
>>
Regards,
Rahul
