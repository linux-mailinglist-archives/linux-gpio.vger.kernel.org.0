Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C11BFAA07
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 07:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725858AbfKMGFs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 01:05:48 -0500
Received: from mga06.intel.com ([134.134.136.31]:28500 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbfKMGFs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 13 Nov 2019 01:05:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Nov 2019 22:05:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,299,1569308400"; 
   d="scan'208";a="287782908"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP; 12 Nov 2019 22:05:46 -0800
Received: from [10.226.38.118] (rtanwar-mobl.gar.corp.intel.com [10.226.38.118])
        by linux.intel.com (Postfix) with ESMTP id C79F9580372;
        Tue, 12 Nov 2019 22:05:44 -0800 (PST)
Subject: Re: [PATCH v6 2/2] dt-bindings: pinctrl: intel: Add for new SoC
To:     Rob Herring <robh@kernel.org>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andriy.shevchenko@intel.com,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
References: <cover.1573455324.git.rahul.tanwar@linux.intel.com>
 <96537f8702501a45501d5a59ca029f92e36a9e4a.1573455324.git.rahul.tanwar@linux.intel.com>
 <20191112191432.GA19579@bogus>
From:   "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Message-ID: <5ee8920d-582e-176f-6681-79c0122274fb@linux.intel.com>
Date:   Wed, 13 Nov 2019 14:05:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191112191432.GA19579@bogus>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Rob,

Thanks for feedback.

On 13/11/2019 3:14 AM, Rob Herring wrote:
> On Mon, Nov 11, 2019 at 06:11:30PM +0800, Rahul Tanwar wrote:
>> Add dt bindings document for pinmux & GPIO controller driver of
>> Intel Lightning Mountain SoC.
>>
>> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
>> ---
>>  .../bindings/pinctrl/intel,lgm-pinctrl.yaml        | 98 ++++++++++++++++++++++
>>  1 file changed, 98 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..d54a3bda1f4f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-pinctrl.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
> For new bindings:
>
> # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

Well noted.

>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bindings/pinctrl/intel,lgm-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Intel Lightning Mountain SoC pinmux & GPIO controller binding
>> +
>> +maintainers:
>> +  - Rahul Tanwar <rahul.tanwar@linux.intel.com>
>> +
>> +description: |
>> +  Pinmux & GPIO controller controls pin multiplexing & configuration including
>> +  GPIO function selection & GPIO attributes configuration.
>> +
>> +  Please refer to [1] for details of the common pinctrl bindings used by the
>> +  client devices.
>> +
>> +  [1] Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
>> +
>> +properties:
>> +  compatible:
>> +    const: intel,lgm-pinctrl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +# Client device subnode's properties
>> +patternProperties:
>> +  '-pins$':
>> +    type: object
>> +    description:
>> +      Pinctrl node's client devices use subnodes for desired pin configuration.
>> +      Client device subnodes use below standard properties.
>> +
>> +    properties:
>> +      function:
>> +        $ref: /schemas/types.yaml#/definitions/string
>> +        description:
>> +          A string containing the name of the function to mux to the group.
> Possible strings should be listed out here.

Possible number of strings here is a huge number. I agree that it makes
sense to list out the possible strings here but when the possible strings
are huge, can we just omit specifying all of the strings ? I see many
examples here where they only specify the string in examples.

>> +
>> +      groups:
>> +        $ref: /schemas/types.yaml#/definitions/string-array
>> +        description:
>> +          An array of strings identifying the list of groups.
> Possible strings should be listed out here.

Same point for groups. Too many strings to list out here.

>> +
>> +      pins:
>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>> +        description:
>> +          List of pins to select with this function.
>> +
>> +      pinmux:
>> +        description: The applicable mux group.
>> +        allOf:
>> +          - $ref: "/schemas/types.yaml#/definitions/uint32-array"
>> +
>> +      bias-pull-up:
>> +        type: boolean
>> +      bias-pull-down:
>> +        type: boolean
>> +      drive-strength:
>> +        type: boolean
> Not a boolean. Need to define possible values.

Agree. My mistake. Will fix it on v7.

>> +      slew-rate:
>> +        type: boolean
> Not a boolean. Need to define possible values.

In our case, 0 here means slow slew & 1 means fast slew. There are no other
possible values. Probably, i can add it in description while keeping data
type as boolean.

>> +      drive-open-drain:
>> +        type: boolean
>> +      output-enable:
>> +        type: boolean
>> +
>> +    required:
>> +      - function
>> +      - groups
> For the -pins nodes too:
>
>        additionalProperties: false

Well noted.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  # Pinmux controller node
>> +  - |
>> +    pinctrl: pinctrl@e2880000 {
>> +          compatible = "intel,lgm-pinctrl";
>> +          reg = <0xe2880000 0x100000>;
>> +
>> +          # Client device subnode
>> +          uart0-pins: uart0 {
> This fails 'make dt_binding_check'. Please fix and run that.

Will run & fix it in v7. Thanks.

Regards,
Rahul


