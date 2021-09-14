Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90EBC40B66E
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 20:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhINSCB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 14:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbhINSCA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 14:02:00 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C364C061574;
        Tue, 14 Sep 2021 11:00:43 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t18so21681710wrb.0;
        Tue, 14 Sep 2021 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6dFC6G9j2m+rj0GHdvZf5Uzsxvw56U4B4UMYB9UQwLo=;
        b=N1diVjvcLL0DD9LXmypCZBUjV+2UYbD4bpqz2gMmcJxPBvh+g6r1IU+xttsw9Xco5p
         Y8TlgGl+PLzkaLd1swTkvb/5eCG/UEWpT3+nX/gXi3f6Hv6EUo/OCpqqmhd/MBOhubdR
         SAKVN4+AgJx37Bv9cKkQQp44TNCcetP0V86JkvMy/wNAMI7SArXvHEVKkxPrCDQ7JQEj
         ITjizWywYykEMb396i/GFiBlgRQ1uxi1g83BGen4gHkNN/rwjIHs4+qluKRnWApsYH6X
         NWO9MWnbV9KYlRXBumupy4VMj8g/OZxswW+sSzghsWDMV5dOkjhFMN3ANVoW52J7a9DA
         uTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6dFC6G9j2m+rj0GHdvZf5Uzsxvw56U4B4UMYB9UQwLo=;
        b=x6X/OsaeDhxIzgLirH4UmVWDEF2+KZdKRV9mW6iWFklWwlib5gIgHOfRO1E4Ag9nYw
         jH4EArWBYdil5VGZt651MXM7x7MLCh7LaXJANJEh7/qnmfj7aO2OfqCaCilPCcn5M7+M
         Hz7KgMWgU8uEyJ44dAMfnwkKKWquqUhvI4H8VydeAqDnJgoJm1loVh9fZBeZTnLOjfRp
         g1lDEppfJYjtXR8pCtkC08qZ2jvlVM6B0sK34vURhSd7I4TkVVSJIL2gnfxHIUdFSE3M
         qvxc+jJvmze1c4DQOWV09KzCn4Cxn9gG66CQYjohe74rdBbldqLtb5B9xOAUQeZAf03s
         1Aqw==
X-Gm-Message-State: AOAM532ZFcX6sniJx1B94O1LBoMeREhANhbiqnTefdZNcMUKBPNlA2Ga
        nOZJ6pcX+torqE6d+4bCS3g=
X-Google-Smtp-Source: ABdhPJzfylK+kXHce7KVWJLaOvCn3SkTzG7NheWlvuWVPNshAFAZB4oanYkpP2XWqKXD5RN8kmT+HQ==
X-Received: by 2002:adf:c10b:: with SMTP id r11mr492124wre.336.1631642441638;
        Tue, 14 Sep 2021 11:00:41 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.140.66])
        by smtp.gmail.com with ESMTPSA id k16sm11109485wrx.87.2021.09.14.11.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 11:00:41 -0700 (PDT)
Message-ID: <9aa66a93-4d0c-176e-ea35-b5aa33751d51@gmail.com>
Date:   Tue, 14 Sep 2021 20:00:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [v3,5/9] dt-bindings: pinctrl: update bindings for MT7986 SoC
Content-Language: en-US
To:     Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20210914085137.31761-1-sam.shih@mediatek.com>
 <20210914085137.31761-6-sam.shih@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210914085137.31761-6-sam.shih@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 14/09/2021 10:51, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to pin-65
> do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v3 : make mt7986 pinctrl bindings as a separate file
> v2 : deleted the redundant description of mt7986a/mt7986b
> ---
>   .../pinctrl/mediatek,mt7986-pinctrl.txt       | 300 ++++++++++++++++++
>   1 file changed, 300 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.txt

Normally new bindings should be using the yaml description instead of txt.

Regards,
Matthias
