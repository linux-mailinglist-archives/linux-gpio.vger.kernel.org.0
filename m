Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 950C85AE33A
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 10:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239395AbiIFImE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 04:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239389AbiIFIlD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 04:41:03 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5D17A775
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 01:37:56 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q7so16259115lfu.5
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2022 01:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=siFmskFy5iMrdF7UgBhvKAv9pmj+Nx2EpR6pFPvHOFE=;
        b=Vgogowzf2dE2bLuHe6RYaa86RBB/50D3zcbdyF4sYmElCKgUUyXGctWkbEdoqCfmoy
         aTjG7gVrmnrCz5ZZIbyRfDZfVgvi6H45MYlxRHncG4f4NSqORMJThz7VeUqOz395+1ia
         1tNQTgB8RHPGt+4dUFz+OhduWFH+KUN00lkVyr3NlGl+qERmoAvcBmA66cAC6R6kcCJG
         TDZnwz0CGYjRBXzYQji9lEQpK9uaKKb6UGpjw6SqeYJmbFZ78ulcxJJQtV+S2mZ0SJej
         g254rH7p4Y8UwsQ4mgaMIz1R48/sMfjJwIWWyCaofjeucEWHNg5bdll8tBnWh6Dtc4KR
         a0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=siFmskFy5iMrdF7UgBhvKAv9pmj+Nx2EpR6pFPvHOFE=;
        b=EZ1fn+mEdgn4MlMNCl1kAB8ROuMyqkBoq9hDiLCQfHD2+ce3UoyzDUDjSMkpjVKxV3
         RQuFg0N0PoZmR/8+dEpM1u0PEnDpgh6nr3noh9wdtMIq/MeUsQB3bzfa5tjNuZp7X0gP
         TfeEZwmdfwMn6d2tEVj5e5poOXVJsrm6hpGKnhjU+SKjMjdKavJdvFMVbG7E5uA5GT8c
         f9kIuwrP0yXJKVEH+7PIxPC68S+SkPHNlxF4P98xRkqRVXSCoujI0bAhDihZ3Z7iKwd5
         N3JENOL7+PQdodwO8AS3ADiRXHduJUG4oyveEcqVdaa+11lGlWRHU7tUGbFobhnDM1jE
         fu0Q==
X-Gm-Message-State: ACgBeo3PARcbRpI1emmUOU/jL4wdLMrcnm8C3x0NFjAPruBybhNTjjS3
        f0CT0sunAagQQ4lp1hzNzbZPDw==
X-Google-Smtp-Source: AA6agR4RhkAcjgdBPHw7IiKOpwJGCDBeYZ/XFPJ0rqjNrLeut3WsLzG/XWxCG7STnrzYvZOxGOzY1A==
X-Received: by 2002:a05:6512:b15:b0:492:ebc3:80d9 with SMTP id w21-20020a0565120b1500b00492ebc380d9mr20053862lfu.77.1662453473433;
        Tue, 06 Sep 2022 01:37:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u9-20020a056512094900b0048b143c09c2sm1586655lft.259.2022.09.06.01.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 01:37:53 -0700 (PDT)
Message-ID: <f653c9fe-08e8-1abd-d449-508755c29d4c@linaro.org>
Date:   Tue, 6 Sep 2022 10:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/5] dt-bindings: gpio: pca95xx: add entry for pcal6534
 and PI4IOE5V6534Q
Content-Language: en-US
To:     Martyn Welch <martyn.welch@collabora.co.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Martyn Welch <martyn.welch@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220906082820.4030401-1-martyn.welch@collabora.co.uk>
 <20220906082820.4030401-2-martyn.welch@collabora.co.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906082820.4030401-2-martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 06/09/2022 10:28, Martyn Welch wrote:
> From: Martyn Welch <martyn.welch@collabora.com>
> 
> The NXP PCAL6534 is a 34-bit I2C I/O expander similar to the PCAL6524. The
> Diodes PI4IOE5V6534Q is a functionally identical chip provided by Diodes
> Inc.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
