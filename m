Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3FCC611B3C
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Oct 2022 21:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiJ1TzM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Oct 2022 15:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJ1TzL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Oct 2022 15:55:11 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCDC1C9052
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 12:55:09 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id b25so4159586qkk.7
        for <linux-gpio@vger.kernel.org>; Fri, 28 Oct 2022 12:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SScI5S0L2zJiX+Huq/JArdE5hfBhAB9KqAp9NCyBI9o=;
        b=QNsJfn4JCx2/by6jfL4AHcMYuDhGD1I5ZNC49C17hWaO14Xv3De+bFPWY/xI6Ue6rr
         Y1YGPMtzQFKJIKzjv6mikRd5y3GwepYK6/MLAnBP6LucWOyorx9sci1jXLitfxrFXFr2
         ey6upm5l0UyH9o49HU4+nYmSAyyK1M8H3CKX9B2EQqRsvE+05UaGksyM4W4JwBeMkHY1
         BCXiL8EkZrNkxkcTFDM+bynmNpHN6XRTsLGve3ljt5syITa3ajPE161Oxo2DBm6UIXFm
         A3L0Amlb0bojBfU3ewo2MBW4YOCAnnmeg6KGztsdQQ9372dT17rL5C4X48x75hfbLfI4
         SFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SScI5S0L2zJiX+Huq/JArdE5hfBhAB9KqAp9NCyBI9o=;
        b=0W4OUPkUrFCtFgHDHzM1R/cBIx5ND31emvKjtVd4NgzuL6TPXUCtx3/QWCaM3eeJ5d
         jQvSTbXeXJiyPIhy30D9+S6LUyLnmW+QcSAhqH/QcqdFz1qzvTRQKCYwy7E8NUgMWA7Y
         0bj9k3iGbuP2tL4NOjCiInCzT4tckoGzRkNDRxkVdGC4Ltwbn1XYjvu4a3UM/877XpNq
         Acfgo8dkdIHGXFjjAf8CTBq4vRNRKeVSXH/oA5s2kUpj3cUw8eC0v58GGRHlDtS0I2fd
         qiIKnj6VJEMjCsHFVKiZ5PqoFTW5eLv49a0LDf0utjKKi/qT4TQLwgypG5Krtjtl7OHu
         3daQ==
X-Gm-Message-State: ACrzQf0zj0kq0Sz1YPk4o3QMn5H/vEnlJJrNRixz/OLlsqo/rwPClW3L
        e/tU9tcVObbRJdSmyZQeqGEc4g==
X-Google-Smtp-Source: AMsMyM40ef28CAfMEXrKpVIkQ4L0OJahlWdUPU9M34nPxcffPVJNbnZHF/L56Klwr/2FzFOj1i5V+A==
X-Received: by 2002:a05:620a:e:b0:6ee:86e5:66f8 with SMTP id j14-20020a05620a000e00b006ee86e566f8mr741287qki.163.1666986909085;
        Fri, 28 Oct 2022 12:55:09 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id f17-20020ac84651000000b003436103df40sm2854204qto.8.2022.10.28.12.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 12:55:08 -0700 (PDT)
Message-ID: <07aa7a43-2ed2-007a-c629-a71449828f15@linaro.org>
Date:   Fri, 28 Oct 2022 15:55:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 05/13] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Fix interrupt count
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
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
 <20221028153505.23741-6-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028153505.23741-6-y.oudjana@protonmail.com>
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

On 28/10/2022 11:34, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The document currently states a maximum of 1 interrupt, but the DT
> has 2 specified causing a dtbs_check error. Replace the maximum limit
> with a minimum and add per-interrupt descriptions to pass the check.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

