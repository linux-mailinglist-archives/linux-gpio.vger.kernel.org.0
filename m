Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC74EF1D28
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2019 19:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732465AbfKFSJr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Nov 2019 13:09:47 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55141 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729957AbfKFSJr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Nov 2019 13:09:47 -0500
Received: by mail-wm1-f65.google.com with SMTP id z26so4770465wmi.4
        for <linux-gpio@vger.kernel.org>; Wed, 06 Nov 2019 10:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rgJXsUBNZa/F0SLsO+it3k7f9qVrt3VaEEsEU5U0WF4=;
        b=deTo+90lJ6be7HHxTg00sHjXhZ3BCSqrIZB22Zr4Ih0eXfNoJ6Gwt/RbEw5gQSjgIg
         qidpwKs5uRX2/lu5DRzqXig8ftmUi03AhVaEYUpWJ0jjW9auDFhXL1SkjGYGBmto2pb8
         veFrOCGDVpD9USl2jXCi2MXpsVt0aBgUqTgiEF6etTbJSDsHDbDcWFVFy6vonpSHsMI7
         L2D0mmBoCGDPshPuZzY4p7VQhtH6IXIpaaGTfk6LPUmiJgvxFMYwzdxm8qdcFIcjlA9c
         b7kkPdCm7cyF1fB5SXXtiruwEQBPAIdGxrexuet+sitv4fmBS9v4vcbQa8fKE9swANAS
         tp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rgJXsUBNZa/F0SLsO+it3k7f9qVrt3VaEEsEU5U0WF4=;
        b=EpKi73TrdJUGZH/zeqqPuX6hhXAI2dcbXhH1A7BOSBGt+5WzaSKt9onsfB5xoXns0N
         NWInFzopHd4OBHTNlGnVDO6MHepSiVBzDaX421PQKveLTCX5pIGWckqtKUGoRqcO1jyP
         k1yEaOWnQupFUDIwLgqZEjxHgjSlHd/Pjy4wvl9qMmKlBxtfG8jv32dq7Mf3mC5OY9Xg
         d+s9ARan4iNTUFJpggz6lQ4hcZuHd7KrkDjnAe7PC1WVe0KPIIhcbsuvxKrt6GKor1z6
         seocX6LfXTmU/Qhavnle9TmfHyN2t4/snKVS2HiLazVPJ67O5lh9ueJIFNdzPeYeJBW8
         GKJw==
X-Gm-Message-State: APjAAAW7eHcFS5RVzsgTwYkJuG2h3UrLSHcU4TD4rACKtjtaihyOWqAj
        bVRD/RDVLoIXwwdG6Rpsg0yT20DbdiI=
X-Google-Smtp-Source: APXvYqwuEOoV5aCzLlGkVZlVwso0Ano0flwVy5rE6QbRo8vNmNb2jFk7drTtQSJedQIw1NCPZ+6geA==
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr3948924wmc.164.1573063784694;
        Wed, 06 Nov 2019 10:09:44 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id r19sm29208269wrr.47.2019.11.06.10.09.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2019 10:09:43 -0800 (PST)
Subject: Re: [PATCH v2 01/11] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Vinod Koul <vinod.koul@linaro.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        spapothi@codeaurora.org, Banajit Goswami <bgoswami@codeaurora.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
 <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
 <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
 <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
 <7811be04-dfda-5953-110c-bca685fdcaa4@linaro.org>
 <CAL_JsqJNcXe7YSUjHWyFO_czncnR3y7w3NP8ofXfCiXpMrqzRw@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b3d078a1-f87d-c146-bdf7-7a6b30547bd5@linaro.org>
Date:   Wed, 6 Nov 2019 18:09:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJNcXe7YSUjHWyFO_czncnR3y7w3NP8ofXfCiXpMrqzRw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 05/11/2019 19:08, Rob Herring wrote:
> On Wed, Oct 30, 2019 at 4:55 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 29/10/2019 20:47, Rob Herring wrote:
>>> On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
>>> <srinivas.kandagatla@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
>>>>> Its Phandle.
>>>>>
>>>>> something like this is okay?
>>>>>
>>>>> slim-ifc-dev:
>>>>>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
>>>>
>>>> Sorry this should not be an array, so something like this:
>>>>
>>>>      slim-ifc-dev:
>>>>        description: SLIMBus Interface device phandle
>>>
>>> You're just spelling out the abbreviated name. I can do that much.
>>> What is 'SLIMBus Interface device'?
>>
>> Each SLIMBus Component contains one Interface Device. Which is
>> responsible for Monitoring and reporting the status of component, Data
>> line to Data pin connection setup for SLIMBus streaming. Interface
>> device is enumerated just like any other slim device.
> 
> So a standard set of registers every slimbus device has? In hindsight,
> I would have made reg have 2 entries with both addresses. I guess that
> ship has sailed.

That will break SLIMBus bindings, Which is expecting one device per 
device node.

> 
> It seems strange you would need both "devices" described as separate
> nodes in DT.

Because they are two different devices on the SLIMBus Component.

> 
>>
>> We already have exactly same bindings for WCD9335 in upstream at:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt?h=v5.4-rc5#n42
>>
>>>
>>> Is it a standard SLIMBus property? If so, document it in the right
>>> place. If not, then needs a vendor prefix.
>>
>> "SLIMBus Interface Device" itself is documented in SLIMBus Specification.
>>
>> If I remember it correctly You suggested me to move to "slim-ifc-dev"
>> as this is part of SLIMBus Specification.
> 
> Probably so. If it is common, then document it in bindings/slimbus/bus.txt.
>
As we are dealing with audio codecs here, it might be that 
"slim-ifc-dev" is common across wcd9335 and wcd934x but not all devices 
on the SLIMBus Component would need handle to interface device. SLIMbus 
can also be used for control buses as well which might not need this.


> Then here, 'slim-ifc-dev: true' is sufficient. You can just assume we
> convert bus.txt to schema (or feel free to do that :) ).

We need phandle to the interface device so that we can program the 
streaming parameters for the SLIMBus Component.


--srini


> 
> Rob
> 
