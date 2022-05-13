Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485CF525D39
	for <lists+linux-gpio@lfdr.de>; Fri, 13 May 2022 10:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378061AbiEMIUn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 May 2022 04:20:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378165AbiEMIUL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 May 2022 04:20:11 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3AE625AF8C
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 01:19:59 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id i19so14704536eja.11
        for <linux-gpio@vger.kernel.org>; Fri, 13 May 2022 01:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TXXtxk4/zRV/azu90zaoknCSwg8YNFPSO9Vmn6Wx84Q=;
        b=MNGRWTPIXS3qQdhzKLJqftqcmNJb3YAhzFu0XK9shDr0nVZW2KqLNz58KFpFr4nnSR
         xCWwaq9eJrxFuBDYw/9ctILoH9T29QogEmyhKhxU2v2pbKtphq8ZS0PvubxQBtyDoRWM
         iA65BP7n4WDjsTuxanI5NnVp5KGaNzh3A/PCrcTLFwO3uij1ITELlNx+3ja2gHSYqBSs
         +V3XaRmoZpJNZ9vSakl3Krp1q8o83lOp9e3hRaPrtefzfDpUNt/O8MfcpyA4d1vOy0ui
         HSVAR6GcKVVq8FEt0+WHrDmIqZhJ03tmNf7d3Be0nkugchg8AzjzgL5JiZOBHzSaRBGj
         qdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TXXtxk4/zRV/azu90zaoknCSwg8YNFPSO9Vmn6Wx84Q=;
        b=Ydz3Byt34PW6n19URBE3uFGKJwwrYYYHOjd7RS4zTqdpEMnru012RMpSR0E4yH9S1o
         AcE8SR4GjHC7kWwcWhlOLwJ0MZdSPZDBl1mUIWab/1ahPD22eNYo+raEVpJk32Mqg/aW
         yW8AQ02caqp7fHm7YMPjuY27EeEpDueuHP4+q3GG0XZ50R5Emq8/gcaveHtruiZcz78T
         jCHJqFIJw5BKWTsnXOLfV4jCyjiBimwQ79D79rZFXkt2ZnjmE3V1/gIlk8spfGB5OSHQ
         Al+XRcnol1GIh0KZx5SZJAvFXpTt/2n9IFrUyle3ZC4xSI003bXDID6qw5/2mJgf1BHZ
         yfqg==
X-Gm-Message-State: AOAM5309h4+3DFsrtXy+IGywlkeSbHp3aeE9qfJlZmzf2vjVnD7ubpgk
        3TfmnePiXYRPLPGvLgVUdyP+8w==
X-Google-Smtp-Source: ABdhPJxklCsXB9SJsl5gdraUIi2jz7rJ4AWpTj7K5UOqWzYgbXMjqn5QqncQCk3SD3iUdKyMUSM1UQ==
X-Received: by 2002:a17:907:1b10:b0:6e4:bac5:f080 with SMTP id mp16-20020a1709071b1000b006e4bac5f080mr3267436ejc.24.1652429998225;
        Fri, 13 May 2022 01:19:58 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y24-20020aa7ccd8000000b0042617ba6397sm655801edt.33.2022.05.13.01.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 01:19:57 -0700 (PDT)
Message-ID: <d2507298-00a6-a1cc-0302-f96597fb4127@linaro.org>
Date:   Fri, 13 May 2022 10:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm6125
 compatible
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220511220613.1015472-1-marijn.suijten@somainline.org>
 <20220511220613.1015472-3-marijn.suijten@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220511220613.1015472-3-marijn.suijten@somainline.org>
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

On 12/05/2022 00:06, Marijn Suijten wrote:
> The pm6125 comes with 9 GPIOs, without holes.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

It's the first version, how did the tag appear here?

> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
>  1 file changed, 2 insertions(+)


This will need fixups or rebasing on my sets of PMIC gpio schema cleanup:

https://lore.kernel.org/all/20220507194913.261121-1-krzysztof.kozlowski@linaro.org/
https://lore.kernel.org/all/20220508135932.132378-2-krzysztof.kozlowski@linaro.org/

Bjorn,
let us know preferred order (who should rebase on who).

Best regards,
Krzysztof
