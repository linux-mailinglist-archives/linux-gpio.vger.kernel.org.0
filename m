Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 726B8608E5F
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Oct 2022 18:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbiJVQJL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Oct 2022 12:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJVQJL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Oct 2022 12:09:11 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58515640F
        for <linux-gpio@vger.kernel.org>; Sat, 22 Oct 2022 09:09:10 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id f14so3883017qvo.3
        for <linux-gpio@vger.kernel.org>; Sat, 22 Oct 2022 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eGwq4mTX+Jyhw/AulcJVeuFBhkqv+kuR8AmKOxA4g1Y=;
        b=crGI2grvfuGSaC1Jaj5m3B54vfeagFND39Y95Ji6+QRaCWIYaSvKM3MX7LqGVhAmFE
         TQAmjXu5hP+J3ecalMT2XDxoYVQEG737PhirvzvD4rjZT9SOfzB2MOuW9ZEDQHzikTkO
         eMDaQausgqqEghYiAYnpPypu2ScO+eX25kpHXcqEqHp3rLjVmgP1Nr9kVNw8pm32ElsV
         JsuGpz6TRY6UG9Um1i9xHWVr/ygg4yDXJSRu8MUaoB88U+7fpFM5LrL3QKPUrrjB0Q4z
         C0ZzgI05hj9jU1VXdJNokjwoRl/XTzES0BZeiGhGl9o9UoFDxVGMRB+T+NFzdSH456Po
         181g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGwq4mTX+Jyhw/AulcJVeuFBhkqv+kuR8AmKOxA4g1Y=;
        b=G+5tEX2Z7sKeK2tKczqL7PDl5ePOwun4YZqHELcXVgB7XWYRSz3YR9XdfgvExjuxms
         D7R/xXmHGkBMdkvYnshrSwUSKNM7E1FGF9e/uq5C3QR/jVxsF3JuZBWqAM8WPUp9BwC9
         UYqEUVIOUZr1F0B5EJHTPZtIQEpyyOumeHBu7gTv/5g+TD7jC91ipjvZB7x8LzfqiR0Y
         4Hxr39MKB9SIBBnYk90MNxhhrl8I8BvBGABH5xe2RxLYzfO7qrqGYyKDKJFY/wgwvX0o
         DndIdAzqxgHUG1siRtb7cP2PndaHDRR+SMP8WDPxfWb0I6C9V4X4xKyPaAeLzdTQZ4bK
         xRnw==
X-Gm-Message-State: ACrzQf2AkZAQlaSpdFLhme3uLS3Sat4eWN/gzXUkP1kZKSD4XL6v8G7X
        Ge1vxllRT98Al45227Q/lOagdw==
X-Google-Smtp-Source: AMsMyM4ljkHEqnzzLpxZ+mQ1vXCLGqeVVJF7Fq6+dWT+UIpDKaGCbakQy2u37OmYs48bPc6GWCUH+A==
X-Received: by 2002:a05:6214:2349:b0:4b4:11bf:a743 with SMTP id hu9-20020a056214234900b004b411bfa743mr21915486qvb.95.1666454949573;
        Sat, 22 Oct 2022 09:09:09 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id bz12-20020a05622a1e8c00b0039a1146e0e1sm9892269qtb.33.2022.10.22.09.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 09:09:08 -0700 (PDT)
Message-ID: <122af550-f565-32eb-524b-b4ecfa96c3a2@linaro.org>
Date:   Sat, 22 Oct 2022 12:09:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/1] dt-bindings: pinctrl: rockchip: further increase max
 amount of device functions
Content-Language: en-US
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
References: <20221021172012.87954-1-sebastian.reichel@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021172012.87954-1-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/10/2022 13:20, Sebastian Reichel wrote:
> Apparently RK3588 pinctrl has 13 different device functions, but dt-validate
> only checks for pin configuration being referenced so I did not notice.

I think the "but ..." part can be skipped, as it is not really relevant
to the issue being fixed here.

> 
> Fixes: ed1f77b78322 ("dt-bindings: pinctrl: rockchip: increase max amount of device functions")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

