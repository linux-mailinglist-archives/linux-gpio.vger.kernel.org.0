Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0AEB378F82
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 15:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237036AbhEJNmA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 09:42:00 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44424 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348948AbhEJNKK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 09:10:10 -0400
Received: from mail-qt1-f199.google.com ([209.85.160.199])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lg5ei-0007hg-1x
        for linux-gpio@vger.kernel.org; Mon, 10 May 2021 13:09:04 +0000
Received: by mail-qt1-f199.google.com with SMTP id b19-20020ac84f130000b02901d543c52248so7176835qte.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 May 2021 06:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3EZlfL7z84grZikXYl9bmKb5sE14hGf3dWPqG5s9Xqg=;
        b=ShkI3PYuwr1s6VeEJXMxKpQeA3kpEJW8CLlM6EQmD3di+WFUJFoYw0WsCmkyTqPV65
         ydml+zHKX09WUzJ3jdt3lznXlmYG5yBaTRaihSvLWe5l9FTPy5NXMzK74WTNXzGBAdUx
         fo+JESbBhXufcruBvpNKDjdajPt61QkPesR9OOTt1GybgdDF79/lK33U6RFuhN2/Bon6
         y26WO3zxskeZhJ0sgsJqHXQObunyfsJqvOiD0RirSYhXisSAP2Grs+eIWz29eA3563xu
         SY1443Nwpg1KC7iw6yF72NNEMRcEBbhOYi7kMzDQS3fK1xHppSPS4+BlmHE3k3pRQyfC
         MorQ==
X-Gm-Message-State: AOAM532n7nWcqCg4NmeaCDAX8TaaxdgGsOXJqhgiWVQnQyefYiwYcRyS
        d9UBLCHGz047dJDH4OgcJQF+zi424dBAhrLjve07L9hZF5eGt2V3O7KHkgOs65+6MhsMsO6IPYi
        brXFYPfRwknAEKJmreBTlmFLwaULtfsUNn1FlzB4=
X-Received: by 2002:a37:e50e:: with SMTP id e14mr22088275qkg.117.1620652143174;
        Mon, 10 May 2021 06:09:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwLP9GlKtI1WyA/nxy7DLVZK7IgyXSKBIhEvh2JTEwD5ovaV0XsMxwD2P69LAwyJBXGELSqA==
X-Received: by 2002:a37:e50e:: with SMTP id e14mr22088259qkg.117.1620652143029;
        Mon, 10 May 2021 06:09:03 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.49.6])
        by smtp.gmail.com with ESMTPSA id u27sm3847415qku.33.2021.05.10.06.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 06:09:02 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for
 apple,pinctrl
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Mark Kettenis <mark.kettenis@xs4all.nl>, kettenis@openbsd.org,
        Marc Zyngier <maz@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
        Rob Herring <robh+dt@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        sven@svenpeter.dev
References: <20210508142000.85116-1-kettenis@openbsd.org>
 <20210508142000.85116-2-kettenis@openbsd.org>
 <CACRpkdbUNs_FFv9RteWKUrxBdRuiXU2Fkt-oY4=Phke4gNBoaQ@mail.gmail.com>
 <c1bd678c5dc81db8@bloch.sibelius.xs4all.nl>
 <CACRpkdb=0EQN=CJqfjKS-iuAiKCvU38fw5krzEY5LvhNpyFd3w@mail.gmail.com>
 <CA+Ln22GnbTnxoAy0CWXVxAUUV-LBRHyLqDc2u0fpH5=FdHoWcg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d332f69c-33a1-b1c9-e1c9-3c8d756594ef@canonical.com>
Date:   Mon, 10 May 2021 09:09:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CA+Ln22GnbTnxoAy0CWXVxAUUV-LBRHyLqDc2u0fpH5=FdHoWcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/05/2021 05:50, Tomasz Figa wrote:
>>>> So is this an entirely Apple thing now, and not based on some Samsung
>>>> block from S3C like what we have seen before?
>>>
>>> As far as I can tell, yes.  This Apple controller has a single
>>> register per pin that controls the muxing and gpio functions, whereas
>>> the S3C controller seems to have 4 registers per pin.
>>
>> Fair enough.
>>
> 
> Right, doesn't sound like any Samsung pin controller I'm familiar
> with, although I haven't followed new hardware developments since I
> left Samsung a few years ago. I've stayed as a maintainer mostly to
> help with the legacy SoCs I had worked with, e.g. s3c6410. :)

I can confirm that it looks different than Samsung designs.


Best regards,
Krzysztof
