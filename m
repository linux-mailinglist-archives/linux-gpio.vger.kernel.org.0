Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138E240B663
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Sep 2021 20:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbhINSBa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Sep 2021 14:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbhINSB2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Sep 2021 14:01:28 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79894C061574;
        Tue, 14 Sep 2021 11:00:10 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id i3so190128wmq.3;
        Tue, 14 Sep 2021 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wvbyZiOz7Ec9hyqSMpm7mmMn4oxPF4j+O4Rp3JHG2m4=;
        b=mfyFG+lR7RBM2GfQ3G4NpQZOUn6NZBITG9iuVFfYmmBUHeB1Gcr/Wto32TRMdfaY4/
         dc5LoMnFT4wsUNATmuqVy0looXm6tzhJHkysFpatHA3985nLfmeaLb7EUaU+gpbdQ6EP
         vbR9qc+vBNEGDjUUc1b1qG67UMpiwBRH4odmNsNQ9yJ0Oj/jtfSvp3hDP/5z9PROi4Du
         SJOYEhHS6D3tblpwl+UBx1H65Mc+hb529Xp4ZB+ilxabGLJ72wdsLjFmDy7CxDMhQO9x
         /IuB7K2pDLMzKj7401b5P1UyuSqCsLAe6XkeEHPYHB+SxqLJbMF5pzl/VgAjStzztQ09
         Pikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wvbyZiOz7Ec9hyqSMpm7mmMn4oxPF4j+O4Rp3JHG2m4=;
        b=3eFlh5a9lJKsVbb6dlRoIhxrvJaMTxZ5f0fYUNUAURhXl0R6cuVPj6JJoW8qLLTMjv
         5Cos53K5z3PEdzYrNMZqRAjjO4SZ04tFBf1hpIDWV4jTZlHAM/x53J4smnqjmm9OxW9I
         OFbr6Kpb8gGeTc7iD65jJrU6/q9q7xSk4DorJRKY6lNeY6yGy9lc6uEA+ZYAWHn0WR4E
         4jOGQx2whCOPzYRgU36JigjeF0ekDYay5ZPDifnyNQjTmq66eoU8WQqa943emHJXhl0X
         XuMg1qE7R0gxm7ga4P4vfm4Mh2C/WwyHjqLT8M8rDi+XEb+eI9mCksb48QkYe8MpIm5z
         VJzg==
X-Gm-Message-State: AOAM531fasc9MXoFjRoW2bSFZUxCbzcDVrHWkc6Y7W/iFnts33WrqbvD
        3KJgwMbA2WjW6Jwqn4mAjgc=
X-Google-Smtp-Source: ABdhPJw/wltv4HvH8nTvBUz2AhO7PAV/1Z+vLbyMv0bsdlONsSJXjcVDS6v23vp5wflmT7xBZuOXtg==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr315087wmb.119.1631642408706;
        Tue, 14 Sep 2021 11:00:08 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.140.66])
        by smtp.gmail.com with ESMTPSA id k17sm10887920wrq.7.2021.09.14.11.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 11:00:08 -0700 (PDT)
Message-ID: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
Date:   Tue, 14 Sep 2021 20:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [RESEND,v2,7/9] dt-bindings: arm64: dts: mediatek: Add mt7986
 series
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
 <20210914085137.31761-8-sam.shih@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210914085137.31761-8-sam.shih@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 14/09/2021 10:51, Sam Shih wrote:
> MT7986 is Mediatek's new 4-core SoC, which is mainly for wifi-router
> application. The difference between mt7986a and mt7986b is that some
> pins do not exist on mt7986b.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Sam, I'd like to take this patch through my tree but you seemed to have send the 
patches in a strange way that confuses my b4.sh

Would you mind send the next version using git send-email or similar?

Regards,
Matthias

> 
> ---
> v2: added an Acked-by tag
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 80a05f6fee85..a9a778269684 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -76,6 +76,14 @@ properties:
>             - enum:
>                 - mediatek,mt7629-rfb
>             - const: mediatek,mt7629
> +      - items:
> +          - enum:
> +              - mediatek,mt7986a-rfb
> +          - const: mediatek,mt7986a
> +      - items:
> +          - enum:
> +              - mediatek,mt7986b-rfb
> +          - const: mediatek,mt7986b
>         - items:
>             - enum:
>                 - mediatek,mt8127-moose
> 
