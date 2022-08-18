Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270E1598047
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Aug 2022 10:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238265AbiHRIoJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Aug 2022 04:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbiHRIoI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2022 04:44:08 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34FD0167C3
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 01:44:07 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id o2so1274467lfb.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LHQRFS7WBtPZMCDbRYt6cKPTmBvwxyyzp3AuUxfMyzY=;
        b=NpW5oPG6Czmq6p1JYFNs/YD66fRPwYhkh0DjtVn6BYvsAvfcxe97dCLOItM0DVsOt0
         4akQVBjnkshsQVCoaCB/8aXbZaL+90WWVCpjKf9qz/6V/WqLOYR9VH0SmuYou8Rgb9Tj
         ofwxaBXa/QJx9RoY2IK2koc3yVZNzTYewGimhFuvmamK54nE22FrqBkZzzEW2burxJqh
         Y7U9CYCK8Rg4zWsJNFn7yfFEPmEmdHMEGMv+XSRupX9YInz++avjZD/lenI5FQPpJIWX
         PNkFFVq/ZmZBE9aboyPfyfFHa3012Ezn7hohsZ4EgveflwOcid3FZyGsOSXV1aKf6w4T
         mNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LHQRFS7WBtPZMCDbRYt6cKPTmBvwxyyzp3AuUxfMyzY=;
        b=69dg0JkLilGQIYPSSycTPyVCAtDFV7Upzl2Irg+Ie4qXTZOzL8H4KxK8byR6v3l0r0
         Y45L2i6pzsGEKhrDI5e4HCoTByJB75Hm4JHcT3j/l5t2VOD6kBbka+ku//yXPIhDBccf
         Kmspk8OPUKaolclJhqe2RTTDR92Sedlp/pu3m9FBnFUPZA6EHQ1dFZBGlhYfW4qvZgza
         DUBfncFjWitoLHJTNTrVT0sin4uLQgs2zi7fdRpGsqRWUt/lJREqPq20LAKMHRAHvuuX
         VIApldZpvc9r1+mjHq0Ds8Av71hROmio4hNGr4pqcGSFM13Of/S45cYp+pSArRJG8yVN
         W4Bw==
X-Gm-Message-State: ACgBeo0YpLAu7yuoxyp0mlPiCzl7IaMgZvGBpO04PfMlWLV28oHAcfUh
        fg1BhqiOHhcQRi5S7A9TWP3crQ==
X-Google-Smtp-Source: AA6agR76isMqCMBDRbbqXfqXJW6G7Wo+8DxIr21UWX3nad8+RsQnD7JtMufXaBo4DhMPM7Mm6EEOdw==
X-Received: by 2002:a05:6512:b03:b0:492:88d3:8369 with SMTP id w3-20020a0565120b0300b0049288d38369mr729254lfu.552.1660812245447;
        Thu, 18 Aug 2022 01:44:05 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id s20-20020a056512315400b0048a7c86f4e7sm134356lfi.291.2022.08.18.01.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 01:44:04 -0700 (PDT)
Message-ID: <107c5c93-ee6b-e464-1b74-55877068e788@linaro.org>
Date:   Thu, 18 Aug 2022 11:44:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: gpio: pca9570: Add compatible for
 slg7xl45106
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-gpio@vger.kernel.org
Cc:     git-dev@amd.com, mans0n@gorani.run, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, brgl@bgdev.pl,
        shubhrajyoti.datta@gmail.com
References: <20220817085550.18887-1-shubhrajyoti.datta@amd.com>
 <20220817085550.18887-2-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817085550.18887-2-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/08/2022 11:55, Shubhrajyoti Datta wrote:
> This patch adds compatible string for the SLG7XL45106,
> I2C GPO expander.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
> index 338c5312a106..503cfcb7f7c9 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
> @@ -13,6 +13,7 @@ properties:
>    compatible:
>      enum:
>        - nxp,pca9570
> +      - dlg,slg7xl45106

First, this does not match tree, please rebase on some new Linux kernel.
Second, put them in alphabetical order.
Third, these are different manufacturers. Why do you think devices are
compatible?

Best regards,
Krzysztof
