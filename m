Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0456E719F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 13:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389150AbfJ1Mkt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 08:40:49 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37082 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389151AbfJ1Mkt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 08:40:49 -0400
Received: by mail-wm1-f67.google.com with SMTP id q130so8976414wme.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2019 05:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w/WLt7O2taIP8YM7ktvX+R/TNl8ElnwnfMYK27iQOaI=;
        b=KztUAi13eLRxuTdBVRwh7Ha/+XqKvFTVZ7r97D5Dcn4OevqhKWCHl5VqQAcFcWPPz5
         gRWtBZn7ZtZo9GqySCYa75GMSvfkr8pVj7Sk8XLmnzpCRgGU/6ldH1Ld9miosbcfymoL
         iSHcyrDdLOW1eiDY7QIRwDy8Qag4soGDfQcrvA7p0ieaAd913vRGJ76VUyt6U6LnKvyn
         HW7aPzXto6UBTxD06JYTFN/ESAsbHhAMhbmTN6gLC5bWShWAl57tdoTJAbP6YTDQi+BM
         cMb1ytfnw0y60iLw0aUCqagyLjzXkFyHlbsM53OeHqwDEFqS8PsziTYdhshNW9FtJ+q0
         LTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w/WLt7O2taIP8YM7ktvX+R/TNl8ElnwnfMYK27iQOaI=;
        b=roi31FIB03bjhou2Ml8n21g5mgxNXkkAfsp7ZDKwHeu45fMk7rVspva6azeiCMl1OG
         9KS3gSGc2T/wnBpVtPwggapH3M5SXOHk94Lz1/aEN7eZKBsGFozg5+PuR6sFxvJ7t/PJ
         rSuJBd+u43wU3WPZo0l+WYAHUUtSuqIm6/VztCDu5wDKLyVH/ckyICg1By0sFp0PdWUI
         /TXG51B/84AxGxklWcVQ0CJavhBFAog+MW3fjpTCabKaV4L1AS6cZVJOanqOrgAFd4E2
         2Sgij2BhnZFsOC9VAQJd0QnEI6kLD4tNAP/2ohOpEVK8WDttwxBzqs6O38faaJyYyWj+
         0ZPA==
X-Gm-Message-State: APjAAAWyQMbjXCRCHIE2fiONM3ecLgMToqj12SSP3oldsIs0JlOfNzAR
        d0H7Cj2Gez0z0WnaIti4EjYpHQppHD4=
X-Google-Smtp-Source: APXvYqz4DB4lyfpP+bmW/8XijGIPT2kMEoKr8hKJwSWGlqShrMTBlem3CgCZyJMPgD0oZI0xyNDi4Q==
X-Received: by 2002:a05:600c:22c4:: with SMTP id 4mr5720906wmg.177.1572266444055;
        Mon, 28 Oct 2019 05:40:44 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id f204sm15333062wmf.32.2019.10.28.05.40.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 05:40:43 -0700 (PDT)
Subject: Re: [PATCH v2 01/11] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
To:     Rob Herring <robh@kernel.org>
Cc:     broonie@kernel.org, linus.walleij@linaro.org, lee.jones@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
 <20191025204338.GA25892@bogus>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
Date:   Mon, 28 Oct 2019 12:40:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191025204338.GA25892@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Thanks Rob for the review.

On 25/10/2019 21:43, Rob Herring wrote:
> On Fri, Oct 18, 2019 at 01:18:39AM +0100, Srinivas Kandagatla wrote:
>> This patch adds bindings for wcd9340/wcd9341 audio codec which can
>> support both SLIMbus and I2S/I2C interface.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../bindings/sound/qcom,wcd934x.yaml          | 169 ++++++++++++++++++
>>   1 file changed, 169 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
>> new file mode 100644
>> index 000000000000..299d6b96c339
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
>> @@ -0,0 +1,169 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd934x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Qualcomm WCD9340/WCD9341 Audio Codec
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
>> +  Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
>> +  It has in-built Soundwire controller, pin controller, interrupt mux and
>> +  supports both I2S/I2C and SLIMbus audio interfaces.
>> +
>> +properties:
>> +  compatible:
>> +    const: slim217,250
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    description: GPIO spec for reset line to use
>> +    maxItems: 1
>> +
>> +  slim-ifc-dev:
>> +    description: SLIMBus Interface device phandle
> 
> phandle or...
> 
Its Phandle.

something like this is okay?

slim-ifc-dev:
   $ref: '/schemas/types.yaml#/definitions/phandle-array'
   description: SLIMBus Interface device phandle



>> +    maxItems: 1
> 
> array?
> 
> Needs a type if a phandle.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: extclk
>> +
>> +  vdd-buck-supply:
>> +    description: A reference to the 1.8V buck supply
>> +
>> +  vdd-buck-sido-supply:
>> +    description: A reference to the 1.8V SIDO buck supply
>> +
>> +  vdd-rx-supply:
>> +    description: A reference to the 1.8V rx supply
>> +
>> +  vdd-tx-supply:
>> +    description: A reference to the 1.8V tx supply
>> +
>> +  vdd-vbat-supply:
>> +    description: A reference to the vbat supply
>> +
>> +  vdd-io-supply:
>> +    description: A reference to the 1.8V I/O supply
>> +
>> +  vdd-micbias-supply:
>> +    description: A reference to the micbias supply
>> +
>> +  qcom,micbias1-millivolt:
> 
> The standard unit is '-microvolt'
> 
>> +    description: Voltage betwee 1800mv-2850mv for micbias1 output
> 
> typo...
> 
Yep, will fix this and also move to standard unit microvolt

> Sounds like constraints.
> 
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
> 
> With standard units, you can drop the type.
> 
>> +
>> +  qcom,micbias2-millivolt:
>> +    description: Voltage betwee 1800mv-2850mv for micbias2 output
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  qcom,micbias3-millivolt:
>> +    description: Voltage betwee 1800mv-2850mv for micbias3 output
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  qcom,micbias4-millivolt:
>> +    description: Voltage betwee 1800mv-2850mv for micbias4 output
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  clock-output-names:
>> +    const: mclk
>> +
>> +  clock-frequency:
>> +    description: Clock frequency of output clk in Hz
>> +
>> +  interrupt-controller: true
>> +
>> +  '#interrupt-cells':
>> +    const: 1
>> +
>> +  '#clock-cells':
>> +    const: 0
>> +
>> +  '#sound-dai-cells':
>> +    const: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
>> +    type: object
>> +    description: |
>> +      WCD934x subnode for each slave devices. Bindings of each subnodes
>> +      depends on the specific driver providing the functionality and
>> +      documented in there respective bindings.
> 
> s/there/their/

will fix this in next version!

thanks,
srini
