Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 185A35BF782
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 09:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbiIUHUv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 03:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiIUHUv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 03:20:51 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 995F37EFEE
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2022 00:20:46 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id s6so7717418lfo.7
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2022 00:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=dSJK8K5vjWv2/GVOfRJhK9M2GBqzEVnIXuyUiGIt284=;
        b=bRWGLyDSb/PlE+DBo6Ml2cCGQFGb73VnZHQptCvBpHFVDHi1H+j0AKvHi81YPWCKHy
         8dgUkwrZsN4Z+JwcsD3KmM2dJptGLc4uZT/bYKplMl/UP68YIrtnrtN1cHdmRaiV9dXC
         dqEwZ5uKmO5I8dzkQwA2EEKOVJvJc+uLjP6tO7G4VGZNzmF8zx56Nr38JXYOipaodfOb
         eSkrx15C/N0wdGj7/sYHLYTDGA5ysiArV1gem+8mAXf4T2CaWeg66j82tTYdYin4uoTQ
         rQnV7tX8ZKkOxeQ0yaEzmDpQPkLxHFioErtkcy9jUsYM0Ao3OB8tWjdKTMWa8MMWh51k
         sdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=dSJK8K5vjWv2/GVOfRJhK9M2GBqzEVnIXuyUiGIt284=;
        b=1iiMJabi41x+t5TYy3cH71yX7IX271MBu67ElgqlaD8UbF90ZPCMoKa/Evq5KwqaXx
         HLZisPvRB18GuvNMl/wow7yePtWKTD7qyojW6YELP+ntyrIgcTh5nhGHxG0qCMdp8iek
         PF671omnzZ3XknhVgtqWNQlZmhh+9QKLt5p3+SrzVwjGk7obswilDvK28eVIpuRiCwFj
         G8fC7khQZ1pwvT+tyGKr2TtaY7XdK4R87G30hBvnYTgQOq+WXzfU40MnGELPs8we6Kdk
         44RmpHQtlUMX3AUG8ja9GVymxh1pEBARbxIkt1RI5vuOmjWnQjvlkrmmJqJVCA+a4pRK
         qmPw==
X-Gm-Message-State: ACrzQf0ZWuiLp2d9Cid7DS9LBASlc1zyTN5j8Ju2buOAXVMV0fzWDrmW
        7e1tC5YMHN/vVdzy1vOo8v6aVg==
X-Google-Smtp-Source: AMsMyM4S4yZ8U/MIOwL+j8mA0A3teebN1FCRPSnVbHnyyu4VBkIkiZN/SjM8Nm9dCbve/ZamCN2K1Q==
X-Received: by 2002:ac2:4bc1:0:b0:49f:3518:864a with SMTP id o1-20020ac24bc1000000b0049f3518864amr10496307lfq.155.1663744844975;
        Wed, 21 Sep 2022 00:20:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v12-20020a19740c000000b00497a2815d8dsm310371lfe.195.2022.09.21.00.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 00:20:44 -0700 (PDT)
Message-ID: <b567fb19-460c-ea1f-4c84-0724e73052fd@linaro.org>
Date:   Wed, 21 Sep 2022 09:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Combine MediaTek MT67xx pinctrl
 binding docs
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220919170115.94873-1-y.oudjana@protonmail.com>
 <20220919170115.94873-2-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919170115.94873-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 19/09/2022 19:01, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Documents for MT6779, MT6795 and MT6797 that currently exist share
> most properties, and each one has slightly differently worded
> descriptions for those properties. Combine all three documents into
> one common document for all MT67xx SoC pin controllers, picking a few
> parts from each and accounting for differences such as items in reg
> and reg-names properties. Also document the MT6765 pin controller
> which currently has a driver but no DT binding documentation. It should
> be possible to also include bindings for MT8183 and MT8188, but these
> have some additional properties that might complicate things a bit,
> so they are left alone for now.
> 

>  properties:
>    compatible:
> -    const: mediatek,mt6795-pinctrl
> +    oneOf:
> +      - enum:
> +          - mediatek,mt6765-pinctrl
> +          - mediatek,mt6795-pinctrl
> +          - mediatek,mt6797-pinctrl
> +      - items:
> +          - const: mediatek,mt6779-pinctrl
> +          - const: syscon

No, this is not like old bindings at all. It's not merging, it's a
change sneaked inside huge diff. Also - probably totally untested on DTS
(or old bindings were broken).

That's a no-go.

Best regards,
Krzysztof
