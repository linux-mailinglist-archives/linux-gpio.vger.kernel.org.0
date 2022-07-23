Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 046D857F194
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jul 2022 22:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238821AbiGWU7h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jul 2022 16:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238818AbiGWU7h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jul 2022 16:59:37 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F065D183A6
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jul 2022 13:59:35 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b16so243033lfb.7
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jul 2022 13:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WwWq4pQq3KpAF4vZSyzfIHczd+yLMoGMXQMiyrcDtUo=;
        b=RF56donK2hZgNer2URwSK6BpA2vX1NduJhbeN/Tmw5LTwWQ/Y/ejr5RYuNH9YoWv4Q
         vI8VLjGbxeHH4JiQEeS+d5yYM50Pa6HLz7waHpadKZLKFhNGZhts4ODlaNuUAo5n4/8R
         lo4/NYqQmGpIjnNNjVkJWpCr81LjKmJZKmcHLQfYza7cksgz5RFh0TF3FOOJDCHzJ6oP
         WTcpUU2JrZkrUPGAUfaq9rE/80RhvyYgX9hmoJbqzud8rZdQ6bu5cDjyZFPyfAPLvjzV
         fVR0L+QkDEpizMnUWZtYWEEJA2dR4+y/+fs1XdW9N2bimI+3GzYE24jfkSyRQ2uWcOPQ
         fXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WwWq4pQq3KpAF4vZSyzfIHczd+yLMoGMXQMiyrcDtUo=;
        b=uxCv/50mbc5FMtdy8lVg4V9lRc72E+w7SV9hKtmteF6DkMA/+3e+ms8ONItZxk7Jlf
         J3g9XDEYqldBl7iZcW3coQJPuIRYJgqwLiKJKwzcIpVswPmxyTkr6PfS0oXuL4Nypppv
         ZICRmr/gz4mc1AmH52nXclCgtIROS6nhmEOa/5v0JtupPtfIIDRje4NV9pOQ5as5znBQ
         nrD14UAbUQ3Vg30lewgXXs4DdsJy5xynIEG8e27FAWANhgeuRKXFotVujSGMw29Lbai7
         /R53Nh2TLGxATwkl3wKNOcpS+OXgp9TI/sbWVY3KyIcSxWZdT5G272yb503KIlfaqYhz
         f3Zw==
X-Gm-Message-State: AJIora/h/E57eSFBx9Jabx0JH894JthgSVmaIHbt1Bc93B8ZWy6iFeru
        xSFWoJA5ku1mbGK9jVgAap/dWg==
X-Google-Smtp-Source: AGRyM1uafTV4YGCtd1OGhpgkDgbBmgFk3KwI4+Zk90rtlplUCPn2aEMnuAqetuorS9sNWDI/QSWTNw==
X-Received: by 2002:a05:6512:3d92:b0:487:5cea:a68b with SMTP id k18-20020a0565123d9200b004875ceaa68bmr2126962lfv.21.1658609974100;
        Sat, 23 Jul 2022 13:59:34 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id q9-20020a056512210900b0048646c0af5csm1813707lfr.263.2022.07.23.13.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 13:59:33 -0700 (PDT)
Message-ID: <ddb20078-80d9-0c0d-8e20-4c1c3ee0b0ef@linaro.org>
Date:   Sat, 23 Jul 2022 22:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 06/22] dt-bindings: pinctrl: rockchip: Document RV1126
 pinctrl
Content-Language: en-US
To:     Jagan Teki <jagan@edgeble.ai>, Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220723204335.750095-1-jagan@edgeble.ai>
 <20220723204335.750095-7-jagan@edgeble.ai>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220723204335.750095-7-jagan@edgeble.ai>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 23/07/2022 22:43, Jagan Teki wrote:
> Document dt-bindings for RV1126 SoC pinctrl support.
> 
> Cc: linux-gpio@vger.kernel.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
