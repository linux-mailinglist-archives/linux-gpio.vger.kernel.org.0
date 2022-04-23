Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8D150C89D
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 11:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234472AbiDWJde (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Apr 2022 05:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234506AbiDWJdb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Apr 2022 05:33:31 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D952386FE
        for <linux-gpio@vger.kernel.org>; Sat, 23 Apr 2022 02:30:31 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id t25so13087630edt.9
        for <linux-gpio@vger.kernel.org>; Sat, 23 Apr 2022 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=nTcAsy4mzwYOzYnyy+Pdf5GpE9fpUTuHJcRHNUedXG4=;
        b=COZnpYZAB7aBIS9wzX/ddD29PCH1zlNNAj5hH8wOAoDFoSVOzm29I6cx/TLUjFAa85
         UugHvo3mZx1MXTbknoNisatHOhcNZqijjwBVlNThV+X8IevQmkbRMAlb1ZRKOuMI+e5c
         N2FhgvYCu/cJ1DNPR53ovouR3bM9+5fFbOSINBzxH88acOsT7Pfy9gtwsd8uXDrwWXah
         VbCedUab0cv8LhLgHFzZPupy/j+9DSIcMO7SBl/ZSFZpn6OictzbyYfFxMi7NUgGUQn/
         oROpYZkwkgcFz2J1KH7EzUtY8BwWdJFhSKkAj7PjatKcQCETsa+0Z4Wyno9p3pYl11KE
         E1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nTcAsy4mzwYOzYnyy+Pdf5GpE9fpUTuHJcRHNUedXG4=;
        b=dNV6TV/b425dNnCv23hwP/6hCvEJsh1NVN2hAQUJsNL+5NnjZjzJG76WJM2yT3642u
         XyfwugtMzOKj3yfdAezdnfzSeMRhELyI7b9+9BIsvD+P8ozHZw9HNkCqI2E4NvjIsnSD
         BY92v8F4JVP1udHVv0Hj7Pg0gKdkAoJisaevWnkNmzjkbIhXgT8JIOcKPPwSN74FPigf
         yamNCxI//KKL+EDan82bK5wDReX0WK1De6042Hgil735ppFCgWYVDfe48XzdekTPikPt
         iRcxnC9O/Fyf40kE8DXYtliVrx+JSy8AUak9xg/vfetxx2l33YKCIb/0zDTpw4Y9b1oS
         sYqA==
X-Gm-Message-State: AOAM531g5D8qGEERNbkZGGbAQV9Y5U+iFavxzn8N0IpqvpfUfUlXuaqJ
        OalDDMW8ZBXEUIhTq5AthbZ1xQ==
X-Google-Smtp-Source: ABdhPJwfiNmA1XC7Z7lDiA90dKU0QIG0pmXdVT6qFJUm3IvKZtebMLv4WOpL2QcX8HtU3avv/DUGNw==
X-Received: by 2002:a05:6402:2695:b0:425:c55e:b0ff with SMTP id w21-20020a056402269500b00425c55eb0ffmr5072132edd.358.1650706229802;
        Sat, 23 Apr 2022 02:30:29 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006d2a835ac33sm1497226ejc.197.2022.04.23.02.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 02:30:29 -0700 (PDT)
Message-ID: <b5a7dd3b-53b5-99c0-5107-6f9f4d62bc88@linaro.org>
Date:   Sat, 23 Apr 2022 11:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] pinctrl: nuvoton: Fix irq_of_parse_and_map() return
 value
Content-Language: en-US
To:     Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20220422105339.78810-1-krzysztof.kozlowski@linaro.org>
 <20220422105339.78810-2-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422105339.78810-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 22/04/2022 12:53, Krzysztof Kozlowski wrote:
> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
> 
> Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> index 3cf0f8a43c37..6271eac82fec 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -1898,7 +1898,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
>  		}
>  
>  		ret = irq_of_parse_and_map(np, 0);
> -		if (ret < 0) {
> +		if (!ret) {
>  			dev_err(dev, "No IRQ for GPIO bank %u\n", id);
>  			return ret;

This is wrong. I will send a v2.


Best regards,
Krzysztof
