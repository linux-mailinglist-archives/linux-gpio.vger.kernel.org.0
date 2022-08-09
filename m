Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2987758DB95
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Aug 2022 18:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244883AbiHIQF5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Aug 2022 12:05:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244970AbiHIQFn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Aug 2022 12:05:43 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB34610CB
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 09:05:41 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id j3so6281250ljo.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Aug 2022 09:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QHTTec7dUx1qXt74vHAdnoKvJ0Y1zKM06sa4DmhXaHA=;
        b=EDDrvl3OAxEnD1Qgo1+kDKdAUSABexKsnTCYrgEOsdW+6i2vIdxTj3MUC+obJFw1wp
         oJJ+NlcE2AL7371IPf3cWVBp8EJnjRa2WksXyrfx3FDVQRfYxk68uAJXcepygOXu318o
         dKang7QeTvM9HJDSGov7nrI1qw5p/4KBK9FjhSKo3B9Bpvae+imaHxRMZ90eHzGUPJrA
         rQFFt291MLIZfB/Ssl+6sCtS80TEk1xr+cBn2wYoHQ01gr4syWNmxrgxa7k3pmplgawu
         uD/8kRw5K/626ucV8oQRkVwRMPpe6LHunidN/qydLrktq7pFa3RSAjPFd7QB/kY42PKG
         KGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QHTTec7dUx1qXt74vHAdnoKvJ0Y1zKM06sa4DmhXaHA=;
        b=gKneH5uJ1mLR/txjPj64osuFKQhe3EppqpOCUmh9Bafe69Kkvq8/g8/oywkkflovzW
         o1CM+vPq9kdfj4Kdssg4Qi7X9FD0cayhYPBsJkGIInlKTb0DHYoJKsBeDy8rGDwQ3w7h
         YoOraBGvA27wK/mia6Qxedz+py88JZBbIOTY7VrHq6obyAhwZs5Z14BrcjKugh+O+MDb
         MAs3Uu28kdXP5f6jjBGJ+ZAhbAazq3pINaRqie/v98I5V78DiSEp7Ab6Ju4yozlcTU2A
         2hcQPhZVTyD58+8mG0agqVEaiRuccSPeTeoWgfoPLFD1v20TWV9cXR9MlaezbQU4Qao/
         we+g==
X-Gm-Message-State: ACgBeo21J4DPvNinR6Bb8o5rF3zD4Ai/EYFpmGcTVnI9y0WyjyG37nev
        vlVRcBAFulci42OMMqBEvHRnHQ==
X-Google-Smtp-Source: AA6agR5MIRBOqhcN3ewSqfA/Lm0LG7LeU/Vh3UY4uRjwwjzRwM13ZVe1fK5C5PbSVgsHwmxTKy0//g==
X-Received: by 2002:a05:651c:160a:b0:25a:62a4:9085 with SMTP id f10-20020a05651c160a00b0025a62a49085mr7734006ljq.214.1660061140257;
        Tue, 09 Aug 2022 09:05:40 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id i21-20020a056512225500b0048b18fb378fsm17292lfu.119.2022.08.09.09.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 09:05:39 -0700 (PDT)
Message-ID: <7a375a37-dd6d-45df-0087-eac04e4c5ba4@linaro.org>
Date:   Tue, 9 Aug 2022 19:05:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/3] dt-bindings: firmware: imx: Add imx-scu gpio node
Content-Language: en-US
To:     Shenwei Wang <shenwei.wang@nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev
References: <20220809143105.17967-1-shenwei.wang@nxp.com>
 <20220809143105.17967-3-shenwei.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220809143105.17967-3-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09/08/2022 17:31, Shenwei Wang wrote:
> Add the description for imx-scu gpio subnode.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
