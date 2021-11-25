Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD7F545DA13
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Nov 2021 13:30:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352974AbhKYMdj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Nov 2021 07:33:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352866AbhKYMbf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Nov 2021 07:31:35 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4822CC061756;
        Thu, 25 Nov 2021 04:28:24 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id e11so12111186ljo.13;
        Thu, 25 Nov 2021 04:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=h4zpnY29V2vfxgbVPVCQbgZupqEMTi1kTAtyT5HWSkQ=;
        b=aRaz+wIjNQMc+9ry0ykaS4nSCmIvUnvcCQz4gLJbFCU9c10THV+EBOnCkJNqqxWD9Q
         4TT0TX9MrUasE54+KLWHbcWeXTREyedFFJBVJYR1yDda8nSfrNzf1A6Zy7wanpJxDwf7
         PPAGx9AtvWIRcBMcMJ6vWmJFkKSTS1hNlWTDSx+1cQk0+iDu761vYXpzgxtl5HayKJ2O
         Ku0/Dtsb49AipVNZv+x005sCsYkocWIlxlWOT3XM3nVeYe/0xKf4ELAbQpAaOVaQCvR2
         pus0ZhFC310bTATrsGu4BoZlFGEstzNuq0qSS46gs1c3tIoAX3cwvpyyUNChtIPNtpsn
         gCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=h4zpnY29V2vfxgbVPVCQbgZupqEMTi1kTAtyT5HWSkQ=;
        b=FJSIGSrSSU0LIJsLzWqSm8DZfbz3jMspBZRmae6bEyzpdnU+PcUWSG+WEhxwC4Jpy0
         7vu1Jqhrnin7dbFwK1N26exBsiw1l9hkYR4+jmo0Gd26vyeUmoYZxX9MGGbT5freRIUp
         iRha2ZjO8G7oFhy62Ynk++8quFse8xZOKNuZke5d273f5HvkKn3r2DVPhten/PTeJ1u3
         vHb5pbVxS4oH0Z6m0KM/s6yHGUy8VwxEmMfw54IFJumOXICASLQHJ+MuCBT3hpCc30lR
         73ShhvfBdFtb9CD9PslPjMyLOr7+tcxtA5ajMbnj5JRsg4kuE9n0BBydhWl3R3avmU9W
         3c5w==
X-Gm-Message-State: AOAM531tvR+tgpoYbDvoroL0nJMk7qT3sJROI/lmw3T7jdWCpZSs5kjF
        RX2fVpfYF0nQ4rgnzWrssI8zHgLHaSY=
X-Google-Smtp-Source: ABdhPJzWuR0H3frAXxiTdeQeIL7lMlX7wJPjM+8OCv99+1KeTfq3ae7JKS8kuY/jF6eL66wR54YUNg==
X-Received: by 2002:a2e:918e:: with SMTP id f14mr23591820ljg.109.1637843302525;
        Thu, 25 Nov 2021 04:28:22 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id x133sm292329lff.290.2021.11.25.04.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 04:28:22 -0800 (PST)
Message-ID: <3acea66e-c5e1-ff6c-aedb-d9ee61dcf8ab@gmail.com>
Date:   Thu, 25 Nov 2021 13:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH V2 1/6] dt-bindings: pinctrl: support specifying pins,
 groups & functions
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211124230439.17531-1-zajec5@gmail.com>
 <20211124230439.17531-2-zajec5@gmail.com> <YZ9OAC/swfCbBXFt@atomide.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <YZ9OAC/swfCbBXFt@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 25.11.2021 09:49, Tony Lindgren wrote:
> * Rafał Miłecki <zajec5@gmail.com> [211124 23:05]:
>> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
>> @@ -42,4 +42,44 @@ properties:
>>         This property can be set either globally for the pin controller or in
>>         child nodes for individual pin group control.
>>   
>> +  pins:
>> +    type: object
>> +
>> +    patternProperties:
>> +      "^.*$":
>> +        type: object
>> +
>> +        properties:
>> +          number:
>> +            description: Pin number
>> +            $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +        additionalProperties: false
> 
> Please don't introduce Linux kernel internal numbering here. It's
> like bringing back the interrupt numbers again.

This is a new bit to me and the reason why I got this binding that way.

I had no idea pin numbering is system specific thing. I always thought
pin numbers are present in every chip datasheets and that is just a part
of hardware.

Now I'm reading https://www.kernel.org/doc/Documentation/pinctrl.txt
again it indeed seems to mention that numbering is handled in a way not
related to specs: "I enumerated the pins from 0 in the upper left corner
to 63 in the lower right corner.".

Sorry for that, I hopefully understand your point correctly now.


> Just make this into
> a proper hardware offset from the controller base, so a reg property.
> Sure in some cases the reg property is just an index depending on
> the controller, we don't really care from the binding point of view.
> 
> We already have #pinctrl-cells, so plase do something like the four
> ximaginary examples below:
> 
> 	#pinctrl-cells = <1>;
> 	...
> 	pin@foo {
> 		reg = <0xf00 MUX_MODE0>;
> 		label = "foo_pin";
> 	};
> 
> 
> 	#pinctrl-cells = <2>;
> 	...
> 	pin@foo {
> 		reg = <0xf00 PIN_INPUT_PULLUP MUX_MODE3>;
> 	};
> 
> 
> 	#pinctrl-cells = <2>;
> 	...
> 	pin@f00 {
> 		reg = <0xf00 DELAY_PS(0) DELAY_PS(0)>;
> 	};
> 
> 
> 	#pinctrl-cells = <3>;
> 	...
> 	pin@f00 {
> 		reg = <0xf00 MUX_MODE3 PULL_UP_STRENGTH(36) PULL_DOWN_STRENGTH(20)>;
> 	};
> 
> 
> Then let's attempt to use just standard numbers and defines for the
> values where possible. Then a group of pins is just a list of the pin
> phandles in the devicetree.

I need to ask for help on understanding that reg = <...> syntax.

(Why) do we need to put that extra info in a "reg" property? That seems
like either:
1. Pin specific info
or
2. Phandle arguments

In the first case, instead of:
	pin@f00 {
		reg = <0xf00 MUX_MODE3 PULL_UP_STRENGTH(36) PULL_DOWN_STRENGTH(20)>;
	};
I'd rather use:
	pin@f00 {
		reg = <0xf00>;
		mux_mode3;
		pull_up_strength = <36>;
		pull_down_strength = <20>;
	};

In the second case, shouldn't that be something like:
	pins {
		bar: pin@f00 {
			reg = <0xf00>;
			#pinctrl-cells = <3>;
		};
	};

	groups {
		qux {
			pins = <&bar MUX_MODE3 PULL_UP_STRENGTH(36) PULL_DOWN_STRENGTH(20)>;
		}
	};
