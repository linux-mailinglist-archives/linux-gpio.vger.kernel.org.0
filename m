Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C59005184B0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 May 2022 15:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235671AbiECNFL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 May 2022 09:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235662AbiECNFK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 May 2022 09:05:10 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B5D19027
        for <linux-gpio@vger.kernel.org>; Tue,  3 May 2022 06:01:37 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g23so19740412edy.13
        for <linux-gpio@vger.kernel.org>; Tue, 03 May 2022 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gG0dwpdZEvdDBuvEs96CRkJ96qnrRXLRezy0ryDW5k4=;
        b=ALFTAYUx97uyNKW+lAnYdzjZir2++CoTgHbyUjF7Tyu8FB355br9ymFrLHz0yjDrvH
         DrBwdFc3LklD9yrRb89qLlvZA45swTSbmHuxKgldKlCxDB9G9Bd/rTJMgy2E5BhuXpNG
         yb3uDyAd0RZWZOAzkIzno8BwG1U9FqEA2iDDfvFQdY1zAtE4mcYmqd0IK3E8B6WW5z6O
         Il7T85auivSNN1fPpuxtB8GmcDN5yYpug0AHyoO9xlmN/aBKvPJd2Lo3lmc7T3UxTryT
         aSyIBP9yrCWMYKMi9FYlBuxD7LnSgPuAOlxYmPFIuuY5zYNOFH/jYeetXY4nPgZt1+cp
         4lTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gG0dwpdZEvdDBuvEs96CRkJ96qnrRXLRezy0ryDW5k4=;
        b=J//jmh/Bwk0PU16anIFo0qzsircjJUkBdYXZ3/oMh5VaLCNHqFuVnMHr2wjXoSfBk/
         PV+RaRhkSdaTQJ2vD7c7xgxmrGwnhQ4wVxlBzR6DQl8Bt3FUhWChDXLoLNKO4wqmjab/
         /YSJw/DLsXH4GAaZ6p9HDSVTEj2Qrhf/xec4/yeP9vL2KR/h3XLsa0QmwgzpTb18F13e
         k0ePFdK3phgSRSvpB98nWxmaJLZAhSRa0kLN3ab3/yJ1XWohHPMTl1hW8CRin1t5ocmc
         wnS9HzyMGZQCVt3YIl2ODZVeRCixIheVo4XDzD5sS9VxfXDdDndYujYXN/sCcKtT+bq2
         GQqw==
X-Gm-Message-State: AOAM532aE9yinCVJEmeHdg39Vqmhtzp6pCX6POiDc3XGX3RT1SjFrXPJ
        Ea5sHi4A57fdrJgH6ccjKtkJhQ==
X-Google-Smtp-Source: ABdhPJx2Srwjeq9nawpv4x1JuljzsyhT5QkLcbjVFz2bgafQYS+1B1AShuziH+AsAOVKPNcC8AG0zA==
X-Received: by 2002:aa7:c0c4:0:b0:425:c776:6f17 with SMTP id j4-20020aa7c0c4000000b00425c7766f17mr17610108edp.131.1651582895443;
        Tue, 03 May 2022 06:01:35 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hy10-20020a1709068a6a00b006f3ef214dd4sm4687649ejc.58.2022.05.03.06.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 06:01:34 -0700 (PDT)
Message-ID: <9d7514fd-511e-6596-5eb0-6001ead5a081@linaro.org>
Date:   Tue, 3 May 2022 15:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] dt-bindings: gpio: renesas,rcar-gpio: R-Car V3U is
 R-Car Gen4
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1651497024.git.geert+renesas@glider.be>
 <5628a862688bd9d3b4f6c66cb338671211058641.1651497024.git.geert+renesas@glider.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5628a862688bd9d3b4f6c66cb338671211058641.1651497024.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02/05/2022 15:34, Geert Uytterhoeven wrote:
> Despite the name, R-Car V3U is the first member of the R-Car Gen4
> family.  Hence move its compatible value to the R-Car Gen4 section.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
