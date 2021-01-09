Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4012F045C
	for <lists+linux-gpio@lfdr.de>; Sun, 10 Jan 2021 00:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbhAIXOR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 Jan 2021 18:14:17 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:54155 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726665AbhAIXOR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 9 Jan 2021 18:14:17 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4154E3F32C;
        Sun, 10 Jan 2021 00:13:35 +0100 (CET)
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: Add bindings for Awinic
 AW9523/AW9523B
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20210109140204.151340-1-angelogioacchino.delregno@somainline.org>
 <20210109140204.151340-3-angelogioacchino.delregno@somainline.org>
 <CACRpkdaB4ejWUzBpkYWtRC=_On0tw2H1=3beaVmnLkjncUzn_Q@mail.gmail.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <3f8e772a-4e2f-2384-e2bf-f71e393d11d6@somainline.org>
Date:   Sun, 10 Jan 2021 00:13:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdaB4ejWUzBpkYWtRC=_On0tw2H1=3beaVmnLkjncUzn_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Il 09/01/21 23:14, Linus Walleij ha scritto:
> Hi Angelo,
> 
> thanks for your patch!
> 
> On Sat, Jan 9, 2021 at 3:02 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
> 
>> +#PIN CONFIGURATION NODES
>> +patternProperties:
>> +  '^.*$':
>> +    if:
>> +      type: object
>> +    then:
>> +      properties:
>> +        pins:
>> +          description:
>> +            List of gpio pins affected by the properties specified in
>> +            this subnode.
>> +          items:
>> +            pattern: "^gpio([0-9]|1[0-5])$"
>> +          minItems: 1
>> +          maxItems: 16
>> +
>> +        function:
>> +          description:
>> +            Specify the alternative function to be configured for the
>> +            specified pins.
>> +
>> +          enum: [ gpio, pwm ]
>> +
>> +        bias-disable: true
>> +        bias-pull-down: true
>> +        bias-pull-up: true
>> +        drive-open-drain: true
>> +        drive-push-pull: true
>> +        input-enable: true
>> +        output-high: true
>> +        output-low: true
>> +
>> +      required:
>> +        - pins
>> +        - function
> 
> Is it possible to just $ref /pinctrl/pincfg-node.yaml# for some of this?
> 
Sure, I will try to reference that for V2!

> Yours,
> Linus Walleij
> 

