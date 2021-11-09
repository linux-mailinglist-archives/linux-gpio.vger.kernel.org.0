Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A288E44AE57
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 14:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239353AbhKINHN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 08:07:13 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:54456
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239314AbhKINHL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 08:07:11 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9593F3F1B8
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 13:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636463064;
        bh=2z2NwvSe6pbSG5kNNw29eMx53Iup6V00jrvNyErV2mE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=oQzMfY1O2Uz/81RkOpqyzvDEI9byM73TqP12Ol+u+emwUpLNmcSAOjdgz+muVyCUQ
         S1w8NbeXoHkFg7TLaYs0PkmCEiiyaNzCEsi9R0+fJeB+3yW18Lai8xUPXMcHSlrbEb
         w6mn0VvXHTIleMptnJFZjYQc8nPa/YLcGdhyUKX1mq5bxanYe3l/v0UvaclXMqkIgG
         SKuaM9omNc5ZOmNS4IViIZEMCgRJER5sCqLka76mmXnEZdIuQ+6XX7/LXzU/tew/2M
         1gY6olEBjrxmL4bKAVW+4yYKQbjLU094xtZzkjYOQ6hKxJ64ttmMsg5sIqAWj7Hact
         V+G9KuIgWjNoQ==
Received: by mail-lj1-f199.google.com with SMTP id h22-20020a2e6c16000000b00218cfa85ff6so1331517ljc.4
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 05:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2z2NwvSe6pbSG5kNNw29eMx53Iup6V00jrvNyErV2mE=;
        b=RadLyTHwSSf+u4KlKQExnDY7bC8On6Yq6LYqGbwm8fMzr97eMqbI6GFDzsawZMTc2B
         EkUuHn7RUI302H3o0vdeqxPUJ8KW7cVRihvZms3mQv0XRqSE8OUgWdsvzrlMMnOKayG+
         LN55WCMv8ErSUj6UxuY7karHWIS/IjRJcbf+Nt1MxkCbQTfNqm0ThZoUEw6y0+IwTle7
         RATGnm/hljyilI8pEEIFkVGXNm8kCmt+zI+LIixGUn+3A0jF0004CsCE3QCJmB7s3oTL
         5XxKew/y7Qu/tqmTH8JtPFmZAk8aXuQAuwaz1o0JSqlGyQ+UxgrltgxpdtGhIQ6q18/n
         XgAg==
X-Gm-Message-State: AOAM533zgVuogfdyHN1wQRuh2W47BXobWKR9nL3z7VsxjHXN9XlLiE9l
        VbI0iYQPjoruhTUQuaL8JaMl2QRzksWOZvYZqbgtdW3EcHSQWsAtN7EV2AIL/YLMrmzGK5lBK+O
        0lgAYtg8nM9EvmSgmuDUL1mjzxIRrHB+1O+ZCfao=
X-Received: by 2002:a19:f10a:: with SMTP id p10mr6630543lfh.487.1636463063950;
        Tue, 09 Nov 2021 05:04:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGfpAHgwdqfMj0s/66s42howwCx2sXSklpMlY9GdmuaJ26SPoUGcHRWzMdDHEWP4UUsor7zg==
X-Received: by 2002:a19:f10a:: with SMTP id p10mr6630507lfh.487.1636463063757;
        Tue, 09 Nov 2021 05:04:23 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bq3sm2139606lfb.173.2021.11.09.05.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 05:04:15 -0800 (PST)
Message-ID: <cd789074-53a0-72c1-76f0-b2b86a434247@canonical.com>
Date:   Tue, 9 Nov 2021 14:04:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 10/13] dt-bindings: spi: add bindings for microchip mpfs
 spi
Content-Language: en-US
To:     Conor.Dooley@microchip.com, robh@kernel.org
Cc:     robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linus.walleij@linaro.org, linux-riscv@lists.infradead.org,
        aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        linux-usb@vger.kernel.org, Daire.McNamara@microchip.com,
        linux-spi@vger.kernel.org, geert@linux-m68k.org,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-gpio@vger.kernel.org, broonie@kernel.org, palmer@dabbelt.com,
        bgolaszewski@baylibre.com, jassisinghbrar@gmail.com,
        linux-crypto@vger.kernel.org, Ivan.Griffin@microchip.com,
        atish.patra@wdc.com, Lewis.Hanly@microchip.com,
        bin.meng@windriver.com, alexandre.belloni@bootlin.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        a.zummo@towertech.it
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-11-conor.dooley@microchip.com>
 <1636430789.935637.743042.nullmailer@robh.at.kernel.org>
 <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
 <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
 <bd26a633-7c71-b00b-00c3-54688ee42297@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <bd26a633-7c71-b00b-00c3-54688ee42297@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2021 13:58, Conor.Dooley@microchip.com wrote:
> On 09/11/2021 12:53, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 09/11/2021 13:16, Conor.Dooley@microchip.com wrote:
>>> On 09/11/2021 04:06, Rob Herring wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> Add device tree bindings for the {q,}spi controller on
>>>>> the Microchip PolarFire SoC.
>>>>>
>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>> ---
>>>>>    .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>>>>>    1 file changed, 72 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>>>>>
>>>>
>>>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>>>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>>>
>>>> yamllint warnings/errors:
>>>>
>>>> dtschema/dtc warnings/errors:
>>>> Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
>>>>      19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
>>> Rob,
>>> Should I drop the header from the example or is there a way for me
>>> specify the dependent patch to pass this check?
>>
>> The error has to be fixed, although not necessarily by dropping the
>> header, but by posting it. How this can pass on your system? There is no
>> such file added in this patchset.
> I linked the patch adding the clock as a dependency in the cover letter 
> [1], which is why I was wondering if there was a better way to do so 
> that would get picked up by the checker bot.

It's not only about the bot, but dependency when applied. If you did not
warn clk maintainer that clock bindings should go via Rob's tree or
should be provided as a tag, the patches here cannot be applied in this
cycle.

Best regards,
Krzysztof
