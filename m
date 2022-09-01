Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40DC55A98F5
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 15:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbiIANfF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 09:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234347AbiIANek (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 09:34:40 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4F165E8
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 06:33:03 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id br21so18660610lfb.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=lOxkROm5BlJdPkNzAhb8DK30tpxtm74Zgf5BrOPOkjk=;
        b=peuXjUSnwtog8QxfPaggji++nc5Lp0DPi/OHO5FBWsyhQAvSyC+yFRq5nZFPwzpXlK
         xKfOV04BxRyfEd0T17SaPMWH7Il85PlF/ym04nxbGl87IR+nWepWSdtPicuOxBWtYYth
         75qXrtkvWzz+fumO4UhKqQ6QID8DP5kVotlsbJx0R+VHn3gJsfRtZLJ4L2gmxL92irjB
         RPYTDnnodfZr8GtDvShjHTeHl6WpKQwQoaIAXE3InlMmMUdtgNioPqiewXKyaJ51Li6Q
         73MSpnCkuA4fg31DVO5Qf6yMNKYRoPnHGyz/xO3H5yb97bE8j9Nv7O/FGGfmF826bujM
         TEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=lOxkROm5BlJdPkNzAhb8DK30tpxtm74Zgf5BrOPOkjk=;
        b=deoT/RsLe0dCTSa4AtrXzysfw7EKjgxrLdRuoF2T2Y9k77r7xtw1sTRe9y+5AhYQ1Q
         +kVp4oqxcdWgCYvd25Ldqxh4X/aAJb9ebT7EuqeZgnsx3etMYyWQQ0ywoQgoXwQb4rUD
         BLSX0RnfQdzGD77z7+et+tpu6jDVt2VwvgKr70//5aWE2e62ZxA7I/MKE7fkHN7anBJf
         f0h3wdiDVt5c8+HyIFneevduq3tepr3XmqFcG4By3YhvY5o4dTWdgK93TDYCy5T81Yra
         PL9rKdBFk8bYlM0Dbf/UQw+D52ihzcLLQCDInCb9aVdLTCmoNaPAh4YURyTKAWxnaI6g
         3ZUA==
X-Gm-Message-State: ACgBeo2xQVraHA6W9XFwMWKZ21eZ3meUNpf3NzRjy9+FWvCdGiHOFtiG
        ydv2G0n1y3PcebU8VYpAMXrFLA==
X-Google-Smtp-Source: AA6agR4lGx3pWN3YYJj1clY+UtNqdC1Pt+tHaQfJ5z1paLpoOYGENH7MVRoYDC7wbdGJ4QYIUaNs2A==
X-Received: by 2002:a05:6512:3996:b0:492:dacb:33ce with SMTP id j22-20020a056512399600b00492dacb33cemr10101487lfu.445.1662039180939;
        Thu, 01 Sep 2022 06:33:00 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id q13-20020a19a40d000000b0049300f40c5bsm328830lfc.299.2022.09.01.06.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 06:33:00 -0700 (PDT)
Message-ID: <6840d3fa-329a-5508-7647-2b8d09272b41@linaro.org>
Date:   Thu, 1 Sep 2022 16:32:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/3] dt-bindings: gpio: rockchip,gpio add optional
 'gpio-ranges'
Content-Language: en-US
To:     Jianqun Xu <jay.xu@rock-chips.com>, linus.walleij@linaro.org,
        heiko@sntech.de
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20220901012944.2634398-1-jay.xu@rock-chips.com>
 <20220901012944.2634398-6-jay.xu@rock-chips.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901012944.2634398-6-jay.xu@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/09/2022 04:29, Jianqun Xu wrote:
> Add a optional property 'gpio-ranges', such as
>     gpio-ranges = <&pinctrl 0 0 32>;
> 
> When the gpio nodes are under pinctrl, the property 'gpio-ranges' is
> a optional property, but when they are under root node, the property
> 'gpio-ranges' is a required property.
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml       | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index d4e42c2b995b..7a075fcea75f 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -49,7 +49,12 @@ required:
>    - interrupt-controller
>    - "#interrupt-cells"
>  
> -additionalProperties: false
> +additionalProperties: true

That's not correct. It should stay false.

> +  gpio-ranges:
> +    maxItems: 1
> +    description: |
> +      The property is a optional if gpio node under pinctrl node;
> +      but it is a required property if the gpio is under root node.

This is not in proper place.

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Best regards,
Krzysztof
