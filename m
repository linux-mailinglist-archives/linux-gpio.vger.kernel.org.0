Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DAA2627B6C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Nov 2022 12:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236454AbiKNLDt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Nov 2022 06:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236537AbiKNLDr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Nov 2022 06:03:47 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA82F25E3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 03:03:46 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b9so12667110ljr.5
        for <linux-gpio@vger.kernel.org>; Mon, 14 Nov 2022 03:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WrNB6Xj9+aEQvoTkZNUDKBCvNF5d4Z6XoTEhpJTodog=;
        b=x+H9nqpb/dFL2yTX9FmUIZY4TKf+K85BBWalHgPhAE2f++4PE4DbguLfkbuUpeGzLS
         csDSZU0Zat7b8eN+DnkLR2cCclirECVDLj4qbuen4tfFW2FtOCYZWDMVjRCTaD4eT31e
         18gh9Ip/SdC/TB8MsHz58UQr2an6CtvXVbwL8AdMu0TmsuCOz/MTKBaS8V0W9AU8Ibq6
         UuDFGgYMRPw87Ghfjr6rST8UYt9LxqzglPqXCiys6zrJPKX8/SuR+KvCzP3JAwb0SMxN
         EbYcGcXNHmX4ipk3umf58LXw/dUoWiDwhkSS7oS2Xi/ugtNNXLkCYlR6WigJhf09UsH5
         XdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrNB6Xj9+aEQvoTkZNUDKBCvNF5d4Z6XoTEhpJTodog=;
        b=abmZBtNO2858FLfrJ9maCT6cXQGZsVyZn+qUAmLHrDWDMw3cvxkHGvFu/nIxMpsjOR
         GVXw/K+MSadTgPc+S+YWeGSIHWhwij42NoQBXuckogA+o+Qj9XeYLy1IRN+i+j93A7if
         fG+OfAu418Ohkeoh+RjtvRdYX02AfZlxWctSCUltf0z3q0HKhOSThFrIvCioFYCAhYMK
         1PSr/AZRj80rcXK5kcoUR7FHepWyczydsZx6JqQrhQ7xUUJlYSKuMf8l/obtrNyyAk9E
         050Aq85dRyC1U93wwwBVA8/yxU8NugweW1yX79MnofOntXX2vN5UAn9hViMaLRDtg+Im
         jYOw==
X-Gm-Message-State: ANoB5pnnyV/5jahryTITvHCCwNcS+vbv5a4AXlqQ+6nKUvJRLLz8zT6H
        akQJ62724vOGQgjY0E0lvVV0jA==
X-Google-Smtp-Source: AA0mqf4vkOIsrcAzzQ/7IUWD24AGi4w3840gw/J6v3r7MSt2tQudjclNxCaplpbjz4FXUNH1CmHi4w==
X-Received: by 2002:a2e:9048:0:b0:278:a696:2781 with SMTP id n8-20020a2e9048000000b00278a6962781mr3788105ljg.401.1668423825163;
        Mon, 14 Nov 2022 03:03:45 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l10-20020a056512110a00b00494813c689dsm1777243lfg.219.2022.11.14.03.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 03:03:44 -0800 (PST)
Message-ID: <c7d73b1e-053f-21a7-4f4d-632742b4761c@linaro.org>
Date:   Mon, 14 Nov 2022 12:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 11/12] dt-bindings: sound: Add Cirrus Logic CS48L31/32/33
 codecs
Content-Language: en-US
To:     Richard Fitzgerald <rf@opensource.cirrus.com>, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linus.walleij@linaro.org, broonie@kernel.org, tglx@linutronix.de,
        maz@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-12-rf@opensource.cirrus.com>
 <5f012334-1815-2ef6-7dc0-08b4d60f754f@linaro.org>
 <8bd6b864-ca58-022d-220d-328121f7e7dd@opensource.cirrus.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8bd6b864-ca58-022d-220d-328121f7e7dd@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 14/11/2022 12:00, Richard Fitzgerald wrote:
> On 14/11/2022 08:45, Krzysztof Kozlowski wrote:
>> On 09/11/2022 17:53, Richard Fitzgerald wrote:
>>> Codecs in this family have multiple digital and analog audio I/O that
>>> support a variety of external hardware connections and configurations.
>>>
>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>> ---
>>>   .../bindings/sound/cirrus,cs48l32.yaml        | 96 +++++++++++++++++++
>>>   include/dt-bindings/sound/cs48l32.h           | 25 +++++
>>>   2 files changed, 121 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
>>>   create mode 100644 include/dt-bindings/sound/cs48l32.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
>>> new file mode 100644
>>> index 000000000000..70fb294c6dc1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
>>> @@ -0,0 +1,96 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/cirrus,cs48l32.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Cirrus Logic CS48L31/32/33 audio CODECs
>>> +
>>> +maintainers:
>>> +  - patches@opensource.cirrus.com
>>> +
>>> +description: |
>>> +  This describes audio configuration bindings for these codecs.
>>
>> Don't start with "This". Instead describe the hardware.
>>
>>> +
>>> +  See also the core bindings for the parent MFD driver:
>>> +
>>> +    Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml
>>
>> Same comment as for pinctrl patch.
>>
>>> +
>>> +  and defines for values used in these bindings:
>>> +
>>> +    include/dt-bindings/sound/cs48l32.h
>>> +
>>> +  The properties are all contained in the parent MFD node.
>>> +
>>> +properties:
>>
>> Missing compatible. What's the point to organize bindings like that? The
>> schema on its own does nothing - does not match anything.
> 
> Do you mean child drivers should not share the MFD node? Or do you mean
> that if they share the MFD node all the child driver bindings should be
> documented in the MFD schema instead of having a sub-schema for each
> class of hardware functionality?

I mean, that regular binding has a compatible which allows the schema to
be matched.

Splitting parts from top-level properties is used only for re-usable
shared/common schemas, which does not seem the case here.

> 
> I'm certainly willing to collapse all the bindings into a single MFD
> schema yaml. For this driver we followed the same structure that was
> accepted for madera (and there was some discussion when we upstreamed
> madera about how the bindings should be organized which resulted in
> them being changed). We pretty much assumed that the safe bet was to do
> the same that was accepted by the maintainer last time around.

Just merge it with MFD binding.

Best regards,
Krzysztof

