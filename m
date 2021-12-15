Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8E1E4765FA
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Dec 2021 23:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbhLOWfF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 17:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbhLOWfF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 17:35:05 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8E09C061574;
        Wed, 15 Dec 2021 14:35:04 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id b19so33753410ljr.12;
        Wed, 15 Dec 2021 14:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=B+/8bjTUUb+/Fn//dn2pyAEEUa0LwW4iCF5ahtOf/lE=;
        b=AjzyQcXiEfiPKbwoXKQ3r8WMyW/0o0gT6yol+GMNPbjSs2FmenbMl/QFy0eIVtydOi
         acwl5hIr6GB6iu8ySopgKZoPe8nntzxx0AweAqZpNDUSdMWjCAwBoE2DTJEwn3T1Rlns
         AIZb47xmpL+FN0h7YKaw/gDpjNH5iJ0Nv2pEg4R4x1KOL/+sT2+cRC+8SxOaQq2uQH25
         oPIX95XV/DcKYbAR16CuX0jrAD9zeR0rWeTomQXclxABAQ3ruTwEu2LV6KhxJrvNwLu/
         I+q+sEO8IJADtZjs6cfKl8axZFEH0RAzbnXO2lEiMMYZLZVg7tJf8lhrFIrrWn/GabrB
         f9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=B+/8bjTUUb+/Fn//dn2pyAEEUa0LwW4iCF5ahtOf/lE=;
        b=UFXk9Vg9zPw7FJUI05gVC//gxNCJK8IS0AvV1QHtAnPsjjooSq3+TAxMxaVGh8qZqS
         SozrMLD1ShYByvvhb3GrSFTpKqQMxPn1qvsc4PLqqX0TQhZVVdjit12m61L8HYX6czsW
         gIp3sJmPEsSC3ppeDagM+ReGuuCkTWaWdz+S8hPzPm7AbJC352Dz1MOFctg++x7FREUk
         kON/z2zkcxXWsnYkv7p+ZNn7UT8eWi0KinLCLaF/RiD1Q3pXN7MfaH7SQc0AoNOiDKoL
         7dUTCCXkkE85ORwTZIf2xV8DVV/JBK5oef1PwwTiEZ61gkCt0Pm/+lMPdf2l0qkO0A3S
         tpyA==
X-Gm-Message-State: AOAM5324rufrYxnLdRnZ9k0ZH4hektMKlthyhl5Q1HTAND0bUlMP3auN
        LHAzAQzvxz0DuIkHKzvoP0c=
X-Google-Smtp-Source: ABdhPJwsz3FdD/Gr/SfvgGD3H91hSFlJod6yZ6Y+otn16TT923Jda80hduw/Kdt0kcynL8EyBxCumA==
X-Received: by 2002:a2e:9c8:: with SMTP id 191mr13487617ljj.262.1639607703161;
        Wed, 15 Dec 2021 14:35:03 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id u7sm708716lja.58.2021.12.15.14.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 14:35:02 -0800 (PST)
Message-ID: <e97e3795-b468-8334-7c12-bfd52e22f363@gmail.com>
Date:   Wed, 15 Dec 2021 23:35:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add binding for BCM4908 pinctrl
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20211215204753.5956-1-zajec5@gmail.com>
 <1639607248.075072.1954724.nullmailer@robh.at.kernel.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <1639607248.075072.1954724.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

On 15.12.2021 23:27, Rob Herring wrote:
> On Wed, 15 Dec 2021 21:47:52 +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> It's hardware block that is part of every SoC from BCM4908 family.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   .../pinctrl/brcm,bcm4908-pinctrl.yaml         | 72 +++++++++++++++++++
>>   MAINTAINERS                                   |  7 ++
>>   2 files changed, 79 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl.yaml'
> xargs: dt-doc-validate: exited with status 255; aborting
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.example.dt.yaml'
> Unknown file referenced: [Errno 2] No such file or directory: '/usr/local/lib/python3.8/dist-packages/dtschema/schemas/pinctrl/pinctrl.yaml'
> make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.example.dt.yaml] Error 255
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1413: dt_binding_check] Error 2

this patch targets Linus's git tree:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=for-next

Above tree contains 896568e5b9c8 ("dt-bindings: pinctrl: convert
controller description to the json-schema") which provides pinctrl.yaml.
