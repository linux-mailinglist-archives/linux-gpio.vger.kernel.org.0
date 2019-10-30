Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7234FE9995
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 10:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfJ3JzS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 05:55:18 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42193 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfJ3JzS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 05:55:18 -0400
Received: by mail-wr1-f67.google.com with SMTP id a15so1520241wrf.9
        for <linux-gpio@vger.kernel.org>; Wed, 30 Oct 2019 02:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hs0Xj3TpOFo7Xi2C92NXMI0mClPmgg9hIzDJgVyM7dI=;
        b=GOMrdPbtza7bahmXFnK8BFCvQpxJK0EQx9lvmMYCWiUB8A+wjb7ykcc+ZmPoJ8CvTM
         jbyq/wUOW8NOvHiKNVmSnOYslZCf5BVbXBM+9pgUmRnmYbWAJ63oxlKbgAIbtYO6bvz8
         m/OtQlCrNANBMhVXthUDHMx4y0ZR3qqXBkI/C5auNKC2tYlJ10Qfxk4M12PXQExMxYb+
         QWWWervwvAlSmyLn037zf39ucwHSn8ESM+PcaORjBd6NWlYu0Q7I1q9gkWYPO5+X19Ip
         OSwsj3JqkQxj4M4epdlGZ/m8HpkLhowk+0Reki9OuLANr649y8RLZyGnq1wGz0de2K0q
         ZJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hs0Xj3TpOFo7Xi2C92NXMI0mClPmgg9hIzDJgVyM7dI=;
        b=HrVdgWMdw0BtPbOVk/i9Z2V9TxSCgm8Cz6yi2KVkjQTQeVnkMeuwNPF+R1v7UgL8OG
         YgiA5YAJQXcyZ8cApQALEjR2PY2+EIApK9nVARApycQI4UUExh0Fk0zCQwSpFCq7CqZe
         aRHs0hDMutRRLVbGFlOOd57Trj4yytwcCXy+oycoBWbmxY+tyTGbVNlU0UvNp/KPVq4l
         Z1iwCzIrG8ONYNLg2/pWkZ2/E9odqJBn1YAUUHdClm2ILUqwPUBIiMEAHZpCDFJ6SClF
         S0dsEL/ICqRHBzMI/1nMyyTk2naRB2cY2V0aamwZUdn/D0m9M06F2RQN4swbWHLqbvnU
         oiBA==
X-Gm-Message-State: APjAAAWZMoAGhepYJnoEHrL8KiTRwohKiXFoccbe2BFXUV6/MNG1ngM4
        q9gRqW9phOz10lF7eC3cyRuqx0Z/yPg=
X-Google-Smtp-Source: APXvYqyEXL1nWX9W5G1Oh1yg4gjs2XsDhJV/J4RZbb5xTf2TxaEp1juTXqmwC1y55FdaXSwMim9fMQ==
X-Received: by 2002:a5d:4491:: with SMTP id j17mr9057873wrq.46.1572429314643;
        Wed, 30 Oct 2019 02:55:14 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id g5sm1675086wmg.12.2019.10.30.02.55.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 02:55:13 -0700 (PDT)
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
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7811be04-dfda-5953-110c-bca685fdcaa4@linaro.org>
Date:   Wed, 30 Oct 2019 09:55:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 29/10/2019 20:47, Rob Herring wrote:
> On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
>>> Its Phandle.
>>>
>>> something like this is okay?
>>>
>>> slim-ifc-dev:
>>>     $ref: '/schemas/types.yaml#/definitions/phandle-array'
>>
>> Sorry this should not be an array, so something like this:
>>
>>     slim-ifc-dev:
>>       description: SLIMBus Interface device phandle
> 
> You're just spelling out the abbreviated name. I can do that much.
> What is 'SLIMBus Interface device'?

Each SLIMBus Component contains one Interface Device. Which is 
responsible for Monitoring and reporting the status of component, Data 
line to Data pin connection setup for SLIMBus streaming. Interface 
device is enumerated just like any other slim device.

We already have exactly same bindings for WCD9335 in upstream at:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt?h=v5.4-rc5#n42

> 
> Is it a standard SLIMBus property? If so, document it in the right
> place. If not, then needs a vendor prefix.

"SLIMBus Interface Device" itself is documented in SLIMBus Specification.

If I remember it correctly You suggested me to move to "slim-ifc-dev" 
as this is part of SLIMBus Specification.

Thanks,
srini


> 
>>       $ref: '/schemas/types.yaml#/definitions/phandle'
>>
>>
>>>     description: SLIMBus Interface device phandle
