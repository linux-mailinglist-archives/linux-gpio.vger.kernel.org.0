Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36BAF426C08
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 15:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234054AbhJHNzV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 09:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbhJHNzU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 09:55:20 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF714C061570;
        Fri,  8 Oct 2021 06:53:24 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id m22so30224458wrb.0;
        Fri, 08 Oct 2021 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=yYWsu0Rg4yRualNrYxMIo7dnaqfU/YPo4u7hxec75RQ=;
        b=bbohXNY2pN0tG0VfoSJkDk8zsi8ByEGKv47t0+GqCwHguogMWEq0doeEkGAiHLue74
         tzC3QRTIA9xm3y4nVI7dd05PRfn/yIDLwRTgiUoOH6BzZkknS0tAZpy9gypIagpgixoK
         0jw3ZjfgZnlMoA7m3VVroeT/TyFmLDmwP7qB32TkscZoDHF5+tUc97n0B582epeuiHVA
         XEkdmZHdrlEVSr9tym+Wl60MDNgwCWOGQLuFAD7q9V07eDrrdtaETK75mBUjkBvfL78/
         n4No8br5zx7Wed0F30CPolSvsbqHq7Fc6UQ1F+Pp/FqnvTnAiiWCxJWEEb18deIuqviO
         vRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yYWsu0Rg4yRualNrYxMIo7dnaqfU/YPo4u7hxec75RQ=;
        b=wP3gN/+XWRsYbvnNMJsYtYfIvInb1ty+E70LgnRGe7VgMcYVPfCnEB2gsJ4x1+l3k9
         BEQaAFSelT5mW+TDTm9q2M2glN6zEH/Vd/7uMmHPK5yBlzlsV4YB3KpkoMhEBtgc6vF6
         wNcK8xnbRmOUnw7pTVUegmVjwZyfDhcqMJ0P3fztYV4LpiBbltgDmWV9TpGOyfYVCjOA
         Sq1UkB+deen7n8KFAtfxrfmlXALjOZGch4EGdQVCtK56jIC0zRbq8LcZE1+HKPC7wGoi
         pCkkgeiUkBcmmtUnVTNDUeogkFXNEzk+th5C9taqwegHt14IeC514gWr77GvsVCDKRaw
         V0VQ==
X-Gm-Message-State: AOAM5316C85u+dWnkqIhR0R9pnzXdZWhceBMwzwcAWdq/qneNx3Mc1bO
        GQ/LZWJW58eChqcZHKnnYTA=
X-Google-Smtp-Source: ABdhPJwCCsh7mGFTBgvB/ol1kIoTWolzftm8yGGomZgw7NW71Awlwc9f6CNm1UOrwC/9jfT/DR6yCQ==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr3427289wmc.165.1633701203204;
        Fri, 08 Oct 2021 06:53:23 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
        by smtp.gmail.com with ESMTPSA id c7sm3794235wmq.13.2021.10.08.06.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 06:53:19 -0700 (PDT)
Message-ID: <bc29d5bc-9ce7-6147-a708-e6304249b600@gmail.com>
Date:   Fri, 8 Oct 2021 15:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [v3,7/9] dt-bindings: arm64: dts: mediatek: Add mt7986 series
Content-Language: en-US
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Ryder.Lee@mediatek.com, devicetree@vger.kernel.org,
        enric.balletbo@collabora.com, fparent@baylibre.com,
        gregkh@linuxfoundation.org, herbert@gondor.apana.org.au,
        hsinyi@chromium.org, john@phrozen.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux@roeck-us.net, mpm@selenic.com, mturquette@baylibre.com,
        robh+dt@kernel.org, sboyd@kernel.org, sean.wang@kernel.org,
        seiya.wang@mediatek.com, wim@linux-watchdog.org
References: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
 <20210924114046.26070-1-sam.shih@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210924114046.26070-1-sam.shih@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Sam,

I'd advise to split this series in parts for:
- basic device support via dts.
- pinctrl driver + dts
- clk driver + dts

I would also advise to not send new versions of patches as new threads and don't 
respond in the same thread. At least for me that breaks my workflow as I use b4.

Regards,
Matthias


On 24/09/2021 13:40, Sam Shih wrote:
> MT7986 series is Mediatek's new 4-core SoC, which is mainly for
> wifi-router application. The difference between mt7986a and mt7986b
> is that some pins do not exist on mt7986b.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> 
> ---
> v3: changed 'MT7986' to 'MT7986 series' in the commit message
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
