Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B7744AE13
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 13:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238711AbhKIM4R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 07:56:17 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53832
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242639AbhKIM4K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 07:56:10 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4C5CE40772
        for <linux-gpio@vger.kernel.org>; Tue,  9 Nov 2021 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636462402;
        bh=j5tko5riuXms3JFEWKNcXt/poyacQNf52vuml9R0vAg=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=O6JRxo6dBfipYpSvNoaIBYoID05hGx/gA56XQjZu117joPlyBzp5Vu2sXlJ0cceEi
         fktSajCu5Ww16aIOG+znuHeN+v0MUuPSTYCabBhGWkiUCioAbbSpX2vg8OW9rzlekg
         xjwXavLG4UtOx6XWLWnraAwj380xpCtSMXztdseZeE9YIBODrAJunBtQmKX7RGk2O2
         XloIMvpF7/RjXUHaXon0Ts66rGe5KJ4YNuqojoY72ihZSq+iLjIdt5Bf6t2B+Wu0pC
         vVFNdk40XnbFWbEXJH+/O2M9JfSWfKxmf6i/0t9ELfTzv/a55XkKNHQX3yTvr1oKH4
         qe2nXvYCGgY5A==
Received: by mail-lf1-f69.google.com with SMTP id f15-20020a056512228f00b004037c0ab223so2218939lfu.16
        for <linux-gpio@vger.kernel.org>; Tue, 09 Nov 2021 04:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j5tko5riuXms3JFEWKNcXt/poyacQNf52vuml9R0vAg=;
        b=lEmFfL72iBCFhz2qjd06I33mtEw0sFpCfvLnK9a8f/wsz4ar09FvDFw19ATCCgV2Mt
         5+8hQJY1Aa6EWVfs3AfCtnHyrakiq+MDoj60wQZJzByfqi5/zHzRH21NSiOZEo7krDyu
         VqyGSphfCvmhs8Ph6Zc22MBCyODkIVlhuf+GvcJYwZ0TanZs9vhQQJZhC0MwH00UDOhb
         MaXiZaO8E6GwaE5UZRkYVrbggfW7fRw3QMzRvmXZgUFO3t1Se09AmjXbXoNW0DTKmZhK
         6rfxZFnGzqXGDxUJQpk/KuekrOqMPO+gdXNUCWwnh1UXJpa/Ml/qtAPaApmcUlDBda/E
         qMMw==
X-Gm-Message-State: AOAM530h9MBJEr63QILnfinm8VnTfBnaVglvLX3EPMhllD4wZRnlMbvO
        XLPnFgs6u6PJVh/1g2dwnfc1qyVASdBbIe5OKboMLy2A3BFRgu+00NSf4257uWydEHrh0FZ2t0u
        E8Og8MqR2hXx0dg5EtyiyUC7ldHtKHxnFWuQqG0w=
X-Received: by 2002:a19:9148:: with SMTP id y8mr6510842lfj.512.1636462401697;
        Tue, 09 Nov 2021 04:53:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxj8OuRHAShyPuiff/xoQ2+ShAhXkJXJ57MKAdkVyp0FJ2HQRhii/EaQs7fi9Q9gr6wclBnKQ==
X-Received: by 2002:a19:9148:: with SMTP id y8mr6510816lfj.512.1636462401453;
        Tue, 09 Nov 2021 04:53:21 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id i6sm2136859lfr.163.2021.11.09.04.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 04:53:20 -0800 (PST)
Message-ID: <0d996393-20b9-4f16-cbd0-c9bff2b54112@canonical.com>
Date:   Tue, 9 Nov 2021 13:53:18 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <96005893-8819-1d76-6dea-7d173655258f@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/11/2021 13:16, Conor.Dooley@microchip.com wrote:
> On 09/11/2021 04:06, Rob Herring wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Mon, 08 Nov 2021 15:05:51 +0000, conor.dooley@microchip.com wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Add device tree bindings for the {q,}spi controller on
>>> the Microchip PolarFire SoC.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   .../bindings/spi/microchip,mpfs-spi.yaml      | 72 +++++++++++++++++++
>>>   1 file changed, 72 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/spi/microchip,mpfs-spi.example.dts:19:18: fatal error: dt-bindings/clock/microchip,mpfs-clock.h: No such file or directory
>>     19 |         #include "dt-bindings/clock/microchip,mpfs-clock.h"
> Rob,
> Should I drop the header from the example or is there a way for me 
> specify the dependent patch to pass this check?

The error has to be fixed, although not necessarily by dropping the
header, but by posting it. How this can pass on your system? There is no
such file added in this patchset.

Best regards,
Krzysztof
